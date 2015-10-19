require_relative "community_service.rb"
require "minitest/autorun"

class Main_test < Minitest::Test

	def test_for_hours_remaining
		assert_equal(18.75, hours_remaining(["1000000","Wbg","111-111","","75","56.25","9.16.15","","","","","","","","","Taylor",""]))
		assert_equal(0.00, hours_remaining(["1000000","Wbg","111-111","","75","75","9.16.15","","","","","","","","","Taylor",""]))
		assert_equal(75, hours_remaining(["1000000","Wbg","111-111","","75","ten","9.16.15","","","","","","","","","Taylor",""]))
	end


	def test_for_days_left
		assert_equal(-6, days_left(["1000000","Wbg","111-111","","75","56.25","10.12.2015","","","","","","","","","Taylor",""], "2015.10.18"))
		assert_equal(-32, days_left(["1000000","Wbg","111-111","","75","56.25","9.16.2015","","","","","","","","","Taylor",""], "2015.10.18"))
		assert_equal(367, days_left(["1000000","Wbg","111-111","","75","56.25","10.19.2015","","","","","","","","","Taylor",""], "2015.10.18"))	
	end

   
	def test_for_risk_factor
		assert_equal(0.5, risk_factor(6.0,12.0))
		assert_equal(0.17, risk_factor(3.0,18.0)) 
		assert_equal(0.33, risk_factor(1.0,3.0))
		assert_equal(-0.33, risk_factor(2.0,-6.0))
		assert_equal(-2.0, risk_factor(2.0,0.0))
	end
	
	def test_for_clean_date
		assert_equal(["1000000","Wbg","111-111","","75","56.25","1.1.70","","","","","","","","","Taylor",""], clean_date(["1000000","Wbg","111-111","","75","56.25","?.?.?","","","","","","","","","Taylor",""]))
		assert_equal(["1000000","Wbg","111-111","","75","56.25","1.1.70","","","","","","","","","Taylor",""], clean_date(["1000000","Wbg","111-111","","75","56.25",nil,"","","","","","","","","Taylor",""]))
	end
	
	
	def test_for_overall_function
	
	
	end
end