import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/shop_app_modules/shope_app/components.dart';

import 'package:my_app/shop_app_modules/shope_app/cubit/cubit.dart';
import 'package:my_app/shop_app_modules/shope_app/cubit/states.dart';

//يزن حكمت الشبقي
class LoginScreen extends StatelessWidget {

 final  emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => ShopeAppLoginCubit(),
      child: BlocConsumer<ShopeAppLoginCubit,ShopeAppLoginStates>(
        listener: (context,state){},
        builder: (context,state){
              return Scaffold(
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Text('Login',
                          //  style: Theme.of(context).textTheme.headline3
                          // TextStyle(fontWeight: FontWeight.bold,
                          // fontSize: 20,
                          // color: Colors.black) ,
                        ),
                        Text('Login now to browse hot offers',
                          style: TextStyle(fontSize: 20,color: Colors.grey),),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFormField(
                          label: 'Email',
                          controller: emailcontroller,
                          prefix: Icons.email_outlined ,
                          validate: 'Password can\'t be empty',
                          keyboardType: TextInputType.emailAddress,
                          enableBorderColor: Colors.black12,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        buildTextFormField(
                          label: 'Password',
                          controller: passwordcontroller ,
                          prefix: Icons.lock_outline,
                          validate: 'Email address can\'t be empty',
                          keyboardType: TextInputType.visiblePassword,
                          enableBorderColor: Colors.black12,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state != ShopeAppLoadingStates(),
                          builder: (context) =>   defaultButton(onPress: () {
                           if(formKey.currentState!.validate()){
                             ShopeAppLoginCubit.get(context).UserLogin(
                               email: emailcontroller.text,
                               password: passwordcontroller.text,
                             );
                           }
                          },
                              text: 'Login'),
                          fallback:  (context) => Center(child: CircularProgressIndicator()) ,

                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children:
                          [
                            Text('You Don\'t Hane An Account ?'),
                            TextButton(onPressed: (){}, child: Text('Register now'))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
        },
      ),
    );
  }
}
