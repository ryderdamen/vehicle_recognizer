# Vehicle Recognizer
A containerized CPU vehicle-recognition service implemented from foamliu/Car-Recognition.

## Installation
To install, clone the repository and run the installation command.

```bash
git clone https://github.com/ryderdamen/vehicle_recognizer/
cd vehicle_recognizer
make download_models
make install
```

## Running
To run, use the following command:

```bash
make run
```

Once the server has started, upload an image to it:

```bash
curl -X POST 0.0.0.0:8000/classify/ -F 'file=@test/jeep.jpg' -i
```

```json
{
  "label": "Jeep Wrangler SUV 2012", 
  "probability": "0.8388"
}
```
