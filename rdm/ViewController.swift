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
    @IBOutlet weak var txtLink: NSTextField!
    @IBOutlet weak var txtSavePath: NSTextField!
    
    var savePath = ""
    var fileUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func randomNumber() -> ULONG {
        return arc4random()
    }
    
    @IBAction func onButtonDownloadClicked(sender: AnyObject){
        fileUrl = txtLink.stringValue
        let fileContent = downloadFileUrl(fileUrl, savePath: savePath)
        print(fileContent)
    }
    
    @IBAction func onButtonBrowseClicked(sender: AnyObject) {
        savePath = openSelectFileWindow()
        txtSavePath.stringValue = String(savePath)
    }
    
    func openSelectFileWindow() -> String {
        let selectFilePanel: NSOpenPanel = NSOpenPanel()
        selectFilePanel.canChooseDirectories = true
        selectFilePanel.canChooseFiles = false
        selectFilePanel.runModal()
        
        var path = selectFilePanel.URL?.path
        if path == nil {
            path = ""
        }
        
        return path!
    }
    
    func downloadFileUrl(fileUrl: String, savePath: String) -> String {
        var fileContent = ""
        if let url = NSURL(string: fileUrl) {
            let fileData = NSData(contentsOfURL: url)
            let fileContentString = NSString(data: fileData!, encoding: NSUTF8StringEncoding)
            fileContent = String(fileContentString)
        }
        
        return fileContent
    }
}

