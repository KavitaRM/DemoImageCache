//
//  DataViewModel.swift
//  DemoImageCache
//
//  Created by Kavita Malagavi on Aug-3-2020.
//  Copyright © 2020 Kavita Malagavi. All rights reserved.
//

import Foundation

class DataViewModel: NSObject {
    
    var dataModel: DataModel?
    private var rowData = [RowValues]()
    
    func fetchData(successCallback : @escaping () -> Void, failureCallback: @escaping () -> Void) {
        NetworkManager.shared.getDropBoxContents{[weak self] (response, errorString) -> Void in
            guard let weakSelf = self else { return }
            if let response = response {
                weakSelf.dataModel = response
                successCallback()
            } else {
                failureCallback()
            }
        }
    }
  
}
