//
//  NetworkManager.swift
//  DemoImageCache
//
//  Created by Kavita Malagavi on Aug-3-2020.
//  Copyright © 2020 Kavita Malagavi. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func getDropBoxContents (callback : @escaping (DataModel?, String?) -> Void) {
        if let url = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json") {
            let request = NSURLRequest(url: url)
            RequestManager.shared.fetchRequest(urlRequest: request as URLRequest) { (statusCode, response) in
                if statusCode == 200 {
                    if let data = response {
                        if let value = String(data: data, encoding: String.Encoding.ascii) {
                            if let jsonData = value.data(using: String.Encoding.utf8) {
                                do {
                                    let decoder = JSONDecoder()
                                    let jsonres = try decoder.decode(DataModel.self, from: jsonData)
                                    callback(jsonres, nil)
                                } catch {
                                    callback(nil, nil)
                                }
                            }
                        }
                    }
                } else {
                    callback(nil, nil)
                }
            }
        }
    }
}
