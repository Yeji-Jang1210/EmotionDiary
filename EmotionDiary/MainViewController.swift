//
//  MainViewController.swift
//  EmotionDiary
//
//  Created by 장예지 on 5/18/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var emotionButtons: [UIButton]!
    @IBOutlet var emotionLabels: [UILabel]!
    
    let emotions = Emotions.allCases
    var counts: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        
        //background
        backgroundImageView.image = UIImage(named: "background")
        backgroundImageView.contentMode = .scaleAspectFill
        
        //navigationBar
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: nil)
        self.navigationItem.title = "감정 다이어리"
        
        if let data = UserDefaults.standard.array(forKey: "counts") as? [Int] {
            counts = data
        } else {
            counts = Array(repeating: 0, count: 9)
        }
        
        //buttons, labels
        for index in emotionButtons.indices {
            setEmotionUI(button: emotionButtons[index], label: emotionLabels[index], emotion: emotions[index], count: counts[index])
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        //클릭 횟수 올리기
        counts[sender.tag] += 1
        UserDefaults.standard.setValue(counts, forKey: "counts")
 
        emotionLabels[sender.tag].text = "\(emotions[sender.tag].title) \(counts[sender.tag])"
    }
    
    private func setEmotionUI(button: UIButton, label: UILabel, emotion: Emotions, count: Int){
        button.setImage(emotion.image, for: .normal)
        // "행복해 9"
        label.text = "\(emotion.title) \(count)"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
    }
    
}
