//
//  NetworkClient.swift
//  testSnapKit
//
//  Created by Искандер Ситдиков on 10.01.2023.
//

import UIKit

enum CustomError: Error {
    case common, failedURL
}

protocol NetworkClient {
    
    func fetchImages() -> Result<ImagesModel, CustomError>
}

class NetworkClientImp: NetworkClient {
    
    func fetchImages() -> Result<ImagesModel, CustomError> {
        
        guard let url = URL(string: "https://api.unsplash.com/photos/?client_id=Ex-lIJXsI3n-yGeyV1jCJ0Mm_pysLRYz0PRa4srNXY0") else { return .failure(.failedURL)}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            
        }.resume()
    }
    

    
}
