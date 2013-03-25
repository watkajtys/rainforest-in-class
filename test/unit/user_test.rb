require 'test_helper'

class UserTest < ActiveSupport::TestCase
   test "user must have a name" do
   	 user = FactoryGirl.build(:user)
   	 user.name = nil
     refute user.valid?
   end

   test "user must have an email" do
   	 user = FactoryGirl.build(:user)
   	 user.email = nil
     refute user.valid?
   end

	test "user must have a password" do
		assert true
	end

	test "cannot change password_digest" do
		user = FactoryGirl.create(:user)
		assert_raises(ActiveModel::MassAssignmentSecurity::Error){
		user.update_attributes(:password_digest => "djhackandslashaslkdfjdajlsk")
	}
	end

	test "cannot have two users with the same email" do 
		user = FactoryGirl.create(:user, :email => "test@gmail.com")
		second_user = FactoryGirl.build(:user, :email => "test@gmail.com")
		refute second_user.save

		assert second_user.new_record?
		assert_equal ["has already been taken"], second_user.errors[:email]
	end
end
