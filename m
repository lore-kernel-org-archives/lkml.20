Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26FE54CF6C;
	Wed, 14 Oct 2026 15:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791990266; cv=none; b=sCCJFZWSs/J2O5HJJ3NTr20+PdT/K7m4d93oGy8T384GVMdEgzeD3GwafGARFXRLoHHnB1s+VFkYld4I7clKOruT1quUGmd6WhOKO7It2GX6awKOlQavaJgClsh6FBwaLinEyvbLx5rh5qc1lwvNkHQXNDkx7QjihBXvmGHckb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791990266; c=relaxed/simple;
	bh=R/lJHph2NtUZYSkB3YJAdRNztii7oc33NQoJj20zEjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YC/K1kVAWAAXn2IDqB2cED9nr+g0NJJYmmGfDQ411sii3l7Obc2NwRUcLHofDPCxh0WRIu0lfoLb7oYGmXDaS8+IOX/DXQp4kKL+fY0Ya2Uj4DMQcF69F+GvZwePsjpckSmoNYzS0Yu7WlTMQFCgmU1v9mtoSBMfmL7drkCnENY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HqTmKzh2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HqTmKzh2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 868421F000C4;
	Wed, 14 Oct 2026 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791990263;
	bh=Smuh1MWEePD3V5wu3Lx4JJ7s9l89/Q5ATH1FeAf43Lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HqTmKzh2ax96W+Hb5Y283wXiKHe0QKklrroREGryeuNtFLmIdtOCbaUHVj6atdf+u
	 lHMqK1YiwGcBZvkrYvN0UMtnUcjLJ59i+oHpr+RDsp06X31Ej1qzsYfS9CyvRgYyqv
	 1uGyFHSyv6v0Gxndi8z7sm5hyPhMF/l5xOgyLCu0hETJCsSXKrPO7kQU/1JKZgiy8b
	 5gZ9X0CEytrFTT1+BP+L/bEokOzH2WD8YzzpOAbG0AV0tYhShuICUuiTbHo4+duvDz
	 YtaHUHyvfbnpIfdJ+qGIwyx+viYAY6C4faXzKvJAa/w1DKBvKOxWc5gwbD15fTKD6T
	 lkQltugcsxFUw==
Date: Wed, 14 Oct 2026 16:04:17 +0100
From: Lee Jones <lee@kernel.org>
To: zain_zhou@realsil.com.cn
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	Lakshay Piplani <lakshay.piplani@nxp.com>,
	devicetree@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
	Wei Wang <wei_wang@realsil.com.cn>
Subject: Re: [RFC PATCH 2/4] mfd: Add driver for Realtek RTS490x I3C hub
Message-ID: <179198542200.839288.16069032392567490984@kernel.org>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-3-zain_zhou@realsil.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920100501.4091351-3-zain_zhou@realsil.com.cn>
X-AI-Review-Draft: <20260920100501.4091351-3-zain_zhou@realsil.com.cn>

On Sun, 20 Sep 2026, zain_zhou@realsil.com.cn wrote:

