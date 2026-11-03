import Foundation

func preferredTheme() -> String {
    UserDefaults.standard.string(forKey: "preferredTheme") ?? "system"
}
