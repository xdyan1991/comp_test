
--[[
  request format:
    {
       "country" : "CN"
    }

  return: 
    {
        "errmsg": "ok",
        "user_id": "1018acad7dabd3b8"
        "pkg": "com.bitmango.go.lollipopmatch3"
        "method": "com1"
    }
]]


local cjson = require 'cjson'

local encode = cjson.encode
local decode = cjson.decode

local function exit_err(err)
    ngx.print(encode{
        ['errmsg'] = err,
    })
    ngx.exit(ngx.HTTP_OK)
end

local function get_body()
    -- update data are usually large and should be cached
    local data = ngx.req.get_body_file() 
    
    if not data then
        -- try to get from buffer
        data = ngx.req.get_body_data()
        if not data then
            exit_err("no data")
        end
    else
        -- read files
        local ok, fn = pcall(io.input, data)
        if not ok then
            exit_err("tmp file error")
        end
        
        data = fn:read("*all")
        fn:close()
    end

    return data
end

local function check_req(req)
    -- check and record
    if not req.country then 
        exit_err("require country")
    end
    record_req(req.country)
end


if ngx.req.get_method() ~= 'POST' then
    ngx.exit(ngx.HTTP_NOT_ALLOWED)
end

ngx.req.read_body()
local body = get_body()
if math.random(1,10000) <= 5 then
    ngx.log(ngx.ERR, "get request ..", body)
end

local ok, req = pcall(decode, body)
if not ok then
    exit_err("post body json format error")
end

check_req(req)
update_file_table()
local file = comp_file_table[req.country]
if not file then
    exit_err("country not exist " .. req.country)
end

local line = file:read()
--when EOF seek to the first_line
if not line then
    file:seek('set')
    line = file:read()
end
if not line then
    ngx.log(ngx.ERR, "EOF " .. req.country)
    exit_err("EOF")
end

-- format: user_id /t pkg_name
local text = {}
for w in string.gmatch(line, "%S+") do
    table.insert(text,w)
end

if not text[1] or not text[2] or text[1] == '' or text[2] == '' then
    exit_err("wrong data size")
end

local method = 'com0'
if text[3] and text[3] ~= '' then
    method = text[3]
end

local resp = {
    errmsg = 'ok',
    user_id = text[1],
    pkg= text[2],
    method= method
}

ngx.print(encode(resp))

