require_relative 'backup'

sourcePath = './ori/'
targetPath = './target/'

backupAction = BackupAction.new
backupAction.set_source_and_target(sourcePath,targetPath)
backupAction.backup
backupAction.printResult
