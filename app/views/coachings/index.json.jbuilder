json.array!(@coachings) do |coaching|
  json.extract! coaching, :id, :student_id, :coach_id
  json.url coaching_url(coaching, format: :json)
end
