import 'package:flutter/material.dart';
import 'package:how_to_crack_ssb/testimonials_screen.dart';
import 'package:how_to_crack_ssb/web_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('How To Crack SSB'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16),
                child: Image.asset(
                  'assets/logo_hd_50.png',
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return WebScreen('https://school.howtocrackssb.com/');
                    }));
                  },
                  title: 'Know About SSB Recommendation Blueprint'),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return WebScreen(
                          'https://school.howtocrackssb.com/courses');
                    }));
                  },
                  title: 'Glimpse Of SSB Recommendation Kit'),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return WebScreen(
                          'https://sso.teachable.com/secure/671033/users/sign_in?clean_login=true&reset_purchase_session=1');
                    }));
                  },
                  title: 'Login To Digital School',
                  subtitle: 'For Already Enrolled Students'),
              CustomButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return WebScreen(
                        'https://onlinetraining.howtocrackssb.com/webinar-registration1607577155945');
                  }));
                },
                title: 'Enquire  For Enrollment ',
                subtitle: 'For New IAF Aspirant',
              ),
              CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return TestimonialsScreen();
                    }));
                  },
                  title: 'IAF Aspirants Testimonials'),
            ],
          ),
        ));
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onPressed;

  const CustomButton({
    @required this.title,
    this.subtitle,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
              color: const Color(0xff2b3636),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: const Color(0xff2b3636),
                  width: 3,
                  style: BorderStyle.solid)),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    //color: const Color(0xff2b3636)
                    color: Colors.white),
              ),
              subtitle != null
                  ? Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          subtitle ?? '',
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[400]),
                        ),
                      ],
                    )
                  : SizedBox(),
            ],
          ),
        ));
  }
}
