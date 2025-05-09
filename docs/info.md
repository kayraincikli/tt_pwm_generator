<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project aims to implement a PWM generator with an adjustable duty cycle. The user enters duty cycle values via the ui_in port. The pwm_generator module creates a 50 kHz PWM signal with the specified duty cycle.
## How to test

Enter a specified duty cycle value and observe the uo_out[0] port. The PWM signal should be present on this output.

## External hardware

There is no external hardware.
