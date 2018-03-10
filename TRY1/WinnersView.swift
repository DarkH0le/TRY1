//
//  WinnersView.swift
//  TRY1
//
//  Created by Ivan Aldama on 08/03/18.
//  Copyright © 2018 Ivan Aldama. All rights reserved.
//

import UIKit

class WinnersView: UIViewController {
    
    //Creation off arrays to hold the different types of contrains for each modal H:C-W:C and H:R-W:C
    var portCons:Array<NSLayoutConstraint> = []
    var landCons:Array<NSLayoutConstraint> = []
    
    //Creating the UI elements
    //Tip: the {} is referred as a clouser , or and anonimus function. and the and because is a function you called with the ()
    let labelWinner : UILabel = {
        let newlabel = UILabel()
        newlabel.text = "DO YOU WANT TO PLAT ROCK PAPER AND SCISSORS?"
        newlabel.translatesAutoresizingMaskIntoConstraints = false
        newlabel.lineBreakMode = .byWordWrapping
        newlabel.numberOfLines = 0
        newlabel.textAlignment = .center
        newlabel.font = UIFont.boldSystemFont(ofSize: 18)
        return newlabel
    }()
    
    let square: UIView = {
        let newview = UIView()
        newview.backgroundColor = UIColor.cyan
        newview.translatesAutoresizingMaskIntoConstraints = false
        return newview
    }()
    
    let playAgainBtn : UIButton = {
       let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("PlAY" , for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.backgroundColor = UIColor.cyan
        btn.layer.cornerRadius = 3
        btn.layer.shadowOpacity = 0.8
        btn.layer.shadowOffset = CGSize(width: 3, height: 2)
        btn.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
        return btn
    }()
    
    //Function that show the image to picke and option
    @objc func playAgain() -> Void{
        let viewMain:ViewController = ViewController()
        present(viewMain, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.brown
        
        //Setup al the UI elements, constrains, addsuviews,etc,autolayout,etc.
        setViews()

    }
    
    func setViews() -> Void {
        
        //Adding views
        view.addSubview(labelWinner)
        view.addSubview(square)
        square.addSubview(playAgainBtn)

        //Cons for land and port
        self.portCons = [
            //Setting the label
            labelWinner.topAnchor.constraintLessThanOrEqualToSystemSpacingBelow(view.topAnchor, multiplier: 20),
            labelWinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelWinner.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -15),
            //Setting the squere view for the botton
            square.widthAnchor.constraint(equalTo: view.widthAnchor),
            square.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            square.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            square.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //setting the botton
            playAgainBtn.heightAnchor.constraint(greaterThanOrEqualToConstant: 36),
            playAgainBtn.widthAnchor.constraint(greaterThanOrEqualToConstant: 88),
            playAgainBtn.centerXAnchor.constraint(equalTo: square.centerXAnchor),
            playAgainBtn.centerYAnchor.constraint(equalTo: square.centerYAnchor)]
        
        self.landCons = [
            //Setting the label
            labelWinner.topAnchor.constraintLessThanOrEqualToSystemSpacingBelow(view.topAnchor, multiplier: 20),
            labelWinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelWinner.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -15),
            //Setting the squere view for the botton
            square.widthAnchor.constraint(equalTo: view.widthAnchor),
            square.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            square.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            square.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //setting the botton
            playAgainBtn.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            playAgainBtn.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),
            playAgainBtn.centerXAnchor.constraint(equalTo: square.centerXAnchor),
            playAgainBtn.centerYAnchor.constraint(equalTo: square.centerYAnchor)]
        
        NSLayoutConstraint.activate(portCons)
    }

    //Notifies the container that its trait collection changed.
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {

        //Check if the phone is in land or port mode
        if newCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact && newCollection.verticalSizeClass == UIUserInterfaceSizeClass.compact {
            print("\n\n\nProbablemente estes en landscape")
            NSLayoutConstraint.deactivate(portCons)
            NSLayoutConstraint.activate(landCons)
        }else{
            print("\n\n\nProbablemente estes en portrait")
            NSLayoutConstraint.deactivate(landCons)
            NSLayoutConstraint.activate(portCons)
            
        }
        
    }
}

//extention for implementin the delegate
extension WinnersView: winnerDelegate {
    func valueSelected(value: String) {
        labelWinner.text = value
    }
}

