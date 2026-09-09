Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32415479867;
	Wed,  9 Sep 2026 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942688; cv=none; b=OU6ypMl0w0N4TF9MdKHnlpu7IPirUCK+A13bOieSh5pOFuQfPBf0z41pCR2PS1cQ70A9wVW3H3n0HLpVknZd4MJIDfr54vOt5Be6onKTALw2BobNXdkS5REBT1z0sW5E9bO8A/0rj8G9w30y7Jd+qyHWokxWLgSuPIYrUPBu8bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942688; c=relaxed/simple;
	bh=3iRworJfB5leJ0q0KstAVXfOMueQAkS0IcTsKYA1g9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxukrKEA6M5EDFa59Oe5yICaHwZqk5Q6AOWjVdYO4JWrPh5+JpM4ne+YVgIWExMpGGXkd8keLn0Al2uvjajcO+6BuCLqNq7YquDVB/HggaP/EuTWKXmwr5WR54xDHeB5Mm5+ANVv9C+5OgK+pICYGfC9GvlRV6vCk0PcyVX9SDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkuxpnB9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkuxpnB9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36BC11F00ADE;
	Wed,  9 Sep 2026 08:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788942686;
	bh=u90H3kvPiANnjYuJutZLUXCAY3/LlIec8aBZfM+ga7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AkuxpnB9gDnuD2XgPNSBlab6Z3PdHQZERsEVWHElRJ50N0hxy2uK6t/K1p5LnwKSd
	 qtR1Nn0oxXrp0Vq+zyk+Z9Ldye+U20odLWC1zmFhuQHw+ZhZHnC2TalDrd33l0VRd7
	 1+QjeDcfUDEXZ1/SI2cx5uvOLd8pEIuiOXVgaRQ5KL8UYBmPlur7NIfdjKU1Kthi42
	 XTXaN594AG5csFXG3PaK+GpEJFgrVjM9K7MKptTJWizdRoTqfSWWx/weuKBsITT+gd
	 uV66BafxxOZ3yiFCyIyskHjvm/Ps6rvzZf6aC4+nxYgZ//jhHHqt8qgqLb11IRQEb+
	 75bsSLWIb6ndA==
Date: Wed, 9 Sep 2026 10:31:17 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] phy: aspeed: Add AST2700 USB3.2 PHY driver
Message-ID: <5oamvlreciw524g3bpbemcpdpljc7thilejy6s4kwmt5hdjwcp@xmaef4eaurzk>
References: <20260701-upstream_usb3phy-v3-0-00e12315b6f9@aspeedtech.com>
 <20260701-upstream_usb3phy-v3-2-00e12315b6f9@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701-upstream_usb3phy-v3-2-00e12315b6f9@aspeedtech.com>

On Wed, Jul 01, 2026 at 02:58:18PM +0800, Ryan Chen wrote:
> Add AST2700 USB3.2 PHY driver support.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Just couple of nitpicks below. Once they are addressed:

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

> ---
>  drivers/phy/Kconfig                  |   1 +
>  drivers/phy/Makefile                 |   1 +
>  drivers/phy/aspeed/Kconfig           |  15 +++
>  drivers/phy/aspeed/Makefile          |   2 +
>  drivers/phy/aspeed/phy-aspeed-usb3.c | 236 +++++++++++++++++++++++++++++++++++
>  5 files changed, 255 insertions(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 19f3b7d12b7d..85fa381978f8 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -171,6 +171,7 @@ config PHY_XGENE
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/apple/Kconfig"
> +source "drivers/phy/aspeed/Kconfig"
>  source "drivers/phy/axiado/Kconfig"
>  source "drivers/phy/broadcom/Kconfig"
>  source "drivers/phy/cadence/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index d7aa516bcc49..c6dd02003bbe 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
>  obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
>  					   amlogic/	\
>  					   apple/	\
> +					   aspeed/	\
>  					   axiado/	\
>  					   broadcom/	\
>  					   cadence/	\
> diff --git a/drivers/phy/aspeed/Kconfig b/drivers/phy/aspeed/Kconfig
> new file mode 100644
> index 000000000000..7b5f48db2be8
> --- /dev/null
> +++ b/drivers/phy/aspeed/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +#
> +# PHY drivers for ASPEED
> +#
> +
> +config PHY_ASPEED_USB3
> +	tristate "ASPEED USB3 PHY driver"
> +	select GENERIC_PHY
> +	depends on (ARCH_ASPEED || COMPILE_TEST)
> +	help
> +	  Enable this to support the USB 3.2 PHY on the Aspeed AST2700 SoC.
> +	  It supports SuperSpeedPlus Gen2x1 (10 Gbps), SuperSpeed (5 Gbps),
> +	  High Speed (480 Mbps), Full Speed (12 Mbps) and Low Speed
> +	  (1.5 Mbps), and is paired with the DWC3 USB controller.
> diff --git a/drivers/phy/aspeed/Makefile b/drivers/phy/aspeed/Makefile
> new file mode 100644
> index 000000000000..d96d9d73a009
> --- /dev/null
> +++ b/drivers/phy/aspeed/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +obj-$(CONFIG_PHY_ASPEED_USB3)		+= phy-aspeed-usb3.o
> diff --git a/drivers/phy/aspeed/phy-aspeed-usb3.c b/drivers/phy/aspeed/phy-aspeed-usb3.c
> new file mode 100644
> index 000000000000..eff148faa14c
> --- /dev/null
> +++ b/drivers/phy/aspeed/phy-aspeed-usb3.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2026 Aspeed Technology Inc.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#define PHY3S00		0x00
> +#define PHY3S00_INIT_DONE		BIT(15)
> +#define PHY3S00_SRAM_BYPASS		BIT(7)
> +#define PHY3S00_SRAM_EXT_LOAD	BIT(6)

If you want to mix register offsets and bitfield definitions, then you need to
use indent to differentiate:

	#define PHY3S00			0x00
	#define  PHY3S00_INIT_DONE	BIT(15)
	#define  PHY3S00_SRAM_BYPASS	BIT(7)
	...
	#define PHY3S04			0x04
	...

> +#define PHY3S04		0x04
> +#define PHY3C00		0x08
> +#define PHY3C04		0x0C

Use lowercaps for all hex values

- Mani

-- 
மணிவண்ணன் சதாசிவம்
