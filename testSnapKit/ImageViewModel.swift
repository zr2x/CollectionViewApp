//
//  ImageViewModel.swift
//  testSnapKit
//
//  Created by Искандер Ситдиков on 28.12.2022.
//

import Foundation

class ImageViewModel {
    let dataSourceArray : [CellModel] = [CellModel(authorName: "Author: Vladislav", authorID: "Photo ID: 1234567", imageURL: someURL!), CellModel(authorName: "Authour: Maksim", authorID: "Photo ID: 7654321", imageURL: someURL!), CellModel(authorName: "Authour: Viktor", authorID: "Photo ID: 0987654", imageURL: someURL!), CellModel(authorName: "Author: somesome", authorID: "Photo ID: 0123456", imageURL: someURL!)]
    // create Array with param
    // myAPI = 32429265-cb3e24df40f343b0f6ba5900a
    
    private let client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
    }

    func fetchImages() {
        client.fetchImages { result in
            switch result {
            case .success(let imagesModel):
                // imagesModel преобразовать в [CellModel] и результат положить dataSourceArray
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

let someURL = URL(string: "google.com")


