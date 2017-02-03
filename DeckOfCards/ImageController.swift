//
//  ImageController.swift
//  DeckOfCards
//
//  Created by Nicholas Ellis on 2/3/17.
//  Copyright © 2017 Nicholas Ellis. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    static func image(forUrl url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else { fatalError("Image url optional is nil") }
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: nil, body: nil) { (data, error) in
            guard let data = data,
                let image = UIImage(data: data) else { completion(nil)
                    return }
            DispatchQueue.main.async {
                completion(image)
                
            }
        }
    }
}
