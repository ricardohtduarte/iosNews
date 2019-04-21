import Foundation

enum Path {
    case topHeadlines
    case everything
    case sources
}

final class URLBuilder {
    
    var urlComponents = URLComponents()
    
    init(path: Path) {
        urlComponents.scheme = Constants.scheme
        urlComponents.host = Constants.host
        configureComponents(with: path)
    }

    private func configureComponents(with path: Path) {
        switch path {
        case .topHeadlines:
            buildTopHeadlinesURL()
        case .everything:
            buildEverythingURL()
        case .sources:
            buildSourcesURL()
        }
    }
    
    private func buildTopHeadlinesURL() {
        urlComponents.path = Constants.topHeadlines
        
        let countryQueryItem = URLQueryItem(name: "country", value: Constants.country)
        let apiKeyQueryItem = URLQueryItem(name: "apiKey", value: Constants.apiKey)
        
        urlComponents.queryItems = [countryQueryItem, apiKeyQueryItem]
    }
    
    private func buildEverythingURL() {
        urlComponents.path = Constants.everything
        
        let countryQueryItem = URLQueryItem(name: "q", value: Constants.search)
        let apiKeyQueryItem = URLQueryItem(name: "apiKey", value: Constants.apiKey)
        
        urlComponents.queryItems = [countryQueryItem, apiKeyQueryItem]
    }
    
    private func buildSourcesURL() {
        urlComponents.path = Constants.sources
    }
}

extension URLBuilder {
    enum Constants {
        static let scheme = "https"
        static let host = "newsapi.org"
        static let country = "us"
        static let search = "bitcoin"
        static let topHeadlines = "/v2/top-headlines"
        static let everything = "/v2/everything"
        static let sources = "/v2/sources"
        static let apiKey = "9ae791cc00924bd58baa6f0efad605c1"
    }
}
