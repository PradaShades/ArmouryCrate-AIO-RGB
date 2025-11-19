# ArmouryCrate AIO Pump RGB 

I recently bought a new PC and installed **ArmouryCrate**. After updating all my equipment, I noticed that the RGB on my AIO pump stopped working correctly.

I tried to reverse the changes, but I had no luck. I also tried disabling ArmouryCrate services, but after restarting my PC, ArmouryCrate would automatically start again.

To solve this, I created a `.bat` file that allows you to **enable or disable ArmouryCrate services**.

## Observations

- With ArmouryCrate services **enabled**:
  - The RGB on my AIO pump disappears.
  - The temperature display still works.
  - This isn’t a problem since my pump only has a rainbow mode, I can switch it on or off to match my PC’s color scheme.

- With ArmouryCrate services **disabled**:
  - My pump returns to its default RGB.

---

This `.bat` file gives you control over ArmouryCrate services, allowing you to switch between default RGB and the ArmouryCrate controlled settings.

I hope this helps someone who had the same problem as me.
