//
//  CustomImageView.swift
//  DemoImageCache
//
//  Created by Kavita Malagavi on Aug-3-2020.
//  Copyright © 2020 Kavita Malagavi. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {

    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        
        imageUrlString = urlString
        
        guard let url = URL(string: urlString) else { return }
        
        image = nil
        
        // get the image from cache
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        // If there is no image in cache, run the task to download image
        URLSession.shared.dataTask(with: url, completionHandler: { (data, respones, error) in
            
            if error != nil {
                print(error ?? "")
                return
            }
            
            DispatchQueue.main.async {
                if let imageToCache = UIImage(data: data!) {
                    self.image = imageToCache
                } else {
                    self.image = UIImage(named: "placeholder")
                }
                
                // store the image in cache
                imageCache.setObject(self.image!, forKey: urlString as NSString)
            }
            
        }).resume()
    }

    
}
