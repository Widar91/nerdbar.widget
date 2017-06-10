command: "df -h | grep /disk1 | awk -F\" \" '{print $4}'"

refreshFrequency: 3600000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css" />
  <div class="hd">
    <span></span>
    <span class="icon"></span>
  </div>
  """  

update: (output, el) ->
    free = output.replace(/[^0-9]/g,'')

    $(".hd span:nth-child(1)", el).text("  #{free} GB")
    $icon = $(".hd span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa fa-hdd-o")

    
style: """
  -webkit-font-smoothing: antialiased
  font: 11px Osaka-Mono
  top: 6px
  right: 214px
  color: #c678dd
  text-align: center
  width: 75px
  span:nth-child(1) 
    color: #dcdfe4
"""
