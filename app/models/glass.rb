class Glass < ApplicationRecord
    FRAMES = %w[aviatore arrotondati cat-eye farfalla quadrati rettangolari titanio]

    has_many :orders
    has_many :carts, through: :orders

    validates :sku, uniqueness: { case_sensitive: false }
    validates :sku, :brand, :price, :color, :frame, :material, :measure, presence: true
    validates :frame, inclusion: { in: Glass::FRAMES }
end
