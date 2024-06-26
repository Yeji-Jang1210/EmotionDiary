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
    @IBOutlet var resetCountButton: UIButton!
    
    let emotions = Emotions.allCases
    var counts: [Int] = UserDefaultsManager.counts {
        didSet {
            print("hi")
            UserDefaultsManager.counts = counts
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setAction()
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
        
        setEmotionUI()
        
        //resetButton
        resetCountButton.setTitle("값을 초기화 할래요", for: .normal)
        resetCountButton.setTitleColor(.white, for: .normal)
        resetCountButton.tintColor = ColorManager.c_f28482
        resetCountButton.layer.cornerRadius = 15
        resetCountButton.backgroundColor = ColorManager.c_f5cac3
    }
    
    private func setAction(){
        resetCountButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    /* 실질적인 값 가져오도록 수정하기*/
    private func setEmotionUI(){
        //buttons, labels
        for index in emotionButtons.indices {
            setEmotionUI(button: emotionButtons[index], label: emotionLabels[index], emotion: emotions[index], count: counts[index])
        }
    }
    
    @objc private func resetButtonTapped(){
        let alert = UIAlertController(title: "설정", message: "초기화 하겠습니까?", preferredStyle: .alert)
        
        let acceptAction = UIAlertAction(title: "확인", style: .default){ action in
            self.resetCounts()
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .default)
        
        alert.addAction(cancelAction)
        alert.addAction(acceptAction)
        
        present(alert, animated: true)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        //클릭 횟수 올리기
        counts[sender.tag] += 1
        emotionLabels[sender.tag].text = "\(emotions[sender.tag].title) \(counts[sender.tag])"
    }
    
    private func setEmotionUI(button: UIButton, label: UILabel, emotion: Emotions, count: Int){
        button.setImage(emotion.image, for: .normal)
        // "행복해 9"
        label.text = "\(emotion.title) \(count)"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
    }
    
    private func resetCounts(){
        counts = Array(repeating: 0, count: 9)
        setEmotionUI()
    }
}
