class Workout
  def initialize(id, date)
    @id = id
    @date = date
    @exercises = []
  end

  def id
    @id
  end

  def date
    @date
  end

  def exercises
    @exercises
  end

  def type
    cardio_count = exercises.count { |ex| ex[:category].downcase == "cardio" }
    strength_count = exercises.count { |ex| ex[:category].downcase == "strength" }

    percentage_cardio = cardio_count / exercises.count.to_f
    percentage_strength = strength_count / exercises.count.to_f

    # Should return "cardio" if over half exercises are cardio
    if percentage_cardio >= 0.5
      "cardio"
    # Should return "strength" if over half exercises are strength
    elsif percentage_strength > 0.5
      "strength"
    # Otherwise, it should return "other"
    else
      "other"
    end
  end

  def duration
    total = 0.0

    exercises.each do |exercise|
      total += exercise[:duration_in_min]
    end

    total
  end

  def calories_burned
    total = 0.0

    exercises.each do |exercise|
      # exercise is cardio
      if exercise[:category] == "cardio"
        total += 8 * exercise[:duration_in_min]
      # exercise is something else
      else
        total += 5 * exercise[:duration_in_min]
      end
    end

    total
  end

end
