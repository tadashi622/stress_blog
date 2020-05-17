## README
![health](https://user-images.githubusercontent.com/62418207/82160403-1455ac80-98d0-11ea-989c-a30d44e82dea.gif)


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