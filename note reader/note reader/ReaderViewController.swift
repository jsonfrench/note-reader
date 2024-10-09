//
//  ViewController.swift
//  note reader
//
//  Created by Jason R. French on 10/7/24.
//

import UIKit

class ReaderViewController: UIViewController {

    @IBOutlet weak var note: UIImageView!
    
    @IBOutlet weak var new_note: UIButton!
    
    @IBOutlet weak var hide_note: UIButton!
    
    @IBOutlet weak var note_top: NSLayoutConstraint!
    
    @IBOutlet weak var note_letter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("view loaded!")
    }
    
    var previous_index = 0
    
    
    @IBAction func moveNote(_ sender: Any) {
        //print("button pressed!")
        //note.center = CGPoint(x: 150.0, y: Double.random(in: 150...350))
        //note.center = CGPoint(x: 200.0, y: 200)
        //note.center = note_positions["F"]!
        //step += 1
        //print("step", step)
        //note_top.constant = step //Double.random(in: 40...41)
        var note_index:Int = Int.random(in: 0...note_positions.count-1)
        print("index:",note_index,"previous:",previous_index)
        if note_index == previous_index {
            note_index = (note_index + note_positions.count/2)%note_positions.count
            print("avoided repeat! new index:",note_index)
        }
        previous_index = note_index
        note_top.constant = note_positions[note_index]
        note_letter.text = note_values[note_index]
    }
    
    var hidden = -1
    
    @IBAction func hide_note(_ sender: Any) {
        //print("hide note pressed!")
        hidden *= -1
        if hidden == 1 {
            note_letter.isHidden = true
            hide_note.setTitle("Show Note", for: .normal)
        } else {
            note_letter.isHidden = false
            hide_note.setTitle("Hide Note", for: .normal)
        }
    }
    
    let note_positions : [CGFloat] = [
        // Treble
        32,  // G
        40,  // F
        50,  // E
        60,  // D
        69,  // C
        77,  // B
        87,  // A
        96,  // G
        106, // F
        114, // E
        123, // D
        // 132, // C <-- need a line here
        
        // Bass
        222, // B
        230, // A
        241, // G
        250, // F
        260, // E
        268, // D
        279, // C
        287, // B
        297, // A
        306, // G
        315  // F
    ]
    
    let note_values = [
        //Treble
        "G",
        "F",
        "E",
        "D",
        "C",
        "B",
        "A",
        "G",
        "F",
        "E",
        "D",
        //Bass
        "B",
        "A",
        "G",
        "F",
        "E",
        "D",
        "C",
        "B",
        "A",
        "G",
        "F"
        ]
}

