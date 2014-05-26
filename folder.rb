class Folder
    def initialize(path)
        @path = path;
    end
    
    def listAllFiles
        Dir[@path+'*']
    end
    
    def isExist?(file)
        targetPath = @path + File.basename(file)
        if File.exist?(targetPath)
            return true
        else
            return false
        end
    end
    
    def add(file)
        targetPath = @path + File.basename(file)
        FileUtils.copy_entry(file,targetPath)
    end
end