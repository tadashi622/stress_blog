## README
## アプリケーション概要
ブログサイトを作りました。
新規登録を行った後、ログインページに入ります。
新規投稿をクリックすると、ブログの投稿ができます。
投稿記事をクリックすると、編集・削除・更新ができます。（自身が投稿した記事のみ）

### おまけ機能
いいね機能を活用し、投稿者の体調がすぐにわかるようにしました。
検索機能やkaminari機能を追加して、すぐに投稿記事を見つけ出せるように工夫しました。

![health](https://user-images.githubusercontent.com/62418207/82160403-1455ac80-98d0-11ea-989c-a30d44e82dea.gif)

## 開発環境
- Ruby/Ruby on Rails/MySQL/Github/Visual Studio Code

## 開発期間と平均作業時間
- 開発期間：5日間
- 人数：1人
- 1日あたりの平均作業時間：10時間

## usersテーブル
|Column|Tyoe|Options|
|------|----|-------|
|users|integer|null: false, foreign_key: true|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
|image|string|null: false|
### Association
- devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
- mount_uploader :image
- has_many :posts
- has_many :likes, dependent: :destroy
- has_many :like_posts, through: :likes, source: :post

## postsテーブル
|Column|Tyoe|Options|
|------|----|-------|
|title|string||
|content|string||
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :likes, dependent: :destroy
- has_many :liking_users, through: :likes, source: :user

## likesテーブル(中間テーブル)
|Column|Tyoe|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|post|references|null: false, foreign_key: true|
### Association
-  belongs_to :user
-  belongs_to :post