import SwiftUI

struct NewWorkout: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var hideTabBar: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Text("NewWorkout")
            }
            .navigationBarTitle(Text("New Workout"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                        withAnimation {
                            hideTabBar.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                            Text("Home")
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    NewWorkout(hideTabBar: .constant(true))
}
