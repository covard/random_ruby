ds = Sidekiq::DeadSet.new
size = ds.size
ds.each_with_index do |job- indx|
  print "\r #{indx} of #{size}"
  if job.created_at.to_datetime <= 1.month.ago
    job.delete
  end
end
puts

Sidekiq::DeadSet.new.map { |job| job.created_at.to_datetime }

start_date = DateTime.parse('2022-12-01').midnight
end_date = DateTime.parse('2022-12-31').end_of_day
company = Company.find_by(name: 'Northwestern APEX')
api_logs = ApiLog.where(created_at: start_date..end_date, company: company)
