--------------------------------------------------------------------------------
--! @brief Luaにおけるコルーチン(Coroutine)を扱います
--! @date  2016/06/11
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
--! @brief 高階関数からジェネレータを生成
--! @param[in] fn  高階関数
--! @param     ... fnに渡す引数
--------------------------------------------------------------------------------
function make_generator(fn, ...)
    local args = { ... }
    return coroutine.create(
        function()
            fn(function(x) coroutine.yield(x) end, unpack(args))
            return false
    end)
end






