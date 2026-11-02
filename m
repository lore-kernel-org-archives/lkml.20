Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590838;
	b=nGJ3549xxxgKfeECCb8WqFdH7CBzFUmxXLI1TVx7TFE3Njl41+2RUGJTL09MGnptNGj5
	 DzJ56pdkPbcYLy6abMLMaROn0XDxW+9MCTll+5RySV1xVMYXoQINEj8OnZ9m9nx+hlfrG
	 9nAdrEszNAx4s6vNbdSMPb5/eha4pFhotmTr7LCpy+lkvG3XVQ0hw1uaf8U1UKCZ45oH7
	 7bp+Uudie7iwwgwmF1+SWTHHW5cDoSCEqWy7ks7OgEsJ5DAkenvlVk74fRgM3RfJSxVKI
	 D4bPgz6OCseAeWLOo4xabkEGXuXcqDh0/F3Sg4ZWycN43tApijMIBL2suBnmSauT+Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590838;
	h=DMARC-Filter:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:
	 X-CM-SenderInfo;
	bh=kQjzUVB0sysO2MVi8xIMwCn/4SA4FAkg6EIUj2+ZOig=;
	b=PUZ3FRxw3l1c22H1Gia0IKmhTnSmWGOTCN9Vr8J9ZK43T/9xj78aVSz8MQU13Bm1829G
	 rgOD+PJKPnwQC2skbboKHo6UUtKb1rZEW0fNb2IkgQLmkrZSYbeBYcbQBoGdVXEsvw9Ll
	 rrWUjNhJo2cQ35qhnO9boz6gmzv1GKD6O5SCVymTg66RkzaEOuZypgHG9rOUIeDdPyYYy
	 Jufd0JAeCq0PznV1xh0vdQsqVOhaARkOqKHXXJVqszzi8akKzZSD0bx3Aw3b7oDPV96ZD
	 w+5y23Km8p8ndoSeG1aoXayjvfw6FYhPKAE1e75R03t+QQtZxOdpnNHHcjkg+GlLxwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.81
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219E7606A324;
	Mon,  2 Nov 2026 03:40:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219E7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.150])
	by APP-03 (Coremail) with SMTP id rQCowABnOpscBuhqgWArAA--.36947S2;
	Mon, 02 Nov 2026 11:40:13 +0800 (CST)
Message-ID: <bd7b323e45af2f1e728502224f17e363303dfb74.camel@iscas.ac.cn>
Subject: Re: [PATCH v3 2/2] phy: add a driver for T-Head TH1520 USB PHY
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Wei Fu <wefu@redhat.com>, Drew
 Fustini <dfustini@tenstorrent.com>, 	linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao	 <rabenda.cn@gmail.com>
Date: Mon, 02 Nov 2026 11:40:12 +0800
In-Reply-To: <179344878055.5901.6127263477546911730.b4-reply@b4>
References: <20261009090444.3319517-1-zhengxingda@iscas.ac.cn>
	 <20261009090444.3319517-3-zhengxingda@iscas.ac.cn>
	 <179344878055.5901.6127263477546911730.b4-reply@b4>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:rQCowABnOpscBuhqgWArAA--.36947S2
X-Coremail-Antispam: 1UD129KBjvJXoW3XF13Cr4xCw17AFyDCr1xZrb_yoWDGw4Dpa
	95JF4jyFykJF1Igw4Iqr1UCFZaqw4xt3W3Kry3Ga4rZF9Ikr95WayDWFWY9ryvvr4kZry0
	yr98WFy29F15K3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7IU56yI5UUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-10-31=E5=85=AD=E7=9A=84 17:43 +0530=EF=BC=8CManivannan Sadha=
