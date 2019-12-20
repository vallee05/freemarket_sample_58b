# README

## FreeMarketSample DB設定

### userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|first_name|string|null: false|
|first_furigana|string|null: false|
|family_name|string|null: false|
|family_furigana|string|null: false|
|birthday|date|null: false|
|telephone|integer|null: false|
|sns_credential|string|unique: true|
|profile|text||
|sales|bigint|null: false|
|payment_id|references|null: false, foreign_key: true|
|bank_id|references|foreign_key: true|
|address_id|references|foreign_key: true|
|shipping_address_id|references|null: false, foreign_key: true|

#### Association
- has many items, dependent: :destroy
- has many trades, dependent: :destroy
- has many points, dependent: :destroy
- has many notices, dependent: :destroy
- has many todos, dependent: :destroy
- has many iines, dependent: :destroy
- has many comments, dependent: :destroy  
- has many ngs
- has many payments, dependent: :destroy
- has many banks, dependent: :destroy
- has many addresses, dependent: :destroy
- has many shipping_addresses, dependent: :destroy

#### index

### addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string||
|prefecture|string||
|city|string||
|address|integer||
|building_name|string||

#### Association
- belongs to user

#### index

### shipping_addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|integer|null: false|
|building_name|string||

#### Association
- belongs to user

#### index

### paymentテーブル
|Column|Type|Options|
|------|----|-------|
|credit_card_number|integer|null: false|
|expiration_date|date|null: false|
|security_code|integer|null: false|

#### Association
- belongs to user

#### index

### bankテーブル
|Column|Type|Options|
|------|----|-------|
|bank_name|string|null: false|
|account_type|string|null: false|
|branch_code|integer|null: false|
|account_number|integer|null: false|
|first_name|string|null: false|
|family_name|string|null: false|

#### Association
- belongs to user

#### index

### pointテーブル
|Column|Type|Options|
|------|----|-------|
|amount|integer|null: false|
|date|datetime|null: false|
|user_id|references|null: false, foreign_key: true|

#### Association
- belongs to user

#### index

### noticeテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|null: false|
|title|string|null: false|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|

#### Association
- belongs to user

#### index

### todoテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|null: false|
|title|string|null: false|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|trade_id|references|null: false, foreign_key: true|

#### Association
- belongs to user
- belongs to trade

#### index




### iineテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

#### Association
- belongs to user
- belongs to item

#### index

### itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, limit: 40|
|price|intger|null: false|
|description|text|null: false, limit: 1000|
|size_id|integer|null: false, foreign_key: true|
|condition_id|integer|null: false, foreign_key: true|
|shipping_charge_id|integer|null: false, foreign_key: true|
|shipping_method_id|integer|null: false, foreign_key: true|
|delivery_area_id|integer|null: false, foreign_key: true|
|status_id|references|null: false, foreign_key: true|
|estimated_shipping_date_id|integer|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

#### Association
- has many iines, dependent: :destroy
- has many comments, dependent: :destroy
- has many ngs
- has_many categories, dependent: :destroy
- has_many brands, dependent: :destroy
- has_many images, dependent: :destroy
- has_many sizes, dependent: :destroy
- has_many conditions, dependent: :destroy
- has_many shipping_charges, dependent: :destroy
- has_many shipping_methods, dependent: :destroy
- has_many shipping_methods, dependent: :destroy
- has_many statuses, dependent: :destroy
- belings to user
- belongs to trade

#### index
- add_index :items, :price

#### imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false, limit: 10|
|item_id|references|null: false, foreign_key: true|

#### Association
- belongs to item

#### index

#### sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|size_id|integer|null: false, foreign_key: true|

#### Association
- belongs to item

#### index
- add_index :size, :size


#### conditionテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|
|condition_id|integer|null: false, foreign_key: true|

#### Association
- belongs to item

#### index
- add_index :condition, :condition


#### shipping_chargeテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_charge|string|null: false|
|shipping_charge_id|integer|null: false, foreign_key: true|

#### Association
- belongs to item

#### index
- add_index :shipping_charge, :shipping_charge


#### shipping_methodテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_method|string|null: false|
|shipping_method_id|integer|null: false, foreign_key: true|

#### Association
- belongs to item

#### index
- add_index :shipping_method, :shipping_method


#### delivery_areaテーブル
|Column|Type|Options|
|------|----|-------|
|delivery_area|string|null: false|
|delivery_area_id|integer|null: false, foreign_key: true|

#### Association
- belongs to item

#### index
- add_index :delivery_area, :delivery_area


#### estimated_shipping_dateテーブル
|Column|Type|Options|
|------|----|-------|
|estimated_shipping_date|string|null: false|
|estimated_shipping_date_id|integer|null: false, foreign_key: true|

#### Association
- belongs to item

#### index
- add_index :estimated_shipping_date, :estimated_shipping_date


#### statusテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|
|status_id|references|null: false, foreign_key: true|

#### Association
- belongs to item

#### index
- add_index :status, :status


### commentテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|null: false|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

#### Association
- belongs to user
- belongs to item

#### index

### brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|null: false, foreign_key: true|

#### Association
- belongs to item

#### index
- add_index :brand, :name

### categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|tree_parent|integer||


#### Association
- belongs to item

#### index
- add_index :category, :name


### tradeテーブル
|Column|Type|Options|
|------|----|-------|
|transaction_date|datetime|null: false|
|trading_date|datetime||
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

#### Association
- belongs to user
- belongs to item

#### index

### trade_commentテーブル
|Column|Type|Options|
|------|----|-------|
|date|datetime|null: false|
|text|text|null: false|
|grade|string|null: false|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

#### Association
- belongs to user
- belongs to item

#### index



