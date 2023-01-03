//
//  ImageCell.swift
//  testSnapKit
//
//  Created by Искандер Ситдиков on 28.12.2022.
//

import UIKit

class ImageCell: UICollectionViewCell {
    let imageView : UIImageView = {
        //TODO: create image/ create title/
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    let authorLabel : UILabel = {
        let authorLabel = UILabel()
        authorLabel.textColor = .white
        authorLabel.font = UIFont(name: "AppleSDGothicNeo-Regular",size: 15)
        return authorLabel
        
    }()
    
    let authorIDLabel : UILabel = {
        let authorIDLabel = UILabel()
        authorIDLabel.textColor = #colorLiteral(red: 0.6666666269, green: 0.6666668057, blue: 0.67097193, alpha: 1)
        authorIDLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 13)
        return authorIDLabel
    }()
    
    func layoutUI() {
        
    }
    
    func configure(cellModel: CellModel) {
        
    }
}


