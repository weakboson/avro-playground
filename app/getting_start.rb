#!/usr/bin/env ruby

require 'avro'
require 'pp'

schema_json = File.read('user.avsc')

Avro::DataFile.open('users.avro', 'w', schema_json) do |f|
  f << { name: "Alyssa", favorite_number: 256 }
  f << { name: "Ben", favorite_number: 7, favorite_color: "red" }
end

Avro::DataFile.open('users.avro', 'r', schema_json) do |f|
  f.each do |user|
    pp user
  end
end
