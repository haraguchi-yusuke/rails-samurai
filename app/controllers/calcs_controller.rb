class CalcsController < ApplicationController
    
    def new
    
    end
    
    def exec
     input = params[:input]
     @result = input.split(" ").map(&:to_i).sum
     render "new"
    end
    
    def exec2
     input = params[:input]
     @result = input.split(" ").map(&:to_i)
     @result = @result[0] * @result[1] 
     render "new"
    end
    
end


#  ２．コントローラを用意する
# appフォルダ→controllersで新しいファイルを作る（ニューファイルで作成でOK）
# ファイル名はcalcs_controller.rbとなる。ルーティングの時に作ったコントローラーの処理名＿controller.rbにする
# クラスの作成を行う
# class CalcsController < ApplicationController#ここは固定文言　クラス名の頭文字は大文字にする
    
#     def new#defは固定文言であとはルーティングで設定したのを入力
#     end
# end#固定文言

# ３．ビューファイルの作成（viewsファイルにhtmlファイルを作る）
# appフォルダ→viewsフォルダ(※フォルダに作る、名前はルーティングでコントローラに使った名前今回は calcs というフォルダ）
# →そのフォルダの中にファイル作成→ファイルの名はにnew.html.erbというファイルを作る（newはルーティングで作った処理名、.html.erbは固定文言）
# erb　は　embedded rubyの略（embeddedは埋め込みという意味)→htmlファイルにrubyを埋め込みますよっていうファイル
# 例　views→calcs（フォルダ）→new.html.erb(ファイル名)となる

# 6、コントローラーで入力
# getsとかpで入力を取って表示すると同じようなのをする。入力されたものを取って表示する作業をする
# ここではgetsがつかえない。その代わりにparamsが使える。paramsで受け取ることができる。
# 受け取るには名前が必要→それは検証でみるとわかる（viewの検証ツール）で
# inputに対してnameというのがついている。送られてくる名前を表している。
# なのでinputとなる。下記が例(classの間に入れる)
#     def exec #execっていう名前にしたからexec
#      input = params[:input]
#      @result = input
#      p input #変数確認したい時は、pで表示されるとターミナルに入力したのが表示される
#      end
# execだけど、exec.htmlではなく、またnewを表示したいのでrenderを使う
# 下記を追加

#      def exec #execっていう名前にしたからexec
#      input = params[:input]
#      @result = input
#      p input #変数確認したい時は、pで表示されるとターミナルに入力したのが表示される
#      render "new"
#      end

# 7。モデルを作る（データーベースを作る）
# 消費税データー　5％　8％　10％
# これをターミナルに入力↓
# rails g model Tax rate:integer name:string
# g はジェネレート
# model
# rate:integer→カラムの名前とカラムの型（データの種類、文字なのか整数なのか）
#ターミナルに入力すると下記のようにでて、上3つが重要（ファイルを作ってくれている）
# create    db/migrate/20210824205736_create_taxes.rb　⇨ｄｂのファイルに入っている　いわいゆる計画書
# create    app/models/tax.rb　⇨appのmodelsにある（taxクラスってのができている）
# invoke    test_unit
# 上記の計画書を確認したら、$ rails db:migrate をターミナルで実行する
# これでデーターベースが作られる
# 次に$ rails c　を起動する
# 次にターミナルに Tax.new　と入力　クラスに対して使う
# 次にcreteというメソッドを使う（クラス）これは何かを作ってインスタンス化して尚且つデーターベースに保存する。モデルにしかできない
# ターミナルにTax.create(rate: 5, name: "5%")　※（）の中身は何を作るか　名前が5％　レートが5っていう意味
# 実行すると、INSERTから始まるのが実際に実行されたSQL分（SQL文とはデーターベースに対して何か命令をしてもらうための言語）
# rubyの場合　rubyの文法から自動的にSQL文を作って、それを実行してくれる
# 同様にTax.create(rate: 5, name: "5%") Tax.create(rate: 8, name: "8%")　Tax.create(rate: 10, name: "10%")を作る
# 次に、登録されたデーターをどうやってつかうのか？→Tax.all　※　.all　というメソッドがある
# →これはデーターを全部とってくる　Tax.all
# 何かを指定してデータを取ってくる場合→　.find　を使う ※find＝見つけるっていう意味
# 何を持って見つけるかというと　id のカラムを使って見つける、モデルの中で絶対かぶらない番号
# Tax.find(2)　をターミナルで実行（idが２のやつを見つける）

# DB関連で使えるメソッド（参考資料）ホントはもっとたくさんあるけど主流なもの
# 検索系メソッド
# Product.all #DBに登録されているもの全て
# Product.find # idで検索 Product.find(1)
# Product.find_by # id以外のカラムで検索(結果は1件のみ)　.find_by(name: 10%)みたいに使うと１個だけとってくる
# Product.where # id以外のカラムで検索(結果は複数)

# 保存系
# クラスメソッド
# Product.create # 新規データ作成 Product.create(price: 100, status: "pending", name: "sample")

# インスタンスメソッド
# product.save # インスタンスをDBへ保存(新規でもOK)
# product.update # 更新 product.update(price: 200)

# 削除系
# クラスメソッド
# Product.destroy_all # 全て削除

# -- 検索してから削除
# Product.where(status: "pending").destroy_all # ステータスがペンディングのものだけ削除

# インスタンスメソッド
# product.destroy # インスタンスを削除
