import Foundation
import SwiftData

@Model
final class Workout {
    @Attribute(.unique)
    var id: UUID = UUID()
    @Relationship(deleteRule: .cascade)
    var exercises: [Exercise] = []
    var created: Date

    init(timestamp: Date) {
        self.created = timestamp
    }
}

@Model
final class Exercise {
    @Attribute(.unique)
    var id: UUID = UUID()
    var workout: Workout
    @Relationship(deleteRule: .cascade)
    var series: [Series] = []
    
    init(workout: Workout) {
        self.workout = workout
    }
}

@Model
final class Series {
    @Attribute(.unique)
    var id: UUID = UUID()
    var exercise: Exercise
    var reps: Int = 0
    var weight: Int = 0
    
    init(exercise: Exercise) {
        self.exercise = exercise
    }
}
