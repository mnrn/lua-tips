------------------------------------------------------------------------------------
--! @brief Luaにおけるオブジェクト指向プログラミング(OOP:
--!        Object Oriented Programming)を扱います
--!
--! @note  Luaにはクラスが存在しないため、クラスを独自に定義する必要がある
--!
--! @date  2016/06/12
------------------------------------------------------------------------------------



------------------------------------------------------------------------------------
--! @brief classの定義
--! @param[out] t テーブル
------------------------------------------------------------------------------------
function class(t)
    t       = t or { }  -- tがnilならば、tは空テーブルとなる
    t.index = t
    t.new   = new
    t.copy  = copy
    return t
end



------------------------------------------------------------------------------------
--! @brief newの定義
--! @param[in] class クラス
--! @param[in] init  初期化子リスト(テーブル)
------------------------------------------------------------------------------------
function new(class, init)
    init = init or { }             -- initがnilならば、initは空テーブルとなる
    return setmetatable(init, class)  -- クラスの概念を追加したメタテーブルを返す
end



------------------------------------------------------------------------------------
--! @brief classofの定義
--! @param[in] x 識別対象のインスタンス
--! @return xの型
------------------------------------------------------------------------------------
function classof(x)
    return type(x) == 'table' and getmetatable(x)
end



------------------------------------------------------------------------------------
--! @brief copyの定義
--! @param[in] obj コピー元のオブジェクト
--! @return objのクローン
------------------------------------------------------------------------------------
function copy(obj)
    local clone = classof(obj):new()
    for k, v in obj do clone[k] = v end
    return clone
end










