class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :cost
  belongs_to :area
  belongs_to :send_day

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }

  validates :category_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :situation_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :cost_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :area_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :send_day_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
end
