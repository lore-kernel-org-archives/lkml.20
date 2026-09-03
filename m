Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB96481257;
	Thu,  3 Sep 2026 10:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430579; cv=none; b=gjJpPjRw646B511wMjXcFYGtK3o7MW/Hr9b2OjG/m25ks79kvmj0/4YZdJWG2/Y6MDm04zLAP1O0+/JZXXg0pEjseXGnN095yvseRmHquGRANXoAg8aHrqOaIQr2tEjmxd37D9kOIeYbYb5q9KsyuysQ386ujX77um87USHuwFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430579; c=relaxed/simple;
	bh=R+xKDK2nTnMwARl8glz7InHfn/eZY4VyUjeJ/bHhdr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YovVenXxOwQu7EJOT8Hi2KpNq6x8nG2GdEHtcX1aB5HZlr4liCKZPBhCtnM/YRBCBZwrOt+4/2ykpzl4AkQQ2FDG0QyAdNlViBUu7c2op3lMnAX2zFvZvDFsU8WCapcdUBn4W9+vutbzcUUBPp0t3J79WEdS0Qu+6Pi9g5SM7es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CU8QQD8U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CU8QQD8U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25051F00A3A;
	Thu,  3 Sep 2026 10:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788430562;
	bh=J+hHCoeCaNrFNAaS98mS3DbEz4agR3WizErmXjfn3jg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CU8QQD8UMQrrFMjNLbg7A1pr9E84x6mDUWy27MaJwjULD5tm0cXLa96RBBtUKykUs
	 KUsSHj05V2V0RGg9VLN0WLxoYZZ9F7kTCM6nPvM2K39RhYgpvtOjlVT7aPAbEh3LTw
	 YPPOpIoyFI+ugytlZOU4Ti9B7kS8DPBGC5kQoGkcEsceRUx+eZpNG0z10sMwsrfbjR
	 eNR8JhhV/lbA5FSjN/CuTCuUgi21B7o9+5aj24ISK7Sx2vAe/1eZLAYEFrSP73gGkJ
	 spSa3CqVNgwAsO+B05SBZhehzsZHorTvFI8x3efx8yjn8ryBow3PgVPjTas6g3/ZAg
	 KMMQ3ptHS7ZYQ==
Date: Thu, 3 Sep 2026 12:15:43 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-phy@lists.infradead.org, Thanh Quan <thanh.quan.xn@renesas.com>, 
	Phong Hoang <phong.hoang.wz@renesas.com>, Hai Pham <hai.pham.ud@renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Arnd Bergmann <arnd@arndb.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Tam Nguyen <tam.nguyen.xa@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Vinh Nguyen <vinh.nguyen.xz@renesas.com>, 
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: renesas: Add Renesas Multi-Protocol PHY driver
 for R-Car X5H
Message-ID: <c2rlwdyn2xm3tti7skniz3uldwh4lly4jlqdmggqjm2a2xpyxq@nczmbl7tyqa7>
References: <20260828192223.402422-1-marek.vasut+renesas@mailbox.org>
 <20260828192223.402422-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828192223.402422-2-marek.vasut+renesas@mailbox.org>

