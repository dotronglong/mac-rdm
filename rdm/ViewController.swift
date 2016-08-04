//
//  ViewController.swift
//  rdm
//
//  Created by Long Do on 8/4/16.
//  Copyright © 2016 Long Do. All rights reserved.
//

import Cocoa
import Darwin

class ViewController: NSViewController {

    @IBOutlet weak var btnDownload: NSButton!
    @IBOutlet weak var textLink: NSTextField!
    @IBAction func onButtonDownloadClicked(sender: AnyObject) {
        let randomNum = randomNumber()
        textLink.stringValue = String(randomNum)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textLink.stringValue = "ABCDEF"
        print(textLink.stringValue)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func randomNumber() -> ULONG {
        return arc4random()
    }
}

