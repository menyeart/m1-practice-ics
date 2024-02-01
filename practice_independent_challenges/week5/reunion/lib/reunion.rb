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

end