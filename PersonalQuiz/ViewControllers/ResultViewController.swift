//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Olga Tegza on 11.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Избавиться от кнопки возврата назад на экране результатов
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты в соотвствии с этим животным
    
    
    //MARK: - IBOutlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var answersChoosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
    }
    
    //MARK: - IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension ResultViewController {
    
    private func calculateResult() {
        var distributionOfAnswers: [Animal: Int] = [:]
        let answersChosenAnimals = answersChoosen.map{ $0.animal }

        for animal in answersChosenAnimals {
            distributionOfAnswers[animal] = (distributionOfAnswers[animal] ?? 0) + 1
        }

        let sortedDistributionOfAnswers = distributionOfAnswers.sorted { $0.value > $1.value }

        guard let mostFrequentAnswer = sortedDistributionOfAnswers.first?.key else { return }

        resultLabel.text = "Вы - \(mostFrequentAnswer.rawValue)!"
        resultDefinitionLabel.text = mostFrequentAnswer.definition
    }
}
