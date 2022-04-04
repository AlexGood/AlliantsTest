//
//  Session.swift
//  AlliantsTest
//
//  Created by Alex Kudlak on 2022-04-04.
//

import Foundation

class Session {
    static func doRequest(with urlComponents: URLComponents, completionHandler: @escaping (_ response: [VendorData]) -> Void) {
        let urlSession = URLSession.shared
        
        guard let url = urlComponents.url else {
            return
        }
        
        urlSession.dataTask(with: url) { (data, response, error) in
            if error != nil {
                return
            }
            
            let jsonDecoder: JSONDecoder = {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    return jsonDecoder
            }()
            
            if let data = data {
                do {
                    let decodedResponse = try jsonDecoder.decode([VendorData].self, from: data)
                    completionHandler(decodedResponse)
                } catch let jsonError as NSError {
                    print("JSON decode failed: \(jsonError.localizedDescription)")
                }
                return
            }
        }.resume()
    }
}


