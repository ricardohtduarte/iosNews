import UIKit

final class NetworkFactory {

    let url = URLBuilder().urlComponents.url
    let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    func getPosts(completion: @escaping ((Result<TopHeadlines>) -> Void)) {
        
        guard let url = self.url else {
            print("ERROR: Could not get the URL from URLComponents")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = urlSession.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    completion(.failure(error))
                } else if let jsonData = responseData {
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let news = try decoder.decode(TopHeadlines.self, from: jsonData)
                        completion(.success(news))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    completion(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

enum Result<T> {
    case success(T)
    case failure(Error)
}
