Received: from mail.lysator.liu.se (mail.lysator.liu.se [130.236.254.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EE03976A0;
	Sat, 29 Aug 2026 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.236.254.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788016473; cv=none; b=bqoTJih5hfKJmFrnodUVrmmvhAA5YzhCtOXacHYhAg4Fs7gVAd4szCcGHPiH0KT8LwjOm3Z4w7UAH4x9bqKk8VK4IxX0OxjfyVdDdKWYRQXhFkr6dY/7ld41sqsKvT4N76GTpGf4I2GBOf8IhZi2ZVlpY5jTsu8fiB4ATW5UJwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788016473; c=relaxed/simple;
	bh=4ex8xahwzLjJqgM7Sw6UrYwx0ATqV1/wyw1Wc4CvrXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W83+bT5Oudylz56zRAkkLTGE5JBJbCnM8raMPdifPEOabWyfhCc9hjDWW1B11RCHBK0HrLb0pNw9OhI/eeSQi3Lfqt7vUjWfmAqzcYGbrMwuTkmFVui7cX7dCmv3ebbqwBC9xha3vBwZxYLDPTj8qEx/C+30YdAs4hlUsYNN+gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se; spf=pass smtp.mailfrom=lysator.liu.se; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=Ud1E/Amy; dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b=rzzM+j8j; arc=none smtp.client-ip=130.236.254.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lysator.liu.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="Ud1E/Amy";
	dkim=pass (2048-bit key) header.d=lysator.liu.se header.i=@lysator.liu.se header.b="rzzM+j8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1788016460;
	bh=4ex8xahwzLjJqgM7Sw6UrYwx0ATqV1/wyw1Wc4CvrXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ud1E/AmyGHjmZSgalwjoi/w4rZ+MF7xW5/fqByax4rrJYLCPhj6TY6Sa/MQUND+fh
	 vN6LbuN+ov7rIzAo1qXYGOb8fB+rYo+g834fCOua2LDXEoZTDGnAeuDg0cMPpmIetm
	 Y6/Wl6btZMPR0ajAqz9Gkj2DsYsq7PQKW4QVLDF4guSGFvQI6FpZKDBClTu8HQ+JoV
	 WUcGmhQSI8URPchuR/EiIj2/PT1QlKUBwfEmUzB9PrVs+JsMEbfiHYDhZcXtQ/1Ao8
	 ln9wqtld4Gduyd1211SnODvYMyX6b2NLAcPyOtjOfe4HYYS+BZfAbheVlbxTVn3R0K
	 8GA1m8A/kWezA==
Received: from mail.lysator.liu.se (localhost [127.0.0.1])
	by mail.lysator.liu.se (Postfix) with ESMTP id 06ACA78D7;
	Sat, 29 Aug 2026 17:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lysator.liu.se;
	s=2026; t=1788016459;
	bh=4ex8xahwzLjJqgM7Sw6UrYwx0ATqV1/wyw1Wc4CvrXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rzzM+j8jt+AX/0lmM6V5ODRyJaRiYEugjAZplsTd407L/RBV2dlq13QmgKueNougQ
	 NeNpuiVXhEf2YtcBWZ3+qgQxpSdSssfTgq+wzLepWMLBrT+HAWYH2xKhExsx4P2mZG
	 M+7zDtSDiYgKDs1/IAgRJC5kF8IFQu2vDnBbNfAz7Ibg/gSzzG6Ca0fVPWSjf/w/bg
	 QyJOVLPzInerHUtD9cEv9sj+ggj3GFomv4btMjtGd4Fg8QRiCAMyXNa6NfMt132J3/
	 Wd8RqB7xhQXkai2SUuHVFPs0W9BXyHwg/z86+U7xjvOVWUTqN2uHy+4q4Y5fBEFb1+
	 nT2xdLl214kZA==
Received: from gryt (81-225-28-11-no2391.tbcn.telia.com [81.225.28.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.lysator.liu.se (Postfix) with ESMTPSA id 5E231786C;
	Sat, 29 Aug 2026 17:14:19 +0200 (CEST)
Date: Sat, 29 Aug 2026 17:14:18 +0200
From: Peter Rosin <peda@lysator.liu.se>
To: Rahul Sharma <r-sharma3@ti.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	vigneshr@ti.com,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Subject: Re: [PATCH 2/2] mux-controller: ti: add driver for event mux router
Message-ID: <apL3StZuqeV-gaIa@gryt>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-3-r-sharma3@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828100615.1700223-3-r-sharma3@ti.com>
X-Virus-Scanned: ClamAV using ClamSMTP

Hi Rahul,

I believe you posted something like this as an RFC about half a year
ago? Please include a pointer to the previous posting along with some
notes about what changed since the last posting when you update a
patch series. Thanks!

And sorry for being so very slow with the review. I intend to be more
responsive going forward...

Den Fri, Aug 28, 2026 at 03:36:15PM +0530, skrev Rahul Sharma:
> The driver supports event muxing routers like gpio mux router and timesync
> router. This driver is adaptation of original reg-mux driver, along with
> changes specific to support TI's mux router.
> 
> The idle states this driver supports are only 2 which active(represented
> by 1 in dt-node) and in-active(represented by 0 in dt-node).

I don't see the point of using 1 as idle state. Why would anyone
do that?

> 
> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
> ---
>  drivers/mux/Kconfig           |  15 +++
>  drivers/mux/Makefile          |   2 +
>  drivers/mux/ti-k3-event-mux.c | 235 ++++++++++++++++++++++++++++++++++
>  3 files changed, 252 insertions(+)
>  create mode 100644 drivers/mux/ti-k3-event-mux.c
> 
> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> index eb34457beaab..58739a01f0d5 100644
> --- a/drivers/mux/Kconfig
> +++ b/drivers/mux/Kconfig
> @@ -83,6 +83,21 @@ config MUX_RZV2H_VBENCTL
>  	  To compile the driver as a module, choose M here: the module will
>  	  be called mux-rzv2h-vbenctl.
>  
> +config MUX_TI_K3_EVENT_ROUTER
> +	tristate "TI Event Mux Router using MMIO registers"
> +	depends on OF && (REGMAP_MMIO || COMPILE_TEST)
> +	help
> +	  This is extension of MMIO mux for  timesync router and gpiomux
> +	  routers on TI K3 SoCs. This driver supports the 3-field format for
> +	  mux control: <register-offset mask value>.

The first sentence has some grammar issues, and the second talks
about "the 3-field format" as if that is some well established format.
How about:

	  This is a mux for timesync and gpiomux routers on TI K3 SoCs.
	  The driver supports a 3-field format for mux control:
	  <register-offset mask value>.

> +
> +	  The driver allows configuration of hardware mux routers using
> +	  memory-mapped registers. It's based on the mmio-mux driver but
> +	  supports the extended 3-field format for more precise control.

The person reading this would not care about the code ancestry, that
info belongs elsewhere, and the 3-field format has already been
mentioned. Thus, the second sentence can be dropped.

> +
> +	  To compile the driver as a module, choose M here: the module will
> +	  be called mux-ti-k3-event.
> +
>  endmenu
>  
>  endif # MULTIPLEXER
> diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
> index 0854c04613b9..114abf88b75e 100644
> --- a/drivers/mux/Makefile
> +++ b/drivers/mux/Makefile
> @@ -9,6 +9,7 @@ mux-adgs1408-objs		:= adgs1408.o
>  mux-gpio-objs			:= gpio.o
>  mux-mmio-objs			:= mmio.o
>  mux-rzv2h-vbenctl-objs		:= rzv2h-vbenctl.o
> +mux-ti-k3-event-objs		:= ti-k3-event-mux.o
>  
>  obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
>  obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
> @@ -16,3 +17,4 @@ obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
>  obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
>  obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
>  obj-$(CONFIG_MUX_RZV2H_VBENCTL)	+= mux-rzv2h-vbenctl.o
> +obj-$(CONFIG_MUX_TI_K3_EVENT_ROUTER)	+= mux-ti-k3-event.o
> diff --git a/drivers/mux/ti-k3-event-mux.c b/drivers/mux/ti-k3-event-mux.c
> new file mode 100644
> index 000000000000..2469500d1b48
> --- /dev/null
> +++ b/drivers/mux/ti-k3-event-mux.c
> @@ -0,0 +1,235 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MMIO register bit-field controlled multiplexer driver

This is some left-over I presume?

> + *
> + * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com
> + *
> + * Based on drivers/mux/mmio.c by Philipp Zabel <kernel@pengutronix.de>

So, why did you drop the Pengutronix copyright?

> + * Modified to support 3-field format: reg-offset, mask & value
> + *
> + * Author: Rahul Sharma <r-sharma3@ti.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/mux/driver.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#define MUX_ENABLE_INTR BIT(16)
> +
> +struct mux_ti_k3_event {
> +	struct regmap *regmap;

I think this can be a single pointer in the below chip struct
instead of "wasting" one pointer for each field, no?

> +	u32 reg;
> +	u32 mask;
> +	u32 value;
> +};
> +
> +struct mux_ti_k3_event_chip {
> +	struct mux_chip *mux_chip;

I do not see the need for this back-pointer to the mux chip.

> +	struct mux_ti_k3_event *fields;
> +	int num_fields;

This is redundant. The mux-control count for a chip is available
as mux_chip->controllers.

> +	u32 *saved_states;
> +};
> +
> +static int mux_ti_k3_event_suspend(struct device *dev)
> +{
> +	struct mux_ti_k3_event_chip *chip = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	if (!chip->saved_states) {
> +		chip->saved_states = devm_kcalloc(dev, chip->num_fields,
> +						  sizeof(u32), GFP_KERNEL);

Why not allocate this up-front during probe? Or, on second thought, why
not just add a saved_state (non-array) member to struct mux_ti_k3_event?

> +		if (!chip->saved_states)
> +			return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < chip->num_fields; i++) {
> +		struct mux_ti_k3_event *field = &chip->fields[i];
> +
> +		ret = regmap_read(field->regmap, field->reg,
> +				  &chip->saved_states[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mux_ti_k3_event_resume(struct device *dev)
> +{
> +	struct mux_ti_k3_event_chip *chip = dev_get_drvdata(dev);
> +	int i, ret;
> +
> +	if (!chip->saved_states)
> +		return 0;
> +
> +	for (i = 0; i < chip->num_fields; i++) {
> +		struct mux_ti_k3_event *field = &chip->fields[i];
> +
> +		ret = regmap_write(field->regmap, field->reg,
> +				   chip->saved_states[i]);

Should you not apply the mask here?

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(mux_ti_k3_event_pm_ops,
> +				mux_ti_k3_event_suspend,
> +				mux_ti_k3_event_resume);
> +
> +/*
> + * State behavior:
> + * - state 0: Clears the mask bits in the target register (inactive state)
> + * - state 1: Sets both the value bits and enable bit (bit 16) in the register
> + */
> +static int mux_ti_k3_event_set(struct mux_control *mux, int state)
> +{
> +	struct mux_ti_k3_event *fields = mux_chip_priv(mux->chip);
> +	struct mux_ti_k3_event *field = &fields[mux_control_get_index(mux)];
> +
> +	if (!state)
> +		return regmap_update_bits(field->regmap, field->reg, field->mask, 0);

This is confusing to me. Why do you elect to leave the enable bit as-is
and write only the zero value? Would it not be saner to clear out the
enable bit as well?

You should handle state == MUX_IDLE_DISCONNECT here in the .set function,
see below for rationale.

> +
> +	return regmap_update_bits(field->regmap, field->reg, field->mask | MUX_ENABLE_INTR,
> +		field->value | MUX_ENABLE_INTR);
> +}
> +
> +static const struct mux_control_ops mux_ti_k3_event_ops = {
> +	.set = mux_ti_k3_event_set,
> +};
> +
> +static const struct regmap_config mux_ti_k3_event_regmap_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
> +static int mux_ti_k3_event_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct mux_ti_k3_event_chip *chip;
> +	struct mux_ti_k3_event *fields;
> +	struct mux_chip *mux_chip;
> +	struct regmap *regmap;
> +	void __iomem *base;
> +	int num_fields;
> +	int ret;
> +	int i;
> +
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +	if (!chip)
> +		return -ENOMEM;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base)) {
> +		return dev_err_probe(dev, -ENODEV,
> +				     "failed to get base address\n");
> +	} else {

Drop the else + indentation when the if-block always returns.

> +		regmap = devm_regmap_init_mmio(dev, base, &mux_ti_k3_event_regmap_cfg);
> +	}
> +	if (IS_ERR(regmap)) {
> +		iounmap(base);

Why do you need to explicitely unmap base?

> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to get regmap\n");
> +	}
> +
> +	ret = of_property_count_u32_elems(np, "ti,reg-mask-val");
> +	if (!ret || ret % 3) {
> +		ret = -EINVAL;
> +		dev_err(dev, "ti,reg-mask-val property missing or invalid: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	num_fields = ret / 3;
> +	mux_chip = devm_mux_chip_alloc(dev, num_fields, num_fields *
> +				       sizeof(*fields));
> +	if (IS_ERR(mux_chip))
> +		return PTR_ERR(mux_chip);
> +
> +	fields = mux_chip_priv(mux_chip);
> +	chip->mux_chip = mux_chip;

This feels backwards to me. Should not "chip" be what is returned
from mux_chip_priv()? I.e. something like this:

	mux_chip = devm_mux_chip_alloc(dev, num_fields, sizeof(*chip));
	chip = mux_chip_priv(mux_chip);
	chip->fields = devm_kcalloc(dev, num_fields, sizeof...

(error checking omitted)

> +	chip->fields = fields;
> +	chip->num_fields = num_fields;
> +
> +	platform_set_drvdata(pdev, chip);

I think you should use mux_chip as drvdata. I assume this is why you
needed the back pointer to the mux_chip at some point.

> +
> +	for (i = 0; i < num_fields; i++) {
> +		struct mux_control *mux = &mux_chip->mux[i];
> +		s32 idle_state = MUX_IDLE_AS_IS;
> +		u32 reg, mask, value;
> +
> +		ret = of_property_read_u32_index(np, "ti,reg-mask-val",
> +						 3 * i, &reg);
> +		if (!ret)
> +			ret = of_property_read_u32_index(np, "ti,reg-mask-val",
> +							 3 * i + 1, &mask);
> +		if (!ret)
> +			ret = of_property_read_u32_index(np, "ti,reg-mask-val",
> +							 3 * i + 2, &value);
> +		if (ret < 0) {
> +			dev_err(dev, "field %d: failed to read ti,reg-mask-val property: %d\n",
> +				i, ret);
> +			return ret;
> +		}
> +
> +		/* Validate that value bits are within mask */
> +		if (value & ~mask) {

This is broken and only works as expected if "mask" is a bitfield
based at the lsb. You should keep the limitation from the mmio
driver that "mask" has to be a proper field (without holes)
and you should shift things such that "value" is what will be
written to that field, and not what will be written to the whole
register.

> +			dev_err(dev, "field %d: value 0x%x has bits outside mask 0x%x\n",
> +				i, value, mask);
> +			return -EINVAL;
> +		}

I think you should also check that the mask does not clobber
the enable bit.

> +
> +		fields[i].regmap = regmap;
> +		fields[i].reg = reg;
> +		fields[i].mask = mask;
> +		fields[i].value = value;
> +
> +		/* This driver supports binary mux (2 states: 0 and active) */
> +		mux->states = 2;

This is weird. You apparently only have one leg on these muxes,
and need to turn them on/off with a MUX_IDLE_DISCONNECT idle
state instead of abusing an extra state that can never be used
as an actual valid state.

I.e. these things are not really muxes at all, they are more
like gates, methinks.

And all this indicate that the idle state handling below is
completely bogus. The only sane idle-state with the current
patch is zero. So, why require the user to fill that in?
Why not force it instead? But see above, the idle state
should not be forced to zero but to MUX_IDLE_DISCONNECT and
state zero should be the only state and the state that "opens
the gate" when selected.

With all that said, I worry about what happens if you write
other values in the reg-field? Since you have added this as
a mux driver when you really have implemented gates, I have
this feeling that the hw spec calls these registers muxes
and that they can be used to wire vastly different things
together. If so, what if you need some of these other values
in the register? I don't know where to look and have not gone
trawling the TI site for details, do you perhaps have some
reference for how these registers work?

Cheers,
Peter

> +
> +		of_property_read_u32_index(np, "idle-states", i,
> +					   (u32 *)&idle_state);
> +		if (idle_state != MUX_IDLE_AS_IS) {
> +			if (idle_state < 0 || idle_state >= mux->states) {
> +				dev_err(dev, "field: %d: out of range idle state %d\n",
> +					i, idle_state);
> +				return -EINVAL;
> +			}
> +
> +			mux->idle_state = idle_state;
> +		}
> +	}
> +
> +	mux_chip->ops = &mux_ti_k3_event_ops;
> +
> +	return devm_mux_chip_register(dev, mux_chip);
> +}
> +
> +static const struct of_device_id mux_ti_k3_event_dt_ids[] = {
> +	{ .compatible = "ti,am62l-event-mux-router", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mux_ti_k3_event_dt_ids);
> +
> +static struct platform_driver mux_ti_k3_event_driver = {
> +	.driver = {
> +		.name = "ti-k3-event-mux",
> +		.of_match_table	= mux_ti_k3_event_dt_ids,
> +		.pm = &mux_ti_k3_event_pm_ops,
> +	},
> +	.probe = mux_ti_k3_event_probe,
> +};
> +module_platform_driver(mux_ti_k3_event_driver);
> +
> +MODULE_DESCRIPTION("TI K3 Bit-field Controlled Event Multiplexer driver");
> +MODULE_AUTHOR("Rahul Sharma <r-sharma3@ti.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.34.1
> 
