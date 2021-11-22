FROM node:14

LABEL Pramudya_Wibowo <1941720054@student.polinema.ac.id>
RUN mkdir -p /node_app
WORKDIR /node_app
COPY package*.json /node_app/

RUN npm install
COPY . .
EXPOSE 4000

CMD ["node", "index.js"]