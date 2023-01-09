//
//  ViewController.swift
//  testSnapKit
//
//  Created by Искандер Ситдиков on 28.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var viewModel = ImageViewModel()
    
    lazy var collectionView : UICollectionView = {
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: "Cell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1333333254, green: 0.1333333254, blue: 0.1333333254, alpha: 1)
        view.addSubview(collectionView)
        collectionView.backgroundColor = #colorLiteral(red: 0.1333333254, green: 0.1333333254, blue: 0.1333333254, alpha: 1)
        
        
        collectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
            make.top.bottom.equalToSuperview()
        }
        
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 10) / 2
        
        
        return CGSize(width: width, height: (width - 30) / 2)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = viewModel.dataSourceArray[indexPath.item]
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ImageCell else { return .init() }
        cell.configure(cellModel: cellViewModel)
        cell.backgroundColor = .black
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.dataSourceArray.count
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10)
        
        
    }
    //FIXME: header func
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! Header
        header.nameTitle = "Photo"
        return header
        
}

    
}


//MARK: trying creat header
class Header: UICollectionReusableView {
    
        let nameLabel: UILabel = {
               let label = UILabel()
               label.numberOfLines = 1
               label.font = UIFont.systemFont(ofSize: 18)
               label.sizeToFit()
               label.textAlignment = .left
               label.translatesAutoresizingMaskIntoConstraints = false
               return label
           }()
    
    var nameTitle: String? {
            didSet {
                nameLabel.text = nameTitle
            }

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
//            make.edges.equalTo()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



