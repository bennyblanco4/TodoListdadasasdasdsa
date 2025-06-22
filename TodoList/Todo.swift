import Foundation

struct Todo: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
    var dateCreated: Date = Date()
}