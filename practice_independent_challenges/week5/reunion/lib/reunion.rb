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
      activity.participants.each do |participant, money|
        detailed_breakdown[participant][activity.name]["owed_me"] = owes_me(activity, participant)
        detailed_breakdown[participant][activity.name]["owed_them"] = who_owes(activity, participant)
        detailed_breakdown[participant][activity.name]["amount_owed"] = amount_owed(activity, participant)
      end
    end
    detailed_breakdown
  end

  def create_nested_hash
    Hash.new do |hash, key|
      hash[key] = create_nested_hash
    end
  end

  def who_owes(activity, participant_name)
    activity.owed.map { |name, value| name if name != participant_name && value < 0 }.compact
  end

  def owes_me(activity, participant_name)
    activity.owed.map { |name, value| name if name != participant_name && value > 0 }.compact
  end

  def amount_owed(activity, participant)
    activity.owed[participant] > 0 ? activity.owed[participant] : 0
  end


end