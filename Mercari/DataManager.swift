//
//  DataManager.swift
//  Mercari
//
//  Created by Ekta Agrawal on 6/8/17.
//  Copyright © 2017 Mercari. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    var contents: [Item] = []

    func fetchItems() -> [Item]
    {
        do{
            if let resultDict = try FileManager.readFile(fileName: "all", fileType: "json"){
                
                if resultDict.count > 0{
                    if let data : [NSDictionary] = resultDict["data"] as? [NSDictionary] {
                        for item in data{
                            if let itemDict = item as? [String:AnyObject] {
                                let item = Item.init(fromDictionary: itemDict)
                                contents.append(item)
                            }
                        }
                    }
                }
                else
                {
                    print("Empty result dictionary")
                }
            }
            
        }catch{ print("Error Reading File \(error)")}
        
        return contents
    }
}
