Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BC247F76A;
	Thu, 27 Aug 2026 16:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846437; cv=none; b=jdrMdlzTS+1/Vn842gwLH6hLz0OZelOGwcbYd1er3ux2q9jRSxD5GBH7S8VG9kJMHo6bS2iGOU/DQTLwPzzfJv3BnzzM9eMIsSKB9LEGVbxJoFw/oFarkn7rE05FIQLuzd+l9TPds9Tfv/q40HYHnj7EMlvFcOXFqqxfC2DrpkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846437; c=relaxed/simple;
	bh=zKFIRLAhJS6PJ1Yb7jdzpeW3qub/vxs18IBdz5YyO8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTUgY32oqHXwUVEa9s2bAQQtoTT516CpK4EEhqJw1OMlHHfMQf9M9jNckA+DxmwgK4KqSWaJ3PClsx24SPa2DMH6RKxJV3+IzhKvLG62FFcHfGPwmThpGXWdyP/ak5b2Apj86b2pihYzahSmY+2CNSAI9Vzd4nWFNa8R7986tUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtrYgCCZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtrYgCCZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E831F000E9;
	Thu, 27 Aug 2026 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787846435;
	bh=mc9UqifGDes7aqOfgsJlG3V88rf8KQlsEq8wthV3IEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QtrYgCCZ+k2VUTD2+vb3c3oCDpu0y0MrozeRvCXQQxFL4CH9XjueJ7EcjvDSvuJDN
	 /1lWbHKCTRoU/QyUFkbf3bszPZHHMAadCQ3wgyrc+XaEDy0XdJXT0BteBZWXS6LqcO
	 /g1hHlAvdJh2FjxgpKbb8mse83Lo+hNWLB7sYt141MJ+bEr/MQ0HnYu/WJr3hQ2usM
	 5WBXy173K3VJiJCvoeONgKfSFY7mC0kq/CIPE8Fc1I7d3giBaCl69vTGfXp6YhO7DC
	 mBwNeP6hobSvVdVVsRjv30VyGRFouWWvBRHrsNzQnzVN2XB4w9fmEwU1/xRIXtfQne
	 o7J5UGgmCzFlA==
Date: Thu, 27 Aug 2026 21:30:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
	Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 2/9] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
Message-ID: <apBfHzD5TfryaEW0@vaman>
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-3-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822074816.548662-3-marex@nabladev.com>

