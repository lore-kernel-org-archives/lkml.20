Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9443CB56C;
	Thu,  8 Oct 2026 20:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791491686; cv=fail; b=uJZ0/Indzy+VgzQiq0Cf1nEM6ICweRy0UzXj5Oqo382bNmCfc0cvl6uX21Nmbfn2geLAAi+L6fMazrrTy7LbcD/Gz6iPLPI1PnZIT12hnbxR9WBwBI5dUGVtSK4cr9YRjne9uoLtUFyYUgH275hMd+A9d5vyyPJRwE/42vxzD7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791491686; c=relaxed/simple;
	bh=sWn3A06gNxxpjnDiZSpPbg8tTPuJneDH622fdZvFt1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PJP/3xRnccROfrBZJSa+q2VHxBONkALMPiGNlwje24Zi7VXmyvkKpHIjrIEPNqGB0CwRmfM6LNGzuqp2ySdKHxlCppPTlkdmeCcoyvt7/JV2EmrnulmVrQQSXPgg/MYbJMhdrV+apQhc9Vl75lpvZP569SZoKoxRh+FZNusgE1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Qzg2giW1; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Qzg2giW1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V10aj/FQy0Ex4KuMU5YF+cmUmKIQ2qAdB2mQR8urpTvx4LWFumPzClHjqrHI6jrSWPKGhOl8eLD0XWtZmynu2X4QRJLbFeDCTn9pJBk4YZcigLEWjidAWYDAichdrgjU4086Wu943JWUD+EHHFAlXyiFJper8D8PHWlsQi5mVGpG8HPyoeHW+gaDolGuImpsnadeB4ycUDKVvbxkAAxiG+XTF+9MxxugXORmRl8TUferBPMuAvun7XWFYFVku3xkgdXJWk9qE/O94kKFfg3N60lKVMsO4Uz9lM5dkiP0LIZjNmvYPZx0ZUUKX9UiBBABfKbfwWfLFzGG4fOOusYVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UgxL4mPfxJ7k1OKudGnOoRopHHF/iVpoQcXGyofftQ=;
 b=X0Ka5n3kGIYAsru8GiNb0jlJGuI1H1Pil4iZKWSFzjj2+XDpUIVge3Ix1MaUZOSb/ucuJwr1/4cw7xDQU7jL5IYrY9jfDM969TlAIiIU7hJYdY7qkobGzv71mavwfRImsC84u2/lvRT3b/afTvQY95o/UZK3IakAPSHyr9ppj+vf5hAfGrP2kxvhbd14xze8AbRR9yMsslq2C1wS+Yj2DR5ogtF4k9RgVKBliC4/OfGOhNItIJ6ZMzWEGj4ZgF5xYuvC5XJiWqBMrolObNBHCqxfce3fehVoy0dXftwovMgUrics2xGHogYH6wBvFCNHjOoOa2KKIQBtjETLmouIxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UgxL4mPfxJ7k1OKudGnOoRopHHF/iVpoQcXGyofftQ=;
 b=Qzg2giW1tJf9Ixo2Yjr8gXkPDTapoqnzF5aJ3e7XvTg2Db5wv3w6pRLNaEC14erq5aBRKs1kA7VoiuRjprIfXVVD7i+YTjxjpAB/nyuastBU4evQ9lJ7Oa5+2niU3sOIT79ylqFenUgqm5JVmQl1d/au32bqbM51E/2YW2FOQzdpQJmKLJ1K50w5yfpa245DyX0f3PR2z4z9GTHozl3dlzltsNIQkmkJbP4F9el4+GoU2Ct4EEgxRcQFJ7Oo5m1cmnlRrPRDA0QfyFu/1AC3gqBi9u1uaq6JVLWRa6g5cCieuL3XLxWakxR9xQViMJBxE23FWpPwRbLMRFN3nViMyQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8876.eurprd04.prod.outlook.com (2603:10a6:20b:40b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 20:34:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 20:34:42 +0000
Date: Thu, 8 Oct 2026 15:34:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	=?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 2/3] arm64: dts: imx8mp-skov-revc: convert to overlays
Message-ID: <asf-XrI8a-M2m-Fl@SMW015318>
References: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de>
 <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-2-11fa90f531fc@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-2-11fa90f531fc@pengutronix.de>
