//
//  ImageCell.swift
//  testSnapKit
//
//  Created by Искандер Ситдиков on 28.12.2022.
//

import UIKit

//MARK: create UI

class ImageCell: UICollectionViewCell {
    
     let imageView : UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    let authorLabel : UILabel = {
        let authorLabel = UILabel()
        authorLabel.textColor = .white
        authorLabel.font = UIFont(name: "AppleSDGothicNeo-Regular",size: 14)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.numberOfLines = 0
        return authorLabel
        
    }()
    
    let authorIDLabel : UILabel = {
        let authorIDLabel = UILabel()
        authorIDLabel.textColor = #colorLiteral(red: 0.6666666269, green: 0.6666668057, blue: 0.67097193, alpha: 1)
        authorIDLabel.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
        authorIDLabel.translatesAutoresizingMaskIntoConstraints = false
        authorIDLabel.numberOfLines = 0
        return authorIDLabel
    }()
    
    
    func configure(cellModel: CellModel) {
        authorLabel.text = cellModel.authorName
        authorIDLabel.text = cellModel.authorID
        //FIXME: convert image to url
//        imageView.image = cellModel.imageURL
    }
    
    //MARK: Layout UI
    override init(frame: CGRect) {
        super.init(frame: frame)

//        contentView.snp.makeConstraints { make in
//            make.leftMargin.equalToSuperview().inset(100)
//        }
        contentView.addSubview(imageView)
        contentView.addSubview(authorLabel)
        contentView.addSubview(authorIDLabel)
        contentView.backgroundColor = .black
       
        
        
    }
    override func layoutSubviews() {
        constraintOfCellElements()
    }
    
    private func constraintOfCellElements() {
        
        imageView.snp.makeConstraints { make in
            make.left.equalTo(contentView)
            make.top.equalTo(contentView)
            make.right.equalTo(contentView).inset(100)
            make.bottom.equalTo(contentView)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView).inset(10)
            make.left.equalTo(imageView.snp_rightMargin).inset(-20)
            make.right.equalTo(contentView)
        }
        
        authorIDLabel.snp.makeConstraints { make in
            make.left.equalTo(authorLabel)
            make.top.equalTo(authorLabel).inset(40)
            make.right.equalTo(authorLabel)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


