Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8CD439008;
	Thu, 27 Aug 2026 10:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787827199; cv=fail; b=DyoaFw4i7mF/END6pXq5CS6Z24YcsnM1bmwpBxV2484vgNxbDORa16EAlvJy3teLfBKvA8LMxEoZ2xYTwVewpyKStPxknlW1qPsmkVC/u7uBeVHXNnIscgGudYlA8HTBiXAj11062lLONdEAuN6ECFFHZ601qB23ubRPwxKCSK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787827199; c=relaxed/simple;
	bh=egvQ65RaFOHOcYCjo2ABlDj2427jYcVQibhuH1wbC3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cNvELIs+RGNUu9LT573fgz+vYL+XQo0Gd80JgX9HDPsJ4mAetQ0FD+cTl39tPCdrNLMvnO0Yqfs6bFEJXMnxDDTD60b0uCBtECXJ4jcs7kpRgWfZP6r/W4H3uhyWSYcss61mdgnEVbCB8KCsIaRdYjHdNS24xAMwUSIVcnNTSfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HkLQW032; arc=fail smtp.client-ip=52.101.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HkLQW032"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7/HU55b4D4ALUncxP/zdGsvf/BPvTu1pQpIhFsm+l926HNjmaznhRZX8DHj8j91NH/IfqEOpBDh7aG8KvbV2XXkloJakEvazdp57MIR4OHUER8K/EcBdVIl9NMVvI6vPkwbwZCMG6O4I9tbwjHv5c3J7kp0lRUEs1mWSBOYu3W57GAZIbTsh2mAJbLDGm9nGttoaulWVSseZDeVVqI8Vh0+jP9mKB3MN/It/Co2mOz/CNft1agXbdnSYp263kFQgsR2SPnsSp6hcVKmr+vxCahFT7PceZpxH4KI5sYMm6a1Dm9cB8sYatxx2tpIy/xMjHf3GrkBR7/g0R6ZmA5qrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkAzyacJjxyEe5z/hp16/zkNjHmB3MkbQhC/SUB6+z4=;
 b=eIzleAeVso3nP5gCkIyE4LLCStdw3Qo/cOpDKD1UjVKyFPzLJ3jD0SE8rSJfgSKVFVD3ry2oqGiBhC4fpBMLBoyS+CBKDv9vE1Hn8J07J9KORUc0U+UisODBxIDdxH+kfmzCysKC3LInzz4CbI+8ZYS5s/Kz9ylrVll1Oqx5cmlA0e0U+3lHxFBIdtHoCj8LrRI00vNxAmckEoaor6izQ5JUTCyFl+yNw/w++yMJ6olKzIWsgoEano5pnuL60HdZvaqbUhFrVoW/vNo64h4LozzYHbTvb6ck7USk3tQaqH7o9QD3YZnJTrLD2jp5BQcvs7GT6Ng4drM343F133G6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkAzyacJjxyEe5z/hp16/zkNjHmB3MkbQhC/SUB6+z4=;
 b=HkLQW032xAN60YAPuhaKeZuM4QQXGdmTMpUL7lrRerAo1d4x7nsl7kj/PpL2yiycNsBHjG+l3Mf1urJO4aCxbPNeUGesGWFOumd3njLsuKe0GbBjbIvANiE4NwNH21VQFVykkU+ej/CJEkb0H2kBlZYA12FOsaBcDqzzgjU7t4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSCPR01MB14369.jpnprd01.prod.outlook.com (2603:1096:604:3a0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Thu, 27 Aug
 2026 10:39:50 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 10:39:50 +0000
Date: Thu, 27 Aug 2026 12:39:38 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 09/13] arm64: dts: renesas: r9a08g046: Add vspd node
Message-ID: <apAT6qiBpkum_SLc@tom-desktop>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-10-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826174854.199139-10-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: LO4P265CA0157.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::14) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OSCPR01MB14369:EE_
X-MS-Office365-Filtering-Correlation-Id: bc460796-3628-462b-ea74-08df0427853f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|1800799024|376014|10067099003|4143699003|22082099003|18002099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	lp69BRPIy4dJMtJKtdbW94iHrZFlNUjJva+MYVMf7/xyZUKZQ2EkPHE6eYr5jUwCmNwDxMd1VIw9ZAFhz3ziJJTzCfqT3n5oIKSedSPtFr9g/Nsm1McOTfXoHSu88ShqmZvevbJxs7m6TjsdH6Yn4trYVmZ7t4yE9kYLATHZTAP6Z0YZ7+kGJquMJqXcpn9Wvfe1OnAqnfw8USqwuFgScFt/ZaRs79RgVAcVueLeNwI2jaup1NvA3bwgMVQwnidCZDbujWd91TH0Jku3fswimcRUSuVwZ3TBiNfa+qCvQ5D/1muJW1v1hO77s4VEaLYIsr1M2DA9NSQzhlUJIjdnUaZKZ3+TuPmJiT1YIshX6eDjr698RZ2QifcFJCi/N04m5k+mXOw+wtMV4qHeqyFErAgEW01OaqT9AboFyUBHZVq3DVRfUCtLdqushuv8cQ2ilRHaUE9PVKemojSlf/0C+nvWOd4WRDu6nTrfKspqnri9AxbrSlQIBs3IzCJPAnf2TOtOUEYGBnpuU/1EQhfOzgqms9iScctuPbJ/hDxL3srtcvpGODsS4kQlquoCLaWmAa6KLu5xSxohBBEDWx4i+gaxZ2fviTfhQbQkAprTF9vUmiQyrEFOg4YTeLNXZa0msbZn6b68mN5i/4MHbINQCL0QqoNot6qatC3SsdHfAkMqjRYyyc13LvMG6PoTeEvoV7fJx2eIoG88FLq4EoptlnbEX2Vir1dcpOb4CWQ54dk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(1800799024)(376014)(10067099003)(4143699003)(22082099003)(18002099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1dUrnSnBbp5WoE6fNeJf6hNNLGLECdR2n7783dGTq955+uKMLNPvgeAGaCsT?=
 =?us-ascii?Q?sYHYG8qtIYI6F6to47Q5/0qpI83n5YK2OB+t/yO7pGRVZzr5vnm4wLYPo+D3?=
 =?us-ascii?Q?v9hmT/TUgrdm/Wh0qOVxuUXc0c0AMBTL2Vteelegb2hyAQ95HHBZYitLjOcT?=
 =?us-ascii?Q?HaS60kon1nU6hBDvQdjwCzqb7AHo7mQMcxBQaoK5NmR651L8m73Vgqm9E67e?=
 =?us-ascii?Q?A3iSlNO2lBXnuo6q9EFae1Xoi2oWxZUG+7VP/IfEVuY9evWt95e4d0Kx6VY2?=
 =?us-ascii?Q?p7KcWlAptNC5JidDZYzgsmbi/zs7+HXS0kYtX6rj/UHrXogBXOkrrV7MWGKd?=
 =?us-ascii?Q?YAJcLtge1poJgJx3kDzFOsg5MHlnjPELtL/gXzxL27MBQtyyotsFWthxP68u?=
 =?us-ascii?Q?LhExq6leTLAjtpeHX36Rt+R8a9WsoDz/bBS0Aab5Qzd/blIN37arSHmBL7XT?=
 =?us-ascii?Q?KDmEAGu7py9a1LxEP682yIHJMAAEbY9t7c+hDBzT46pLYDnhQf4JpANTbuvb?=
 =?us-ascii?Q?qfqpWahuxNBkJVmPPXTYRwZDB5c8+bE5tO/NNT5tQ/cOd3vkD706IFIIrRsz?=
 =?us-ascii?Q?xykPP/5Y6nYTuL1CTDEXfu3fNFcT5ot9qcsj4ozLrgzAVqRIPg1Z4L3mYvMp?=
 =?us-ascii?Q?1On5/5jjcCphfxEnpegXwyuG60/pjMYG1pSxt0WWOO8WSUAaiCi2U7NK/n2X?=
 =?us-ascii?Q?2f58rXaVoc5p/ZP5XROnaUT2J+heN5Pf538shpuaqozXVpnD5l9aQTUHOmG1?=
 =?us-ascii?Q?snumCk+M34twbqSBe7+BzxJpnPF+pYPeFniC2YNzh6aGkc89StGRcttqs7JI?=
 =?us-ascii?Q?XwkTriMGbow7qeAfces24PAw9I1vEnDGA54DeINGGQAoW+c2mQA/I/CNMr++?=
 =?us-ascii?Q?WNx/XNAUOv4cCBM12B0cVDq9hqZwbmKlwPg6xI5+pK+3u6ahslE3IWfpyCK8?=
 =?us-ascii?Q?b8TfRWyN7bJXA+pebs8SG3B6cZHuKg/2bo0wTPZ7GIQrHt5N0Nrw/5cntab7?=
 =?us-ascii?Q?Rja4CzEXH3bhoYCFeK3qRzasNqOKittJUsyv98U7jrLAAABqDm/31vKJMA7g?=
 =?us-ascii?Q?zS38U7yrBJY/m27F7zhLvDaf7b+J2AIWqGOldcMh7GwwhCrzIj00cl0l71WE?=
 =?us-ascii?Q?/Qg7OpX3YNQtvMt8LPjz1Rxwo9SfoDEDWcSCv5bn1WCI7E7ZRUnN3X51wLJC?=
 =?us-ascii?Q?NxaHR7o5/HVVGnAUQs5Sk+2foGInvlK1+2uRdgaB7Am510qBknQH6X7ln0/v?=
 =?us-ascii?Q?Wm8cGr/XvrIeMm59EPtKmQvNt+sVTh8yy8z3cDoTOblHoYibcmWc98C9XIdA?=
 =?us-ascii?Q?Wk5HOG3/VLPFIoBl0eDB+5q3Cruj9/3dzXVqd3y44Y/h0wCLRDUB82LphFCE?=
 =?us-ascii?Q?7zB//VrLGOVBV7AY2DgUvZMpuqhf3Z8Dl/Ju+m7ZoNEMX7Ddy/KXlWJdTs28?=
 =?us-ascii?Q?/K7ukOmu6DUnVZ2Mmm6eXU7boIendEwIrNiVz7wJkzpkUy0hWejJLCZfJnjy?=
 =?us-ascii?Q?LapkuDsxFcsTnfd+BKbaPmVHLdbI804AlUNdufpHpnQjBde6FDpxAxFM9Ikn?=
 =?us-ascii?Q?BEMYErFxau6nfqSK03GRZc6yO0teaO2GOiQV0TmWQlX/BqTnXUVH0ZlAZhtQ?=
 =?us-ascii?Q?XjlqB9hI07xy68aFDjEHizbhSdEAsbujHVdDhIQyfhcXfbixgEYfyeW4GXv5?=
 =?us-ascii?Q?+S3jdBwd7zNAX8XOcNm1pV0ePSfOc5QvHdEw7ULAmwwNGRT2dIrY7St67LR/?=
 =?us-ascii?Q?0mN6v1qOhpCVmQf4Mmfv8R6GVc7AXgJACALUdc1b+Vm2njWRoNuw?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc460796-3628-462b-ea74-08df0427853f
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 10:39:50.1580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nE6HK/g9p6AFZUrRjk55k4Mi0lrc/zpkDtGApf7iwiM0qEdk076UFFSiQKOaULT7K+mVh8OHxQij/8IhYEqhWwBQq95IhzMbExO+rqX3hOgXCF8/hBv7D5nTFWzjKneR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14369

Hi Biju,
Thanks for your patch.

On Wed, Aug 26, 2026 at 06:48:43PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add vspd node to RZ/G3L SoC DTSI.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change.
> v1->v2:
>  * No change.
> ---
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> index ad38aee2efb3..6ff145dc81fa 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -696,6 +696,20 @@ ssi3: ssi@100e4c00 {
>  			status = "disabled";
>  		};
>  
> +		vspd: vsp@10870000 {
> +			compatible = "renesas,r9a08g046-vsp2",
> +				     "renesas,r9a07g044-vsp2";
> +			reg = <0 0x10870000 0 0x10000>;
> +			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
> +				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
> +				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
> +			clock-names = "aclk", "pclk", "vclk";
> +			resets = <&cpg R9A08G046_LCDC_RESET_N>;
> +			power-domains = <&cpg>;

Same here IMHO we can switch resets with power-domains position.
Apart from that LGTM.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Kind regards,
Tommaso

> +			renesas,fcp = <&fcpvd>;
> +		};
> +
>  		fcpvd: fcp@10880000 {
>  			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
>  			reg = <0 0x10880000 0 0x10000>;
> -- 
> 2.43.0
> 
