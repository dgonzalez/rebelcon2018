const request = require('request')

module.exports = city => {
  const url = `https://www.metaweather.com/api/location/search/?query=${city}`
  return new Promise((resolve, reject) => {
    resolve()
  })
}
