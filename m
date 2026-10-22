Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792703279;
	b=PTluGrKa7MZUVFwkJcty80hD1coAJ67QHnv9GrPLPxYXsD/wnbpZtzCe1ksSiKbEdflS
	 scNWlf3a9d2DNw4GDdEBxjrV0JvEID+11aJ6UZtHttpHE2jtGefGMeW3dto/j2+3uafXd
	 2pLcB/EiAHNNemLARp6tmnRjUNGrbgryoq8a8F5vrhmf2KvoetcSMC5rlLkgwKukMWaKT
	 R3Y7vTCa0PhDoSwWELAlDrsCcu43r9D8yhZlG7xa6FR1N+2uzO7hrfJg1JcsJ4rxxqOwZ
	 9epdw8gjkP7sI4+ATf3E1XizIWtutxBDgPu9y9lW4VX3KIKeK+HFiujVZ/VZMIvHHHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792703279;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Bp+PBs2AzHsGRlA2lmDpHARHdx1gLzO71vFueLDdw/Q=;
	b=QnTjWZx3lHyXT11P4SypH8zEVfVZBcK47W+ottGi2u0He31ZkuJ88SaAFbCPqIQ1S20J
	 NhJBSPHKcAMiwteiSfQv3coYJXP1IQ+40ej/mt2KVH9abrkRMu1HafjJ1JE0XsUsALsWa
	 wtOo3ttUQxrTs/yHCYvyzorlzSwsk15BCmBr08AGlbQSPRVRpDlaV/O+okbTxMkZk5WFJ
	 feczgNUrdTuVwro7sWsfqf62lk+Madysc5Md2yqFMKEHMvpLE8GK7m5vpQW9lMOJiaBWi
	 Pk7Mp5a/8CJQfEwijOo36LvoKVpoT0eeoHlrAWO4Q5clfefjyisnUhOxWlWyTgoaCSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ut41Mpl7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.17
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74419606A319;
	Thu, 22 Oct 2026 21:07:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74419606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ut41Mpl7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1WqpMCfmJMyDgRHEEzhiRTVJeQIrG5LvPj7mLMOeTiUoW3ZK2n2mHB/cDpGiSBWl33EVx/rLTZ9oqDiiFWwEdP57jb/0lOvr3Qhtm8KdtbJ+xl5xHnPIGKQzhgs4Tj7MNJp1XuLLv4DvuU3kf6BKa5xcCoFGl4vw0QnOoWFl/vT+ZIo3Z8jnaJukrt+Pa1bW6q3ldXBJtjNXqMe8waf+ELgYbZnKR4pN2mE1qdhtuTkZIciANz9zwKrKC1iuOx+lq/3KeZvAynIGmXWBvU9ppncINKNXQMST6GjPIG/5tFLaC2TAoXdwOJ2Lf+di9FGh78Lr9IwY5AVzGkSc0laFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bp+PBs2AzHsGRlA2lmDpHARHdx1gLzO71vFueLDdw/Q=;
 b=O+4UXsW107xkpfp+hlB0reeidLncko+Nb+LL3Lxv/aO6issCpqftuRO2PEAlybFjbVnVbz3DwPyw1mJcNdfxsEqWNgiR+ukdbLR+S0j046t/pkk/V+qr/uLSX5teIApCGKvF9WB1CTkDq4Lh6bTlTgCTmd0VxLZs/q6aVXwm052f1EXwKIi5QD0rtYVHtGeqqVO9beBVEBkoYAr+WXdgxoyIZKe0I2Jv8a2XmdMg4G4KnTcegedlXXNDU5z+7HHcfR3+qlzGwXHTyeORYo3+g7jfRu+6wPoeFsWeIoX58NSTa03q6awtYMajZSEmMnyKAe0gC8ZaWI9dLQkKIodU/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bp+PBs2AzHsGRlA2lmDpHARHdx1gLzO71vFueLDdw/Q=;
 b=ut41Mpl7OTONmtnkpBjrfSK93W7+gfeZL9zn5kWzWrNso2hnrke9prCOBx+GjfPYMPnAvwSoS4DyroJT98d3b2UGZybXNtagO5Jgo6ZbKkGHSVOW/BVhn2X+vqfMQzLjND8aHbdcKU0eVTR1cwX/6ATGfLvE79lcyvrywxrIAPb0Q/Ncw0mUXZ+JUZvBrMbRAxaEmEhz7aFIacuoQ4QqnvFmxAt4EQijMjcg9+c5BBK1UKPKlgRrqgDESgTNJMRhLbTBviTLlmTU4x/cvw2qLU0hRZz4mA3yoLRSxXr4IrIfnP1ty0Pm0rOObudqlNuEcHl8bPvD/dYYbRLM8vuckA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI9PR04MB043780.eurprd04.prod.outlook.com (2603:10a6:290:84::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 21:07:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 21:07:55 +0000
Date: Thu, 22 Oct 2026 17:07:47 -0400
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
Subject: Re: [PATCH v3 2/4] arm64: dts: freescale: imx8m{m,p}-verdin: Add
 camera connector nexus
Message-ID: <atp7I9fBUXhK7b4F@lizhi-Precision-Tower-5810>
References: <20261022-verdin-imx8mp-hmp-camera-ready-v3-0-90a30b0b0d55@toradex.com>
 <20261022-verdin-imx8mp-hmp-camera-ready-v3-2-90a30b0b0d55@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-verdin-imx8mp-hmp-camera-ready-v3-2-90a30b0b0d55@toradex.com>
X-ClientProxiedBy: PH0PR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:510:f::20) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI9PR04MB043780:EE_
X-MS-Office365-Filtering-Correlation-Id: a538d32b-5194-434f-89cd-08df30808b0c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|23010399003|7416014|1800799024|6133799003|18002099003|10067099003|261021121427099003|22082099003|4143699003|11063799006|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	AW7OIhqoOTFGuEw3zBQLL99cMKQ5ZQ02sb3tISCnf0pOGk1xVx2A4ELKrvTB7IgNKwliAVvsI+MwPzL3Pxdxn5MKL0/p3okBooFf/bGtluQRqUmIfX0UfWzLRRQZ4XnoggUzI4cgFJYaVSBfIBPejonjNHI5c6UC3/47Dmx8cz7Y3dUS8qSraBdOEGrIZdcSyYavQ/TaKZ8QrhfO+oabXfrivqwSsCIIEnwmLGylrjtS3KJYVjciuVLn0PGMwDlPghqAHgGf9reGJ07EQbNC5dGXglJg4swFWAwhcCh+k+4NT0OF0xARXKgddSFpTIjdVboSsBBAPMmHPzAbc6rlgjDDMG8E48PauEO1ScnosTGNIhEsxjlAS3L2MDg/8v61fAuaMykaVyGzD4HHTcW4AT1nzTGbR9OiYSpjkc7ZjmMTN/2F1Vb6El/eTWYCNx/q357hLdXtkWXmaaUpBVzXANl8N7yGyIG6uRAM0ovhJB2ZZV5NtqmCW4h8ifIpZoO8qmZ4fv8uDlZrWcxarvTEd3/QCN99OAZChV+1BWYJ7v/0xlMzvV9tQ0FLFlMM0FSYAY3v6gllaM6OKsp4BCTJyNs3sxql/5uj4dScyrMiiksmVgPUL7yCGQgSVPfLpSfKkRnA6oY3oV2xZAIo9hl837J9SXFxk6Owl6hAb4YAdec=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(23010399003)(7416014)(1800799024)(6133799003)(18002099003)(10067099003)(261021121427099003)(22082099003)(4143699003)(11063799006)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xqVzbf7o0i3kEXeM3/uC15ZzuUKOAs3mL0qtZijvCckpZ9pi1y/3ITjqrvK5?=
 =?us-ascii?Q?KHSuG5BsT3Xalk7QWkLfV3kU6/VOwQoWQcTodpg+InbwIIb7rQtK9IjViqCs?=
 =?us-ascii?Q?uAssGifUFRVHxeB0eamqTCjKsiLAmk1VxhXhdvSfGISSTCMvoEbQBqwLxecZ?=
 =?us-ascii?Q?x91rnHIq9/R/wDg3AZ9ZSHU+K9bimPlt5ArpMiEZlFyTnPcOL/c1P0XOt/rB?=
 =?us-ascii?Q?f6g582aAhyY55USg2hUCc043oxDaE34yXWgjSg+RYV1JZsXb8OSsg4TcUZSa?=
 =?us-ascii?Q?FnLlCXzAq0zOfqwcXRde3P7qnL6YGVKkSOB5ckoJ/0xnQctQdg4j5qMkt0Ep?=
 =?us-ascii?Q?YIPJn81AUV8ai9ErrKhBYFGSMUTL7K0nKc84kqvUug13puz0Cod50QKrSEbu?=
 =?us-ascii?Q?IJwtK2WtJtK1MOG+r5nMfPwHJA8C5gH4ogvmSty3mH4YVXtyO9jeYbe+h53h?=
 =?us-ascii?Q?4gNymyEgSoNM7R9Fg7QRFiUmLfp+cIlZNdVxsh0roxNjFTkza38AXAlZopUA?=
 =?us-ascii?Q?m+TBvIbLXsj/la3mQSZNEA7KoAsTmJg1ODMl4yhEfTHU0w5A/ypYyoQRDZZt?=
 =?us-ascii?Q?TlPkM1wPhvPaIefqPKmhmNp7sqi96t24tnz5OU0m7r6bP5MeqSJ+XNxd8UEl?=
 =?us-ascii?Q?UzIESQGyPrzfjjRAB2F5DH2OzgqEJ5//UQuFAR+Psh7FPgpPpTkTCLz9wLBY?=
 =?us-ascii?Q?iQ1s6Rd0ztJd+DWSei1smDpfijNej/n1gRhogPw588Ry/FA2ujP/Pe1TZjSO?=
 =?us-ascii?Q?amhsnXz0csFw2hKClGDkNk8x+JGWRb/14W6+IVU7NJxlKKXFfVTg943KNlBD?=
 =?us-ascii?Q?9neq6rjRIHTVNv1OY3H6Fh/a6ktBB7cwNe0+bIsdsdNnKY/4k3AQt38PuZuy?=
 =?us-ascii?Q?AT3juD68Qyw2x7iWbp1fUR82IE5urHPrTReOl0SFgzV+igzlGmZLgodfk8JL?=
 =?us-ascii?Q?YUqKzyk4f0pBYBd+friqQ4rR7QH0UwtNhYwgOZXu8Ayzduak91jCDtqFJ/UO?=
 =?us-ascii?Q?ITMFf7w91xWKTiASvU+G+ZOfL/Un/MCqKZlnORckU9VjQlU9sDK0A6zTkJJG?=
 =?us-ascii?Q?Cq/8gubs3QyXZmtkM32i5YXGeh3W/n6LIM5j0Z95usb7WmVPmCdig7+1GTkp?=
 =?us-ascii?Q?n2CjMbDzTqK9ub2ErouxDZM0AE7iZmDCzco6ugQ2Nm2w7LJ9E98hZVs+Eahn?=
 =?us-ascii?Q?TtQbhx69xi3I4QRZCSjlmgBm2p9l3wJDWSWV04McspQQOq14U4QPWqD9pLy/?=
 =?us-ascii?Q?4JKhrOl3s2uKi+or33WcCIGt6bQz1naOvnQzG1p6inhW46jr3YQ3fzdpg5Cw?=
 =?us-ascii?Q?ZEDyolDYcihROPQeH8AZHvTmYdEAWqZrtRmWNKD+KjTWDZnRsbRIdcIevJ3y?=
 =?us-ascii?Q?+j81K17t7WwwoUyoc+BdD0M27uyAxlc/hYajX9p86+t8DcePHAcpGm+PDjiM?=
 =?us-ascii?Q?cG+eNXyVxnuKQi5xpa3abwtWPkt8+4AfPG7+aFRw7aGrfGzy1ketWJI/22by?=
 =?us-ascii?Q?Q5vT9MTz2VntPSQPOumRjMS/bKvxb6MZ+Vlt2eG/2PplhPhVfhp+UdaSXNbw?=
 =?us-ascii?Q?cMKAGw8c3KEyTH6aRc5s1Bm1T4jMLC8ZT+hDeLcOYKinuyX59I8uNX4pAfhy?=
 =?us-ascii?Q?EIBRK6B+CZIKL8CIAcDEPv0tyzG1iB5dgaI8LpU+dLEgMZ867wDtYdVFdpjN?=
 =?us-ascii?Q?2ikZXKZ0oiwTSuQM80V7BvL50+cFSNAW0Qz6QnhSFQz2neULt42EAjkfZkJB?=
 =?us-ascii?Q?LO/4ZJXKbuMnSIoxuZ5hwDv1EEjyBton0/xWLwNSm3VSK7U340Zt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a538d32b-5194-434f-89cd-08df30808b0c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 21:07:55.8877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8IDCE30FCnlQR7A6LG+wY6o2HX3oEQk5r5PRPY3FTxVbox215vgzdFKR5rNlx2zZGzJPR1cWz/NDIxiRP0JI1wtLQWViVPeQkCDcVcP4NSF6xw44pPOBPM62pVV0zPi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB043780

