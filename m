Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2A13E7624;
	Sat, 26 Sep 2026 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433853; cv=none; b=j2QbkqQ9TzVBXyDgS9KHxgDmylbQ4NPJd4fsmHyzZ7iSZczL5z1Wc/RGufaEBi3uouRXMay/yQC55QFJg+LNdynR8hwVciWd9N0wJJqel/mo7d9ec83zRwJWJ2VteL+gTRyf5ErcvkYnlCMOHaRQHN5ifNHRjSdnANEMXQs+tHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433853; c=relaxed/simple;
	bh=7BEpXbBGU1K6MSlT5JYkCucvIS2o1H9mrra5MgC+j/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjnA3APGKVBMRZGh3TKySaHuOQuKyVFbMLBBGzI6g7l0nRA5X7pcxHlmz9nZ1mAa3Mzn5s2M1Mo9TO/YJ37xk4gwfuAC5BrK2GyZm7w2GtqVSGjjqShgjMVQfNlUOYFD4amn/onvJUDOsopAQtEiqeVUFwNxzbwmkErA924BrxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlqcXi1G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlqcXi1G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 980611F000FF;
	Sat, 26 Sep 2026 14:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790433851;
	bh=bwY7/29HHpQWT9XDUVLycOQgESR1fkxFiSXrbYhJD5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mlqcXi1Gyp8b2SoMKvkuvH9nUjMi7xR7VgmS0m0l9ThhCy22APYZ9PgPjU1FZ6Ord
	 pPcBsNgXBzoM8fMYJpb+A7uMYiZAPfGCMf7s/TYQjZyTegjCiwQh/vK/Uk3eBiE/By
	 G8rsi4xB73Dq6xe80AXs1JuQ0di/8dxxyQkXzf1e4w50cam3ABYDrrLSnTDfzKdpr4
	 hZZhVC1QfdPLjmQQUylEM90UdxXAze/xnI5ZGPCVwN+sE4xtYm2R1f1KU5yGM8CAfe
	 ZzB1S5J3G0Q3MIAxyAc8tONEro3xKbIv4ThH+FdvYzULKUBGvLTqnL/Bx5DNty0RX6
	 kwx+KIRp6g+5Q==
Date: Sat, 26 Sep 2026 16:43:58 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/3] phy: move and rename Airoha PCIe PHY driver to
 dedicated directory
Message-ID: <ewwhqmrwcvc3ztsvubktvhcpmiodsweycyiyo5bfzozj5qjs44@2cqndno33uj2>
References: <20260724184523.193661-1-ansuelsmth@gmail.com>
 <20260724184523.193661-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724184523.193661-3-ansuelsmth@gmail.com>

