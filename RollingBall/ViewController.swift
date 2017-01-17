//
//  ViewController.swift
//  RollingBall
//
//  Created by techmaster on 1/9/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ball = UIImageView()
    let ballRadius: CGFloat = 32.0
    var angle = 1 * CGFloat(M_PI/180)
    var timer1 = Timer()
    var timer2 = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        startTimer1()
    }
    
    func startTimer1() {
        timer1 = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(ViewController.rollBallLeftToRight), userInfo: nil, repeats: true)
    }
    
    func stopTimer1() {
        timer1.invalidate()
    }
    
    func addBall() {
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ball.frame.size = CGSize(width: ballRadius*2, height: ballRadius*2)
        ball.center = CGPoint(x: ballRadius, y: self.view.bounds.height/2)
        view.addSubview(ball)
    }
    
    func rollBallLeftToRight() {
        ball.transform = self.ball.transform.rotated(by: angle)
        ball.center = CGPoint(x: ball.center.x + ballRadius * angle, y: ball.center.y)
        if ball.center.x >= view.bounds.size.width - ballRadius {
            stopTimer1()
            timer2 = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(ViewController.rollBallRightToLeft), userInfo: nil, repeats: true)
        }
    }
    
    func rollBallRightToLeft() {
        ball.transform = self.ball.transform.rotated(by: -angle)
        ball.center = CGPoint(x: ball.center.x - ballRadius * angle, y: ball.center.y)
        if ball.center.x <= ballRadius {
            timer2.invalidate()
            startTimer1()
        }
    }
}

