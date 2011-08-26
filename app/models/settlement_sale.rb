class SettlementSale < ActiveRecord::Base
    has_one :employee
    has_many :ssrows
    belongs_to :employee
    
    accepts_nested_attributes_for :ssrows, :allow_destroy => true
end
