import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var name: String?
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
