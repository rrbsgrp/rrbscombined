class Employee < ActiveRecord::Base
  belongs_to :categorysale
  belongs_to :branch
  has_many :settlement_sales
end