> From: Yin Zhou <zain_zhou@realsil.com.cn>
>
> Add the MFD core driver for the Realtek RTS490x family of I3C hubs.
> The driver initializes the shared register map, identifies the hub
> variant, and registers the regulator and I3C hub child devices.
>
> Signed-off-by: Yin Zhou <zain_zhou@realsil.com.cn>
> ---
>  MAINTAINERS                 |   2 +
>  drivers/mfd/Kconfig         |  11 +++
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/rts490x-core.c  | 131 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/rts490x.h |  53 +++++++++++++++
>  5 files changed, 198 insertions(+)
>  create mode 100644 drivers/mfd/rts490x-core.c
>  create mode 100644 include/linux/mfd/rts490x.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a2c171a28cd2..659f553420eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22998,6 +22998,8 @@ L:	linux-i3c@lists.infradead.org
>  L:	linux-kernel@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/realtek,rts490x.yaml
> +F:	drivers/mfd/rts490x-core.c
> +F:	include/linux/mfd/rts490x.h
>
>  REALTEK OTTO WATCHDOG
>  M:	Sander Vanheule <sander@svanheule.net>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index ee809b0c1b8f..6da8967de1a2 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -630,6 +630,17 @@ config MFD_P3H2X4X
>  	  This driver provides support for I3C hub and regulator, each subdriver
>  	  can be enabled independently depending on the required functionality.
>
> +config MFD_RTS490X
> +	tristate "Realtek RTS490x I3C hub"
> +	depends on I3C
> +	select MFD_CORE
> +	select REGMAP_I3C
> +	help
> +	  Enable support for the Realtek RTS490x family of I3C hub devices.
> +	  This driver provides the shared register map and parent state used by
> +	  the I3C hub and regulator child drivers. The hub is connected to the
> +	  host through I3C.
> +
>  config MFD_PF1550
>  	tristate "NXP PF1550 PMIC Support"
>  	depends on I2C=y && OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index ec4e093f3540..97988277bee9 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -124,6 +124,7 @@ obj-$(CONFIG_MFD_MC13XXX_I2C)	+= mc13xxx-i2c.o
>
>  obj-$(CONFIG_MFD_P3H2X4X)	+= p3h2840.o
>  obj-$(CONFIG_MFD_PF1550)	+= pf1550.o
> +obj-$(CONFIG_MFD_RTS490X)	+= rts490x-core.o
>
>  obj-$(CONFIG_MFD_NCT6694)	+= nct6694.o
>
> diff --git a/drivers/mfd/rts490x-core.c b/drivers/mfd/rts490x-core.c
> new file mode 100644
> index 000000000000..c10718397167
> --- /dev/null
> +++ b/drivers/mfd/rts490x-core.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (c) 2025-2026 Realtek Semiconductor Corp. */
> +
> +#include <linux/bitfield.h>
> +#include <linux/i3c/device.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/rts490x.h>
> +#include <linux/regmap.h>
> +
> +struct rts490x_device_info {
> +	const char *model;
> +	u16 part_id;
> +	u8 num_target_ports;
> +};
> +
> +static const struct rts490x_device_info rts490x_devices[] = {
> +	{ "RTS4900", 0x4000, 4 },
> +	{ "RTS4901", 0x4100, 4 },
> +	{ "RTS4902", 0x8000, 8 },
> +	{ "RTS4903", 0x8100, 8 },
> +	{ "RTS4904", 0x4001, 4 },
> +	{ "RTS4906", 0x8001, 8 },
> +};
> +
> +static const struct mfd_cell rts490x_cells[] = {
> +	MFD_CELL_NAME("rts490x-regulator"),
> +	MFD_CELL_NAME("rts490x-i3c-hub"),
> +};
> +
> +static const struct regmap_config rts490x_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +};
> +
> +static int rts490x_read_device_info(struct device *dev, struct rts490x *rts490x)
> +{
> +	unsigned int value;
> +	u16 part_id;
> +	int ret;
> +	int i;

Please declare loop counters inside the 'for' statement.

> +
> +	ret = regmap_read(rts490x->regmap, RTS490X_DEV_INFO_0, &value);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read device information\n");
> +
> +	part_id = value << 8;
> +
> +	ret = regmap_read(rts490x->regmap, RTS490X_DEV_REV, &value);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to read device revision\n");
> +
> +	part_id |= FIELD_GET(RTS490X_DEV_REV_LDO_MASK, value);
> +
> +	for (i = 0; i < ARRAY_SIZE(rts490x_devices); i++) {
> +		if (rts490x_devices[i].part_id != part_id)
> +			continue;
> +
> +		rts490x->model = rts490x_devices[i].model;
> +		rts490x->part_id = part_id;
> +		rts490x->num_target_ports = rts490x_devices[i].num_target_ports;
> +		return 0;
> +	}
> +
> +	return dev_err_probe(dev, -ENODEV,
> +			     "unsupported RTS490x device ID 0x%04x\n", part_id);
> +}
> +
> +static int rts490x_probe(struct i3c_device *i3cdev)
> +{
> +	struct device *dev = i3cdev_to_dev(i3cdev);
> +	struct i3c_device_info info;
> +	struct rts490x *rts490x;
> +	int ret;
> +
> +	i3c_device_get_info(i3cdev, &info);
> +	if (I3C_PID_MANUF_ID(info.pid) != RTS490X_MANUFACTURER_ID)
> +		return -ENODEV;

Doesn't 'rts490x_i3c_ids' already match on 'I3C_MATCH_MANUF' with
'RTS490X_MANUFACTURER_ID'?   When would this check ever trigger?

> +	rts490x = devm_kzalloc(dev, sizeof(*rts490x), GFP_KERNEL);
> +	if (!rts490x)
> +		return -ENOMEM;
> +
> +	ret = devm_mutex_init(dev, &rts490x->protected_reg_lock);
> +	if (ret)
> +		return ret;
> +
> +	rts490x->regmap = devm_regmap_init_i3c(i3cdev, &rts490x_regmap_config);
> +	if (IS_ERR(rts490x->regmap))
> +		return dev_err_probe(dev, PTR_ERR(rts490x->regmap),
> +				     "failed to initialize regmap\n");
> +
> +	rts490x->i3cdev = i3cdev;
> +	i3cdev_set_drvdata(i3cdev, rts490x);
> +
> +	ret = rts490x_read_device_info(dev, rts490x);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
> +				   rts490x_cells, ARRAY_SIZE(rts490x_cells),
> +				   NULL, 0, NULL);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to add child devices\n");
> +
> +	dev_info(dev, "%s I3C hub with %u target ports\n",
> +		 rts490x->model, rts490x->num_target_ports);

