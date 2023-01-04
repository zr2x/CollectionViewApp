//
//  ImageCell.swift
//  testSnapKit
//
//  Created by Искандер Ситдиков on 28.12.2022.
//

import UIKit

//TODO: create image/ create title/

class ImageCell: UICollectionViewCell {
    let imageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let authorLabel : UILabel = {
        let authorLabel = UILabel()
        authorLabel.textColor = .white
        authorLabel.font = UIFont(name: "AppleSDGothicNeo-Regular",size: 15)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.text = "Some Authour"
        return authorLabel
        
    }()
    
    let authorIDLabel : UILabel = {
        let authorIDLabel = UILabel()
        authorIDLabel.textColor = #colorLiteral(red: 0.6666666269, green: 0.6666668057, blue: 0.67097193, alpha: 1)
        authorIDLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 13)
        authorIDLabel.translatesAutoresizingMaskIntoConstraints = false
        authorIDLabel.text = "SomeID "
        return authorIDLabel
    }()
    
    
    func configure(cellModel: CellModel) {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(authorLabel)
        contentView.addSubview(authorIDLabel)
        constraintOfCellElements()
        
    }
    
    private func constraintOfCellElements() {
        
        imageView.snp.makeConstraints { make in
            make.left.equalTo(contentView)
            make.top.equalTo(contentView)
            make.right.equalTo(contentView)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView).inset(30)
            make.left.equalTo(imageView.snp_rightMargin).inset(30)
        }
        
        authorIDLabel.snp.makeConstraints { make in
            make.left.equalTo(authorLabel)
            make.top.equalTo(authorLabel).inset(40)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


