Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DBF47427B;
	Thu, 27 Aug 2026 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837606; cv=fail; b=GsKRkPdTLKO5bjEVkQ5y31RPPThTeIP2RGgrhcM3fbrd/UA03EO18f2Dx9aki4T4FI5GHGPHJ+SpZIAXhPEMwWnQTKRilPzoSFt2ScgJRo8d7/TgYxUiWiDb+3+p8ygfwvwqlFa9NN7h/HdDb9VR/JeZh2NwMo9wsKdEPUjhqWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837606; c=relaxed/simple;
	bh=N+FNJ7wGQCawVdTZQ/BWO+GXxabF223/mUk62gLd2MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oXZLTV+jTgAvxz7KRO5c7ZVrdsWBmwI+dEPR5ov7lxHy2iFENemCdIojNYFk1oDrp+c8SocAPLobGg4KzyAf9Fq5PCNObGKOLmYlTjJd8X6+/SuvW5oVF2GO8drE5asQkUuHrBSBF6PqZ+I+MJeDXVy1AcauG8XtZQJ1tFoiqsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CZ+IRXza; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CZ+IRXza"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k44odh9JxhZ8klyVgQZ4s15VxMcEsHJCwhEwtil2g+IvfuMkcs4ZAsorjh4n2H9jJ/uytAkwbup478tHRC/Ug4Hlxn5BmGIjl3On39kxsPFv4wrtwotY1RshBsU190lAEOJEmw4IZRA5V+p10YdHy5ObHxYM+a947G3WcNnMxeyRNkP4EuH+T1zWO8/u00FQ3hJXhDLpAqcWtC+vVWzSq2O5y5Dw0ZPrEZB8JyC9P9tNEErvMPF/C1KNF3z3XD1K7iztz7FDrzRYGWjkPhMcnV0Shwo5pDnsu5dSOmcRqujH812nxiUcFN2PJO6/xG4KrBd+TtfSdxux2JxA5sWLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=docHcXUwyqUVR6hvcRJjWqpxghBctU9ZItOJHqA03ZA=;
 b=mjlNCJPW6oeHqfNufm1vDVSM9HLDwfbdz1ZtoSGuYVXF/8JOM6HK4j1cJ5+yngYxMxtC8ChIvZKTk2edQwA1Cpua4C8DRtYoVYX7PiEMIx2nqkY9dcEiDnLGiD1K4MXjtmJqI7jJojqYCdmCm1hd1UxE9nIkTwBq9/6WDqexaFAa4OI6sKqD2cl5sV58FU7GeG8zDtgC0nv94dn91WTYiF7/WxafKb/az0S0Vsk16SUcErMyBNsAqQkpcuY6otkpqXD5lnLGHZ36A1MU4lriRVoY2SaddpgOBHmf3Ev97LifpnGXsEN3VrUBAvhdNqPWyyRELpEEwxa3bmiKtn/pvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=docHcXUwyqUVR6hvcRJjWqpxghBctU9ZItOJHqA03ZA=;
 b=CZ+IRXzabgjoKdiizcacu+lh+rU/20dzoFAPn3vLFSEqbcNbf9DuCGZjm1ZQAcBGq1n8L981LguX2EEXJc4+CEYn8i9EPXy5DfGdwu3TFkXgOl+hnFcuUv0YOwWw1snZwPT036/KpL8FsKFAgqrM6+cUjah/aE9NETnwIe2Higw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TYCPR01MB6736.jpnprd01.prod.outlook.com (2603:1096:400:9f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 13:33:08 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 13:33:08 +0000
Date: Thu, 27 Aug 2026 15:32:51 +0200
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
Subject: Re: [PATCH v3 11/13] arm64: dts: renesas: r9a08g046: Add LVDS node
Message-ID: <apA8gw3o27nJQTHF@tom-desktop>
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-12-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826174854.199139-12-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0211.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::7) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TYCPR01MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: ce9963cc-45e0-44a8-031c-08df043fbb2d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|52116014|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	3CI2tRhlhlBG21TPcU8JhM3hTbfdpqiVOMTRCxTYim1FqBQRdrVtBHb8+ra5gy5fEPrHWE3A26ZQN41FgEghvxawjHquyTQgbmeeCNJzcC6V8xeIH4VZ6lI9ghoo5c9VdhBtCdK4QOjzEIJuWi9Hurk2h/1ZCz7t9g/5uo/aLummS2RTM5oN5oPrQIfS5nSpkWZkZY1KgjhqoP/dZoeurNjYAZOaveLrMTM5r0VHCenTF86BB7LwzZZind+2+n2RXOkISXYxmb0o7QFvAWxFiyXURmX4dYKZL/M+3/FMsY20Ytt7dSLQ00mx9fjscso3bcZsSF4ifXjkqYSsLPeNX+KlxlL6HFhdMI0ThZ6s6bReCVXMsoGAOVIO27I3Xj+/BWmgKeUA0I1yV5dvw3HUDiOp1kX98GC1u5Ls75MhggrzgEkxoopm5sw5tfkNLF7XYSv50q12L7n363L/5TINOh7uztRugi6tq/17WTQLCg9YRHfOSd3Z3G6Y24kbsgrUfQf+B/X7ZaGP2AguAUDICHgth6qeKsc2yX3kho4rq4vQSkmZyhbCCHAxWDsOPK6HcXAt9ovxaY5gv7p3vLYrotdw3NpQhjV1wnGGHHDjOOuFaCZ3YuFJMQC9WDU1TKi8Qv9/FxlXI13jeAtbvnWPFoB2nQarGWpbzydoDFkBPdWqFkepxXJRtijp2uu/57q0w9FwdQY6+3zfSmf1hbMrYLFaObD1lJ3NF6twytSTDkY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(52116014)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AkWnctTCo9biNrWW1FLqDHfrco8ToBfIQsnyXsqspl8t0l9qTn+GWCym8ni6?=
 =?us-ascii?Q?TY5Wjt8EA43GcdT6zptBQXZzHM7KXeCjitSPrVuBMAbOxVldy8JM4odlbZy0?=
 =?us-ascii?Q?j6WktkbtESsdp1HnMmGGD7jMwXGIuwttJhEsSoiVqBmQlRZGLbNGMHsE9euD?=
 =?us-ascii?Q?wq6C9hTiCHA8bnPXZtf1tfkbi590DC65XTY3cHE0HtaxTwtGH1mwhFnJlM4y?=
 =?us-ascii?Q?6sfkUYO4bWC5XmPo0vrvUy8DsAWL1MfAHiBACLICTKw0ZFuuUIh4G2dSblmL?=
 =?us-ascii?Q?9ckrm5dqlZY8pA3p+9yZrdfv0YuxCrQ2/VsqOWuacxqMYk8aPrR3yoFF8SMP?=
 =?us-ascii?Q?gqYFkYJTCyA65VhH0M8i0XY0+/GUE++QjRMMlyRL4CLZ/nKwhx/7hSwxzyUW?=
 =?us-ascii?Q?CJ7JRnCcMnDutgSzAgf/1spnTgbCkryBNJ7YDpBYbJppWgx+CISERU159ZY1?=
 =?us-ascii?Q?YPbpBn4wQFinsMC1zYCkey+7qOkwwmdQFpHmx8nMGDXD4yrV2MB6v3l8KQlt?=
 =?us-ascii?Q?9ifGlv0hwiFLIwaY6jtc9QWtGoku7J3z2ldtwAWbveKfopyVWifzTse+ofKc?=
 =?us-ascii?Q?eTR7iivNL1jFwrqTQsz8inU6uiVumRwH+TpJoFgL2sLmf3Fd+V5b1Ypz1uS+?=
 =?us-ascii?Q?D0teALUHqRHjQ1KxEJ27/PLQ8zmcY56ws1Chd+hieYvyYS+N9r4QOHwZavZa?=
 =?us-ascii?Q?HyhzxrS3tZcQxwM8qnQXcB/JUcBSiygnlpfuUo1gKBm9aE5LjoVL8lqB5yYK?=
 =?us-ascii?Q?uifvFxa4N2uuCNKeRNUg8NJrSQAETiN8ndYmIgUQXwgo7SPN/vW6Ude8yJzi?=
 =?us-ascii?Q?YftTCmsJ9RkSR12O+Ks+NO+BSlOMk5VnvW5uWljpvP1PJpeEknEZq0Ed/8LO?=
 =?us-ascii?Q?YGximWFmonUXpS2aTaYz3N9hrAbhjEOINGPAuHLGdg6LnPQHm6+rfkEX5fve?=
 =?us-ascii?Q?uRfx2opCFzj8aA+lmnooUchNh7SCcbuyX8xqIES5yF4jICELNXCtFKzz98hQ?=
 =?us-ascii?Q?RL2YflG0cM/f4xn6YrwUJ/TsGkFPSTblTEUBoYhCcZjcGLQQxv+8xrvDus7x?=
 =?us-ascii?Q?3eMjt5eBOJnxLvCgRSPkdhXS6OM7jzKs/YSsZGQzf+hpv+3OzoAQCiqExpNV?=
 =?us-ascii?Q?jQaqmjH9Wl5FMex2HcBluQjpqQfuBUStwH/+oYDOlCgzNprLvJy42HZe5BgZ?=
 =?us-ascii?Q?GbT5yzZaUd0dItmtXA/GJpbOBdmwmten94pnthaO92wkAobZINjhE+K3432c?=
 =?us-ascii?Q?9UN3kSeZNMEzw/ksF+svBJAJCrD1F8r3T6UwiUWfjEImwVmxOPPuqRewxxtZ?=
 =?us-ascii?Q?mORCclufp8ptQSLQU+gluYzT8Lqmy5aHIwcB44o73m6kL+bVQoHWVihmjjC3?=
 =?us-ascii?Q?3z7TMODmclH24JT7kausg3LVm0mAV3zJbVLJJ59QMiWxX5hgogC3RgKsM2lX?=
 =?us-ascii?Q?QiSV3E5ud2vsSin+tili5oOsOPvuEa319CIG2hwdQVf2gXRyKkU1MQYeDd0z?=
 =?us-ascii?Q?/ewWVZd48iSZO29yEGr+Ihv5KqfDUQSS80IkhlqBUbanrKTt9+/T+RWTPiiY?=
 =?us-ascii?Q?dRCEbFG8LzRQjGkx28S28Y0iFGBTa06/najkM06LKvufy2kvQPTXr5RhQNj5?=
 =?us-ascii?Q?7bjtUo+s4nyDCxSZV5uecndhwP9b5/YcfmDIVhLajI+dH06z9TB7JBZcNsoI?=
 =?us-ascii?Q?l0Q9PZ6OnnBlfpfLGibH8SYMGO0EQFgwqM/JknKyLEUJ7/NLO3HDP2IwQBqS?=
 =?us-ascii?Q?t/1zVZPjS+e1XSAllsKgxnGaC1LU17UXaETADLIziHtOBtzOZyFH?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9963cc-45e0-44a8-031c-08df043fbb2d
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 13:33:08.4116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +aGXknQC2zcGroQpKLl6Qb6wfQjSOjeruvjQGsa8lB0Sh4POKDrRPUKBahr3sXzQ0LoDQiVesmsABqnQT+nAHPebu30CVnkMAtO07iSYbY4pMCiWQ5L4DS5T6fxjbe5k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6736

