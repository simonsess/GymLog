import Foundation
import SwiftUI

enum TabbedItem: Int, CaseIterable {
    case overview = 0, planner, settings
    
    var icon: Image {
        switch self {
        case .overview:
            return Image(systemName: "trophy")
        case .planner:
            return Image(systemName: "medal")
        case .settings:
            return Image(systemName: "gym.bag")
        }
    }
    
    var name: String {
        switch self {
        case .overview:
            return "Overview"
        case .planner:
            return "Planner"
        case .settings:
            return "Settings"
        }
    }
}
