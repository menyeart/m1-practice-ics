class Activity
  attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @participants.values.sum
  end

  def count_participants
    @participants.keys.count
  end

  def split
    total_cost / count_participants
  end

  def owed
    owed_hash = {}
    @participants.each { |name, spent| owed_hash[name] = split - spent }
    owed_hash 
  end

end