On Wed, Aug 26, 2026 at 06:48:45PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Add LVDS node to RZ/G3L SoC DTSI.
>

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change.
> v1->v2:
>  * No change.
> ---
>  arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 37 ++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> index cc8bfb24da87..f652ad3f1d1a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
> @@ -794,6 +794,43 @@ port@1 {
>  
>  				port@2 {
>  					reg = <2>;
> +					du_out_lvds: endpoint {
> +						remote-endpoint = <&lvds_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds: lvds@108a0000 {
> +			compatible = "renesas,r9a08g046-lvds";
> +			reg = <0 0x108a0000 0 0x10000>;
> +			clocks = <&cpg CPG_MOD R9A08G046_MIPI_DSI_PCLK>,
> +				 <&cpg CPG_MOD R9A08G046_LVDS_PLLCLK>,
> +				 <&cpg CPG_MOD R9A08G046_LVDS_CLK_DOT0>;
> +			clock-names = "pclk", "phyclk", "dotclk";
> +			resets = <&cpg R9A08G046_LVDS_RESET_N>,
> +				 <&cpg R9A08G046_MIPI_DSI_PRESET_N>,
> +				 <&cpg R9A08G046_MIPI_DSI_CMN_RSTB>,
> +				 <&cpg R9A08G046_MIPI_DSI_ARESET_N>;
> +			reset-names = "lvdrst", "prst", "rst", "arst";
> +			power-domains = <&cpg>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					lvds_in: endpoint {
> +						remote-endpoint = <&du_out_lvds>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					lvds_out: endpoint {
> +					};
>  				};
>  			};
>  		};
> -- 
> 2.43.0
> 
