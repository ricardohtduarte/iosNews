import Foundation
import UIKit

enum ImageRequestState {
    case loading
    case offline
    case failed
    case ready(UIImage)
}

final class NewsCellViewModel {
    let network = NetworkFactory()
    var imageRequestState = State.loading
    var onImageRequest: ImageRefreshHandler?
    typealias ImageRefreshHandler = (_ status: ImageRequestState) -> Void
    
    func fetchImage(url: URL) {
        network.getArticleImage(imageUrl: url, completion: { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case .success(let image):
                self.onImageRequest?(.ready(image))
            case .failure:
                self.onImageRequest?(.failed)
            }
        })
    }
}
