# React-Rails Authentication Front-End
<p align="center">
    <img src="./app/images/rails.png" alt="Logo" width="150" height="120">
  <h3 align="center">React-Rails --> [React]</h3>

  <p align="center">
This is prepared Rails authentication template, part of `React-Rails authentication`, Rails back-end and  logic are built and ready to use.
  </p>
</p


## Screenshots of the app.

![image](./app/images.screen.png)



[Live Demo Link](https://60d9c0abccc45700086d7eec--epic-kilby-a23fc8.netlify.app/)

## Built With

- Rails-Api

- Devise
 
- Devise-jwt

## Prerequisities

node should be installed in your machine.


## Getting Started

**To get this project set up on your local machine, follow these simple steps:**


**Step 1**<br>

In order to use this project  all you have to to is follow these simple steps :

- Clone the Rails repo and cd inside the project.

- Run `Rake secret` and keep hold it for the next step.

- Create a `.env` file in the root of the project and inside it put this `DEVISE_JWT_SECRET_KEY = < your secret key from previuos step >`

- Inside `config/initializers/cors.rb` if you it locally you dont need to do this but if you want to use it from specific domain you should change line 12 from `origins '*'` to `origins 'Your domain here'`.

- Note: If you publish this website and upload it to heroku, do not forget to add a `Config variable` to your app in heroku, simply go to heroku, go to your app, click on setting, click on config vars then put your `DEVISE_JWT_SECRET_KEY` then your secret key.


## 🤝 contributing

## Author

- GitHub: [@arikarim](https://github.com/arikarim)
- LinkedIn: [AriKarim](https://www.linkedin.com/in/ari-karim-523bb81b3)

## 🙋‍♂ show your support

give a ⭐️ if you like this project!

## 📝 license



This project is [MIT](lisenced)
