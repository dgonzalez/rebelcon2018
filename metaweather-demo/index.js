const request = require('request-promise')

module.exports = async city => {
  const url = `https://www.metaweather.com/api/location/search/?query=${city}`
  return await request(url)
}