On Fri, Aug 28, 2026 at 09:21:40PM +0200, Marek Vasut wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> Add Renesas Multi-Protocol PHY driver for R-Car X5H (R8A78000) SoC.
> 
> This is a multiplexing PHY block with inputs from five IPs, and outputs
> to four separate IO blocks. The five inputs are two PCIe4, two USB 3.2,
> and ethernet PCS, each connected into the PHY with up to 4 times 2 lanes.
> The inputs can be multiplexed to the four IO blocks as needed.
> 
> The datasheet describes initialization procedure without many information
> about registers' name/bits. So, this driver does contain a bit of magic
> to initialize the hardware.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Co-developed-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Co-developed-by: Hai Pham <hai.pham.ud@renesas.com>
> Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Hai Pham <hai.pham.ud@renesas.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Phong Hoang <phong.hoang.wz@renesas.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tam Nguyen <tam.nguyen.xa@renesas.com>
> Cc: Thanh Quan <thanh.quan.xn@renesas.com>
> Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Cc: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/phy/renesas/Kconfig               |   7 +
>  drivers/phy/renesas/Makefile              |   1 +
>  drivers/phy/renesas/phy-rcar-gen5-mpphy.c | 757 ++++++++++++++++++++++
>  3 files changed, 765 insertions(+)
>  create mode 100644 drivers/phy/renesas/phy-rcar-gen5-mpphy.c
> 
> diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> index 90a9ca2db7fc7..ac903b29cacbc 100644
> --- a/drivers/phy/renesas/Kconfig
> +++ b/drivers/phy/renesas/Kconfig
> @@ -43,6 +43,13 @@ config PHY_RCAR_GEN3_USB3
>  	help
>  	  Support for USB 3.0 PHY found on Renesas R-Car generation 3 SoCs.
>  
> +config PHY_RCAR_GEN5_MPPHY
> +	tristate "Renesas R-Car generation 5 Multi-Protocol PHY driver"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	select GENERIC_PHY
> +	help
> +	  Support for Multi-Protocol PHY found on Renesas R-Car generation 5 SoCs.
> +
>  config PHY_RZ_G3E_USB3
>  	tristate "Renesas RZ/G3E USB 3.0 PHY driver"
>  	depends on ARCH_RENESAS || COMPILE_TEST
> diff --git a/drivers/phy/renesas/Makefile b/drivers/phy/renesas/Makefile
> index 0e98083f2f0c8..23d413cfa8ce0 100644
> --- a/drivers/phy/renesas/Makefile
> +++ b/drivers/phy/renesas/Makefile
> @@ -4,4 +4,5 @@ obj-$(CONFIG_PHY_RCAR_GEN2)		+= phy-rcar-gen2.o
>  obj-$(CONFIG_PHY_RCAR_GEN3_PCIE)	+= phy-rcar-gen3-pcie.o
>  obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+= phy-rcar-gen3-usb2.o
>  obj-$(CONFIG_PHY_RCAR_GEN3_USB3)	+= phy-rcar-gen3-usb3.o
> +obj-$(CONFIG_PHY_RCAR_GEN5_MPPHY)	+= phy-rcar-gen5-mpphy.o
>  obj-$(CONFIG_PHY_RZ_G3E_USB3)		+= phy-rzg3e-usb3.o
> diff --git a/drivers/phy/renesas/phy-rcar-gen5-mpphy.c b/drivers/phy/renesas/phy-rcar-gen5-mpphy.c
> new file mode 100644
> index 0000000000000..31f17a4955e8e
> --- /dev/null
> +++ b/drivers/phy/renesas/phy-rcar-gen5-mpphy.c
> @@ -0,0 +1,757 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Renesas Multi-Protocol PHY device driver
> + *
> + * Copyright (C) 2025-2026 Renesas Electronics Corporation
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/firmware.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/types.h>
> +
> +#include <dt-bindings/phy/phy.h>
> +
> +#define MPPHY_NUM_CHANNELS		4
> +
> +/* Common registers */
> +#define MPPHY_CMNCNT1			0x80000
> +#define MPPHY_CMNCNT2			0x80004
> +
> +/* Channel register base and offsets */
> +#define MPPHY_CHAN_BASE(ch)		(0x81000 + (ch) * 0x1000)
> +#define MPPHY_PXCNTXT1(ch)		(MPPHY_CHAN_BASE(ch) + 0x4)
> +#define MPPHY_PXCNTXT2(ch)		(MPPHY_CHAN_BASE(ch) + 0x8)
> +#define MPPHY_PXTEST(ch)		(MPPHY_CHAN_BASE(ch) + 0xc)
> +#define MPPHY_PXREFCLK(ch)		(MPPHY_CHAN_BASE(ch) + 0x14)
> +#define MPPHY_PXRXREQ1(ch)		(MPPHY_CHAN_BASE(ch) + 0x24)
> +#define MPPHY_PXRXCNT(ch)		(MPPHY_CHAN_BASE(ch) + 0x38)
> +#define MPPHY_PXSRAMCNT(ch)		(MPPHY_CHAN_BASE(ch) + 0x40)
> +#define MPPHY_PXTXREQ(ch)		(MPPHY_CHAN_BASE(ch) + 0x44)
> +
> +#define MPPHY_PCS0REG1			0x85000
> +#define MPPHY_PCS0REG5			0x85010
> +
> +/* TCA (Type-C Adapter) Register Offsets within MP-PHY base */
> +#define TCA_OFFSET(ch)			(0x90000 + (((ch) & 1) ? 0x10000 : 0))
> +#define TCA_VBUS_CTRL			0x40
> +
> +/* PCS0REG1 register bits */
> +#define MPPHY_PCS0REG1_VAL		BIT(16)
> +
> +/* PXTEST register bit */
> +#define MPPHY_PXTEST_BIT		BIT(0)
> +
> +/* PXRXCNT register reset value */
> +#define MPPHY_PXRXCNT_RESET_VAL		0x202
> +
> +/* PXSRAMCNT register bits */
> +#define SRAM_EXT_LD_DONE		0x10
> +
> +/* PXREFCLK register value */
> +#define MPPHY_PXREFCLK_VAL_ETH		0x55
> +
> +/* Firmware update */
> +#define MPPHY_FW_BASE			0x10000
> +#define MPPHY_FW_CH_OFFSET		0x20000
> +#define MPPHY_FW_NAME			"rcar_gen5_mp_phy.bin"