On 22-08-26, 09:46, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
> 
> Add USB2 PHY driver for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string
> to discern them.
> 
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Rahul Kumar <rahul.kumar05@st.com>
> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Co-developed-by: Christian Bruel <christian.bruel@foss.st.com>
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> Co-developed-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
> V2: - Fix up Sob/Cdb lines
>     - Operate PHY as a syscon subnode
> V3: - Update copyright years
>     - Register two sets of clock, one 480 MHz PLL and one CMN
>     - Split PHY ops per PHY, since the PHY2 does not have set mode ops
>     - Fix up Sob/Cdb lines further
> ---
>  drivers/phy/st/Kconfig             |  10 +
>  drivers/phy/st/Makefile            |   1 +
>  drivers/phy/st/phy-stm32-usb2phy.c | 406 +++++++++++++++++++++++++++++
>  3 files changed, 417 insertions(+)
>  create mode 100644 drivers/phy/st/phy-stm32-usb2phy.c
> 
> diff --git a/drivers/phy/st/Kconfig b/drivers/phy/st/Kconfig
> index 49206185e5633..2835bb67bca9e 100644
> --- a/drivers/phy/st/Kconfig
> +++ b/drivers/phy/st/Kconfig
> @@ -58,3 +58,13 @@ config PHY_STM32_USBPHYC
>  	  used by an HS USB Host controller, and the second one is shared
>  	  between an HS USB OTG controller and an HS USB Host controller,
>  	  selected by a USB switch.
> +
> +config PHY_STM32_USB2PHY
> +	tristate "STMicroelectronics STM32MP25 USB2.0 PHY Controller driver"
> +	depends on ARCH_STM32 || COMPILE_TEST
> +	depends on COMMON_CLK
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support the High-Speed USB 2.0 transceivers that are
> +	  part of the STMicroelectronics STM32MP25 SoCs. The PHY itself is a
> +	  Synopsys FEMTO-PHY.
> diff --git a/drivers/phy/st/Makefile b/drivers/phy/st/Makefile
> index cb80e954ea9f0..4945df5ed78a8 100644
> --- a/drivers/phy/st/Makefile
> +++ b/drivers/phy/st/Makefile
> @@ -5,3 +5,4 @@ obj-$(CONFIG_PHY_ST_SPEAR1340_MIPHY)	+= phy-spear1340-miphy.o
>  obj-$(CONFIG_PHY_STIH407_USB)		+= phy-stih407-usb.o
>  obj-$(CONFIG_PHY_STM32_COMBOPHY)	+= phy-stm32-combophy.o
>  obj-$(CONFIG_PHY_STM32_USBPHYC) 	+= phy-stm32-usbphyc.o
> +obj-$(CONFIG_PHY_STM32_USB2PHY) 	+= phy-stm32-usb2phy.o
> diff --git a/drivers/phy/st/phy-stm32-usb2phy.c b/drivers/phy/st/phy-stm32-usb2phy.c
> new file mode 100644
> index 0000000000000..8c68b2d208d73
> --- /dev/null
> +++ b/drivers/phy/st/phy-stm32-usb2phy.c
> @@ -0,0 +1,406 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * STMicroelectronics STM32 USB2 PHY Controller driver
> + * Currently Only supported for STM32MP25
> + *
> + * Copyright (C) 2022-2026 STMicroelectronics
> + * Author(s): Pankaj Dev <pankaj.dev@st.com>.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/usb/role.h>
> +#include <linux/mfd/syscon.h>
> +
> +#define SYSCFG_USB2PHY2CR_USB2PHY2CMN		BIT(2)
> +#define SYSCFG_USB2PHY2CR_VBUSVALID		BIT(4)
> +#define SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL		BIT(5)
> +#define SYSCFG_USB2PHY2CR_VBUSVLDEXT		BIT(6)
> +
> +#define USBH_NUM_CLK				2
> +
> +struct stm32_usb2phy {
> +	struct phy				*phy;
> +	struct regmap				*regmap;
> +	struct device				*dev;
> +	struct reset_control			*rstc;
> +	struct clk				*phyref;
> +	struct regulator			*vdd33;
> +	const struct stm32mp2_usb2phy_hw_data	*hw_data;
> +	atomic_t				en_refcnt;
> +	enum phy_mode				mode;
> +	u32					cr_offset;
> +	bool					is_init;
> +	struct clk_hw				clkpll_hw;
> +	struct clk_hw				clkcmn_hw;
> +	/* Must be last */
> +	struct clk_hw_onecell_data		onecell;
> +};
> +
> +struct stm32mp2_usb2phy_hw_data {
> +	u32			phyrefsel_mask;
> +	const struct phy_ops	*phy_ops;
> +};
> +
> +static int stm32_usb2phy_enable(struct stm32_usb2phy *phy_dev)
> +{
> +	const struct stm32mp2_usb2phy_hw_data *phy_data = phy_dev->hw_data;
> +	unsigned int refsel;
> +	unsigned long rate;
> +	int ret;
> +
> +	/* Check if a phy is already init or clkpll in use */
> +	if (atomic_inc_return(&phy_dev->en_refcnt) > 1)
> +		return 0;
> +
> +	rate = clk_get_rate(phy_dev->phyref);
> +	if (rate == 19200000)
> +		refsel = 0;
> +	else if (rate == 20000000)
> +		refsel = 1;
> +	else if (rate == 24000000)
> +		refsel = 2;
> +	else
> +		return -EINVAL;

Would a switch not be better here?

> +
> +	ret = regmap_update_bits(phy_dev->regmap,
> +				 phy_dev->cr_offset,
> +				 phy_data->phyrefsel_mask,
> +				 field_prep(phy_data->phyrefsel_mask, refsel));
> +	if (ret)
> +		return ret;
> +
> +	ret = regulator_enable(phy_dev->vdd33);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(phy_dev->phyref);
> +	if (ret)
> +		goto error_regdis;
> +
> +	ret = reset_control_deassert(phy_dev->rstc);
> +	if (ret)
> +		goto error_clkdis;
> +
> +	return 0;
> +
> +error_clkdis:
> +	clk_disable_unprepare(phy_dev->phyref);
> +error_regdis:
> +	regulator_disable(phy_dev->vdd33);
> +
> +	return ret;
> +}
> +
> +static int stm32_usb2phy_disable(struct stm32_usb2phy *phy_dev)
> +{
> +	int ret;
> +
> +	/* Check if a phy is still init or clkpll in use */
> +	if (atomic_dec_return(&phy_dev->en_refcnt) > 0)
> +		return 0;
> +
> +	ret = reset_control_assert(phy_dev->rstc);
> +	if (ret)
> +		return ret;
> +
> +	clk_disable_unprepare(phy_dev->phyref);
> +
> +	return regulator_disable(phy_dev->vdd33);
> +}
> +
> +static int stm32_usb2phy_set_mode(struct phy *phy, enum phy_mode mode, int submode)
> +{
> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
> +	u32 mask = SYSCFG_USB2PHY2CR_USB2PHY2CMN |
> +		   SYSCFG_USB2PHY2CR_VBUSVALID |
> +		   SYSCFG_USB2PHY2CR_VBUSVLDEXT;
> +	u32 val = 0;
> +	int ret;
> +
> +	if (mode == PHY_MODE_USB_HOST) {
> +		if (submode != USB_ROLE_NONE)
> +			val = SYSCFG_USB2PHY2CR_VBUSVALID;
> +	} else if (mode == PHY_MODE_USB_DEVICE) {
> +		val = SYSCFG_USB2PHY2CR_USB2PHY2CMN |
> +		      SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;
> +		if (submode != USB_ROLE_NONE)
> +			val |= SYSCFG_USB2PHY2CR_VBUSVLDEXT;
> +		mask |= SYSCFG_USB2PHY2CR_VBUSVLDEXTSEL;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	ret = regmap_update_bits(phy_dev->regmap, phy_dev->cr_offset, mask, val);
> +	if (ret)
> +		return ret;
> +
> +	phy_dev->mode = mode;
> +
> +	return 0;
> +}
> +
> +static int stm32_usb2phy1_init(struct phy *phy)
> +{
> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = stm32_usb2phy_enable(phy_dev);
> +	if (ret)
> +		return ret;
> +
> +	phy_dev->is_init = true;
> +
> +	return 0;
> +}
> +
> +static int stm32_usb2phy2_init(struct phy *phy)
> +{
> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = stm32_usb2phy_enable(phy_dev);
> +	if (ret)
> +		return ret;
> +
> +	if (phy_dev->mode != PHY_MODE_INVALID) {
> +		ret = stm32_usb2phy_set_mode(phy, phy_dev->mode, USB_ROLE_NONE);
> +		if (ret) {
> +			stm32_usb2phy_disable(phy_dev);
> +			return ret;
> +		}
> +	}

so what is the diff b/w these two phys that we need to check invalid
only here?

-- 
~Vinod
