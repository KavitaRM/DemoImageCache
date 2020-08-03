//
//  RequestManager.swift
//  DemoImageCache
//
//  Created by Kavita Malagavi on Aug-3-2020.
//  Copyright © 2020 Kavita Malagavi. All rights reserved.
//

import Foundation

class RequestManager {
    static let shared = RequestManager()
    
    func fetchRequest(urlRequest: URLRequest, completionHandler: @escaping (_ statusCode: Int, _ responseData: Data?) -> Void) {
        let configuration = URLSessionConfiguration.default
        let request = urlRequest
        configuration.timeoutIntervalForRequest = 60 // in seconds
        
        let  session = URLSession(configuration: configuration)
        let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else { return }
            if error != nil {
                completionHandler(httpResponse.statusCode, nil)
            } else {
                completionHandler(httpResponse.statusCode, data)
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
