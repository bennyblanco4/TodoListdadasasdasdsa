import SwiftUI

struct TodoListView: View {
    @StateObject private var viewModel = TodoListViewModel()
    @State private var newTodoTitle = ""
    @State private var isAddingTodo = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.todos) { todo in
                        TodoRowView(todo: todo, toggleCompletion: {
                            viewModel.toggleCompletion(for: todo)
                        })
                    }
                    .onDelete(perform: deleteTodos)
                }
                
                HStack {
                    TextField("New todo", text: $newTodoTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: addTodo) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    .disabled(newTodoTitle.isEmpty)
                }
                .padding()
            }
            .navigationTitle("Todo List")
            .toolbar {
                EditButton()
            }
        }
    }
    
    private func addTodo() {
        viewModel.addTodo(title: newTodoTitle)
        newTodoTitle = ""
    }
    
    private func deleteTodos(at offsets: IndexSet) {
        viewModel.deleteTodos(at: offsets)
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}