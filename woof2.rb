#!/usr/bin/ruby

require 'gir_ffi'
require 'faraday'
require 'mimemagic'
require 'mimemagic/overlay'
require 'json'
require 'clipboard'

unless ARGV[0]
  puts "Please specify a file to upload."
  exit
end

GirFFI.setup :Notify

token = ""

def req(token, filepath)
  filename = File.basename(filepath)
  mime = MimeMagic.by_path(filepath)
  url = "https://pat.doggo.ninja/v1/"

  conn = Faraday.new(
    url: url,
    params: {originalName: filename, mimeType: mime},
    headers: {
      "Content-Type" => "application/octet-stream",
      "Authorization" => "Bearer #{token}"
    }
  ) do |faraday|
    faraday.adapter :net_http
  end

  re = conn.post("upload") do |req|
    req.body = File.read(filepath)
  end

  JSON.parse(re.body)
end

def notify(link)
    Notify.init("doggo.ninja uploader")
    notif = Notify::Notification.new "Doggo.ninja",
                                     "The file was uploaded <a href='#{link}'>here</a> and has been copied to your clipboard.",
                                     "dialog-information"
    notif.show

    Clipboard.copy link
end


url = req(token, ARGV[0])["url"]
notify url
