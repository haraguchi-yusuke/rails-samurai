Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/nums", to: "calcs#new"
  post "/nums", to: "calcs#exec"
  post "/nums2", to: "calcs#exec2"#(exec=実行っていう意味) post=データーを送るっていう意味
#  post "/nums", to: "calcs#index"
end

            #   nums GET  /nums(.:format)                                                                          calcs#new
            #       POST /nums(.:format)                                                                          calcs#exec
            #       POST /nums(.:format)                                                                          calcs#index


#課題
# 数字をスペース2つ区切りで入力されたら、足し算した結果を画面に表示する




#●書式↓ get "/nums", to: "calcs#new"
#TTPメソッド URLパターン, to: "コントローラクラス名#メソッド名"

# nums→これは何でもいいが決まりはある、getでnumsというURLサイトにアクセスするときに使う
#calcs→計算って意味。これもなんでもいい。今回はcalcsというコントローラーを作ってnewで処理（アクセスしたら表示させる）
#new→新規登録画面
# ルーティングを書いたらターミナルで　rails routes と入力（アプリのフォルダに居る必要がある→ここならkakeibo）$ cd kakeiboで移動
#この作業は何で作るかを調べる為に使う
# たくさんでてきて、探せない場合は$ rails routes | grep calcs ※calでもcaでも検索ワード。最後が検索文字入力場所
# nums GET  /nums(.:format)  calcs#new
# ※検索したワードを見つけ,こういう風にでたら、対になってるのを使う

# ２．コントローラを用意する
# appファオルダ→controllersで新しいファイルを作る（ニューファイルで作成でOK）
# ファイル名はcalcs_controller.rbとなる。ルーティングの時に作ったコントローラーの処理名＿controller.rbにする