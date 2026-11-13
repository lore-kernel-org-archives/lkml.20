Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600467;
	b=BlH07gkJgzVC5S/Y5MTaChoaYmLwFq5mK23wPNcV1yl6iP/lSnufMiWQ2ltGF/vX2I3Z
	 9YHGFSHoiPAaggHpeFAjCpT0iQUQGjC59Zt4JPz+AS8fS553WcPqUdoOYiZsVKWB4scRp
	 yIN8DLhIZwm98Z+rzgmkeiienXyedOiajJp3THETPEC4MiWOikdKNoGsBRbX6ttwnmMeD
	 227SgMJRU1O0nGZUaK/4nCHj770YYSR3n5jw3XeFkAWwdTsGeY3m+8QWSlbjCdV6DOZBW
	 KPKbxrvqgD7cHhBaka+CPtgUqL11zaKegZjG8YU5Zi55LaSk1txg8LX9faEzlXE8u0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600467;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-AI-Review-Draft;
	bh=V59hB7mDfke14frT8hGLCMDmtUEnUw7C43bVkeGhwAU=;
	b=0HwRYzYOVxWRQhkcqTX5VpYjCtK4LedRaMyFr2O2JGtGxT338wltAftQTjEQ956kwUxN
	 WFAMBl12fSbzvo7HSf7En1mVjsoU5hKFVyFAm2AjfwtYiS7yC09Vfn5jwc0BDdOu/eTbR
	 aUNwwmjQCyZhuO739qOr7DIPbCtpbd3UQOsUSbdUhKSJ5GyOOfpmU8zaxNN/2TKf0SKem
	 VD5DlVWkqvnjX4GAkOpL0eA2PyMk/fe5Im17S11Yj2er0rf5CBeBuqsj7Mg2QDxqpuZsh
	 lIUFwv6s5u7OqTfWZf6aU5VkUBEQ6jV56Hai+N1GZwC+jI1iA9zOylFX0TYGvG99erw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="esaI+IE/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368C3606A330;
	Fri, 13 Nov 2026 20:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=esaI+IE/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945C71F000C4;
	Fri, 13 Nov 2026 20:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794600467;
	bh=V59hB7mDfke14frT8hGLCMDmtUEnUw7C43bVkeGhwAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=esaI+IE/KCGnle/52/zaRbhSiqCQgzo4LX7d9Q6gFwsTjanaT+lNmD49CMlWDmSdo
	 8hXmAxM4HiAL8gjVeypZzsE7UaKd16ipKJ0evkFHZWJ/+g/mIvsmOkWuSPjz0Hytag
	 tpv1hoOQgv6PVFFbc4yPm9o2fC+/dsuioEApLYuUiq7RDSDMG1CR8huAosbVQ4g6Jt
	 kJwnISPsZt93HT7SGwQF0ontHJOveczp7HPzwFgcFxLfkcvt2SEOaRN9Q4Xul+53RX
	 IztOAVlBzwgp+513z/nKosoQiqix8eQq9WV3+LXUNHi/LrUk4XDX4yHMZUKebb2UzP
	 +e+Eo+iJyzyEg==
Date: Fri, 13 Nov 2026 20:07:42 +0000
From: Lee Jones <lee@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: an8855: Add support for Airoha AN8855 Switch
Message-ID: <179381088649.1840692.12177563377919419687@kernel.org>
References: <20261103203034.12869-1-ansuelsmth@gmail.com>
 <20261103203034.12869-3-ansuelsmth@gmail.com>
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
In-Reply-To: <20261103203034.12869-3-ansuelsmth@gmail.com>
X-AI-Review-Draft: <20261103203034.12869-3-ansuelsmth@gmail.com>

Please review, explain or fix the Sashiko review(s).
If this is a set, this request includes the other patches too.

