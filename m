Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792796722;
	b=pq5KViUcOhHnn/GlwDtZEL903NlrroOkZnIM3IsXjTow7llLyT1oAUZWhBS1FBfSOdJb
	 Sphbe/vRjVwU4VuFqKOEiHzaxRGPfbZxWjF+xGfYfqxAu2YdFKBS1SnnPYWeTdUjACIaH
	 oxpZoEljvwMXGUaPRuwtDeUhuucs+VEMP1ufbJUGgG6SBcfeu+sH4BxYNX+GTv6xJNzTI
	 sbbH+WqiDAGL6n7wknZm4M64arXzrn9An0v+VEdh+jF5ZgUC3PZdaq7/8a5zuhmyAAfqV
	 LelAzK4yF1Y8sL04d/Zf4KmsaOcQEn2cLEX4NQThUpby/i6Lr1A7FEwIa3NlVyGMKZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792796722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uCF2jlxxO/nA/5NS9hqh6uNWENCdEyROzaeBge0wfpI=;
	b=OhcgHLw2CzJGn+IV6MGem5WKSIF1BIVXZMqkE9DzRxWunjALhfKG9fMpCBPv9/yjIb1X
	 H5S6vG84pmYtbRr+67GXtnq/x50BDLzRHclgcCIxVuE46zR/RgLtGVwSQkf99d7y7hitK
	 gmnoqVZf2AGRErQ+VYcnkACJNFWRhAstU5BAD37iBA9mfcJpy5IHitB5tYxW7CcAaRdda
	 4AXj2c+sU2XlcetV0iTDMiM5gRWNDBnaxg3T9a2yDSTuQnOtUEGV2R3LrAUC0V3Q5uwJA
	 DdDrRBfi4SDjHnvU48pwz4Au7fz2Cp0VTyYfenK4ppEXxbYgJSLJppnq3/KGPcNApmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jUTcaJhV;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEEB606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DEEB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jUTcaJhV
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33fb4680717so1556292eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792796721; x=1793401521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uCF2jlxxO/nA/5NS9hqh6uNWENCdEyROzaeBge0wfpI=;
        b=jUTcaJhVMppiWpSVMnilazd4eMWMezQc/gLwfc50q0QqH3iX5JHRO8ENikv4H9yDyd
         LGG2Hml556XPLz8fLR9FwYwVjUh5Hpbda8eID0A8/aTh44Rbvs1AUWu9DQ2TqHsWANdU
         bs/444ddqLY8m7wVvngxnmjbOEf27pe1S5HmJP9BH0pGE+w1dvPo6zrBGf336uOo8Zdu
         tIRpp30247C1+WDjzZzi7OdFNKQrDfdZNFfp92TZ2CIbEvUs0BWDWoqIKYcozDm2Zvgs
         a7ETpVrkxOdOKqVh/EPK5JS6tD4FugCx3Jh6zOjUapZO4GtE/yVtPELUngLACgXhovBe
         pUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792796721; x=1793401521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uCF2jlxxO/nA/5NS9hqh6uNWENCdEyROzaeBge0wfpI=;
        b=pwGI9RiQjuMC0/ad/G+nz9/+7LmyXBcFPknrrG2boVV2pjgPP4F8YrfmSBDh51ahRn
         qzEGhe7vPe3PqROOx5ruHjUMzdZ/eZ6DhxUQ576i4IBx7Nb5/tUYCcw5KMTLZaQ0klnE
         lOIFpaQNmow8P6NMyqe5gLuS+8pL0kC1E6O80ea6zym3TrBlcV+nNVAgx0EuyHWHH/RY
         C6YKleqlS8vcIJKlbgIkMJqcCiXm/SuDDXbWPosI1fymXfce3iWQ/O59fuRXn2G/cNxf
         O2ItsJ5p0zBbqqqJIDVg3hkX0bg12tpmdfjFnFkm2maPkAoKHabkKTvs5t0B71/aTgkg
         o0yQ==
X-Forwarded-Encrypted: i=1; AKwUvByuyXxeL0mgq5ND60JOyqCc3TAchRP0PfC65RfqzjyoCjICBYsaVdWlpB8Pfe04E5m4UgJtd5ptka4vBZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLpiohug9BqjBdyEX6j9ViaDDGHrqLaDUaYRvwUo4D837B+5Sib
	5GCTuWtXMNxJC2td9DnYrTfrkCzlw2AotKrG18aMCTvrNk8vVUrtZ57u
