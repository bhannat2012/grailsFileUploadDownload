package com



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FileInfoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond FileInfo.list(params), model: [fileInfoInstanceCount: FileInfo.count()]
    }

    def show(FileInfo fileInfoInstance) {
        respond fileInfoInstance
    }

    def create() {
        respond new FileInfo(params)
    }

    @Transactional
    def save(FileInfo fileInfoInstance) {

        def file = request.getFile('file')

        println file

        if (fileInfoInstance == null) {
            notFound()
            return
        }

        if (fileInfoInstance.hasErrors()) {
            respond fileInfoInstance.errors, view: 'create'
            return
        }

        fileInfoInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'fileInfoInstance.label', default: 'FileInfo'), fileInfoInstance.id])
                redirect fileInfoInstance
            }
            '*' { respond fileInfoInstance, [status: CREATED] }
        }
    }

    def edit(FileInfo fileInfoInstance) {
        respond fileInfoInstance
    }

    @Transactional
    def update(FileInfo fileInfoInstance) {
        if (fileInfoInstance == null) {
            notFound()
            return
        }

        if (fileInfoInstance.hasErrors()) {
            respond fileInfoInstance.errors, view: 'edit'
            return
        }

        fileInfoInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'FileInfo.label', default: 'FileInfo'), fileInfoInstance.id])
                redirect fileInfoInstance
            }
            '*' { respond fileInfoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(FileInfo fileInfoInstance) {

        if (fileInfoInstance == null) {
            notFound()
            return
        }

        fileInfoInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'FileInfo.label', default: 'FileInfo'), fileInfoInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'fileInfoInstance.label', default: 'FileInfo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
