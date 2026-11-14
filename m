Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794651843;
	b=u7JlrHe8Y8Lg3SjmvTIe7PLWZ/wZghvrKJJC/9szBS5/4KXAiDmkYv+Qv/ph2Yy6/AvA
	 fCo4TpZ304gMenvVtFV7aD4XhAuEO97ys92jAiJ5z5ROXJGxRuVpiAd2kV8GRym66Wyfv
	 5M7hu96syZJwurqE+TFYupnqh2eOjdH2dYdLkQ/pjIydC0BsKwlRQXqSMJPem2LPMFVrh
	 rC+WPvqBC75+4P0CVm3G7+awdocH2CAfhwDL0wKWOx4es14+4feaB078hSp5GfeD3SsUG
	 mqNWl29RGlhCP5mb84/t8cnZemeDZi81cPDdYF2/s1BLi6YHJNLfjsFDvpi9gWAk6TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794651843;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=cXOuqAvl7lmb23KfpFT0rOHSjnlCKAxYofLA2Hv76f4=;
	b=3KiVEKnfbsantzs2wMTebo4h0McR1z8yJea9tAFbD7nnyhManxpKGMq9t60TIst3nOP+
	 cGunjVAKY5WRtSqWflGlE3errvqSZVrDC9hjZDBEJA74Zcbg4zYmHX3KwWSVHOd6FaL0i
	 1fLhLQwqgHN5l2AV7GwYMYND5EU8Y86HYWlNMKLv2vEF9BxmIzNSG7wVxSc6kanYSPp5O
	 tPEQAKqHHqzQHHUVJRF5MIG6cTFEaGvXF9FoJyFv5kkQ1SonHdNU3BrFG/xrzvp5SC7e+
	 qb+2M7wT0+VMzW+lPiT7txeU7gsNBsnLiTSXLLPfkkHqX3jXbDUkAhPpP9cnb29lOQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Jb/e2ve3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E09F606A886;
	Sat, 14 Nov 2026 10:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jb/e2ve3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB991F000C4;
	Sat, 14 Nov 2026 10:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794651843;
	bh=cXOuqAvl7lmb23KfpFT0rOHSjnlCKAxYofLA2Hv76f4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Jb/e2ve31iVxaiDP/T0HG0BaN26gfQQxuyZM3+Ha+5AOc7AuzOH+hgURuyPN88efw
	 jFJ7Xl+XoGhi2DGexvezQWi75ZFOukh5X6cs/JNF8jvcfdBTa5O2i/nTzGm59zpKiI
	 Jf9sRi2DDHKJx/w5HgHGZT+Z30mOcHZxkV218+zfo0Yibr6d3z154vmfLPQc+EjhQX
	 E7zGMZMlkcyDA+55GzjlOVE/Z5776YvL2/A4ao5lzcWlhF7a2tVvprSxbLWOihU15K
	 rpk7z4bySjF7Hl6qJrA9+Cxu3B3/hucIefR94c0tVc8Ky5SjTvDowHIVA2IZSUfuUu
	 dDwmWC0OiCGNQ==
Subject:
 Re: [PATCH 1/2] net: phy: motorcomm: add led_brightness_set for YT8521
From: netdev-bot+sashiko@kernel.org
To: amadeus@jmu.edu.cn
Cc: Frank.Sae@motor-comm.com, andrew@lunn.ch, pabeni@redhat.com,
 kuba@kernel.org, edumazet@kernel.org, davem@davemloft.net,
 hkallweit1@gmail.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Sat, 14 Nov 2026 10:24:01 +0000
Message-ID: <179465184198.2199510.17045416726909844908@kernel.org>
In-Reply-To: <20261110100001.1873309-1-amadeus@jmu.edu.cn>
References: <20261110100001.1873309-1-amadeus@jmu.edu.cn>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 (1) · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] yt8521_led_brightness_set()
  (drivers/net/phy/motorcomm.c:1782-1805) runs three indirect extended-…
- [Medium] When value != LED_OFF, the new yt8521_led_brightness_set()
  sets YTPHY_LED_FORCE_EN(index)|YTPHY_LED_FORCE_MODE(index) in…
