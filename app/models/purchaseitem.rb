class Purchaseitem < ActiveRecord::Base
	belongs_to :inventoryitem
	
	def self.search(from,to)
		if from
			find(:all, :conditions => ['purchase_date LIKE ? or purchase_date LIKE?', "%#{from}%", "%#{to}%"])
		else
			find(:all)
		end
	end
	
end
