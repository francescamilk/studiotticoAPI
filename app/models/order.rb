class Order < ApplicationRecord
    belongs_to :glass
    belongs_to :cart
end
