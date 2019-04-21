import UIKit

enum State {
    case loading
    case offline
    case failed
    case ready([Article])
}

final class HomeViewModel {
    
    let network = NetworkFactory()
    var state = State.loading
    var onUpdate: HomeRefreshHandler?
    typealias HomeRefreshHandler = (_ status: State) -> Void
    
    
    func fetchNews() {
        network.getPosts { [weak self] result in
            
            guard let self = self else {
                print("Could not get homeViewModel self")
                return
            }
            
            switch result {
            case .success(let topHeadlines):
                self.onUpdate?(.ready(topHeadlines.articles))
                
            case .failure(let error):
                print(error)
                self.onUpdate?(.failed)
            }
        }
    }
}
