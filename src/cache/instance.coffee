Impromptu = require '../impromptu'

class Instance extends Impromptu.Cache
  run: (fn) ->
    return @get fn if @_cached
    @_setThenGet fn


  get: (fn) ->
    fn null, @_cached ? @options.fallback if fn


  set: (fn) ->
    @_update (err, value) =>
      unless err
        @_cached = value
      fn err, !err if fn


  unset: (fn) ->
    @_cached = null
    fn null, true if fn


# Expose `Instance`.
exports = module.exports = Instance
