import Foundation
import SwiftUI
import Combine
import SwiftData

struct TabBarView: View {
    @Environment(\.modelContext) private var modelContext
    @ObservedObject var viewModel: TabBarViewModel = TabBarViewModel(hideTabBar: false)
    
    @State var selectedTab = 0
    @State private var hideTabBar: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
                TabView(selection: $selectedTab) {
                    
                    OverviewView(hideTabBar: $hideTabBar)
                        .tag(0)
                    
                    PlannerView()
                        .tag(1)
                    SettingsView()
                        .tag(2)
                    
                }
                
                VStack {
                    Spacer()
                    if !hideTabBar {
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
                        .transition(.move(edge: .bottom).combined(with: .opacity).combined(with: .scale(scale: 0, anchor: .bottom)))
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
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
