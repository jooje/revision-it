json.array!(@revisions) do |revision|
  json.extract! revision, :id, :hash_code, :url, :log
  json.url revision_url(revision, format: :json)
end
