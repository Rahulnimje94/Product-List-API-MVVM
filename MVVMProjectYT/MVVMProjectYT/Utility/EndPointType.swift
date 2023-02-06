//
//  EndPointType.swift
//  MVVMProjectYT
//
//  Created by Rahul Nimje on 06/02/23.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path: String { get }
    var baseUrl: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get }
}

enum EndPointItems {
    case product
}

extension EndPointItems: EndPointType {
    
    var path: String {
        switch self {
        case .product:
            return "products"
        }
    }
    
    var baseUrl: String {
        return "https://fakestoreapi.com/"
    }
    
    var url: URL? {
        return URL(string: "\(baseUrl)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .product:
            return .get
        }
    }
    
}
