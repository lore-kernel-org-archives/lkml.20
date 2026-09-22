Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDB3525A6F;
	Tue, 22 Sep 2026 10:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071714; cv=none; b=uozJlwUnWXP+n/u2hoiId9xAiGXMzm06iySq2HNcXoJb/omXyC/cjvb1W4cJkgcSyWgTaGyrcWrqEjaNv1Qs/RP83BenhTPGULzPItjV5C2hc+D71CdCkALZEeMnA49Nr1XlbZzR/F6WNKzW+L4RxFMWt1aaD7VW4bGrSMsHVVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071714; c=relaxed/simple;
	bh=QmZfZtuze3dEFQXNZRYfdssHxNZNo07AFj0Mtby0X0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAIRGpBRyA6oe+aumMrv4V1l1YKZBv1v/LjA109xj5YFIlxG8rgZuihHyRbozAMR3wUxyEbtxfOT2Nq6pRB8bd6INVdKQfy3rM8M2wAmxhHsv+ygVd7RjrxNoodBRsLEGtfK86IjgTNF9+vW9DJxkNMCrdyx5RWRU1YeF30YqaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADtuIjEd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADtuIjEd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385561F00893;
	Tue, 22 Sep 2026 10:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790071707;
	bh=zMGPVanaJFmZKoJ8Ctzglf8/9UTk6wyVAdM8sDzTyAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ADtuIjEdpbhxunYVA/AIU7hbfT9+tHmrn5/uj3z6O/cmrV11l8SzHSvd8M7k1UQbc
	 Na2qU6wv5z0jxVEVCflxK+4ohQA0msHjMw1rvssXjIolyr+p3xRUIZAVKLOLMy6dN8
	 lWPIXidUn36X4AtJ6Jn0qziU0o18nukXeWJKjhDJz/eTWpztpWhyIG4qdfBS0gUgKA
	 lGpH+tEklfI/SyLC/tyWKSE2qOTC95PggbslQl45jRhKgcZz8iixgOVM3lw5FAaJO3
	 YMFC198a3626LSRTZt3GIxT48JAWsJIsgkFV3ouuKsCl+t+tydyaUCDcHqEDe1As8a
	 rZIhryj0mdhUw==
Date: Tue, 22 Sep 2026 11:08:22 +0100
From: Lee Jones <lee@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	"Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>, linux-sunxi@lists.linux.dev,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/2] mfd: ac200: Add X-Powers AC200 support
Message-ID: <20260922100822.GA2730113@google.com>
References: <20260909-submit-ac200-mfd-v12-0-a44d6bc30a4f@gmail.com>
 <20260909-submit-ac200-mfd-v12-2-a44d6bc30a4f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-submit-ac200-mfd-v12-2-a44d6bc30a4f@gmail.com>

On Wed, 09 Sep 2026, James Hilliard wrote:

> The X-Powers AC200 is a mixed-signal companion IC with a paged register
> map accessed over I2C.
> 
> Enable and rate-lock the shared input clock, retain the vendor resume
> path's 40 ms wait before creating the regmap and accessing registers, and
> deassert the common reset. No minimum delay is documented. Set only the
> deassert bit instead of forcing a reset cycle, avoiding a chip-wide reset
> of unrelated function registers. Leave the common reset deasserted during
> driver removal and system shutdown; function drivers own their block
> resets. Supplier unbind still tears down linked consumers and releases
> the provider's clock references.
> 
> Cache only the common page selector. Individual functions can reset
> independently and invalidate their other registers, so leave all
> functional registers volatile.
> 
> Register the audio codec and TV encoder using static MFD cells and
> automatically assigned platform device IDs. Their firmware properties
> belong to the parent node. Map their supply lookups to the parent with MFD
> supply aliases, without assigning separate OF nodes to the cells.
> 
> When INTB is connected, pass its physical IRQ to the TV encoder cell.
> Select a cell array without IRQ resources when INTB is absent. No regmap
> IRQ controller or private IRQ domain is needed.
> 
> Configure the level-triggered INTB output, defaulting to level-low when
> the upstream IRQ has no trigger type. Mask all sources before enabling
> INTB. Function drivers request shared threaded IRQs before enabling their
> own source, check and clear their own status, and mask their source before
> freeing the IRQ. Disable INTB after removing the children on failure or
> removal, while the regmap and clock are still available.
> 
> The Ethernet PHY is enumerated on its MDIO bus rather than as an MFD
> child. It follows the x-powers,ac200 phandle and uses this regmap for
> ancillary package-control access.
> 
> Co-developed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Why is Andre in there?

