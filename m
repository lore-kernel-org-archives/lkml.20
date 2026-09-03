Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDEC418A5E;
	Thu,  3 Sep 2026 10:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430814; cv=fail; b=VVwoOxxR2StSbQ06h97S+BNZ5yZDbIbk7NZ2ss5ESPSkF6UuUsEOQGt1B67RBWf5KJeP6Rl20+Ip0oDFrWWtJg8+hzA7eLT6t3dvCv87F4MesH5Y4HEdBGFJnVtc/F+oxTJAiQExGXujikRLzstnnZb91IBi0uHERyaE6V8/eEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430814; c=relaxed/simple;
	bh=6de3SHDEieslv+XM0aSGW9ejtQ0x4vxCoAHpUkcLkY8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t0JbRJG4LE7XM9lBdEE2qChaGxhEW9BRefZ9JuZFkIWu8zSfjKFmR+O+l9tzPGqIolZ4ZWXX7jr/klkzovrLN6eOqYnUrXG8fqdpMxZYrLnaDK2e0j7P1DdEYEhq/GtRvOYT5l3B5VixTu0G4S/TThqpT1MOu8r5FTwFYKEhD2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=mGD0Kq8k; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="mGD0Kq8k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxQQoxmCYjJmNHzPeOsO3yiGaT/rTW/nigNgwmrfZG1E2P9LOSy2zJiaYwDD5XpHmOAknopxTMMuNz0+xOt6fkzaedkwESRSdKR5QvaGkdtAoikdk9or0dusTUwijkZERUSllC9k06eTWj+p4pX6zGXnUSlnRP20TW1tF/gEYcpnuqoq5OYojzxMbULCoAHNe6CXs0fyGi7DO6027HSg7uJ7tJ4YswAYD7DlcAYr9UzB8iZtRfyjZUcJDmV2cHhdzffvMVqVo3ewY89p7JrQI9CgKMVUZ+wo1LrpmpS0lcQCbRKspNUkZJiQQ3y/21iArDZ6GDJrr4IZxp3bsWzJmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsR+igVlEki5ECiwuUBJXanZp1JdrJPkSkEalx7CJIA=;
 b=hhx6h+kdX/Prc/R3mkJfHPTeKzAl3AOHRea2zeSaKYt9PuuDHx2QzbQiKnlZ/e/MTF9dJSYgaSQgltAIigeiEOn+XS8axwLTBGyRuXuiG/DUA3CJJUBLr3c1YHo4Oiid2/Cbv7fayjN684NZYzUzxP/1096ugg5ohifC+3aTHWBEQYTw+1KrN0Lv6mS4nDeKbHlIDemThrlZNS67LWos+jvdWQc7mYiZ7Ju8uD5PkOUHpn9p0trGhYPgFRld/RZmbfIYljec2P5AdDvNQ1AD4fK+MH3EGT+qerr4hoaIg1P4IlubbqmNjD5bbZ3e/xUxcn1dmCcwxE17lDLMhBT1Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.87) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsR+igVlEki5ECiwuUBJXanZp1JdrJPkSkEalx7CJIA=;
 b=mGD0Kq8ke3FdmGTcY5M5rq4PnlIFwnZvy1mTsxnHu60j5USw2cG15Yc+oOqd2OW2UiUILW5r4TSkNcQIhn5oYZm5SjTtC7OXMatROYjrtsNbwhPUzWvjTh3BmzFG49i0oyBHoGpLyYS8/B97P5iK4xxikInO+33z/y4crjg4aPAelwJYsVN1lAU28doKCNW+ifNwhF1LTxYU0KiknDJAOJcMt71cQUoTmis9eTWsF9EmsHjivuFguyyn+DtecfbYfvCDfduknquAFrdrQKHIkA48HT5RUGPNk6YkCuD1gqfnILGFJOGqGkKhTo2Ind5QC3Jjub3zmfhaCxRU5JJ/AQ==