On Thu, Oct 22, 2026 at 04:31:26PM +0200, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> The Verdin Development Board, Dahlia and Mallow expose the same 24-pin CSI
> camera connector, while Verdin iMX8M Mini and Verdin iMX8M Plus route its
> sideband signals and media pipeline through different SoC resources.
>
> Add a GPIO nexus to each carrier description and stable Verdin-level labels
> for each module's CSI_1 I2C bus, receiver and capture engine. Keeping the
> nexus in the carrier files avoids describing the physical connector on
> carriers which do not provide it.
>
> This gives accessory overlays a stable connector and media interface
> without embedding either module's wiring in the accessory description.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---
...
Thank you for good progress.

>
> +/* Verdin CSI_1 */
> +verdin_csi_capture: &csi {};
> +
>  &ddrc {
>  	operating-points-v2 = <&ddrc_opp_table>;
>
> @@ -596,7 +599,7 @@ &i2c2 {
>  /* Verdin I2C_3_HDMI N/A */
>
>  /* Verdin I2C_4_CSI */
> -&i2c3 {
> +verdin_csi_i2c: &i2c3 {
>  	clock-frequency = <400000>;
>  	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&pinctrl_i2c3>;
> @@ -695,6 +698,9 @@ eeprom_carrier_board: eeprom@57 {
>  	};
>  };
>
> +/* Verdin CSI_1 */
> +verdin_csi_rx: &mipi_csi {};
> +

Can you refer to port?

&mipi_csi {
	ports {
		verdin_csi_rx_port: port@0 {
		^^^^
		}
	}
}

because difference mipi controller may use difference port index. If
define point to port,

ov5460 can reuse if port@0 change to port@1.

Frank
