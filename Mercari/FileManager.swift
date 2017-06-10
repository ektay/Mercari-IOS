//
//  FileManager.swift
//  Mercari
//
//  Created by Ekta Agrawal on 6/8/17.
//  Copyright © 2017 Mercari. All rights reserved.
//
//The FileManager class is responsible to read the JSON files stored 
import UIKit

enum FileManagerError: Error {
    case fileNotAccessible
}

class FileManager: NSObject {
    
    static func readFile(fileName: String , fileType: String) throws -> NSDictionary?
    {
        if let path = Bundle.main.path(forResource: fileName, ofType: fileType) {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    return jsonResult
                }
            }
        }
        else
        {
            throw FileManagerError.fileNotAccessible
        }
        
       
    }
}
