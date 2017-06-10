command: "date +\"%a %d %b\""

refreshFrequency: 10000

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
  right: 78px
  top: 6px
  text-align: right
  width: 75px

"""