Is this firmware redistributable? I would assume not as like other Renesas IP
firmware. If so, you should add a documentation about how an user can get the
firmware, and package it. Like,
Documentation/PCI/controller/rcar-pcie-firmware.rst

> +
> +struct mp_phy_chan_priv {
> +	struct phy *phy;
> +	enum phy_mode protocol_id;
> +	bool initialized;
> +};
> +

[...]

> +static int mp_phy_init(struct phy *phy)
> +{
> +	struct mp_phy_priv *priv = phy_get_drvdata(phy);
> +	struct mp_phy_chan_priv *chan = &priv->chan[phy->id];
> +	int ret;
> +
> +	/*
> +	 * Note: Current source code support for Ethernet, PCIe
> +	 * initialization is based on the bare metal code shared
> +	 * by the board team.
> +	 */

Nit: Make use of 80 column for comments

> +	ret = pm_runtime_get_sync(priv->pd_list->pd_devs[phy->id]);
> +	if (ret < 0) {
> +		dev_err(priv->dev,
> +			"Failed to power on domain for channel %d: %d\n",
> +			phy->id, ret);
> +		return ret;
> +	}
> +
> +	/* Check if initialized with same protocol then skip */
> +	if (chan->initialized)

Comment indicates that the check is supposed to check the protocol, but the code
is not doing it.

> +		return 0;
> +
> +	if (chan->protocol_id == PHY_MODE_PCIE)
> +		ret = mp_phy_init_pcie4(phy);
> +	else if (chan->protocol_id == PHY_MODE_ETHERNET)
> +		ret = mp_phy_init_ethernet(phy);
> +	else
> +		ret = mp_phy_init_usb(phy);
> +	if (ret)
> +		return ret;
> +
> +	chan->initialized = true;
> +	dev_dbg(priv->dev,
> +		"Channel %d successfully initialized for protocol %d\n",
> +		phy->id, chan->protocol_id);
> +
> +	return 0;
> +}
> +

[...]

