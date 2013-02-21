## Information

<table>
<tr>
<td>Package</td><td>singly</td>
</tr>
<tr>
<td>Description</td>
<td>Singly authentication for single page apps</td>
</tr>
<tr>
<td>Size</td>
<td>11K</td>
</tr>
</table>

## Usage

```javascript
//typical auth usage will look something like this

if (!singly.token()) {
  // Calling authorize will take the user away
  // and bring them back when they have authenticated.
  // singly.token() will be set after this
  singly.authorize('twitter');
} else {
  //go to app
}
```

```javascript
//typical api usage will look something like this
// singly has get,post,put, and del functions.
// usage is path, opt?, cb?
// opt can have data and qs keys

singly.get('/twitter/friends', function(err, res) {
  //res is the response object
});

var myOpt = {
  qs: {
    full: true
  },
  data: {
    settings: "some custom settings"
  }
};

singly.post('/twitter/friends', myOpt, function(err, res) {
  //res is the response object
});

```

## LICENSE

(MIT License)

Copyright (c) 2012 Fractal <contact@wearefractal.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