Keep the kernel log clean whenever possible please.

> +
> +	return 0;
> +}
> +
> +static const struct i3c_device_id rts490x_i3c_ids[] = {
> +	{
> +		.match_flags = I3C_MATCH_DCR | I3C_MATCH_MANUF,
> +		.dcr = I3C_DCR_HUB,
> +		.manuf_id = RTS490X_MANUFACTURER_ID,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i3c, rts490x_i3c_ids);
> +
> +static struct i3c_driver rts490x_driver = {
> +	.driver.name = "rts490x",
> +	.probe = rts490x_probe,
> +	.id_table = rts490x_i3c_ids,
> +};
> +module_i3c_driver(rts490x_driver);
> +
> +MODULE_AUTHOR("Yin Zhou <zain_zhou@realsil.com.cn>");
> +MODULE_DESCRIPTION("Realtek RTS490x I3C hub MFD driver");

Please drop "MFD" from the description.

> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/rts490x.h b/include/linux/mfd/rts490x.h
> new file mode 100644
> index 000000000000..2af77d22dab9
> --- /dev/null
> +++ b/include/linux/mfd/rts490x.h
> @@ -0,0 +1,53 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2025-2026 Realtek Semiconductor Corp. */
> +#ifndef _LINUX_MFD_RTS490X_H
> +#define _LINUX_MFD_RTS490X_H
> +
> +#include <linux/bits.h>
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +
> +#define RTS490X_MAX_TARGET_PORTS		8
> +
> +/* Device information registers shared by the MFD children. */
> +#define RTS490X_DEV_INFO_0		0x00
> +#define RTS490X_DEV_REV			0x0b
> +#define RTS490X_DEV_REV_LDO_MASK	GENMASK(7, 6)
> +
> +/* Regulator registers shared with the regulator child. */
> +#define RTS490X_LDO_CONF		0x16
> +#define RTS490X_LDO_AND_PULLUP_CONF	0x19
> +
> +/* Protected-register access shared by the MFD children. */
> +#define RTS490X_PROTECTION_CODE		0x10
> +#define RTS490X_REGISTERS_LOCK_CODE	0x00
> +#define RTS490X_REGISTERS_UNLOCK_CODE	0x69
> +
> +#define RTS490X_MANUFACTURER_ID		0x025d
> +
> +struct i3c_device;
> +struct regmap;
> +struct rts490x_hub;
> +
> +/**
> + * struct rts490x - shared state for RTS490x MFD children
> + * @i3cdev: upstream I3C device
> + * @regmap: register map shared by all child drivers
> + * @protected_reg_lock: serializes protected-register transactions
> + * @model: detected chip model
> + * @part_id: hardware part identifier
> + * @num_target_ports: number of implemented target ports
> + * @hub: hub child state used by the hub-device IBI handler
> + */
> +struct rts490x {
> +	struct i3c_device *i3cdev;
> +	struct regmap *regmap;
> +	/* Serializes protected-register transactions across child drivers. */
> +	struct mutex protected_reg_lock;
> +	const char *model;
> +	u16 part_id;
> +	u8 num_target_ports;
> +	struct rts490x_hub *hub;
> +};
> +
> +#endif /* _LINUX_MFD_RTS490X_H */
> -- 
> 2.34.1
>

-- 
Lee Jones