> Add support for Airoha AN8855 Switch that provide support for a DSA
> switch and a NVMEM provider.
>
> Also make use of the mdio-regmap driver and register a regmap for each
> internal PHY of the switch.
> This is needed to handle the double usage of the PHYs as both PHY and
> Switch accessor.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/mfd/Kconfig         |  14 +
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/airoha-an8855.c | 579 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 594 insertions(+)
>  create mode 100644 drivers/mfd/airoha-an8855.c
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 87ed55c155f0..653a81435b20 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -54,6 +54,20 @@ config MFD_ALTERA_SYSMGR
>  	  using regmap_mmio accesses for ARM32 parts and SMC calls to
>  	  EL3 for ARM64 parts.
>
> +config MFD_AIROHA_AN8855
> +	tristate "Airoha AN8855 Switch Core"
> +	select MFD_CORE
> +	select REGMAP
> +	select PHYLIB
> +	select MDIO_REGMAP
> +	depends on NETDEVICES && OF
> +	help
> +	  Support for the Airoha AN8855 Switch Core. This is an SoC
> +	  that provides various peripherals, to count, i2c, an Ethrnet
> +	  Switch, a CPU timer, GPIO, eFUSE.
> +
> +	  Currently it provides a DSA switch and a NVMEM provider.
> +
>  config MFD_ACT8945A
>  	tristate "Active-semi ACT8945A"
>  	select MFD_CORE
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index f8101d2a9ce9..96bbe3fad736 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_MFD_88PM860X)	+= 88pm860x.o
>  obj-$(CONFIG_MFD_88PM800)	+= 88pm800.o 88pm80x.o
>  obj-$(CONFIG_MFD_88PM805)	+= 88pm805.o 88pm80x.o
>  obj-$(CONFIG_MFD_88PM886_PMIC)	+= 88pm886.o
> +obj-$(CONFIG_MFD_AIROHA_AN8855)	+= airoha-an8855.o
>  obj-$(CONFIG_MFD_ACT8945A)	+= act8945a.o
>  obj-$(CONFIG_MFD_SM501)		+= sm501.o
>  obj-$(CONFIG_ARCH_BCM2835)	+= bcm2835-pm.o
> diff --git a/drivers/mfd/airoha-an8855.c b/drivers/mfd/airoha-an8855.c
> new file mode 100644
> index 000000000000..6a270555db5c
> --- /dev/null
> +++ b/drivers/mfd/airoha-an8855.c
> @@ -0,0 +1,579 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Core driver for Airoha AN8855 Switch
> + *
> + * Copyright (C) 2024 Christian Marangi <ansuelsmth@gmail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/fwnode_mdio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mdio.h>
> +#include <linux/mdio/mdio-regmap.h>

Alphabetical.

> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy.h>
> +#include <linux/regmap.h>
> +
> +/* Register for HW trap status */
> +#define AN8855_HWTRAP			0x1000009c
> +
> +/*
> + * Register of the Switch ID
> + * (called Project ID in Documentation)
> + */
> +#define AN8855_CREV			0x10005000
> +#define   AN8855_ID			0x8855 /* Switch ID */
> +
> +/* Register for GPHY Power Down
> + * Used to Toggle the Gigabit PHY power and enable them.
> + */

This is an incorrectly formatted multi-line comment.

> +#define AN8855_RG_GPHY_AFE_PWD		0x1028c840
> +
> +/* MII Registers */
> +#define AN8855_PHY_SELECT_PAGE		0x1f
> +#define   AN8855_PHY_PAGE		GENMASK(2, 0)
> +#define   AN8855_PHY_PAGE_STANDARD	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x0)
> +#define   AN8855_PHY_PAGE_EXTENDED_1	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x1)
> +#define   AN8855_PHY_PAGE_EXTENDED_4	FIELD_PREP_CONST(AN8855_PHY_PAGE, 0x4)
> +
> +/* MII Registers Page 4 */
> +#define AN8855_PBUS_MODE		0x10
> +#define   AN8855_PBUS_MODE_ADDR_FIXED	0x0
> +#define   AN8855_PBUS_MODE_ADDR_INCR	BIT(15)
> +#define AN8855_PBUS_WR_ADDR_HIGH	0x11
> +#define AN8855_PBUS_WR_ADDR_LOW		0x12
> +#define AN8855_PBUS_WR_DATA_HIGH	0x13
> +#define AN8855_PBUS_WR_DATA_LOW		0x14
> +#define AN8855_PBUS_RD_ADDR_HIGH	0x15
> +#define AN8855_PBUS_RD_ADDR_LOW		0x16
> +#define AN8855_PBUS_RD_DATA_HIGH	0x17
> +#define AN8855_PBUS_RD_DATA_LOW		0x18
> +
> +#define AN8855_MAX_PHY_PORT		5
> +
> +struct an8855 {
> +	struct mii_bus *bus;
> +	struct mii_bus *phy_bus;
> +	unsigned int switch_addr;
> +	u16 current_page;
> +};
> +
> +struct an8855_phy {
> +	u8 addr;
> +	struct an8855 *core;
> +};
> +
> +struct an8855_phy_bus {
> +	struct mii_bus *bus;
> +	struct fwnode_handle *node;
> +	u8 addr;
> +};
> +
> +static const struct mfd_cell an8855_cells[] = {
> +	MFD_CELL_OF("an8855-efuse", NULL, NULL, 0, 0,
> +		    "airoha,an8855-efuse"),
> +	MFD_CELL_OF("an8855-switch", NULL, NULL, 0, 0,
> +		    "airoha,an8855-switch"),

Use 100-chars to avoid these pointless wraps.

They also appear to be shorter than some following lines.

> +};
> +
> +static int an8855_mii_set_page(struct an8855 *ddata, u8 addr,
> +			       u8 page) __must_hold(&ddata->bus->mdio_lock)

