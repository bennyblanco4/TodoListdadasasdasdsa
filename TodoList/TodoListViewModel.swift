import Foundation
import Combine

class TodoListViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    
    private let saveKey = "TodoList"
    
    init() {
        loadTodos()
    }
    
    func addTodo(title: String) {
        let newTodo = Todo(title: title)
        todos.append(newTodo)
        saveTodos()
    }
    
    func toggleCompletion(for todo: Todo) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isCompleted.toggle()
            saveTodos()
        }
    }
    
    func deleteTodos(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
        saveTodos()
    }
    
    private func saveTodos() {
        if let encoded = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadTodos() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([Todo].self, from: data) {
                todos = decoded
                return
            }
        }
        
        // If we're here, there was no saved data
        todos = []
    }
}