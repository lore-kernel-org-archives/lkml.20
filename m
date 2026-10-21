Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792593733;
	b=m9pA5t/0fp5Frds/N05iSKOTt5SEDeNWpfdq3/DUs6XRPVyOfR7S1eU9LA1307CUDEj8
	 Y27VS0YcH4qAOszf+SJbXql9qahTM6Uc8q/Q2RRyMHoNC54VrGpczLTEETyIMDYGG1DFh
	 J2NcBFOQxIc2EvuNzBSdTFtnsZg+wzBjZIy7q+omP3B2D53EIZ6NlsNBWkSChNhCiRIJm
	 k4xGVnPo7Fz3ZYkiVIlIwrpyibPdbCmg8AMCDUjjipISz/qB8HZiydBoghd/GiFZKRKAx
	 Yxn3hHO2qBsYNeGm8x656862j9YkCSkahCwr83HmvTSvILrhxJCklPZC8pngbVCLvXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593733;
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
	bh=sA8iTs+6BHC1tuJjMf7nWIHdwHaPcVWJcYlGzTUPyP4=;
	b=gXw1i0oQv3hhd/UfkKoxgZ9WDiNiPSVG100bsZJzuV4NCu1Bj50qxuAJynfNUgG2cozC
	 IGQzg4h+JGAutbqQBizfaNl58UKncwJDP1KNq3lDp0zUajX1hlRsTUfm0RR59UdYKdjKA
	 +9G+MkOHKsGKDGFy2kBTv5bsaxJdR5T6mgugR5gGgj7dYLvM7nQDxUJduC7c9jUd4wubX
	 Yw3XztO3TJYnNcasbdLufXLb8bhSWyptqeLktnEGWYxbX/V48HU1Q5yM6wmbkLCnJYWgN
	 7sjpANyctrw5c3tjYhaMnuzkgSurMVwbuZO//+ZEZUcuiqEdJliawK3c6CtCQ6KarUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CkKn5Kae;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.60
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013060.outbound.protection.outlook.com [40.107.162.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54697606A31E;
	Wed, 21 Oct 2026 14:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54697606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=CkKn5Kae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTXjeV27K5h0uVZhDh7hBJ+4Lz/buVOevPaLwNo5p8uA1PFRefUrLAb3LEvzEoChXgQG3FewLeVO2YNski0X+UBdnuADxRQmbAA18H9FviLxDe7OYqdwsgOO0pI6/SDED/drkP1UvbpD1xUjOWvjcE1Xj7gGp2N96BtkVAPPdQ9qfqFQA3W9HTHMKq+5ZiRsJVCr5xLkUytptvhv+/SsWmyki2tzcauCT92PomC8p2Yogh78Htdbwr5NoVNcmr0UnnJKOtxJSizQ6QvRhwPp5jEmh5l1RVagCqn1B/xGLl1xAiks8+eqtJLJh2uZWubl3hxuZYTXijxqbM4/DmFREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sA8iTs+6BHC1tuJjMf7nWIHdwHaPcVWJcYlGzTUPyP4=;
 b=XRKewozfkkLUh3RHXI/Y1EMQghrqqZUkgqEFNn1m7abUJcA6jCuaPpCjsw2ipdGgp/+eyEC1IIobCilZzdwJEN3MqAlOdNX+TkE0RknHxb1KA8/ZC2eht75BQI2Fl4AFCnZzKj1r8N7lUHpD49++Gw+UFFVQUL+5NgT54HRXnCZeFni8zaZ12dqG9z6UqXKYSMMMqxPMB8vXnORWaquXDKaWBfMmcHZBx3HfhgA3dHV57bXHJzNVjN0UMKT0ah3wuZ8aXoZepD6+aXRIwDPmDbLiydE4aX+UHIlQ6852b9gzqmiJAQu5mJlgwJBw65OIQeZ5aViNCheM35kFVHQplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sA8iTs+6BHC1tuJjMf7nWIHdwHaPcVWJcYlGzTUPyP4=;
 b=CkKn5KaeMxqexTPiN/cudJtlqZAf2n8rMCnBlpxjHy1kyFGcnGOz1ihGxm9A5Xa5XH1EzLHAkSthipWpl/7l4Jqxo+nLYwkN/C177uXJOWAT+Hiv/s2x5mQDEtev1Kk5IU5MfWNoM6NyAoZgZoLx2lKcHNr1o9A7EYReuz++9C+BC5Vgdmuiy+9iRwfls5/KwjxebSm2iyHNcslXKFKgoUY629L+y5vARbbX57ikzPDsDm6STZDN3FY4nvIIiBmPnOoYELRvdiLVlDTj0VQEVoQKF4qfiHfYcRdnwbyH7Jnp3DZj7fW8b4tKuD61gnzN5vpGiTrBiPLs4Z95cN+oWw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8333.eurprd04.prod.outlook.com (2603:10a6:102:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 14:42:10 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 14:42:10 +0000
Date: Wed, 21 Oct 2026 09:42:01 -0500
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
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: imx7ulp: Add TMP6 PWM node to i.MX7ULP
Message-ID: <atjPOfEvUF60dew6@SMW015318>
References: <20261021084602.121087-1-sympthicode@gmail.com>
 <20261021123522.346317-1-sympthicode@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021123522.346317-1-sympthicode@gmail.com>
X-ClientProxiedBy: DS7P220CA0066.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:224::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8333:EE_
X-MS-Office365-Filtering-Correlation-Id: 85099e3e-c206-43e6-bac4-08df2f817cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|7416014|366016|6133799003|18002099003|22082099003|10067099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Vi8yyCYCxc+ryC1OoXyp3cT8spxZLOd8izVPZtXQPcXNIAJg94WOf55MgpgXoLRSaJAjogJO0CPAgKtm6tOj4U+4Dd4LU27ejC7ytiAdEQy0gPlu621Fv3X1wx/oDjmbX5j0d52bhYBWxzVFEPSeG72wUGglFnNEt0TQkT6SgawzY1TmByKG14dEK0xEgqpQLK4B2D/q7AajRXHElKDkh9pemVgtqYsQhqstyR8/tz5y8KDkSrxCWO4fEZyqBLERM40w1MRWjhbD64eRN3qvimhbCYTQKqdXiU1RcVqo88vQdkkRDMeImtaiyLSyXnMgQR1KvLpjog3GXUJqsVp/mxExRys16ediMAKNNOZwibRhBgpAWk3zVGM0poKOBfILXEVWWjQD2eP8jUnyfgYOnfZ4GWQMGVRXf1yCFltVSL0iEhMyLmHeCUDVkFJ9Qa2HTdyDnK347hoPNprqUXK6r/FEtavFu2Q1Umk9bx4pikpLdNzzxFnNCtwtkfIzE8cfC76VI04G48yHto0bOPl3m4dkdC+QJV3Xzl9JUasA31nv+pSftA62GB0CV2uTTc5LK9/xNfixxteKdRF5PwK7gjfh7oNFm2SmZi5jDjm7hblotCD6k/JHxSyesMrBV/RtBvsxu5NoSB40rCwj+FYmQWQ3XgQKAj/gz4Cm62sccLI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(7416014)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1uGL0s4oLLmc+db0rz75h8KBX7sz2QeI0s4O3LE9NwH+OJohi2VbcEdOgtqb?=
 =?us-ascii?Q?Y2Qq6ffmOh6Va+MLbrw89u9n2ALVT7l1aJ006L+c0wG4gD8b3YdxGma9Xxmd?=
 =?us-ascii?Q?0IZwJaV5gdRP+4yOiv5uV163hSBMghyl9ajmM4dU34qakoTofJR+m1shtiVL?=
 =?us-ascii?Q?9nogfBkn1sAPjjrq31GXTt/jihtuAzrM3CyqudoAFE7mrKRWQSAN2MrfpIJd?=
 =?us-ascii?Q?JYwvU9nYIBMfoyWYN2UX40pgwYNtktot2K1zzYhHbv1CI3QIfczigfXWJTsG?=
 =?us-ascii?Q?FGmpX6MLdJR1x9obsANz2KJ66k24AZKX58u5812s1igUCMKeASLEZABRHzvq?=
 =?us-ascii?Q?T2++rJwtbwIJwqau83ZQ/2ZQoeG0YEU7QtUCpgvCKo+MXNK0qfrq9uHXzlU1?=
 =?us-ascii?Q?ADz9DYq4tcRQk5yMO0rA//ZbpI8Ntbwvk+3Hm3D+A51Fl5mdJ8NUBiDBP9ph?=
 =?us-ascii?Q?MvSCQVZ19QW0/vIamQ93EJyopMKHhJw/3bSKU4cjYFbR0flqJ2xyECViP760?=
 =?us-ascii?Q?VZcC4ukCCjn3QlUsRj1BY4nwQuoi4RDe3ds+lp/PtCJC0iYR23W1OL+3Obrp?=
 =?us-ascii?Q?HkXP3CNSfLiOVszsqfObN2nhit+D7WLUCejA05G3jYvN5yg/G1wJq1J14VJv?=
 =?us-ascii?Q?b4RBpw8kKtkt3aWXyW1AREram8mDUv6I1Nragvzwymfxw9Hq6NXp+z4gMRoe?=
 =?us-ascii?Q?O6A8F3r75IKrZhWsxjwa5qVmZ4XIs59C9o7QAwhb5EzSsbwl5K8dLMqdNsnX?=
 =?us-ascii?Q?J+AhhaYZQVdxzfxZX7XlJ5bzEn0BlQ92Y5vwmW/wbwy+vTk12w61Ak2cKNRc?=
 =?us-ascii?Q?3t+6ONyMq4T7+CxyvUfTqmuirnc5vBgE/1dPiqlpl2l/e/W5xcw0HHat1NCa?=
 =?us-ascii?Q?Wb4YznGfIIXruNM26MG+JVmtza4Wf5eG1nnBDI5mt7jG0TXspCsaC9gY2yOt?=
 =?us-ascii?Q?cVERb90IJgKTZrBqoKv7/BbZ7RAoS25NHHo4R3kNUJCX4cG9z5H22LY4np7p?=
 =?us-ascii?Q?LXg7P2gQTyVGEbmWSTyk5fLiX/zMfXvkWSwgQonGpPijv0JJ7+X4HsML5eFz?=
 =?us-ascii?Q?AOgZXqj1lRX/CEI8GfjMzBU9ZoTIZBL7yID8Yfyk3aQUIC+Vx4eTv9fOWf0K?=
 =?us-ascii?Q?vAYtVGIb2NyvoUhM2wJ5KpO2zNugZE3vRDEtlo2MJ/aVHjEBm/ZyVMREATvG?=
 =?us-ascii?Q?6k5HyC/qCu1AW/lDr5XHaSLsyZa/KmvPnoItrZ8g2lid0RZ0yd70KW7hRP68?=
 =?us-ascii?Q?bkDJ7S2D+pjHu9jQFnnc9ChactfVBLb9dqURZX5jvRUvpMQtWBM0d6ktK1kx?=
 =?us-ascii?Q?p2f0DyJAOllucRKvjQWTkt3kV7JMfaFAWpsAlunWaCBykO6f+bOZm5LHu852?=
 =?us-ascii?Q?wUKmrszwsPHssMd9BY44Fwzta92g7WG7L3TJBH0N6HLYfBqdplHC/KV286Bm?=
 =?us-ascii?Q?7sQeIcE7GBRoV6Pq93MFODx6RRWfg9mUS/tk4F6Vm+nk16x0MQO5fEWWt4QZ?=
 =?us-ascii?Q?ZULQYEiVCypIq4ww1akTrBS59GhPteB8/Ch8+UDSHyqs9Cs6O3C5XxjJfkch?=
 =?us-ascii?Q?E5m/XsMBIURhfqtRF9rSQBjcHDomIPZ574vBt/y6xZKPtT0kxdI0WGgsK17K?=
 =?us-ascii?Q?ZguF+GQgmRAjku9YP6e/88lhYqECkGX4Ua4OH/LhBAj07jNqVtqHe5d9NJCr?=
 =?us-ascii?Q?EA98lglpXAY3PuFpw8oeIXICwgNmwnZh0zP0tWFCqtaW9Ropy45LFUTL4T6+?=
 =?us-ascii?Q?mFOhlDUXg04uqg3BJlyGsJRDtqPlGx/CrQtx4Ocho3rkNT17zVlS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85099e3e-c206-43e6-bac4-08df2f817cb2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:42:10.1277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOpQspgDzO59ki7J2oM0gXFjEutM4jO3SVHMtvw8v4TPZdj3uHnJG5cZoQNoSdFrjkpJwC7dM9bNzxUomef76u+dIno23V1qUCXYg3q3yCc6/4lUqI2lr9r9UOEzwM3I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8333

On Wed, Oct 21, 2026 at 02:35:19PM +0200, Krzysztof Kaszubski wrote:
> [You don't often get email from sympthicode@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Add the Low Power Timer/Pulse Width Modulation Module 6 (TPM6)
> node to the i.MX 7ULP device tree.
>
> TPM6 is located in the Application Domain (Cortex-A7) at base
> address 0x40a10000. This enables PWM and timer support for
> peripherals connected to this domain, such as display backlight
> controllers.
>
> Signed-off-by: Krzysztof Kaszubski <sympthicode@gmail.com>
> ---
> v2:

Please slow down and avoid post new patch in old thread, which will confuse
patchwork or other tools.

Frank

>  - Move tpm6 node under ahbbridge1 (bus@40800000), before lpi2c6@40a40000
>    (reported by DT bot)
>  - Fix author/Signed-off-by email typo (simpthicode -> sympthicode)
>
>  arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> index 39e37ae9b2b1..6240750b84dc 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
> @@ -366,6 +366,16 @@ ahbbridge1: bus@40800000 {
>                 reg = <0x40800000 0x800000>;
>                 ranges;
>
> +               tpm6: pwm@40a10000 {
> +                       compatible = "fsl,imx7ulp-pwm";
> +                       reg = <0x40a10000 0x1000>;
> +                       assigned-clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
> +                       assigned-clock-parents = <&scg1 IMX7ULP_CLK_SOSC_BUS_CLK>;
> +                       clocks = <&pcc3 IMX7ULP_CLK_LPTPM6>;
> +                       #pwm-cells = <3>;
> +                       status = "disabled";
> +               };
> +
>                 lpi2c6: i2c@40a40000 {
>                         compatible = "fsl,imx7ulp-lpi2c";
>                         reg = <0x40a40000 0x10000>;
> --
> 2.43.0
>
>
