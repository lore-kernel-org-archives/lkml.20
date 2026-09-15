Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023111.outbound.protection.outlook.com [52.101.83.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14083BB132;
	Tue, 15 Sep 2026 16:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491252; cv=fail; b=hWbv2xvK2mP+XU1GLQVCynfFghlesKDjowr4YC87pfH8VZWze3v4uSSIynaoLssU4hJ7ZLWLS5wHwdOrrsYJyuGfJHfKZE378csjSM32ZtO52eHlXo18zrbF1PYz2WlysWVqx7yEpO2bUbTp7fnxHR7aSXopwRplws23IES/I4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491252; c=relaxed/simple;
	bh=IxPdo/LjgY4nhgM8xNKAeytMBimETrSYl+ZyWWrzzrY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nPS1lz0z74vhfFyGdw+RkEww3VHXuCICGx1eSqOVfTJt9o8ADoP0jMa0WHa4fMAMGSY5fGnoI5v6nLHLLpz1PDCRagf8fD5LuTjRad/XMOOLdhPAdU6TJABM3R8BioEeDrjz609UzOOrE1WHHiPBsYyOSbDbHd1FC73Qb2quipI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=FcFDQeY0; arc=fail smtp.client-ip=52.101.83.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="FcFDQeY0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWmkrjY7SSbK/18kqtGMjjTDrY/Vpd2Ci0rH9Z3CgNLGfyr6gvfp0N6vFaN7UrQ0DMyJyqQMLHeuywUxM93QQ7Sn7/EUJercTXMK7hE9SkIgmuAhJBGQ6yFo74ocfz9zoBW0hVjs/ROaWWVLq2/uzrr6RfOuFxal9i98I+hNStfA+4HvfGPF+3aWBaPrxnwATZaO8JX783NrtivtrDlQgCMkrIDyg+rSryw9THzK+RGkNMrQrCg5KHkxBL7TH8Y4XpMk3I7d7e3glYdUrTTRozdQEGAXkZ0xmVCfDWDJpqzZAEkZvLO7JXnpve4qhzsRVygohcc9ybz9EY6rytdcNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdaVoK30/0z+kUm3oytfWRJqRI54GfzdgTl8a0s/oS8=;
 b=xplEQE3y7Jc0/tqhnTQn3tbsWvu3JACMnZZFIG7D+62rKutOzYikhht8rmDaREqMWXBTSH3NaeE8/+pEuLHPL/vit2sVAglh+GM9ebLma7iQa1ULSuyVay8/LiD3FBT2BHhc7ZnVgXp5pIAdZhwizEOosx4/zEm0MOscYKKEhvbjkaoUObrGlz4Xt63cuHYeiirggO2pFykZ2vQMWcEasw29Ayzs1jAAwrkb+eRNC8RRRGjvGKPUvaSiFKwTOnXjoW1nFztzxZKqJ1Lcp9YHhub7qwAkffbJDXcugrPWcKFQo592uOB5sZ1RxtN/ihfWrYh5fHwvG85j1+S4VEhKZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdaVoK30/0z+kUm3oytfWRJqRI54GfzdgTl8a0s/oS8=;
 b=FcFDQeY0Q5TkaBgQdih7m82MxSkX/89liAP/jUpollWlPb9V3dPUNcIpvLOjbcV6GWbSi4lB4oKYKqGBH9euYtsnvOgEyD6YS72S34CQFaxGsNBb9GMCZJU7W4SQTxHZTeuS82pbtHsFthWDvVSxXcbO+1wL+2eHO+9nIlkHVJf6mFm2dpi3H4dEi0uYpADR9xlwQna2kabiYpHS2s9OfCaDZd5enjC3HAETq3Q4qm4A3HUggj+/S4ygIOgpzuK3ypF9u3RCyMBldTO73PVOscTXRsKqhkbnOM3ksCP/KfGZcn95oz+v8AmEXQdCg6t73Md/3ayNYv3MFIkAgBdQ4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by DB9P195MB1707.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:396::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 16:54:06 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 16:54:06 +0000
Message-ID: <0750c03c-94e6-4b1c-9774-b85cb384a727@phytec.de>
Date: Tue, 15 Sep 2026 19:54:03 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/15] arm64: dts: ti: k3-am62a-phycore-som: Set eMMC
 clock pin as OUTPUT
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Garrett Giordano <ggiordano@phytec.com>,
 Robert Nelson <robertcnelson@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Nora Schiffer <nora.schiffer@ew.tq-group.com>,
 Stefano Radaelli <stefano.r@variscite.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Moteen Shah <m-shah@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
 <20260909214743.899477-6-jm@ti.com>
