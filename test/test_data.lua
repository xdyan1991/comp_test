
local _M = {}

_M.pkg_channel_cvr = {
        test_352759_1 = 1, 
        test_2_515924_1 = 1, 
        test_2_961673_1 = 1, 
        test_1025918_1 = 1,
        test_1134581_1 = 1,
        filt_pkg_1 = 10,
        filt_pkg_2_1 = 1
    }


_M.filter_offers = {
        {
            id = "352759",
            price = 4.5,
            freq = 0,
            channel = "test",
            pkg = "filt_pkg",
            can_pre = 1
        },
        {
            id = "515924",
            price = 2.49,
            freq = 0,
            channel = "test_2",
            pkg = "filt_pkg",
            can_pre = 1
        },
        {
            id = "961673",
            price = 2.205,
            freq = 0,
            channel = "test_2",
            pkg = "filt_pkg",
            can_pre = 1
        },
        {
            id = "1025918",
            price = 3.15,
            freq = 0,
            channel = "test",
            pkg = "filt_pkg_2",
            can_pre = 1
        },
        {
            id = "1134581",
            price = 1.953,
            freq = 0,
            channel = "test",
            pkg = "filt_pkg",
            can_pre = 1
        }
    }

_M.req_fmt_outer = {
    ad_num = 2,
    user_id = "abcdefgh",
    platform = "iOS",
    country = "JP",
    offers = {}
}

--[[ { "hprice_random":967,"hcvr_random":998,"hcvr_ecpm5":999,"rpkg_ecpm1":983,"rpkg_random":938,"hprice_ecpm1":994,"hcvr_ecpm1":993,"rpkg_ecpm5":1000,"hprice_ecpm5":996}
]]

_M.user_id = {
    filter1 = '993',
    filter2 = '994',
    filter3 = '983',
    ecpm1 = '993',
    random = '998',
    ecpm5 = '999'
}

_M.rank_offers = {
        { id = "501173", price = 1.17, freq = 0, channel = "test", pkg = "978985106"},
        { id = "541342", price = 1.53, freq = 0, channel = "test", pkg = "988396858"},
        { id = "648382", price = 0.978, freq = 0, channel = "test", pkg = "978985106"},
        { id = "796822", price = 9.38, freq = 0, channel = "test", pkg = "1132425678"},
        { id = "1028711", price = 5, freq = 0, channel = "test", pkg = "1088150831"},
        { id = "1063435", price = 1.147, freq = 0, channel = "test", pkg = "978985106"},
        { id = "1069770", price = 1.04, freq = 0, channel = "test", pkg = "668533031"},
        { id = "1094817", price = 0.978, freq = 0, channel = "test", pkg = "978985106"},
        { id = "1097849", price = 0.1, freq = 0, channel = "test", pkg = "1088150831"},
        { id = "1107279", price = 1.3, freq = 0, channel = "test", pkg = "988396858"}
    }

_M.random_cvr = {
    random_501173_1 = 1,
    random_515924_1 = 1, 
    random_648382_1 = 1,
    random_796822_1 = 1,
    random_1028711_1 = 1,
    random_1063435_1 = 1,
    random_1094817_1 = 1,
    random_1097849_1 = 1,
    random_1107279_1 = 1
}

_M.ecpm_cvr = {
    ecpm_352759_1 = 1, 
    ecpm_501173_1 = 0.024, 
    ecpm_515924_1 = 1, 
    ecpm_541342_1 =  0.032, 
    ecpm_648382_1 = 0.023, 
    ecpm_796822_1 = 0.1,
    ecpm_1028711_1 = 1,
    ecpm_1063435_1 = 1,
    ecpm_1094817_1 = 1,
    ecpm_1097849_1 = 1,
    ecpm_1107279_1 = 1,
    default = 0.0013
}

_M.can_pre_cvr = {
    canp_352759_1 = 1,
    canp_515924_1 = 2,
    canp_1107279_1 = 3,
    canp_501173_1 = 4,
    canp_648382_1 = 5,
    canp_1063435_1 = 6,
    canp_1094817_1 = 7,
    canp_1028711_1 = 8,
    canp_1097849_1 = 9,
    canp_796822_1 = 10
}

_M.can_pre_offers = { 
    {id = "352759", price = 1.3, channel = "canp", freq = 0, pkg = "1231231", can_pre = 0},
    {id = "515924", price = 1.3, channel = "canp", freq = 0, pkg = "1231232", can_pre = 1},
    {id = "1107279",price = 1.3, channel = "canp", freq = 0, pkg = "1231233", can_pre = 0},
    {id = "501173", price = 1.17, channel = "canp", freq = 0, pkg = "1231234", can_pre = 1},
    {id = "648382", price = 0.978, channel = "canp", freq = 0, pkg = "1231235", can_pre = 0},
    {id = "1063435", price = 1.147, channel = "canp", freq = 0, pkg = "1231236", can_pre = 1},
    {id = "1094817", price = 0.978, channel = "canp", freq = 0, pkg = "1231237", can_pre = 0},
    {id = "1028711", price = 2, channel = "canp", freq = 0, pkg = "1231238", can_pre = 1},
    {id = "1097849", price = 0.1, channel = "canp", freq = 0, pkg = "1231239", can_pre = 0},
    {id = "796822", price = 0.38, channel = "canp", freq = 0, pkg = "1231230", can_pre = 1}
}

_M.can_pre_mvr = {
    canp_352759_0 = 10,
    canp_515924_0 = 9,
    canp_1107279_0 = 8,
    canp_501173_0 = 7,
    canp_648382_0 = 6,
    canp_1063435_0 = 5,
    canp_1094817_0 = 4,
    canp_1028711_0 = 3,
    canp_1097849_0 = 2,
    canp_796822_0 = 1
}


return setmetatable({}, {__index = _M})