X-ClientProxiedBy: FR3P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8876:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b522a5a-ef59-4d29-92ed-08df257b94c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|366016|1800799024|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SyLXkyURuoRTXNNZBOMPBMl05pz0lnI73BeX3UNxrCwrTBtE8bO3FHyGpGBiB8M0iBVpa7bXsB+PMmCJ3l/J5grqxW/9xmFwPOzR54tQQQtGwhiABUMr00/VW5b1ogLAVQgbp3Y/7EFjSnj8e9FtWpqFkc4TUBj3k8S+2jaQiC37NIh0UImMKS2+cVV2QpuNFNrCFOBdqVzeolg/wto3S5UPHTX/s73uCBPcTVnBbqoV9OC7sdUE70VPp1fZ75DGtnf8CiFaBbZMPUoilulNrBZdlPCLYHWHzjPwb8zAE0xJ8fEFVMN52mQP3dVkgrS6LTnpeHThhkT2TLa8oii6fXU0uMUoANFmpHx/SD5RECEKh0VfHTQfLmtRmExxNTMwtjtkkqauwbKsOu4uPrpfueFg0oUVZxwAjK7CnfX/sTAHZhVGYELUNpwWtoC6cdcR7ohH9jyBiZeMNK5uubZbrCYEbhdt1/Jvvp+Wi00QKQiVGJBn9ebBuonLZM3BQI00KIcNMsjDDmLQhI5seIaKop1SafLtaRdW/5S/f+6emSWJLECQuLjQKYWgYTLEVdSC/nBBR4iZhwJwTrbnykqGYddrXGLZ1y2uwf2sBGNdV3p1THdo+tDiDNVmHigVc/z9vuNjzs88R10HkoNI30lmFKhpw3taXJ07WWy8fzB98bo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/l0EHNW5F7TjncI6ZXh+WnOs54f943qZ7pveX+sJmbpovviAllij7VljipZp?=
 =?us-ascii?Q?6XA3QHUcFUXWWekelsPSzxeK7xsQjwLoy6tFxYyvaHJMUBS39a+XWSFWdcmV?=
 =?us-ascii?Q?lMww+LzdNoCuOqv+tkVe+kBWQlkE1uSw2JsP+d9DX8rr/zIiiugQ5t5l8mos?=
 =?us-ascii?Q?eCYy+gbLr42j7ItIR4Zr63xMRJBITNJiLQ8aQWltNAb5TGV5t8dteBHDvA2M?=
 =?us-ascii?Q?Zdf6WcJx07gs3EpRgUOtFFWFIG0jIzjkU+csFtx7y+cwGi/9IGJOJHNJQzcI?=
 =?us-ascii?Q?RviD6Chf8ug4jXX/aJE4suDAujIdwSGIFp4WxypIhZMIkhrQE+j8gu2YZ87t?=
 =?us-ascii?Q?4Vt0y2OMhphfE2hEeQ1xCRT/yFkYdU6kWaaTkMKZxB2AUFuQU/7c2d9vYUNK?=
 =?us-ascii?Q?PBlSjCydyeghzL9AVeFV+c4eXGEQl5EdxJxlh6EdLBCM4wmPrGy0fNDL3Odj?=
 =?us-ascii?Q?C7pQcHwnCD16UCjjAinxgpebcc1Fr7GZuqeRQ2ASMPQT1J+yb/yrvXsPV9j8?=
 =?us-ascii?Q?p2N4WJiX9Lb50w4KwGD4iD7BTTPy29C8dwzTIogGUHilOzMRqX/JukbWcNoi?=
 =?us-ascii?Q?EgWI5uqzrkKcTtpjXP4QcJByrcfv1F9RTS7UG/Yo1TGGkI9vpt3815jAr0op?=
 =?us-ascii?Q?P5qN52S71ZqCpk4+WpfDcCBJIj4uIarFNtdX4fhRqrPmjPn56Rnfzt7iuQmz?=
 =?us-ascii?Q?sCHeJ6uddqw5X1RnIK7V2YRNSS7d/Fnfh+MJ5ZbGg+2BYiKGKcQvRYvs5Wwx?=
 =?us-ascii?Q?glBPCnhVqjAhuo3j6GBaJCIMjVmVDPkfwKdAvm9iaZbwpPDsKC0uM0AAN0eR?=
 =?us-ascii?Q?WD7+RvxYX7DmHfDsKUf2w+vysvyLmygfj8Ims7EnrPZCarQVhvzNwTVHnz3b?=
 =?us-ascii?Q?D6hghgh95N4lIRfalwdyX8a6mobK+OjUSEx/Ahc2zlI2p8K6H8fcqx05Yxti?=
 =?us-ascii?Q?ZqmVuC07i8JylnxEiiym1JyvK03T1Dr4BavZ4X23zcm5ZDC7GG2/DU2/jLtW?=
 =?us-ascii?Q?DL2SkN2fv3VQv+e++Nx7F8VbmED8lantn1+T9yhSIsrAmOgTEaeUi+V4JODZ?=
 =?us-ascii?Q?JqQm4X4Gf/YaUcqr/S9ISNGj7jr03WzwUza7TxTN8aPpQ9uwEZpYxKrYUbUF?=
 =?us-ascii?Q?ZRBkwGjXvnapuH+wjcgR0PTbUqdPoD+mNWcRtB0ugDCWawYmCJgRPncI0SAe?=
 =?us-ascii?Q?7jBdpWPfB/TlKoWa8s53onE39tfbI51mbMFmGi3HYBaI1iRjThns5OeR+t4p?=
 =?us-ascii?Q?zOvF2+ebFNI3RvkrAiqtAKIwGaqnDHyw2RvrncvKGy2Modv18EfYqm9Qqzi5?=
 =?us-ascii?Q?t22WEQoyiYsgkKRgLnbZd39ndxjJcoRsgPmeD3B8vAF9u5r2b6X0dWoN2966?=
 =?us-ascii?Q?GDpgdnBcDeDg/AWUWjJjvunsbPMXb6yIZydmb6iHGQZgvxlGm5BuacIskB+z?=
 =?us-ascii?Q?A5MRw/E6ZuGRFmh3tIra7z++xezVd7nolb7lNFSObhjBI5tq3be52mcuRgRx?=
 =?us-ascii?Q?i1Vugov8vuSSkpv1w48GB+KgWFOpUByGUZyKxgKDBROqOib3g3tsk38P5h7G?=
 =?us-ascii?Q?JVaXjGYF7BuvwQervSsRCCfS6L/M8CqIK1CpfMFYZJCUfWnl0Hez0/G0CTqb?=
 =?us-ascii?Q?nU8RHcluxMn7B72r6VYtx8sSSb4BWHXkCJEirLkiBxAVYjfccjAITQbppika?=
 =?us-ascii?Q?JWNx8QyKFGM1jRjStcXw3o7WQuvCI2uunilFRT31WgbYt8kpjrqhc20ZQxSt?=
 =?us-ascii?Q?azwdsgSsR+E4LkjcPnXMBtSUX55iFkKrK0tfyF8Y8QcpttE44/AI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b522a5a-ef59-4d29-92ed-08df257b94c5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 20:34:41.8840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: um5oEiw8Ki1IujAykv849sMuOJuT7nazhRpsWs37wzQOp9X/Kt0kvt7zJvKaLniZrsPyi+ee9UkaQIKuDzFTVI3lnInZN3LwVSZQF2GMyBYbeHi/sJSko0jZfhm4JU2Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8876

