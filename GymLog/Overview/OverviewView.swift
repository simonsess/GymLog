import Foundation
import SwiftUI

struct OverviewView: View {
    @Binding var hideTabBar: Bool
//    @State var isActive: Bool
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Overview")
                
                NavigationLink {
                    NewWorkout(hideTabBar: $hideTabBar)
                        .navigationBarBackButtonHidden(true)
                        
                } label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .tint(.green)
                }
                .simultaneousGesture(TapGesture().onEnded{
                    withAnimation {
                        hideTabBar.toggle()
                    }
                })
                
                
            }
        }
    }
}

#Preview {
    OverviewView(hideTabBar: .constant(false))
}
