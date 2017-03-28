


local lfs = require 'lfs'
comp_file_table = {}
local counter = -1
local update_freq = 10
local last_folder = 0
local require_table = {}
local root_folder = '/Users/xdyan/competitor_user_id/'

local function record_req_local()
    local folder_list = ''
    local req_list = ''
    for file in lfs.dir(root_folder) do
        folder_list = folder_list .. ' ' .. file
    end
    for k, v in pairs(require_table) do
        req_list = req_list .. ',' .. k .. ':' .. v
    end
    ngx.log(ngx.ERR, folder_list .. ';' .. req_list)
end

local function update_file_table_local(n)
    local comp_file_table_temp = {}
    for file in lfs.dir(root_folder .. '/' .. n) do
        if string.find(file, '.') >= 0 then
            comp_file_table_temp[file] = io.open(root_folder .. '/' .. n .. '/' .. file, "r")
        end
    end
    comp_file_table = comp_file_table_temp
    require_table = {}
end

function update_file_table()
    if counter >= 1 and counter < update_freq then
        counter = counter + 1
        return
    else
        counter = 1
    end
    local folder_counter = 0
    for file in lfs.dir(root_folder) do
        local n = tonumber(file)
        if n then
            folder_counter = folder_counter + 1
        end
    end
    if folder_counter ~= 1 then
        return
    end

    for file in lfs.dir(root_folder) do
        local n = tonumber(file)
        if n and n > last_folder then
            update_file_table_local(n)
            last_folder = n
        end
    end

    record_req_local()
end

function record_req(country)
    if not require_table[country] then
        require_table[country] = 0
    end
    require_table[country] = require_table[country] + 1
end

