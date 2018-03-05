//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var picked : Bool = false
    var questionNum : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            picked = true
        }
        else if sender.tag == 2 {
            picked = false
        }
        checkAnswer()
        // Continue on to next question
        questionNum += 1
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNum + 1) / 13"
        
        print("Update UI: q\(questionNum)")
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNum + 1)
        print("\(progressBar.frame.size.width)")
    }
    

    func nextQuestion() {
        
        if questionNum < allQuestions.list.count {
            questionLabel.text = allQuestions.list[questionNum].questionText
            updateUI()
        } else {
            let alert = UIAlertController(title: "Awesome!", message: "Would you like to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    
    func checkAnswer() {
        if picked == allQuestions.list[questionNum].answer {
            ProgressHUD.showSuccess("Correct")
            score += 1
        } else {
            ProgressHUD.showError("Incorrect!")
        }
    }
    
    
    func startOver() {
        questionNum = 0
        score = 0
        nextQuestion()
    }
    

    
}
