import SwiftUI

struct TodoRowView: View {
    let todo: Todo
    let toggleCompletion: () -> Void
    
    var body: some View {
        HStack {
            Button(action: toggleCompletion) {
                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(todo.isCompleted ? .green : .gray)
            }
            
            Text(todo.title)
                .strikethrough(todo.isCompleted)
                .foregroundColor(todo.isCompleted ? .gray : .primary)
            
            Spacer()
        }
        .padding(.vertical, 8)
    }
}