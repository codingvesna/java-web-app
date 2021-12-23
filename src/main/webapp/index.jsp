<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css"/>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Karla:400,700&display=swap');

        .font-family-karla {
            font-family: karla;
        }
    </style>
</head>

<body class="font-family-karla bg-white h-screen">

<div class="w-full flex flex-wrap">
    <!--    Register Section -->
    <div class="w-full md:w-1/2 flex flex-col">
        <div class="flex justify-center md:justify-start pt-12 md:pl-12 md:-mb-12">
            <a href="home.jsp" id="home" class="bg-red-700 text-white font-bold text-xl p-4">Welcome</a>
        </div>

        <div class="flex flex-col justify-center md:justify-start my-auto pt-8 md:pt-0 px-8 md:px-24 lg:px-32">
            <p class="text-center text-3xl">Sign In.</p>

            <form class="flex flex-col pt-3 md:pt-8">
                <div class="flex flex-col pt-4">
                    <label for="name" class="text-xl"> Name </label>
                    <input type="text" id="name" placeholder="Your Name" class="shadow appearance-none border
                    w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline">
                </div>

                <div class="flex flex-col pt-4">
                    <label for="email" class="text-xl"> Email </label>
                    <input type="email" id="email" placeholder="your@email.com" class="shadow appearance-none border
                    w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline">
                </div>
                <div class="flex flex-col pt-4">
                    <label for="password" class="text-xl"> Password </label>
                    <input type="password" id="password" placeholder="Password" class="shadow appearance-none border
                    w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline">
                </div>
                <div class="flex flex-col pt-4">
                    <label for="confirm-password" class="text-xl"> Confirm Password </label>
                    <input type="password" id="confirm-password" placeholder="Password" class="shadow appearance-none border
                    w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline">
                </div>

                <input type="submit" value="Register" class="bg-red-700 text-white font-bold text-lg
                hover:bg-gray-700 p-2 mt-8">

                <div class="text-center pt-12 pb-12">
                    <p> Already have an account?
                        <a href="home.jsp" class="underline font-semibold">Log In here.</a>
                    </p>
                </div>
            </form>
            <div class="text-center pt-1 pb-1">
                <p> Developed by:
                    <a href="https://rs.linkedin.com/in/vesna-milovanovic" class="text-sm font-semibold text-gray-500">Vesna Milovanovic</a>
                </p>
            </div>
        </div>

    </div>
    <!--    Image Section-->
    <div class="w-1/2 shadow-2xl">
        <img src="https://www.helloworld.rs/public/company/36/galerija/7.jpg" height="1920" width="1440" class="object-cover w-full h-screen hidden md:block" alt="paper desk"/></div>
</div>

</body>
</html>