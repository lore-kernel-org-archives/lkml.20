Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010038.outbound.protection.outlook.com [52.101.69.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546693AA1B5;
	Thu,  1 Oct 2026 18:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790880377; cv=fail; b=YmOl3BrSEuXgjO6LstPIl6RS1DuWW9/f/CiDZpaqERWx0RUIpWISNjGPEfB5DCyCbW0Dn5VEMEKn6cp6aYIjipqMZFLMUAN3ilXPA6Rg/UogLYM/1aB6W9l3gBBvqDxpLHokU59b3m59cMDKM57mgcHShLNTCBlAfXZruEwi1+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790880377; c=relaxed/simple;
	bh=ERs5SL3TsTTE1VhnnltM69sndrGT04JxYCOWltrat2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=URaDHNBT4n53cZMk8RVzVvimttOp+Wrxw6/wW1PdPLrROd3jRpefXnjs77H6pCxL0QekbBlMv+h8dGNOPYCxTLM+wdDzDcS5V5h+ELz01Y6eauauvkKZnRoow7EN0mdi8zvUaWPlpjnW0DKs5wVKb2F4unNJ3cwtOjyGm32HXtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F2NrufvC; arc=fail smtp.client-ip=52.101.69.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F2NrufvC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZyottC7Vpj8W3VTpF0jNfsi2SSeDyvH+ZM+ItYepqMGNGW/cnSVnzAYblgpFU+PodriinjyGgjWk7Nlp/h4tQA6zHapQA+qTVmcdqHB21CNc8h6uobMQU4DAXKCggLmg8FTIJ4ld6kJjXAfauu4i0COpPgNHSWhPTpYFOxUaMxc5hylGORA1KwoYndtLXlcAR6u/Us7twYXM/xpDtJSsOowNcD0S+WTTbKG5FLWpGRkCLKla5JCfN+kVg/E72tURxnJ0IQNrujq/zcmrAnaepQITBY7EvORB/qawdBNhWh1xs8ytar446wYsGWlBmJWZwVRmiN/y4LuKS0l/72oWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaDo5OWKQhwAoUGaCMcJZ0PLpU0cWGTMpXI4HjSBWNc=;
 b=pwtgdUY7zaCO4RnIIFW65xcgJfWUafTw/zKvaTUK/8JU3Ww8hAbZnghfTZJORg6heikTnNrVmDqNsFQnAOtDF7e6+tuESkPfR2j42PjroDdoFW/B3DL2W3YFXUMz+VK/sLuaMdkV4niGdQSTbnVA5nrbRlUX/M7xgujMmmDfPJWNabW/NuTBE/hqPf77MhVupMr4HW6e0Aqhiu1pgjhZuebQuFGN4GmXawt45ZPNTW2retbAqVj+gZj7AkMGnRPzGuIAFmUHrcwbMHkqGin/NslvzZgjzcLJxTC+NB5m9z86F7zhtLoIF1ZZ7QYpM9OyzuXCKv8vvZCddxmmNjQQTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaDo5OWKQhwAoUGaCMcJZ0PLpU0cWGTMpXI4HjSBWNc=;
 b=F2NrufvCCkC/xQRCoXUF3mxZPEPO/BZUCOGwPuSnuI5SUIwVg/ADJbExsiTR9N1hlb9JLHR7kA4s+g/XQiK0s5SGHEnUzBwjfZ7i7m+s5ZIvIz5e5IKjKlRgznNa4gBLGGxPb/U82zx29F2Pby/rBFBxY9TJ36XkKebL2No6o4sU2gXEieMl/CKC9Peo4g+WDoAEPdr/zsk2VlkZOb8O889ebxHGzgjksMw9vg7V42YRUwmE+5QhObCXEUPUmjX9d/GUydKwa4TBLSbs2v7+mF+SbmsbjVWo7KfvgHe8dBhHtnJZo4yqLAqhLrFV1CCV05tdZmeqqAktRBPgqssijg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB750000.eurprd04.prod.outlook.com (2603:10a6:290:82::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 18:46:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 18:46:07 +0000
Date: Thu, 1 Oct 2026 13:45:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/7] ARM: dts: imx6ull-colibri-emmc: Add Toradex
 Capacitive Touch Display 7" Parallel
Message-ID: <ar6qZWSxFg1zbqKI@SMW015318>
References: <20261001174924.3831455-1-francesco@dolcini.it>
 <20261001174924.3831455-5-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001174924.3831455-5-francesco@dolcini.it>
X-ClientProxiedBy: CY5PR14CA0005.namprd14.prod.outlook.com
 (2603:10b6:930:2::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB750000:EE_
X-MS-Office365-Filtering-Correlation-Id: abcc1cad-afe5-4c54-435f-08df1fec40e8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|366016|376014|23010399003|10067099003|56012099006|4143699003|11063799006|6133799003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	uRGWx6QsPOIx+QTXIghvIfJ02tt+2zGbJ6uKJt0r5DLkGvU3LmI4MuNUTCykDpw2Y4zkzShu2E0XxLYn+tww2bDEUIx+XYSazNARMojKH7Lk1+uDL7XIRhaR8CxQiGeM6ZTyYZJv99lIKs+uEq+xxlDjkj9weJA0btXHzVhDh125mkBK5YeJFOaDL58iYpaMkZPZR4sW29h0qxjCUUrxiV7neKeoUFKrnPEmweCfRCX4aDuQuscV3B4LD/qQEshd8yrOXnn0f/IfOi62alzlWfYgkxSHqRygb58MTIxapfn3Tdm5FkQLs/A0ChStpZ8HQN6z/3nJLtSrYB0c3vBp5TupIK7iah5nwoYIRL+Fbufo1FOEoUHOY+9L273/Kwzjolg1tzhvoeXVkpHipeaxYNWv4DPR0/twk2728wvOfN8c1y3AjoOYsCNZpMrT6Il8VLquVn0Ib/3q/vP7HUnZ9X1TjesJiFIO1e/gMItGCrexCxOKvW+WaV4helqwvjY3ihnq4NA+9B5Xo4Zh2dTaBUrHRBncSANoMRWpo2rswqssXJYMnD0U6qtK5Uvxt5bmkn7oPvxWP70BTdumsWrf7f2kHZ73RPt7AGmBqVV8oGJy6JUdOJAJBHj4Ssmk25hY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(366016)(376014)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DWR8nCzEPUn7aHn4mkIm70+u5MPsjYvCfuedU8jGRgIk8E18J16brvCKdZHX?=
 =?us-ascii?Q?0wcpq5d36497jW2bA39IDU0YtR4cHoy9C+ISGXDVbKclNmX/SodBEcTOgZzS?=
 =?us-ascii?Q?eMaJvuRptZshI42/Q3qk7EfebldN/u1QXE+OlFua778JplGF6z2vy/NpUa2b?=
 =?us-ascii?Q?dZ4Y8rYxcGW7ZtGLKHOojVHbjPVAwCp7bv/wJaoQov65fN/tjrj+0Nyh8PAD?=
 =?us-ascii?Q?fNGQoey72RM02ttkqq98g/Qu0hVgdS+nxxeq+2Cd9prtk0xVyNp9gXUcxey1?=
 =?us-ascii?Q?465WMA/AAbdEh4luGpyl7czeI99XfwAzixONOSL4VtDW8Zy1+kAJRtyZaEGW?=
 =?us-ascii?Q?Ogk8q+c9hg1GuuKMv8aphVLOzY+FGWhiNwWSHn9raiSxIXwai8EDUApm7BEV?=
 =?us-ascii?Q?yV/8tAYN17pt95i43zKHh4QsZLJ32fHGKYIVPfYn10qdmtNq48lGXjUp7VXf?=
 =?us-ascii?Q?5/k71qN0uCBkNdMVRRa0emX5EYM882l1SQOe5B0IqUeKb7fW8vum73D8FTTC?=
 =?us-ascii?Q?NLKfb/ZsUqyno8S6eRSHv3tji/AZdkEVHdqMc2AyZ5x+9m+dDwyP3PAXINg/?=
 =?us-ascii?Q?cvit7ollw3RYLwRdzSQh12CcHFgLDSQTkgrJz5EiHVd7tHC0KHnhez95WMBv?=
 =?us-ascii?Q?ylVIUSrdVQl3qiCnINkxHpXw7KFImzEcDO0qf/MrrHwfHWN3fY/62uzenqHK?=
 =?us-ascii?Q?/0PRPtmJD4fHo7YCBGSUSYuhge7SzwDp7uFCPoomlkOxrdLCDTtmqh9voXFO?=
 =?us-ascii?Q?LDWP6H29HhESGn/2cTxfAwLKq/ovyk/ebYLOlC3VLriPixxG8LInG45X3erw?=
 =?us-ascii?Q?Xc7WZmhXpriIdhXT2S83nr0/Moz3W+k3+4fBpXtx2mPKfh9ZD4tCE2/X7vvm?=
 =?us-ascii?Q?kZOInPYLcegla4JBkAlozkpTX5yUkKz7W8zCoqvNvX6bS3MsLShMPsFvCeoJ?=
 =?us-ascii?Q?xn1zTBl8yPaHEePshM9AvL1Ud/hSggJ8BleXZN2Ww+UxGl/s4BIH2NT1EbPZ?=
 =?us-ascii?Q?zCX4H0giM2uCOZLCOAm6Bjzu3xZgz4CCpuXJ8al9A26S9dAHAsSWKnLoq4g6?=
 =?us-ascii?Q?SRX7BTd7RtL0NWjmrj97/j3Oydqvi2DmTiWMlBIo1OxYXrHAd9laMv6P5/Xk?=
 =?us-ascii?Q?VaxcoOk58H7T7yo2capfWQsHsOrqmkGF6Gt+XxoDGrQCYhOP2G1OVwejZEmE?=
 =?us-ascii?Q?dGJS2gUxbMRs5r39JimEAnid5D3yUZWx/uHn0tMRkTiS/cjBerhih1XZRRnT?=
 =?us-ascii?Q?wDxcHGiyWVzqaGUvX5WkFLBVjkvmgfjESNPZRX1979QrDpIiSm2Ri9DutZ2W?=
 =?us-ascii?Q?/N1nl2jR0U68XIxFNhfwCGry4HpAFeyzGSu0JCCj0wemrJB7EFp+TbsghgCA?=
 =?us-ascii?Q?gujIi7k2N/rI3TEmvjlmgE2CUItvWAg4QkX4FpSCsPV/NrE8cjXX1WIt2hhx?=
 =?us-ascii?Q?eGCrmSfwTMRK/Mz5lFB4zAmZdWINURN6pHZoP3yg249je8tu/Bhu7u7CcDJO?=
 =?us-ascii?Q?/nHmMP2BU/ug4RNiwmmnbAXYm+emv86iUwbFbmuqdgJ3MCRkf2hdETecDTO5?=
 =?us-ascii?Q?MpuWZa6mvu4+Xm3qrfpUF0S9wxZBxC71WdWBzXmbjbdo61/IfuOirfbugGwl?=
 =?us-ascii?Q?mNXresDMg1I/hVRVaMKFYHqTP63GcFd4mDbOHXkmx5UkWyb27Mnmgrn5htw9?=
 =?us-ascii?Q?5BMqU3AgrdAYFbczZF3K5RlMqsKl7HfxiPpDdGiXE3UO4mBBOj3reoNEkkP7?=
 =?us-ascii?Q?JZ7liet2gmIqeVIW069Ke3Wv3HcHqENZqecQCyJapX07rFRdyhT0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abcc1cad-afe5-4c54-435f-08df1fec40e8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 18:46:07.5293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5qYOP546u0UnHGsFhN2bY1/mTxJsW5Qlcg4XrM9IFt/Cq5hsn3FrQq6ts1gvwS6LFcokEW0X1Hf9cmVHfkRDM8W/mlEoaqZJx/ATLUXCOAbo7yjAT/syHpxnWAs6sjdV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB750000

On Thu, Oct 01, 2026 at 07:49:13PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Add a device tree overlay for the Capacitive Touch Display 7" Parallel
> on the Colibri iMX6ULL eMMC parallel RGB LCD interface.
>
> The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
> and the touch input is provided by an Atmel MaxTouch capacitive touch
> controller.
>
> The touch controller is connected to the Toradex 10-way Capacitive Touch
> Interface connector available on Iris v2 and Aster carrier boards.
>
> The panel, backlight and LCDIF configuration is identical to the Colibri
> iMX7 eMMC one, only the Atmel MaxTouch controller wiring is SoC
> specific. To avoid duplicating it, rework the Colibri iMX7 eMMC overlay
> moving the common part to a new dtsi shared between the two modules,
> and include it from both overlays.
>
> The overlay is also combined with the Iris v2 and Aster carrier board
> device tree to provide a ready-to-use DTB.
>
> Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            | 12 +++++++
>  ...i-emmc-panel-cap-touch-7inch-parallel.dtso | 31 +++++++++++++++++++
>  ...olibri-panel-cap-touch-7inch-parallel.dtsi | 29 +++++++++++++++++
>  ...i-emmc-panel-cap-touch-7inch-parallel.dtso | 16 ++--------
>  4 files changed, 74 insertions(+), 14 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index 0aece8cc9fe4..eee3f4e8e7c0 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -352,6 +352,15 @@ dtb-$(CONFIG_SOC_IMX6SX) += \
>  	imx6sx-udoo-neo-basic.dtb \
>  	imx6sx-udoo-neo-extended.dtb \
>  	imx6sx-udoo-neo-full.dtb
> +
> +imx6ull-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
> +	imx6ull-colibri-emmc-aster.dtb \
> +	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
> +
> +imx6ull-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
> +	imx6ull-colibri-emmc-iris-v2.dtb \
> +	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo
> +
>  dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ul-14x14-evk.dtb \
>  	imx6ul-ccimx6ulsbcexpress.dtb \
> @@ -380,9 +389,12 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
>  	imx6ull-14x14-evk.dtb \
>  	imx6ull-colibri-aster.dtb \
>  	imx6ull-colibri-emmc-aster.dtb \
> +	imx6ull-colibri-emmc-aster-panel-cap-touch-7inch-parallel.dtb \
>  	imx6ull-colibri-emmc-eval-v3.dtb \
>  	imx6ull-colibri-emmc-iris.dtb \
>  	imx6ull-colibri-emmc-iris-v2.dtb \
> +	imx6ull-colibri-emmc-iris-v2-panel-cap-touch-7inch-parallel.dtb \
> +	imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
>  	imx6ull-colibri-eval-v3.dtb \
>  	imx6ull-colibri-iris.dtb \
>  	imx6ull-colibri-iris-v2.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
> new file mode 100644
> index 000000000000..2edf680b1884
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
> + * Unified Interface Display and 10-way Capacitive Touch Interface connectors
> + * (as featured on Iris v2 and Aster v1.1 carrier boards).
> + *
> + * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
> + * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
> + * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +#include "imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi"
> +
> +&atmel_mxt_ts {
> +	pinctrl-0 = <&pinctrl_atmel_conn &pinctrl_atmel_snvs_conn>;
> +	/* SODIMM 107 / TOUCH_INT# */
> +	interrupt-parent = <&gpio5>;
> +	interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
> +	/* SODIMM 106 / TOUCH_RST# */
> +	reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi
> new file mode 100644
> index 000000000000..21688c63d11f
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi

File name include lt161010, incase there are more panel.

Frank

> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Panel, backlight and LCDIF part of the Toradex Capacitive Touch Display 7"
> + * Parallel overlays, connected through the 40-way Unified Interface Display
> + * connector, shared by the Colibri iMX6ULL eMMC and Colibri iMX7 eMMC overlays.
> + *
> + * The Atmel MaxTouch controller wiring is SoC specific and is described by
> + * the overlay including this file.
> + *
> + * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
> + * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
> + * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
> + */
> +
> +&backlight {
> +	status = "okay";
> +};
> +
> +&lcdif {
> +	status = "okay";
> +};
> +
> +&panel_dpi {
> +	compatible = "logictechno,lt161010-2nhc";
> +
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
> index f336f7b05a2b..211acf11e438 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
> @@ -17,6 +17,8 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>
> +#include "imx6ull-imx7-colibri-panel-cap-touch-7inch-parallel.dtsi"
> +
>  &atmel_mxt_ts {
>  	pinctrl-0 = <&pinctrl_atmel_connector>;
>  	/* SODIMM 107 / TOUCH_INT# */
> @@ -27,17 +29,3 @@ &atmel_mxt_ts {
>
>  	status = "okay";
>  };
> -
> -&backlight {
> -	status = "okay";
> -};
> -
> -&lcdif {
> -	status = "okay";
> -};
> -
> -&panel_dpi {
> -	compatible = "logictechno,lt161010-2nhc";
> -
> -	status = "okay";
> -};
> --
> 2.47.3
>
>
