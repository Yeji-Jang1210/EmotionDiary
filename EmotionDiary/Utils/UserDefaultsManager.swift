//
//  UserDefaultsManager.swift
//  EmotionDiary
//
//  Created by 장예지 on 5/30/24.
//

import UIKit

struct UserDefaultsManager {
    static var counts: [Int] {
        get {
            return UserDefaults.standard.array(forKey: "counts") as? [Int] ?? Array(repeating: 0, count: 9)
        }
        
        set{
            return UserDefaults.standard.setValue(newValue, forKey: "counts")
        }
    }
}

struct ColorManager {
    static var c_f28482: UIColor { return UIColor(named:"c_f28482") ?? .darkGray }
    static var c_f5cac3: UIColor { return UIColor(named:"c_f5cac3") ?? .black }
}
