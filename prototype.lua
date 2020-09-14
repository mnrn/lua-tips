------------------------------------------------------------------------------------
--! @brief Luaにおけるオブジェクト指向プログラミング(OOP:
--!        Object Oriented Programming)を扱います
--!
--! @note  Luaにはクラスが存在しないため、プロトタイプ型のオブジェクト指向をここでは採用する
--!        プロトタイプ型では、元となるインスタンスをコピーすることで新しいインスタンスを生成する
--!
--! @date  2016/06/12
------------------------------------------------------------------------------------




--! --------------------------------------------------------------------------------
--! @brief Fooプロトタイプの定義
--! --------------------------------------------------------------------------------
Foo = { }



------------------------------------------------------------------------------------
--! @brief メソッド定義
--! @note  Foo.get_a(self)はFoo:get_a()と書くことができることに注意
------------------------------------------------------------------------------------
function Foo:get_a() return self.a end  --! aゲッター
function Foo:get_b() return self.b end  --! bゲッター
function Foo:set_a(x) self.a = x end    --! aセッター
function Foo:set_b(x) self.b = x end    --! bセッター



--! --------------------------------------------------------------------------------
--! @brief コンストラクタの定義
--! @note  Luaでは、テーブルからフィールドを参照する際、そのテーブルに該当するフィールドが
--!        見つからないとエラーになるが、そのテーブルにメタテーブルが設定されていて、かつ
--!        そのメタテーブルの__indexフィールドにテーブルがセットされている場合、そのテーブル
--!        からフィールドを探索する
--! --------------------------------------------------------------------------------
function Foo.new(a, b)
    local obj = { a = a, b = b }
    return setmetatable(obj, { __index = Foo })  -- メタテーブルを設定
end



------------------------------------------------------------------------------------
--! @brief Fooクラス変数
------------------------------------------------------------------------------------
Foo.bar = 10



------------------------------------------------------------------------------------
--! @brief Fooクラスメソッド
------------------------------------------------------------------------------------
function Foo.show() return Foo.bar end
function Foo.update(x) Foo.bar = x end



--! --------------------------------------------------------------------------------
--! @brief Fooを継承したBarのプロトタイプ定義
--! --------------------------------------------------------------------------------
Bar = { }
setmetatable(Bar, { __index = Foo })


function Bar.new()
    local obj = Foo.new()
    obj.c = 20
    return setmetatable(obj, { __index = Bar })
end


function Bar:get_c() return self.c end
function Bar:set_c(x) self.c = x end




