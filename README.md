## テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted-password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | string | null: false |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| text       | text       | null: false                    |
| category   | text       | null: false                    |
| situation  | text       | null: false                    |
| cost       | text       | null: false                    |
| area       | text       | null: false                    |
| days       | string     | null: false                    |
| price      | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :purchases

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | string     | null: false                    |
| deadline      | string     | null: false                    |
| code          | string     | null: false                    |
| post_code     | string     | null: false                    |
| prefecture    | text       | null: false                    |
| city          | text       | null: false                    |
| address       | text       | null: false                    |
| building_name | text       | null: false                    |
| phone_number  | text       | null: false                    |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :users
- belongs_to :items
