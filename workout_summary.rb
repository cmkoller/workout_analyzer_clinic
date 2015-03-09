require_relative 'workout'
require 'csv'
require 'table_print'

def load_workout_data(filename)
  workouts = []

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout = workouts.find { |wo| wo.id == row[:workout_id] }

    if workout.nil?
      workout = Workout.new(row[:workout_id], row[:date])
      workouts << workout
    end

    exercise = {
      name: row[:exercise],
      category: row[:category],
      duration_in_min: row[:duration_in_min]
    }

    workout.exercises << exercise
  end

  workouts
end

workouts = load_workout_data("workouts.csv")

tp(workouts, :id, :date, :type, :duration, :calories_burned)
