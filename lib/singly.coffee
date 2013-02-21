cookie = require 'cookie'
request = require 'superagent'

getParam = (param) ->
  url = window.location.hash
  re = new RegExp "##{param}=([^&]+)(&|$)"
  match = url.match re
  return unless match? and match[1]?
  return match[1]

apiKey = null

singly =
  base: "https://api.singly.com"
  cookieName: "singly_access_token"
  redirectOnSucess: true
  setKey: (key) -> apiKey = key
  token: -> 
    return cookie singly.cookieName
  clearToken: -> 
    cookie singly.cookieName, null
    return singly
  setToken: (val, expiration=30) -> 
    cookie singly.cookieName, maxage: expiration*86400000
    return singly
  authorize: (service, cburl=window.location.origin) ->
    uri = "#{singly.base}/oauth/authorize?client_id=#{appKey}&service=#{service}&redirect_uri=#{cburl}&scope=email&response_type=token"
    window.location.href = uri
    return singly

  makeRequest: (path, opt={}, type, cb) ->
    if typeof opt is 'function' and !cb
      cb = opt
      opt = {}
    uri = "#{singly.base}#{path}"
    req = request
      .type('json')
      .query(opt.qs)
      .query(access_token: singly.token())
    req[type](uri)
    req.send opt.data if type in ['post','put']
    req.end cb
    return req

  get: (path, opt, cb) ->
    singly.makeRequest path, opt, 'get', cb

  post: (path, opt, cb) ->
    singly.makeRequest path, opt, 'post', cb

  put: (path, opt, cb) ->
    singly.makeRequest path, opt, 'put', cb

  del: (path, opt, cb) ->
    singly.makeRequest path, opt, 'del', cb

tok = getParam "access_token"
if tok?
  singly.setToken tok
  window.location.href = "/" if singly.redirectOnSucess

module.exports = singly