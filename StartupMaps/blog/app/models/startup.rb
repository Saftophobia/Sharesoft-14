class Startup < ActiveRecord::Base
	belongs_to :Entity
	has_many :startup_resources
end