From: Wadim Egorov <w.egorov@phytec.de>
Content-Language: en-US
In-Reply-To: <20260909214743.899477-6-jm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0028.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::20) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|DB9P195MB1707:EE_
X-MS-Office365-Filtering-Correlation-Id: 505f19b2-d39b-4abb-0997-08df1349f445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|10070799003|18002099003|22082099003|3023799007|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	nTu3hH1wFFUC/xpOTONYV/fKV38Xw/JWzs/M0gMoA77dK8ATnt/RMdvRILQaJiHBkkK0loiAj7ZrDd+fPyor3gerQbPLa3id+ozxqpWYdvVXRuS84f2WMklp9mI3j1P35KPHkmhMgMxNxeMvIQHRVuPZnGqx2mnqkWcrwS5yR++Z4TwQEfi5OhL7NESq/+s9LLOy/PEnDtEI0cBpxEiSLntLQYDeHknBACv869O63zjh7x1BE0dybPrsTbq3lmIl1SBtgDpoDP+3vAaKr+zf5UVsXkvOeK6xpDakoXFGjKn95t0ArkSqh4rob5wZ9baQH5GmgeQhQJFc53snifvuopjUFKH7NJso3I3JKORzWwS49mEVX6URckKyDCRKbNAWmZNpetMtlF3G7hPn4ztOvpM2U/iacBhl74Rcp7WqOXqXsRUKbpr3iY0nWp7gw2tSNRDHZ7XhUbuOPeCcBGablU3NJclk3v5HoDQhS0ZA+WFZ9E8e/NIP4qLVdr6q7qSqBiOgEhR6ODjMRXc7lVKdxLueuBYAhTl0oPTmoCHbeKYIP6aCesIbQ1MVdqD1mFwmmnbs1WcBG36DaX9dszdpSrA2+jBmBEB+oMp0oSWaEmFn8zKZjkJ1hyx1xhFyMC2Ulz1HtRUlkpr9InyKVuhk3qPOsSgOwy80dPlpE7rf1lg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(10070799003)(18002099003)(22082099003)(3023799007)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SU1RWUI2cHY4c0hnZStxVkVHVTZYakNNWnlsQURmeFdkZU0xdXVROUdUbWJU?=
 =?utf-8?B?bi83ZWhQRWJhWjBEbHdic1RJNEkvbzFSbGd4SGNRU20va2ZrVDdHSkpSYWpB?=
 =?utf-8?B?SUdjam9TVFFXK0FRb0NOMXZ1QzIwL0ZmMjdaalRyM012RFFLTTQ1YTVrNFpR?=
 =?utf-8?B?bklBeE5iZ0JDRG9yaFoxa09aSEdMbUJlZFB6akluOExKRG1raXJCb3dLTG1s?=
 =?utf-8?B?aTNoUzI1N3JZYjBhMjlyS2JqOCtyZG5hU0lGY1BjVVFvWUhBMkVHditONVQr?=
 =?utf-8?B?cWVybDlTblFEWlBVVStXekxsTHJ1K0puOVY2ZFI3ZDlwRFlFUVgwazNKT05X?=
 =?utf-8?B?WU5DVUNaMkRrK2xVVlI1ampOSDZoWWlna280WFlidXJDTmNiT3NTakUvWDJ1?=
 =?utf-8?B?cjJlb0RKcEVUMndWSzFNUXZuNlRnTFFwOU5VMXE4eFM4Q0FEMVUyTWhvNzJm?=
 =?utf-8?B?UzRiTnZiWHE4Q0hNQ3FMRWxiOWRmYnpiT1ZDOWFwLzNkS20rUFJiaUFnMEdJ?=
 =?utf-8?B?L2U2dHR4TWp5aExXWVJjSkRsWGE4ZnFSREVSWXhOc2tBT3JJZ0pLc0JxclVG?=
 =?utf-8?B?bHI2bzRxQmJUbzE2cElKM3JoVVd2czBxbjRzN3o1UDd3ZlgzOXVuSERQQVZj?=
 =?utf-8?B?RDVkMG5UbXhORVlySlRNU0l4Rkx4c3J3WFpuTnNJWlpFcFVlNXlPWEJLMnJR?=
 =?utf-8?B?cWNVTFpaamg5SkoyS2VBYlBodUdEUEp6U2NMWlBLUnpvTG9LM2d0N0dyUU1k?=
 =?utf-8?B?NDlmRzRXK1BYOWo2b2lmUDRPdW9yeUQ4MnY5RFRBVXQrOWsvNTd5elp3VFRt?=
 =?utf-8?B?UHR1TXVoMTFKeDdyNkdOZ21sbGw1dVR3S2k2NWxHQXhTMW5YdW5WTC95SUFa?=
 =?utf-8?B?bDgyb0ljV1AzK0RhK0tLbUdHclk2VEQxNkgrNmhmRm5veUUvN2RoN0lUNGdl?=
 =?utf-8?B?WTlNazA3Vjl2Qk14cEI0endFdTJ4R01RWDVuR2F1Y1lGWWRQSUdlNm1ncTNt?=
 =?utf-8?B?bUJtczBCZlNTVnhQYkFOQkd5d1dwbkd3OVgxbWZlUXh2amJ5Zm5GY0IzaUxw?=
 =?utf-8?B?QW5ZZEZtZ1p1b1JYS2lWeEo4ZEFrK2NobHIyRUNVVDFuYnZvM1YvcUVOZzl1?=
 =?utf-8?B?ZHFXN1N4Kyt3ZjNIZlhTTFZmbEZ2K242bm9VZHlINXdWWUZBK1pSbmZQVUJG?=
 =?utf-8?B?OEVnbzhxZGRsSnBCWUg0MTBHZWxTcHR6V3dXc1BuMDMzcGtsWEN5VXR6TGdJ?=
 =?utf-8?B?TytiTUJuWUpHMlVXKzdyRnZRTnVoVFgyY0JzRk50OU9XY2haWGJycnFUcy9h?=
 =?utf-8?B?MTRyMDcxU3FlVTB3N0h6UlZMWlRlYXV0YUFXQUtuU2N3YnBnL2xLcDUrWFNF?=
 =?utf-8?B?S0s4bVlVYW1nbnlsQlRjRVhGQ3BCUkhvbFhGTEovdTFwbmpwV0xMYVdHT1Bp?=
 =?utf-8?B?NHI2WlYxUGJxcVpvRkZPQjdvN2JEeDVZTzBTME11ZUw5dTlvdWJDMkdFdjdi?=
 =?utf-8?B?b3BVeFp4bVNyV3hoSnVEU2VXNDZ4MlJDWDFlVGpJaFFmTzdpbFBFMjdyb1M4?=
 =?utf-8?B?TURWQjFVMkhoMG0vbWN1cERsWjVKbmc0dFlCT2RJajlMZVZmUjlqOFhvK2Y3?=
 =?utf-8?B?ZXcrc2ZWRTN4Z0hqdnRzUE41MGNMckFQbFJOd29MeTg2QXFtbUZVMC9Qa3Zo?=
 =?utf-8?B?SGtnNURxMmQ2ZWljYXYyVW5YaWJDa0Vla3RMSWN3cXByY1BvMXRPS1RhM2l2?=
 =?utf-8?B?dW5kWHdlL3dtNDRlVG1yUm16VnhWSUFyUU1hWG5GaEdBN1NJUzhObGZGenox?=
 =?utf-8?B?TmFWa0ZkUGoveXdlQVBuMlNtcHpFM05ubEkwZ1JsNnF3SXQxamtmMHpGM2Yx?=
 =?utf-8?B?amptcStwV0RlNU1nUW5sUWZBNlFPMHRiWHliTFNnVWlpWnRnc1Z0azFqL2Vu?=
 =?utf-8?B?MzlRRG9YM2x4enB5SkZZRnVQbGhnOXhCYzRwTUVkVXVBUTJnY1FwK3owZDha?=
 =?utf-8?B?OU00cnhpRWJ6R05nY09SVUtXYi9yNkFTaFU0Zk4rTVJNaCs4SVg5bk9MS0JU?=
 =?utf-8?B?YVdnY2QvZnJpTjNHU3krQ2pTamtkZnB2VDBVN1Y2OE1KcUQyR0V3d0tZZkI0?=
 =?utf-8?B?ajR5eWZwMDZxbDZJS2twckdtSTVFTUIwc0FPeUJEdHhCSzFoMTAyK2ppZmJx?=
 =?utf-8?B?LzA2TnJTY0lQTDhmTzBkVXVrQzNZdHcrYlZuVWRaNDhlNkVWbThsWEE5b3M1?=
 =?utf-8?B?bkovV09aSDhmSkdFZ1EzQkNpMjkyTXdJOXVNVG5YTjJYR3hrVDJjbVZPeHYv?=
 =?utf-8?B?L3ZWeDBIdktvU3EvSU52NCtyMTZ6ZjJGQy9RSkhucGwwOWVjemg1elNmK0Qw?=
 =?utf-8?Q?qo0ClNptRMWinnctc/vXCupvj69l1JWPh7FN/PTaiUi1S?=