X-Gm-Gg: AYBFou1rOD7fLWs7gPUp1PH6nlPvW2FgiBohB81oNAlCxcsWKy1kuD1D0cis7GHtGu0
	E1Jq8SFDKniE82kJor6s1NZMbODUSbflPzMCPx4BgXwvaWCnXIEq94MU/+bz8nbO+HXiEaN0vp4
	x14IzYmsfr8HgasQCZYzqwPGoLJSXi5vKkRJeq3arGj/AFv0Y9KBQAyTAVjhslNVlFVWSn3j7E4
	t9RVgJrEQ5SLlCKyyspl0KapBFFsgqeD4U6ebWCT46s68bJk1WTSHTCT+X0lMgvcq30YiEeJDum
	KjxqjEiIUzRWkVq4OSQZsusuEDgUUrLhVQUKCorGzLvwFwTToz+PBqMY85TJoTzCNCbMEprsQnZ
	wtHzfBthxMaQ52+Ol+wt2FF+07uVkrP0/UJ8grygInAS3dpwU4G3WJIdSWBm9QJMHBTFelI3ma9
	1O/JrHjygyNbZkyZdzpafA8bs5fnpT/l7P+6lqNBr1nplwGkKWv8yrOQhE4MMFWgUXsj2vCQSro
	NxVStd8LEANYj5t+KPM8nrPPuGZX7rseOQJayX/knGJH1u63bC53KrwdS5h2KIiOf9jXQWQAQuR
	Xk6V+9K637li4QrbY02l
X-Received: by 2002:a05:7301:dd84:b0:35d:5a2c:2321 with SMTP id 5a478bee46e88-369e84bc176mr963754eec.20.1792796720121;
        Fri, 23 Oct 2026 16:05:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:493:cd31:1e31:5982])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec864fsm1461802eec.24.2026.10.23.16.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:05:19 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:05:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alice Mikityanska <alice.kernel@fastmail.im>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	Ike Panhc <ikepanhc@gmail.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard
 controller
Message-ID: <atvn7F8XoS4FgO6-@google.com>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>
 <9250be99-ce79-4d86-a5eb-c7640fb7c421@app.fastmail.com>
 <f7bc115a-647e-4db1-9a36-659bafcb2d5d@app.fastmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7bc115a-647e-4db1-9a36-659bafcb2d5d@app.fastmail.com>

