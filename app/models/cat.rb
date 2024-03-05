class Cat < ApplicationRecord
  # 名前: 必須
  validates :name, presence: true

  # 年齢: 必須 + integer + 0以上
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end