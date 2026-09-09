Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011064.outbound.protection.outlook.com [40.107.130.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D7F3B3C14;
	Wed,  9 Sep 2026 19:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981218; cv=fail; b=NpD1RaUjtNwaRXkqf4fqVuoA0JOLLZ8pGFgyBpkC6CBKPbyWvBZOSpLXzq7EEIxpR2J1B4qG34x8aDSYowNC4XckupluxXzwFsYH5Qh73WUesebqdW/IUCEmU6PPcbpsrpiVURMKIV7v8Cqs4gjpdGbZUKkzH/OMYjogOTlf2Zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981218; c=relaxed/simple;
	bh=iVgrhAaPU7DbsaS5wyoPrNnQhUokYb1b3tXN5yfrPRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DM1NZWPvE2ueKulJ18q4s2TZSea7Q4DUbPKLMks0NDOFNOuiTtHvkrvd9f87XfSHfEeGMh8l3dwkyzP7RwDIeArdxvqxWWNDywvLEaNvbQL/MW8YtCNuc2pQYl/uZvSZIuUdUUfIgm0q75KG3+q489vwIbj0BBcxITH1wTvteU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=v/iwePe3; arc=fail smtp.client-ip=40.107.130.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="v/iwePe3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOp2UVmrFiZFKizDVglnwICBhvYsDsOhnlZ3IVfGo41FL4M72bXwJBGwCTkibdvpeg5z6h7y5hR/+hkPICDlOHQfRe84xlpbwoqYQb72zSkTDK7BiaV7Uj/i9skthLMCpUQtaGTzTLUzFJx0GGMW3DguNHUAvKCeQywDIZvhmJaUWl9HFPAvdHcKAZwBKFTz3WYoLdxP6fxSopYzKE/5++clrg+yxr+y3q/0XgCpJWcjMJxosHu3pUjPi1jv96NEOVOQz7DboguiFVokIJRYawnRD3vEy8U/3cKqUSwkveYe+K1UUmVFF0hW1/FcgQp5/XEsFP0avsCh4ZghJgffbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJojyN1HFDeJOclcDCP//p6ZWjqiG1JjpxY42Rxzqa4=;
 b=HIqKPQPzVxdic0AC7HhjsPYYIZQ/qQnWZw7NNyJg5+LvSgH7XuDHWvi17d4VitkOBKAtuUHVbsZxa1UOf78F+qjDcT+iJ6Wblkk9jhVAAQ85dut2A376zK8CIeFar/aKAuCuG0Xx0kT3DM6DeTCplOjYTc3fbIdsSGVW0KAsycdGX/8eDUHKWhAUmo9/wCgS/n3RDhkArMfUTGPkqDw8IXnLBas42Ai99YwiUvDg1YEVYjdBWKKw3Rx+qBSiFaUINzOj0WTVK1tA3/cUryVMmaZmBxSkX0pQKr4629RO57WM/B6ObYCe6jaQhssHrSPe84N6BWG2jG4Jzg13x5PoNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJojyN1HFDeJOclcDCP//p6ZWjqiG1JjpxY42Rxzqa4=;
 b=v/iwePe3mzhfUNgg6cFixRFmWm2iF9nJ46hQDWv+DtzQ+bwKwCRCjoW7lRnZWrx9nGOKkoCKEV2gLH6dzoXD7U/1PlCfSvHv85rEL+cqyCa3a/WR0iRSoZtmlCKVqTAHsmm+Xv4eP2VX4uIMijnOuykoeIQS40XPfFXl2oCdXuZAHJOna1mkx2e3PfxmT00ibXyYaidA14Ai56DhWHaZadb6/VmYx3t9swJ6/fI5iH3k3PXn9h14Boee0v6AfgH4B/s3BhL1iw182FvFsDX+POcBhHRqRsnKPPto0D3jwOpjIUI231EqBi9jQNWNCN9Nlz7wKaXmuoTOQdmuWMIhuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8342.eurprd04.prod.outlook.com (2603:10a6:20b:3fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 19:13:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 19:13:32 +0000
Date: Wed, 9 Sep 2026 14:13:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Oualid Derouiche <oualid.derouiche@kontron.de>
Subject: Re: [PATCH 8/9] arm64: dts: imx8mm-kontron: Add SPI EERAM on BL
 device
Message-ID: <aqGv0CiP9RdpLSPI@SMW015318>
References: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de>
 <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-8-4d0e8a75db79@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-8-4d0e8a75db79@kontron.de>
X-ClientProxiedBy: PH3PEPF000040A1.namprd05.prod.outlook.com
 (2603:10b6:518:1::52) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8342:EE_
X-MS-Office365-Filtering-Correlation-Id: f6628de4-0f95-44b9-692c-08df0ea67002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|366016|7416014|376014|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sSqbZQ2sr9GcFkhjGHZ4eQAY+IdoI0U5hGxhewXqEPcLJo4H1mw7IDu/nDI8kDb9BaccIXUdlXC4ZXihybxaAdy9p+428DpNcjx2w0lQevIDb+R8WGbV9jO3zDsia6jBNWCSzigZAvlAroE44ccUXiYebZvZGy7uZxTnCTwzTkni31BhWJj4m8v74J92FwAnzdEPZyIbaeRmnbbF0Lhh5DLxJYefPNZx5Cul9wZKvt/iK3Uejd8L1itHafFmUSJ9UOy8SAbBUUmILzCVUjsmUGw0QSlrZTJU1yBSt++SV1iVJIhzbHiZNHzRU/PxjgGBxbTfMKQQWRbnpYxUzSIwTJoc3W8lsH3CswYWIMdhfkL3aEuXQlUH0cEzUHhftnmGKguKV9MzVmfGgcuib2mi+iTZZQrWmMas96OBWgU1SC92pfTxzbWGMwVTyvhZqHugN2+EFlZJwOJyFAqQY0qYGK/bC6sP5SYoulwWA2LX4d6xT+2CYRPkkgklo5U8FKSVtHs0gcK7wbknkSMuVJg6QEaV19XSd5Neuab4B/orjxAY2hWpgCTVNisO2qz4yILJFZAUEH4GhRTpvwb9vXsy1i9bjyrSWPogWJpDXLaWfh3MrIvIcqZsQoikkX3KLDIJHmO4m0v1XQU9CSlwnOOa9Vjv4h3Bxl0KVQaRYHogTEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(366016)(7416014)(376014)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IapAzxUpD2lXMoNqH6Zlv3S5oE+9EgyUlkLyN7Ggzj+nfT7S9+kRowSBmC9u?=
 =?us-ascii?Q?IIb/g2kzca/KWzMRY3Nrg+DyIX1Sq+iI6SdibqCCfo1dsccFPvBiZVQpheGO?=
 =?us-ascii?Q?5EileAjCpxt0jYOJBF2ysOsoV6rWHw7buljm1D1xfQXuN5MVT2y0NsIMDr2n?=
 =?us-ascii?Q?lAZkPPqMmK0gPZkCPb2hbse5SEXQdLQ3Wk+eGrEN49do5EBwKvrzlcsTNvy1?=
 =?us-ascii?Q?Iu4Aw9zdcmerhW9LX5mGfAQbHotuVcJh/GoWu3ZWNfpv4J74V20N6C8KyERv?=
 =?us-ascii?Q?KFOpxEoaYbSACJS8WM2QBsTsQf/AYdBoTwmxwYXUhfLQfnmC7sCLP30CcPzj?=
 =?us-ascii?Q?KlDyb1dFmHCDiMG79C7dq6kCNfLEUW0zD/LAWYgK36XcKhpzosnuOnBUFZ0Q?=
 =?us-ascii?Q?lYhnLzVIC2B+3qGmL7/Y06iIkn5xOmAxM9v0P7sEhKTX5rcTlWxJQ2EEftF6?=
 =?us-ascii?Q?6E4PvgxKZu82RF6Qc+cgdOvjWF/24yOM/ZaVVQDvDmQBlMUruhSCvyBe892p?=
 =?us-ascii?Q?rPO1zZK1vz7mAm/wAIgU5qzS50VGqkQJroKg6Jrsa5ijMVENQArvL1eDN227?=
 =?us-ascii?Q?YzG1OYCIBa8kV6Y1iDtH/Uu8CPdqDhP7/Btwkl/3sfvPusOKM7v2ZRkDh7zk?=
 =?us-ascii?Q?Rdx8+XnlwLXkquaHE5yLPLM8q5IFM61fsNoS1+Gclci9WGGqUmgfSZbMtJAy?=
 =?us-ascii?Q?9XWUwt1CHV8h5DVWby8EKq3+UmztPJRz97V4GigEmD2WAQM9QChpZkrVNQmS?=
 =?us-ascii?Q?Z89aDWR9rbOeeCRw2Vm7ULj7FrwrVPeMz517vAnR7z5JRNPWr8yNtYzLS6SX?=
 =?us-ascii?Q?pn954hvxTwr0vv92uw1ozS9gySNo8D3rN8wrRSETc9TyOSV14CCwZ2p+TsMg?=
 =?us-ascii?Q?A9qocJwr/MlNpUWnSIjOA2ZGotn1eJwEbVPwJJf9CvHpxqQPNZx00hPstRz8?=
 =?us-ascii?Q?11EZJmMPbRxnfBKOUNFa8FpIoQsvuc6pMd2O8YOvXPZ1qyc6QlR22Vk543MR?=
 =?us-ascii?Q?23VEoGIj1nitbOBw4LWIAQhuLlG1c459YujYPar9xgu8IvYPGSolaZfEHUoB?=
 =?us-ascii?Q?TRFXnwL5jgizeFATCnDOulCvg0iDnJ+KQfsPfnPMhBVctIxmvrdQtXXxhd4P?=
 =?us-ascii?Q?HltsJapM+mByNR475CUx0/LY2VgSyRWDhLrQt2aAyS75JoPeb8+QSTb5fRbW?=
 =?us-ascii?Q?Kll7lhlhcZ9hNBcpOVQDUBiYwJS8S4nllxFB58P6nCwMWA4D58V7QVz5/kls?=
 =?us-ascii?Q?sygGEUwuCH36n/UUlgfRZXgnfquQtuYSPR0ii4qlhrhVvQcUwZtXX5VvXt4X?=
 =?us-ascii?Q?VdOG/EaLtA+sdLyoUc7DOzIaYUgn2z+7kMGJRzoMviLK+gq9rrND2wSKwFtZ?=
 =?us-ascii?Q?b7DMNbJBhYVHYNrU9H4mjbLFHeEqKcsyRu4hHynZEFkZ/wAf6qiHNLYya5ZY?=
 =?us-ascii?Q?yJuieuVSaOv7DRphXNKN3+odvVxRStSDm3WCQTkXobuSMLoCnUIXvCr10AnV?=
 =?us-ascii?Q?F9P8kAuLPJoyL5mV4px2F+zZ+IdNWc3Oh/Hoyqk5K9YbX9/TjZE90YNsXENQ?=
 =?us-ascii?Q?LcNTsVtpVZYhcZKikrYH0X6qVPpmt7PJCg4sk6rLzcftkUPQPItllHzbeFyr?=
 =?us-ascii?Q?SqMJbnOn4ydS5wHLxTXccihIWx4z1MzUEe42G+HjVtm/QJHyZfydntt38NzW?=
 =?us-ascii?Q?O8IyUKPAAz7kAGorCQCCAacyCg0W7HyMLJfCXwQ9CkvnwCjwUr/cn6lYwRnV?=
 =?us-ascii?Q?HcBHar4htD6FWlldvK+zADeLDDIHNAhUj3y6vDJYD0MIJs8lDhij?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6628de4-0f95-44b9-692c-08df0ea67002
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 19:13:31.9376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnDKFFFEqciexdnzPlIiAndI1LmDXvEoz1pz8USTqnw9XejcDo+xE0nJpWi1MpjI/4w8SUld65BqtcE+WBer00hD2g0nQOjBsCFwP5Fp/GV0d8nKs7UYhBYiy+LVswre
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8342

On Tue, Sep 08, 2026 at 03:51:55PM +0200, Frieder Schrempf wrote:
> From: Oualid Derouiche <oualid.derouiche@kontron.de>
>
> Recent board revisions have an EERAM chip populated. Add support

Can you use version number here? since board vXX ..

Frank

> for it.
>
> Signed-off-by: Oualid Derouiche <oualid.derouiche@kontron.de>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
> index 72588af057d2..27bfad56dbe8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
> @@ -123,6 +123,12 @@ &ecspi3 {
>  	pinctrl-0 = <&pinctrl_ecspi3>;
>  	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>;
>  	status = "okay";
> +
> +	eeram@0 {
> +		compatible = "microchip,48l640";
> +		reg = <0>;
> +		spi-max-frequency = <20000000>;
> +	};
>  };
>
>  /* ETH0 */
>
> --
> 2.55.0
>
>
