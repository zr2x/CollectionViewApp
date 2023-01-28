//
//  ImageViewModel.swift
//  testSnapKit
//
//  Created by Искандер Ситдиков on 28.12.2022.
//

import Foundation

class ImageViewModel {
    var dataSourceArray : [CellModel] = []
    
    private let client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
    }

    func fetchImages() {
        client.fetchImages { [weak self] result in
            switch result {
            case .success(let imagesModel):
                self?.dataSourceArray = imagesModel.compactMap { modelOfArray in
                    CellModel(authorName: "Author name: \(modelOfArray.user.username)",
                              authorID: "Photo ID: \(modelOfArray.id)",
                              imageURL: URL(string: modelOfArray.urls.regular) ?? someURL)
                    
                }
                
                
            case .failure(let error):
                switch error {
                case .failedURL:
                    break
                case .common:
                    break
                case .dataNotExist:
                    break
                case .selfNotExist:
                    break
                }
            }
        }
    }
    
}

let someURL = URL(string: "google.com")!