Received: from PA7P264CA0525.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3db::8)
 by AS5PR10MB8124.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:677::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 10:19:48 +0000
Received: from MAD0EPF000008AF.eurprd04.prod.outlook.com
 (2603:10a6:102:3db:cafe::9d) by PA7P264CA0525.outlook.office365.com
 (2603:10a6:102:3db::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 10:19:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.87)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.87; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.87) by
 MAD0EPF000008AF.mail.protection.outlook.com (10.167.241.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 10:19:47 +0000
Received: from ENXDAG1NODE4.st.com (10.75.129.197) by smtpo365.st.com
 (10.250.44.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 3 Sep
 2026 12:21:43 +0200
Received: from [10.48.86.251] (10.48.86.251) by ENXDAG1NODE4.st.com
 (10.75.129.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 3 Sep
 2026 12:19:45 +0200
Message-ID: <bf8e7888-1917-4ddc-9a6d-20490835c742@foss.st.com>
Date: Thu, 3 Sep 2026 12:19:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Marek Vasut <marex@nabladev.com>, <linux-phy@lists.infradead.org>
CC: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
	Christian Bruel <christian.bruel@foss.st.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Neil Armstrong"
	<neil.armstrong@linaro.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
	Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, Vinod Koul
	<vkoul@kernel.org>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
References: <20260902141312.649406-1-marex@nabladev.com>
 <20260902141312.649406-2-marex@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20260902141312.649406-2-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To ENXDAG1NODE4.st.com
 (10.75.129.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AF:EE_|AS5PR10MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: dfca4c9f-54bf-4386-fbb4-08df09a4e1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|13003099007|56012099006|10067099003|22082099003|4143699003|11063799006|18002099003|18092099006;
X-Microsoft-Antispam-Message-Info:
	adfew+WHyFp8Id6Yi1xG3NTCANTZVr6SDo6BV6mBwGL91uqaJHhnrHA63RWoUWYq7LMU6wfxjO2TVTFE+46IHbmtxy3clLZoonJHo4yU89pE507S7qhOIeiw6Bt00PRLcNY3ACFhQF4wvYyZ8x5gb7eaNBM04LxAVPpatCM2E7jAHBBM9jAKbkBpIj1o/6cqT+AnObs9YaPAlyiBDoTLgsnT9o704JuoKekWRt8rTNLFUB12SvCNR9yAMB/ePzs4xtR2NCKmnpAsoW79g0b429EyXAAeQdCgdOvBm4ICscuMh9+cQ1VDShrjJ1GyASq5NwhVnYqLzZddp4SU2n+OmfCvdbio4lmNjOhwsAWvd6idXxSfWq2ZOYNe+Mtk8TBlYKnGHT7LPM44nf4cWGYiK1z8p69jgh8Pk5rT5C4dku1zp4mAPijbXG+bh/CCTTlkce1nJqgF3HHQ1qQrkbycyuQe6UIraNAPJqV3kdB+NoLFazs+MQKXWwK008zPZFHXhlotnJx5PoWPnDaH7+A/tlpEHZzpbSfseQLIwHbmIHpS1ycGg2Yy540Zo7gnAupRTUNFgll49dFb+UMpLGciHXuG1DxaiL/PLKHCPz/NUYe08p/dWjvSXjIzfpz/kvJbPRqjHUER51VqhrZAMgBOLHFF+LD9dYZfmx8jBQsOgKySA+cxbZ7R/QSQDiYBquKkg6KVNEJt6Kl1dA1NO3OcLA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.87;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(13003099007)(56012099006)(10067099003)(22082099003)(4143699003)(11063799006)(18002099003)(18092099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qH1t8aaxGCjfZLEFveWoeFKXiVzOlrLSnWtpKHJzdJXMkPh9o7der3bdMe55TTlrlHD3WHekuW2eP9hqRvePe7tpHJteqXnIvLcbtzSL83/b8TMQaVMAMgxE62+juxmOPi9G8eE2V1p/A9tOhAI2+QHRXzbyGnSABdaDRvLuzZEPgS2GXaZU3rfYpBufHDxp/6+UtY5NNQspBtvEJ27aT25GDpjKnvrsb09wKKLU7LE4CChpZBUrUTcTPfqC3iAU/oWqiT+ar8RDZJ/AdbMv+uHz6Ia5W4xC2kqlVPEX86JOkezsEjq+l41xm4GF47O1pyVDxjN/Ib6x1QNLR7owbzKZKDogTusaqpdEi12/McB5/qMmO2OzY6m+ytClC1kE08FxDLApEmJ1M32NBd7zhFJ5ipY5giOV11IDaK47X3LJ5Rkrj5GpcctTPGlBsZWo
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 10:19:47.5098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfca4c9f-54bf-4386-fbb4-08df09a4e1b9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.87];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8124

On 9/2/26 16:13, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
> 
> Add USB2 PHY driver for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string
> to discern them.

Hello Marek,

I'm not sure if/how this fit with all below tags. For all the
contributions you've made, you can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

BR,
Fabrice
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
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: - Fix up Sob/Cdb lines
>     - Operate PHY as a syscon subnode
> V3: - Update copyright years
>     - Register two sets of clock, one 480 MHz PLL and one CMN
>     - Split PHY ops per PHY, since the PHY2 does not have set mode ops
>     - Fix up Sob/Cdb lines further
> V4: - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
>       https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
> V5: Cache both PHY mode and submode
> ---
>  drivers/phy/st/Kconfig             |  10 +
>  drivers/phy/st/Makefile            |   1 +
>  drivers/phy/st/phy-stm32-usb2phy.c | 409 +++++++++++++++++++++++++++++
>  3 files changed, 420 insertions(+)
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
> index 0000000000000..e173557a3cb59
> --- /dev/null
> +++ b/drivers/phy/st/phy-stm32-usb2phy.c
> @@ -0,0 +1,409 @@
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
> +	int					submode;
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
> +	phy_dev->submode = submode;
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
> +		ret = stm32_usb2phy_set_mode(phy, phy_dev->mode, phy_dev->submode);
> +		if (ret) {
> +			stm32_usb2phy_disable(phy_dev);
> +			return ret;
> +		}
> +	}
> +
> +	phy_dev->is_init = true;
> +
> +	return 0;
> +}
> +
> +static int stm32_usb2phy_exit(struct phy *phy)
> +{
> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = stm32_usb2phy_disable(phy_dev);
> +	if (ret)
> +		return ret;
> +
> +	phy_dev->is_init = false;
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops stm32_usb2phy1_data = {
> +	.init = stm32_usb2phy1_init,
> +	.exit = stm32_usb2phy_exit,
> +	.owner = THIS_MODULE,
> +};
> +
> +static const struct phy_ops stm32_usb2phy2_data = {
> +	.init = stm32_usb2phy2_init,
> +	.exit = stm32_usb2phy_exit,
> +	.set_mode = stm32_usb2phy_set_mode,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int stm32_usb2phy_clkpll_prepare(struct clk_hw *hw)
> +{
> +	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
> +						     clkpll_hw);
> +
> +	return stm32_usb2phy_enable(phy_dev);
> +}
> +
> +static void stm32_usb2phy_clkpll_unprepare(struct clk_hw *hw)
> +{
> +	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
> +						     clkpll_hw);
> +
> +	stm32_usb2phy_disable(phy_dev);
> +}
> +
> +static unsigned long stm32_usb2phy_clkpll_recalc_rate(struct clk_hw *hw,
> +						      unsigned long parent_rate)
> +{
> +	return 480000000;
> +}
> +
> +static const struct clk_ops stm32_usb2phy_clkpll_ops = {
> +	.prepare = stm32_usb2phy_clkpll_prepare,
> +	.unprepare = stm32_usb2phy_clkpll_unprepare,
> +	.recalc_rate = stm32_usb2phy_clkpll_recalc_rate,
> +};
> +
> +static int stm32_usb2phy_clkcmn_prepare(struct clk_hw *hw)
> +{
> +	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
> +						     clkcmn_hw);
> +
> +	return regmap_clear_bits(phy_dev->regmap, phy_dev->cr_offset,
> +				 SYSCFG_USB2PHY2CR_USB2PHY2CMN);
> +}
> +
> +static void stm32_usb2phy_clkcmn_unprepare(struct clk_hw *hw)
> +{
> +	struct stm32_usb2phy *phy_dev = container_of(hw, struct stm32_usb2phy,
> +						     clkcmn_hw);
> +
> +	regmap_set_bits(phy_dev->regmap, phy_dev->cr_offset,
> +			SYSCFG_USB2PHY2CR_USB2PHY2CMN);
> +}
> +
> +static const struct clk_ops stm32_usb2phy_clkcmn_ops = {
> +	.prepare = stm32_usb2phy_clkcmn_prepare,
> +	.unprepare = stm32_usb2phy_clkcmn_unprepare,
> +};
> +
> +static int stm32_usb2phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct stm32_usb2phy *phy_dev;
> +	char *pllname, *cmnname;
> +	const __be32 *offset;
> +	struct phy *phy;
> +	int ret;
> +
> +	phy_dev = devm_kzalloc(dev, struct_size(phy_dev, onecell.hws, USBH_NUM_CLK), GFP_KERNEL);
> +	if (!phy_dev)
> +		return -ENOMEM;
> +
> +	phy_dev->dev = dev;
> +	phy_dev->submode = USB_ROLE_NONE;
> +	dev_set_drvdata(dev, phy_dev);
> +
> +	phy_dev->rstc = devm_reset_control_get(dev, NULL);
> +	if (IS_ERR(phy_dev->rstc))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->rstc), "Failed to get USB2PHY reset\n");
> +
> +	phy_dev->phyref = devm_clk_get(dev, NULL);
> +	if (IS_ERR(phy_dev->phyref))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->phyref), "Failed to get phyref clk\n");
> +
> +	phy_dev->vdd33 = devm_regulator_get_optional(dev, "vdd33");
> +	if (IS_ERR(phy_dev->vdd33))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->vdd33), "Failed to get vdd3v3 supply\n");
> +
> +	phy_dev->regmap = syscon_node_to_regmap(dev->of_node->parent);
> +	if (IS_ERR(phy_dev->regmap))
> +		return dev_err_probe(dev, PTR_ERR(phy_dev->regmap), "Failed to get regmap\n");
> +
> +	offset = of_get_address(dev->of_node, 0, NULL, NULL);
> +	if (!offset)
> +		return dev_err_probe(dev, -EINVAL, "Failed to get regmap offset\n");
> +
> +	phy_dev->cr_offset = be32_to_cpu(*offset);
> +
> +	phy_dev->hw_data = device_get_match_data(dev);
> +
> +	phy = devm_phy_create(dev, NULL, phy_dev->hw_data->phy_ops);
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy), "Failed to create PHY\n");
> +
> +	phy_dev->phy = phy;
> +	phy_set_drvdata(phy, phy_dev);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(phy_provider))
> +		return PTR_ERR(phy_provider);
> +
> +	pllname = devm_kasprintf(dev, GFP_KERNEL, "clk_%s_48m",
> +				 of_node_full_name(dev->of_node));
> +	if (!pllname)
> +		return -ENOMEM;
> +
> +	cmnname = devm_kasprintf(dev, GFP_KERNEL, "clk_%s_cmn",
> +				 of_node_full_name(dev->of_node));
> +	if (!cmnname)
> +		return -ENOMEM;
> +
> +	phy_dev->onecell.num = USBH_NUM_CLK;
> +	phy_dev->onecell.hws[0] = &phy_dev->clkpll_hw;
> +	phy_dev->onecell.hws[1] = &phy_dev->clkcmn_hw;
> +
> +	phy_dev->clkpll_hw.init = CLK_HW_INIT_NO_PARENT(pllname, &stm32_usb2phy_clkpll_ops, 0);
> +	ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clkpll_hw);
> +	if (ret)
> +		return dev_err_probe(phy_dev->dev, ret, "Failed to register PLL clock\n");
> +
> +	phy_dev->clkcmn_hw.init = CLK_HW_INIT_HW(cmnname, &phy_dev->clkpll_hw,
> +						 &stm32_usb2phy_clkcmn_ops, 0);
> +	ret = devm_clk_hw_register(phy_dev->dev, &phy_dev->clkcmn_hw);
> +	if (ret)
> +		return dev_err_probe(phy_dev->dev, ret, "Failed to register CMN clock\n");
> +
> +	ret = devm_of_clk_add_hw_provider(phy_dev->dev, of_clk_hw_onecell_get, &phy_dev->onecell);
> +	if (ret)
> +		return dev_err_probe(phy_dev->dev, ret, "Failed to add clock provider\n");
> +
> +	return 0;
> +}
> +
> +static int stm32_usb2phy_suspend(struct device *dev)
> +{
> +	struct stm32_usb2phy *phy_dev = dev_get_drvdata(dev);
> +
> +	if (phy_dev->is_init)
> +		return stm32_usb2phy_disable(phy_dev);
> +
> +	return 0;
> +}
> +
> +static int stm32_usb2phy_resume(struct device *dev)
> +{
> +	struct stm32_usb2phy *phy_dev = dev_get_drvdata(dev);
> +
> +	if (phy_dev->is_init)
> +		return stm32_usb2phy_enable(phy_dev);
> +
> +	return 0;
> +}
> +
> +/* STM32MP25xx USB 2.0 PHY attached to USB 2.0 Host controller */
> +static const struct stm32mp2_usb2phy_hw_data stm32mp25_usb2phy1_hwdata = {
> +	.phyrefsel_mask = GENMASK(6, 4),
> +	.phy_ops = &stm32_usb2phy1_data,
> +};
> +
> +/* STM32MP25xx USB 2.0 PHY attached to USB 2.0 part of DWC3 controller */
> +static const struct stm32mp2_usb2phy_hw_data stm32mp25_usb2phy2_hwdata = {
> +	.phyrefsel_mask = GENMASK(14, 12),
> +	.phy_ops = &stm32_usb2phy2_data,
> +};
> +
> +static const struct of_device_id stm32_usb2phy_of_match[] = {
> +	{ .compatible = "st,stm32mp25-usb2phy1", .data = &stm32mp25_usb2phy1_hwdata },
> +	{ .compatible = "st,stm32mp25-usb2phy2", .data = &stm32mp25_usb2phy2_hwdata },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, stm32_usb2phy_of_match);
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(stm32_usb2phy_pm_ops,
> +				stm32_usb2phy_suspend, stm32_usb2phy_resume);
> +
> +static struct platform_driver stm32_usb2phy_driver = {
> +	.probe = stm32_usb2phy_probe,
> +	.driver = {
> +		.name = "stm32-usb2phy",
> +		.of_match_table = stm32_usb2phy_of_match,
> +		.pm = pm_sleep_ptr(&stm32_usb2phy_pm_ops)
> +	}
> +};
> +
> +module_platform_driver(stm32_usb2phy_driver);
> +
> +MODULE_AUTHOR("Pankaj Dev <pankaj.dev@st.com>");
> +MODULE_DESCRIPTION("STMicroelectronics Generic USB2PHY driver for stm32");
> +MODULE_LICENSE("GPL");

