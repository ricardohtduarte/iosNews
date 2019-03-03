import Foundation

final class URLBuilder {
    
    var urlComponents = URLComponents()
    
    init() {
        configureComponents()
    }

    private func configureComponents() {
        urlComponents.scheme = "https"
        urlComponents.host = "newsapi.org"
        urlComponents.path = "/v2/top-headlines"
        
        let countryQueryItem = URLQueryItem(name: "country", value: "us")
        let apiKeyQueryItem = URLQueryItem(name: "apiKey", value: "9ae791cc00924bd58baa6f0efad605c1")

        urlComponents.queryItems = [countryQueryItem, apiKeyQueryItem]
    }
}