This should line-up with the ( and is that 8 spaces?

> +{
> +	struct mii_bus *bus = ddata->bus;
> +	int ret;
> +
> +	ret = __mdiobus_write(bus, addr, AN8855_PHY_SELECT_PAGE, page);
> +	if (ret) {
> +		dev_err_ratelimited(&bus->dev, "failed to set mii page\n");

Can we start sentences with an upper-case char?

> +		return ret;
> +	}
> +
> +	/* Cache current page if next MII read/write is for Switch page */
> +	ddata->current_page = page;
> +	return 0;
> +}
> +
> +static int an8855_mii_read32(struct mii_bus *bus, u8 phy_id, u32 reg,
> +			     u32 *val) __must_hold(&bus->mdio_lock)
> +{
> +	int lo, hi, ret;
> +
> +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_MODE,
> +			      AN8855_PBUS_MODE_ADDR_FIXED);
> +	if (ret)
> +		goto err;
> +
> +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_RD_ADDR_HIGH,
> +			      upper_16_bits(reg));
> +	if (ret)
> +		goto err;
> +
> +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_RD_ADDR_LOW,
> +			      lower_16_bits(reg));
> +	if (ret)
> +		goto err;
> +
> +	hi = __mdiobus_read(bus, phy_id, AN8855_PBUS_RD_DATA_HIGH);
> +	if (hi < 0) {
> +		ret = hi;
> +		goto err;
> +	}
> +
> +	lo = __mdiobus_read(bus, phy_id, AN8855_PBUS_RD_DATA_LOW);
> +	if (lo < 0) {
> +		ret = lo;
> +		goto err;
> +	}
> +
> +	*val = ((u32)hi << 16) | lo;

No magic numbers please.

