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
    
    var emotions: [Emotion] = [
        Emotion(name: "행복해", image: UIImage(named: "slime1")),
        Emotion(name: "사랑해", image: UIImage(named: "slime2")),
        Emotion(name: "좋아해", image: UIImage(named: "slime3")),
        Emotion(name: "당황해", image: UIImage(named: "slime4")),
        Emotion(name: "속상해", image: UIImage(named: "slime5")),
        Emotion(name: "우울해", image: UIImage(named: "slime6")),
        Emotion(name: "긴장해", image: UIImage(named: "slime7")),
        Emotion(name: "지루해", image: UIImage(named: "slime8")),
        Emotion(name: "억울해", image: UIImage(named: "slime9"))
    ]
    
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
        
        //buttons, labels
        for index in emotionButtons.indices {
            setEmotionUI(button: emotionButtons[index], label: emotionLabels[index], emotion: emotions[index])
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        //클릭 횟수 올리기
        emotions[sender.tag].count += 1
        
        //랜덤으로 숫자 보여지기
        //emotions[sender.tag].count = Int.random(in: 0...100)
        emotionLabels[sender.tag].text = emotions[sender.tag].tapResult
    }
    
    private func setEmotionUI(button: UIButton, label: UILabel, emotion: Emotion){
        button.setImage(emotion.image, for: .normal)
        label.text = emotion.tapResult
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
    }
    
}
