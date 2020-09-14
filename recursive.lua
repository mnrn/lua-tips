--------------------------------------------------------------------------------
--! @brief Luaにおける再帰定義を扱います
--! @date  2016/06/11
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
--! @brief 再帰を用いて階乗の計算を行う
--! @param[in] n n!を計算する
--! @return n!
--------------------------------------------------------------------------------
function recursive_factorial(n)
    -- NOTE: Luaにおける三項演算子は A and B or Cで表現される
    return n == 0 and 1 or n * recursive_factorial(n - 1)
end


--------------------------------------------------------------------------------
--! @brief 末尾再帰を用いて階乗の計算を行う
--! @param[in] n   n!を計算する
--! @param[in] acc アキュムレータ
--! @return n!
--------------------------------------------------------------------------------
function tail_recursive_factorial(n, acc)
    return n == 0 and acc or tail_recursive_factorial(n - 1, acc * n)
end


--------------------------------------------------------------------------------
--! @brief 再帰を用いてフィボナッチ数列の計算を行う
--! @param[in] n fib(n)を計算する
--! @return fib(n)
--------------------------------------------------------------------------------
function recursive_fib(n)
    return (n == 0 or n == 1) and 1 or recursive_fib(n - 1) + recursive_fib(n - 2)
end


--------------------------------------------------------------------------------
--! @brief 末尾再帰を用いてフィボナッチ数列の計算を行う
--! @param[in] n    fib(n)を計算する
--! @param[in] acc1 アキュムレータその1
--! @param[in] acc2 アキュムレータその2
--! @return fib(n)
--------------------------------------------------------------------------------
function tail_recursive_fib(n, acc1, acc2)
    return n < 1 and acc1 or tail_recursive_fib(n - 1, acc1 + acc2, acc1)
end


--------------------------------------------------------------------------------
--! @brief ループを用いてフィボナッチ数列の計算を行う
--! @param[inout] n fib(n)を計算する
--! @return fib(n)
--------------------------------------------------------------------------------
function iterative_fib(n)
    local acc1, acc2 = 1, 0
    while n > 0 do
        local tmp = acc1
        acc1 = acc1 + acc2
        acc2 = tmp
        n = n - 1
    end
    return acc1
end











