//
//  NetworkMapper.swift
//  testSnapKit
//
//  Created by Vadim Chistiakov on 10.01.2023.
//

import Foundation

class NetworkMapper {
    
    // JsonDecoder
    
    func mapResponse(data: Data) -> [ImagesModel] {
        // как преобразовать Data в кастомные структуры
        let imagesModel = try? JSONDecoder().decode([ImagesModel].self, from: data)
        
        return imagesModel ?? []
    }
}
