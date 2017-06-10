command: "date +\"%I:%M %p\""

refreshFrequency: 10000 # ms

render: (output) ->
  """
  <div>
    <span>
      #{output}
    </span>
  </div>
  """

style: """
  -webkit-font-smoothing: antialiased
  color: #dcdfe4
  font: 11px Osaka-Mono
  right: 20px
  top: 6px
  text-align: right
  width: 65px
"""