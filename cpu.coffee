command: "ESC=`printf \"\e\"`; ps -A -o %cpu | awk '{s+=$1} END {printf(\"%2d\",s/4);}'"

refreshFrequency: 2000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css" />
  <div class="cpu">
    <span></span>
    <span class="icon"></span>
  </div>
  """

update: (output, el) ->
    $(".cpu span:nth-child(1)", el).text("  #{output}%")
    $icon = $(".cpu span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa fa-server")

style: """
  -webkit-font-smoothing: antialiased
  color: #61afef
  font: 11px Osaka-Mono
  right: 290px
  text-align: right
  top: 6px
  span:nth-child(1) 
    color: #dcdfe4
"""