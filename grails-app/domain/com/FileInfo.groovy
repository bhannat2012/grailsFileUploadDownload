package com

class FileInfo {

    String fileName
    String uploadKey
    String fileFullPath
    static constraints = {
        fileName size: 0..50,blank: false ,nullable: true
        uploadKey display:false,nullable: true
        fileFullPath display:false
    }
}
