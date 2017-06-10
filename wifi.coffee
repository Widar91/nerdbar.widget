command: "echo $(sh ./nerdbar.widget/scripts/wifi_status_script.sh)"

refreshFrequency: 2000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css" />
  <div class="wifi">
    <span class="icon"></span>
    <span></span>
  </div>
  """  

update: (output, el) ->

    # split the output of the script
    values = output.split('@')

    netStatus = values[0].replace /^\s+|\s+$/g, ""
    netName = values[1]
    netIP = values[2]

    if netStatus == "Wi-Fi"
        # $(".wifi span:nth-child(2)", el).text("  #{netName}")
        $icon = $(".wifi span.icon", el)
        $icon.removeClass().addClass("icon")
        $icon.addClass("fa fa-wifi fa-green")
    else if netStatus == 'USB 10/100/1000 LAN' or netStatus == 'Apple USB Ethernet Adapter'
        # $(".wifi span:nth-child(2)", el).text("  #{netName}")
        $icon = $(".wifi span.icon", el)
        $icon.removeClass().addClass("icon")
        $icon.addClass("fa fa-plug")
    else
        # $(".wifi span:nth-child(2)", el).text("  --")
        $icon = $(".wifi span.icon", el)
        $icon.removeClass().addClass("icon")
        $icon.addClass("fa fa-wifi fa-gray")

    
style: """
  -webkit-font-smoothing: antialiased
  font: 11px Osaka-Mono
  top: 6px
  right: 199px
  color: #9C9486
  text-align: right
  width: 35px
  span.fa-green
    color: #98c379
  span.fa-gray
    color: #9C9486
"""
