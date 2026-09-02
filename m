Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228D8247291;
	Wed,  2 Sep 2026 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788338428; cv=fail; b=UNVCRwhu+xCRwqfeX+UZCt4Fe7EdvUtuAXLonAQTX8ne9540+7IaEAXrQ/7fRu6ln3xEZC1/Q8Id18SMzZN4sOnpnyzKWvocEYLKQSbyUSg/htZO5IZuSJ6jzqfFbg83PdTwlhdYEWZd9zZMRKJz717ptCNYn98jmtrqXL645g8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788338428; c=relaxed/simple;
	bh=4DOGzD4AHoOmd3DSWc7pBptXiWdsE21FZ4/0S4TcoiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZKkMuejNi9OjytTRm1um5Dq9p89TpL2aoAp+71F3onKjz0cNJsCQul2C0zH+MLTcETWtee79WBnzEuzK9dd52yLrna2LjTAotoeAxo6ER17AfGsIFa9smpynsePQODc6OSKqUMF7ImcOna66YFEhYKWk1JIkFk2gX5ipmBT5cxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=WkzAdMzC; arc=fail smtp.client-ip=52.101.70.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="WkzAdMzC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aYj4j/Ijho0v77XaNFKz+nhIb6nvxBQFV3bYf2vd70EYqDDEi+eKJBCXQFLSpdwkYiYB2lQ1IC9WjfYX6TR/KsJ2OD1EnOjjTc0OrUsRDGLuAv39yK+PjmmVpUNe7M+F5Rm/Mg2NoFrEiOWfq4X2DIo/t4Yg+kdiUIVfv0S7pRTWhtS+CegyS4oxwwQzcpfsurEnIXdOtLHfcacX9jQt22cxGllIgMK5V5vsn5VXagInH/iYT/VphWAbDRCkC63blMtH0wBib1qpeRF5zJdW82xKxCzmp4YybyD/aRDXjEEF4KBFMQ70pj8Prhvcoj/RXbWdd/l6p4e4SZzILOq9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWYPh+K02Sj81HYwlPL7Q70Ej0xF9YoGW3RjRPkDer0=;
 b=ia3bRpf5K/gHDjWOw4jBmnCK7Qy9jkTAVeEdJYXMNTDFt6vNhvIPHjNpIJv3VJvug/1o9Y8M5EJ2wVtO/5ekHlsDBIOWQoiTS2FDFploMsNgfSiXb7NzqIk+mx6UJOoE5r1gX9NkXnegwYce2BEEvoPTGmEuZsuXoa59zRBJN6K4dhOnVHrqJFFBp+myRRyvMWIpctkRXmbpMkGG/PjurjdYp0A8T09NIyLlXQ+CZf49kaw3UAAtupwOIRXiYXXNI2VTtnbpbFy2nO3wi+SIg1HJz8o4HE4iVJRQOXufxol7axaIwPHPfzjpSBGoiinHyBeyvAQQ71ZHlm2oQPyQzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.88) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWYPh+K02Sj81HYwlPL7Q70Ej0xF9YoGW3RjRPkDer0=;
 b=WkzAdMzC3xD+7AVHj5l1+hhc88WupYoTwsfF/J87yHH5AUnIG3qwXgGh+eOk6mJyEsqzRG8s+pgEi3j0FIPQ+5L630w7RBZxpgM+q/B5h5bmQ8Yn8Bur8Pep6g7W+Hft4zTEQisYjYbvGagzK6igU+/dY//vt5fdrToZjJUH5FLRUyIEuP8J06gib7v5QIsUFNNHlTfBNTzIwyVB81KuNT/smtsput8NzADzSJ/qKO/XvlXk6dGFGavuiaRT1erP24bOGWufRh3ym7v7nB1fD9l0WGGAYd7GV/K/6Ityrn9Ms3GcrpOrbDzFm2IcU/FhMfrpvi1sNTTX6Oo726dd2w==
Received: from AM0PR02CA0163.eurprd02.prod.outlook.com (2603:10a6:20b:28d::30)
 by AS2PR10MB7801.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 08:40:18 +0000