X-MS-Exchange-AntiSpam-MessageData-1: 33F7E4/MQKFGNQ==
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 505f19b2-d39b-4abb-0997-08df1349f445
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:54:06.3643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APS3Ka20YHHcUNInXI2TpKaOEnqH6YcCm9nOpBlL53+qT+KpU363xNXxQDIDVChHlthNLLUndzsH6CuS1W6Fsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1707



On 9/10/26 12:47 AM, Judith Mendez wrote:
> MMC clock pins must be configured as OUTPUT-only per TRM [0] with
> receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
> PIN_INPUT to PIN_OUTPUT to match documentation.
> 
> [0] https://www.ti.com/lit/pdf/spruj16 Rev. C: Table 12-257. MMCSDi I/O Signals
> 
> Fixes: d69383885576 ("arm64: dts: ti: Add basic support for phyBOARD-Lyra-AM62Ax")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Judith Mendez <jm@ti.com>

Acked-by: Wadim Egorov <w.egorov@phytec.de>

> ---
>  arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> index de4048a3564bc..5ad93be3d3363 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
> @@ -120,7 +120,7 @@ AM62AX_IOPAD(0x15c, PIN_INPUT, 0) /* (V13) MDIO0_MDIO */
>  	main_mmc0_pins_default: main-mmc0-default-pins {
>  		pinctrl-single,pins = <
>  			AM62AX_IOPAD(0x220, PIN_INPUT_PULLUP, 0) /* (Y6) MMC0_CMD */
> -			AM62AX_IOPAD(0x218, PIN_INPUT_PULLDOWN, 0) /* (AB7) MMC0_CLK */
> +			AM62AX_IOPAD(0x218, PIN_OUTPUT_PULLDOWN, 0) /* (AB7) MMC0_CLK */
>  			AM62AX_IOPAD(0x214, PIN_INPUT_PULLUP, 0) /* (AA6) MMC0_DAT0 */
>  			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AB6) MMC0_DAT1 */
>  			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (Y7) MMC0_DAT2 */

