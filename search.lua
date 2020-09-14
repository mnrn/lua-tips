--------------------------------------------------------------------------------
--! @brief 探索の実装
--! @date  2016/06/11
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
--! @brief 線形探索を行います
--! @param[in] lst 探索対象の配列
--! @param[in] key 探しているキー
--! @return キーを持つ配列の添字、存在しなければ0
--------------------------------------------------------------------------------
function linear_search(lst, key)
    for i = 1, #lst do
        if lst[i] == key then return i end
    end
    return 0
end


--------------------------------------------------------------------------------
--! @brief 二分探索を行います
--! @param[in] lst 探索対象の配列
--! @param[in] key 探したいキー
--! @return true  : 見つけた
--!         false : 見つからなかった
--------------------------------------------------------------------------------
function binary_search(lst, key)
    local lo, hi = 1, #lst

    while lo <= hi do
        local mi = lo + math.floor((hi - lo) / 2)
        if lst[mi] == key then
            return true
        elseif lst[mi] < key then
            lo = mi + 1
        else
            hi = mi - 1
        end
    end

    return false
end


--------------------------------------------------------------------------------
--! @brief 二分探索を行い、(先頭に近い)配列の添字を返します
--! @param[in] lst 探索対象の配列
--! @param[in] key 探したいキー
--! @return    見つかった場合      : 要素列の先頭添字
--!            見つからなかった場合 : keyより大きな要素の先頭添字
--------------------------------------------------------------------------------
function lower_bound(lst, key)
    local lo, hi = 1, #lst

    while lo < hi do
        local mi = lo + math.floor((hi - lo) / 2)
        if (lst[mi] < key) then
            lo = mi + 1
        else
            hi = mi
        end
    end
    return lo
end


--------------------------------------------------------------------------------
--! @brief 二分探索を行い、(末尾に近い)配列の添字を返します
--! @param[in] lst 探索対象の配列
--! @param[in] key 探したいキー
--! @return    見つかった場合      : 見つかった要素列の末尾「の次」を指す添字
--!            見つからなかった場合 : keyより大きな要素の先頭添字
--------------------------------------------------------------------------------
function upper_bound(lst, key)
    local lo, hi = 1, #lst

    while lo < hi do
        local mi = lo + math.floor((hi - lo) / 2)
        if (lst[mi] <= key) then
            lo = mi + 1
        else
            hi = mi
        end
    end
    return lo
end


