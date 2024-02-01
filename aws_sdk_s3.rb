credentials = Aws::Credentials.new(ENV['S3_KEY'], ENV['S3_SECRET_KEY'])
s3 = Aws::S3::Client.new(region: 'us-west-2', credentials: credentials)

resource = Aws::S3::Resource.new region: 'us-west-2', credentials: credentials
bucket = resource.bucket 'or1-dev-paperclippy'
bucket.objects.each { |obj| obj.download_file("/Users/curtisovard/Desktop/file_#{key}.pdf") }

obj = resource.bucket(ENV['S3_BUCKET']).object(document.guid)
obj.upload_file('/path/to/source/file')

# I/O object
File.open('/path/to/source.file', 'rb') do |file|
  obj.put(body: file)
end

# presigned url
presigner = Aws::S3::Presigner.new(client: Aws::S3::Client.new)
params = { bucket: "www.joaquinamenabar.com", key: 'Video1-10.mov', expires_in: 86400 }
presigner.presigned_url(:get_object, params)
