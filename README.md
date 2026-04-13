# テーブル設計

## users テーブル

| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false              |
| email               | string | null: false unique: true |
| password            | string | null: false              |
| encrypted_password  | string | null: false              |
| last_name           | string | null: false              |
| first_name          | string | null: false              |
| last_name_katakana  | string | null: false              |
| first_name_katakana | string | null: false              |
| birth_date          | date   | null: false              |

### Associations
has_many :items
has_many :orders

## items テーブル 

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| price           | integer    | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| shipping_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Associations
belongs_to :user
has_one :order
has_one_attached :image 
<!-- ActiveStorageで画像を管理します -->


## orders テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Associations
belongs_to :user
belongs_to :item 
<!-- 一点ものなので必要ならunique:trueつけます -->
has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Associations
belongs_to :order
