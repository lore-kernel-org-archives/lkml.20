Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853684;
	b=YuKUneAU/5w/ys6IND5sdjSSjW7uq39Fkx16nrOMwYtTsfNzVzdl9nu1Cz3CUcG75EMI
	 7SKlSEDU2CyUkVqwvRYeXZwb3TevsTcrvjF8QiynwdVM7IyS0ssYH0lkLSnVnlc6YSKis
	 E3cSMDNXky8FW448342h/r6DbTsng2b8w2B40nx1PugnmfX7EsOnM4FlH6gZCs8c5biOP
	 RkuOXoFSYv/c894j47IOpChEzIG71mbAmWwAYlIppCvNw+JiV0effemEOfJeUKUdsU0+U
	 NA8wl4QUYz3SJRiY4/Xfbiqhg23Ax4KGvmhIcT+U1f5o6Bp6R+Gw4M/FC7/ArzcFvpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853684;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=fxJgyiv8oOoTp+D10o3vZr2gQ5VGkKt/9+lDC8DjeV8=;
	b=faxlFgdBPXKKzREws85QaiGZTeGkvAP5ZY0796HJu5agQuQx4s5AccZ2gJfwMTXm30eo
	 FBcV+PRykYkyJMZoe9idLCxE/VXhOZEFVuEZzvuuZ92Y4x8MWWfjH+Dyvv1Miii3nQhU+
	 XFhytzMkX0tcdYgYYKSaM7+R7ZFcZ3zlu4UcLLFQ6jzeW12uOp4RiD/oEUMzoQ6t54+Od
	 bMFZextfeN6DzJiTQmu8u25s+lm4Lg4ejVhj92/Riur2zc6FHlOa7unBeDn8foLldWb1G
	 jMW9ARWnn57rLut+RJVqq62Ip8hfAdlHOxbgBEN78b/K0VFOADdZjUbbGpf57Av8i3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LDuzLia+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5EB606A31C;
	Mon, 16 Nov 2026 18:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LDuzLia+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807661F000C4;
	Mon, 16 Nov 2026 18:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853684;
	bh=fxJgyiv8oOoTp+D10o3vZr2gQ5VGkKt/9+lDC8DjeV8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LDuzLia+wSrpqSKniNnq7YdBi008lPmTmB6a5Mw7m/LdU+dcPV1j0VQ9nifZZQFnT
	 yb9MZImV/S1D7lbk/kcjkXFpISHnmCTjcAsn+VgSd9rm2gWMy8LyMxIT0qMOrLfKu1
	 j6Mxi7WDHsvhEsABKYCRi+IE7+gLVoZOQP2feZKsd5xQwyOMTHJQ/8oRurun7b+/dO
	 SwIoMHCyUlMRbI1VBnTDX46KBIkklYH6ElSRTh0YetC3g+C+SONPLR1bRsERQgNXPP
	 Qo8VELssED7aMNd4fOrsA3ILxVagE1dWk3Lskq6VTxbzCwJC+SeKXcmD99AdtCIGfT
	 l/CiNmzaCjMcg==
Subject:
 Re: [PATCH net-next] net: dsa: mv88e6xxx: Enable LED control on 88E6171
From: netdev-bot+sashiko@kernel.org
To: olek2@wp.pl
Cc: andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 18:28:03 +0000
Message-ID: <179485368308.3136.7792285463770201069@kernel.org>
In-Reply-To: <20261115181305.2860498-1-olek2@wp.pl>
References: <20261115181305.2860498-1-olek2@wp.pl>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 1 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] mv88e6xxx_port_setup_leds() (drivers/net/dsa/mv88e6xxx/leds.c)
  now installs the four hw_control_* callbacks only when the chip has…
- [Low] The commit message only talks about enabling LEDs on the 88E6171.

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the patch
  extends it to the 88E6171 and adds new callbacks that hit it.
