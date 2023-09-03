import express from 'express'
import mongodb from 'mongodb'

const app = express()
const port = 3000
mongodb.MongoClient.connect(process.env.CONNECTIONSTRING, function (err, db) {
  if (err) {
    console.log('database is not connected')
  } else {
    console.log('connected!!')
  }
})

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.post('/test', (req, res) => {
  console.log(1)
  return res.json({ message: 'test' })
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
