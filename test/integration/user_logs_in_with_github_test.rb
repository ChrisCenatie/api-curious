# require "test_helper"
#
# class UserLogsInWithGithubTest < ActionDispatch::IntegrationTest
#   include Capybara::DSL
#   def setup
#     Capybara.app = ApiCurious::Application
#     stub_omniauth
#   end
#
#   test "logging in and out" do
#     visit "/"
#
#     assert_equal 200, page.status_code
#     click_link "LOGIN"
#
#     assert_equal "/users/980190963", current_path
#     assert page.has_content?("Hello, Bob")
#     assert page.has_link?("Logout")
#
#     click_link "Logout"
#     assert_equal current_path, "/"
#   end
#
#   test "unauthenticated user can not visit another users page" do
#     visit "/users/980190963"
#
#     assert_equal "/", current_path
#     assert_equal 200, page.status_code
#   end
#
#   def stub_omniauth
#     OmniAuth.config.test_mode = true
#     OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
#       provider: 'github',
#       uid: "1234",
#       info: {
#         name: "Bob",
#         nickname: "Ricky"
#       },
#       extra: {
#         raw_info:{
#           avatar_url: "https://robohash.org/173.248.147.18.png"
#         }
#       },
#       credentials: {
#         token: "1234"
#       }
#     })
#   end
# end
