//
//  NetworkMapper.swift
//  testSnapKit
//
//  Created by Vadim Chistiakov on 10.01.2023.
//

import Foundation

class NetworkMapper {
    
    func mapResponse(data: Data) -> [ImagesModel] {
        
        let imagesModel = try? JSONDecoder().decode([ImagesModel].self, from: data)
        return imagesModel ?? []
    }
}
