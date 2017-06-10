#command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"
command: "echo $(sh ./nerdbar.widget/scripts/battery_percentage_script.sh)@$(sh ./nerdbar.widget/scripts/battery_charging_script.sh)"

refreshFrequency: 150000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css" />
  <div class="battery color">
    <span></span>
    <span class="icon"></span>
    <span class="charging"></span>
  </div>
  """

update: (output, el) ->
    values = output.split('@')

    battery = parseInt(values[0])
    charging = values[1]

    if /AC/.test(charging) 
      $icon = $(".battery span.charging", el)
      $icon.removeClass().addClass("charging")
      $icon.addClass("fa fa-flash")  


    $(".battery span:first-child", el).text("  #{battery}%")
    $icon = $(".battery span.icon", el)
    $icon.removeClass().addClass("icon")
    $icon.addClass("fa #{@batteryStatus(battery)}")
    #$icon.addClass("fa #{@batteryStatus(bat,charging)}")

batteryStatus: (battery, state) ->
  return if battery > 90
    "fa-battery-4"
  else if battery > 70
    "fa-battery-3"
  else if battery > 40
    "fa-battery-2"
  else if battery > 15
    "fa-battery-1"
  else
    "fa-battery-0"

style: """
  -webkit-font-smoothing: antialiased
  right: 148px
  top: 6px
  font: 11px Osaka-Mono
  text-align: right
  width: 60px
  span:nth-child(1) 
    color: #dcdfe4

  .battery { 
    &.color {
      > .fa-battery-4 { color: #50a14f }
      > .fa-battery-3 { color: #98c379 }
      > .fa-battery-2 { color: #e5c07b }
      > .fa-battery-1 { color: #e06c75 }
      > .fa-battery-0 { color: #e45649 }
      > .fa-flash { color: #e5c07b }
    }
    .fa-flash {
      position: absolute;
      right: -0.6em;
      top: -0.4em;
      font-size: 0.6em;
    }
  }

  @keyframes showhide {
    0% { opacity: 1 }
    20% { opacity: 0 }
  }
  @keyframes fadeinout {
    0% { opacity: 1 }
    50% { opacity: 0 }
    100% { opacity: 1 }
  }
"""

# animation: fadeinout 2s ease-in-out infinite;