> ---
>  MAINTAINERS          |   1 +
>  drivers/mfd/Kconfig  |  14 ++++
>  drivers/mfd/Makefile |   1 +
>  drivers/mfd/ac200.c  | 231 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 247 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 419340093c9b..1d03b0060bda 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29510,6 +29510,7 @@ M:	James Hilliard <james.hilliard1@gmail.com>
>  L:	linux-sunxi@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
> +F:	drivers/mfd/ac200.c
>  
>  X-POWERS AXP288 PMIC DRIVERS
>  M:	Hans de Goede <hansg@kernel.org>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 857ca3bb0d5b..071cba7c775b 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -205,6 +205,20 @@ config MFD_AC100
>  	  This driver include only the core APIs. You have to select individual
>  	  components like codecs or RTC under the corresponding menus.
>  
> +config MFD_AC200
> +	tristate "X-Powers AC200"
> +	depends on COMMON_CLK
> +	depends on I2C
> +	depends on OF
> +	select MFD_CORE
> +	select REGMAP_I2C
> +	help
> +	  Support for the X-Powers AC200 mixed-signal companion IC. The AC200
> +	  contains audio, video, RTC and Fast Ethernet PHY functions and is
> +	  co-packaged with some Allwinner H6 and H616 SoCs. This driver provides
> +	  the shared register access and instantiates the individual function
> +	  devices.
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
> index 000000000000..af0d27ff5f45
> --- /dev/null
> +++ b/drivers/mfd/ac200.c
> @@ -0,0 +1,231 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * MFD core driver for the X-Powers AC200

No it isn't.

It's an "X-Powers AC200 Core driver".

