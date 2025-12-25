// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI
import DependencyKit
import ICTMDBModularProtocols

//MARK: Page
/// Pages on the application
///  An enum representing pages in the application.
public enum Page : Hashable {
    case home
    case allList(AllListType)
    case detail(Int?)
}


//MARK: Navigation
///  Navigation class for managing the navigation stack.
public class Navigation:ObservableObject {
    public init() { }
    @Published public var  path = NavigationPath()
    
    /// Push a new page into the navigation stack.
    public  func push(_ page:Page){
        path.append(page)
        
    }
    /// Pop the last page from the navigation stack.
    public  func pop() {
        path.removeLast()
    }
    /// Pop all the pages, going back to the root page.
    public  func popToRoot(){
        path.removeLast(path.count)
    }
    
    /// Build the appropriate view for a given page.
    @ViewBuilder
    public  func build(page:Page) -> some View {
        switch page {
        case .home:
            /// Dependency resolution and view creation for the home page
            let homeModule : HomeModuleProtocol = DependencyRegister.shared.resolve(HomeModuleProtocol.self)
            homeModule.createHomeModule()
        case .allList(let allListType):
            /// Dependency resolution and view creation for the all list page
            let allListModule : AllListModuleProtocol = DependencyRegister.shared.resolve(AllListModuleProtocol.self)
            allListModule.createAllListModule(type: allListType)
        case .detail(let id):
            /// Dependency resolution and view creation for the detail page
            let detailModule : TvShowDetailProtocol = DependencyRegister.shared.resolve(TvShowDetailProtocol.self)
            detailModule.createTvShowDetailModule(id: id)
        }
    }
}
