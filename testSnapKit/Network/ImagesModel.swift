//
//  ImagesModel.swift
//  testSnapKit
//
//  Created by Искандер Ситдиков on 10.01.2023.
//

import Foundation

//MARK: - ImageModel
struct ImagesModel: Decodable {
    // посмотреть АПИ и разобраться в каком формате отдаются данные
    let id: String?
    let width: Int?
    let height: Int?
    let user: User
}

//MARK: User
struct User: Decodable {
    let id: String?
    let username: String?
}

// MARK: - ProfileImage
struct ProfileImage: Decodable {
    let small, medium, large: String
}
