import Foundation

class TabBarViewModel: ObservableObject {
    @Published var hideTabBar: Bool
    
    init(hideTabBar: Bool) {
        self.hideTabBar = hideTabBar
    }
    
//    private lazy var mapTabItem: TabBarItem = {
//        TabBarItemView(with: Asset.Assets.iconTabMap.image,
//                         contentController: EWBrowseMapViewController(), gradientCover: false)
//    }()
}
