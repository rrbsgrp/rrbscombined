class Ssrow < ActiveRecord::Base
  belongs_to :settlement_sale
  belongs_to :settlement_type
end
