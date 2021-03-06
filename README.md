# Favo Map
きっとみつかる、あなたの行きたい Favo Map

## URL
「Favo Map」のリンク先：　https://favomap.herokuapp.com/  <br>
「Favo Map」の機能紹介ビデオ：　https://www.youtube.com/watch?v=nY29_bdbhiA&feature=emb_title 

## ゲストログイン機能
#### 是非ゲストログインをして、[Favo Map](https://favomap.herokuapp.com/)を体験してみてください！
<img src="https://user-images.githubusercontent.com/65812742/89774024-ff3f9100-db3f-11ea-9727-bbd94a4dc53c.gif" height="500">

## アプリ作成経緯
- google mapのお気に入り登録機能は写真が投稿できず地点特定が難しい
- google mapのお気に入り登録をしたところで、近い場所を簡単に特定するのは難しい
- Webサービスの様々な地点おすすめ機能は、その時に行きたいと思える場所を取得する確率が低い

## 製作背景
- 行きたいと思った地点をお気に入り登録を事前に行い、その地点からのみおすすめ地点を取得する機能  
&rarr;確実にユーザーにとって「いきたい！」地点が見つかるのでないか？
- おすすめ地点の条件を「距離が近い」地点とする  
&rarr;行きたい！かつアクセスの良い地点が取得できるのではないか？

## 詳細 
### 1.特定の地点からのおすすめ地点検索
#### 1-1 選択地点を除く、お気に入り登録済み地点を距離が近いもの３点を取得
#### 1-2 おすすめ地点までの「所要時間」・「移動距離」を表示
<img src="https://user-images.githubusercontent.com/65812742/89796330-7be46680-db64-11ea-91d5-62807ea30a5c.gif" height="500" width="600">

### 2.現在地からのおすすめ地点検索
#### 2-1 現在地から、お気に入り登録済み地点を距離が近いもの３点を取得
#### 2-2 おすすめ地点までの「所要時間」・「移動距離」を表示
<img src="https://user-images.githubusercontent.com/65812742/89797150-89e6b700-db65-11ea-99f5-ca1d7ce19c55.gif" height="500" width="600">

### 3.お気に入り地点を登録
#### Name欄に名称を入力すれば、緯度経度を自動で取得する仕様（名称では地点取得できない場合は住所を入力）
<img src="https://user-images.githubusercontent.com/65812742/89797839-64a67880-db66-11ea-93ac-7183132a2332.gif" height="500" width="600">

### 4.登録済のお気に入り地点の削除
#### カーソルを写真に載せると「ゴミ箱マーク」が表示されるのでクリック
<img src="https://user-images.githubusercontent.com/65812742/89798499-370dff00-db67-11ea-9acf-87a0e958f570.gif" height="500" width="600">

### 5.登録済のお気に入り地点の編集
#### カーソルを編集したい地点情報に載せると「編集マーク」が表示されるのでクリック
<img src="https://user-images.githubusercontent.com/65812742/89799186-14301a80-db68-11ea-96f4-facbfc7019a9.gif" height="500" width="600">

### 6.登録済のお気に入り地点の絞り込み
#### 6-1 キーワードを入力して「search」をクリックと地点絞り込みが可能
#### 6-2 「clear」をクリックすると絞り込み状態を解除
<img src="https://user-images.githubusercontent.com/65812742/89800244-76d5e600-db69-11ea-853d-1e4fc76b76b7.gif" height="500" width="600">

## 工夫したポイント
- 名前・住所の入力からユーザーの操作なしで緯度経度の取得をGeocorder APIを使用して実装
- Distance Matrix APIを使用しておすすめ地点までの「所要時間」・「移動距離」の取得を実装
- Directions APIを使用して、徒歩でのルートの取得を実装
- MVCとjavascriptでの変数定義・条件分岐による、距離が近い地点３点の絞り込みの実装

## 開発環境・言語
- Ruby on Rails 
- google maps api
- aws
- javascript
- ruby
- haml
- scss
- heroku（デプロイ環境）

