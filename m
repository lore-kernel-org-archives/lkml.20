Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DBD51AEED;
	Thu,  1 Oct 2026 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790864403; cv=fail; b=NbAX+XT0ygxn5EXfgApxgceCOnWsiZZXwW1WG45gjCGDQ3inj1XBPmX4FeAVppgLJ6KG2NxH3VCkQOE3qczECM0pAIXaapgx1ma9ewc/Kz4fMM5ksp9WWE2644o/F40zNTHxEvoLhjE4Z/OVNPTsrtlWlVKjXaoE8FhBokEmG9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790864403; c=relaxed/simple;
	bh=qg0i3q9zwX7NtghDAwB0FjVtw9dDACYkBKafP0Ce12o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iPsf2Jfb2Mg/E8Nvzef9iuF0JiShOnMJrBN/ed1MoCNeWW0y0kVnM9QhrCcHCTGaI01C47us852fBYd3HblGveFAlMyliTVBuZChRESLi+/RJXtsgtynurs9Z9lROtx67EtYwvIOsKxEIS88G097Wqz6yOIRbV4RHjdpIiMbFuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=glIAoG34; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="glIAoG34"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIkI48x97FIEFq7EXg3+8xyGfNBN+EMCQEzUpIajgjnx9xZfhqaHmxGoRyHNINUvMncqhf/raFlP/wbZOZa9FvWmNe+ycZkzPIj1RsnKgkhD7uB2a/rlD2s2LdtbVtCyfSWAVXI4XlH8MvrJw8TWKtybSt7peEkM7cQAOoiJ6ET8eqiHO20aGhTldAxW4Au1EWKrYwEPzJ4hImpkUIpwnKV6V4mPM+VnfZ/BuFAGLjnxYD9M5G6pfAiI+6UVZnsp1xyrNKMlIUoOtHSwrGWrSKUGnftdVI2GEALagvD/99qFKlaCgQ9w0LihJXhp77hoTyTv22zmiZteFGhs9DosZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=402JzDADKe5oGcJL4HiYgPcm/ZOb0CDj23SGDn9XPso=;
 b=StmjMXlI0nz2BZm8X8tuZNICOUeiw07QljOzx9cDU7V+75B5Qn1oYlxTySmBJZybY/1n9uKRxA/i6ZJA1kltFwrsFthZwqdy7uFKU9t1bMXPoxefEEpMWkFiaVmd8gtBOguy8+cdOqnblOluW+gs/nBAzgaV+Q/vsorISpXCb9GNmMjMeRsfgpWu7sQ7WcGHuu4Ip8b7HfeKF9TXs1OtdnOmJLRwkrmZ9mSQpheM7e9J3VxAlEYF+BmAO70k9go7EGMJwOXo3TOACZuj9JopIC8ckJtf6LQ4oaxQrC0vYQEJIOVzJjQ9nv9iEOTti/vHV2kydFL01j4/i7fAAkgtIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=402JzDADKe5oGcJL4HiYgPcm/ZOb0CDj23SGDn9XPso=;
 b=glIAoG347xtmOBxhgkt159yI0MDC+4PX2uywn8AlrUGtzvqexF7Fl/XFgZU3RkHsGmTL9e24UyezSFgYul+99zTwK0WJQjBpAbdxojE7bM09Xb2YZPYAmNHPSPPoyO4OmmLGiWQE5PhG0R8pW67814K9Pzq3q83JtcroCfAxZsLrbLa+06PaHe3Xd9Tzv2XkHtmzxwnTJlHtHWoqdY4qTFFZeFar7yKmyQIFQUyP/a1vqZ3UGkJIL7FTOtLuHNthskYTTScjzrBwqH+C+lQQ/QD5IiE4nl+NMdt0h87ugyWENhSQvfsH8qlVDEx6fPw15EyhO4DE/ARp7vxE+yacfQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB671332.eurprd04.prod.outlook.com (2603:10a6:290:b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 14:19:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 14:19:59 +0000
Date: Thu, 1 Oct 2026 09:19:48 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-verdin: Add
 Cortex-M7 remoteproc
Message-ID: <ar5sBB5VvZPJVrmt@SMW015318>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-1-7d1343ecd3ec@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-1-7d1343ecd3ec@toradex.com>
X-ClientProxiedBy: PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB671332:EE_
X-MS-Office365-Filtering-Correlation-Id: 5515aa64-2dcb-46f9-0ca7-08df1fc7130c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|7416014|376014|11063799006|4143699003|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BptFuaYU8Go5UErcg5tXiK93eMHIomhdWZXkWToP6rdMokZRo3vyfI+cDNKyCXE5mK9Tmd+7lhDCDCjqT8HpPP8xdD8maj5VwmNtdzBgDLeRSnahCJizvfVmliouzimRDuwxaOuVj+RD0TYEHWJEmveDGhMBSTEgHdpOYVRY6WKXxybC4VjJRcfLpIaBhGbZsPUn5QWUOho2wkF+QItEupyhbNXKEe1FNiQLQijgP4Sctq2mx/RXEc0JYj8l3Ey4aMTqLckyJitKiZ21cR5xigfsthybdLIwMAwls0YDdaLABLWorF+/pVAGpbOpJ3ujpChJ8vHCFfJ5W92tfWbFTWO4pduM0KkGia6UoQq82Frw1ZVgcYxIm2PQtjrIb5u58GeGzBXCtNAmiGqQyA4tXFbUJt6eGuIxxguNGyuISwuxeLs6woCpXn0yydI59s2ROKAsZNgSMMZ29IwM373mTiU0DsUErJGyqsvaPIKNIGmZD/uLymnpJWJMcHCUj06tK9Z+HvKGpj2BgIghiFgPoLEza1IF7VFxiIagoYSDf+8rlTkEUuPvmy5Gz9jgLuXRH9vDF/bVfXWKTjXmgCMv9ZGPCSVJlD0jShSRPcMbEPEI+9JazuPmSby6frgEXGNYBNNMyFCA94pAIzDFnsI5Lw1oQs9Dv+uWhLN8oCuQDyk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(7416014)(376014)(11063799006)(4143699003)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MbV4lO/hu0VgW+xp45PM209hg9Y3+sYvWismVR93MRY/+Lad/fC++M3KEakW?=
 =?us-ascii?Q?IDbZcEkcwqQ1ckC0SgaUOYmqfB6pQXRGpGx769UGRw+SUB/l7DXoRhVnDVqU?=
 =?us-ascii?Q?CyIyzk+svv677h1gFg4IgXUhQyHHK54yHC14KRQMO1jKIe7/fYFMp2D02HNu?=
 =?us-ascii?Q?WFowPABKoHSuN8VRYzGJj/bIntI1JCAwiOrTeM1hRgpqXthO2nd10Niy2IDd?=
 =?us-ascii?Q?qXbPuRWmrMbVKd3/ZvIEAGhMwm1ksEiKm87nbK+5EaY095UsCzT3SzoT1xKy?=
 =?us-ascii?Q?i9NrXeR+Rqs+3s2BPt+2dyfV9qtqYMu3YE08V63aA/mo5kOmF3+oYJn+ANRW?=
 =?us-ascii?Q?mCQPfDlVmcnxNhruBVqKdtgOfWURExg+NiBBsqvW3zPmBG+g1+/xD5kbvLUt?=
 =?us-ascii?Q?8ZqJemX4iubAoRIQ51znv5K6B2CO8xTwxjxRjbBU+HQgoPhgUG32GOFfWeJo?=
 =?us-ascii?Q?6xg/PZfnSkoTcjsQdL83c/q9VxLzi237nPrJ1FLTaiC3C/dUnAbFMn7SS/FD?=
 =?us-ascii?Q?T3//STt4okTfX0o0L70O9wVophPb4MYAAwNtVD+xoJiH4yx3GkL0opu4EnjL?=
 =?us-ascii?Q?F/pOGMPD8JfaY4CJ92iGwHk7KGsbrP4IJBb2WMFQIBGmMePfjIN6Tr4gT3uz?=
 =?us-ascii?Q?v2E6TYQHyoJwBP/qN6KvsRS/rqD5ZFe6Sc46gNfusbJMCpHuPhieJV+2J4ol?=
 =?us-ascii?Q?h5a23/Hj10CMEatFjcfNTH9zZ6x7T4TPsMlYpnBHvS7PQoEWkWNHiH11+nH2?=
 =?us-ascii?Q?yl+gUiFEED7NHNRDg8NaoZYXB7nHGTSFrzjtOfgx94ZmhhVD2hfwuQTyFx1C?=
 =?us-ascii?Q?9rliuVOtQLXFdNkiiL7tjSr5jb12co2wR7oXrshpE3V1rD9YgHDGaqAHMS+K?=
 =?us-ascii?Q?FmVCYnMmpw2iD3IF/lEvhod+1Tfrp4Ol6B8M8e14AxCuhkzPhpiDeqAcIJTL?=
 =?us-ascii?Q?daEJAQErcQjdMvXOaKPU2XJ5KKvQurnb0jyRrbSjgNE4CDInmQHn8Mjc4DZu?=
 =?us-ascii?Q?dDBZjTKPYP42q/NVnBfiZyueANKYkmfSqn3apM7lLvkw285rl8lx9NkC+bft?=
 =?us-ascii?Q?2Iu/YzTrV3gB0tEuNBHhAVeUsFy2YSinR+8kWbmKyy0bCa/UKmBkIWZbDbKp?=
 =?us-ascii?Q?SEaf8SxZBnG+/sm2Mvl47d6u1mVf9W6xr54ox2BrWHJRnNIR0sVQwMnPSDCZ?=
 =?us-ascii?Q?5oe987NZoFon13ymVfqHenY7pQwQa1kTywUA3Ms5tFZ/zN8ttua46+MOl3qp?=
 =?us-ascii?Q?w1liCD1LCBqnhVPwW89xbM1fcYAPKgSDMoe/cyDy/4JthJ4KR4tZcgq6FcaZ?=
 =?us-ascii?Q?YHvaL9OobrIz94qBVrfXK5sWJpjfNb93rLcbK1X2zf0wluglVs8WRSfJaOgX?=
 =?us-ascii?Q?hez7Vuj05WIiGOos4z4Rn39rD7B41uBO0MLttkIY75EpfsaOHMF3T2mU4ya3?=
 =?us-ascii?Q?vmI9z4SWdXZpR8JfzA7NexQehNPwyA7JMEF68XNjHBH/I0Y+UzObBtfAKlNy?=
 =?us-ascii?Q?7VnFPYhw38FdEQCzuFYFnZ6pzlD3AEmweHmkCXaTHRojQvxgzB8fJoQLAkKL?=
 =?us-ascii?Q?fEQxKU/joxsaBhfK6Mj9+qnBZAo7gCva01xT8OGv5MWzQSob5Ph7BN4fA9xo?=
 =?us-ascii?Q?361Q5nte32H0p/orNPvTxm4xpiRpQhRQBjTqOBX/9Xq59udp0k3p0ikqsoXo?=
 =?us-ascii?Q?ocqoQSmeU2zWMMLBo3cYKpPjLlKL0nYd6GqaqHH7wnL0pjxCSKptpxPkL0AN?=
 =?us-ascii?Q?5JrSvZmD0pYCIE4hLfYB4c50mCG2MWGzS1QuoHC3//E/eGxsWOg2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5515aa64-2dcb-46f9-0ca7-08df1fc7130c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 14:19:59.1581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /W56lXAJSA8P/Xj+q/9Y3I7KS/P7FX12U00cXOJKAHBiubeXxaSHTvYTjzlG3RUoLLbeZUo/nYyCoKeL4idUI9KhBr3FwoVUdaE/JIK7GG37v3s2/hC4thUSFyufN0y9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB671332

On Thu, Oct 01, 2026 at 01:44:09PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Describe the Cortex-M7 remote processor available on the Verdin iMX8M
> Plus SoM.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---

This indepedent part. suggest send as sperated patch. This time, I can pick
this one firstly.

Frank

>  arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 33 ++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> index 9fee2cf9ef54..45a4713c260f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
> @@ -77,6 +77,18 @@ key-wakeup {
>  		};
>  	};
>
> +	imx8mp-cm7 {
> +		compatible = "fsl,imx8mp-cm7";
> +		clocks = <&clk IMX8MP_CLK_M7_DIV>;
> +		mbox-names = "tx", "rx", "rxdb";
> +		mboxes = <&mu 0 1
> +			  &mu 1 1
> +			  &mu 3 1>;
> +		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
> +				<&rsc_table>;
> +		syscon = <&src>;
> +	};
> +
>  	sound_hdmi: sound-hdmi {
>  		compatible = "fsl,imx-audio-hdmi";
>  		model = "audio-hdmi";
> @@ -185,6 +197,27 @@ reserved-memory {
>
>  		/* Use the kernel configuration settings instead */
>  		/delete-node/ linux,cma;
> +
> +		vdev0vring0: vdev0vring0@55000000 {
> +			reg = <0 0x55000000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		vdev0vring1: vdev0vring1@55008000 {
> +			reg = <0 0x55008000 0 0x8000>;
> +			no-map;
> +		};
> +
> +		rsc_table: rsc-table@550ff000 {
> +			reg = <0 0x550ff000 0 0x1000>;
> +			no-map;
> +		};
> +
> +		vdev0buffer: vdev0buffer@55400000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x55400000 0 0x100000>;
> +			no-map;
> +		};
>  	};
>  };
>
>
> --
> 2.43.0
>
>
