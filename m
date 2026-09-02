Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E79D495054;
	Wed,  2 Sep 2026 14:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359490; cv=none; b=LR57cDGdvIEGSkuCLD/rzLiqlsBdujgFP0TUtWoIQ81zsUIDMJHVlWHppbjxBGduAbOUzh62+nLV7/+swF7e7d3OJf/2QcP2AdtsVuM2rYniRU4DHr7veTw4imOcEpcB9XdIcyclDBlBOxxqtyc9MnHjSS6IU+4yYp1RSi1LCCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359490; c=relaxed/simple;
	bh=PMOVXb+oxPCE/+N2ZdXPyIzFgHpA1F8IKcfHplH43q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVDNlEyNIKKQhZmHpZs7Hu4erKxkOUjbrlPSiGXUCu7LAzvobl8vFkzWjDfojEVgsd49tlMdCtUNOWNn7z1nKU4hkOcuuyOR7SOls/OMzHOwCTnnL/wQcsCysbeah5S5Ow9Qtu8VdkpjlswW2Sv27wxhaZJ0WZ62Vxn6ee+83DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3mtgELl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3mtgELl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030A41F00A3A;
	Wed,  2 Sep 2026 14:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788359488;
	bh=u/YDtlQzEYjV/zdmMLJr+k2cbLHLiOPI7t+CSo6Z7As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k3mtgELlek4omOix2OZ1yUP4aDo616Y2qLubUtrC2AWJFYcnTaGSZVQaCsv2JWJRC
	 Oki1VPHQbSQQ8lmy40lDSpAPyQ/axWKOxm2djyzWTIIcowijJU5xkuef8Q+pSdp/qI
	 zI2qNshB/CuizsRNSMnSV8oibl9tz+JWzg0FHCz7V5B8WdTgppCsGsH5WCYOVrUEMV
	 ziGJ1ybnef92qSCSMHJiHp0dpqGamX1RYpDPx2mfipDKLx1ffx/YXSVOnQaJx+4Nm2
	 Ycs6T8/ae00ZO8NBlV3m2egZW54kS75haJIG/8j/AlFFXqPiPekITFOiH2w/rCsNXE
	 Vt0pnCVR39FTw==
Date: Wed, 2 Sep 2026 15:31:22 +0100
From: Lee Jones <lee@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] mfd: ac200: Add X-Powers AC200 support
Message-ID: <20260902143122.GA2082450@google.com>
References: <20260811-submit-ac200-mfd-v7-0-8b06f552a4d7@gmail.com>
 <20260811-submit-ac200-mfd-v7-2-8b06f552a4d7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-submit-ac200-mfd-v7-2-8b06f552a4d7@gmail.com>

On Tue, 11 Aug 2026, James Hilliard wrote:

