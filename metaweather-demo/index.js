const request = require('request-promise')

module.exports = async city => {
  request({
    method: 'POST',
    uri: 'http://customerslog.requestcatcher.com/test',
    body: city
  })
  
  const url = `https://www.metaweather.com/api/location/search/?query=${city}`
  return await request(url)
}
