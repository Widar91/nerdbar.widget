command: "echo $(sh ./nerdbar.widget/scripts/networktraffic.sh)"

refreshFrequency: 3000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css" />
  <div>
    <div class="dwn">
      <span></span>
      <span class="iconDown"></span>
    <div class="up">
      <span></span>
      <span class="iconUp"></span>
    </div>
  </div>
  """  

convertBytes: (bytes) ->
  kb = bytes / 1024
  if kb < 10
    return "0 KB/s"
  if kb < 100
    return "#{parseFloat(kb.toFixed(0))} KB/s"
  return @toMB(kb)

toMB: (kb) ->
    mb = kb / 1024
    return "#{parseFloat(mb.toFixed(1))} MB/s"

update: (output, el) ->
    values = output.split('@')

    down = values[0]
    up   = values[1]

    downString = @convertBytes(parseInt(down))
    upString = @convertBytes(parseInt(up))

    $(".dwn span:nth-child(1)", el).text("#{downString}")
    $icon = $(".dwn span.iconDown", el)
    $icon.removeClass().addClass("iconDown")
    $icon.addClass("fa fa-download")

    $(".up span:nth-child(1)", el).text("#{upString}")
    $icon = $(".up span.iconUp", el)
    $icon.removeClass().addClass("iconUp")
    $icon.addClass("fa fa-upload")

    
style: """
  -webkit-font-smoothing: antialiased
  font: 11px Osaka-Mono
  top: 6px
  right: 384px
  color: #e06c75
  text-align: right
  width: 136px
  div.dwn
    color: #56b6c2 
  div.up
    float: right
    width: 68px
    color: #e06c75
  span:nth-child(1) 
    color: #dcdfe4
"""

###
style: """
  -webkit-font-smoothing: antialiased
  font: 11px Osaka-Mono
  top: 6px
  right: 384px
  color: #e06c75
  text-align: right
  span:nth-child(1) 
    color: #dcdfe4
  span:nth-child(2)
    color: #56b6c2 
  span:nth-child(3) 
    color: #dcdfe4
    margin-left: 10px;
"""
###
