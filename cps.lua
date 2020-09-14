--------------------------------------------------------------------------------
--! @brief Luaにおける継続渡し(CPS: Coutinuation Passing Style)を扱います
--! @date  2016/06/11
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
--! @brief CPSを用いた階乗の計算
--! @param[in] n    n!を計算する
--! @param[in] cont 継続関数
--! @return n!
--------------------------------------------------------------------------------
function cps_factorial(n, cont)
    if n == 0 then return cont(1) else return cps_factorial(n - 1, function(x) return cont(x * n) end) end
end


--------------------------------------------------------------------------------
--! @brief CPSを用いたフィボナッチ数列の計算
--! @param[in] n    fib(n)を計算する
--! @param[in] cont 継続関数
--! @return fib(n)
--------------------------------------------------------------------------------
function cps_fib(n, cont)
    if n == 0 or n == 1 then
        return cont(1)
    else
        return cps_fib(n - 1, function(x) return cps_fib(n - 2, function(y) return cont(x + y) end) end)
    end
end