sivam=E5=86=99=E9=81=93=EF=BC=9A
> On 2026-10-09 17:04 +0800, Icenowy Zheng wrote:
> > The USB PHY on T-Head TH1520 SoC is a Synopsys USB 3.0 FemtoPHY,
> > with
> > some PHY parameters exported as another system controller along
> > with it.
> >=20
> > A few PHY parameters have unusable defaults. Add a driver that
> > programs
> > them before releasing the PHY from reset in addition to
> > clock/reset/regulator management.
> >=20
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > ---
> > Changes in v3:
> > - Use fsleep() to replace udelay(), and add proper inclusion of
> > =C2=A0 linux/delay.h for this function. (fsleep() suggested by Drew and
> > =C2=A0 inclusion suggested by Sashiko)
> > - Adapt Drew's suggestion on the wording of the commit message's
> > 2nd
> > =C2=A0 paragraph.
> > Changes in v2:
> > - Removed unreferenced register names.
> > - Changed the behavior to leaving bus clock on instead of binding
> > it to
> > =C2=A0 the regmap.
> > - Removed early return for reset deassert failure in phy exit
> > callback.
> > - Tweaked the Kconfig item (removed default value and added "select
> > =C2=A0 REGMAP_MMIO).
> >=20
> > =C2=A0drivers/phy/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/phy/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/phy/thead/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 ++
> > =C2=A0drivers/phy/thead/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0drivers/phy/thead/phy-th1520-usb.c | 181
> > +++++++++++++++++++++++++++++
> > =C2=A05 files changed, 197 insertions(+)
> > =C2=A0create mode 100644 drivers/phy/thead/Kconfig
> > =C2=A0create mode 100644 drivers/phy/thead/Makefile
> > =C2=A0create mode 100644 drivers/phy/thead/phy-th1520-usb.c
> >=20
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index 19f3b7d12b7d4..a05019020ee09 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -200,6 +200,7 @@ source "drivers/phy/st/Kconfig"
> > =C2=A0source "drivers/phy/starfive/Kconfig"
> > =C2=A0source "drivers/phy/sunplus/Kconfig"
> > =C2=A0source "drivers/phy/tegra/Kconfig"
> > +source "drivers/phy/thead/Kconfig"
> > =C2=A0source "drivers/phy/ti/Kconfig"
> > =C2=A0source "drivers/phy/xilinx/Kconfig"
> > =C2=A0
> > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > index d7aa516bcc49e..0ac5b21477619 100644
> > --- a/drivers/phy/Makefile
> > +++ b/drivers/phy/Makefile
> > @@ -52,5 +52,6 @@ obj-$(CONFIG_GENERIC_PHY)		+=3D
> > allwinner/	\
> > =C2=A0					=C2=A0=C2=A0 starfive/	\
> > =C2=A0					=C2=A0=C2=A0 sunplus/	\
> > =C2=A0					=C2=A0=C2=A0 tegra/	\
> > +					=C2=A0=C2=A0 thead/	\
> > =C2=A0					=C2=A0=C2=A0 ti/		\
> > =C2=A0					=C2=A0=C2=A0 xilinx/
> > diff --git a/drivers/phy/thead/Kconfig b/drivers/phy/thead/Kconfig
> > new file mode 100644
> > index 0000000000000..ba0ceac54c1b0
> > --- /dev/null
> > +++ b/drivers/phy/thead/Kconfig
> > @@ -0,0 +1,12 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +config PHY_TH1520_USB
>=20
> Can you name this PHY driver based on some family or means other than
> SoC name?
> Naming the driver per SoC usually ends up confusing as more SoCs will
> end up
> reusing them.

It looks like the next SoC, Zhihe A210 (T-Head TH1520 is
retrospectively known as A200), refactored the USB part and switched to
use Synopsys 10G PHY instead of USB 3.0 FemtoPHY; see the coexistence
of dwc3-thead.c (TH1520) and dwc3-zhihe.c (A210) at [1].

So this driver is at least now specifically for TH1520. It might be
finally reused, but even if this happens we can't predict a proper
family name. T-Head has terminated embedded SoC business and now
focuses on datacenter silicon, and name it A200 would wrongly indicate
that A210 would be also using it.

