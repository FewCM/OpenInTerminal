//
//  BBEditApp.swift
//  OpenInTerminalCore
//
//  Created by Jianing Wang on 2019/7/21.
//  Copyright © 2019 Jianing Wang. All rights reserved.
//

import Foundation

final class BBEditApp: Editor {
    
    func open(_ path: String) throws {
        
        guard let url = URL(string: path) else {
            throw OITError.wrongUrl
        }
        
        let source = """
        do shell script "open -a BBEdit \(url.path.specialCharEscaped)"
        """
        
        let script = NSAppleScript(source: source)!
        
        var error: NSDictionary?
        
        script.executeAndReturnError(&error)
        
        if error != nil {
            throw OITError.cannotAccessApp(EditorType.bbedit.rawValue)
        }
    }
    
}
