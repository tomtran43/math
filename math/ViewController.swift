//
//  ViewController.swift
//  math
//
//  Created by Loc Tran on 2/6/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label_p1: UILabel!
    @IBOutlet weak var label_p2: UILabel!
    
    @IBOutlet weak var button_p1: UIButton!
    @IBOutlet weak var button_p2: UIButton!
    @IBOutlet weak var button_p3: UIButton!
    
    @IBOutlet weak var label_sign: UILabel!
    
    @IBOutlet weak var label_right: UILabel!
    @IBOutlet weak var label_wrong: UILabel!
    
    @IBOutlet weak var label_time: UILabel!
    
    var right: Int = 0
    var wrong: Int = 0
    
    var counter = 10
    var myTimer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRandom()
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        start()
    }
    
    func updateCounter(){
        if counter > 0{
            counter -= 1
        }else{
            wrong = wrong + 1
            label_wrong.text = String("Wrong: \(wrong)")
            counter = 10
            setRandom()
        }
        label_time.text = String("Time: \(counter)")
    }
    
    @IBAction func button_action(_ sender: UIButton) {
        checkResult(sender)
        start()
        setRandom()
        
    }
    
    func reset (){
        myTimer.invalidate()
    }
    
    func start (){
        counter = 10
    }
    
    
    //Kiem tra ket qua
    func checkResult (_ sender: UIButton){
        if label_sign.text == String("+"){
            let result = add(p1: Int(label_p1.text!)!, p2: Int(label_p2.text!)!)
            if Int(sender.currentTitle!)! == result{
                right = right + 1
                label_right.text = String("Right: \(right)")
            }else{
                wrong = wrong + 1
                label_wrong.text = String("Wrong: \(wrong)")
            }
        }else if label_sign.text == String("-"){
            let result = sub(p1: Int(label_p1.text!)!, p2: Int(label_p2.text!)!)
            if Int(sender.currentTitle!)! == result{
                right = right + 1
                label_right.text = String("Right: \(right)")
            }else{
                wrong = wrong + 1
                label_wrong.text = String("Wrong: \(wrong)")
            }
        }else if label_sign.text == String("*"){
            let result = mulp(p1: Int(label_p1.text!)!, p2: Int(label_p2.text!)!)
            if Int(sender.currentTitle!)! == result{
                right = right + 1
                label_right.text = String("Right: \(right)")
            }else{
                wrong = wrong + 1
                label_wrong.text = String("Wrong: \(wrong)")
            }
        }
        
    }
    
    
    func setRandom(){
        //Lay 2 so random
        
        let random1 = Int(arc4random_uniform(10))
        let random2 = Int(arc4random_uniform(10))
        
        //Hien thi 2 so random len view
        label_p1.text = String(random1)
        label_p2.text = String(random2)
        
        
        let randomMath = Int(arc4random_uniform(3))
        if randomMath == 0{
            label_sign.text = String("+")
        }else if randomMath == 1{
            label_sign.text = String("-")
        }else{
            label_sign.text = String("*")
        }

        setResult(randomA: random1, randomB: random2, randomC: randomMath)
        
        label_time.text = String("Time: \(counter)")

    }
    //Hien thi ket qua
    func setResult(randomA: Int, randomB: Int, randomC: Int){
        if randomC == 0{
            let pos = Int(arc4random_uniform(3)) //random vi tri
            
            if pos == 0{
                button_p1.setTitle(String(add(p1: randomA, p2: randomB)), for: .normal)
                button_p2.setTitle(String(sub(p1: randomA, p2: randomB)), for: .normal)
                button_p3.setTitle(String(mulp(p1: randomA, p2: randomB)), for: .normal)
            }else if pos == 1{
                button_p2.setTitle(String(add(p1: randomA, p2: randomB)), for: .normal)
                button_p1.setTitle(String(sub(p1: randomA, p2: randomB)), for: .normal)
                button_p3.setTitle(String(mulp(p1: randomA, p2: randomB)), for: .normal)
            }else{
                button_p3.setTitle(String(add(p1: randomA, p2: randomB)), for: .normal)
                button_p2.setTitle(String(sub(p1: randomA, p2: randomB)), for: .normal)
                button_p1.setTitle(String(mulp(p1: randomA, p2: randomB)), for: .normal)
            }
        }else if randomC == 1{
            let pos = Int(arc4random_uniform(3)) //random vi tri
            
            if pos == 0{
                button_p1.setTitle(String(sub(p1: randomA, p2: randomB)), for: .normal)
                button_p2.setTitle(String(add(p1: randomA, p2: randomB)), for: .normal)
                button_p3.setTitle(String(mulp(p1: randomA, p2: randomB)), for: .normal)
            }else if pos == 1{
                button_p2.setTitle(String(sub(p1: randomA, p2: randomB)), for: .normal)
                button_p1.setTitle(String(add(p1: randomA, p2: randomB)), for: .normal)
                button_p3.setTitle(String(mulp(p1: randomA, p2: randomB)), for: .normal)
            }else{
                button_p3.setTitle(String(sub(p1: randomA, p2: randomB)), for: .normal)
                button_p2.setTitle(String(add(p1: randomA, p2: randomB)), for: .normal)
                button_p1.setTitle(String(mulp(p1: randomA, p2: randomB)), for: .normal)
            }
        }else if randomC == 2{
            let pos = Int(arc4random_uniform(3)) //random vi tri
            
            if pos == 0{
                button_p1.setTitle(String(mulp(p1: randomA, p2: randomB)), for: .normal)
                button_p2.setTitle(String(add(p1: randomA, p2: randomB)), for: .normal)
                button_p3.setTitle(String(sub(p1: randomA, p2: randomB)), for: .normal)
            }else if pos == 1{
                button_p2.setTitle(String(mulp(p1: randomA, p2: randomB)), for: .normal)
                button_p1.setTitle(String(add(p1: randomA, p2: randomB)), for: .normal)
                button_p3.setTitle(String(sub(p1: randomA, p2: randomB)), for: .normal)
            }else{
                button_p3.setTitle(String(mulp(p1: randomA, p2: randomB)), for: .normal)
                button_p2.setTitle(String(add(p1: randomA, p2: randomB)), for: .normal)
                button_p1.setTitle(String(sub(p1: randomA, p2: randomB)), for: .normal)
            }
        }
    }
    
    //Tinh +
    func add(p1: Int, p2: Int) -> Int{
        return (p1 + p2)
    }
    
    //Tinh -
    func sub(p1: Int, p2: Int) -> Int{
        return (p1 - p2)
    }
    
    //Tinh *
    func mulp(p1: Int, p2: Int) -> Int{
        return (p1 * p2)
    }
    
    
    
}