- [Medium] In yt8521_led_brightness_set() (motorcomm.c:1796), the int
  returned by ytphy_read_ext() goes into `u16 regs` with no `< 0` check.
- [Low] The new macros YTPHY_LED_FORCE_MODE(x)=BIT(x*3) and
  YTPHY_LED_FORCE_EN(x)=BIT(x*3+2) (motorcomm.c:261-263) use a 3-bit…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the existing
  yt8521_led_hw_control_set() and yt8521_led_hw_control_get() (added in…

--

net: phy: motorcomm: add led_brightness_set for YT8521

This commit adds a led_brightness_set callback for the YT8521 and YT8531
PHYs. The callback zeroes the per-LED hardware config register. It then
sets or clears the per-LED force enable/mode bits in the LED general
config register (0xA00B).

> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> index 463e1ea3efc93..bcd3afef0d496 100644
> --- a/drivers/net/phy/motorcomm.c
> +++ b/drivers/net/phy/motorcomm.c
> @@ -258,6 +258,10 @@
>  #define YTPHY_WCR_INTR_SEL			BIT(6)
>  #define YTPHY_WCR_ENABLE			BIT(3)
>  
> +#define YTPHY_LED_GENERAL_CFG_REG		0xA00B
> +#define YTPHY_LED_FORCE_MODE(x)			BIT((x) * 3)
> +#define YTPHY_LED_FORCE_EN(x)			BIT((x) * 3 + 2)

[Severity: Low]
These macros use a 3 bit stride per LED, but only two of the three bits
have names. Is bit (x) * 3 + 1 the upper half of a 2 bit force mode
field?

If it is, yt8521_led_brightness_set() only sets or clears BIT((x) * 3)
and leaves the middle bit as it was. Nothing else in the driver
initializes 0xA00B. If a bootloader left that bit set, would turning
the LED on program force mode 0b11 instead of 0b01?

Would it be better to define the field with GENMASK() and write the
full "force on" encoding? I couldn't check this against the
YT8521/YT8531 datasheet, so this is based only on the layout the macros
imply.

> +
>  /* 2b00 84ms
>   * 2b01 168ms  *default*
>   * 2b10 336ms

[ ... ]

> @@ -1775,6 +1779,31 @@ static int yt8531s_config_init(struct phy_device *phydev)
>  	return phy_restore_page(phydev, old_page, ret);
>  }
>  
> +static int yt8521_led_brightness_set(struct phy_device *phydev, u8 index,
> +				     enum led_brightness value)
> +{
> +	u16 regs;
> +	int ret;
> +
> +	if (index >= YT8521_MAX_LEDS)
> +		return -EINVAL;
> +
> +	/* clear HW LED setup */
> +	ret = ytphy_write_ext(phydev, YT8521_LED0_CFG_REG + index, 0);

[Severity: High]
Is the MDIO bus lock held here? The kernel-doc for ytphy_read_ext() and
ytphy_write_ext() says:

    NOTE:The caller must have taken the MDIO bus lock.

The only caller is phy_led_set_brightness() in
drivers/net/phy/phy_device.c, and it only takes phydev->lock:

    mutex_lock(&phydev->lock);
    err = phydev->drv->led_brightness_set(phydev, phyled->index, value);
    mutex_unlock(&phydev->lock);

That means all three extended register accesses in this function reach
__mdiobus_write() and __mdiobus_read() without bus->mdio_lock. With
lockdep enabled, wouldn't this trip
lockdep_assert_held_once(&bus->mdio_lock)?

Without lockdep, the MDIO controller can be entered at the same time for
another PHY on the same bus. Another mdio_lock-only user of this PHY can
also change YTPHY_PAGE_SELECT between our page select write and the
YTPHY_PAGE_DATA access.

If that happens, the 0 written to LEDx_CFG, or the read-modify-write of
0xA00B, lands on whatever extended register the other context selected,
for example the 0xA000 UTP/fiber space select.

Software triggers reach this path repeatedly from set_brightness_work.
Examples are timer, heartbeat, and netdev when offload isn't possible.

Could the whole sequence run inside a single phy_lock_mdio_bus() /
phy_unlock_mdio_bus() section? The driver already has the *_with_lock
helpers.

The later patch "net: phy: motorcomm: add missing trigger link for
YT8521" only changes yt8521_led_hw_control_get(), so this is still
present at the end of the series.

> +	if (ret < 0)
> +		return ret;
> +
> +	regs = ytphy_read_ext(phydev, YTPHY_LED_GENERAL_CFG_REG);

[Severity: Medium]
What happens when ytphy_read_ext() fails here? It returns a negative
errno, but regs is a u16 and the result is never checked for an error.

-EIO truncates to 0xFFFB, so this LED's bits are ORed in or cleared and
the value is written back to YTPHY_LED_GENERAL_CFG_REG. That forces the
other two LEDs and sets any other bits that 0xA00B holds.

LEDx_CFG has already been zeroed above. If the final write succeeds, the
caller gets 0 back.

yt8521_led_hw_control_get() in the same file uses an int and checks
val < 0. Could ytphy_modify_ext() or ytphy_modify_ext_with_lock() do
this read-modify-write instead, since they propagate the read error?

> +	if (value != LED_OFF)
> +		regs |= YTPHY_LED_FORCE_EN(index) |
> +			YTPHY_LED_FORCE_MODE(index);

[Severity: Medium]
After these force bits are set, what clears them when the LED goes back
to hardware control? yt8521_led_hw_control_set() only writes
YT8521_LED0_CFG_REG + index and never touches 0xA00B.

The LED core doesn't always send LED_OFF before hardware control takes
over. In __led_trigger_set(), the LED_OFF call sits inside
if (led_cdev->trigger), so this sequence skips it:

    echo none > trigger
    echo 1 > brightness
    echo netdev > trigger

set_baseline_state() in ledtrig-netdev.c then calls
led_cdev->hw_control_set() directly. The rules go into LEDx_CFG, but
FORCE_EN is still set in 0xA00B. Wouldn't the LED then stay on whatever
the link or activity state?

yt8521_led_hw_control_get() also reads only LEDx_CFG. In force mode it
would return 0 with no rules set. The led_hw_control_get kernel-doc in
include/linux/phy.h asks for an error code "if the current blinking
cannot be represented in rules".

Should yt8521_led_hw_control_set() clear FORCE_EN and FORCE_MODE for
the index? Should yt8521_led_hw_control_get() account for force mode?

The later patch "net: phy: motorcomm: add missing trigger link for
YT8521" doesn't touch the force bits either.

> +	else
> +		regs &= ~(YTPHY_LED_FORCE_EN(index) |
> +			  YTPHY_LED_FORCE_MODE(index));
> +
> +	return ytphy_write_ext(phydev, YTPHY_LED_GENERAL_CFG_REG, regs);
> +}
> +

