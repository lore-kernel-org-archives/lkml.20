Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792593648;
	b=DORDcqJWrCE8lrhmwDYT886borCCV1eKuoyb+bVUmn2kRc/GV27n1e1wd6kb3s0YOsi2
	 w9Og98xvvf0EmwBhQIrcptepgVvbqcqxtMHCnB0XmMwAIDNxpPhnaPUYnug/u4nLDzsZh
	 mNi4gn/+/k1xqwYTS3k7Lw9glt8SPXXcrGIbc8tSiiDjG2SsFk+v6Io3ag8vK/ordJz6D
	 KiWLKKPy8jGCLQcuzauOAx4Jj3d+C09404MLecL77yFC0TyMGi0/ywpgqrNUgNodUUh7t
	 IT9fsz1NwtW8WDlm0WPJKpuhi+GD9qEE1OhitpnV+wuK0ZeNiJwd/o8f3mUvCwx6q8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593648;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=DVloUJ3IW5U812kAdZS/3hs2PvtVqUW/lxZ0j98KBYE=;
	b=ZUR7bDCitCSMXSXhi/32QZiQdYUlAJuLeIGq2rEq065cqZbyPhSYv9I/O6n/PyUbB7J+
	 nAAy+/4rSEI6oG9kchPLVFE0UIbxQrGIYYCl8BVFGRB22PEmMVw1Ozh5EtgMftTnTVDFQ
	 bfxD6X5PE0tRULQzHRjqVSKVvQ9l7L1Of51hFnzL8YFY43dwr+3tsb6I8riDf0cOk5uKo
	 Pz+gyC0J7bFKmrViPYcrR2AkJYVXVG4jlsBDOTRmYCVJbNHbNMHPqlpy1c61c8bkmvjyQ
	 hjumGptHiHUfDH3Y2za9CS8mivgeHvwJJNAzJTmbtRTN99g26hC6Fia9pNOAnWfRijg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aXQ51rAx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.59
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C41606A320;
	Wed, 21 Oct 2026 14:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C41606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aXQ51rAx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+KHCQjU+izgAl+UTmQ6YpIAKUv66BrajeI7xaOIR8SX6FQN6PizX+pCnRGD0evx55XXE8PBjdOqO3eIQV87uTFHF5wXhl+0MmuuER6aoULOODBeRHJZgetvk5L/w73r3ZBNfIKgdVOr2rLcmsFEBNFqEXmGEajDdvlgcingmMUliHgWATZ9UslhjXNg3Z3MPaQYaWzs4fOY56EXXI2DxO0STcwjOScUuPzjc5yjtCxuWJl+gs8PatuqWLH5BLNaJmZ0x6B9DUKU+32lTtx7qdlcVcMagN87e0oSrsvCTcr3pyhOE4IHBlTFVvQKrJ54N/tq0UR42l2nUb7DQxtM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVloUJ3IW5U812kAdZS/3hs2PvtVqUW/lxZ0j98KBYE=;
 b=D8kJu8cLsnduIzvWa30F6u7+TfLP3JKXqlwA28KmP0BVEqcD6bkxhp9q2Na9Fx6yPXddmZ7lYAd/+fgUTj8tSxFYxMujCRmu88eSKqeBp8EJWBnkhJMZFQ2vbTuP41cVhR5OFQe0vBDnBdDI5KgxWFoPXrNqQccm1AlYyw/tRRow21+uXquAwavpr/3dT+le9j6+mWGmsEHA0sxR6gfwtbkGKK5EGIENtFZpl47ZFxH1Hq069CPlW7TU1T0kFtFxFjA1/dWKLWrY7gGYvAyn6sW2J01uFMjAUnLextFU4PN8caBUtIbL7J37exapioA1B+eComqjt3g+ZKNDSJNTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVloUJ3IW5U812kAdZS/3hs2PvtVqUW/lxZ0j98KBYE=;
 b=aXQ51rAxknXYN78iL+EElpaUHqO3XtUTmF839lujF40VG7F/rJSjx0aJLiLgr5/3SFKd/5ikkytw8ZBr1n4sQkk/02THGRg/Xfxmv9Jvo2NrtP5PC3BDYhdFyD+rUZsUnDBG9Jn2pqbgm/T0QOHsKtE4SBqaDiUHhkuZai5Q8oyrNR8ECdOFMZcMe1sZrhInj/bwBvuEIH4/f7MW2azURDBPPgd/b47lBv+yK2+vmrFrR4mqAm15IjiF9hP84dUCaJezkU2I+cV0OZdrQArg9M9M0fBCs3UaA/7+c7/LJx8IfH10YqaLoAVSHTIuglJ9UjHsfd0OO+FN2QIUJ8eBXQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MA9PR04MB158479.eurprd04.prod.outlook.com (2603:10a6:250:10a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 14:40:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 14:40:45 +0000
Date: Wed, 21 Oct 2026 09:40:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Krzysztof Kaszubski <sympthicode@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kaszubski <simpthicode@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx7ulp: add "tpm6" pwm node to i.MX7ULP
Message-ID: <atjO4g8fqmtgKsTi@SMW015318>
References: <20261021084602.121087-1-sympthicode@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021084602.121087-1-sympthicode@gmail.com>
X-ClientProxiedBy: PH0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MA9PR04MB158479:EE_
X-MS-Office365-Filtering-Correlation-Id: e097d14d-c424-48a7-58fb-08df2f8149f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|7416014|366016|10067099003|18002099003|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	oWjhLyULezXqNeu6SMtX+h3DjnUVuOq/E2Gc00ysplu74tOutK9Hc/KXbNcHUrQjF1JyIyEtiIS07NIJ301n1zvOhZKQSU5wrlGRN+FKiACabxofgg0eAk4KUg10gwAp7hAlMr0FJUCuq54Pyauy2AOswWIzgNBS8O86fBYbmd6wV9mjQ5CctNsnM/IALisz8QweKTfsA2WFJsMj5RGVJXv9Mp6Xz+gBI+pLJyHB+wKnuQoW8gjgpErBrBXOdpERALdwlNQe8ZtI15bmB72YQ/En4201yu3ioN7Nqff7sC1rQJOojGiJXQTjWjn1Rrac7PBs0yiWVY9dcFt/BBkibPVbFMAKlBvYRgAn3alxYbt07TF3gJnI3VdoFVCMD1Y9FAfUkUc8z2KOYpskbNB9q+Wn2RcrOaxzVVo4NcInZFt4PDTwJTtWsKyLFUC+5H1d27zPg+6bfMjEmMp2AP30g99SZg0MBMI+21KtwejcAj1xpWpvZk3skW4tEJnlJjSt2WUmPKaKW841ySwMzLo4vZr+dx+3e5fqtniI0ucYWDn12MRGea79W44YxaDs/s4D+ARqv//GS0e3d6CPAmUMF40F0gH4RxHgvqg6ewJN2H9e7QYGS752/k9+ogaPRD0ilKWCUMQb+yY0TG9trR2EGUhxuxXKv90GMqtJNALUyOQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(7416014)(366016)(10067099003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wpVF3cwSuVI3FNewoJwTBs0JjvZ4Lgm+NrW8s5b9WR1i9npaWm42Tn7Xb+Yg?=
 =?us-ascii?Q?j8nFph1K8N632CyRiPVyd/hYS18JeLWxfSp+5K61fnWeEqtc6uEXUYwDpKte?=
 =?us-ascii?Q?neBB+zKdEI5Dpu6ZB7t4u2v0LbaQj5gseqFmf3Uq5VpD+7WcoDTWzcG/xLos?=
 =?us-ascii?Q?whySF6CmSH2gUV9oajtIFJi4JgzYPL45hqrjlRzyKBGZPL8v8CiH2aAPw+yV?=
 =?us-ascii?Q?BZz9q/1MFSEJeTXDn+aJmrBodcK9t3fKRnNwLKxhsruJvyI4D9sV7MGVkI45?=
 =?us-ascii?Q?pre6Q1GcSWMuQhbK4Kp+xaJIiQmNwYpkLHnL6FLg6O9LqYcs9m/NlYkeXuhn?=
 =?us-ascii?Q?gFteBsQ4k1umwN88gZsTp8YVfFkTar5nyBnH32VZoP1XUcqXojcNB0eHFsRY?=
 =?us-ascii?Q?W5mCIkHCNjk/F2Loe6tCuN8o+/7E0h0qk+pHg0PijwZstkzApPKVCR/5guTp?=
 =?us-ascii?Q?Vze+AAcd3JM1570CRV0WJ/zSEIOfm/SBmBQTSZJ9MFCVzF6pJL290WAUlg0H?=
 =?us-ascii?Q?/q2Lh/f57ZZnyqyNPN2ptSF0GFySIFXrAoCP9RtPEF8+K/95IxZLUnpcWc1k?=
 =?us-ascii?Q?kHxOg99GPNfzXQ9oCJwTXAUDngmqRjHKNHEPzsHtLFxLMFZ26mdhlPfl2umF?=
 =?us-ascii?Q?aRUQsy/HAv+GbafVPBCJDLLLToVKXk0Vaog0UF2m6eeFD+VSPfriUgZYdzYp?=
 =?us-ascii?Q?uDphG/f/s1HhRWiCTwJL/YqOmvaKsg9KCRBN99MzSF/OMugEXL7txlNYOt+D?=
 =?us-ascii?Q?+0OQltw5N4NYwS0eYeF7/BIQWKfY/s9HGE5LrwbTlL/i+jh4ZHkhY9ZmDQth?=
 =?us-ascii?Q?BaMXVLXLfMWNVXAIPyNFCMQAFABQgPnqLN/YRqmznb1oDYpNlNBzqndHHWdQ?=
 =?us-ascii?Q?1ThNv23ZMLDc54/7oYccfJ2URlb7Vq1UVgUNg8vWBi/f6/gOxnj3MELJ/DAE?=
 =?us-ascii?Q?LDU6iyoLDL3dEqBnaTcgcR4ONKzl8W4cnF9t6rMMjanD0FjIPGur7og6AOgO?=
 =?us-ascii?Q?1QGXH425KmZYbYSTSPCWtH/TZALKCz8EXqK+cjew3KpfIwQTJ12pwg7ZPq1V?=
 =?us-ascii?Q?i8vNbElUhHzUdSZyvbQD3Hc+1OnTA1jGRnOFfAkuyrS/cOcKgJ3wHx8x8V3M?=
 =?us-ascii?Q?itnDkWyUt/+bdQFxqccI8xZK3UdBQuDZuRkehkBXAa9/pDFNjHJAH1b4SA7Z?=
 =?us-ascii?Q?YLHqmf10u0fn4TUq2ZnmVKg17wfk+Mi8aNHG1tiRIekldSANT/nr6BCn+ZzE?=
 =?us-ascii?Q?sINrH6/qDz9ideAU3904AdFO3iUkOoKTjszaAQ72IA5EUxDlnKj75IJADJ0N?=
 =?us-ascii?Q?aY+S/w35kufihWDQIwvbvcmtd1F9AvXDI3Wv1HHdfOeazcopPctTU8sJw/fF?=
 =?us-ascii?Q?OChFxpBRtOlAkfd189ldhKrYl9z+sUcXisPp34I0YO9twFEc3eMtU9alhpCR?=
 =?us-ascii?Q?icUlSb8yoab8pbWJqECviif2MEt1uAXuNEUo6T0oVcINTlX/hjCmWbXk+MCp?=
 =?us-ascii?Q?PINFjFFThj4EStmkOcvS2Wb68nOIXu7FlfDLrFZwKHmCo5JpbUJ6qqjTGRzF?=
 =?us-ascii?Q?YSgBJbdLUQwoHkNRyvhYtZSwNrzQm/7CUTBRARnAvAwXKrwIcxEz9Kn9DC/a?=
 =?us-ascii?Q?wFTkdiQSOBqdOrSS5IEW1iCXJovXrBZP/B+xx0EVlHflM6tfzcl/vlH4ijZt?=
 =?us-ascii?Q?wIKolAljbpFmlph9l5STS+evhEVJWFq17O19IVXMpQlgh2FdbraATiewc1V+?=
 =?us-ascii?Q?dZYW6swAgDG3ppiDVnFSD7/KgHH2/DmmeV+GLFyKzoHl+JP7fbh1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e097d14d-c424-48a7-58fb-08df2f8149f3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:40:45.0263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ubIot1MA2ojvrJ89gKj4yBJwv2zJfu6uhkhEHTrjxdVzexGs38mZH5XEGaQtO1e5TeonKVqNOnMoDoLKy3YixonnoG7VEdZvDzL+Q7h40xkc1/TbpKIVuQesxsK4W1k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB158479

On Wed, Oct 21, 2026 at 10:45:59AM +0200, Krzysztof Kaszubski wrote:
> [You don't often get email from sympthicode@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Krzysztof Kaszubski <simpthicode@gmail.com>
>
> Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
> node to the i.MX 7ULP device tree.
>
> TPM6 is located in the Application Domain (Cortex-A7) at base
> address 0x40a10000. This enables PWM and timer support for
> peripherals connected to this domain, such as display backlight
> controllers.
>
> Signed-off-by: Krzysztof Kaszubski <simpthicode@gmail.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> index 39e37ae9b2b1..f5ec5e9d65de 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> @@ -216,6 +216,16 @@ tpm5: tpm@40260000 {
>                         clock-names = "ipg", "per";
>                 };
>
> +               tpm6: pwm@40a10000 {

Order by address

Frank

> +                       compatible = "fsl,imx7ulp-pwm";
> +                       reg = <0x40a10000 0x1000>;
> +                       assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
> +                       assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
> +                       clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
> +                       #pwm-cells = <3>;
> +                       status = "disabled";
> +               };
> +
>                 usbotg1: usb@40330000 {
>                         compatible = "fsl,imx7ulp-usb", "fsl,imx6ul-usb", "fsl,imx27-usb";
>                         reg = <0x40330000 0x200>;
> --
> 2.43.0
>
>
