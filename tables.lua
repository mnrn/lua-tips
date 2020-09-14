--------------------------------------------------------------------------------
--! @brief 読み取り専用テーブル
--! @date  2020/09/14
--------------------------------------------------------------------------------

function read_only (t)
    local proxy = {}
    local mt = {
        __index = t,
        __newindex = function (t, k, v)
            error("attempt to update a read-only table", 2)
        end
    }
    setmetatable(proxy, mt)
    return proxy
end
