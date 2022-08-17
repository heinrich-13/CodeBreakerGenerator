//
//  ViewController.swift
//  Code Breaker Generator
//
//  Created by Heinrich Stoltz on 2019/1/15.
//  Copyright © 2019 Heinrich Stoltz. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var TxtboxInput: NSTextField!
    @IBOutlet weak var TxtboxOuput: NSTextField!
    @IBOutlet weak var MultyTxtOutput: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    @IBAction func btnGenerate(_ sender: NSButton) {
        let inputCode = TxtboxInput.stringValue
        let check = MultyTxtOutput.stringValue
        let numberCharacters = NSCharacterSet.decimalDigits
        if inputCode.isEmpty || inputCode.rangeOfCharacter(from: numberCharacters) != nil{
            MultyTxtOutput.stringValue = "Type something useful spaka!!"
        } else{
            let numberOf = inputCode.count
            var loop = 0
            let pidgeonCode = ["@", "s", "a", "t", "p", "i", "n", "m", "d", "g", "o", "c", "k", "e", "u", "r", "h", "b", "f", "l", "j", "v", "w", "x", "y", "z", "q", "y"]
            if check.isEmpty || MultyTxtOutput.stringValue == "Type something useful spaka!!"{
                var wordcode = ""
                while loop < numberOf{
                    let x = inputCode.index(inputCode.startIndex, offsetBy: loop)
                    let result = inputCode[x]
                    let location = pidgeonCode.index(of:"\(result)")
                    if loop == 0{
                        wordcode = wordcode + " \(location!)"
                    }else{
                        wordcode = wordcode + " - \(location!)"
                    }
                    loop = loop + 1
                }
                MultyTxtOutput.stringValue = wordcode
            } else{
                let previousWord = MultyTxtOutput.stringValue
                var wordcode = previousWord + "\n"
                while loop < numberOf{
                    let x = inputCode.index(inputCode.startIndex, offsetBy: loop)
                    let result = inputCode[x]
                    let location = pidgeonCode.index(of:"\(result)")
                    if loop == 0{
                        wordcode = wordcode + " \(location!)"
                    }else{
                        wordcode = wordcode + " - \(location!)"
                    }
                    loop = loop + 1
                }
                MultyTxtOutput.stringValue = wordcode
            }
            
            
        }
        TxtboxInput.stringValue = ""
    }

    @IBAction func BtnDelete(_ sender: Any) {
        MultyTxtOutput.stringValue = ""
        TxtboxInput.stringValue = ""
    }
    
    
    @IBAction func btnSave(_ sender: Any) {
        let myText = MultyTxtOutput.stringValue
         // get URL to the the documents directory in the sandbox
         let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as NSURL
         
         // add a filename
         let fileUrl = documentsUrl.appendingPathComponent("CodeBreakerPage.txt")
        
        do {
            // write to it
            try myText.write(to: fileUrl!, atomically: true, encoding: String.Encoding.utf8)
            let alert:NSAlert = NSAlert();
            alert.messageText = "Document Saved";
            alert.informativeText = "\(fileUrl!)";
            alert.runModal();
            MultyTxtOutput.stringValue = ""
        } catch {
            let alert:NSAlert = NSAlert();
            alert.messageText = "Document Not Saved";
            alert.informativeText = "failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding";
            alert.runModal();
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
        }
        
    }
}

