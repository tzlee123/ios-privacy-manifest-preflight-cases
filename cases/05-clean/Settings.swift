import Foundation

enum OnboardingState {
    static var completed: Bool {
        UserDefaults.standard.bool(forKey: "onboardingCompleted")
    }
}
