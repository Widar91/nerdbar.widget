command: 'echo "$(./nerdbar.widget/scripts/spaces.sh) | $(/usr/local/bin/kwmc query window focused name)"'

refreshFrequency: 500 # ms

render: (output) ->
  """
  <div class="foc">
    <span class="icon fa fa-bars"></span>
    <span></span>
  </div>
  """

update: (output, el) ->
  # my attempts to get monospaced spaces list:
  [mode, spaces, focused...] = output.split '|'
  spaces = @redraw spaces
  focused = @dotted focused.join('|'), 60
  output = [ "<span>#{mode}|</span>", spaces, "<span>|#{focused}</span>" ].join('')
  $(".foc span:nth-child(2)", el).html("  #{output}")

dotted: (str, limit) ->
  dots = "..."
  if str.length > limit
    str = str.substring(0,limit) + dots
  return str

redraw: (spaces) ->
  list = spaces.split ' '
  result = ( @decide space for space in list).join('')

decide: (elem) ->
  elem.replace /^\s+|\s+$/g, ""
  if elem is ""
    return """ """
  else
    if elem[0] is "("
      elem = elem[1...-1]
      elem = """<span class="list active">#{elem}</span>"""
    else
      elem = """<span class="list inactive">#{elem}</span>"""
    return elem

###
#old style values

  font: 10px Input
  height: 16px
  left: 10px
  top: 7px

###

style: """
  -webkit-font-smoothing: antialiased
  color: #dcdfe4
  font: 11px Osaka-Mono

  height: 16px
  left: 10px
  top: 0px
  padding-top: 6px

  width: auto
  overflow: hidden
  text-overflow: ellipsis
  white-space: nowrap

  span .list
    display: inline
    text-align: center
    padding-top: 6px
    padding-bottom: 11px
    padding-left: 9px
    padding-right: 8px

  .inactive
    border: 1px #a89984

  .active
    background: #dcdfe4
    color: #171717
"""
#D6E7EE