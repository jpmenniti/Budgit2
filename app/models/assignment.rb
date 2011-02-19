class Assignment < ActiveRecord::Base
	attr_accessible :club_id, :user_id, :role_id
	
	#Relationships
	belongs_to :club
	belongs_to :role
	belongs_to :user
	
	#Validations
	validates_presence_of :club_id, :role_id, :user_id
	
	#Named Scopes
	#get all the assignments for a user
    named_scope :for_user, lambda { |user_id| { :conditions => ['user_id = ?', user_id] } }
    #get all assignments for a club_id
    named_scope :for_club, lambda { |club_id| { :conditions => ['club_id = ?', club_id] } }

	
end
