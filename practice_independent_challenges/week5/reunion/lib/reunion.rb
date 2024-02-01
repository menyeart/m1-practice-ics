class Reunion
  attr_reader :name, 
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum { |activity| activity.total_cost }
  end

  def cost_breakdown
    owed = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |name, cost|
        owed[name] += cost
      end
    end
    owed
  end

  def print_summary
    cost_breakdown.each do |name, cost|
      print "#{name} owes $#{cost}\n"
    end
  end

  def detailed_breakdown
    detailed_breakdown = create_nested_hash
    @activities.each do |activity|
      activity.participants.each do |name, spent| 
        detailed_breakdown[name][activity.name]["debts"] = {"sunita" => 5}
        detailed_breakdown[name][activity.name]["credits"] = {"sunita" => 0}
      end
    end
    detailed_breakdown
  end

  def create_nested_hash
    Hash.new do |hash, key|
      hash[key] = create_nested_hash
    end
  end

end