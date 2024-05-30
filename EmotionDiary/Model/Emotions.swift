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
}

enum Emotions: CaseIterable {
    case happy
    case love
    case like
    case embarrassed
    case upset
    case blue
    case bored
    case nervous
    case unfair
    
    var title: String {
        switch self {
        case .happy:
            return "행복해"
        case .love:
            return "사랑해"
        case .like:
            return "좋아해"
        case .embarrassed:
            return "당황해"
        case .upset:
            return "속상해"
        case .blue:
            return "우울해"
        case .bored:
            return "지루해"
        case .nervous:
            return "긴장해"
        case .unfair:
            return "억울해"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .happy:
            return UIImage(named: "slime1")
        case .love:
            return UIImage(named: "slime2")
        case .like:
            return UIImage(named: "slime3")
        case .embarrassed:
            return UIImage(named: "slime4")
        case .upset:
            return UIImage(named: "slime5")
        case .blue:
            return UIImage(named: "slime6")
        case .bored:
            return UIImage(named: "slime7")
        case .nervous:
            return UIImage(named: "slime8")
        case .unfair:
            return UIImage(named: "slime9")
        }
    }
}
