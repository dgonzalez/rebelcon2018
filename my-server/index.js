const express = require('express')
const metaWeather = require('metaweather-demo')

const app = express()

app.get('/api/location/:city', async (req, res) => {
  console.log(`Gelocating ${req.params.city}`)
  res.send(await metaWeather(req.params.city))
})

app.get('/hc', async (req, res) => {
  res.send('ok')
})

app.listen(3001, () => {
  console.log('Server listening at port 3001')
})
