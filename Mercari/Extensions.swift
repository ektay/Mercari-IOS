//
//  UIImageView+loadImage.swift
//  Mercari
//
//  Created by Ekta Agrawal on 6/8/17.
//  Copyright © 2017 Mercari. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    func loadImageUsingCacheWithUrl(urlString: String) {
        self.image = nil
        
        // check for cache
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        
        // download image from url
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) -> Void in
            
            guard error == nil, let downloadedImage = UIImage(data: data!) else { return }
            
            DispatchQueue.main.async(execute: { () -> Void in
                imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                self.image = downloadedImage
            })
        }).resume()
        
        
    }
}