> +static int mp_phy_probe(struct platform_device *pdev)
> +{
> +	static const char *const pd_names[] = { "mpp0", "mpp1", "mpp2", "mpp3" };
> +	const struct dev_pm_domain_attach_data pd_attach_data = {
> +		.pd_names = pd_names,
> +		.num_pd_names = ARRAY_SIZE(pd_names),
> +		.pd_flags = 0,
> +	};
> +	struct device *dev = &pdev->dev;
> +	struct phy_provider *provider;
> +	struct mp_phy_priv *priv;
> +	int i, ret;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +
> +	ret = mp_phy_parse_dt(pdev, priv);
> +	if (ret)
> +		return ret;
> +
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return dev_err_probe(dev, PTR_ERR(priv->base), "Failed to map PHY registers\n");
> +
> +	priv->map = devm_regmap_init_mmio(dev, priv->base, &mp_phy_regmap_config);
> +	if (IS_ERR(priv->map))
> +		return PTR_ERR(priv->map);
> +
> +	priv->num_clks = devm_clk_bulk_get_all(dev, &priv->clks);
> +	if (priv->num_clks < 0)
> +		return dev_err_probe(dev, priv->num_clks, "Failed to get PHY clocks\n");
> +	if (priv->num_clks != 5)
> +		return dev_err_probe(dev, -ENODEV, "Failed to get all PHY clocks\n");

devm_clk_bulk_get_all() will fail if any of the clocks cannot be acquired. So I
don't see a need to check for clock count.

> +
> +	/*
> +	 * The reset ID order here does matters, reset_control_bulk_assert()
> +	 * asserts these resets in this order, with mpphy02 reset being
> +	 * asserted first, reset_control_bulk_deassert() deasserts these
> +	 * resets in reverse order, with mpphy02 being reset being
> +	 * deasserted last. This is the behavior the hardware expects.
> +	 */
> +	priv->resets[0].id = "mpphy02";
> +	priv->resets[1].id = "mpphy01";
> +	priv->resets[2].id = "mpphy11";
> +	priv->resets[3].id = "mpphy21";
> +	priv->resets[4].id = "mpphy31";
> +	ret = devm_reset_control_bulk_get_exclusive(&pdev->dev, ARRAY_SIZE(priv->resets),
> +						    priv->resets);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get PHY resets\n");
> +
> +	platform_set_drvdata(pdev, priv);
> +
> +	ret = dev_pm_domain_attach_list(dev, &pd_attach_data, &priv->pd_list);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to attach power domains\n");
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable PHY runtime PM\n");
> +
> +	provider = devm_of_phy_provider_register(dev, mp_phy_xlate);
> +	if (IS_ERR(provider))
> +		return dev_err_probe(dev, PTR_ERR(provider), "Failed to register PHY provider\n");
> +
> +	for (i = 0; i < MPPHY_NUM_CHANNELS; i++) {
> +		priv->chan[i].phy = devm_phy_create(dev, NULL, &mp_phy_ops);
> +		if (IS_ERR(priv->chan[i].phy)) {
> +			return dev_err_probe(dev, PTR_ERR(priv->chan[i].phy),
> +					     "Failed to create PHY %d\n", i);
> +		}
> +
> +		priv->chan[i].phy->id = i;
> +		phy_set_drvdata(priv->chan[i].phy, priv);
> +	}
> +
> +	return pm_runtime_resume_and_get(dev);

Since the runtime usage count is incremented and not dropped anywhere else, the
driver will never runtime suspend.

> +}
> +
> +static void mp_phy_remove(struct platform_device *pdev)
> +{
> +	struct mp_phy_priv *priv = dev_get_drvdata(&pdev->dev);
> +	struct device *dev = &pdev->dev;
> +
> +	pm_runtime_put(dev);
> +
> +	dev_pm_domain_detach_list(priv->pd_list);
> +
> +	pm_runtime_disable(&pdev->dev);
> +
> +	if (priv->fw)
> +		release_firmware(priv->fw);
> +
> +	platform_set_drvdata(pdev, NULL);
> +}
> +
> +static int mp_phy_suspend(struct device *dev)
> +{
> +	struct mp_phy_priv *priv = dev_get_drvdata(dev);
> +	int i;
> +
> +	for (i = 0; i < MPPHY_NUM_CHANNELS; i++)
> +		priv->chan[i].initialized = false;
> +
> +	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
> +
> +	dev_info(dev, "Multi-Protocol PHY suspended\n");

Please avoid spamming the log.

I'm wondering how you managed to test runtime PM with
pm_runtime_resume_and_get() above.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