[ ... ]

> @@ -3266,6 +3295,7 @@ static struct phy_driver motorcomm_phy_drvs[] = {
>  		.soft_reset	= yt8521_soft_reset,
>  		.suspend	= yt8521_suspend,
>  		.resume		= yt8521_resume,
> +		.led_brightness_set = yt8521_led_brightness_set,
>  		.led_hw_is_supported = yt8521_led_hw_is_supported,
>  		.led_hw_control_set = yt8521_led_hw_control_set,
>  		.led_hw_control_get = yt8521_led_hw_control_get,

[Severity: High]
This is a pre-existing issue and wasn't introduced by this patch.
yt8521_led_hw_control_set() and yt8521_led_hw_control_get() are also
missing the MDIO bus lock.

phy_led_hw_control_set() and phy_led_hw_control_get() in
drivers/net/phy/phy_device.c only hold phydev->lock around the
callbacks, and both callbacks use the unlocked helpers:

yt8521_led_hw_control_set():
    return ytphy_write_ext(phydev, YT8521_LED0_CFG_REG + index, val);

yt8521_led_hw_control_get():
    val = ytphy_read_ext(phydev, YT8521_LED0_CFG_REG + index);

Both came in with commit 355b82c54c12 ("net: phy: motorcomm: Add
support for PHY LEDs on YT8521"), and the new brightness callback follows
the same pattern.

Could the locking fix cover all three LED callbacks, for example with
phy_lock_mdio_bus() or the *_with_lock helpers?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110100001.1873309-1-amadeus%40jmu.edu.cn
