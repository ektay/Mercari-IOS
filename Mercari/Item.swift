//
//  Product.swift
//  Mercari
//
//  Created by Ekta Agrawal on 6/8/17.
//  Copyright © 2017 Mercari. All rights reserved.
//

import UIKit

class Item: NSObject {

    /*     "id": "mmen1",
    "name": "men1",
    "status": "on_sale",
    "num_likes": 91,
    "num_comments": 59,
    "price": 51,
    "photo": "https://dummyimage.com/400x400/000/fff?text=men1"*/
    
    struct Keys{
        static let id = "id"
        static let name = "name"
        static let status = "status"
        static let num_likes = "num_likes"
        static let num_comments = "num_comments"
        static let price = "price"
        static let photo = "photo"
    }
    
    var id : String?
    var name : String?
    var status : String?
    var numlikes : Int?
    var numComments : Int?
    var price : Int?
    var photo : String?
    
    init(fromDictionary dictionary:[String:AnyObject]?)
    {
        super.init()
        if let dataDict = dictionary {
            
            if let id = dataDict[Keys.id] as? String{
                self.id = id
            }
            
            if let name = dataDict[Keys.name] as? String {
                self.name = name
            }
            
            if let status = dataDict[Keys.status] as? String {
                self.status = status
            }
            
            if let price = dataDict[Keys.price] as? Int{
                self.price = price
            }
            
            if let photo = dataDict[Keys.photo] as? String
            {
                self.photo = photo
            }

        }
    }
    
    
}
