Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587566;
	b=0Qk1vuYAsKauURlurN+qcv4QTsYv82nFg8SE6NMJv233X+DIPa37v4feYKkBaepubUSr
	 EKmd09R5OWG5hR89Mlj3cG11D1R+iSwAHmVy9T49O41z6xjo7VXHqeCnO25SPJNsem+zN
	 q64QEgk0+z+jmC9vnSe85OwI3FPMMSSqkPucLeBUMDfwr/WtFOHAtVxm4rJcoDioiatpF
	 EmuhO2AftFRZ6LcAZAJI3xjgfQMPIeZTW0PNBRIbekCaK/zukA07cUEsEqS7m8msmXOTp
	 VDAzdJM35f45Z0UE+QIXpqKefqyzsBYEVn8QnfeAT4OUzJw3rIMh9vAfsGi5Kacl/sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587566;
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
	bh=MF/8qJikXAuXLrvq1XMbFpcBI0pgknDspryiyN5igL4=;
	b=UtuZJmXdsil+hCMO5zg67XchlXOoXs07UpRU+M7eSFW3tepE7vhubEwPAb78I9GpINSr
	 RHDKHlvJVgqsCC/6PlbaqRq2hfbO6LoTRw9+ixMeGzAPRWCLIaR29pOM7/d3gJ55sT+mv
	 +Ex1APUGDqczJkr8VCQzNCZZavRyM+edLrGSAYk+fYAwsaFhtZpoTFHbQtJxvVBuJARQQ
	 9ofUIBhk6oMjm1gXwS8fMJ+qObQoz3EEUnwIz7OiI6ucLnibHBMTVz11M/uadk4uSfWnE
	 YjrwUQntrXs93hqd/AsMoaGDql0bMRXFlsYAEZZEGTM6+ppqx5UpB1xcwSpzFXgC4wA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aynuTuGa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.66
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011066.outbound.protection.outlook.com [52.101.70.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7D3606A323;
	Fri, 13 Nov 2026 16:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A7D3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aynuTuGa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fgY95/3aHwhwsuW6/FUAFRnFZWkYEx8uYLqT86pbLO+q4l0rkHUMLwf6KNeuoBR9aIkcfnJTO+NN97FEeMd3jVuwFv3fFbV9yntgRkz7wrXN/ry8VNenHFXmNq6Vfl4YwKHO9gjI86LY135wr7GEN9EvY/EGCxR6XHK275NAqe6cszdd7PtrLBF3EQliBPNlii7B1U+X5i7Bh78aNJDZ46PaQMzSqzCQel8aWAqd6Q+C1++XyjD+XtAE5ZOGf20cYJJgad0+6tK+4GdO5JMA9upDSzJMUWlwKBzEAuZ1x+CXNRe4lNlW4ICRvntqtkFqsTfwWHj1xieSBwaJXQ8wfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MF/8qJikXAuXLrvq1XMbFpcBI0pgknDspryiyN5igL4=;
 b=ENFmQtpRhCZwK7qihzvx9Lni97ZfgNR2RHPCpHWLdt3bbKx9aEz1f8jj1VYuMcjurgbpSnIjdTiNJli4AEfyFfi6V9Ds3aVlPFL83QtYodtQirk31r6e9UGqZFJj1HTlcPDt8/lGr0qh+8WBvzKe30z3T7wmcwVBqisd4P6qf6NynTsIMFJcySaLL3BRsqkOTLQnFKSE7AcWAZHt6O5ArDXmLcV2HQ1jH3BCvLIQPP8WIOw906Z28Tpng8BkgQO58JCIiIfJpX519PL8Otb1unnUYkiN1AF4xGX7ApB4DvAZ/M9lxG+5uYu2+aWHQmuot2VF8D7LNm0VQfgZrFzVyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MF/8qJikXAuXLrvq1XMbFpcBI0pgknDspryiyN5igL4=;
 b=aynuTuGaIr7zGYCW7D21y1KAEw1vi2oVeobBfUxsLNlWo3+/cPSfRw3eqmrHcuq+bPlcIqF2Kaews+EjMP1bGJ/srehxJN6W8424N3N+hLwBWlBXcxsX+PZsIJ6zgrxlEFl2cLSgDYXesnju+YaUfX5JU1IopofG54XRw5baZOrlfN+exGyTRqW6MR0EQVkh/oMALgFoUoMp+GDUmbRbrotEkieYDh75SG8lNzdK7zoXwa0HBc4fZlOhNEGGW9VzRt47XJVHZxLYIsQPyHwb1igKtPIx3OimN8vXJWKlWMmsaguRKkO8JbkTQGWY0rXx/AF3rFmj+5n055gs8aDKZw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by WA4PR04MB290288.eurprd04.prod.outlook.com (2603:10a6:1d0:2a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 16:32:43 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Fri, 13 Nov 2026
 16:32:43 +0000
Date: Fri, 13 Nov 2026 10:32:35 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Benjamin Hahn <B.Hahn@phytec.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yannic Moog <y.moog@phytec.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH v2 3/5] arm64: dts: imx95-phyflex-libra-rdk: Add overlays
Message-ID: <avc7o0T0-tSW_c0H@SMW015318>
References: <20261113-wip-bhahn-imx95_upstreaming-v2-0-3ef58af5e689@phytec.de>
 <20261113-wip-bhahn-imx95_upstreaming-v2-3-3ef58af5e689@phytec.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-wip-bhahn-imx95_upstreaming-v2-3-3ef58af5e689@phytec.de>
X-ClientProxiedBy: DS7P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25b::9)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|WA4PR04MB290288:EE_
X-MS-Office365-Filtering-Correlation-Id: eab4a3c9-3f99-4082-525e-08df41a3bdeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|18002099003|22082099003|3023799007|4143699003|11063799006|56012099006|261102123227099003|261022075727099003|261021121427099003|261009223027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	sPYqZgDUbH+mfG5b6JcUgZBhlo1p43c849HLr9xVeSUzIXdBevew/IHp/ApQJ2CNV030nvPBOytmssXLFF4xDjEQTm4I254BteEiMFq/TlZZj7cNTAv2M1TJkuSFij8xdGzZHpjYmzCmNSzeXbzOkmmVfQUl3ZNFKrPxS4Ms7LS5XGY1+clo61MHiNywmgzbiaRha/CNrWTG/cGAg3Cmav5dNO30IbmuFHAxZKzkm9bne4u34ROdLkQQoqeGFHXCL4LjSmgzGY1dnDMJB9taoa0cjLiEGjqhHimR2esYgZLVYx16ZIV+2IJhZnEUvROPnA3Mpf2c0ull2fNBm9ZhlUDvWXKKGiFJbMEN5ItYnkEgWznACi+YvKgHU0NPxWiVWsrvl6i8OrYE2WCPsU4E//9xje/TH2aut0FGCDORVkPdg7EM6s6blKVXGG7EnUJMYx5sEbS/UsWcAByLJgekC/d9DlQtchjl0GqxAYhICeAFfIKO2p3BF/1J6ibZOKzObePMoBJbwvj+01seyvPpxezF0o35ZMn4UeVVJv+GPPXOLA5uFkvnNtWX41PvMlshdG6QCc1L0L+ceKgNe7M295F/mG5hF0u8/mVG12YEbShXgYZVNYCNjA3bZx5gpJ2T
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(56012099006)(261102123227099003)(261022075727099003)(261021121427099003)(261009223027099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mGJRrbqJL1nuFzw5p2LKhX/23y0O7ZwUYZJ6oHe+c7ESqfC2CnEbtLD96pkZ?=
 =?us-ascii?Q?LJBCrVWmWzDm98z4MZSXtnDvlLRn2w2+s7/9T1FwP1Yn+W5ld59wBa3RnQ1I?=
 =?us-ascii?Q?IWH+f76+Hha/2LXMWl/H9qbD0ZkETlg3hUCDSMAfvRbmWpynpp+se3rPmVyK?=
 =?us-ascii?Q?pFpMWoXI3GvMslf35qWeSj3dAMGPYDxaGCH2weRyjaQLwBA7bhwTlkemv0YN?=
 =?us-ascii?Q?aNbu1eLerTV5CXTIamSxHukyB+tq+WMBqOfxvvgAwoSGPsa6TUagOfXMnFFY?=
 =?us-ascii?Q?pHbX1/pPJzWo7yugPrwRehVR6KzTJSpjiBgQEip5Jch2DDNsbhHJaSXqw6z3?=
 =?us-ascii?Q?RPz3XJKiV2QCBO3YOfNxDHVoprzO/hNDUUsShjlsgSo8mtyYc1qG6TTMmUsb?=
 =?us-ascii?Q?m38zPUlBMPF/uXsDZS5DBHrYyTc6nE9uU3D5SJ4x/fpekKXwhBYiRNXPUBYq?=
 =?us-ascii?Q?OD/YUiMX+8YO9S0WJk7q64WMEJJ3QIFfXSfNork/nxA8QPcZfRUsiatqYDLH?=
 =?us-ascii?Q?nPVPikK42j+qtftRVv9t/LoAuE9pwlUyoewh/8f/EAdhTz1LS2ci8VZ63GTl?=
 =?us-ascii?Q?YaDhRQPcYxsZo88jBBrUFfVfZ/wcDeG9+KLEwA3uV5R5jbcKXC7iLXd2arHc?=
 =?us-ascii?Q?xA+5ZGVqaqrr3+PH5l0BiLe40JbewWkalaMomg4n2vi3Olxmq2e6yPSQMaIH?=
 =?us-ascii?Q?DYzx8dm0eV9gSKqdOhcC71TcMDEp5SDUWs5IWHm6mFdx5htSomiKR5DhFNCc?=
 =?us-ascii?Q?Cya0H+vrb6pVCoAk+kw0g7TBJm8rBvEmqTbOpiDUsH/iXRGx2uzfINC1+GzO?=
 =?us-ascii?Q?Y7H78cUfpgEpKNe1B3I3avT/1sgJ1JWYjwHNos8APJsk+JuGqGnOyZs8ttlk?=
 =?us-ascii?Q?US3S1GOmgIC+2sxr9WFpu3OHkU/JcBrazMTZ+yADCfi6EY3pvqqeiRcgaPYG?=
 =?us-ascii?Q?uU1XWUwH5DQq3ccq2McS3aqXFvSLGD2PN4h13/K0+5K038nDyQ+OQh1FynnL?=
 =?us-ascii?Q?M9ioa+GN405Y24OUv+3Q0QpDOyXTkecQrlFxzAF2wg0cupOVA1ekderC6ao1?=
 =?us-ascii?Q?i9tWowNp+R63UzRUfN1IatNntZB1U2uvaOJD0etEHVxgAPAf5ywQd0HIbkG2?=
 =?us-ascii?Q?MBB+U6gDnzbwT+ClxAFOHjuNbYd0TSgtihf/LbTyFGjvejMRFgkOhMuPE910?=
 =?us-ascii?Q?zEcWrycQIyxTHX9uvzoHnB9f2QsGEnp9dY2wRgwcic3SyY47XoOesPrwCDNv?=
 =?us-ascii?Q?T48kVVwHfUZ/+a0SEwq6yaoFd9vubbNC7jFQwmb/dB4HgYgdVzy95oqB7h+3?=
 =?us-ascii?Q?cTwKoNTwky/GvokBkm5hF5PgBCB/P0Qu3Fbqq5B2M/qYIrHDzVHCaaElSRA5?=
 =?us-ascii?Q?PhfsEbwA2s+OPRZfAdjg0mGCbKzCgiOXFWAx+19WEoa5XskKi4jAHxZ+IPZe?=
 =?us-ascii?Q?8db4ZUQWR8Jy/C/NE3+IW5ZyxcoxlDdZI/aDiARHyiMtUmiZOXMMuuE2av6r?=
 =?us-ascii?Q?d8n6OD9Uc/yuK0psir/QnpB3l4jNYUp3zy8dXPbg+8Ntm1g+R2byfGNlJ6RA?=
 =?us-ascii?Q?0tNuDFZwKneYniJoL6op9IRMh/OyJoM+wUlQd43d3MZlfMebHtYbT1qVoO9M?=
 =?us-ascii?Q?3gYQQdh8sxFiUBcbvi5CsIlB6G8vTaxynO61FptBw+KyaRbFC7ivrfPCjndr?=
 =?us-ascii?Q?yqkfkB/85JpWFfa7QpJ4SSzCsjEKlt3FzSiW+H02bOmvB1ecIq39TqaMxD3u?=
 =?us-ascii?Q?ZEF0vca0LdZR02iGf/oRKpOMgNhecW3vZ2B59Y49ZTDuJaRftBqJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab4a3c9-3f99-4082-525e-08df41a3bdeb
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:32:43.3617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppZQzjq+WZFuM9htmHX2spQBMnvjFOCrEs7bkN/XxtVQVgM4SW7LsoWu3BbFnOx4h122/zv6wxVrLvsCSfD78TijPtIlgTrhU37VQJ5iQ+cG1DruLuc2DvDBNy+uD7zf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4PR04MB290288

On Fri, Nov 13, 2026 at 05:00:05PM +0100, Benjamin Hahn wrote:

subject Add overlay for som temperature sensors and ...

> Add overlays for SoM temperature sensors and M.2 Key-E WIFI/BT cards
> that need the nxp,88w8987-bt compatible in devicetree (tested on
> IW611/IW612).
>
> Signed-off-by: Benjamin Hahn <B.Hahn@phytec.de>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  9 ++++++++
>  .../imx95-phyflex-fpsc-g-som-temperature.dtso      | 23 +++++++++++++++++++++
>  .../imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso | 24 ++++++++++++++++++++++

which is independ, suggest use two patches to do that.

>  3 files changed, 56 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 4eb7508193e7..17b357f4886a 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -739,7 +739,16 @@ imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
>
> +imx95-phyflex-fpsc-g-som-temperature-dtbs := \
> +			  imx95-phyflex-libra-rdk.dtb \
> +			  imx95-phyflex-fpsc-g-som-temperature.dtbo
> +imx95-phyflex-libra-rdk-bluetooth-88w8987-dtbs := \
> +			  imx95-phyflex-libra-rdk.dtb \
> +			  imx95-phyflex-libra-rdk-bluetooth-88w8987.dtbo
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-fpsc-g-som-temperature.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx95-phyflex-libra-rdk-bluetooth-88w8987.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso
> new file mode 100644
> index 000000000000..84afe1ff9f06
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-fpsc-g-som-temperature.dtso
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&dram_sense {
> +	status = "okay";
> +};
> +
> +&emmc_sense {
> +	status = "okay";
> +};
> +
> +&ethphy_sense {
> +	status = "okay";
> +};
> +
> +&pmic_sense {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
> new file mode 100644
> index 000000000000..1601e04b3940
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w8987.dtso
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&lpuart8 {
> +	bluetooth {

Can you add label for bluetooth at boards file, so this overlay can
reuse for other 88w8987-bt module.

> +		compatible = "nxp,88w8987-bt";
> +		fw-init-baudrate = <115200>;
> +	};
> +};
> +
> +&gpio_expander1 {
> +	uart1_bt_rs_sel: bt-rs-hog {
> +		gpios = <14 GPIO_ACTIVE_HIGH>;
> +		gpio-hog;

Look like it is pinmux ref gpio-mux

https://lore.kernel.org/imx/20261023-dxl_lcdif-v4-5-4ae8395a4b23@nxp.com/

Frank
> +		line-name = "UART1_BT_RS_SEL";
> +		output-high;
> +	};
> +};
>
> --
> 2.53.0
>
>
