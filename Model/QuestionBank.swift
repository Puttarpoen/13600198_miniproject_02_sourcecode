//
//  QuestionBank.swift
//  yesorno3
//
//  Created by ict on 15/11/2561 BE.
//  Copyright © 2561 ICTSUIM. All rights reserved.
//

import Foundation
class QuestionBank {
    var list = [Question]()
    
    init(){
        // indext = 0
        let item = Question (text: "แหล่งกำเนิดสุนัขไทย\nหลังอานอยู่ที่ตราด", correctAnswer: true)
        list.append(item)
        
        list.append(Question(text: "นครหลวงของทิเบต\nชื่อชาลา", correctAnswer: false))
        list.append(Question(text: "ร่างกายของมนุษย์มีกระดูก\n206 ชิ้น", correctAnswer: true))
        list.append(Question(text: "ต้นแม่น้ำแยงซีเกียง\nอยู่ที่ที่ราบสูงทิเบต", correctAnswer: true))
        list.append(Question(text: "มดที่ทำงานง่วนอยู่ทั้งวัน\nเป็นมดตัวผู้", correctAnswer: false))
        list.append(Question(text: "ดินแดนแห่งกระต่าย\nเป็นชื่อเรียกประเทศ\nสวิชสแลนด์", correctAnswer: false))
        list.append(Question(text: "คติชาวบ้านเชื่อว่า\nปลาโลมาจะช่วยคน\nเมื่อเรือแตก", correctAnswer: true))
        list.append(Question(text: "ยาสลบทำจากคลอโรฟอร์ม", correctAnswer: true))
        list.append(Question(text: "อเมริกาเหนือได้ชื่อ\nเป็นดินแดนแห่งการปฏิวัติ", correctAnswer: false))
        list.append(Question(text: "นกอินทรีย์หัวดำ\nเป็นสัญลักษณ์\nของสหรัฐอเมริกา", correctAnswer: false))
    }
}
