import json
import os
from flask import Flask, jsonify, request, Response

import cv2 as cv
import keras.backend as K
import numpy as np
import scipy.io
from utils import load_model


app = Flask(__name__)
model = load_model()
model.load_weights('/code/models/model.96-0.89.hdf5')
model._make_predict_function()
cars_meta = scipy.io.loadmat('devkit/cars_meta')
class_names = cars_meta['class_names']
class_names = np.transpose(class_names)


@app.route('/')
def index():
    return jsonify({'status': 'ok'})


@app.route('/classify/', methods=['POST'])
def classify():
    if 'file' not in request.files:
        return jsonify({'error': 'no file'})
    bgr_img = cv.imdecode(np.fromstring(request.files['file'].read(), np.uint8), cv.IMREAD_UNCHANGED)
    img_width, img_height = 224, 224
    bgr_img = cv.resize(bgr_img, (img_width, img_height), cv.INTER_CUBIC)
    rgb_img = cv.cvtColor(bgr_img, cv.COLOR_BGR2RGB)
    rgb_img = np.expand_dims(rgb_img, 0)
    preds = model.predict(rgb_img)
    prob = np.max(preds)
    class_id = np.argmax(preds)
    classification = {
        'label': class_names[class_id][0][0],
        'probability': '{:.4}'.format(prob),
    }
    return jsonify(classification)


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8000)
