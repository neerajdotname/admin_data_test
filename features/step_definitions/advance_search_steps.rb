Then /^page should have text as current date for "(.*)"$/ do |css_selector|
  wait_until { page.evaluate_script("jQuery.active === 0") }

  page.find(css_selector).value.should == Time.now.strftime('%d-%B-%Y')
end

Then /^async verify that number of "(.*)" records is "(.*)"$/ do |klass, count|
  klass.constantize.count.should == count.to_i
end

Then /^async click "(.*)"$/ do |text|
  wait_until { page.evaluate_script("jQuery.active === 0") }

  page.evaluate_script('window.confirm = function() { return true; }')
  page.click_link_or_button(text)
end
    
Then /^asyc I should see "(.*)"$/ do |text|
  wait_until { page.evaluate_script("jQuery.active === 0") }

  page.should have_content(text)
end
