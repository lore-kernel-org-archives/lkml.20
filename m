Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793448813;
	b=XGqC0ibOL8M3jYrcARTmqQ5LUBmmIllSXft8tvEVboo3BMBaDaTtELt1oi57kgd4DGpr
	 yxtsobAX2kJk/0Nv7VfBIilsO8eB8RujOBn4RvIvMlu6A1ccBfqZKkMn7R5U+U2jf8x8I
	 yqjPLNsSO8rZFWf3V3panYf2q2/XCo6v7KdBJXm5tNR3bChtzeruDUzybWHf95ruY1o0N
	 +D5lfzv6YAmRJXJcRAWU9aG0HKW2lXrj0VqAP2h3DLnrtetun99xEu2/BBFqSsTmqXHIl
	 /AZu5fZ0SUYiW5lG/70isYF48Coe7eNlb04eCdx/KL0ZmZw0U4okLExPV1A09lj83zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793448813;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PJd/nptdnC1n5bUkePO/xl7mlQ8XownhXVpCQRExh0U=;
	b=z4RhY3IKp1LJ118aQ2nWBeY6bgIDbdrpxanEnzi36TiJhO9sC8oiOvInliEQULfIUhc1
	 MsIOLoRO/hBeUf+vW+AGUjegFwPb4FLTn3ghpKSJb6Yk/NGweKsbyTYjNZ02uqiZ317mz
	 NiShUIf23dvKJetG+TxgO2SfSP5FZbYVFHNTuWT3XytZPn27mHtTbLb+czmOrHTTlncLc
	 RzXTN+LuV2zjCO8zh+aZhPXz0zkErMZDnmJEX1VtHm8uNxWxFUtPNmLhvHh3a1/N0w4BK
	 pYf72dyoaep26HgV7gqgAylx0HCIIGbeN+mA89r8M0A9OXpqF2AycXCWub5X59lFVqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXbPWG3P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499AE606A31C;
	Sat, 31 Oct 2026 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FXbPWG3P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2511F00A02;
	Sat, 31 Oct 2026 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793448812;
	bh=PJd/nptdnC1n5bUkePO/xl7mlQ8XownhXVpCQRExh0U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=FXbPWG3PToGgxptpFnojITlre50TZXpXDLBX+NT4iMla4bSOz5galxm8v5qdpA26h
	 CCQ7t20EsGWoDSg5NgTYXfhwNJWQVfm6zSsLjtO5spPXTX1iBn45jzsQJxnhu6nBq+
	 qvPrcJUOHBNcch1rV6CW961oPFsDni+TtxfMcCgvhzlpdVVo0AdmcOol63RZxusY2c
	 VEvQdsw9opJbNVXCTzX/b+ow9cBHba9frY4Z9KwSWgn+RtyWJYHT4hAOBxkMm6nDDW
	 tot/gRYIC8+J44v2m4UfHXxzjdic89RLwEPhAqivKRsV7XY/uhURxenMV/yYyNdmr4
	 fuU5HWdvtpzxQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/2] phy: add a driver for T-Head TH1520 USB PHY
From: Manivannan Sadhasivam <mani@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <dfustini@tenstorrent.com>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
In-Reply-To: <20261009090444.3319517-3-zhengxingda@iscas.ac.cn>
References: <20261009090444.3319517-1-zhengxingda@iscas.ac.cn>
 <20261009090444.3319517-3-zhengxingda@iscas.ac.cn>
