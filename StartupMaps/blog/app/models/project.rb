class Project < ActiveRecord::Base
  
  has_many :project_requirements
  has_many :project_targets
  has_many :startups
  has_many :project_requirements, :dependent => :destroy
  has_many :project_targets, :dependent => :destroy
  belongs_to :startup

  validates_presence_of :name, :description, :category
  validates_length_of :name, :within => 2 .. 150
  validates_uniqueness_of :name, :message => "You have a project with the same name"

  # Cascade deletion to all associations
  accepts_nested_attributes_for :project_targets, :allow_destroy => true
  accepts_nested_attributes_for :project_requirements, :allow_destroy => true
end
