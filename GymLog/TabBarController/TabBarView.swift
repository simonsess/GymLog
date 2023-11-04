import Foundation
import SwiftUI
import Combine
import SwiftData

struct TabBarView: View {
    @Environment(\.modelContext) private var modelContext
    @State var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                OverviewView()
                    .tag(0)
                PlannerView()
                    .tag(1)
                SettingsView()
                    .tag(2)
            }
            
            ZStack {
                HStack (spacing: 0) {
                    ForEach((TabbedItem.allCases), id: \.self){ item in
                        Button {
                            selectedTab = item.rawValue
                        } label: {
                            TabItem(selectedTab: selectedTab, item: item)
                        }
                    }
                }
                .background(.tertiary)
                .clipShape(.capsule)
                .shadow(color: .gray, radius: 8)
                .overlay(content: {
                })
            }
        }
    }
}

struct TabItem: View {
    var selectedTab: Int
    var item: TabbedItem
    var body: some View {
        let isActive: Bool = item.rawValue == selectedTab
        VStack {
            item.icon
                .renderingMode(.template)
                .tint(isActive ? .red : .black)
                .frame(height: 30)
            if isActive {
                Text(item.name)
                    .tint(.red)
            }
        }
        .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
        .background(isActive ? .gray.opacity(0.4) : .clear)
        .cornerRadius(30)
    }
}


#Preview {
    TabBarView()
}
