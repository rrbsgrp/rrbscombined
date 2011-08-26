
class Categorysale < ActiveRecord::Base
  has_one :category
  has_one :employee

end
