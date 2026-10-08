Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011022.outbound.protection.outlook.com [52.101.70.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3125443C36;
	Thu,  8 Oct 2026 08:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448200; cv=fail; b=nnRJHO7HD8bmrc8IzahuEHslF5tRC9ly8B205nLZWE0wffCsla9JY/0P5hxJLnB6DCBHdryX9GTu2SX2WpFTOrbj66N75vXbOkqt9sccldlU5xNyEL+fl5dCwS7yMW/DFUlKDRBQ9tkCsmT8OzWyNoll+z5gHAzh147XxNyrZWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448200; c=relaxed/simple;
	bh=2KD/iatVRnNEwI/6BZqhlJPnLhx7TFhAqwIRZ3a/kBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YfBEWYGa7M1E/HItNtX7RA+yOY8T2HEOnqFSfr0vWGgUmfMDXWTBGpWGYjFDGdziz94fVa3DMiBZU45ymmXDjRN/1/ZgKdvcHL3C5zVkbxv8tzH3BC4khzxg6oR3bw16onToQ3EHQ4c8yymE7TDlLIFMgBzC2yFr8SnF0zUsS4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bnB1vOB2; arc=fail smtp.client-ip=52.101.70.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bnB1vOB2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wflM5wu3cnc7eGFXuQ2UrPECcJwPabW8gV7+xNfA/yssuewpBrAB9NGmrDKOX12TLWk6OLA8K+B51dCiKM6kQ4iPt3fPU6nttcx+M236r58mx+0QcJp2AcdZH/OdbICN/pJzyRG6sXPFn/QaD2CCIRM6xbo0SUlc8dKSMVj4GfM1+azipIhmgNXwmrNj9k3op5u1vCRockIJxFDbfQ2CO2tQyvvTucBP13od9SsnSQNNFa2CNa0lYPPqtNTlySkZAxBvUgn1F+YHqbSy2VG3bBvaB9X6V3q2G0hbIKYvWl61Wsz2nM0ROkbj1CehA6JKrMwe5QDl/nH57Rfwo8sYhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBX5PEpOUG9f/ZtfwwOKPTI4tk+94k8hqW4pxy9kT9k=;
 b=BY2MXwlL73uK1QZVl6RI9Eb9ENlZxIB7L7poJj+yWr2KgbAmMPnrLJ0dZgT9YUSmOrK7G/HAgwWejzjYeVOwtBTZLVWe67WfPhbEcA8EMPrWZnrhSY2frljRYJ1IOfREhPRRfwYEQUD6CNf2wLmHvxxsWvY3M3DSUmBs3p9qP9GWXXeTLV168x28CrNCXeV2iaWI8Y6iVFCCr0Y6vQzNvIDuImT0oreySPQTRXrF7PNzHIloTZ2skMOsSPjnFMga+24cT6KYY2CbjBVdT2Kaqj9519A6qmgukZIFrDNKO6PbKdJSnYODYQc+77Av6E+E7D9DfsJ7mOcX6NasVH9D5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBX5PEpOUG9f/ZtfwwOKPTI4tk+94k8hqW4pxy9kT9k=;
 b=bnB1vOB2ReeaZ7Nknvarbp5Zgq7hoPAMdJ0/e56SherbUSgw4fZoNG0ZjQArTpSElT+gOAx2XLeaNu6UJPgfFcNX3If/i+SdjPk+VnBMUmkNEkGUgMEncdvs/G2++mnPFaIJ5G5snIA1gnjs5IzVDvDEgMllnXZyg/ZyAibpGOwsuK3A8jYHaLAl+ObSpa/uQ6Mx5PHpYkBL3bQslsGVp1Iq9XxJxdyJzfGDCAcOr/wvNUzlV5ujrNAkXpNVxczTimg6lTps1Zjw3YtDYs+EypETCkmu5EOyvKyofRNDHHP6tAK5nx+csIyQ+6Rz8x74q3w2KWWKsC9rQmj0yjpzmA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by MI3PR04MB392005.eurprd04.prod.outlook.com
 (2603:10a6:290:9b::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 08:29:55 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 08:29:55 +0000
Date: Thu, 8 Oct 2026 16:34:27 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: imx8mm-tqma8mqml: restrict clock for
 SPI-NOR flash
Message-ID: <20261008083427.33iide6apbktyv6p@shlinux89>
References: <20261007072017.2311818-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007072017.2311818-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|MI3PR04MB392005:EE_
X-MS-Office365-Filtering-Correlation-Id: e11d681e-cf81-4b9b-1a66-08df25165457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|19092799006|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+DXBm6oGZLli0Lk9IlHnZC455ZFrp8P1mJkd4gv2OxtJylM/h97dNTTxLTspNPUc0EGTEEi2RMXjvxuNzuCPnQM5Y755reA3bVtnoDgXBIWS2tLbNEhSmyqPsZ2NsFfbc8/YyJ2YMU5U+70DGCZxHVsJhMPMWFySf7tiTYL5QsQKw5FuKfdTuseax+2JffmanzrKi2SIgquPZduIvRkgv+ydZN8OfvFlshLIA6DwmAoq6Nx+jg/0IY5/JQ/xNrH38Ji08a7PcPsyv8T94HX/nz2iuxIYxBs98U8VQGARCx/o3lJ7Y/7XscOMglGKzZ0eE4Shj2nT7xiOa8NsjjAADeNQw3kq/Yc30I2HjsjleJGe+I/FE0DbAQLitNPm+wwJfGhKILa67oE8Eqr7+6y1H/LWJ8kqqAJTdZRASam62ETMZaLKUYeMlZntwzj/+g68P9AwUo/KRDVnj0lWQ+FWLHehFlk9Jw20Ge4+WIZZHMu+JVn5x6ixyi4eJBgfRMt8kwW1y6Ia/OR9xp+651cozhBEZb/TE5GvdjFPL6KQb01vr+z6I3bnaXeqSL/0O3vmTtakKzM9W0gvPODMDqLeZDKqz37PaSrpNfejhgpnjg9rpSR6V4E62e0gc3HpSYAH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(19092799006)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1dxO1GagASMDIDWe7gZWzDHDVnwmpKKWiRMKNs4mDPnr8d/O1s3ajBd+iNcR?=
 =?us-ascii?Q?6mA2lY9b8HiW53BcR9dZ5JPlb+RrcVUma8D5tWg+5zu3SIrpUUXxoNPes7+H?=
 =?us-ascii?Q?7GXH7DZ1Kr3pnvhIfomOS5MDKzrN2qeBOr116GgmdunthET3O1t4/3/1mM92?=
 =?us-ascii?Q?D6ye0mzEuFDcTROAy+ljQPM2IKtwzOUa92Dc6bmALpF41JdzNPl1NkmEmgXc?=
 =?us-ascii?Q?pOuULl+wq6mxR19Qw1rjA5DnnfjMQU5EK+2+mPd/y7L4iJzAldCW1F6k4H0Y?=
 =?us-ascii?Q?GdGMyvQXdeeYixk2yBeC47rtZOpglPUgU0eZCrJtuDhxUtHuT2Mec0paPfVN?=
 =?us-ascii?Q?Hh3zN5Zxy9R5AlKag6T7dBXU4OKGplV9OBOr2rzVsmdbo4saC1ZP5RXxPe83?=
 =?us-ascii?Q?sDI5tmEygIomUS6zEs1BCBdt0bkCyfgfa2hK4llDdX/Y3ZGDTKqSHk2twfV3?=
 =?us-ascii?Q?2WYfmIiyEb2zZKnfOyckI5M+LJOEHIZzrq3XsjGlmX1OX58ilonMGx31Fb0D?=
 =?us-ascii?Q?q/KHbEWY9VOz08iKanbF54atL4ZmpOIEoXYMYfakl3PW01mTamlUruAomMm7?=
 =?us-ascii?Q?AMRsaRuW/RlqvSSFekD6oTfx+bYlCar+GLgEVABFLYuX37U/flDS5+NLcxgx?=
 =?us-ascii?Q?TVKbx40zVct1bI5waJljFjHkOfITYvEl9yNvC0IzaHWoORXXkCTpLFLfJuIx?=
 =?us-ascii?Q?qhswx+K8OdjjM+ujejcFA357S5uR6mNLxAQTnq06diYbyQefP9bdHXohqyqD?=
 =?us-ascii?Q?IxRWH/NW+pyp1EwAhTgxwV3V7NaKzcH+M6J4lZLP1D2yUcJpegsZ7i6DEZir?=
 =?us-ascii?Q?tHPgYUQz6ipImeHtIvtbRnI/1dKNiguJ+Sttsgena6eEIN7iPs7UbbhEQVru?=
 =?us-ascii?Q?9/t9zVfcvFuLFeN0t7fAL00Rk10SH1Ksuje1d9oj8Rt2EdCzORcurk7hbBAH?=
 =?us-ascii?Q?hzvn9SqcbDdDWFgv8pu3Mg3/vA8EYhDzyk42BeclM/chYbz61vpJyD4AYtpc?=
 =?us-ascii?Q?A+vE1lvpEJjPMgntObpqALXQ/p1MrsEA6QTggqClR34g5zgsvLVVLTYzTa06?=
 =?us-ascii?Q?wQMDqITrBtg0XSURTbpXOFcX8+qkiQkpPYwVDYrOlpVdvJi5JqRCnJVqO+Gf?=
 =?us-ascii?Q?suydt4Q6igt4VK75vCwnzZmW6Q0qIIs9jw66dXmDzWRCVTk5QwEr5wOWUPHf?=
 =?us-ascii?Q?C/yyTV1nF3chy+B9PL+WaELanTqbyiOGW2LfkwGfB7+3h40pEWzCOXZykXRI?=
 =?us-ascii?Q?nJcyiTG9zFMn9GAum+TdFgSPHxAWo2SY02hUiOTnrRQi3DdwJl68TuRVakk9?=
 =?us-ascii?Q?QByRvdzHcchp4Adj31p8GRSfynXl/C40+PeOYhOQ4gJmc1fOHR1rCEkVK1mT?=
 =?us-ascii?Q?OUIXtI8JrCmlw4IuSjYYZoL/UElGe1PZRfpHdIg7jv09JOMJ4UmFOiJg8cEW?=
 =?us-ascii?Q?rZTUZVYelO+/5tugIzMesjWy+l+B79NZjqOD1e30j0PSkBbIxfGaOhBgz3M3?=
 =?us-ascii?Q?SUSy1xYqNtOYfg0Dsg9ZiRsHBKjb6eCedGyc45Jz1B63INnma3rAdK5JYuft?=
 =?us-ascii?Q?Gcz7PhCS0EiWwu6sn5y1Tl+F6UVNGVgW85iwoqxuRmxnYUc7tHIWzigX/HXn?=
 =?us-ascii?Q?3kZs9M+KyB2msZ7cQX49aQMUcUbgXJ9jJAiYDDkZjXR2ZUInuSLq+zt/dPBu?=
 =?us-ascii?Q?qPojh76nSAJMSIcbMgTmt3nttKWAzfEJunB1dmzQ3C4QKuOEx3BIExhaoqIR?=
 =?us-ascii?Q?TkrewToW66wIZ7dIm1mejXtSOqq2cjup4ebe9Yrj8R7PfNaBR1y1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11d681e-cf81-4b9b-1a66-08df25165457
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 08:29:55.0728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3UXzH/qEZjycVkYgz5afdsj16I6O3XUNoojXo/LAIJkIYAle2AFJgr6h6NoHtn7MKG9QU76RyewRptLjeAzPch1cmPbK9jT8YOqiVFHkc3ij87dskx/vWl2lBEPD8M3B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB392005

On Wed, Oct 07, 2026 at 09:20:13AM +0200, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> The FlexSPI controller uses quad SPI with internal clock recovery.
> The i.MX 8M Mini Applications Processor Datasheet for Industrial Products,
> Rev. 2, 11/2022 lists a maximum FlexSPI frequency of 66.666666 MHz for
> that mode.
> 
> Fixes: dfcd1b6f7620 ("arm64: dts: freescale: add initial device tree for TQMa8MQML with i.MX8MM")

There is already one patch to limit the clock rate based on SoCs, refer to:
https://patch.msgid.link/20260728-fspi-clock-v2-1-dbe786a4a6eb@nxp.com

I think the max frequency in the DTS flash node should describe only the
SPI NOR device limitation, not the host limitation.

Regards
Haibo Chen
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Clarify which datasheet is referred to
> * Add Fixes tag
> 
>  arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
> index 1b5ba3c47164f..48285bcbe9bbb 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi
> @@ -60,7 +60,7 @@ &flexspi {
>  	flash0: flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> -		spi-max-frequency = <84000000>;
> +		spi-max-frequency = <66666666>;
>  		spi-tx-bus-width = <1>;
>  		spi-rx-bus-width = <4>;
>  		vcc-supply = <&buck5_reg>;
> -- 
> 2.55.0
> 
