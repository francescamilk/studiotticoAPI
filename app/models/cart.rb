class Cart < ApplicationRecord
    has_many :orders
    has_many :glasses, through: :orders
    
    validates :address, :cap, :city, :total_price, presence: true
    validates :name, :surname, presence: true, if: :is_private?
    validates :partita_iva, :business_name, presence: true, if: :is_business?

    private

    def is_private?
        return !business
    end

    def is_business?
        return business
    end
end
