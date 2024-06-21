desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  User.destroy_all
  Delivery.destroy_all

  usernames = ["alice", "bob", "carol", "dave", "eve"]

  usernames.each do |username|
    user = User.new
    user.email = "#{username}@example.com"
    user.password = "password"
    user.save

    deliveries = [
      { :description => "Package 1", :supposed_to_arrive_on => "2024-06-22", :details => "Details 1", :status => "waiting on", :user_id => user.id },
      { :description => "Package 2", :supposed_to_arrive_on => "2024-06-25", :details => "Details 2", :status => "waiting on", :user_id => user.id },
      { :description => "Package 3", :supposed_to_arrive_on => "2024-06-26", :details => "Details 3", :status => "received", :user_id => user.id },
      { :description => "Package 4", :supposed_to_arrive_on => "2024-07-03", :details => "Details 4", :status => "waiting on", :user_id => user.id },
      { :description => "Package 5", :supposed_to_arrive_on => "2024-07-05", :details => "Details 5", :status => "received", :user_id => user.id },
    ]

    deliveries.each do |delivery_data|
      delivery = Delivery.new(delivery_data)
      delivery.save
    end
  end

  puts "There are now #{User.count} rows in the users table."
  puts "There are now #{Delivery.count} rows in the deliveries table."
end
