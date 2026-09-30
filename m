Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B1331D366;
	Wed, 30 Sep 2026 18:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791567; cv=fail; b=oU3xLV8j0scd/TGVUnZU80kDphszAOMnmbFhaIKcg53UeUZ7YrDxYgk2KmTBCpFWuHPfiUbs+d3BOy1JcNp1QACECraLoS/u1G/g79IMGV2nLIdnlirD3of1zhXKLzMOZxoKjqPLWZVFw4GcJed9FlJD0xhmfE0lG0jpQO3Dudo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791567; c=relaxed/simple;
	bh=hJtYboxBFjxyhq3i/A4iFOAQSEebQ+pHDqHjbhxF6XE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kjfohjn5AAwgtJCHhfk12/5IAIaDoA9Hd6EU+wGOQm6koQKZCK/Ke37FoIuLDUdE2JPieU97rggNUfj4zUhxlds6n46Gl4bLl3M5sZhK4H+YbYKBRqH6kusB+HBuaNuQZ7PoHfns5inJZd0gHuZ/ZwVFBAwjAkPGXLXAi27MRnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=LGdLEsdU; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="LGdLEsdU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e6qPbukoFHOzOK2JpkC8s/jnllU205YWnk7FGGs6aIIaNqem87pH9pLXI5IroN/1C87c3C967V6IZnhuLHR/e81bwkd9L8yht3u/BqGnmZtLTwnf/S48O2LBWQ5m1Dbuhqtu1ojtmw+NkGN21QchY8fZckpyVaewHoVLTbufycVcFQJ6oNTFB+DQVfpIGocwQUZIOpWS4ri/udKe39B26/0zbY0xSGo0rf7sht1FAXBNmN2hAREqpQvR4MUm7q2jIKi6UfLfOXtkvIPgf3V/IZm/S8N7oXMO9YOxYt5IR8A+lf9jEGwf6IWaUMerwIuU7FNP1Pgz6Q9JiMgfUnKYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A2tljZQe1pJVyMmhp6RKg8fyz5hw8tyc6Lb4ejZycFM=;
 b=UVX1MFdgGofUC2QuwcjHwkVxu++9ukR677+7NZuA5WhRcKVootDsKqlqrlRmrgNtp+iePLyGxxlTLjEpzlr1yFO4JgATF87vepQ0RdCTkDCY/WHinaCiJVD6oDIjsNQUmX6pDnKJ++1zfJbBfusWnfap4Gb/uukE40N0zy+hGqdiKwF3Ecvg3jGOHR2djGRChtY0Llhb2Tv8ccpmPFVi//bBCB8i6qIpXl6hujG0WsJgowijM4CvEao1t0E0PzcofdvjCmBvZP5xzSBx6WJ/FNmaw29e3DEKgyqbhHgJPdOCcnp55v3MENdA41bYi42sBXIsiwEopFq6/Edxafq03A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2tljZQe1pJVyMmhp6RKg8fyz5hw8tyc6Lb4ejZycFM=;
 b=LGdLEsdUbU9fjbUj+vM7+dBoUZ1wYC7/Wm+XleBN6Q24mHOAMJlZIbdlmY6Ou3PhtUS4kshMVb8+zp4jw/q6FDzouExGHuyDp5tag+b/WHuDV7w+syS4SIt8hGaEALTyJhDSVtYxi4nD/WI09GaQVO+47nsOQqt9MyTrCkyY2ac=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by GVXPR04MB10111.eurprd04.prod.outlook.com (2603:10a6:150:1b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 18:05:57 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 18:05:55 +0000
Message-ID: <8ade7dc5-1292-4bad-8148-0bb48963b045@cherry.de>
Date: Wed, 30 Sep 2026 20:05:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: rockchip: add RK3588 DP carrier from
 Theobroma Systems
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 damon.ding@rock-chips.com, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20260930162545.2357505-1-heiko@sntech.de>
 <20260930162545.2357505-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260930162545.2357505-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0157.eurprd09.prod.outlook.com
 (2603:10a6:800:120::11) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|GVXPR04MB10111:EE_
X-MS-Office365-Filtering-Correlation-Id: 79abae8c-e0f8-415b-cd53-08df1f1d790a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BB8KZOTOd/WqvV9I1yGEtkaFs0RaFkH/oj3M7uEcaYCbDt/NOmAKMKyQ9iVCLJuIBqyR/5N7/0Nf7uumWSNSOukENebkRbhKm4HIgH285K7j47wfVtJbfamu6aibJaL1edD8HCIT7xMpFMC5tTVe6DJLpuJeMRqkgpQ4nr7VPorg7vtfmlDzt7+X5SmpmSKPweMXKauHKWvViQlMbU/groVEqMW0xUhfkuwwCRYcQYI5J+47ESWpeR/3lR1ScIIjAlrEeGTIj6l7az0b3Ds7afF9Cx8/yoR0MqxEanTB2x5alZWozxx4B5x1ah+kUHdSwGKgXTm30CKgmlFrBcW/+GMBw9THEWg9z5d/l21ePO6W57UpuwCjJBjt48XjsCrW/8YE3SZrxMzrkbaV8zAwq0kn7S2LKHzFerdsMTaCZJxSdzNyi6gHI9utfFgry8I45RdPbkJQx3tqg7giCrPd2EyGDpymSSnsMv7+EdUpjbdXpesCUoFfs6HgZ3LDZBm/VoMjFFFGzo80vtfyNc8fKvZciuCKVrJMEJQm7/VaRSjPJnl3VTPx2j5CItEtNi5oyUKZ+VSJmdVrLygxjDYd8LgtCWozfqvXMC+YeNwRYPOCgzKLCQwhSJIJ2C4ht1noPQxtQoBPxgdlVGeeAEVHsGMqJ8rmFPCrQpCc11Xr1TM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDVIbk1sZFZIV2p2eVQxU1U4c2xPd2k4RC8zTEZ4eE5NSVV5am9RaXpXOVlM?=
 =?utf-8?B?Z1ljbFFyMmFyWGhYOHVWczRRYVRVSGI0NFI5dFUra3JyWjRoVmlDNnp5Ykdp?=
 =?utf-8?B?MVZnaW5uRXZwZkJhakpjb0FIbG1URFRuRDR4aVJZRzVGMGlHYkxUSnNPemV2?=
 =?utf-8?B?TGNsSktYcHpkL3F2K3B1cFpBbjc2cnZEUkdkd1dJZEpZN21peTVrSEdNTkR2?=
 =?utf-8?B?cTJrMmJFK3ZydzJEMjlOOWV2TzIxZGdwSUk4K01jZ21vaEU1REdmN2g2TVdx?=
 =?utf-8?B?cllRbUM4cjBTVVlGcnRkTkF5Z1hFREd4MjRTS0Fzak9EQkU4Nkt1dzN3a1Iv?=
 =?utf-8?B?YnZlZ0RzQkh6Y3BiTmZuaGhrblVTRFhBMDI3OVBlK3AwQjl3T2R6aHpScnJz?=
 =?utf-8?B?QmNEcFl0K2tmbEd2dU8rN2tHRlQ4TURneGsrejc2MmdLMHJoYnlDTlFCcmtY?=
 =?utf-8?B?QnNVME5UMWxkQ3NzMW5XZzI3Tld5RkdZN3IzVFgreE1vRy9HQlVmeTk1cElD?=
 =?utf-8?B?QnJvL3hZN1d6ZmsxUjJLWmpZQ0NaRTUxWklVUDBOSGZJN29jSjU5bVVZL2lM?=
 =?utf-8?B?aG5jallPQ29MZjlpRVUyMXlFQzVZTjZxb00zVG1ibW5lVk5DNy84TzQxT29C?=
 =?utf-8?B?cFhxd01STXo3b3dCNy9oN2JCSXFyaHMxZWRRSE02UFZEdUFUSVI3aTFVb3Nv?=
 =?utf-8?B?dXpvcG9YMTJ1TXpsZ3BQZWhkMDFYUk9rc3lZOXRkcTlTYW1ZbkcxNCtzRnda?=
 =?utf-8?B?aUZtbkFuMFF5c3FNaDJrRUR1WHBaWjBPaFlKbEx2eVd2SEhtZG10N3BrZ1BQ?=
 =?utf-8?B?YlhzSFE1enQwYWlJWTZMYjQra0ZxdkJ6SURwVTFsUVRPRi9xa3FSZVR6dkRa?=
 =?utf-8?B?UnNVUFpCZFl1ckUxcXptam13TEtXcXpkZDRpajZxK1dtRFhxUHpidnovMTA3?=
 =?utf-8?B?b3ZNOUpXaFgvQ21SNzJ6YWZTOGF1KzduV1dOeEhSbnRBaTBpeE05VXNSNjZa?=
 =?utf-8?B?SWt3dVZJcE1wd1gxUDBDeE0yakFGdTN5TW4zZGhUUDhYcjM4a1ZieTdlVDd0?=
 =?utf-8?B?Zm9JOFJ4QVZ4cCtjN0I1OVNiYTFGSUZyMHZ3c0xuazdiMjRMd2twaU93Yzd4?=
 =?utf-8?B?bmhFTEN4NE05T3YrS3lJMERreUM4aXQ0a3h2bTJJU1g0aFBFcUpQUE5mMGt4?=
 =?utf-8?B?TkFVbDBUUVpIMDFLUDB4Q1FyK2VhdTVFT0xNbG1VQ3dLdjV3YXkyVEdVb2xT?=
 =?utf-8?B?dDhVOXppaVFRNFF2bWI5MzQrSnVJY2QzSTFUZENXT1M4S0lIN0FxUzdmQXNi?=
 =?utf-8?B?S1d0YXp0T1VWdTNydmk4T21HOUJLMTFOZURxVzRhUVZRNHUwSXNQRWhCWm5J?=
 =?utf-8?B?OElzUlVZblNaZHNycU5xTWhkdGlQcWFwSERicE5YZWEzc2loOU1BRUcveGRp?=
 =?utf-8?B?dzdNcmRzdkJuVUJrLzlScGFCUU5pOCtkSEZOQXBBb3ptTUM4NE9kaElzbHJ3?=
 =?utf-8?B?cllQa3QzaDZZMkk2MU85Kzg1WWRQS2R1ck40TGZ1dkY4THo2aStyRDVrR2NR?=
 =?utf-8?B?NTNod2NzaEtLeUoyc0RuK0xRdWV3c1Vjd0s4SHdJT25lUGdhbEN0bXl0Z0sx?=
 =?utf-8?B?aVJjbFk0VThJbVNGRU93WlhKNUdIU2g2dzlGTndmempidHdISUNXcy9CR0VG?=
 =?utf-8?B?bjk5VEVJa0FpL3FlTmRTbS9oTjczYVdweU5VMTJ1UHlzV3FpVXBaNFNDb1FV?=
 =?utf-8?B?YWxjK3NKQnNmWlZ3b0NzNEFMRHV6aHVadzBFdENxSGVKdEtVcEpXZTlzbHVD?=
 =?utf-8?B?dTBvL1dSSjc5WnlDczhTSG9BT1pJWG1hOGVSM04vZ3g2ek1DMVg4N1liT0Jp?=
 =?utf-8?B?eDdFZ2J4UFBzYkYyUXdBNVpOek9VNkJHT3hNNUxKVEVUUUtOUTVjM2NpMnU3?=
 =?utf-8?B?VzRUOE1mU0trb0tLb3JQZE82ditPSlZ0c2FGTVRkQklBbWlqcnJRMUdTWUdx?=
 =?utf-8?B?SHRaemdkRHFSWEhIWlB4TWVVV2ZXOVBKbmxaaHlHd2hMOU1rNk8rUjBudEtO?=
 =?utf-8?B?RGtTNHpNSXpkVFRUcDdBa04yRGsrdWhKWG1VekdwenFmNWtBd1Z3VTlzalB6?=
 =?utf-8?B?RmR0N3pKMUh3VG9pamJ3UjFxUlJ2WW5NQTZEMjZGeER4bGN5M1JLcC9uWEdO?=
 =?utf-8?B?RFNGeE5nMGxjbjdJNWVPLzQrbzBUb3pqQ2NINmRxWmJYZnI4RmpvOUhVUGtv?=
 =?utf-8?B?YjBnS2hLbEN4RXRTUDd3T1FYaE0vWTYrTThLaXNSRjJsTHJkUHZlZnhQVVJI?=
 =?utf-8?B?NG1aSnJpNjZXcGM4OGpYQm8yeVI4VTBxOWdVL2ZSaTFkSE9iclRGdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 79abae8c-e0f8-415b-cd53-08df1f1d790a
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 18:05:55.6632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzJNjS4pCwPXPNYuwJ462Q6ud2yxgvwQZuFA6uD1K53+a7hvPc4uj3BLnM0O7FwDHGaUGmSbnwnn7dE10uEkIWzoljU6xVxPjT+u6Xr+eOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10111

Hi Heiko,

On 9/30/26 6:25 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The DisplayPort carrier is a very simple baseboard only providing serial,
> ethernet and a displayport output.
> 
> But its main functionality is that it routes the Analogix eDP controller
> to this DisplayPort output, which allows to test that controller simply
> by hooking it up to a suitable monitor.
> 
> The Analogix-DP controller supports eDP 1.3 and DP 1.2, so can drive
> both eDP displays as well as full DP monitors. It does not support DP+
> so passive DP-to-HDMI adapters won't work.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>   .../rk3588-tiger-displayport-carrier.dts      | 113 ++++++++++++++++++
>   2 files changed, 114 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 2edc9c0aceb5..bf80afba2351 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -217,6 +217,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-cam4k-cam0.dtbo
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5b-plus-radxa-cam4k-cam1.dtbo
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-rock-5t.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-displayport-carrier.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-tiger-haikou-video-demo.dtbo
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-toybrick-x0.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts
> new file mode 100644
> index 000000000000..f6e95047fd5f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-displayport-carrier.dts
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Cherry Embedded Solutions GmbH
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include "rk3588-tiger.dtsi"
> +
> +/ {
> +	model = "Theobroma Systems RK3588-Q7 SoM on Tiger Displayport Carrier v1";
> +	compatible = "tsd,rk3588-tiger-displayport-carrier", "tsd,rk3588-tiger", "rockchip,rk3588";
> +
> +	aliases {
> +		ethernet0 = &gmac0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:115200n8";
> +	};
> +
> +	dp-connector {
> +		compatible = "dp-connector";
> +		dp-pwr-supply = <&vcc3v3_baseboard>;
> +		/* Q7_DP_HPD# but Q7_HDMI_HPD# could be used too */

Yes, but I believe the signal would then be active high instead 
(Q7_HDMI_HPD# as seen on Q7 golden fingers is inverted before reaching 
the SoC pin while Q7_DP_HPD# is directly routed to the SoC pin).

> +		hpd-gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
> +		label = "dp0";

Is this required? (Not according to my reading of the DT binding) 
Because I don't see DP0 (or dp0) written on the board (nor in the 
schematics where it's marked (on board and schematics) as P2). Not a 
biggie in any case.

> +		pinctrl-0 = <&edp0_hpd_l>;
> +		pinctrl-names = "default";
> +		type = "full-size";
> +
> +		port {
> +			dp_con_in: endpoint {
> +				remote-endpoint = <&edp0_out_con>;
> +			};
> +		};
> +	};
> +
> +	vcc3v3_baseboard: regulator-vcc3v3-baseboard {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_baseboard";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc5v0_baseboard>;
> +	};
> +
> +	vcc5v0_baseboard: regulator-vcc5v0-baseboard {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_baseboard";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +};
> +
> +&edp0 {
> +	status = "okay";
> +};
> +
> +&edp0_in {
> +	edp0_in_vp2: endpoint {
> +		remote-endpoint = <&vp2_out_edp0>;
> +	};
> +};
> +
> +&edp0_out {
> +	edp0_out_con: endpoint {
> +		remote-endpoint = <&dp_con_in>;
> +	};
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&hdptxphy0 {
> +	status = "okay";
> +};
> +
> +&mmu600_pcie {
> +	status = "disabled";
> +};
> +
> +&pinctrl {
> +	edp0 {
> +		edp0_hpd_l: edp0-hpd-l-pin {
> +			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_up>;

I believe we could also use pcfg_pull_none as we have an external 
pull-up on the carrierboard with R15 but it doesn't matter much I think :)

> +		};
> +	};
> +};
> +
> +&uart2 {
> +	pinctrl-0 = <&uart2m2_xfer>;

This property is already in rk3588-tiger.dtsi so you can remove it here.

Cheers,
Quentin