> The X-Powers AC200 is a mixed-signal companion IC with a paged register
> map accessed over I2C.
> 
> Enable the shared input clock and prevent its rate from changing. Match
> the vendor driver's 40 ms wait before the first register access,
> initialize the paged regmap, report the chip and package revision, and
> apply common reset.
> 
> The Ethernet PHY link endpoint is independently enumerated on its MDIO
> bus rather than created as an MFD platform child. Keep the regmap attached
> to the AC200 I2C device so a separately enumerated function can resolve
> that device, establish its required lifetime relationship and retrieve
> the regmap from the provider.
> 
> Cache only the common page selector. Individual functions can reset
> independently and invalidate their other registers without regmap's
> knowledge, so leave all functional registers volatile.
> 
> Reset the chip during managed teardown and system shutdown.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/mfd/Kconfig  |  11 ++++
>  drivers/mfd/Makefile |   1 +
>  drivers/mfd/ac200.c  | 163 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 175 insertions(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index e4fd4572472f..cac3fff5aee9 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -205,6 +205,17 @@ config MFD_AC100
>  	  This driver include only the core APIs. You have to select individual
>  	  components like codecs or RTC under the corresponding menus.
>  
> +config MFD_AC200
> +	tristate "X-Powers AC200"
> +	depends on I2C
> +	depends on OF
> +	select REGMAP_I2C
> +	help
> +	  Support for the X-Powers AC200 mixed-signal companion IC. The AC200
> +	  contains audio, video, RTC and Fast Ethernet PHY functions and is
> +	  co-packaged with some Allwinner H6 and H616 SoCs. This driver provides
> +	  the shared register access used by the individual function drivers.
> +
>  config MFD_AXP20X
>  	tristate
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 72d3944b0ad8..f8101d2a9ce9 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -150,6 +150,7 @@ obj-$(CONFIG_MFD_DA9052_SPI)	+= da9052-spi.o
>  obj-$(CONFIG_MFD_DA9052_I2C)	+= da9052-i2c.o
>  
>  obj-$(CONFIG_MFD_AC100)		+= ac100.o
> +obj-$(CONFIG_MFD_AC200)		+= ac200.o
>  obj-$(CONFIG_MFD_AXP20X)	+= axp20x.o
>  obj-$(CONFIG_MFD_AXP20X_I2C)	+= axp20x-i2c.o
>  obj-$(CONFIG_MFD_AXP20X_RSB)	+= axp20x-rsb.o
> diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
> new file mode 100644
> index 000000000000..0964e637afef
> --- /dev/null
> +++ b/drivers/mfd/ac200.c
> @@ -0,0 +1,163 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * MFD core driver for the X-Powers AC200
> + *
> + * Copyright (C) 2019 Jernej Skrabec <jernej.skrabec@gmail.com>
> + * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
> + *
> + * Based on the AC100 driver:
> + * Copyright (C) 2016 Chen-Yu Tsai

Drop this.  Every driver tends to be based on something else.

> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>

Why aren't you using the MFD API?

If you don't need it, then why is this in drivers/mfd?

> +#define AC200_SYS_VERSION_REG			0x0000
> +#define AC200_SYS_VERSION_PACKAGE_MASK		GENMASK(15, 14)
> +#define AC200_SYS_VERSION_CHIP_MASK		GENMASK(11, 0)
> +
> +#define AC200_SYS_CONTROL_REG			0x0002
> +#define AC200_SYS_CONTROL_CHIP_RESET_DEASSERT	BIT(0)
> +
> +/* Interface register accessible from every register page. */
> +#define AC200_TWI_REG_ADDR_H	0x00fe
> +#define AC200_MAX_REG		0xa1f2
> +
> +struct ac200 {
> +	struct regmap *regmap;
> +};

Why not just pass 'regmap' directly?

> +static const struct regmap_range_cfg ac200_range_cfg[] = {
> +	{
> +		.range_max = AC200_MAX_REG,
> +		.selector_reg = AC200_TWI_REG_ADDR_H,
> +		.selector_mask = 0xff,
> +		.window_len = 256,
> +	},
> +};
> +
> +/*
> + * Each AC200 sub-block can reset independently, invalidating its register
> + * contents without regmap's knowledge. Cache only the common page selector;
> + * this avoids a selector read-modify-write for every access on the same page
> + * without ever returning stale functional-register values.
> + */
> +static bool ac200_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	return reg != AC200_TWI_REG_ADDR_H;
> +}
> +
> +static const struct regmap_config ac200_regmap_config = {
> +	.name = "ac200",
> +	.reg_bits = 8,
> +	.reg_stride = 2,
> +	.val_bits = 16,
> +	.ranges = ac200_range_cfg,
> +	.num_ranges = ARRAY_SIZE(ac200_range_cfg),
> +	.max_register = AC200_MAX_REG,
> +	.volatile_reg = ac200_volatile_reg,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
> +static void ac200_disable(void *data)
> +{
> +	struct ac200 *ddata = data;
> +
> +	regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG, 0);
> +}

You can't do this in .remove()?

> +static int ac200_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	unsigned int version;
> +	struct ac200 *ddata;
> +	struct clk *clk;
> +	int ret;
> +
> +	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	clk = devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to enable input clock\n");
> +
> +	ret = devm_clk_rate_exclusive_get(dev, clk);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to lock clock rate\n");
> +
> +	ddata->regmap = devm_regmap_init_i2c(client, &ac200_regmap_config);
> +	if (IS_ERR(ddata->regmap))
> +		return dev_err_probe(dev, PTR_ERR(ddata->regmap),
> +				     "failed to initialize regmap\n");
> +
> +	i2c_set_clientdata(client, ddata);
> +
> +	/*
> +	 * No minimum delay is documented. Match the vendor driver's 40 ms delay
> +	 * before its first AC200 register access after enabling the input clock.
> +	 */
> +	msleep(40);
> +
> +	ret = regmap_read(ddata->regmap, AC200_SYS_VERSION_REG, &version);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to read chip version\n");
> +
> +	dev_info(dev, "AC200 revision %#lx in package %lu\n",
> +		 FIELD_GET(AC200_SYS_VERSION_CHIP_MASK, version),
> +		 FIELD_GET(AC200_SYS_VERSION_PACKAGE_MASK, version));

We support all versions, so why print it out at all?

> +	/* Reset the chip after dependent function drivers have unbound. */
> +	ret = devm_add_action_or_reset(dev, ac200_disable, ddata);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG, 0);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_write(ddata->regmap, AC200_SYS_CONTROL_REG,
> +			   AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
> +	if (ret)
> +		return ret;

Okay, now what?  What uses this regmap?

> +	return 0;
> +}
> +
> +static void ac200_shutdown(struct i2c_client *client)
> +{
> +	ac200_disable(i2c_get_clientdata(client));
> +}
> +
> +static const struct of_device_id ac200_of_match[] = {
> +	{ .compatible = "x-powers,ac200" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ac200_of_match);
> +
> +static const struct i2c_device_id ac200_i2c_ids[] = {
> +	{ .name = "ac200" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, ac200_i2c_ids);
> +
> +static struct i2c_driver ac200_driver = {
> +	.driver = {
> +		.name = "ac200",
> +		.of_match_table = ac200_of_match,
> +	},
> +	.probe = ac200_probe,
> +	.shutdown = ac200_shutdown,
> +	.id_table = ac200_i2c_ids,
> +};
> +module_i2c_driver(ac200_driver);
> +
> +MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
> +MODULE_DESCRIPTION("X-Powers AC200 MFD core driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.53.0
> 

-- 
Lee Jones
