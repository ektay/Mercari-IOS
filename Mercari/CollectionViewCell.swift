//
//  CollectionViewCell.swift
//  Mercari
//
//  Created by Ekta Agrawal on 6/8/17.
//  Copyright © 2017 Mercari. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var soldImageView: UIImageView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    func configureCell(item: Item)
    {
        setupViewCornerRadius()
        setupColorAndFonts()
        setupData(item:item)
    }
    
    func setupData(item:Item)
    {
        self.setName(item: item)
        self.setPrice(item: item)
        self.setPhoto(item: item)
        self.setStatus(item: item)
    }
    
    func setName(item: Item)
    {
        self.name.text = item.name
    }
    
    func setPrice(item:Item)
    {
        if let itemPrice =  item.price {
            self.priceLabel.text = "$" + String(itemPrice) + " "
        }
        else
        {
            self.priceLabel.isHidden = true //If the price is not available, I am hiding the Label for now. we can always change this implementation as required.
        }
    }
    
    func setPhoto(item:Item)
    {
        if let photoUrl = item.photo {
            self.photoImageView.loadImageUsingCacheWithUrl(urlString: photoUrl)
        }
    }
    
    func setStatus(item: Item)
    {
        if(item.status == "sold_out")
        {
            self.soldImageView.image = #imageLiteral(resourceName: "sold")
        }
        else
        {
            self.soldImageView.image = nil
        }
    }
    
    func setupViewCornerRadius()
    {
        self.setRoundedBorder(view: photoImageView , cornerRadius: 10.0 )
        self.setRoundedBorder(view: priceLabel, cornerRadius: 5.0)
    }
    
    func setRoundedBorder(view:UIView , cornerRadius:CGFloat)
    {
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
    }
    
    func setupColorAndFonts()
    {
        self.priceLabel.backgroundColor = ColorAndFontConstants.MainScreenColors.priceBackgroundColor
        
        self.priceLabel.textColor = ColorAndFontConstants.MainScreenColors.priceTitleColor
        self.priceLabel.font = ColorAndFontConstants.MainScreenFont.priceTitleFont
        
        self.name.textColor = ColorAndFontConstants.MainScreenColors.nameTitleColor
        self.name.font = ColorAndFontConstants.MainScreenFont.nameTitleFont
    }
}