On Fri, Jul 24, 2026 at 08:45:21PM +0200, Christian Marangi wrote:
> To keep the generic PHY directory tidy, move the PCIe PHY driver for
> Airoha AN7581 SoC to a dedicated directory.
> 
> Also rename the driver and add the relevant SoC name to the .c and .h
> file in preparation for support of PCIe and USB PHY driver for Airoha
> AN7583 SoC that use a completely different implementation and
> calibration for PHYs and will have their own dedicated drivers.
> 
> The rename permits to better identify the specific usage of the driver
> in the future once the airoha PHY directory will have multiple driver
> for multiple SoC.
> 
> The config is changed from PHY_AIROHA_PCIE to PHY_AIROHA_AN7581_PCIE.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  MAINTAINERS                                         |  4 ++--
>  drivers/phy/Kconfig                                 | 11 +----------
>  drivers/phy/Makefile                                |  4 ++--
>  drivers/phy/airoha/Kconfig                          | 13 +++++++++++++
>  drivers/phy/airoha/Makefile                         |  3 +++
>  .../phy-an7581-pcie-regs.h}                         |  2 +-
>  .../{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} |  6 +++---
>  7 files changed, 25 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/phy/airoha/Kconfig
>  create mode 100644 drivers/phy/airoha/Makefile
>  rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
>  rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 05e90c3f7fe0..952653034c4c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -765,8 +765,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
> -F:	drivers/phy/phy-airoha-pcie-regs.h
> -F:	drivers/phy/phy-airoha-pcie.c
> +F:	drivers/phy/airoha/phy-an7581-pcie-regs.h
> +F:	drivers/phy/airoha/phy-an7581-pcie.c
>  
>  AIROHA SPI SNFI DRIVER
>  M:	Lorenzo Bianconi <lorenzo@kernel.org>
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 19f3b7d12b7d..e93951a4a898 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -46,16 +46,6 @@ config GENERIC_PHY_MIPI_DPHY
>  	  Provides a number of helpers a core functions for MIPI D-PHY
>  	  drivers to us.
>  
> -config PHY_AIROHA_PCIE
> -	tristate "Airoha PCIe-PHY Driver"
> -	depends on ARCH_AIROHA || COMPILE_TEST
> -	depends on OF
> -	select GENERIC_PHY
> -	help
> -	  Say Y here to add support for Airoha PCIe PHY driver.
> -	  This driver create the basic PHY instance and provides initialize
> -	  callback for PCIe GEN3 port.
> -
>  config PHY_CAN_TRANSCEIVER
>  	tristate "CAN transceiver PHY"
>  	select GENERIC_PHY
> @@ -168,6 +158,7 @@ config PHY_XGENE
>  	help
>  	  This option enables support for APM X-Gene SoC multi-purpose PHY.
>  
> +source "drivers/phy/airoha/Kconfig"
>  source "drivers/phy/allwinner/Kconfig"
>  source "drivers/phy/amlogic/Kconfig"
>  source "drivers/phy/apple/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index d7aa516bcc49..4ca4a07963fc 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -7,7 +7,6 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+= phy-common-props.o
>  obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+= phy-common-props-test.o
>  obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
>  obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
> -obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
>  obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
>  obj-$(CONFIG_PHY_ECONET_PCIE)		+= phy-econet-pcie.o
>  obj-$(CONFIG_PHY_EYEQ5_ETH)		+= phy-eyeq5-eth.o
> @@ -20,7 +19,8 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
>  obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
>  obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
>  
> -obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
> +obj-$(CONFIG_GENERIC_PHY)		+= airoha/	\
> +					   allwinner/	\
>  					   amlogic/	\
>  					   apple/	\
>  					   axiado/	\
> diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
> new file mode 100644
> index 000000000000..9a1b625a7701
> --- /dev/null
> +++ b/drivers/phy/airoha/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for Airoha devices
> +#
> +config PHY_AIROHA_AN7581_PCIE
> +	tristate "Airoha AN7581 PCIe-PHY Driver"
> +	depends on ARCH_AIROHA || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY
> +	help
> +	  Say Y here to add support for Airoha AN7581 PCIe PHY driver.
> +	  This driver create the basic PHY instance and provides initialize
> +	  callback for PCIe GEN3 port.
> diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
> new file mode 100644
> index 000000000000..912f3e11a061
> --- /dev/null
> +++ b/drivers/phy/airoha/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +obj-$(CONFIG_PHY_AIROHA_AN7581_PCIE)	+= phy-an7581-pcie.o
> diff --git a/drivers/phy/phy-airoha-pcie-regs.h b/drivers/phy/airoha/phy-an7581-pcie-regs.h
> similarity index 99%
> rename from drivers/phy/phy-airoha-pcie-regs.h
> rename to drivers/phy/airoha/phy-an7581-pcie-regs.h
> index 58572c793722..b938a7b468fe 100644
> --- a/drivers/phy/phy-airoha-pcie-regs.h
> +++ b/drivers/phy/airoha/phy-an7581-pcie-regs.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> +// SPDX-License-Identifier: GPL-2.0-only

As per Documentation/process/license-rules.rst, the existing license header was
the correct one. So this change should be dropped.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
