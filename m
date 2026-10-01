Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013040.outbound.protection.outlook.com [40.107.159.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384EF3B71DB;
	Thu,  1 Oct 2026 06:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790835924; cv=fail; b=UJIoVb9r1MyZIIWX43DQm/qZZH7Tr5VsWsxJS3SYsoOmzeUVw5YUzUxPZalml3njM68sGdsMinNLZGiKmtwSA4iAYA7Y6OX0IXsTiryx3sNq2EK3uJ0juA8P1iA0xWcWHB9NLAsQk7yz6twyXcKb7AmCMZiZecqhsDHD+d1Ua7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790835924; c=relaxed/simple;
	bh=a/Ouy8W8ssqbvFWxPQEG+khFuKistsgMbgbhZNACMg4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rL+tPJNTaXoGNFTuM0gXaJzhNWRfWbTwq8sxWQiH8SDxxSxQLqPQgT6p6pvkWC2xSffPahObklQKuc6bZckNzOlGZx4/lC0nRWZyNygZuA9TgW8W+Li7e+bQHXOmIGBLg6KVzlEPW+te6JMuiWFuM0rd4feJiSEgbSOTe9DNpaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mYrwaZmz; arc=fail smtp.client-ip=40.107.159.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mYrwaZmz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SEgcrMdKaWm5KZIywYuMMcR+GAtMlCpvsNaZj+/sOxOehXhyBkIfngZ9Y8nt3oQnCOYGmMmtA/WCZGGzj5Ke55KmnbQi6NjQHxRd0zqFEhQJPXnTB2bRdpgJvv2Yhy6G9nqKGqV6Sf4gq8NynHaH+rssZdkiRng/ejq3PSZC6elzZwF47j2kR301NTWKhkJmH/7NzV7oW9jIGece8kE+q18S242kKaN7fM0qO1tkhn5kgCC29Zlgsvswm4OqoncG5yuMxpv7aeWnrHbpZJHaW8YIth/9KGNdMEOhOTAGnWLJVP6jjZwbBRSbWUYOsOJdqtv4U2van6UptYYIWkQqPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRQmgk4Zgm990HGJ+inpszgpxlOhssO+EdhZ0EFhuBA=;
 b=vrJ0Qt4I1JlINsYQMjhJdl4HVnIrImwWweLwlnLKY/G2PyZVj78N2njM4zNaoQV1khoHcnm2ahtqtEZkwDliS9Ss8xj9g3sJh/9NR5Hlz6W/8vV13CDMeqre5vB8LHiCfVltVwqV3Q5FkCQnPvbHXERMZ/Kcs/vLdSUd8z3RCmt6SAKvZ9XV5tO4w/1o9KYXBJ4/hDiyfOy61B+NlKj7S3Z0AnZ32cBQlBw1aaK6+nBmEx1EN2CcEklAXcRU1Xx03gTbDRUxo2DxqxQQjEyYvE/ymjCHe4OLNNXQ8NbI0tzvxycfkl77Qy5kCHDCEepuerLDZ5tZFxdljqbowO2cLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRQmgk4Zgm990HGJ+inpszgpxlOhssO+EdhZ0EFhuBA=;
 b=mYrwaZmztU41O2d8Z6WY+JmIT97yrAaiqy8znwVPJTdNALHm3uAV7QbhC1GbCnVrsRV8sXayhpJs26auPbPweBF8pwAQRe5QvQlocSAgDM+bZYeHqRtoxDhV/h1bYAER75QKcznRDRxRURXk1ZBTWzz44hXa4hNEUMxDfubcULRanuqkvSbpgaLaqzUhF81+mYHmNpy3dNclvI27XMdh+m/2NpN4dynFp1oUrmewWDDHHCXG7kqT4mVjgEuErE0z0EUTlWYwPDGrOErlcX4gTJ5UNsH3CbKa0gmz7+OiuGjLA/VwySpIQQrSRWat0DrhLcASBbwRhz43zko5IHwAxA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV4PR04MB537162.eurprd04.prod.outlook.com (2603:10a6:150:403::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 06:25:19 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 06:25:19 +0000
Message-ID: <bf5ef25f-d04b-4064-bb4a-802d80c7075e@oss.nxp.com>
Date: Thu, 1 Oct 2026 09:28:49 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: freescale: Drop undocumented "hardware" root
 node properties
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261001011233.1306251-1-robh@kernel.org>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20261001011233.1306251-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR02CA0177.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::14) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV4PR04MB537162:EE_
X-MS-Office365-Filtering-Correlation-Id: 024d9cb8-3e9a-4443-0733-08df1f84c3de
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|19092799006|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	doDRNM0DiHdRt2DbvJ7WoLrZ389LzT6jJqDhPF9t8J4W4kBNrAR7IuA+zUYz0YjWfeTXYCiPUhQ0nqhDBtUWhjh/agQh0nnhqQ3zHIt4iIzZK5edYceJePE9fAdmgPWUZXYUO0KGjySbgGu/AyK6hmvHGJP/ySXfapRAJsK/mXianxZF/K5pSdLGbVZsrmtEGEerxhMVLUuCc09CJdMT0Ak2b9AQbrjdYoDdE7p9lztVf3kvnXk975NwxFCY53oHiuY4Y7ph80QRwRyBINm/JPQz6TgN6WOTqmZMxodj46Zk3ixUWFQrvnTZvBm/ZJkGzRbFP6t4tPfsN0dAiUlXFSZo+ZhHIGu+Y0QQSnmaJ0imGCmRFjBGgkOR0LCTr79JKKKozZVyG943KlaiIUtUyprwzFGiwSVeXqo3ERyXR3Dw4yhZa3HvG2TDlyjufygvYSVkIVM4pITfgh/sOm3AOS3l8H1Ir/i5g2n3/wOe4VgzJYy9wqfHDmDvEPDsPaLXSznSl8LqrKFmM5tqyuYMjUe7OuNDSeRMN/UD51VV8ulU3Ur8mSi2zQy/DKKljRvov5OXHIbTbwYFEfPO3i9TSPlmbkmZIHxed0HIxcn+wpOgI+liTY/L+JYMBoBmINY9SD5vVK3p2koAjPRNa3zTvJsscj1/byPcaxR9wd+0icg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(19092799006)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXlwaDdoVVpUVlRFdEY1UUJlSGtUd1k2bUlEalRyYkxaaG9pdXY1OGR6Mmc4?=
 =?utf-8?B?NUdGVjRQeUNHenBkZkMvR043b01sU0hpcUp2anBBMG1uS3pEbW0xU25JWDBQ?=
 =?utf-8?B?b3ZaZ1FpT1A0czdOc0w1RTBjV0ZZZTNJa3RXNU1BVnhkVHhCZVllbVVQZEx1?=
 =?utf-8?B?UTNhb3dZd2ZmTk1jVjhuSy9ORlhUM1dOLzdvQXJKR2tKckErbzlGWEFWZGJN?=
 =?utf-8?B?ME1uallJK3dmNVFiY2p4M2xDT05CMUg1alpSWm5rMVJLK2ZNK3plb0FFSlkx?=
 =?utf-8?B?NGNqWmM4VWpMeHNvSmQ0OXJhMHo2cHRaVmMvMkE2VzZhcFhsTkZRV05jQmlD?=
 =?utf-8?B?L0pxcXB0ODhqWkdzeENMV01hd2kzZzhQQ0NkcUxjenFsVU1FbCtIdVhtVjBp?=
 =?utf-8?B?MmJiWjVLb0xjVU1NblNoRDN4TDdIT2ZFRStGUHY2UUdvT3VRZjkzdEdoQVpW?=
 =?utf-8?B?ZmJSMDlDQXg1RGpMRlJnMFRzRTBVbERiUHJjVEYvK01wRjNjZWxYc1U0NUFs?=
 =?utf-8?B?T3ZUL3VvMlMwQUczaXFmZHZMWVJOWWE4SzBDb0FmWWJhVG5pT2RraHcwYlNm?=
 =?utf-8?B?SDlkQ0pqRnMvSE9yVzZ2R3BoWTVMSTc3aGUzQUJWRlNzWUZ1NVEyTHpIMytl?=
 =?utf-8?B?NHFrQllxV0c5TDVkS1JPcWZETUt4OFFhVGNQRGlTMUtsdW5naE1TbGsxNk1W?=
 =?utf-8?B?ZDBhSVJ2RzNaa0crY081Mk1TOUV0NFZIUjZpWmM1ajUrQ0dCNHh6cVFpOFJj?=
 =?utf-8?B?R2V3a1ZtZVIySUhMdkF2ODlhSEdPWEhCRzI2M29TOG9ydUlzbFdKOGtXei9D?=
 =?utf-8?B?bkR4dXpVeUxMZXRuUzBNdm5jQlY5T2VYMFVoV0xxaUlnMHpTaHRTbEQ1c2VK?=
 =?utf-8?B?b21LT2ovNWV2djB3UzhVaVZBZi9tTFlHRWtCaHYxa0xxaCsrd2RXSndvaURW?=
 =?utf-8?B?M3YrcmxDK2JvemZ5Z2Q5UExzVG5rSVUydGJ6eEV3c1V1eng4b2hDRjBnbW50?=
 =?utf-8?B?UGlBKzV3OHdEK2Y0M3p0SXcrM093bFBIc3ZhS1hvQ2o4dzZmaFdoeUhGV3Fn?=
 =?utf-8?B?eVcvVEQvZ21Dc3RqaFJ0K1hqUnJQUUFNWVQwVlowSDRyaTFUOFNlb0pEb01P?=
 =?utf-8?B?VVIrTU8xWkZmbURETG15YXlyZjB2a0JXcW02QkJhMWVjczJBV2NXSlF6UHZp?=
 =?utf-8?B?YmNBNFg4SDNNRnNxYTdEV2J2RGVoeld0am02VmI4M1JIZGdJWFpCb21XUmI5?=
 =?utf-8?B?Z2hXTUpUeVNhQVFxRjBFdjZFY2JRdGdaWFRNTUthV0NPa1JYaHdXSEdCZy84?=
 =?utf-8?B?clBUZWN0d1JRSFJyeUdUeFZkNUFSZDNTeWZ4YjIxUnI2NDFibm81WnRmY2hV?=
 =?utf-8?B?MUxrcVR2UGQ1SkJzc2lray9VanBJS2JIWWhpMm5id1IzS1VleHJDWElvalRD?=
 =?utf-8?B?SkVHNW93TnpaRmdhcjhMYXMyNjk5M2g1d3ZxTkt4SjlMZXR2SmNCbFVVR3k3?=
 =?utf-8?B?MFIvS1EvWndoTTFXRFMrR05DS1ZXVDBVbHZiSWZNTTlhYUNUaFhVbG50TUNH?=
 =?utf-8?B?ZUMwY2krdHE1bXF2eFBhTWRDSThadS9WaGs1WmdVM1grSE9MODY5SERBUWhU?=
 =?utf-8?B?M1pTcHJpTUVGK3ZJS0ZoNkxkY2dEM05CQWU5RW1wTTRDMFBSOHNFNkNhOW1F?=
 =?utf-8?B?SFJrZVRSY2tFdHNMYSswL3Q0RHprRTk0dm40dG9HbmZ1ZEUrRFdLY3hCamZI?=
 =?utf-8?B?Z09sM3RBcHIweDNyclZiTWtFc21MamJiYm4ydHpxUnFUNGNKQ0xtU1RpaEpZ?=
 =?utf-8?B?WmZuYkxVNkpPUFlPaG9xT2Z6c3h1bnA0K0Izby9jNDJBSzdCdDNoTVBiN3Fw?=
 =?utf-8?B?eWdtclp2UlQ4dzh1VHQ4QUNyM3grYjV1OHNRdkdnYjRoSzg1azhWSDhhRExJ?=
 =?utf-8?B?cHR3UVhRaUUyZnd1dDIwMElvcGI0UVBtUzBrZVZhekRXQ0FLazFQTGUxYURO?=
 =?utf-8?B?R1NNS3U5ZGI0cE5qSi9FSUY3S2hWRkFqYmZyWkVwVldPZjlHY0dCdzkzMGNz?=
 =?utf-8?B?RTF2R3JSZmVzRUVJTTlEeUpiMmZKNlAzbmNoSGNkaCt3dS9LVTJJbW9wZW5S?=
 =?utf-8?B?bUIwcTZzcTBRZm9icndWY1Y1L1kyeTRITzZXVDZsT2Y3Ymw4bWE3VWxZMks2?=
 =?utf-8?B?V3h2R1NrL25wcXR0eHVHTFFsOXFXVXpnWVdHcFNoSUpUdE95NjhjRkRCZzVU?=
 =?utf-8?B?SnhCQi9HeXFLU2FmMjlQQkJad2pPbWNhM0F3WEYwY2NpanVpemdLbC9EM202?=
 =?utf-8?B?RGVHb1haRWpqWkFLWmJZaFQzdDdWVGV6UU0rVTN1TFpaOTM1eXNsdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 024d9cb8-3e9a-4443-0733-08df1f84c3de
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 06:25:19.4615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XuloAgJlmsUnhc7ZBrlFwp0AgN+pxlirEdjQWu2OC+1Owl8Gf/ZV/c2URVW8TN+zqzWM36ZZBRa+Q4ON4IHPTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB537162

On 10/1/26 04:12, Rob Herring (Arm) wrote:
> The "hardware" property in the root node on some NXP i.MX8 boards is not
> documented. We already have both compatible and model property to
> describe the platform.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

I was looking for a fix for this, this looks good.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  .../boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts    | 1 -
>  .../boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts    | 1 -
>  .../boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
> index 6cc04aa90f21..d15297a42d8f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
> @@ -12,7 +12,6 @@
>  / {
>  	chassis-type = "embedded";
>  	compatible = "gocontroll,moduline-iv-306-d", "karo,tx8m-1610", "fsl,imx8mm";
> -	hardware = "Moduline IV V3.06-D";
>  	model = "GOcontroll Moduline IV";
>  
>  	aliases {
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts
> index 39b7d9077e8e..9148ea7c6609 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-mini-111.dts
> @@ -12,7 +12,6 @@
>  / {
>  	chassis-type = "embedded";
>  	compatible = "gocontroll,moduline-mini-111", "karo,tx8m-1610", "fsl,imx8mm";
> -	hardware = "Moduline Mini V1.11";
>  	model = "GOcontroll Moduline Mini";
>  
>  	aliases {
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
> index 87b20b856458..206992ff9640 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
> @@ -11,7 +11,6 @@
>  / {
>  	compatible = "gocontroll,moduline-display-106", "karo,tx8p-ml81", "fsl,imx8mp";
>  	chassis-type = "embedded";
> -	hardware = "Moduline Display V1.06";
>  	model = "GOcontroll Moduline Display baseboard";
>  
>  	aliases {

