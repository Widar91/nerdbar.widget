command: "ESC=`printf \"\e\"`; ps -A -o %mem | awk '{s+=$1} END {printf(\"%2d\", s);}'"

refreshFrequency: 2000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css" />
  <div class="mem">
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    $(".mem span:nth-child(1)", el).text("  #{output}%")
    $icon = $(".mem span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa fa-microchip")

style: """
  -webkit-font-smoothing: antialiased
  color: #e5c07b
  font: 11px Osaka-Mono
  right: 337px
  top: 6px
  text-align: right
  span:nth-child(1) 
    color: #dcdfe4
"""

# color: #D5C4A1
# color: #9C9486