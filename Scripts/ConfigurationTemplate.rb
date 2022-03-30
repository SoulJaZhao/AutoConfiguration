require 'rubygems'
require 'xcodeproj'
require 'optparse'
require 'ostruct'
require 'fileutils'
require 'json'
require 'plist'
require 'rexml/document'
require 'yaml'

options = OpenStruct.new
OptionParser.new do |opt|
    opt.on('-p', '--path PATH', 'project path') {|o| options.project_path = o }
    opt.on('-t', '--target TARGET', 'target name') {|o| options.target_name = o }
    opt.on('-j', '--json JSON', 'json path') {|o| options.json_path = o }
    opt.on('-r', '--result RESULT', 'result file path') {|o| options.result_file_path = o}
    opt.on('-y', '--yaml YAML', 'YAML file path') {|o| options.yml_file_path = o}
    opt.on('-l', '--plist PLIST', 'plist path') {|o| options.plist_path = o }
end.parse!

project_path = options.project_path
puts "==> Project Path:" + project_path
target_name = options.target_name
puts "==> Target Name:" + target_name
json_path = options.json_path
puts "==> JSON Path:" + json_path
if options.plist_path 
    plist_path = options.plist_path
    puts "==> Plist Path:" + plist_path.to_s
else 
    plist_path = nil
end
result_file_path = options.result_file_path
puts "==> Result Path:" + result_file_path
yml_file_path = options.yml_file_path
puts "==> YAML Path:" + yml_file_path

project = Xcodeproj::Project.open(project_path)

result_file_path = options.result_file_path

target = project.targets.find { |item| item.to_s == target_name }

config_hash = Hash.new

if plist_path == nil
    json_file = File.read(json_path)
    config_hash = JSON.parse(json_file)
    puts "==> JSON configuration:" + JSON.pretty_generate(config_hash) 
else 
    config_hash = Plist.parse_xml(plist_path)
    puts "==> Plist configuration:" + config_hash.to_plist
end

yml_config_hash = YAML.load_file(yml_file_path)
yml_config_hash["output"] = result_file_path
yml_config_hash["args"] = config_hash 
puts "==> YAML configuration:" + yml_config_hash.to_yaml

File.open(yml_file_path,'w') do |h| 
    h.write yml_config_hash.to_yaml
    h.close
end

exec 'sourcery --config ' + yml_file_path

group = project.main_group.find_subpath(target_name)

file_ref = group.recursive_children.filter { |x| x.instance_of? Xcodeproj::Project::Object::PBXFileReference }.find { |x| x.name == result_file_path.split('/').last }
if file_ref
    file_ref.remove_from_project
end

new_file_ref = group.new_file(result_file_path)
target.add_file_references([new_file_ref])

project.save