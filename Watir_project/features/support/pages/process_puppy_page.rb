require_relative '../side_menu_panel'

class ProcessPuppyPage
  include PageObject
  include SideMenuPanel

  buttons(:process, :value => "Process Puppy")
  divs(:name, class:'name')
  p(:thank_msg, :id => 'notice')

  def process_adoption(num = 1)
    index = num - 1
    $adopter_name = name_elements[index].text.split(' ')[1..-1].join(' ')
    $puppy_name = name_elements[index+1].text.split(' ')[1..-1].join(' ')
    process_elements[index].click
    $adopter_name
    $puppy_name
  end

  def successful_adoption_for_adopter
    thank_msg
  end

end