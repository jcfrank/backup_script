require 'fileutils'
require_relative 'folder'

def printResult(counter)
    if counter > 1
        puts "back up success, #{counter} entries are backed up"
        elsif counter == 1
        puts "back up success, 1 entry is backed up"
        else
        puts "no entries are backed up"
    end
end

inputDirPath = './ori/'
backupDirPath = './target/'

inputFolder = Folder.new inputDirPath
backupFolder = Folder.new backupDirPath


counter = 0
inputFolder.listAllFiles.each do |file|
  if backupFolder.isExist?(file)
    next
  else
    puts "Copy file #{file} to dir #{backupDirPath}"
    counter = counter + 1
    backupFolder.add(file)
  end
end

printResult(counter)