On Thu, Oct 08, 2026 at 11:16:00AM +0200, Steffen Trumtrar wrote:
> The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
> similar, apart from the Display and touch controller.
>
> Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
> variants to use overlays applied on this base version.
>
> Add a compatible for revC-based Skov boards with a touch panel for the
> common dts.
>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +

Binding change need seperate patch. This is v9.
Does rebase cause problem?

Frank


>  arch/arm64/boot/dts/freescale/Makefile             |  5 ++
>  .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
>  .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
>  .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
>  ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
>  6 files changed, 92 insertions(+), 99 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 656f2596e1d53..5599e45ffdcec 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1155,6 +1155,7 @@ properties:
>                - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
>                - skov,imx8mp-skov-revc-jutouch-jt101tm023 # SKOV i.MX8MP climate control with 10" JuTouch panel
>                - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
> +              - skov,imx8mp-skov-revc-touch # SKOV i.MX8MP climate control revision C with touch panel
>                - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
>                - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
>            - const: fsl,imx8mp
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 49025ae465f22..d706290b8dd02 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -475,6 +475,11 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
> +
> +imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
> +	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
> +imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
> +	imx8mp-skov-revc-tian-g07017.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> new file mode 100644
> index 0000000000000..33ddd08a7adb5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +&{/} {
> +	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
> +	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";
> +};
> +
> +&{/panel} {
> +	compatible = "jutouch,jt101tm023";
> +};
> +
> +&i2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	touchscreen@2a {
> +		compatible = "eeti,exc81w32", "eeti,exc80h84";
> +		reg = <0x2a>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touchscreen>;
> +		interrupts-extended = <&gpio4 28 IRQ_TYPE_LEVEL_LOW>;
> +		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
> +		touchscreen-size-x = <1280>;
> +		touchscreen-size-y = <800>;
> +		vdd-supply = <&reg_vdd_3v3>;
> +	};
> +};
> +
> +&lvds_bridge {
> +	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
> +	assigned-clock-rates = <0>, <506800000>;
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
> deleted file mode 100644
> index 9a562c011f2c2..0000000000000
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
> +++ /dev/null
> @@ -1,81 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -
> -/dts-v1/;
> -
> -#include "imx8mp-skov-reva.dtsi"
> -
> -/ {
> -	model = "SKOV IMX8MP CPU revC - TIAN G07017";
> -	compatible = "skov,imx8mp-skov-revc-tian-g07017", "fsl,imx8mp";
> -
> -	panel {
> -		compatible = "topland,tian-g07017-01";
> -		backlight = <&backlight>;
> -		power-supply = <&reg_tft_vcom>;
> -
> -		port {
> -			in_lvds0: endpoint {
> -				remote-endpoint = <&ldb_lvds_ch0>;
> -			};
> -		};
> -	};
> -};
> -
> -&backlight {
> -	status = "okay";
> -};
> -
> -&i2c2 {
> -	clock-frequency = <100000>;
> -	status = "okay";
> -
> -	touchscreen@38 {
> -		compatible = "edt,edt-ft5506";
> -		reg = <0x38>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_touchscreen>;
> -		interrupts-extended = <&gpio4 28 IRQ_TYPE_EDGE_FALLING>;
> -		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
> -		touchscreen-size-x = <1024>;
> -		touchscreen-size-y = <600>;
> -		vcc-supply = <&reg_vdd_3v3>;
> -		iovcc-supply = <&reg_vdd_3v3>;
> -		wakeup-source;
> -	};
> -};
> -
> -&lcdif2 {
> -	status = "okay";
> -};
> -
> -&lvds_bridge {
> -	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
> -				 <&clk IMX8MP_VIDEO_PLL1>;
> -	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
> -	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
> -	assigned-clock-rates = <0>, <358400000>;
> -	status = "okay";
> -
> -	ports {
> -		port@1 {
> -			ldb_lvds_ch0: endpoint {
> -				remote-endpoint = <&in_lvds0>;
> -			};
> -		};
> -	};
> -};
> -
> -&pwm4 {
> -	status = "okay";
> -};
> -
> -&pwm1 {
> -	status = "okay";
> -};
> -
> -&reg_tft_vcom {
> -	regulator-min-microvolt = <3160000>;
> -	regulator-max-microvolt = <3160000>;
> -	voltage-table = <3160000 73>;
> -	status = "okay";
> -};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
> new file mode 100644
> index 0000000000000..b9781a418e4d5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +&{/} {
> +	model = "SKOV IMX8MP CPU revC - TIAN G07017";
> +	compatible = "skov,imx8mp-skov-revc-tian-g07017", "fsl,imx8mp";
> +};
> +
> +&{/panel} {
> +	compatible = "topland,tian-g07017-01";
> +};
> +
> +&i2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	touchscreen@38 {
> +		compatible = "edt,edt-ft5506";
> +		reg = <0x38>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touchscreen>;
> +		interrupts-extended = <&gpio4 28 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
> +		touchscreen-size-x = <1024>;
> +		touchscreen-size-y = <600>;
> +		vcc-supply = <&reg_vdd_3v3>;
> +		iovcc-supply = <&reg_vdd_3v3>;
> +		wakeup-source;
> +	};
> +};
> +
> +&lvds_bridge {
> +	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
> +	assigned-clock-rates = <0>, <358400000>;
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
> similarity index 56%
> rename from arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
> rename to arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
> index 3e320d6dea3a2..c830f3ca8cb45 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
> @@ -5,11 +5,10 @@
>  #include "imx8mp-skov-reva.dtsi"
>
>  / {
> -	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
> -	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";
> +	model = "SKOV IMX8MP CPU revC";
> +	compatible = "skov,imx8mp-skov-revc-touch", "fsl,imx8mp";
>
>  	panel {
> -		compatible = "jutouch,jt101tm023";
>  		backlight = <&backlight>;
>  		power-supply = <&reg_tft_vcom>;
>
> @@ -28,18 +27,6 @@ &backlight {
>  &i2c2 {
>  	clock-frequency = <100000>;
>  	status = "okay";
> -
> -	touchscreen@2a {
> -		compatible = "eeti,exc81w32", "eeti,exc80h84";
> -		reg = <0x2a>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_touchscreen>;
> -		interrupts-extended = <&gpio4 28 IRQ_TYPE_LEVEL_LOW>;
> -		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
> -		touchscreen-size-x = <1280>;
> -		touchscreen-size-y = <800>;
> -		vdd-supply = <&reg_vdd_3v3>;
> -	};
>  };
>
>  &lcdif2 {
> @@ -48,14 +35,17 @@ &lcdif2 {
>
>  &lvds_bridge {
>  	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
> -				 <&clk IMX8MP_VIDEO_PLL1>;
> +			  <&clk IMX8MP_VIDEO_PLL1>;
>  	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
> -	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
> -	assigned-clock-rates = <0>, <506800000>;
>  	status = "okay";
>
>  	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
>  		port@1 {
> +			reg = <1>;
> +
>  			ldb_lvds_ch0: endpoint {
>  				remote-endpoint = <&in_lvds0>;
>  			};
>
> --
> 2.51.0
>
>
