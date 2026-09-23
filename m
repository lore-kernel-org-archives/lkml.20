Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037BA4F85A7;
	Wed, 23 Sep 2026 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179701; cv=none; b=peQEnHdUhIWhapI2O8eE5zBFmWvfbH6hC505NUUNzQVFrc0ENRhReooTWkRWgcPGZfgD+Ox3yJ68hKA3xu+rBdX2lMK0oGFcgFrx3QUNZJVA8v6TwExCk7YIj4UMym0tEUTWqjQELU+CaJG1JUSn4yizGXoxZv9uO44/emQEemw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179701; c=relaxed/simple;
	bh=hNTD/4ks3BZra2xP0p32ngHAUaRFxAvRNphUhYp2drk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDiRGfnOytb4he9Xw2h3VyKj4nuMziLODFKrzfeb5YCA29LXFIeSmcqXPqe0mcMU09OKS/LQWSBR0/QJ6sUccuQUUqx5N9tk9N+p33LiunB6xg+P+jB1wSg3MfzkjOMMDjI7gAZRNv9QMn4LU/5hCXaq6YLOKa012EfF4DZYYrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6DSnLqz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6DSnLqz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659261F000FF;
	Wed, 23 Sep 2026 16:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790179699;
	bh=3e9il85E3ABPy4I7irvXMCFKFPKx9Fa96n5jIdOodN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H6DSnLqz2hqqkW7Vg5Bp2GkUPg0lC2kr8YI7cRIGOVEJ0F3gM9Nq18zRXPT9BnRQb
	 UVL7u7NBIKYrt0EF1JgCOqhI4h15ibXjOU2rsvb4t6Yx6gKOi+E7/DoXKfJwe1JBlg
	 e5sQzZZEhr+qyOPy5m/pGmiXqKvkKsNb0S9F+HWLEKO0E27Szuv9b0IIODuyiT/SYv
	 jZr7r1ZBDQfkwxB4rhgrOxG56tQirvgJW34BSIaMe2XUekF0WZW18fZNRk0uFlz6SA
	 DJMvNRxxkw0nNJPn8MdiRdj4gG/om+SAEU1Fq4haHo+YYwbwa6LMDxqLdMrnhu8Ddy
	 xTgGsBLDKopJA==
Date: Wed, 23 Sep 2026 17:08:14 +0100
From: Lee Jones <lee@kernel.org>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/3] mfd: rk8xx: Release the power hold GPIOs
 before powering off
Message-ID: <20260923160814.GL3864833@google.com>
References: <20260909092728.1859-1-yaozhonguwl@gmail.com>
 <20260919122930.1418-3-yaozhonguwl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919122930.1418-3-yaozhonguwl@gmail.com>

On Sat, 19 Sep 2026, Yaozhong Li wrote:

