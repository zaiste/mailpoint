God.watch do |w|
  w.name = "Mailpoint"
  w.start = "rackup -p 8080"
  w.keepalive
end