> +	return 0;
> +err:
> +	dev_err_ratelimited(&bus->dev, "failed to read register\n");
> +	return ret;
> +}
> +
> +/*
> + * Protect concurrent access to phy page if switch address also
> + * expose a PHY.
> + */
> +static void an8855_regmap_lock(struct an8855 *ddata)
> +{
> +	if (ddata->phy_bus)
> +		mutex_lock(&ddata->phy_bus->mdio_lock);

Nit: \n

> +	mutex_lock_nested(&ddata->bus->mdio_lock, MDIO_MUTEX_NESTED);
> +}
> +
> +static void an8855_regmap_unlock(struct an8855 *ddata)
> +{
> +	mutex_unlock(&ddata->bus->mdio_lock);

Nit: \n

> +	if (ddata->phy_bus)
> +		mutex_unlock(&ddata->phy_bus->mdio_lock);
> +}
> +
> +static int an8855_regmap_read(void *ctx, uint32_t reg, uint32_t *val)
> +{
> +	struct an8855 *ddata = ctx;
> +	struct mii_bus *bus = ddata->bus;
> +	u16 addr = ddata->switch_addr;
> +	int ret;
> +
> +	an8855_regmap_lock(ddata);

Nit: \n

> +	ret = an8855_mii_set_page(ddata, addr, AN8855_PHY_PAGE_EXTENDED_4);
> +	if (ret < 0)

Can an8855_mii_set_page() return positive values?

If not, please use 'if (ret)'.

> +		goto exit;
> +
> +	ret = an8855_mii_read32(bus, addr, reg, val);
> +
> +exit:
> +	an8855_regmap_unlock(ddata);
> +
> +	return ret < 0 ? ret : 0;

Both an8855_mii_set_page() and an8855_mii_read32() only return 0 or a
negative error code.  Can't you just 'return ret;' here and in
an8855_regmap_write() and an8855_regmap_update_bits()?

> +}
> +
> +static int an8855_mii_write32(struct mii_bus *bus, u8 phy_id, u32 reg,
> +			      u32 val) __must_hold(&bus->mdio_lock)
> +{
> +	int ret;
> +
> +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_MODE,
> +			      AN8855_PBUS_MODE_ADDR_FIXED);
> +	if (ret)
> +		goto err;
> +
> +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_ADDR_HIGH,
> +			      upper_16_bits(reg));
> +	if (ret)
> +		goto err;
> +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_ADDR_LOW,
> +			      lower_16_bits(reg));
> +	if (ret)
> +		goto err;
> +
> +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_DATA_HIGH,
> +			      upper_16_bits(val));
> +	if (ret)
> +		goto err;
> +
> +	ret = __mdiobus_write(bus, phy_id, AN8855_PBUS_WR_DATA_LOW,
> +			      lower_16_bits(val));

100-chars throughout.

> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +err:
> +	dev_err_ratelimited(&bus->dev,
> +			    "failed to write an8855 register\n");
> +	return ret;
> +}
> +
> +static int an8855_regmap_write(void *ctx, uint32_t reg, uint32_t val)
> +{
> +	struct an8855 *ddata = ctx;
> +	struct mii_bus *bus = ddata->bus;
> +	u16 addr = ddata->switch_addr;
> +	int ret;
> +
> +	an8855_regmap_lock(ddata);
> +	ret = an8855_mii_set_page(ddata, addr, AN8855_PHY_PAGE_EXTENDED_4);
> +	if (ret)
> +		goto exit;
> +
> +	ret = an8855_mii_write32(bus, addr, reg, val);
> +
> +exit:
> +	an8855_regmap_unlock(ddata);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int an8855_regmap_update_bits(void *ctx, uint32_t reg, uint32_t mask,
> +				     uint32_t write_val)
> +{
> +	struct an8855 *ddata = ctx;
> +	struct mii_bus *bus = ddata->bus;
> +	u16 addr = ddata->switch_addr;
> +	u32 val;
> +	int ret;
> +
> +	an8855_regmap_lock(ddata);
> +	ret = an8855_mii_set_page(ddata, addr, AN8855_PHY_PAGE_EXTENDED_4);
> +	if (ret)
> +		goto exit;
> +
> +	ret = an8855_mii_read32(bus, addr, reg, &val);
> +	if (ret < 0)

Same here - 'if (ret)'.

> +		goto exit;
> +
> +	val &= ~mask;
> +	val |= write_val & mask;
> +	ret = an8855_mii_write32(bus, addr, reg, val);
> +
> +exit:
> +	an8855_regmap_unlock(ddata);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static const struct regmap_range an8855_readable_ranges[] = {
> +	regmap_reg_range(0x10000000, 0x10000fff), /* SCU */
> +	regmap_reg_range(0x10001000, 0x10001fff), /* RBUS */
> +	regmap_reg_range(0x10002000, 0x10002fff), /* MCU */
> +	regmap_reg_range(0x10005000, 0x10005fff), /* SYS SCU */
> +	regmap_reg_range(0x10007000, 0x10007fff), /* I2C Slave */
> +	regmap_reg_range(0x10008000, 0x10008fff), /* I2C Master */
> +	regmap_reg_range(0x10009000, 0x10009fff), /* PDMA */
> +	regmap_reg_range(0x1000a100, 0x1000a1ff), /* General Purpose Timer */
> +	regmap_reg_range(0x1000a200, 0x1000a2ff), /* GPU timer */
> +	regmap_reg_range(0x1000a300, 0x1000a3ff), /* GPIO */
> +	regmap_reg_range(0x1000a400, 0x1000a5ff), /* EFUSE */
> +	regmap_reg_range(0x1000c000, 0x1000cfff), /* GDMP CSR */
> +	regmap_reg_range(0x10010000, 0x1001ffff), /* GDMP SRAM */
> +	regmap_reg_range(0x10200000, 0x10203fff), /* Switch - ARL Global */
> +	regmap_reg_range(0x10204000, 0x10207fff), /* Switch - BMU */
> +	regmap_reg_range(0x10208000, 0x1020bfff), /* Switch - ARL Port */
> +	regmap_reg_range(0x1020c000, 0x1020cfff), /* Switch - SCH */
> +	regmap_reg_range(0x10210000, 0x10213fff), /* Switch - MAC */
> +	regmap_reg_range(0x10214000, 0x10217fff), /* Switch - MIB */
> +	regmap_reg_range(0x10218000, 0x1021bfff), /* Switch - Port Control */
> +	regmap_reg_range(0x1021c000, 0x1021ffff), /* Switch - TOP */
> +	regmap_reg_range(0x10220000, 0x1022ffff), /* SerDes */
> +	regmap_reg_range(0x10286000, 0x10286fff), /* RG Batcher */
> +	regmap_reg_range(0x1028c000, 0x1028ffff), /* ETHER_SYS */
> +	regmap_reg_range(0x30000000, 0x37ffffff), /* I2C EEPROM */
> +	regmap_reg_range(0x38000000, 0x3fffffff), /* BOOT_ROM */
> +	regmap_reg_range(0xa0000000, 0xbfffffff), /* GPHY */
> +};
> +
> +static const struct regmap_access_table an8855_readable_table = {
> +	.yes_ranges = an8855_readable_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(an8855_readable_ranges),
> +};
> +
> +static const struct regmap_config an8855_regmap_config = {
> +	.name = "switch",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0xbfffffff,
> +	.reg_read = an8855_regmap_read,
> +	.reg_write = an8855_regmap_write,
> +	.reg_update_bits = an8855_regmap_update_bits,
> +	.disable_locking = true,
> +	.rd_table = &an8855_readable_table,
> +};
> +
> +static int an8855_regmap_phy_reset_page(struct an8855 *ddata,
> +					int phy) __must_hold(&ddata->bus->mdio_lock)
> +{
> +	/* Check PHY page only for addr shared with switch */
> +	if (phy != ddata->switch_addr)
> +		return 0;
> +
> +	/* Don't restore page if it's not set to Switch page */
> +	if (ddata->current_page != AN8855_PHY_PAGE_EXTENDED_4)
> +		return 0;
> +
> +	/*
> +	 * Restore page to 0, PHY might change page right after but that
> +	 * will be ignored as it won't be a switch page.
> +	 */
> +	return an8855_mii_set_page(ddata, phy, AN8855_PHY_PAGE_STANDARD);
> +}
> +
> +static int an8855_regmap_phy_read(void *ctx, uint32_t reg, uint32_t *val)
> +{
> +	struct an8855_phy *ddata = ctx;
> +	struct an8855 *core_ddata;
> +	u32 addr = ddata->addr;
> +	struct mii_bus *bus;
> +	int ret;
> +
> +	core_ddata = ddata->core;
> +	bus = core_ddata->bus;

Why not initialise 'core_ddata' and 'bus' when declaring them?

> +
> +	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> +	ret = an8855_regmap_phy_reset_page(core_ddata, addr);
> +	if (ret)
> +		goto exit;
> +
> +	ret = __mdiobus_read(bus, addr, reg);
> +	if (ret >= 0)
> +		*val = ret;
> +
> +exit:
> +	mutex_unlock(&bus->mdio_lock);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int an8855_regmap_phy_write(void *ctx, uint32_t reg, uint32_t val)
> +{
> +	struct an8855_phy *ddata = ctx;
> +	struct an8855 *core_ddata;
> +	u32 addr = ddata->addr;
> +	struct mii_bus *bus;
> +	int ret;
> +
> +	core_ddata = ddata->core;
> +	bus = core_ddata->bus;

Same here.

> +
> +	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
> +	ret = an8855_regmap_phy_reset_page(core_ddata, addr);
> +	if (ret)
> +		goto exit;
> +
> +	ret = __mdiobus_write(bus, addr, reg, val);
> +
> +exit:
> +	mutex_unlock(&bus->mdio_lock);
> +
> +	return ret;
> +}
> +
> +static const struct regmap_config an8855_phy_regmap_config = {
> +	.reg_bits = 16,
> +	.val_bits = 16,
> +	.reg_read = an8855_regmap_phy_read,
> +	.reg_write = an8855_regmap_phy_write,
> +	.disable_locking = true,
> +	.max_register = 0x1f,
> +};
> +
> +static int an8855_read_switch_id(struct device *dev, struct regmap *regmap)
> +{
> +	u32 id;
> +	int ret;
> +
> +	ret = regmap_read(regmap, AN8855_CREV, &id);
> +	if (ret)
> +		return ret;
> +
> +	if (id != AN8855_ID) {
> +		dev_err(dev, "Detected Switch ID %x but %x was expected\n",
> +			id, AN8855_ID);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static int an8855_phy_bus_register(struct device *dev, struct an8855 *ddata,
> +				   struct device_node *phy_np,
> +				   struct an8855_phy_bus *phy_bus_info)

Why can't we do this in the phy driver?

> +{
> +	struct mdio_regmap_config mrc = { };
> +	struct an8855_phy *phy_ddata;
> +	struct regmap *regmap;
> +	u32 addr, phy_offset;
> +	struct mii_bus *bus;
> +	int ret;
> +
> +	ret = of_property_read_u32(phy_np, "reg", &addr);
> +	if (ret)
> +		return ret;
> +
> +	phy_offset = addr - ddata->switch_addr;
> +	if (phy_offset >= AN8855_MAX_PHY_PORT)
> +		return -EINVAL;
> +
> +	phy_ddata = devm_kzalloc(dev, sizeof(*phy_ddata), GFP_KERNEL);
> +	if (!phy_ddata)
> +		return -ENOMEM;
> +
> +	phy_ddata->addr = addr;
> +	phy_ddata->core = ddata;

Nested ddatas!

> +	regmap = devm_regmap_init(dev, NULL, phy_ddata, &an8855_phy_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "phy%d regmap initialization failed\n",
> +				      addr);
> +
> +	mrc.regmap = regmap;
> +	mrc.parent = dev;
> +	mrc.valid_addr = addr;
> +	snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%u", dev_name(dev), addr);
> +
> +	bus = devm_mdio_regmap_register(dev, &mrc);
> +	if (IS_ERR(bus))
> +		return PTR_ERR(bus);
> +
> +	if (addr == ddata->switch_addr)
> +		ddata->phy_bus = bus;
> +
> +	phy_bus_info->bus = bus;
> +	phy_bus_info->addr = addr;
> +	phy_bus_info->node = fwnode_handle_get(of_fwnode_handle(phy_np));
> +
> +	return 0;
> +}
> +
> +static int an8855_mdio_register(struct device *dev, struct an8855 *ddata,
> +				struct an8855_phy_bus *phy_bus_infos)
> +{
> +	struct device_node *mdio_np;
> +	int ret = 0;
> +	int i = 0;
> +
> +	mdio_np = of_get_child_by_name(dev->of_node, "mdio");
> +	if (!mdio_np)
> +		return -ENODEV;
> +
> +	for_each_available_child_of_node_scoped(mdio_np, phy_np) {

Can you use __free(device_node) for 'mdio_np' too, or use the fwnode API
consistently throughout instead of mixing 'of_*' and 'fwnode_*'?

> +		if (i >= AN8855_MAX_PHY_PORT) {
> +			ret = -EINVAL;
> +			goto exit;
> +		}
> +
> +		ret = an8855_phy_bus_register(dev, ddata, phy_np,
> +					      &phy_bus_infos[i]);
> +		if (ret)
> +			goto exit;
> +
> +		i++;

This isn't a meaningless iterator.  Can we name it?  'phy'?

> +	}
> +
> +exit:
> +	of_node_put(mdio_np);
> +	if (ret) {
> +		while (i--)
> +			fwnode_handle_put(phy_bus_infos[i].node);
> +
> +		return ret;
> +	}
> +
> +	return i;
> +}
> +
> +static int an8855_probe(struct mdio_device *mdiodev)
> +{
> +	struct an8855_phy_bus phy_bus_infos[AN8855_MAX_PHY_PORT] = { };
> +	struct device *dev = &mdiodev->dev;
> +	struct regmap *regmap;
> +	struct an8855 *ddata;
> +	int num_phys;
> +	int i, ret;
> +
> +	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> +	if (!ddata)
> +		return -ENOMEM;
> +
> +	ddata->bus = mdiodev->bus;
> +	ddata->switch_addr = mdiodev->addr;
> +	/* No DMA for mdiobus, mute warning for DMA mask not set */
> +	dev->dma_mask = &dev->coherent_dma_mask;
> +
> +	/* Register virtual MDIO for each PHY */
> +	num_phys = an8855_mdio_register(dev, ddata, phy_bus_infos);
> +	if (num_phys < 0)
> +		return num_phys;
> +
> +	regmap = devm_regmap_init(dev, NULL, ddata, &an8855_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		ret = PTR_ERR(regmap);
> +		dev_err_probe(dev, ret, "regmap initialization failed\n");
> +		goto err_put_fwnodes;
> +	}
> +
> +	/* Reset PHY page for switch address */
> +	mutex_lock_nested(&ddata->bus->mdio_lock, MDIO_MUTEX_NESTED);
> +	ret = an8855_mii_set_page(ddata, ddata->switch_addr,
> +				  AN8855_PHY_PAGE_STANDARD);
> +	mutex_unlock(&ddata->bus->mdio_lock);
> +	if (ret)
> +		goto err_put_fwnodes;
> +
> +	ret = an8855_read_switch_id(dev, regmap);
> +	if (ret)
> +		goto err_put_fwnodes;
> +
> +	/* Release global PHY power down */
> +	ret = regmap_write(regmap, AN8855_RG_GPHY_AFE_PWD, 0x0);
> +	if (ret)
> +		goto err_put_fwnodes;
> +
> +	/* Register PHYs */
> +	for (i = 0; i < num_phys; i++) {
> +		ret = fwnode_mdiobus_register_phy(phy_bus_infos[i].bus,
> +						  phy_bus_infos[i].node,
> +						  phy_bus_infos[i].addr);
> +		fwnode_handle_put(phy_bus_infos[i].node);

Why do we need 'an8855_phy_bus' and two separate loops at all?  If you
initialise the switch regmap, verify the Switch ID, and release
'AN8855_RG_GPHY_AFE_PWD' before calling an8855_mdio_register(), can't
an8855_phy_bus_register() call fwnode_mdiobus_register_phy() directly?
That would allow you to drop 'struct an8855_phy_bus', the
'phy_bus_infos' array, and all of the manual fwnode_handle_get() /
fwnode_handle_put() error-unwinding.

Or, better yet, move all of this phy stuff out of MFD, which shouldn't
have to know all of this stuff.

> +		phy_bus_infos[i].node = NULL;
> +
> +		if (ret)
> +			goto err_put_fwnodes;
> +	}
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, an8855_cells,
> +				    ARRAY_SIZE(an8855_cells), NULL, 0,
> +				    NULL);
> +
> +err_put_fwnodes:
> +	for (i = 0; i < num_phys; i++)

'phy' and 'for (int phy = 0; ...'

> +		if (phy_bus_infos[i].node)
> +			fwnode_handle_put(phy_bus_infos[i].node);
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id an8855_of_match[] = {
> +	{ .compatible = "airoha,an8855" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, an8855_of_match);
> +
> +static struct mdio_driver an8855_driver = {

So this isn't a platform driver?

Not sure how we feel about splitting an mdio driver into various
platform drivers?

> +	.probe = an8855_probe,
> +	.mdiodrv.driver = {
> +		.name = "an8855",
> +		.of_match_table = an8855_of_match,
> +	},
> +};
> +mdio_module_driver(an8855_driver);
> +
> +MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
> +MODULE_DESCRIPTION("Driver for Airoha AN8855");
> +MODULE_LICENSE("GPL");
> -- 
> 2.55.0
>

-- 
Lee Jones