On Fri, Oct 23, 2026 at 07:37:34PM +0300, Alice Mikityanska wrote:
> On Fri, Oct 23, 2026, at 19:04, Alice Mikityanska wrote:
> > On Thu, Oct 22, 2026, at 07:50, Dmitry Torokhov wrote:
> >> On Ideapad Z570 the driver tries to disable and re-enable data coming
> >> from the touchpad by poking directly into 8042 keyboard controller.
> >> This may coincide with the controller resuming and leads to spews in
> >> dmesg and potentially other instabilities.
> >>
> >> Instead of using i8042_command() to control the touchpad state create
> >> an input handler that serves as a filter and drop events coming from
> >> the touchpad when it is supposed to be off.
> >>
> >> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> >> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >> ---
> >>
> >> v3:
> >> - add missing header includes (compiler.h, container_of.h, errno.h,
> >>   mod_devicetable.h, slab.h, spinlock.h)
> >> - drop stray blank line in ideapad_tpswitch_filter()
> >> - collect Reviewed-by from Mark Pearson
> >>
> >> v2:
> >> - fix inverted condition in ideapad_tpswitch_filter()
> >> - mark the handler as passive_observer so that touchpad is not activated
> >>   until there are real users
> >> - use READ_ONCE()/WRITE_ONCE() to access shared state flag
> >> - drop stray semicolon in to_tpswitch_handle()
> >> - update comments
> >>
> >>  drivers/platform/x86/lenovo/ideapad-laptop.c | 189 ++++++++++++++++++-
> >>  1 file changed, 180 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c 
> >> b/drivers/platform/x86/lenovo/ideapad-laptop.c
> >> index 8213524504ee..be890e82b9ef 100644
> >> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> >> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> >> @@ -14,23 +14,28 @@
> >>  #include <linux/bitops.h>
> >>  #include <linux/bug.h>
> >>  #include <linux/cleanup.h>
> >> +#include <linux/compiler.h>
> >> +#include <linux/container_of.h>
> >>  #include <linux/debugfs.h>
> >>  #include <linux/delay.h>
> >>  #include <linux/device.h>
> >>  #include <linux/dmi.h>
> >> -#include <linux/i8042.h>
> >> +#include <linux/errno.h>
> >>  #include <linux/init.h>
> >>  #include <linux/input.h>
> >>  #include <linux/input/sparse-keymap.h>
> >>  #include <linux/jiffies.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/leds.h>
> >> +#include <linux/mod_devicetable.h>
> >>  #include <linux/module.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/platform_profile.h>
> >>  #include <linux/power_supply.h>
> >>  #include <linux/rfkill.h>
> >>  #include <linux/seq_file.h>
> >> +#include <linux/slab.h>
> >> +#include <linux/spinlock.h>
> >>  #include <linux/string_choices.h>
> >>  #include <linux/sysfs.h>
> >>  #include <linux/types.h>
> >> @@ -210,6 +215,13 @@ struct ideapad_private {
> >>  		struct led_classdev led;
> >>  		unsigned int last_brightness;
> >>  	} fn_lock;
> >> +	struct {
> >> +		bool initialized;
> >> +		bool active; /* true means touchpad is enabled */
> >> +		struct input_handler handler;
> >> +		struct input_dev *tp_dev;
> >> +		spinlock_t lock;
> >> +	} tp_switch;
> >>  };
> >> 
> >>  static bool no_bt_rfkill;
> >> @@ -234,7 +246,7 @@ MODULE_PARM_DESC(set_fn_lock_led,
> >>  static bool ctrl_ps2_aux_port;
> >>  module_param(ctrl_ps2_aux_port, bool, 0444);
> >>  MODULE_PARM_DESC(ctrl_ps2_aux_port,
> >> -		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad 
> >> on/off toggle. If you need this please report this to: 
> >> platform-driver-x86@vger.kernel.org");
> >> +		 "Enable driver based suppression of touchpad events on touchpad 
> >> on/off toggle. If you need this please report this to: 
> >> platform-driver-x86@vger.kernel.org");
> >> 
> >>  static bool touchpad_ctrl_via_ec;
> >>  module_param(touchpad_ctrl_via_ec, bool, 0444);
> >> @@ -1462,6 +1474,159 @@ static void 
> >> ideapad_check_special_buttons(struct ideapad_private *priv)
> >>  	}
> >>  }
> >> 
> >> +struct ideapad_tpswitch_handle {
> >> +	struct input_handle handle;
> >> +	struct ideapad_private *priv;
> >> +};
> >> +
> >> +#define to_tpswitch_handle(h) \
> >> +	container_of(h, struct ideapad_tpswitch_handle, handle)
> >> +
> >> +static int ideapad_tpswitch_connect(struct input_handler *handler,
> >> +				    struct input_dev *dev,
> >> +				    const struct input_device_id *id)
> >> +{
> >> +	struct ideapad_private *priv =
> >> +		container_of(handler, struct ideapad_private, tp_switch.handler);
> >> +	struct ideapad_tpswitch_handle *h;
> >> +	int error;
> >> +
> >> +	h = kzalloc_obj(*h);
> >> +	if (!h)
> >> +		return -ENOMEM;
> >> +
> >> +	h->priv = priv;
> >> +	h->handle.dev = dev;
> >> +	h->handle.handler = handler;
> >> +	h->handle.name = "ideapad-tpswitch";
> >> +
> >> +	error = input_register_handle(&h->handle);
> >> +	if (error)
> >> +		goto err_free_handle;
> >> +
> >> +	/*
> >> +	 * We need to open the input handle so the input core invokes our
> >> +	 * filter, but since we mark our handler as passive observer, this
> >> +	 * will not cause the underlying touchpad hardware to be started
> >> +	 * if there are no other users.
> >> +	 */
> >> +	error = input_open_device(&h->handle);
> >> +	if (error)
> >> +		goto err_unregister_handle;
> >> +
> >> +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> >> +		priv->tp_switch.tp_dev = dev;
> >> +
> >> +	return 0;
> >> +
> >> +err_unregister_handle:
> >> +	input_unregister_handle(&h->handle);
> >> +err_free_handle:
> >> +	kfree(h);
> >> +	return error;
> >> +}
> >> +
> >> +static void ideapad_tpswitch_disconnect(struct input_handle *handle)
> >> +{
> >> +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> >> +	struct ideapad_private *priv = h->priv;
> >> +
> >> +	scoped_guard(spinlock_irq, &priv->tp_switch.lock)
> >> +		priv->tp_switch.tp_dev = NULL;
> >> +
> >> +	input_close_device(handle);
> >> +	input_unregister_handle(handle);
> >> +	kfree(h);
> >> +}
> >> +
> >> +static bool ideapad_tpswitch_filter(struct input_handle *handle,
> >> +				    unsigned int type, unsigned int code,
> >> +				    int value)
> >> +{
> >> +	struct ideapad_tpswitch_handle *h = to_tpswitch_handle(handle);
> >> +	struct ideapad_private *priv = h->priv;
> >> +
> >> +	if (READ_ONCE(priv->tp_switch.active))
> >> +		return false;
> >> +
> >> +	/* Allow passing button release events, drop everything else */
> >> +	return !(type == EV_KEY && value == 0) &&
> >> +	       !(type == EV_SYN && code == SYN_REPORT);
> >> +}
> >> +
> >> +static const struct input_device_id ideapad_tpswitch_ids[] = {
> >> +	{
> >> +		.flags = INPUT_DEVICE_ID_MATCH_EVBIT |
> >> +				INPUT_DEVICE_ID_MATCH_KEYBIT |
> >> +				INPUT_DEVICE_ID_MATCH_ABSBIT,
> >> +		.bustype = BUS_I8042,
> >> +		.vendor = 0x0002,
> >> +		.evbit = { BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS) },
> >> +		.keybit = { [BIT_WORD(BTN_TOOL_FINGER)] =
> >> +				BIT_MASK(BTN_TOOL_FINGER) },
> >> +		.absbit = { BIT_MASK(ABS_X) | BIT_MASK(ABS_Y) |
> >> +				BIT_MASK(ABS_PRESSURE) |
> >> +				BIT_MASK(ABS_TOOL_WIDTH) },
> >> +	},
> >> +	{ }
> >> +};
> >> +
> >> +static int ideapad_tpswitch_init(struct ideapad_private *priv)
> >> +{
> >> +	int error;
> >> +
> >> +	if (!priv->features.ctrl_ps2_aux_port)
> >> +		return 0;
> >> +
> >> +	spin_lock_init(&priv->tp_switch.lock);
> >> +
> >> +	priv->tp_switch.handler.name = "ideapad-tpswitch";
> >> +	priv->tp_switch.handler.id_table = ideapad_tpswitch_ids;
> >> +	priv->tp_switch.handler.filter = ideapad_tpswitch_filter;
> >> +	priv->tp_switch.handler.connect = ideapad_tpswitch_connect;
> >> +	priv->tp_switch.handler.disconnect = ideapad_tpswitch_disconnect;
> >> +	priv->tp_switch.handler.passive_observer = true;
> >> +
> >> +	error = input_register_handler(&priv->tp_switch.handler);
> >> +	if (error) {
> >> +		dev_err(&priv->platform_device->dev,
> >> +			"failed to register touchpad switch handler: %d",
> >> +			error);
> >> +		return error;
> >> +	}
> >> +
> >> +	priv->tp_switch.initialized = true;
> >> +	return 0;
> >> +}
> >> +
> >> +static void ideapad_tpswitch_exit(struct ideapad_private *priv)
> >> +{
> >> +	if (priv->tp_switch.initialized) {
> >> +		input_unregister_handler(&priv->tp_switch.handler);
> >> +		priv->tp_switch.initialized = false;
> >> +	}
> >> +}
> >> +
> >> +static void ideapad_tpswitch_toggle(struct ideapad_private *priv, bool 
> >> on)
> >> +{
> >> +	guard(spinlock_irq)(&priv->tp_switch.lock);
> >> +
> >> +	WRITE_ONCE(priv->tp_switch.active, on);
> >> +	if (!on) {
> >> +		struct input_dev *tp_dev = priv->tp_switch.tp_dev;
> >> +		if (tp_dev) {
> >> +			input_report_key(tp_dev, BTN_TOUCH, 0);
> >> +			input_report_key(tp_dev, BTN_TOOL_FINGER, 0);
> >> +			input_report_key(tp_dev, BTN_TOOL_DOUBLETAP, 0);
> >> +			input_report_key(tp_dev, BTN_TOOL_TRIPLETAP, 0);
> >> +			input_report_key(tp_dev, BTN_LEFT, 0);
> >> +			input_report_key(tp_dev, BTN_RIGHT, 0);
> >> +			input_report_key(tp_dev, BTN_MIDDLE, 0);
> >
> > Hello!
> >
> > Tested-by: Alice Mikityanska <alice.kernel@fastmail.im>
> >
> > Seems to work well, without any "lost synchronization" messages in
> > dmesg. There is a new effect, caused by the above lines: if the finger
> > stays on the surface the entire time, and the user disables and enables
> > the touchpad, the pointer won't move until the user lifts the finger and
> > puts it back. Although it's unlikely to break anyone's workflow, I need
> > to double-check that the evdev doesn't emit some invalid sequence of
> > events, e.g., touch 0 followed by some movements, or touch 0 followed by
> > another touch 0.
> 
> Yes, I see that BTN_TOUCH 0 can be followed by another BTN_TOUCH 0,
> either in the event of lifting the finger after reenabling the touchpad,
> or if disabling-enabling-disabling touchpad all while holding the
> finger. Not sure if it's valid semantics, maybe it is.
> 
> In the scenario I'm describing (put the finger, disable, enable,
> move the finger), EV_ABS events start being generated after enabling
> the touchpad, without the preceding BTN_TOUCH 1, so the pointer
> doesn't move.

I think this is acceptable. But if someone cares enough they can add
tracking of true state and re-issue BTN_* events when touchpad is
enabled again.

Thanks.

-- 
Dmitry
