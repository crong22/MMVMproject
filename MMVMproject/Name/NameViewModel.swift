//
//  NameViewModel.swift
//  MMVMproject
//
//  Created by 여누 on 7/9/24.
//

import Foundation

class NameViewModel {
    
    var inputname: Observable<String?> = Observable("")
    
    var checkname:  Observable<String?> = Observable("")
    var namebool = Observable(false)
    
    init() {
        inputname.bind { _ in
            self.confirm()
        }
    }
    
    private func confirm() {
        
        // 1) nil 체크 !
        guard let text = inputname.value else {
            return
        }
        
        // 2) 빈 값 체크
        if text.isEmpty {
            namebool.value = false
            checkname.value = "닉네임을 입력해주세요."
            return
        }
        
        // 3) 숫자만 입력했을 때
        if let num = Int(text) {
            namebool.value = false
            checkname.value = "숫자만 입력이 불가능합니다."
            return
        }
        
        // 4) 글자수제한
        if text.count > 3 , text.count < 10 {
            namebool.value = true
            checkname.value = "가입이가능합니다 :)"
            return
        }else {
            namebool.value = false
            checkname.value = "4글자 이상 9글자이하로 입력해주세요. "
        }
        
    }
    
    
}
