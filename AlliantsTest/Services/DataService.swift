//
//  DataService.swift
//  AlliantsTest
//
//  Created by Alex Kudlak on 2022-04-04.
//

import Foundation

import Foundation

class DataService {
    static func getData(completionHandler: @escaping (_ response: [VendorData]) -> Void) {
        guard let urlComponents = URLComponents(string: AppConstants.api) else {
                    return
                }
                
        Session.doRequest(with: urlComponents) { result in
            completionHandler(result)
        }
    }
}
