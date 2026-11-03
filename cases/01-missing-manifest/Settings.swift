import Foundation

enum LaunchState {
    static var hasLaunchedBefore: Bool {
        UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
    }
}
