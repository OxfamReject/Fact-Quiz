//
//  Question.swift
//  Fact Quiz
//
//  Created by Jo Thorpe on 23/06/2018.
//  Copyright © 2018 Oxfam Reject. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[questionNumber]
        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
       nextQuestion()
        
  
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: "+String(score)
        progressLabel.text = String(questionNumber+1)+" / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber+1)
        
      
    }
    

    func nextQuestion() {
        if questionNumber < allQuestions.list.count-1 {
            questionNumber+=1
            questionLabel.text = allQuestions.list[questionNumber].questionText
        } else {
            print("End of quiz")
            let alert = UIAlertController(title: "Your score was " + String(score), message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in self.startOver()})
            
            alert.addAction(restartAction)
            present(alert,animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            ProgressHUD.showSuccess("Correct")
            score+=1
            
        } else {
            ProgressHUD.showError("Incorrect")
        }
        updateUI()
    }
    
    
    func startOver() {
       questionNumber = 0
        score = 0
        updateUI()
        nextQuestion()
    }
    

    
}