Date: Sat, 31 Oct 2026 17:43:00 +0530
Message-Id: <179344878055.5901.6127263477546911730.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8331; i=mani@kernel.org;
 h=from:subject:message-id; bh=dId6tLZSjtbmcyoI3RlGhmmOJqb+GkYVdFxndwegmJU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5dtbWWVyN85bSTsl8lATWrpjOwJm1s8rYWEPt
 vlgZcQAVqqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauXbWwAKCRBVnxHm/pHO
 9WOyB/9hAjdmWUSwLj1dOBWKc8cCMv4RiTQJItriqmItKTyp0heV2M7Bw4ucM0e2PqCgmxy+Xjj
 tIriEvjTRSI/0WyQGW3eEfEK1vNPLbFhIlGYsYBZL1ri6DKyQbaGZSEwpgJZVx9bN3OAhOgujbf
 vw9T13gv4O050TRLr2jPx7uUsqO9Jpr/6tPYSGZbLlnj+aJMzf2IHUEL0eUlB2CCPIsOwM5B5Zn
 q9v+7J4wP5uIY1U2wtsr481rlxKasTfuMMszYnsppLJQ/Qm6LBWUt5R+wv//6rn14uLZO08wLFd
 b7c5NjW4fGI9qt3cWZ2WTz13K4J2utZx8XGrMh+KQGykj8Gd
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-09 17:04 +0800, Icenowy Zheng wrote:
> The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY, with
> some PHY parameters exported as another system controller along with it.
> 
> A few PHY parameters have unusable defaults. Add a driver that programs
> them before releasing the PHY from reset in addition to
> clock/reset/regulator management.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> Changes in v3:
> - Use fsleep() to replace udelay(), and add proper inclusion of
>   linux/delay.h for this function. (fsleep() suggested by Drew and
>   inclusion suggested by Sashiko)
> - Adapt Drew's suggestion on the wording of the commit message's 2nd
>   paragraph.
> Changes in v2:
> - Removed unreferenced register names.
> - Changed the behavior to leaving bus clock on instead of binding it to
>   the regmap.
> - Removed early return for reset deassert failure in phy exit callback.
> - Tweaked the Kconfig item (removed default value and added "select
>   REGMAP_MMIO).
> 
>  drivers/phy/Kconfig                |   1 +
>  drivers/phy/Makefile               |   1 +
>  drivers/phy/thead/Kconfig          |  12 ++
>  drivers/phy/thead/Makefile         |   2 +
>  drivers/phy/thead/phy-th1520-usb.c | 181 +++++++++++++++++++++++++++++
>  5 files changed, 197 insertions(+)
>  create mode 100644 drivers/phy/thead/Kconfig
>  create mode 100644 drivers/phy/thead/Makefile
>  create mode 100644 drivers/phy/thead/phy-th1520-usb.c
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 19f3b7d12b7d4..a05019020ee09 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -200,6 +200,7 @@ source "drivers/phy/st/Kconfig"
>  source "drivers/phy/starfive/Kconfig"
>  source "drivers/phy/sunplus/Kconfig"
>  source "drivers/phy/tegra/Kconfig"
> +source "drivers/phy/thead/Kconfig"
>  source "drivers/phy/ti/Kconfig"
>  source "drivers/phy/xilinx/Kconfig"
>  
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index d7aa516bcc49e..0ac5b21477619 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -52,5 +52,6 @@ obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
>  					   starfive/	\
>  					   sunplus/	\
>  					   tegra/	\
> +					   thead/	\
>  					   ti/		\
>  					   xilinx/
> diff --git a/drivers/phy/thead/Kconfig b/drivers/phy/thead/Kconfig
> new file mode 100644
> index 0000000000000..ba0ceac54c1b0
> --- /dev/null
> +++ b/drivers/phy/thead/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config PHY_TH1520_USB

Can you name this PHY driver based on some family or means other than SoC name?
Naming the driver per SoC usually ends up confusing as more SoCs will end up
reusing them.

