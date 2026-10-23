Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.0
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792737877;
	b=KDfuWteZqQBu5wrvZK9T+6wO4PlgVO9yITHyXME4A4aGe8dRupKMekcejtZcLVUpjJz9
	 vpmVyNjTJvaMa8IeIQliPCVt9/O83OQzhHpqvOD2WjP0YqlS+T0VCAJAKNUXpcVX4OPpa
	 rx3kngf3YIl2jtzVOVYf3z8jPQGCMb5vpTDp2g0XKS6GSIZIuEEBUg0Q1fkjU/rEjNKRM
	 VZIJSdmaEtbwpY7sl15mE6Y8YUmjxII5gMtbrZwxsTlhSEoHKdk1Ft4l5wHmLPU6PjbJU
	 iH959TfH8nOHbtXLnoBplmTje292myLdzR+/FPK82PITpsdDAuYZElOZj2YH3ETEsdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737877;
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
	bh=R/8qjQCqmEM8rvKWFrYCafbun6SZs/uBWYWjaHXCc6g=;
	b=MyRnefzudvG5G3gWp8NKOGu24A9PP+nNZ1XTEP/39pzYXR1Z+GSykbtcKlNpG0rqjm2O
	 vSydpXH79hQGHxKrMRg1OTJvX1fJoKeIUxGhDm0SUefseRlBKtvM3+wVYrNWQ5xbRhUs/
	 jx6IBc0d/rrYiAsf601V4Xa2uI4kuQCMOfvmJXDf0Vriz2pXdX6c1g0e8UDJLX/WAqH3X
	 GhdnRa6wQBDitxqNPa3u0SMrv4Z1ubRQQpGu2/6fvjLri4WiBIpxBekb0W9H13C4u9NNC
	 khwbcyInzLTGJWPDqohjkX6ayqFRVxv2L/7xtYjxjXafOpoPEAS2HnMCPqvR1haRzVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bp.renesas.com;
	spf=pass smtp.mailfrom=bp.renesas.com;
	dkim=pass header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=rskeSguL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.0
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BA1606A31B;
	Fri, 23 Oct 2026 06:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9BA1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=rskeSguL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkZIWA9SVxbpbEFbpGgxqlqfsceA3/Ym+LwzFjR9XxgU5qwc8k8TXFOKpv41DECYmE2P/yrnTkUuqbJOI0GdB3ufU9gkT8IAlPYDpLcIli4YIciMvoxQ9hAfK4USEAN5srKv/ca1kdnu1NbiDJBME8YU/BdVfDM2hawNu3icvHVFTn5m1g0Hvjp9LBb87pZq/X5bgtAxWF49AcOiVu6UYMPd73i+tEgH4iIr5YxU3aLOkcfoIkxkBHDg/9GlQVPrHwGzeqQGhEAOdBL6uH8UxnGadY19JAZu1tqQ+BrMvDcXBAT0kMrWwQOCR99hquUQiU9JLoTWoOsC7U0tNZyaDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/8qjQCqmEM8rvKWFrYCafbun6SZs/uBWYWjaHXCc6g=;
 b=G2wHGxImzY6etohMe47n90iGyla317h8r2yGXw0bHxlmbz/MpT97y2MXh2lwTC8bL2GthMF9azc0njZmFP+VMz4/5ZCpiQjPsMiI2UsaKJHMWJfkQS+papCxodiyuUsPaki19Lw0EpSrbNcNvqFNSZReHSagAzWM3jqton/mIxqPNr8KMSaMqwf6GHmHZxKCjIMqlhXF20otu4FrOdyB5/WEzpEJq+bKo6fYpsrzpwWFiIom1JJ+QZwGaLjBtzDM9YJcxwVW+uVsL9TcrkZEJqFtZhDauiw7dvZsWZPz6SRp2geXRn8kz4dS6Gx29x4XTWKZMtGoh4j0YuGTFYQe5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/8qjQCqmEM8rvKWFrYCafbun6SZs/uBWYWjaHXCc6g=;
 b=rskeSguLFBZge0pRvXn9c6dgK0kQhS91mro0Z6YYRax7weDQXIK9UC5EdhbiOs7EWdKSVC34FUoAFeRE4S5j5TpteXFjK7jFmVMrsR37jyZAFSh2dWwjv77SaSTHbSTnTqn8M/Y/lny2fICMJn7ZQVrXKeWePlhICGuvN7Y0QQU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OS3PR01MB8889.jpnprd01.prod.outlook.com (2603:1096:604:154::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 06:44:33 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 06:44:33 +0000
Date: Fri, 23 Oct 2026 08:44:15 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r9a09g047e57-smarc: Drop
 AUDIO_CLKOUT clock-frequency
Message-ID: <atsCP4pHneYvN3KB@tom-desktop>
References: <cover.1792493096.git.tommaso.merciai.xr@bp.renesas.com>
 <e2473162dc19edba539d8566c28ada810f36e73c.1792493096.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2473162dc19edba539d8566c28ada810f36e73c.1792493096.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR4P281CA0221.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::18) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
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
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OS3PR01MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: 3571da62-3f3d-4cc9-bf01-08df30d118f5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|18002099003|22082099003|261022105027099003|3023799007|11063799006|4143699003|261009223027099003|261021123027099003|10067099003|261021121427099003|260925021911599003|260925022911599003|260925021311599003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	deBSs2ythToKtd4TOl0aGfVkq43oG+rcxyhq0ddgGMXk73NwoxvL5dDWIqP+F++acV18l4no5QmPUzQwZkWLEQBuY7FV6tuS8xkS3AoBAbKcP+y/AfnGQo5xREEH6luDRc3IH6Zm/w8di7Cm+BIBeVV3HkZ3A0f5+aGJ6Dd7bQ2VlSvOJieM5xtVJk4IXKrDMA/uznyxWFDSQNK0H3A31EDogKt7zvcq83TYYzVJ9yvNjaVOZYCgsm9QvvFeDDh7QyQ/XI7X9YisoDfqoQv7tmkOVsAHbHvisEPRahyuN5IxZX/2SaKWpQ8YrdzUPntRI0SvCYX8wIRNLrwhOxyW1XJE9wSJANtsKLLOtjBg39VaITJyzsD+HQWxaRjeUSyWGXZ3NJBnw7XmZI4ZiTQxL8Tj5mevFI2lrm8hduCfGkvyVB9CAjmkTc2icRczATYLMdoA0/iE14HHIG0j9cMl64up3Osmus1knpSLx8H0d0mFhSYnj60wB9kuqWTu/bvFH/b3JtGY25yRMXPvAyGJh9dESfX9WsFB710tjbu40YTxpyCtE0pzlqNorRS0XZt2CRUp7dGjgNUpliuWlNS+7ZxSubCPl8S3S1WP9ArVznIBen0TmUHuIB/maxL4o0+Cl5OQlNLE9rp/p0UILkqeJs33qjNvkm0/Rdv1okLcDcY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(18002099003)(22082099003)(261022105027099003)(3023799007)(11063799006)(4143699003)(261009223027099003)(261021123027099003)(10067099003)(261021121427099003)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n5w7Ejkt1VLPBsOQMi03B9ooZfGvf8HoLlZW3B0W/zqQTuVPPyhEziP8EVp0?=
 =?us-ascii?Q?rg8NC0nhnS+juMHZ/nVqe1LmtJJrHCUZR5hiM/Xvztb5GAB1gzZYcj5kkytZ?=
 =?us-ascii?Q?TJdbjaSH7K6ZrEad3pggtcFsyd/542aJuZEXfCzrpAouGONTttj+n9pBsyON?=
 =?us-ascii?Q?SgCs4jPxUIC8b2RpHoNMBRh0tUYdCeSNoZtBvGiHshhBlkBLtX4WdYcycGMl?=
 =?us-ascii?Q?MrLjuFlRsXt6oXMg7CPWKuQyit54KsCrRa0V6gaN4rIO51qbZU4PCv6uT6gY?=
 =?us-ascii?Q?8+0bEWOW3U0RzK4OB0h+FFVSwjw5wiE+otdFsAJ2vpKN722KQRYNAc2fO3Bw?=
 =?us-ascii?Q?CWY4GSXSAjhCCzHf3cOnD4nNU67y+LU1JZkV8aKhvMdN5YLzMcIy+Q+dx2H5?=
 =?us-ascii?Q?Qo1GERdSQajQ80pRSFdLD7aFKJv9kIT0e1bWMqLLuS4vRlUceWqdDr9+oQZQ?=
 =?us-ascii?Q?LDuD/N/uYCwP8OoWQ9VnH/Vlelfd1v2ilWiFV8yfg0qo0PB2h7w5oHugR8NT?=
 =?us-ascii?Q?Iw91i5Yzoco0uMqO/fHv9uM3WU1w79B7YCgDU/2B7RiX4RCtecvMoaid/nzn?=
 =?us-ascii?Q?ifUw3oq/CNtPdXaXxo7UxuXS6VYoafYaC8RYLeYieLws6WufAWCnoWTL/YM5?=
 =?us-ascii?Q?bLHYkrlp0i1UV5MSwhZhYR+GYkmyC3mPFf5ApcQR19r8vJ0vwG6CsfRHvoHs?=
 =?us-ascii?Q?smnbOfmK9ct9c3PRuwnkSKhyEGRkXYHo5QcNFVet8OgYsZfo0lYl1a18oNJH?=
 =?us-ascii?Q?e30YQihm9DkYbsjum45v2WSqjf729Jpv3/Nvdgp70vI+tsRIwz/VEUiHzDSS?=
 =?us-ascii?Q?xfjgpCGf5g4CfdZFwHh960jLbK4zr7KUz7vPZpV1s/tyKpXkG1NEpqrmTe8P?=
 =?us-ascii?Q?LtI9HUkpFih4mhb1dK+0/zWa71inXVvGvt3qqAczsKUYmLXME4anEHJ5JZHc?=
 =?us-ascii?Q?Ida+Lz7UmRwxD01gwczECYmwRGMgA5y0yPstuXMFtF8qCr0MFFGFKkT/VxuG?=
 =?us-ascii?Q?LXSAy+GrEEh4Sp7CP/1D4Uxj4pbFHJdHBTsPzJuFkcG3IUK6usltKCufVraj?=
 =?us-ascii?Q?3cWANwE7rBK5TQ4UKCkLg56MLU+py+wD4Z7bK60iapBulMBl/c4UfyRynTQK?=
 =?us-ascii?Q?TOV/WkrFvYXHq4L/+YR4wtU8Q6ngFBodKPAdsIjMHtHwz5q5ESFCN2D4imFy?=
 =?us-ascii?Q?AROikQvuiFrZIIqgi10xuhntAcfwnCbQXJeYs9N5/0FV8JKEgi9FvsLofzMR?=
 =?us-ascii?Q?Vz6/+0ezQnCBKw6bKs2ycWHTWoI3a1FUkeiCubadcQAXPyBrExcNWbT9sbNh?=
 =?us-ascii?Q?i+X+uDra/bIueKkYo8ziAs/ToRDlrVLsy8+okqnNCCENjqk521BpDiHn8e3X?=
 =?us-ascii?Q?A7QbcpLUh88yMG/XomasKfPS3FOvmVKqebC+Z7JESpMpWc5CpedJ30gU5Vgs?=
 =?us-ascii?Q?RMl0mETY0ivoeWzBpsPuiJUzPR3o+pjGNbzye3ptYTdKVexdjGwfL1NiLFkd?=
 =?us-ascii?Q?TUUFbzAc6vWdakt5aIx8diXhQq6PyRLd4LpuNyGZcJMibYVLb3wQMl8uu5iu?=
 =?us-ascii?Q?oRv7Wu69epxlRVNSUvn2l441eVocawtAvYOgIZB8Tr7/2DnGXX/cFeivr6fU?=
 =?us-ascii?Q?EGMmwqpPiWnDhfNDtGYcvFZ0GxuPI60lTkC5OA3I+qOZCHyK1ZC7ZGM9veRU?=
 =?us-ascii?Q?96lvyFU6ouGFlCz0lVv8dQVTAZtSv8VXmUbkdGnEWjNQ8VFodGrcEj41OAb9?=
 =?us-ascii?Q?mH3ZWQsRcJeVRdUPz2AXyf6JyOH2nFJV/t3GAqNNSgLitzHKPOX4?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3571da62-3f3d-4cc9-bf01-08df30d118f5
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:44:33.6924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LIeasJiZ6NvqdH+c2DfG7SqAktzw2+3W1ncEVCkV7rEgNtLqT6ituIWwRFwkSLv6Amg/IZ5IXb6n+DZ5vpUJWR9nevCAAGIP1qKJhvs/7a97zDmVBjcZNmIqwzrhOwk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8889

Hi,

On Tue, Oct 20, 2026 at 01:11:07PM +0200, Tommaso Merciai wrote:
> AUDIO_CLKOUT is neither pinmuxed nor consumed on this board,
> clock-frequency describe the frequency of an output that does not
> exist here. The DA7212 MCLK comes from the on-board versa3 clock
> generator.
> 
> Drop the clock-frequency entry from the snd_rzg3e node.
> 
> This fix also the following dtbs_check warning:
> 
> sound@13c00000 (renesas,r9a09g047-sound): Unevaluated properties are not allowed ('clock-frequency' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml#
> 
> Fixes: 3e23d2548ddb ("arm64: dts: renesas: r9a09g047e57-smarc: Add DA7212 audio codec support")
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

8KHz arecord is failing with this change and currently investigating the issue.
Will update you the findings later.


Kind regards,
Tommaso

> ---
> v1->v2:
>  - New patch.
> 
>  arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index d242f2976296..6c0053735904 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -378,9 +378,6 @@ &snd_rzg3e {
>  
>  	status = "okay";
>  
> -	/* audio_clkout */
> -	clock-frequency = <11289600>;
> -
>  	/* Multi DAI */
>  	#sound-dai-cells = <1>;
>  
> -- 
> 2.54.0
> 
