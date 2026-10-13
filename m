Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A683B51AFCC;
	Tue, 13 Oct 2026 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898145; cv=pass; b=mE/7Zsd3A8culobR7cawg6QpV965rGufhHS10ry5X9l1smRceZdx4xTwJ+2bvPTB6U2adEJp/6AysaTxH1SVzKhKwpIBZUaLQW1MwKTEuNbRt+b66D2oNaywGjh7RugO/bEeDG742zBsqfKRSCUl5MkaHn1pQlA2wA1BUlfj65E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898145; c=relaxed/simple;
	bh=HgeWzOuzFXqzUPRdgwH5eq3Hxzu84lTghOHMqvbrW04=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ei2L6JPFyBxNwLE5aH+iKAEQSTZuvF2my069oO+wjAEqaLQEY70z1+7RzlGbXUqf09rSrkvyw4yI19p+ABYQgG8hgZsgvS8pLl635o2OgMLeHpnue+gJTXtZmlqYf23yO6n57PlTLPWMyMNxBXZahQFHh4kCJe0K9ZCR51wTBJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=EUC6AymI; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="EUC6AymI"
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D8CDF200467;
	Tue, 13 Oct 2026 15:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791898139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ydj8XrkV8pn3E6IDDtcYNd5WmTRr7010/GQYvG2rFVE=;
	b=EUC6AymI9WAdqt5yKmUYSB4BVMQp4+kXGrBBSi4Ib65DlPGcc0okC5yxqFmBxrJlqxzSVM
	1eAdix9bSApV9k9iNZjC53utDdzHV3r0LfCOAjIJR2rKK9qFZmU9D+ToJzHVGLfXsF0x3t
	XB4//H+GJURsRDUPwP7etE9ZT83N5vCAa53lhT72VNSYFOsMB8ZvEHwUK2yoQbVGhQGLBB
	9Wm1FzLIXmmEv8TNp94XrZzPBdXhGyIDrkbI8yjd479JU2nuSg4RNtnmvYqp+CWmPID+7E
	DGaURgjiIUbgAKvH/azeJ7P7r8Vdg87rfQj9CC5qDGGninuNMGUBvgsPUHbi+g==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791898139; a=rsa-sha256;
	cv=none;
	b=R1/SkAWFPUt5MGpbuTkbYOTVGxB9czq1tvpG5fTDU9UyPOtWr9AtOnVgffp/DbJq3pVHX3
	TbqRHD6IW+yn1UeE4zIQ7pm/qE8cSF8DoeHSVkcRg7FxaXM9X1t6+bndmlNEfdVc+WJD1M
	975xGG9VV+WA2L0SeFm7Yspyol3DpYCnx5gXgThsh7bMaaaEl4DkahmCrjD5/Zmi/eYP/0
	scBAIuw4KHIYwtnSlf2VOYXsl4F2b7ZBMnNRq0w2Vq3MgfoP37/ABtYl8/BRfSN6qasVpc
	hHFcXXT2vxZ/CU5FpaYveuJj3By+BRUm7a1pQFqlD1Pfu3eylHSz1I842ofSWQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791898139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ydj8XrkV8pn3E6IDDtcYNd5WmTRr7010/GQYvG2rFVE=;
	b=I/Wnu0VgI0ocU7f/iY7Oj1VhpaAIWACG+KkicBxINMgPfTZ0YhwewmsWpyeP0Yov/5M+0E
	3CaOs/cYoJuLwrqqAVoXIyvhVQc5UqQGNESpcbedDZYHvmHantUjIWdD4W9gSSbf/hWexP
	LtU+A3eZe/f84HxrClYzyYmHdBkKGxGCZ/YL3EafKZhLG8eeYWoO5cx6oe8FtgotecG7FD
	oVflauArdWKJy8DUn+RIoyxkFYmElUavTqlqa+/BUZHQsPb11iCOp+NkRgK6+2RpTf4PLr
	EQM/NSLD7wsjp6737NRv8Zpq07512qnx76CYtse/qe0DxGaCD3Kuvt71Yi5WIQ==
Message-ID: <c57e9716fb11e57beb95e81c6a896f6b63970fe4.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: toshiba: introduce a TC9564 SoC reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org
Cc: mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com, 
	danielt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  Daniel Thompson <daniel@riscstar.com>
Date: Tue, 13 Oct 2026 15:28:59 +0200
In-Reply-To: <20261012164354.3872326-3-elder@riscstar.com>
References: <20261012164354.3872326-1-elder@riscstar.com>
	 <20261012164354.3872326-3-elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mo, 2026-10-12 at 11:43 -0500, Alex Elder wrote:
> Define a new platform driver that manages reset signals implemented by
> the Toshiba TC9564 SoC.  There are 13 reset signals available, although
> only 11 can be controlled.
>=20
> Two registers manage the state of the resets.  The registers are
> accessed via a regmap supplied by a system controller, because the
> region of memory accessed is shared with other drivers.
>=20
> Access to the memory region is provided via a BAR on a PCIe endpoint
> function embedded in the TC9564 SoC.  For that reason the PCIe reset
> cannot be manipulated by this driver (it is assumed to be deasserted).
> Similarly, control is not available for the I2C reset, because the
> PCIe subsystem on the TC9564 relies on I2C.
>=20
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  MAINTAINERS                  |   1 +
>  drivers/reset/Kconfig        |  12 +++
>  drivers/reset/Makefile       |   1 +
>  drivers/reset/reset-tc9564.c | 192 +++++++++++++++++++++++++++++++++++
>  4 files changed, 206 insertions(+)
>  create mode 100644 drivers/reset/reset-tc9564.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d0eb44079fe17..a8f4982ed1a43 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -28185,6 +28185,7 @@ M:	Alex Elder <elder@kernel.org>
>  M:	Daniel Thompson <danielt@kernel.org>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/reset/toshiba,tc9564-reset.yaml
> +F:	drivers/reset/reset-tc9564.c
>  F:	include/dt-bindings/reset/toshiba,tc9564.h
> =20
>  TOSHIBA WMI HOTKEYS DRIVER
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index eda9c698a95f3..b40736368894c 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -358,6 +358,18 @@ config RESET_SUNXI
>  	help
>  	  This enables the reset driver for Allwinner SoCs.
> =20
> +config RESET_TC9564
> +	tristate "Toshiba TC9564 reset support"
> +	depends on TC9564_PCI
> +	select MFD_SYSCON
> +	default TC9564_PCI
> +	help
> +	  This enables support for the reset controller embedded in the
> +	  Toshiba TC9564 SoC.  The state of reset lines is controlled
> +	  via MMIO to a region managed by a system controller; this
> +	  ensures access to the region is coordinated between this and
> +	  the clock and XGMAC (stmmac) drivers.
> +
>  config RESET_TENSTORRENT_ATLANTIS
>  	tristate "Tenstorrent atlantis reset driver"
>  	depends on ARCH_TENSTORRENT || COMPILE_TEST
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 489fafd6bbe3f..6ddded26309ef 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_RESET_SKY1_AUDSS) +=3D reset-sky1-audss.o
>  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o
>  obj-$(CONFIG_RESET_SUNPLUS) +=3D reset-sunplus.o
>  obj-$(CONFIG_RESET_SUNXI) +=3D reset-sunxi.o
> +obj-$(CONFIG_RESET_TC9564) +=3D reset-tc9564.o
>  obj-$(CONFIG_RESET_TENSTORRENT_ATLANTIS) +=3D reset-tenstorrent-atlantis=
.o
>  obj-$(CONFIG_RESET_TH1520) +=3D reset-th1520.o
>  obj-$(CONFIG_RESET_TI_SCI) +=3D reset-ti-sci.o
> diff --git a/drivers/reset/reset-tc9564.c b/drivers/reset/reset-tc9564.c
> new file mode 100644
> index 0000000000000..0243c2e0efd54
> --- /dev/null
> +++ b/drivers/reset/reset-tc9564.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights res=
erved.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/device-id/of.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/reset/toshiba,tc9564.h>
> +
> +#define RST_CTRL0_OFFSET	0x1008
> +#define RST_CTRL1_OFFSET	0x1010
> +
> +struct tc9564_reset {
> +	u32 offset;		/* RST_CTRL0_OFFSET or RST_CTRL1_OFFSET */
> +	u32 mask;		/* Zero means undefined reset */
> +};
> +
> +struct tc9564_resets {
> +	struct regmap *regmap;
> +	struct reset_controller_dev rcdev;
> +};
> +
> +#define TC9564_RESET_INIT0(_name, _bit)	__TC9564_RESET_INIT(_name, 0, _b=
it)
> +#define TC9564_RESET_INIT1(_name, _bit)	__TC9564_RESET_INIT(_name, 1, _b=
it)
> +
> +#define __TC9564_RESET_INIT(_name, _reg, _bit)		\
> +	[RESET_##_name] =3D {				\
> +		.offset	=3D RST_CTRL ## _reg ## _OFFSET,	\
> +		.mask =3D BIT(_bit),			\
> +	}
> +
> +/*
> + * The PCIe and I2C resets are controllable, but we depend on PCIe
> + * and that relies on I2C, so we don't allow them to be asserted.
> + */
> +static const struct tc9564_reset tc9564_reset[] =3D {
> +	TC9564_RESET_INIT0(MCU, 0),
> +	TC9564_RESET_INIT0(MCU1, 1),
> +	TC9564_RESET_INIT0(INTC, 4),
> +	/* TC9564_RESET_INIT0(PCIE, 9), */
> +	/* TC9564_RESET_INIT0(I2C, 12), */
> +	TC9564_RESET_INIT0(UART, 16),
> +	TC9564_RESET_INIT0(MSIGEN, 18),
> +
> +	TC9564_RESET_INIT0(MAC0_MAC, 7),
> +	TC9564_RESET_INIT0(MAC0_PMA, 30),
> +	TC9564_RESET_INIT0(MAC0_XPCS, 31),
> +
> +	TC9564_RESET_INIT1(MAC1_MAC, 7),
> +	TC9564_RESET_INIT1(MAC1_PMA, 30),
> +	TC9564_RESET_INIT1(MAC1_XPCS, 31),
> +};
> +#define TC9564_RESET_COUNT	ARRAY_SIZE(tc9564_reset)
> +
> +static const struct tc9564_resets *
> +rcdev_to_tc9564_resets(struct reset_controller_dev *rcdev)
> +{
> +	return container_of_const(rcdev, struct tc9564_resets, rcdev);
> +}
> +
> +static int tc9564_reset_manage(struct reset_controller_dev *rcdev,
> +			       unsigned long id, bool assert)
> +{
> +	const struct tc9564_resets *resets =3D rcdev_to_tc9564_resets(rcdev);
> +
> +	if (id < rcdev->nr_resets) {

This check is superfluous.

fwnode_reset_simple_xlate() already checked this before a reset control
was even created.

> +		const struct tc9564_reset *reset =3D &tc9564_reset[id];
> +		u32 mask =3D reset->mask;
> +
> +		if (mask)

This check is superfluous, as every element in the tc9564_reset array
has mask set.

> +			return regmap_update_bits(resets->regmap,
> +						  reset->offset, mask,
> +						  assert ? mask : 0);
> +	}
> +
> +	dev_err(rcdev->dev, "invalid reset (%s id %lu)\n",
> +		assert ? "assert" : "deassert", id);
> +
> +	return -ENXIO;

This branch is never taken.

> +}
> +
[...]
> +static struct tc9564_resets *tc9564_reset_init(struct device *dev)
> +{
> +	struct reset_controller_dev *rcdev;
> +	struct tc9564_resets *resets;
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap =3D syscon_node_to_regmap(dev_of_node(dev->parent));
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "failed to get config regmap\n");
> +		return ERR_CAST(regmap);
> +	}
> +
> +	resets =3D devm_kzalloc(dev, sizeof(*resets), GFP_KERNEL);
> +	if (!resets)
> +		return ERR_PTR(-ENOMEM);
> +	resets->regmap =3D regmap;
> +
> +	rcdev =3D &resets->rcdev;
> +	rcdev->ops =3D &tc9564_reset_control_ops;
> +	rcdev->owner =3D THIS_MODULE;
> +	rcdev->dev =3D dev;
> +	rcdev->of_node =3D dev_of_node(dev);
> +	rcdev->nr_resets =3D TC9564_RESET_COUNT;
> +
> +	ret =3D devm_reset_controller_register(dev, rcdev);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return resets;
> +}
> +
> +static int tc9564_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct tc9564_resets *resets;
> +
> +	if (!dev_of_node(dev))
> +		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
> +
> +	resets =3D tc9564_reset_init(dev);
> +	if (IS_ERR(resets))
> +		return dev_err_probe(dev, PTR_ERR(resets),
> +				     "failed to initialize resets\n");
> +
> +	/* Force all resets to be initially asserted */
> +	tc9564_reset_assert_all(resets);
> +
> +	platform_set_drvdata(pdev, resets);
> +
> +	return 0;
> +}
> +
> +static void tc9564_reset_remove(struct platform_device *pdev)
> +{
> +	struct tc9564_resets *resets =3D platform_get_drvdata(pdev);
> +
> +	/* Leave all resets asserted when done */
> +	tc9564_reset_assert_all(resets);

Should this be done by the individual drivers?
What happens if the reset controller driver is unbound while e.g. one
of the MACs is active?

regards
Philipp
