# README



## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile  | text   | nill: false |
| position | text   | nill: false |
|occupation| text   | nill: false |


 
### Association

- has_many :prototypes
- has_many :comments

## prototype テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| title    | string | null: false |
| catch_copy| text  | null: false |
| concept  | text   | null: false |
| image    |ActiveStorage|
| user     |reference

### Association
- belongs_to :user
- has_many :comments

## comment テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| text     | text   | null: false |
| user     | reference |          |
| password | reference |          |

- belongs_to :prototype
- belongs_to :user