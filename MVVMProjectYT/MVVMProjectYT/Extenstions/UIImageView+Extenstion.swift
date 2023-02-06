//
//  UIImageView+Extenstion.swift
//  MVVMProjectYT
//
//  Created by Rahul Nimje on 05/02/23.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
