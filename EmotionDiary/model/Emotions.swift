//
//  Emotions.swift
//  EmotionDiary
//
//  Created by 장예지 on 5/18/24.
//

import Foundation
import UIKit

struct Emotion {
    var name: String
    var image: UIImage?
    var count: Int = 0
    var tapResult: String {
        get {
            return "\(name) \(count == 0 ? "" : "\(count)")"
        }
    }
}
