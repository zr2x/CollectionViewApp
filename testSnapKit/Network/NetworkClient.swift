//
//  NetworkClient.swift
//  testSnapKit
//
//  Created by Искандер Ситдиков on 10.01.2023.
//

import UIKit

// типо ошибок, разный тип может быть обработан по разному
enum CustomError: Error {
    case common, failedURL, dataNotExist, selfNotExist
}

protocol NetworkClient {
    
    // запрашиваем данные ассихронно, ответ или ошибка возвращается через замыкание
    func fetchImages(complition: @escaping (Result<[ImagesModel], CustomError>) -> Void)
}

class NetworkClientImp: NetworkClient {
    
    private let mapper: NetworkMapper
    
    init(mapper: NetworkMapper) {
        self.mapper = mapper
    }
    
    func fetchImages(complition: @escaping (Result<[ImagesModel], CustomError>) -> Void) {
        guard let url = URL(string: "https://api.unsplash.com/photos/?client_id=Ex-lIJXsI3n-yGeyV1jCJ0Mm_pysLRYz0PRa4srNXY0") else {
            complition(.failure(.failedURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self else {
                return complition(.failure(.selfNotExist))
            }
            
            guard let data else {
                return complition(.failure(.dataNotExist))
            }
            let imagesModel = self.mapper.mapResponse(data: data)
            complition(.success(imagesModel))
        }.resume()
    }

    
}
