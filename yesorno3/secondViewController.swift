//
//  secondViewController.swift
//  yesorno3
//
//  Created by ict on 15/11/2561 BE.
//  Copyright © 2561 ICTSUIM. All rights reserved.
//

import Foundation
import UIKit

class secondViewController: UIViewController {
    
    @IBOutlet weak var time: UILabel!
    var timer = Timer()
    var limitTime = 0
    var checkStatusToPlay = false
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var imageColor: UIImageView!
    var randomDiceIndex1 : Int = 0
    var diceArray = ["gt10","gt20","gt30","gt40","gt50","gt60"]
    @IBOutlet weak var questionLabel: UILabel!
    let allQuestion = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score1 : Int = 0
    var score2 : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(secondViewController.processTimer), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
         updateUI()
        questionLabel.backgroundColor = UIColor.white
    }
   
    var timeCount = 15
    
    @objc func processTimer(){
        // Local Scope
        //อยู่ในฟังก์ชัน เรียกใช้ได้เฉพาะในฟังก์ชันเท่านั้น
        
        print("A second has passed")
        
        if timeCount > 0{
            timeCount  -= 1
            time.text = " Time :" + String(timeCount)
        }else{
            timer.invalidate()
        }
        
        print (timeCount)
        //labelResult.text = "\(timeCount)"
        time.text = String(timeCount) //Casting
        
    }
    
    @IBAction func answerPressed(_ sender: Any) {
        if timeCount > 0 {
            if (sender as AnyObject).tag == 1 {
                print("picked true")
                pickedAnswer = true
                
            }else if (sender as AnyObject).tag == 2{
                print("picked false")
                pickedAnswer = false
            }
            checkAnswer()
            questionNumber = questionNumber+1
            updateUI()
            changeDiceFace()
        }
    }//end function answerPressed
    
    
    
    func checkAnswer(){
        let correctAnswer = allQuestion.list[questionNumber].answer
        if correctAnswer == pickedAnswer {
            print("you got it")
            score1 = score1 + 1
            ProgressHUD.showSuccess("ถูกต้องนะครับ")
            
        }else {
            print("Wrong!")
            score2 = score2 + 1
            ProgressHUD.showError("ตอบผิดนะครับ")
        }
        
    }// end checkAnswer
    func startOver(){
        questionNumber = 0
        score1 = 0
        score2 = 0
        timeCount = 15
        updateUI()
        
    }//end startOver
    
    func nextQuestion(){
        if questionNumber <= 9 {
            questionLabel.text = allQuestion.list[questionNumber].questionText
        } else {
            print("end of question")
            let alert = UIAlertController(title: "Awsome", message: "You are finished all the question, do you want to stsrt over? คะแนนของคุณคือ \(score1)", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {
                UIAlertAction in self.startOver()
            })
            alert.addAction(restartAction)
            present(alert,animated: true, completion: nil)
        }
    }//nextQuestion
    

    
    func updateUI(){
        score.text = "Score:" + "\(score1)"
        nextQuestion()
        
        
    }//updateUI
    func changeDiceFace(){ //ฟังก์ชันให้มันเปลี่ยนหน้า
        randomDiceIndex1 = Int(arc4random_uniform(6))
        imageColor.image = UIImage(named:diceArray[randomDiceIndex1])
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        changeDiceFace()
    }
}