> +	tristate "USB PHY driver for T-Head TH1520 SoC"
> +	depends on ARCH_THEAD || COMPILE_TEST
> +	depends on COMMON_CLK
> +	depends on HAS_IOMEM
> +	depends on OF
> +	depends on RESET_CONTROLLER
> +	select GENERIC_PHY
> +	select REGMAP_MMIO
> +	help
> +	  Enable support for the USB PHY on the T-Head TH1520 SoC.
> diff --git a/drivers/phy/thead/Makefile b/drivers/phy/thead/Makefile
> new file mode 100644
> index 0000000000000..5b459bc7004bd
> --- /dev/null
> +++ b/drivers/phy/thead/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_TH1520_USB) += phy-th1520-usb.o
> diff --git a/drivers/phy/thead/phy-th1520-usb.c b/drivers/phy/thead/phy-th1520-usb.c
> new file mode 100644
> index 0000000000000..6cb0e51401374
> --- /dev/null
> +++ b/drivers/phy/thead/phy-th1520-usb.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Institute of Software, Chinese Academy of Sciences (ISCAS)
> + *
> + * Authors:
> + * Icenowy Zheng <zhengxingda@iscas.ac.cn>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +
> +#define USB_SYSCON_OFFSET		0xf000
> +
> +/* All the below registers are in the USB syscon region */
> +#define USB_SSP_EN			0x34
> +#define USB_SSP_EN_REF_SSP_EN		BIT(0)
> +
> +#define USB_SYS				0x3c
> +#define USB_SYS_COMMONONN		BIT(0)
> +
> +/* The last register according to the manual */
> +#define USB_TEST_REG3			0x5c
> +
> +struct th1520_usb_phy {
> +	struct platform_device *pdev;
> +	struct phy *phy;
> +	struct regmap *regmap;
> +	struct clk *ref_clk;
> +	struct reset_control *phy_reset;
> +};
> +
> +static int th1520_usb_phy_init(struct phy *phy)
> +{
> +	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = clk_prepare_enable(th1520_phy->ref_clk);
> +	if (ret)
> +		return ret;
> +
> +	ret = reset_control_assert(th1520_phy->phy_reset);
> +	if (ret)
> +		goto err_disable_clk;
> +
> +	/*
> +	 * Do some initial PHY setup:
> +	 * - Set COMMONONN to allow the PHY to automatically power down.
> +	 * - Set REF_SSP_EN to enable feeding reference clock to SuperSpeed
> +	 *   PHY clock PLL.
> +	 */
> +	regmap_set_bits(th1520_phy->regmap, USB_SYS, USB_SYS_COMMONONN);
> +	regmap_set_bits(th1520_phy->regmap, USB_SSP_EN, USB_SSP_EN_REF_SSP_EN);
> +
> +	ret = reset_control_deassert(th1520_phy->phy_reset);
> +	if (ret)
> +		goto err_disable_clk;
> +
> +	fsleep(10);
> +
> +	return 0;
> +
> +err_disable_clk:
> +	clk_disable_unprepare(th1520_phy->ref_clk);
> +	return ret;
> +}
> +
> +static int th1520_usb_phy_exit(struct phy *phy)
> +{
> +	struct th1520_usb_phy *th1520_phy = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = reset_control_assert(th1520_phy->phy_reset);
> +	clk_disable_unprepare(th1520_phy->ref_clk);
> +

Sashiko has some comment here. I believe reset_control_assert() is not going to
fail, but still it would be better to follow proper semantics.

> +	return ret;
> +}
> +
> +static const struct phy_ops th1520_usb_phy_ops = {
> +	.init		= th1520_usb_phy_init,
> +	.exit		= th1520_usb_phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +static const struct regmap_config phy_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = USB_TEST_REG3,
> +};
> +
> +static int th1520_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct th1520_usb_phy *th1520_phy;
> +	struct reset_control *bus_reset;
> +	struct clk *bus_clk;
> +	void __iomem *base;
> +	int ret;
> +
> +	th1520_phy = devm_kzalloc(dev, sizeof(*th1520_phy), GFP_KERNEL);
> +	if (!th1520_phy)
> +		return -ENOMEM;
> +
> +	th1520_phy->pdev = pdev;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	th1520_phy->ref_clk = devm_clk_get(dev, "ref");
> +	if (IS_ERR(th1520_phy->ref_clk))
> +		return PTR_ERR(th1520_phy->ref_clk);
> +
> +	/* Enable the bus clock and leave it that way */
> +	bus_clk = devm_clk_get_enabled(dev, "bus");
> +	if (IS_ERR(bus_clk))
> +		return PTR_ERR(bus_clk);
> +
> +	/* De-assert the bus reset and leave it that way */
> +	bus_reset = devm_reset_control_get_exclusive_deasserted(dev, "bus");
> +	if (IS_ERR(bus_reset))
> +		return PTR_ERR(bus_reset);
> +
> +	th1520_phy->phy_reset = devm_reset_control_get_exclusive(dev, "phy");
> +	if (IS_ERR(th1520_phy->phy_reset))
> +		return PTR_ERR(th1520_phy->phy_reset);
> +
> +	/*
> +	 * Schematics of several boards (Lichee Module 4A/Milk-V Meles)
> +	 * describe this power rail as always-on.

Make use of 80 columns.

> +	 */
> +	ret = devm_regulator_get_enable(dev, "avdd33-usb3");
> +	if (ret)
> +		return ret;
> +
> +	th1520_phy->regmap = devm_regmap_init_mmio(dev,
> +						   base + USB_SYSCON_OFFSET,
> +						   &phy_regmap_config);
> +	if (IS_ERR(th1520_phy->regmap))
> +		return dev_err_probe(dev, PTR_ERR(th1520_phy->regmap),
> +				     "Failed to init regmap\n");
> +
> +	th1520_phy->phy = devm_phy_create(dev, dev->of_node, &th1520_usb_phy_ops);
> +	if (IS_ERR(th1520_phy->phy)) {
> +		dev_err(dev, "failed to create PHY\n");

dev_err_probe()

- Mani


