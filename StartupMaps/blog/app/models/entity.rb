class Entity < ActiveRecord::Base  
  self.inheritance_column=nil
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :services 
  has_many :startups
  has_many :investors
  has_many :entity_statuses
  has_many :entity_work_portfolio 
  has_many :entity_video_links
  has_many :entity_social_links
  has_many :entity_needs
  has_many :entity_jobs
  has_many :entity_goals
  has_many :entity_available_internships
  has_many :senders, :through => :group_invitation
  has_many :receivers, :through => :group_invitation
  has_many :senders, :through => :send_merge_request
  has_many :receivers, :through => :send_merge_request
  has_many :subscriber, :through => :subscrtipion
  has_many :subscribee, :through => :subscrtipion
  has_many :receivers, :through => :message
  has_many :messages
  TYPES = %w[Startup Investor Service]
  SECTORS = %w[Agriculture Manufacturing Trading Clothes Telecommunications]
end

