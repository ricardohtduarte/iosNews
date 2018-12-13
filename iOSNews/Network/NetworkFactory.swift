import UIKit

final class NetworkFactory {
    let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=9ae791cc00924bd58baa6f0efad605c1"
    func getPosts(for userId: Int, completion: ((Result<[News]>) -> Void)?) {
        
        var request = URLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    completion?(.failure(error))
                } else if let jsonData = responseData {
                    
                    let decoder = JSONDecoder()
                    
                    do {
                        let news = try decoder.decode([News].self, from: jsonData)
                        completion?(.success(news))
                    } catch {
                        completion?(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    completion?(.failure(error))
                }
            }
        }
        
        task.resume()
    }
}

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

extension NetworkFactory {
    func getTopHealines () {
        
    }
}
