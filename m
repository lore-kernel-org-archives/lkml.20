Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651844;
	b=YaYxqqzTKDU7dwShAjmENNbP6B5yLljtwW/1iTYvdKw3z00ufX3nVT3tRXhBLgUszP/5
	 DkUhcGv8Wlqzisg65hsJFqDiyQbbnG7oa+PWHQd3ntxp3YMCFBLDP0ZZxcYDqRyj3VwhZ
	 3CiASMKmOT5AjLCIBRSBjI/d/XptoR1D/1hwenapjIbbsNHTjEj6aoV29A6lQaL0LLY/C
	 aEyQmRO6ILpe6BWgkocbLTB8BOBng5cylotLbIAZNMNmHM0ltX9qhJ2e8/RRxZ6dVpJTv
	 wZ8ds5xVjHdx/buiP5kNoNBeFBVZS6QYI2apASZe4lav8ske4It4hs+D7UYYfOe0owQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651844;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0NQL5s0WDphgner6cgyWWoQeysFVr25nGufJIR1kK5Y=;
	b=WpZjX55wgziSANhry1UUI8gISPAkd+OAgtOut+fcNPpmHk7xAYsixzqbGUBHA871rlpm
	 nI+p2/VUuVPBI/SRYDHSGureD3gci4ZzOvDn9h6j2XhQ6Nd+Q1eA1xDY4TfvbW7Otn3fO
	 IspmAXUNVi+Iz2XpzHDTalOeZAvJ8w4ID71NglIfWMt1gOz9Xm44Javn6H19+pixhMTEb
	 Rrqy4apEM278zKoXYtNJRfOMOVmsCtP/IU3DspB1t9oJbmOLsrbpG4tbVMbacpFCMZMhC
	 +Y/k2f1Y8bkUmjuZWqhM6oC8itJqG425Ax9NKwW36ILxsMjCByr8fv8F/mtpMf7PsfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQqq6q5M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D87606A8B3;
	Sat, 14 Nov 2026 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQqq6q5M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922431F000C4;
	Sat, 14 Nov 2026 10:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794651844;
	bh=0NQL5s0WDphgner6cgyWWoQeysFVr25nGufJIR1kK5Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=cQqq6q5M395ND4Q6xujEqlbk5GU0mQ5MhMatVDIyCQ2aeDIXd7Bo1Cw7CBcZ3amF1
	 Zy3CoY/Q3M+aRYk28CmdzWL0DbgjkPQrLrKgA7xHFkXBBaDrBbOPnSSJ8Cwbotg+w/
	 RmX2okcphl7ESSov71gKqjMqy8LLJ766IDQBOqmztsGJtcbPl2WPleVfEbFEVMR0OV
	 h1LpaX9zvo6EszbbDU/qU3U61/s7Wrd/Mk3IaFbUXyh4dOO53qVNfhNKrTYewHNGyS
	 i2IVeC3Xnjy8br8Y9rHKkJceX382sH1BoFffcSx5SfdoE4iN8Q1qfvaV4PTJcTWNLZ
	 9xfLpHzClIgDw==
Subject:
 Re: [PATCH 2/2] net: phy: motorcomm: add missing trigger link for YT8521
From: netdev-bot+sashiko@kernel.org
To: amadeus@jmu.edu.cn
Cc: Frank.Sae@motor-comm.com, andrew@lunn.ch, pabeni@redhat.com,
 kuba@kernel.org, edumazet@kernel.org, davem@davemloft.net,
 hkallweit1@gmail.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Sat, 14 Nov 2026 10:24:03 +0000
Message-ID: <179465184313.2199510.4563616682905397306@kernel.org>
In-Reply-To: <20261110100001.1873309-2-amadeus@jmu.edu.cn>
References: <20261110100001.1873309-2-amadeus@jmu.edu.cn>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In drivers/net/phy/motorcomm.c, yt8521_led_hw_control_get()
  now sets TRIGGER_NETDEV_LINK when YT8521_LED_10_ON_EN,…
- [Medium] net: phy: motorcomm: bugs in yt8521_led_brightness_set() and
  force mode
- [Low] The patch fixes a user-visible get/set asymmetry: after the
  netdev trigger activates on hardware set up for 'link at any speed',…

--

net: phy: motorcomm: add missing trigger link for YT8521

This patch makes yt8521_led_hw_control_get() report TRIGGER_NETDEV_LINK
when the 10, 100 and 1000 link enable bits are all set in the LED config
register. The goal is to match yt8521_led_hw_control_set(), which already
handles TRIGGER_NETDEV_LINK.

> net: phy: motorcomm: add missing trigger link for YT8521

[Severity: Low]
This isn't a bug, but should this carry a Fixes: tag? The get/set
asymmetry comes from the commit that added the LED callbacks:

Fixes: 355b82c54c12 ("net: phy: motorcomm: Add support for PHY LEDs on YT8521")

Also, the subject only names YT8521. The PHY_ID_YT8531 entry in
motorcomm_phy_drvs[] uses the same callback:

    .led_hw_control_get = yt8521_led_hw_control_get,

