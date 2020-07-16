# Cooking Tweet

## \:spaghetti: 概要
・レシピの投稿
・レシピ検索
・コメント
・いいね

## \:spaghetti: 本番環境
https://kozinkaihatuapuri.herokuapp.com/

テスト用ユーザー
メールアドレス：test103@test.test
パスワード：naonaonao

## \:spaghetti: 制作背景
インスタグラムのようなイメージのレシピ投稿サイトを作りたかったため

## \:spaghetti: DEMO
https://gyazo.com/0f987fe907783664da405a66ecde88a8
https://gyazo.com/c442af39c8d8be76d7b118bed24751db
https://gyazo.com/1578ffc96976c805d1d6d9a96fae03b5

## \:spaghetti: 開発環境
・VSCode（Visual Studio Code）
・Ruby on Rails
・MySQL
・Github
・Heroku

## \:spaghetti:DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
### Association
- has_many :tweets
- has_many :comments

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|text|text||
|item|text||
|cook|text||
|url|string||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :likes

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|tweet_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :tweet
- belongs_to :user