- [Low] mv88e6xxx_led_set_blinking_period() ignores its `led` argument
  and rewrites the per-port Stretch/Blink register (pointer 0x6, "for…

--

net: dsa: mv88e6xxx: Enable LED control on 88E6171

This patch enables LED control on the 88E6171. That switch has four LEDs
per port and a register layout similar to the 6352 family. The patch also
adds per-chip num_leds and led_hw_triggers fields, LED2/LED3 register
definitions and callbacks, and installs the hw_control callbacks only
when led_hw_triggers is set.

> diff --git a/drivers/net/dsa/mv88e6xxx/leds.c b/drivers/net/dsa/mv88e6xxx/leds.c
> index ab3bc645da566..925c120afba33 100644
> --- a/drivers/net/dsa/mv88e6xxx/leds.c
> +++ b/drivers/net/dsa/mv88e6xxx/leds.c

[ ... ]

> @@ -526,24 +573,40 @@ static int mv88e6xxx_led_blink_set(struct mv88e6xxx_port *p, int led,
>  	if (err)
>  		return err;
>  
> -	err = mv88e6xxx_port_led_read(p->chip, p->port,
> -				      MV88E6XXX_PORT_LED_CONTROL_POINTER_LED01_CTRL,
> -				      &reg);
> +	if (led == 2 || led == 3)
> +		err = mv88e6xxx_port_led_read(p->chip, p->port,
> +					      MV88E6XXX_PORT_LED_CONTROL_POINTER_LED23_CTRL,
> +					      &reg);

[Severity: Low]
This isn't a bug introduced by this patch, but it now affects up to four
LEDs per port instead of two.

The mv88e6xxx_led_set_blinking_period() call just above this ignores its
led argument. It rebuilds the per-port Stretch/Blink register from
scratch:

drivers/net/dsa/mv88e6xxx/leds.c:mv88e6xxx_led_set_blinking_period() {
    ...
	reg = 0;
    ...
	/* Set up blink rate */
	reg |= MV88E6XXX_PORT_LED_CONTROL_POINTER_STRETCH_BLINK;

	return mv88e6xxx_port_led_write(p->chip, p->port, reg);
}

On the 6171, a blink_set on LED2 can change the blink rate and pulse
stretch of LED0, LED1 or LED3 on the same port. That happens when the
other LED is in forced blink or a hardware activity mode, and the LED
core still holds that LED's old blink_delay_on/off values.

Is it intended that one LED's blink period changes the other LEDs on the
port? The result is only a wrong blink rate. Nothing crashes.

[ ... ]

> @@ -576,6 +639,34 @@ static int mv88e6xxx_led1_blink_set(struct led_classdev *ldev,
>  	return err;
>  }
>  
> +static int mv88e6xxx_led2_blink_set(struct led_classdev *ldev,
> +				    unsigned long *delay_on,
> +				    unsigned long *delay_off)
> +{
> +	struct mv88e6xxx_port *p = container_of(ldev, struct mv88e6xxx_port, led2);
> +	int err;
> +
> +	mv88e6xxx_reg_lock(p->chip);
> +	err = mv88e6xxx_led_blink_set(p, 2, delay_on, delay_off);
> +	mv88e6xxx_reg_unlock(p->chip);
> +
> +	return err;
> +}

[Severity: High]
This is a pre-existing issue, but this patch extends it to the 88E6171
by adding .port_setup_leds to mv88e6171_ops. The new LED2/LED3
callbacks also hit it.

mv88e6xxx_setup() takes chip->reg_lock and keeps it held during port
setup, LED classdev registration included. If a DT LED node has
linux,default-trigger = "timer", the trigger is activated synchronously
inside registration:

mv88e6xxx_setup()
  mv88e6xxx_reg_lock(chip)
  mv88e6xxx_setup_port()
    mv88e6xxx_port_setup_leds()
      devm_led_classdev_register_ext()
        led_classdev_register_ext()
          led_trigger_set_default()
            timer_trig_activate()
              led_blink_set()
                led_blink_setup()
                  mv88e6xxx_led2_blink_set()
                    mv88e6xxx_reg_lock(p->chip)

Can this deadlock probe on the non-recursive reg_lock that the same task
already holds? The LED core's trigger locks would stay held too.

With linux,default-trigger = "netdev", netdev_trig_activate() calls
register_netdevice_notifier(). That takes rtnl while reg_lock is held,
which is the reverse of the rtnl -> reg_lock order used elsewhere in
the driver.

Could the LED classdevs be registered outside the reg_lock section, or
could the lock be dropped around registration?

[ ... ]

> @@ -771,13 +862,13 @@ int mv88e6xxx_port_setup_leds(struct mv88e6xxx_chip *chip, int port)
>  	}
>  
>  	fwnode_for_each_child_node(leds, led) {
> -		/* Reg represent the led number of the port, max 2
> +		/* Reg represent the led number of the port, max 4
>  		 * LEDs can be connected to each port, in some designs
>  		 * only one LED is connected.
>  		 */
>  		if (fwnode_property_read_u32(led, "reg", &led_num))
>  			continue;
> -		if (led_num > 1) {
> +		if (led_num >= mv88e6xxx_num_leds(chip)) {

[Severity: Low]
This isn't a bug, but the commit message only says "Enable LED control
on the Marvell 88E6171". The patch also adds the num_leds and
led_hw_triggers fields, edits the 6172/6176/6240/6352 table entries, and
replaces the fixed led_num > 1 check with this table-driven bound.
Should the commit message mention these changes?

Also, a future chip could set .port_setup_leds and leave .num_leds at its
default of 0. Every DT LED would then be rejected with -EINVAL, and
mv88e6xxx_setup_port() would pass that up:

	err = chip->info->ops->port_setup_leds(chip, port);
	if (err && err != -EOPNOTSUPP)
		return err;

All current users of mv88e6xxx_port_setup_leds() set num_leds, so
nothing changes today.

[ ... ]

> @@ -805,17 +900,27 @@ int mv88e6xxx_port_setup_leds(struct mv88e6xxx_chip *chip, int port)
>  		if (led_num == 0) {
>  			l->brightness_set_blocking = mv88e6xxx_led0_brightness_set_blocking;
>  			l->blink_set = mv88e6xxx_led0_blink_set;
> -			l->hw_control_is_supported = mv88e6xxx_led0_hw_control_is_supported;
> -			l->hw_control_set = mv88e6xxx_led0_hw_control_set;
> -			l->hw_control_get = mv88e6xxx_led0_hw_control_get;
> -			l->hw_control_get_device = mv88e6xxx_led0_hw_control_get_device;
> -		} else {
> +			if (mv88e6xxx_has_led_hw_triggers(chip)) {
> +				l->hw_control_is_supported = mv88e6xxx_led0_hw_control_is_supported;
> +				l->hw_control_set = mv88e6xxx_led0_hw_control_set;
> +				l->hw_control_get = mv88e6xxx_led0_hw_control_get;
> +				l->hw_control_get_device = mv88e6xxx_led0_hw_control_get_device;
> +			}
> +		} else if (led_num == 1) {

[ ... ]

> +		} else if (led_num == 2) {
> +			l->brightness_set_blocking = mv88e6xxx_led2_brightness_set_blocking;
> +			l->blink_set = mv88e6xxx_led2_blink_set;
> +		} else {
> +			l->brightness_set_blocking = mv88e6xxx_led3_brightness_set_blocking;
> +			l->blink_set = mv88e6xxx_led3_blink_set;
>  		}
>  		l->hw_control_trigger = "netdev";

[Severity: Medium]
The hw_control_* callbacks are now only installed for LED 0 and LED 1 on
chips with led_hw_triggers. hw_control_trigger is still set to "netdev"
for every LED, though.

Two groups of LEDs end up with hw_control_trigger set and all four
hw_control_* callbacks NULL:

- every LED on the 88E6171, which has no .led_hw_triggers in its
  mv88e6xxx_table entry
- LED 2 and LED 3 on any chip

The LED core decides whether to expose the offload attribute only from
hw_control_trigger:

drivers/leds/led-triggers.c:led_trigger_is_visible() {
    ...
	if (attr == &dev_attr_trigger_may_offload_to_hw.attr)
		return led_cdev->hw_control_trigger ? attr->mode : 0;
    ...
}

Won't these LEDs show /sys/class/leds/<led>/trigger_may_offload_to_hw and
report "netdev"? The netdev trigger can never offload to them, because
supports_hw_control() fails when the callbacks are NULL.

Documentation/ABI/testing/sysfs-class-led says this file "Only exists
when the LED supports trigger offload".

Could the hw_control_trigger assignment move inside the
mv88e6xxx_has_led_hw_triggers() blocks for LED 0 and LED 1?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115181305.2860498-1-olek2%40wp.pl
