def fetch_data(clauses)
    file = File.open("data_template.txt")
    file_data = file.read
    section = [
                
                { "id": 1, "clauses_ids": "#{clauses[0][:text]} #{clauses[1][:text]}" }
            ]
    puts print_template(clauses, section, file_data)
end

def print_template(clauses, section, file_data)
  file_data.split("\n").each do |line|
    replace_line_data(line, clauses, section)
  end
end

def create_clause(choiced_clause)
  {
    text: choiced_clause
  }
end 

clauses = []
(1..5).each do |i|
    puts "please enter your #{i} clause"
    text = gets.chomp
    clauses.push(create_clause(text))
end

private

def replace_line_data(line, clauses, section)
    index_number = line.scan(/\d+/).first
    line.gsub!("[CLAUSE-#{index_number.to_i}]", "#{clauses[index_number.to_i][:text]}") if line.include?("CLAUSE")
    line.gsub!("[SECTION-#{index_number.to_i}]", "#{section[0][:clauses_ids]}") if line.include?("SECTION")
    line
end

puts fetch_data(clauses)