Received: from DB5PEPF00014B88.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d:cafe::5c) by AM0PR02CA0163.outlook.office365.com
 (2603:10a6:20b:28d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 08:40:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.88)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.88 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.88; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.88) by
 DB5PEPF00014B88.mail.protection.outlook.com (10.167.8.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 08:40:17 +0000
Received: from ENXDAG1NODE4.st.com (10.75.129.197) by smtpo365.st.com
 (10.250.44.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 2 Sep
 2026 10:37:35 +0200
Received: from [10.48.86.251] (10.48.86.251) by ENXDAG1NODE4.st.com
 (10.75.129.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 2 Sep
 2026 10:40:15 +0200
Message-ID: <ccac83f8-be42-4400-8d8f-e584a1fdaf63@foss.st.com>
Date: Wed, 2 Sep 2026 10:40:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH v5 2/2] soc: st: Add STM32MP2 SYSCFG driver
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
References: <20260831231359.136475-1-marex@nabladev.com>
 <20260831231359.136475-2-marex@nabladev.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20260831231359.136475-2-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To ENXDAG1NODE4.st.com
 (10.75.129.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B88:EE_|AS2PR10MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f3e420b-011f-46fc-74d9-08df08cdd0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|23010399003|36860700016|30052699003|13003099007|10067099003|56012099006|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	oIU2qt16kUn3/l4+L+lnWBTSTCztUPvttYI3x8WkaL4GQ2bpY+D181xjyQCbzAKFYrz5f0cFDeOtdHn8FxM/PuZCR8aI9X1daJ+QKrDNgQ+bCpFQCmJG0k3oxEzWhXqqa7cS5WJeVZIFrKglgM8Nw+nz45iqYe/iMkdiDzXPl4GAogTunscw4s5jq7YxlLG02JlmkuNLBxNcE/AWlZDLnkfcezQsEKamjmcdNI+WhFe6c4bMMyVCNe/pl6MSk5j8evQRS1lPi1rIgdMSUisPRayjZyICDBqs01THdJ/p8zqGpnszK/hQ77uP3Gc8u3BQjdMX9FQmR+vyhTIBwU3sOJkSS9Jm/bGuP2u/iKtkBQsMuSA3kWbfdfrswkBhtQyyFzw7XfficEOkqCVCHFge4yQOz+3/d5f51BWihGcsZivd43MkXocqKD65UGihvLZqBYEEeISQyeABOvL9EufYLjXWxHQabUSC2IoJ2sZOg1eJ8EnuXsu0LStmt6lkzESFrgcMjxw0rUYRQ9zLiMV+qXhg4O5bXRz79xMDqmVKRilZF28jt5L3VFYwOA7I6Xti64dcytxDJzfKfkcT6h4VDfscT5StAUT+A/y1CFSRuxQpR/JcxXyzy4bMBV05WjoV/bHbyKSu9YtK9vqi6ZvXBA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.88;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(23010399003)(36860700016)(30052699003)(13003099007)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3aaV87Os7M+oqdLdLDG/qgd7Ho6ca+TZbD6UpBE18A/LISYvJ7DNATHyFs2BhSn0AxJInPEIkO20IutQJKORZvwlOOXcouCGXueof/13FgcWJlKePLTZSO660nwtv9BN4+RvfwAaiZT8/KC6k0fT/wiNveggBOZj1GgsDB14xfTpLOzCc3V2v22Vz1/QfTMogNPy9B0sZmgZJ1YAmUe5xuUonSrdeiomKP3u9EhQ/nK5GlwgxOd+D9PdV69wxHiH8mtEBojch9hDLB1urgKxw3IJ7ziQw1bjm22puSzY5+0+fZRveP7ijGME3fDyOEpAYCpjIZlO8dvdYhE9dIuVP4YmDFf5XgFcmtgbXyWi4A8vKFuWwDKygt98eOPZsmVdUgvOU2YXARRJouL3i92qJUb9KKnZcrvCi23cJwUl6aHmXXyUJHXKycXemsCGJMNc
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 08:40:17.1611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3e420b-011f-46fc-74d9-08df08cdd0b5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.88];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B88.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7801

On 9/1/26 01:13, Marek Vasut wrote:
> Add trivial SYSCFG driver for ST STM32MP25xx, which binds drivers
> to its subnodes. This is currently used to bind USB PHY drivers to
> subnodes described in the SYSCFG DT node.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marek Vasut <marex@nabladev.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V4: New patch
> V5: No change
> ---
>  drivers/soc/Kconfig              |  1 +
>  drivers/soc/Makefile             |  1 +
>  drivers/soc/st/Kconfig           | 12 ++++++++++++
>  drivers/soc/st/Makefile          |  1 +
>  drivers/soc/st/stm32mp2-syscfg.c | 33 ++++++++++++++++++++++++++++++++
>  5 files changed, 48 insertions(+)
>  create mode 100644 drivers/soc/st/Kconfig
>  create mode 100644 drivers/soc/st/Makefile
>  create mode 100644 drivers/soc/st/stm32mp2-syscfg.c
> 
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index a2d65adffb805..dfe5cec592626 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
>  source "drivers/soc/rockchip/Kconfig"
>  source "drivers/soc/samsung/Kconfig"
>  source "drivers/soc/sophgo/Kconfig"
> +source "drivers/soc/st/Kconfig"
>  source "drivers/soc/sunxi/Kconfig"
>  source "drivers/soc/tegra/Kconfig"
>  source "drivers/soc/ti/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index c9e689080ceb7..894bd6ebaaa4d 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -30,6 +30,7 @@ obj-y				+= renesas/
>  obj-y				+= rockchip/
>  obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
>  obj-y				+= sophgo/
> +obj-y				+= st/
>  obj-y				+= sunxi/
>  obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
>  obj-y				+= ti/
> diff --git a/drivers/soc/st/Kconfig b/drivers/soc/st/Kconfig
> new file mode 100644
> index 0000000000000..2a9d6a77be450
> --- /dev/null
> +++ b/drivers/soc/st/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "ST SoC drivers"
> +
> +config SOC_STM32MP2
> +	tristate "STM32MP2 SoC family support"
> +	depends on ARCH_STM32 || COMPILE_TEST
> +	default ARCH_STM32 && ARM64
> +	select SOC_BUS
> +	help
> +	  If you say yes here, you get support for the ST STM32MP2 family
> +
> +endmenu
> diff --git a/drivers/soc/st/Makefile b/drivers/soc/st/Makefile
> new file mode 100644
> index 0000000000000..5ca313476ca93
> --- /dev/null
> +++ b/drivers/soc/st/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_SOC_STM32MP2) += stm32mp2-syscfg.o
> diff --git a/drivers/soc/st/stm32mp2-syscfg.c b/drivers/soc/st/stm32mp2-syscfg.c
> new file mode 100644
> index 0000000000000..102430f258606
> --- /dev/null
> +++ b/drivers/soc/st/stm32mp2-syscfg.c
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0

Hello Marek,

I think this header is deprecated:
https://spdx.org/licenses/GPL-2.0.html

Suggest to adopt GPL-2.0-only
https://spdx.org/licenses/GPL-2.0-only.html

With that, you can add my:
Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks & BR,
Fabrice

> +/*
> + * Copyright 2026 Marek Vasut
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +static int stm32mp2_syscfg_probe(struct platform_device *pdev)
> +{
> +	return devm_of_platform_populate(&pdev->dev);
> +}
> +
> +static const struct of_device_id stm32mp2_syscfg_ids[] = {
> +	{ .compatible = "st,stm32mp23-syscfg" },
> +	{ .compatible = "st,stm32mp25-syscfg" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, stm32mp2_syscfg_ids);
> +
> +static struct platform_driver stm32mp2_syscfg_driver = {
> +	.driver = {
> +		.name	= "stm32mp2_syscfg",
> +		.of_match_table = stm32mp2_syscfg_ids,
> +	},
> +	.probe = stm32mp2_syscfg_probe,
> +};
> +module_platform_driver(stm32mp2_syscfg_driver);
> +
> +MODULE_AUTHOR("Marek Vasut <marex@nabladev.com>");
> +MODULE_DESCRIPTION("ST STM32MP2 SYSCFG driver");
> +MODULE_LICENSE("GPL");

