require 'selenium-webdriver'
require 'gmail'

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://www.webpagetest.org/"
driver.find_element(:id,'url').send_keys("https://www.ebay.com/")
elements = driver.find_element(:class, 'start_test').click

wait = Selenium::WebDriver::Wait.new(:timeout => 40)
wait.until { driver.find_element(:id => "LoadTime") }
wait.until { driver.find_element(:id => "TTFB") }

driver.find_element(:id, 'LoadTime').text
driver.find_element(:id, 'TTFB').text

puts driver.find_element(:id, "LoadTime").text
puts ' '
puts driver.find_element(:id, "TTFB").text

loadtime = "driver.find_element(:id, LoadTime).text"
ttfb = "driver.find_element(:id, TTFB).text"

gmail = Gmail.connect('chasemorgan15', 'Averdell34')
email = gmail.compose do
  to "chasemorgan15@yahoo.com"
  subject "First Testing Script"
  body "#{loadtime} is the load time and #{ttfb} is the time to first byte"
end
email.deliver!
sleep 50