> rk808_power_off() writes the PMIC's shutdown bit directly. On boards where
> lines driven by the SoC gate the PMIC's power-off path, a shutdown
> performed this way does not stick: the rails drop and immediately come
> back up, so the board restarts instead of staying off. U-Boot reports the
> result as a power-on reset.
> 
> Take those lines as an optional GPIO array, hold them asserted while the
> system runs and release them - waiting power-hold-delay-ms - before
> writing the shutdown bit. Device trees without the property retain the
> existing behaviour.
> 
> The array is claimed before any child device is registered, so that a
> -EPROBE_DEFER from the GPIO provider does not tear down the regulators,
> RTC and clocks that devm_mfd_add_devices() has already registered.
> 
> Releasing every described line matters: on a Firefly-RK3399 the board
> stays off when both lines described for it are released, whereas releasing
> GPIO1_D0 while GPIO1_B5 is left asserted makes it come back up.
> 
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
> ---
>  drivers/mfd/rk8xx-core.c  | 47 +++++++++++++++++++++++++++++++++++++--
>  include/linux/mfd/rk808.h |  4 ++++
>  2 files changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/rk8xx-core.c b/drivers/mfd/rk8xx-core.c
> index 3dcf6ab..0898db0 100644
> --- a/drivers/mfd/rk8xx-core.c
> +++ b/drivers/mfd/rk8xx-core.c
> @@ -11,6 +11,8 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/rk808.h>
>  #include <linux/mfd/core.h>
> @@ -703,6 +705,24 @@ static int rk808_power_off(struct sys_off_data *data)
>  	default:
>  		return NOTIFY_DONE;
>  	}
> +
> +	/*
> +	 * Some boards route "power hold" lines from the SoC into the board's
> +	 * power circuitry. They have to be held asserted while the system is
> +	 * running and released before the PMIC shutdown request is written:
> +	 * with any of them left asserted, the rails drop and then come back
> +	 * up. Releasing them here rather than from a separate handler keeps
> +	 * the ordering against the I2C write explicit.
> +	 */
> +	if (rk808->power_hold_gpios) {
> +		unsigned int i;

What is i here?  Can it have a better name?

> +
> +		for (i = 0; i < rk808->power_hold_gpios->ndescs; i++)

for (int <better_name> = 0; ...

> +			gpiod_set_value_cansleep(rk808->power_hold_gpios->desc[i], 0);
> +
> +		msleep(rk808->power_hold_delay_ms);
> +	}
> +
>  	ret = regmap_update_bits(rk808->regmap, reg, bit, bit);
>  	if (ret)
>  		dev_err(rk808->dev, "Failed to shutdown device!\n");
> @@ -766,6 +786,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
>  	struct rk808 *rk808;
>  	const struct rk808_reg_data *pre_init_reg;
>  	const struct mfd_cell *cells;
> +	bool system_power_controller;
>  	int dual_support = 0;
>  	int nr_pre_init_regs;
>  	u32 rst_fun = 0;
> @@ -851,6 +872,29 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
>  	if (!irq)
>  		return dev_err_probe(dev, -EINVAL, "No interrupt support, no core IRQ\n");
>  
> +	system_power_controller =
> +		device_property_read_bool(dev, "system-power-controller") ||
> +		device_property_read_bool(dev, "rockchip,system-power-controller");
> +
> +	/*
> +	 * Claim the optional power hold GPIOs before any child device is
> +	 * registered. A -EPROBE_DEFER from the GPIO provider at this point
> +	 * costs nothing, whereas deferring after devm_mfd_add_devices()
> +	 * would tear the freshly registered children down again on every
> +	 * retry.
> +	 */
> +	if (system_power_controller) {
> +		rk808->power_hold_gpios =
> +			devm_gpiod_get_array_optional(dev, "power-hold",
> +						      GPIOD_OUT_HIGH);

Why wrap here?  Some of the surrounding lines are clearly longer.

> +		if (IS_ERR(rk808->power_hold_gpios))
> +			return dev_err_probe(dev, PTR_ERR(rk808->power_hold_gpios),
> +					     "Failed to get power hold GPIOs\n");
> +
> +		device_property_read_u32(dev, "power-hold-delay-ms",
> +					 &rk808->power_hold_delay_ms);

What if this doesn't return a value?

> +	}
> +
>  	ret = devm_regmap_add_irq_chip(dev, rk808->regmap, irq,
>  				       IRQF_ONESHOT | dual_support, -1,
>  				       rk808->regmap_irq_chip, &rk808->irq_data);
> @@ -872,8 +916,7 @@ int rk8xx_probe(struct device *dev, int variant, unsigned int irq, struct regmap
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to add MFD devices\n");
>  
> -	if (device_property_read_bool(dev, "system-power-controller") ||
> -	    device_property_read_bool(dev, "rockchip,system-power-controller")) {
> +	if (system_power_controller) {
>  		ret = devm_register_sys_off_handler(dev,
>  				    SYS_OFF_MODE_POWER_OFF_PREPARE, SYS_OFF_PRIO_HIGH,
>  				    &rk808_power_off, rk808);
> diff --git a/include/linux/mfd/rk808.h b/include/linux/mfd/rk808.h
> index 7ffc904..eda111e 100644
> --- a/include/linux/mfd/rk808.h
> +++ b/include/linux/mfd/rk808.h
> @@ -1459,6 +1459,8 @@ enum {
>  	RK818_ID = 0x8180,
>  };
>  
> +struct gpio_descs;

Do we do this for all of the other structs?  Why not add the include?

> +
>  struct rk808 {
>  	struct device			*dev;
>  	struct regmap_irq_chip_data	*irq_data;
> @@ -1466,6 +1468,8 @@ struct rk808 {
>  	long				variant;
>  	const struct regmap_config	*regmap_cfg;
>  	const struct regmap_irq_chip	*regmap_irq_chip;
> +	struct gpio_descs		*power_hold_gpios;
> +	u32				power_hold_delay_ms;
>  };
>  
>  void rk8xx_shutdown(struct device *dev);
> -- 
> 2.55.0.windows.3
> 

-- 
Lee Jones