> + *
> + * Copyright (C) 2019 Jernej Skrabec <jernej.skrabec@gmail.com>
> + * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#define AC200_SYS_CONTROL_REG			0x0002
> +#define AC200_SYS_CONTROL_CHIP_RESET_DEASSERT	BIT(0)
> +#define AC200_SYS_IRQ_ENABLE_REG		0x0004
> +#define AC200_SYS_IRQ_INTB_ENABLE		BIT(15)
> +#define AC200_SYS_IRQ_INTB_ACTIVE_HIGH		BIT(14)
> +#define AC200_SYS_IRQ_RTC			BIT(12)
> +#define AC200_SYS_IRQ_EPHY			BIT(8)
> +#define AC200_SYS_IRQ_TVE			BIT(4)
> +
> +/* Interface register accessible from every register page. */
> +#define AC200_TWI_REG_ADDR_H	0x00fe
> +#define AC200_MAX_REG		0xa1f2
> +
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
> +static const char * const ac200_codec_supplies[] = {
> +	"ac-ldoin",
> +};
> +
> +static const char * const ac200_tve_supplies[] = {
> +	"tv-vcc",
> +};
> +
> +static const struct resource ac200_tve_resources[] = {
> +	DEFINE_RES_IRQ_NAMED(0, "intb"),
> +};
> +
> +#define AC200_CELL(_name, _supplies, _resources)		\
> +	{							\
> +		.name = (_name),				\
> +		.parent_supplies = (_supplies),			\
> +		.num_parent_supplies = ARRAY_SIZE(_supplies),	\
> +		.resources = (_resources),			\
> +		.num_resources = MFD_RES_SIZE(_resources),	\
> +	}
> +
> +static const struct mfd_cell ac200_cells[] = {
> +	AC200_CELL("ac200-codec", ac200_codec_supplies, NULL),
> +	AC200_CELL("ac200-tve", ac200_tve_supplies, ac200_tve_resources),
> +};
> +
> +static const struct mfd_cell ac200_noirq_cells[] = {
> +	AC200_CELL("ac200-codec", ac200_codec_supplies, NULL),
> +	AC200_CELL("ac200-tve", ac200_tve_supplies, NULL),
> +};
> +
> +static void ac200_disable_intb(void *data)
> +{
> +	struct regmap *regmap = data;
> +	int ret;
> +
> +	ret = regmap_clear_bits(regmap, AC200_SYS_IRQ_ENABLE_REG,
> +				AC200_SYS_IRQ_INTB_ENABLE);
> +	if (ret)
> +		dev_err(regmap_get_device(regmap), "failed to disable INTB: %d\n",
> +			ret);

Nit: Avoid these line-wraps by using up to 100-chars.

This goes for the rest of the file too - I'll not comment at each location.

> +}
> +
> +static int ac200_init_irq(struct device *dev, struct regmap *regmap, int irq)
> +{
> +	unsigned int trigger;
> +	u16 value = 0;
> +	int ret;
> +
> +	trigger = irq_get_trigger_type(irq);
> +	switch (trigger) {
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		value |= AC200_SYS_IRQ_INTB_ACTIVE_HIGH;
> +		break;
> +	case IRQ_TYPE_NONE:
> +	case IRQ_TYPE_LEVEL_LOW:
> +		break;
> +	default:
> +		return dev_err_probe(dev, -EINVAL,
> +				     "INTB is level triggered, not type %u\n",
> +				     trigger);
> +	}
> +
> +	/* Mask every source before enabling the shared output. */
> +	ret = regmap_update_bits(regmap, AC200_SYS_IRQ_ENABLE_REG,
> +				 AC200_SYS_IRQ_INTB_ENABLE |
> +				 AC200_SYS_IRQ_INTB_ACTIVE_HIGH |
> +				 AC200_SYS_IRQ_RTC | AC200_SYS_IRQ_EPHY |
> +				 AC200_SYS_IRQ_TVE, value);
> +	if (ret)
> +		return ret;
> +
> +	/* Children are removed before INTB is disabled and the regmap released. */
> +	ret = devm_add_action_or_reset(dev, ac200_disable_intb, regmap);
> +	if (ret)
> +		return ret;
> +
> +	if (trigger == IRQ_TYPE_NONE) {
> +		ret = irq_set_irq_type(irq, IRQ_TYPE_LEVEL_LOW);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to set INTB trigger\n");
> +	}
> +
> +	/*
> +	 * Function drivers request INTB with IRQF_SHARED | IRQF_ONESHOT before
> +	 * enabling their own source. They check and clear their own status and
> +	 * mask their source before freeing the IRQ. No IRQ domain is needed.
> +	 */
> +	return regmap_set_bits(regmap, AC200_SYS_IRQ_ENABLE_REG,
> +			       AC200_SYS_IRQ_INTB_ENABLE);
> +}
> +
> +static int ac200_probe(struct i2c_client *client)
> +{
> +	const struct mfd_cell *cells = ac200_noirq_cells;
> +	unsigned int num_cells = ARRAY_SIZE(ac200_noirq_cells);
> +	struct device *dev = &client->dev;
> +	struct regmap *regmap;
> +	struct clk *clk;
> +	int ret;
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
> +	/*
> +	 * No minimum delay is documented. Retain the vendor resume path's 40 ms
> +	 * wait after enabling the input clock and before register access.
> +	 */
> +	msleep(40);
> +
> +	regmap = devm_regmap_init_i2c(client, &ac200_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to initialize regmap\n");
> +
> +	ret = regmap_set_bits(regmap, AC200_SYS_CONTROL_REG,
> +			      AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
> +	if (ret)
> +		return ret;
> +
> +	if (client->irq > 0) {
> +		ret = ac200_init_irq(dev, regmap, client->irq);
> +		if (ret)
> +			return ret;
> +		cells = ac200_cells;
> +		num_cells = ARRAY_SIZE(ac200_cells);
> +	}
> +
> +	/* Function drivers read their firmware properties from the parent. */
> +	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, num_cells,
> +				   NULL, client->irq, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add function devices\n");
> +
> +	return 0;
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
> +	.id_table = ac200_i2c_ids,
> +};
> +module_i2c_driver(ac200_driver);
> +
> +MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@gmail.com>");
> +MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
> +MODULE_DESCRIPTION("X-Powers AC200 MFD core driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.53.0
> 

-- 
Lee Jones
