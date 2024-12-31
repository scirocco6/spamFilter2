// Create a new file for shared UserDefaults
import Foundation

extension UserDefaults {
    static let shared = UserDefaults(suiteName: "group.provenance-six.provenance")!
    static let filterEnabledKey = "isFilterEnabled"
}