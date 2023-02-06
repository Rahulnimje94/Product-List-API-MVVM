//
//  ProductViewModel.swift
//  MVVMProjectYT
//
//  Created by Rahul Nimje on 05/02/23.
//

import Foundation

final class ProductViewModel {
    
    var products: [Product] = []
    
    // Data Binding via Clouser
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchProducts() {
        self.eventHandler?(.loading)
        APIManager.shared.request(
            modelType: [Product].self,
            type: EndPointItems.product) { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                self.products = products
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
            }
        }
    }
    /*
     func fetchProducts() {
         self.eventHandler?(.loading)
         APIManager.shared.fetchProducts { response in
             self.eventHandler?(.stopLoading)
             switch response {
             case .success(let products):
                 self.products = products
                 self.eventHandler?(.dataLoaded)
             case .failure(let error):
                 self.eventHandler?(.error(error))
             }
         }
     }
     */

}


extension ProductViewModel {
    
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
