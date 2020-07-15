# Cooking Tweet

## \:egg: 概要
・レシピの投稿
・レシピ検索
・コメント
・いいね

## \:egg: 本番環境
https://kozinkaihatuapuri.herokuapp.com/

## \:egg: 制作背景
インスタグラムのようなイメージのレシピ投稿サイトを作りたかったため

## \:egg:DEMO
https://gyazo.com/0f987fe907783664da405a66ecde88a8

## \:egg:DB設計

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