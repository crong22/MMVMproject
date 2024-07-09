//
//  NicknameViewModel.swift
//  MMVMproject
//
//  Created by 여누 on 7/9/24.
//

import Foundation

class NicknameViewModel {
    
    // 들어오는 닉네임 값
    var inputname : String? = "" {
        didSet {
            confirm(inputname)
        }
    }
    
    // 닉네임 체크해주는 결과 값?
    var namecheck = ""
    // 가입이 가능할 때는 true로 변경
    var namebool = false
    
    private func confirm(_ input : String?) {
        
        // 1) nil 체크 !
        guard let text = input else {
            namecheck = "nil"
            return
        }
        
        // 2) 빈 값 체크
        if text.isEmpty {
            namecheck = "닉네임을 입력해주세요."
            return
        }
        
        // 3) 숫자만 입력했을 때
        if let num = Int(text) {
            namecheck = "숫자만 입력이 불가능합니다."
            return
        }
        
        // 4) 글자수제한
        if text.count > 3 , text.count < 10 {
            namebool = true
            namecheck = "가입이가능합니다 :)"
            return
        }else {
            namecheck = "4글자 이상 9글자이하로 입력해주세요. "
        }
        
    }
}
