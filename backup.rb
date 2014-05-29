#!/usr/bin/env ruby
require 'optparse'
require 'fileutils'

def parse_options(options)
    OptionParser.new do |opts|
        opts.banner = 'Usage: backup.rb [options]'
        opts.on('-h', '--help', 'Help') do
            puts opts
            exit
        end

        opts.on('-f', '--from source', 'From which folder') do |source|
            options[:from] = source
        end

        opts.on('-t', '--to target', 'To which folder') do |target|
            options[:to] = target
        end
        opts.parse!
    end
end

class Folder
    def initialize(path)
        @path = path;
    end
    
    def listFiles
        Dir[@path + '*']
    end
    
    def exist?(file)
        File.exist?(@path + File.basename(file))
    end
    
    def add(file)
        FileUtils.copy_entry(file, @path + File.basename(file))
    end
    
    def to_s
        @path
    end
end

class BackupAction
  def initialize(options)
      @sourceFolder = Folder.new options[:from]
      @targetFolder = Folder.new options[:to]
  end
  
  def backup
      @counter = 0
      @sourceFolder.listFiles.each do |file|
          if @targetFolder.exist?(file)
              next
          else
              puts "Copy file #{file} to dir #{@targetFolder.to_s}"
              @counter += 1
              @targetFolder.add(file)
          end
      end
      printResult
  end

  private  
  def printResult
      if @counter > 1
        puts "back up success, #{@counter} entries are backed up"
      elsif @counter == 1
        puts "back up success, 1 entry is backed up"
      else
        puts "no entries are backed up"
      end
  end
end

if __FILE__ == $0
    options = {}
    options[:from] = './ori/'
    options[:to] = './target/'
    parse_options(options)

    action = BackupAction.new(options)
    action.backup
end