Well, maybe it would be reasonable to name the directory zhihe instead
of thead now, but it's another story...

Thanks,
Icenowy

[1]
https://github.com/revyos/a210-linux-kernel/tree/a210-dev/drivers/usb/dwc3

>=20
> > +	tristate "USB PHY driver for T-Head TH1520 SoC"
> > +	depends on ARCH_THEAD || COMPILE_TEST
> > +	depends on COMMON_CLK
> > +	depends on HAS_IOMEM
> > +	depends on OF
> > +	depends on RESET_CONTROLLER
> > +	select GENERIC_PHY
> > +	select REGMAP_MMIO
> > +	help
> > +	=C2=A0 Enable support for the USB PHY on the T-Head TH1520 SoC.
> > diff --git a/drivers/phy/thead/Makefile
> > b/drivers/phy/thead/Makefile
> > new file mode 100644
> > index 0000000000000..5b459bc7004bd
> > --- /dev/null
> > +++ b/drivers/phy/thead/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_PHY_TH1520_USB) +=3D phy-th1520-usb.o
> > diff --git a/drivers/phy/thead/phy-th1520-usb.c
> > b/drivers/phy/thead/phy-th1520-usb.c
> > new file mode 100644
> > index 0000000000000..6cb0e51401374
> > --- /dev/null
> > +++ b/drivers/phy/thead/phy-th1520-usb.c
> > @@ -0,0 +1,181 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2026 Institute of Software, Chinese Academy of
> > Sciences (ISCAS)
> > + *
> > + * Authors:
> > + * Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/reset.h>
> > +
> > +#define USB_SYSCON_OFFSET		0xf000
> > +
> > +/* All the below registers are in the USB syscon region */
> > +#define USB_SSP_EN			0x34
> > +#define USB_SSP_EN_REF_SSP_EN		BIT(0)
> > +
> > +#define USB_SYS				0x3c
> > +#define USB_SYS_COMMONONN		BIT(0)
> > +
> > +/* The last register according to the manual */
> > +#define USB_TEST_REG3			0x5c
> > +
> > +struct th1520_usb_phy {
> > +	struct platform_device *pdev;
> > +	struct phy *phy;
> > +	struct regmap *regmap;
> > +	struct clk *ref_clk;
> > +	struct reset_control *phy_reset;
> > +};
> > +
> > +static int th1520_usb_phy_init(struct phy *phy)
> > +{
> > +	struct th1520_usb_phy *th1520_phy =3D phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	ret =3D clk_prepare_enable(th1520_phy->ref_clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D reset_control_assert(th1520_phy->phy_reset);
> > +	if (ret)
> > +		goto err_disable_clk;
> > +
> > +	/*
> > +	 * Do some initial PHY setup:
> > +	 * - Set COMMONONN to allow the PHY to automatically power
> > down.
> > +	 * - Set REF_SSP_EN to enable feeding reference clock to
> > SuperSpeed
> > +	 *=C2=A0=C2=A0 PHY clock PLL.
> > +	 */
> > +	regmap_set_bits(th1520_phy->regmap, USB_SYS,
> > USB_SYS_COMMONONN);
> > +	regmap_set_bits(th1520_phy->regmap, USB_SSP_EN,
> > USB_SSP_EN_REF_SSP_EN);
> > +
> > +	ret =3D reset_control_deassert(th1520_phy->phy_reset);
> > +	if (ret)
> > +		goto err_disable_clk;
> > +
> > +	fsleep(10);
> > +
> > +	return 0;
> > +
> > +err_disable_clk:
> > +	clk_disable_unprepare(th1520_phy->ref_clk);
> > +	return ret;
> > +}
> > +
> > +static int th1520_usb_phy_exit(struct phy *phy)
> > +{
> > +	struct th1520_usb_phy *th1520_phy =3D phy_get_drvdata(phy);
> > +	int ret;
> > +
> > +	ret =3D reset_control_assert(th1520_phy->phy_reset);
> > +	clk_disable_unprepare(th1520_phy->ref_clk);
> > +
>=20
> Sashiko has some comment here. I believe reset_control_assert() is
> not going to
> fail, but still it would be better to follow proper semantics.

Yes it sounds reasonable.

BTW why does exit callback has an int return value anyway?

>=20
> > +	return ret;
> > +}
> > +
> > +static const struct phy_ops th1520_usb_phy_ops =3D {
> > +	.init		=3D th1520_usb_phy_init,
> > +	.exit		=3D th1520_usb_phy_exit,
> > +	.owner		=3D THIS_MODULE,
> > +};
> > +
> > +static const struct regmap_config phy_regmap_config =3D {
> > +	.reg_bits =3D 32,
> > +	.val_bits =3D 32,
> > +	.reg_stride =3D 4,
> > +	.max_register =3D USB_TEST_REG3,
> > +};
> > +
> > +static int th1520_usb_phy_probe(struct platform_device *pdev)
> > +{
> > +	struct phy_provider *phy_provider;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct th1520_usb_phy *th1520_phy;
> > +	struct reset_control *bus_reset;
> > +	struct clk *bus_clk;
> > +	void __iomem *base;
> > +	int ret;
> > +
> > +	th1520_phy =3D devm_kzalloc(dev, sizeof(*th1520_phy),
> > GFP_KERNEL);
> > +	if (!th1520_phy)
> > +		return -ENOMEM;
> > +
> > +	th1520_phy->pdev =3D pdev;
> > +
> > +	base =3D devm_platform_ioremap_resource(pdev, 0);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	th1520_phy->ref_clk =3D devm_clk_get(dev, "ref");
> > +	if (IS_ERR(th1520_phy->ref_clk))
> > +		return PTR_ERR(th1520_phy->ref_clk);
> > +
> > +	/* Enable the bus clock and leave it that way */
> > +	bus_clk =3D devm_clk_get_enabled(dev, "bus");
> > +	if (IS_ERR(bus_clk))
> > +		return PTR_ERR(bus_clk);
> > +
> > +	/* De-assert the bus reset and leave it that way */
> > +	bus_reset =3D
> > devm_reset_control_get_exclusive_deasserted(dev, "bus");
> > +	if (IS_ERR(bus_reset))
> > +		return PTR_ERR(bus_reset);
> > +
> > +	th1520_phy->phy_reset =3D
> > devm_reset_control_get_exclusive(dev, "phy");
> > +	if (IS_ERR(th1520_phy->phy_reset))
> > +		return PTR_ERR(th1520_phy->phy_reset);
> > +
> > +	/*
> > +	 * Schematics of several boards (Lichee Module 4A/Milk-V
> > Meles)
> > +	 * describe this power rail as always-on.
>=20
> Make use of 80 columns.

Okay, I retried and with `describe` placed at the previous line, the
width is just 80 columns; maybe this is why I folded it previously.

But I will re-fold it here to make use of the full 80 columns range.

>=20
> > +	 */
> > +	ret =3D devm_regulator_get_enable(dev, "avdd33-usb3");
> > +	if (ret)
> > +		return ret;
> > +
> > +	th1520_phy->regmap =3D devm_regmap_init_mmio(dev,
> > +						=C2=A0=C2=A0 base +
> > USB_SYSCON_OFFSET,
> > +						=C2=A0=C2=A0
> > &phy_regmap_config);
> > +	if (IS_ERR(th1520_phy->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(th1520_phy-
> > >regmap),
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to init regmap\n");
> > +
> > +	th1520_phy->phy =3D devm_phy_create(dev, dev->of_node,
> > &th1520_usb_phy_ops);
> > +	if (IS_ERR(th1520_phy->phy)) {
> > +		dev_err(dev, "failed to create PHY\n");
>=20
> dev_err_probe()

Sounds reasonable, would use it in the next revision.

Thanks,
Icenowy

>=20
> - Mani

