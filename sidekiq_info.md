## Sidekiq Info

## Dead Queue

```ruby
ds = Sidekiq::DeadSet.new
jobs = ds.select { |i| i['class'] == 'CheckAdverseActionNotificationWorker' }
```

## Retry Queue

```ruby
Sidekiq::RetrySet.new.each do |job|
  ap job
end
```
