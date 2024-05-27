import SwiftUI

let taskColors: [String: Color] = [
    "Mobile App Research": Color(hex: "#FACBBA"),
    "Prepare Wireframe for Main Flow": Color(hex: "#D7F0FF"),
    "Prepare Screens": Color(hex: "#FAD9FF"),
    "Website Research": Color(hex: "#FACBBA")
]

struct Task: Identifiable {
    var id = UUID()
    var title: String
    var date: String
    var isCompleted: Bool
}

struct ContentView: View {
    @State private var tasks: [Task] = [
        Task(title: "Mobile App Research", date: "4 Oct", isCompleted: true),
        Task(title: "Prepare Wireframe for Main Flow", date: "4 Oct", isCompleted: true),
        Task(title: "Prepare Screens", date: "4 Oct", isCompleted: true),
        Task(title: "Website Research", date: "5 Oct", isCompleted: false),
        Task(title: "Prepare Wireframe for Main Flow", date: "5 Oct", isCompleted: false),
        Task(title: "Prepare Screens", date: "5 Oct", isCompleted: false)
    ]
    
    var remainingTasksCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    
    var completedTasks: [Task] {
        tasks.filter { $0.isCompleted }
    }
    
    var pendingTasks: [Task] {
        tasks.filter { !$0.isCompleted }
    }
    
    func completeAllTasks() {
        tasks = tasks.map { Task(id: $0.id, title: $0.title, date: $0.date, isCompleted: true) }
    }
    
    func toggleTaskCompletion(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
    
    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("You have \(remainingTasksCount) tasks to complete")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Spacer()
                    ZStack(alignment: .bottomTrailing) {
                        GradientProfilePicture(imageName: "ProfileImage")
                            .frame(width: 60, height: 60)
                        
                        if remainingTasksCount > 0 {
                            Text("\(remainingTasksCount)")
                                .font(.caption)
                                .foregroundColor(.white)
                                .padding(6)
                                .background(Color(hex: "#FF763B"))
                                .clipShape(Circle())
                                .offset(x: -5, y: 10)
                        }
                    }
                }
                .padding()
                
                Button(action: {
                    completeAllTasks()
                }) {
                    Text("Complete All")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [Color(hex: "#73ABFF"), Color(hex: "#46C0C2")]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Progress")
                            .font(.system(size: 22))
                            .font(.headline)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Daily Task")
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text("\(completedTasks.count)/\(tasks.count) Task Completed")
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Text("\(Int(Double(completedTasks.count) / Double(tasks.count) * 100))%")
                                        .foregroundColor(.primary)
                                }
                                
                                Text("Keep working")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            
                            CustomProgressBar(value: Double(completedTasks.count) / Double(tasks.count))
                                .frame(height: 18)
                        }
                        .padding()
                        .background(Color("ProgressBar"))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        
                        Spacer(minLength: 30)
                        
                        VStack(alignment: .leading) {
                            Text("Completed Tasks")
                                .font(.system(size: 22))
                                .font(.headline)
                                .padding(.horizontal)
                            
                            ForEach(completedTasks) { task in
                                TaskRow(task: task, toggleCompletion: toggleTaskCompletion)
                                    .padding(.horizontal)
                            }
                            
                            ForEach(pendingTasks) { task in
                                TaskRow(task: task, toggleCompletion: toggleTaskCompletion)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct GradientProfilePicture: View {
    var imageName: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(hex: "#BA83DE"), Color(hex: "#D9D9D9", opacity: 0)]),
                        startPoint: .topLeading,
                        endPoint: .bottomLeading
                    )
                )
                .frame(width: 59, height: 59)
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 52, height: 52)
                .clipShape(Circle())
        }
    }
}

struct CustomCheckmarkButton: View {
    var isCompleted: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(hex: "#73ABFF"), lineWidth: 2)
                .background(
                    Circle()
                        .fill(isCompleted ? Color(hex: "#73ABFF") : Color.clear)
                )
                .frame(width: 24, height: 24)
            
            if isCompleted {
                Image(systemName: "checkmark")
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .bold))
            }
        }
    }
}

struct TaskRow: View {
    var task: Task
    var toggleCompletion: (Task) -> Void
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(taskColors[task.title] ?? Color.gray)
                .frame(width: 22)
                .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 16))
                .offset(x: -28, y: 0)
            
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.system(size: 16))
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                HStack {
                    Image(colorScheme == .dark ? "IconLight" : "IconDark")
                        .resizable()
                        .frame(width: 17, height: 20)
                        .foregroundColor(.gray)
                    Text(task.date)
                        .foregroundColor(.gray)
                }
            }
            .padding(.leading, -30)
            
            Spacer()
            
            Button(action: {
                toggleCompletion(task)
            }) {
                CustomCheckmarkButton(isCompleted: task.isCompleted)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 16))
        .background(Color("ProgressBar"))
        .cornerRadius(8)
        .frame(height: 80)
    }
}

struct CustomProgressBar: View {
    var value: Double
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color(hex: "#73ABFF", opacity: 0.4))
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color(hex: "#73ABFF"))
                    .frame(width: CGFloat(self.value) * geometry.size.width, height: geometry.size.height)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black.opacity(0.25), Color.clear]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        )
                        }
        }
        .frame(height: 18)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
            ContentView()
                .environment(\.colorScheme, .light)
                .previewDisplayName("Light Mode")
        }
    }
}