so YT8531 behaviour changes too. Could the commit message say so?

> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index bcd3afef0d496..5b1d17bd231a7 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
> @@ -1901,6 +1901,11 @@ static int yt8521_led_hw_control_get(struct phy_device *phydev, u8 index,
>  	if (val & YT8521_LED_10_ON_EN)
>  		__set_bit(TRIGGER_NETDEV_LINK_10, rules);
>  
> +	if ((val & YT8521_LED_10_ON_EN) &&
> +	    (val & YT8521_LED_100_ON_EN) &&
> +	    (val & YT8521_LED_1000_ON_EN))
> +		__set_bit(TRIGGER_NETDEV_LINK, rules);

[Severity: Medium]
This isn't introduced by this patch, but it is on the same hardware
control path. yt8521_led_brightness_set(), added by the previous patch
in this series, seems to have a few problems.

The return value of ytphy_read_ext() is stored straight into u16 regs:

    regs = ytphy_read_ext(phydev, YTPHY_LED_GENERAL_CFG_REG);

If the MDIO access fails, the negative errno is truncated. The force
bits are applied on top of it and the result is written back to
YTPHY_LED_GENERAL_CFG_REG. Wouldn't that clobber the force enable and
force mode bits of every LED, not just the one at index?

phy_led_set_brightness() only holds phydev->lock around the callback,
but ytphy_read_ext() and ytphy_write_ext() require the caller to hold
the MDIO bus lock. Each access is a YTPHY_PAGE_SELECT write followed
by a YTPHY_PAGE_DATA access. Another user of the bus can change the
page select in between, so the wrong extended register gets read or
written. The read-modify-write of YTPHY_LED_GENERAL_CFG_REG is not
atomic either.

Should this use ytphy_write_ext_with_lock() and
ytphy_modify_ext_with_lock() instead? That would also take care of the
unchecked read above. The ytphy_read_ext() and ytphy_write_ext() calls
in yt8521_led_hw_control_get() and yt8521_led_hw_control_set() look
like they have the same locking issue.

Finally, when value != LED_OFF this sets YTPHY_LED_FORCE_EN(index) in
YTPHY_LED_GENERAL_CFG_REG. But yt8521_led_hw_control_set() only writes
YT8521_LED0_CFG_REG + index and never clears the force bits.

The netdev trigger does not turn the LED off before offloading.
set_baseline_state() calls hw_control_set() directly when
trigger_data->hw_control is true. led_trigger_set() only forces
LED_OFF when a previous trigger is being removed.

So take an LED with trigger none. Writing 1 to brightness and then
selecting the netdev trigger with an offloadable mode would leave the
force bit set. The LED then stays lit regardless of link state or
activity.

Should yt8521_led_hw_control_set() clear YTPHY_LED_FORCE_EN(index) and
YTPHY_LED_FORCE_MODE(index) before programming the rules, similar to
what mxl86110_led_hw_control_set() does?

[Severity: Medium]
TRIGGER_NETDEV_LINK_10, LINK_100 and LINK_1000 are still set just above
this, so the reported mode becomes LINK | LINK_10 | LINK_100 | LINK_1000.
Can the netdev trigger work with that combination?

netdev_trig_activate() stores the result without checking it:

drivers/leds/trigger/ledtrig-netdev.c:netdev_trig_activate() {
    ...
			rc = led_cdev->hw_control_get(led_cdev, &mode);
			if (!rc)
				trigger_data->mode = mode;
    ...
}

But netdev_led_attr_store() treats LINK and the per-speed bits as
mutually exclusive:

drivers/leds/trigger/ledtrig-netdev.c:netdev_led_attr_store() {
    ...
	assign_bit(bit, &mode, state);

	if (test_bit(TRIGGER_NETDEV_LINK, &mode) &&
	    (test_bit(TRIGGER_NETDEV_LINK_10, &mode) ||
	     test_bit(TRIGGER_NETDEV_LINK_100, &mode) ||
	     test_bit(TRIGGER_NETDEV_LINK_1000, &mode) ||
    ...
		return -EINVAL;
    ...
}

Say the trigger activates on an LED whose config register has the
10/100/1000 bits set. That can be the boot default, or the result of an
earlier yt8521_led_hw_control_set() with TRIGGER_NETDEV_LINK, which
writes exactly those three bits.

In that case, wouldn't every sysfs write that leaves LINK set (tx=1,
rx=1, full_duplex=1, link_10=0, even link=1) now fail with -EINVAL?
Only link=0 would get through.

Before this patch, get returned LINK_10 | LINK_100 | LINK_1000, which
is a valid mode, so those writes worked. It also means set(LINK)
followed by get gives back a mode the trigger rejects.

Should get report TRIGGER_NETDEV_LINK instead of the three per-speed
bits when all three are on, rather than in addition to them?

realtek_main.c (rtl8211f, rtl8211e, rtl822x) and air_an8801.c use the
same additive pattern, so they seem to have the same latent conflict.

> +
>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110100001.1873309-1-amadeus%40jmu.edu.cn
