--------------------------------------------------------------------------------
--! @brief Luaで素数に関する問題を扱います
--! @date  2016/06/11
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
--! @brief 素数か否かの判定を行います
--! @param[in] x  判定対象の整数
--! @param[in] ps 素数表
--! @return true  : xは素数
--!         false : xは合成数
--------------------------------------------------------------------------------
function is_prime(x, ps)
    for i = 1, #ps do
        local y = ps[i]
        if y * y > x then break end
        if x % y == 0 then return false end
    end
    return true
end


--------------------------------------------------------------------------------
--! @brief 素数表を生成する
--! @param[in] n [2, n]の区間に対して素数判定を行う
--! @return 素数表
--------------------------------------------------------------------------------
function create_prime_list(n)
    local ps = { 2 }
    for x = 3, n, 2 do
        if is_prime(x, ps) then table.insert(ps, x) end
    end
    return ps
end


--------------------------------------------------------------------------------
--! @brief エラトステネスの篩による素数表の生成
--! @param[in] n 要素数nの素数表を生成する
--------------------------------------------------------------------------------
function sieve_of_eratosthenes(n)

    ----------------------------------------------------------------------------
    --! @brief 整数列を返す
    --! @param xから始まる整数列となる
    ----------------------------------------------------------------------------
    local function integers(x)
        return coroutine.create(
            function()
                while true do
                    coroutine.yield(x)
                    x = x + 1
                end
        end)
    end


    ----------------------------------------------------------------------------
    --! @brief 述語とストリームを受け取り、そのストリームのうち、
    --!        述語を満たすものからなるストリームを返す
    --! @param[in] pred   述語関数
    --! @param     stream ストリーム
    ----------------------------------------------------------------------------
    local function filter(pred, stream)
        return coroutine.create(
            function()
                while true do
                    local b, m = coroutine.resume(stream)
                    if pred(m) then coroutine.yield(m) end
                end
        end)
    end


    ----------------------------------------------------------------------------
    --! @brief エラトステネスの篩により、素数表を印字します
    --! @param[in] x 要素数xの素数表を生成する
    ----------------------------------------------------------------------------
    local function sieve(x)
        local seq = integers(2)
        for i = 1, x do
            local b, v = coroutine.resume(seq)
            io.write(v)
            io.write(" ")
            seq = filter(function(x) return x % v ~= 0 end, seq)
        end
    end



    -- 篩を実行
    sieve(n)
end


