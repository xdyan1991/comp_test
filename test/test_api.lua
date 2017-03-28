local iresty_test = require 'resty.iresty_test'
local tb = iresty_test.new({unit_name="test_adrank"})
local cjson = require 'cjson'
local test_data = require 'test.test_data'

local encode = cjson.encode
local decode = cjson.decode

function tb:init(...)
    self:log("init complete")
end


-- test for competitor api, check if competitor works
function tb:test_00001(...)
    self:log('test competitor api, check if competitor works')
    local resp = ngx.location.capture('/proxy/competitor', {
        method = ngx.HTTP_POST,
        body = '{"country" : "IN"}'
    })
    resp = decode(resp.body)
    expected = "ok"
    if expected ~= resp.errmsg then
        error("test error, expect: " ..  expected .. ", get: " .. resp.errmsg)
    end
end

tb:run()
