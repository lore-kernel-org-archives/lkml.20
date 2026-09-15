Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020127.outbound.protection.outlook.com [52.101.84.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905D748821C;
	Tue, 15 Sep 2026 16:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491290; cv=fail; b=lTJLHrkWL8OSyqIqocRZIVnnNuQzHrc/MU4l8LRTvtHWa1VHVi/JtPJgei4P6yBc+QryTSTGKT//7HmDMv/9W2JeDwK/kW7yHDQ+KT7GbF5k1Sp2WThCt5DF1O/1ThnysMMRx2LcZCoMKnjH7dIJWObnLI6KLOPe+NzbH2sy8fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491290; c=relaxed/simple;
	bh=CrlW4NC3upklYVRyr8RCn8Hh3duHzbw+vDlEY5RzSuI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mt3H2nKDylZ6RREn86YZXiy5kAi3+mr6UyrBrGhOtD+Drt1ORELzVufGd79dy8GahbYE7Yvp09pi6cSJHInUF97/UdLSMQOp8pHgbMzwCwP4DIl5Eu+mM3I6Uhr4Sn2hkqYGi4nE0ARKd3SXsNE18FmMi4ftWaXOE7GWmbnWmWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=Sv83Y2Zd; arc=fail smtp.client-ip=52.101.84.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="Sv83Y2Zd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=deoO7hWGWKykQTZUZrbvxvrZovCjd30stAc1fnGh41Irx/YPiFZNJS2pJBm6o5ymdlrbg0ZtMSeaUsLMsoRK+kCNdri6zOTpnpwymWCKTx6zsM1lA5wYwUJ2y+GkOvnv6s7wFO6BkOU6sn4gyjD3m7sxFqQo0MRy3JU/SJj7TNb/zN6T+5I85EwpijlIB3U8QLFZfsLOJWq9Ks9IeUA2cfuqHGL/Bh/SMPtNZMv/pD5pMDuolBGiuZ3guWv8KJXuMm4ZRJ++APQneJvs1Q6mJ5A0ggchkIjFQvdAzyjgg46vXmGSdXe9toRe5CFzIudk14i588Ez5EwJ16sNJjBpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYHaP+as4yy7TVfiAZttxs+uL37QK/cFFnYNcUAH790=;
 b=PuhzfI2NgKNpdAiBhQtgpxv4IXtC5Pf0SYmBI3FqRyAAUTdGGCzvZMB85ptpAzhC+bldQGjUUnja/rnDjGW/AefExT4V7Yrwc2GppTYlQC+xOWLBRdfszFtE04JvjqniirjGRjpBlZuW4rYEApD8ADH3JV8sa2C3Wqe83nOWxgG9oYvI8WiwZrSBYwMCGUG02KA9y7wF2Y5E+zJ23sHCOe4aC6FckyAf3y0Gj87K5hZfYkGTdQzhmw+7YX6ub6qQTbRftdQdHhVfdURaAFjkcpyBz2mREbiFH/KVznlDHKcVxzgUdIXGzdtCT0vqaY0I9vn7cCOIybOR3eGur/6Gqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYHaP+as4yy7TVfiAZttxs+uL37QK/cFFnYNcUAH790=;
 b=Sv83Y2Zdt+nqegKCF3D/altK9ckTOrWhwuZerc9hERBJ8yyyxOJp36YE5H0lxv7jvvnrEbEjceYeRkd/bQiSFYJf0pxP0enpvJakCT38/vYrYOia3DC3JG4CcoAssFMBSzQs0/kiexrH515TPbzw9uQi0KSh/tE7WW9GATKREkVUSPUEX3z45GuSMe/UU+3eaIjFrVvaBQNzVBW/8fxzSppGWfJcDYtU/elifuWHleqH9YwtETcR+OBsGC2KYvj0HWUSyuObar6qHnrTN0Bd8uNxyIkmGXgkyhKCBvMdv0DKbl0mnbNThNMfeSWQjYO8jbcaVBmUq9fY7dERCpLbxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by DB9P195MB1707.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:396::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 16:54:43 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 16:54:43 +0000
Message-ID: <010dab25-c53b-4045-821b-e2bb5bf24659@phytec.de>
Date: Tue, 15 Sep 2026 19:54:41 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/15] arm64: dts: ti: k3-am62x-phyboard-lyra: Set SD
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
 <20260909214743.899477-16-jm@ti.com>
From: Wadim Egorov <w.egorov@phytec.de>
Content-Language: en-US
In-Reply-To: <20260909214743.899477-16-jm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0025.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::11) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|DB9P195MB1707:EE_
X-MS-Office365-Filtering-Correlation-Id: f1af26e7-776e-4d8e-e810-08df134a0a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|10070799003|18002099003|22082099003|3023799007|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	4itlUo/rTk6Jqqqe6bHAD9dPzxkZrdfLTVvSfr9QxTJUG7+M7q4WerhinDpPkwCQmsEoDyhXMdxHZsjpd69zhdNv3rqAcy6f7lIajqnO9Ci4vIhqw2vyheyy6HuhdSl6F2rnIXWoKlA59Dxe10Rp8M3f8RxeZKaO8esJTrPpBHpvDVmuS8zQySdy+ZacHSYOtiQspRoLlLL6cfmJUL6AfynvDqPaiqwUcBPJVTRUYawqN9NxUh2Vrqif6HSbjflPhux4G3tk+DRzDk8L295vkERZ0cR2NWkEEb6Kgc9K+bRp4GrvOyjCmc/Uks9M4WqJe0Ny2ikeJDKf2rG+kjq4NNU9XF1+FUce+oyYuny5ft/kdmPoCyHxaslZ9cbagb3vdrjOaMva1+HpGOy6KbOCbLaXzTekD5qu9JkV2rW6xpc5QYjKJbGPsU94vuj0unAiu3bPBWFHqIe0Sopd06d8Zb79ROUQEN+nlzASUVBmbjbAhEiFFvroG01f98vDRjxGiKVEYJ1xKviSzDV6QoYQabVGpdnM74CONFs1bWq357UCBROiVJpBssa/K8ajNyOjyToz7xncQBcF5JKwVa+GdIA5rNku4bsiJKBRn7D7Yza9eLeQRxiKyFSzlma0ik59QLLhhMMmrh5cme2RQVgVL+PTXGcTUqlWzI26Dy1wnjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(10070799003)(18002099003)(22082099003)(3023799007)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVFSd1pPRXhBak1kdXkxOVloZlY0bGZMZmtOZ2Z3bDVwdGYzcVIyeHZEUHF6?=
 =?utf-8?B?dVh3QTJuZFlhSytma3NJdFIrTmd0RTMvYllFRVo1RVc0SjNlN04yK05qd1ZJ?=
 =?utf-8?B?NXI2R1JHU0k5RldndmU3cXN5UEM0eG1xdVhKa0RseE1laHUyemp6NEliM01P?=
 =?utf-8?B?RzJTaHZ6YWQxcjNmZitkdXdzOHdrV0hhQnNRSUU0WUxhbEpBZVYrWmc1VXpj?=
 =?utf-8?B?YWFPalREanByQzlVdWdLL2pFMzJqTW15Yk1zR3d5L24yRHBCaFRBZUFzR0dW?=
 =?utf-8?B?eUFXYWhGTWEzWjdCMmREWWZDVFhHalVvQ0lGRmhtaHYrRXBRWmdYY3dkekcw?=
 =?utf-8?B?VGExSVFybWpmak0xQXpnSE1FaGZaTkJsVFRyN0ZGYkJPKzMvclJVRXlJYm1T?=
 =?utf-8?B?VWZqMWpjblZMemxTcEVhbExSZFZqdXNjNjE4ZWFDRDJxVVJha3dTbzNheHFI?=
 =?utf-8?B?cmRkN1BJSUJEYThrSDk1djA0eXZPM2tCVmpRdFFRRloycU1hQ0ZuN3ZRb3Ur?=
 =?utf-8?B?WUs0SDhCWjQ4YnpxRGo5Wk1YRVhuS2xGdGhyQXZYMUpPeGJEWXBMKzV1SFgx?=
 =?utf-8?B?L3UvQ0tQaHNNT21uMTJ3dHNVRktUTkpJUjllWXlvdEdBQk1aV0lPYi80QnlO?=
 =?utf-8?B?RWgyTWRNK1FldzVmdVZhV1N2K0IxMStYUnB4T3JFSjBtdWhMQ1U0dmYvUmpl?=
 =?utf-8?B?SjdJbnNCWW50L2dMQ016N1B2c2twZkIwYnNIaEg0Ly9yRFJ0QWZDYndDQWNB?=
 =?utf-8?B?RFNvTnB4MnMzb2hRZlNUbEI3enhWTFBnSWlacjlONENId1RGSVZuVWhzWVZK?=
 =?utf-8?B?d1Naa0lUSWh6QlZzSUVOMXhmY0NtUHh5RlRtMjM1TXFzY21Femljcm1SdElT?=
 =?utf-8?B?L0h1YjBocDZUc3BuSXhzOEJJTDkzMWpXeXdNSGJqOUZ1a3ZxSmpwUUpRckZB?=
 =?utf-8?B?aDRTckROR1lDTVNpWXhjQkVkdXg0NHRPTnJvSytqWFI5Uzdwc3R5N3BaWmFT?=
 =?utf-8?B?VThvdnZVM1BjMkZmRnJ0R3J4SUlzMjBjMUYwQ29iUnpGR3ZkdkhkN1U1UDNL?=
 =?utf-8?B?MkJPaS9DK2lHZjkrdGxDTlpjeHFpcW1wU1QxbEd5MlFyR0tybE1CUm1Eb0Fs?=
 =?utf-8?B?MHprVnBEcVI4N3pXeFMzMmVtbmNpU01mMjcrWmk2YjdjdkZMUVBIeUlGcFIx?=
 =?utf-8?B?MDRiR0xjSklXZldtdUtpSmd4d3lWeHFmK3RnR3pPNnM4ekQ4a1F1cG9jbWlj?=
 =?utf-8?B?MmxXb25LSDF5UVV4QjdBYjJhR2RxeXRLbmR5QVlvb0pUejFORVNqd3gwR1NK?=
 =?utf-8?B?VDduTW5hNWkyb214SUhwYUtJYU5GVlAxWitvWFRwOThTM1BzMjJGZDNpVXJG?=
 =?utf-8?B?TDlHMk1WM0krNHdvRDJZMmJVRTRRWXQ2SWlkOUJiTEVaWmtndXV0eDNMaHQy?=
 =?utf-8?B?djNYYUhSc1FFWC9MRG52YkEva2hwU2RFSU1BdmtKeXViSlhlOTRCVDRqWmZF?=
 =?utf-8?B?a3AwaDRJZHlSMVFDbCtxU0N0N0RpVFE1QXFpZ1M4S2R2MDRrSFozbHJuQ3Y1?=
 =?utf-8?B?SGJWUzI2VHBQSXJPUEk0bVRrSDdHTFh4TGdVZmFGV3hsMWE0UG15QUJOQStP?=
 =?utf-8?B?cmtTUG4wNDFwQk9BOXphejNGMjJjMlZKNyt1QkkwOUNFWGpiNEM0SnNUZ05Z?=
 =?utf-8?B?T3U4NUdKeWRmakU1VjNEbEVaNGloUlVBTDBxNEx5V1puZTQvcmZUQWI4S0tJ?=
 =?utf-8?B?UGJuTXJJeERGQmRZQmF3RU1iZVBETFFid01NK1l1RkZXR3FxaHNacE56WGN4?=
 =?utf-8?B?d0Jya0NERGhXTEo0MjVveTRTSmxFTm13cHRwSERBWUtjb0xOWlFPZUhqbzJx?=
 =?utf-8?B?d2lMOWh0WjNRcjFJQ3FPbko1OWdFNkFrYWhLNS8xS2lraEJ6Zk5WdzB4UVRL?=
 =?utf-8?B?TmExTi91MU5lSlNVTzFWWGdIMVZtSkw4NDgyY1NNbHVlNHVJVVZxM1VLcDJh?=
 =?utf-8?B?ZGJwMDJMaEVIRTJ5Y1Z3SFdTT2lmQjZYN2ZaaWxmdHZUTG43SFFpVlpPRnNu?=
 =?utf-8?B?NGdjSW9iZzlvWkVUKzI5dVdJNGpZVWVvVGtuckwwT2MwYjhvVlhlcXFEUldj?=
 =?utf-8?B?ZVBPb0hEVmFnQkVvTGFiMDVCTTJTZVFLc3cxVldyQkRmQUhYQ3VKSWRocGoy?=
 =?utf-8?B?TEF1NmRFRnE3aE5FVTM1Y1RKeHJFOW43L2lDT2FIaVFsUTJaVzhKRlllaEFX?=
 =?utf-8?B?TEdFUG10THkxcWlTODhaYlNsc25uS0tjZzF2dDFSdWFoVUV4U24yVjN1elE2?=
 =?utf-8?B?WXZMRG5YcitzelUxdkJIczZ5UExzQ01lVURocDBtaDNKclBiVFRVUG5CTVYw?=
 =?utf-8?Q?8DwT87Yz627bLZuXRjbfz+ham+WCGsqMYfHOP2NTVeJTS?=
X-MS-Exchange-AntiSpam-MessageData-1: 6sAeuxknzAp7Bw==
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f1af26e7-776e-4d8e-e810-08df134a0a81
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:54:43.5694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wakenK5EUG94pBkyJqiGqeuScuYXYhhvB/fBtaefrxR66W7EllDQi9nZeCQduhpHkD6tzvsdfqvySCne4EjpDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1707



On 9/10/26 12:47 AM, Judith Mendez wrote:
> MMC clock pins must be configured as OUTPUT-only per TRM [0] with
> receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
> PIN_INPUT to PIN_OUTPUT to match documentation.
> 
> [0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals
> 
> Fixes: f1b3adade045 ("arm64: dts: ti: Add am62x-phyboard-lyra carrier board")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Judith Mendez <jm@ti.com>

Acked-by: Wadim Egorov <w.egorov@phytec.de>

> ---
>  arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
> index d6e70ee15938e..c9b3e0518faf5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-phyboard-lyra.dtsi
> @@ -227,7 +227,7 @@ AM62X_IOPAD(0x068, PIN_INPUT, 3) /* (R21) GPMC0_AD11.MCASP2_AXR3 */
>  	main_mmc1_pins_default: main-mmc1-default-pins {
>  		pinctrl-single,pins = <
>  			AM62X_IOPAD(0x23c, PIN_INPUT_PULLUP, 0) /* (A21) MMC1_CMD */
> -			AM62X_IOPAD(0x234, PIN_INPUT_PULLDOWN, 0) /* (B22) MMC1_CLK */
> +			AM62X_IOPAD(0x234, PIN_OUTPUT_PULLDOWN, 0) /* (B22) MMC1_CLK */
>  			AM62X_IOPAD(0x230, PIN_INPUT_PULLUP, 0) /* (A22) MMC1_DAT0 */
>  			AM62X_IOPAD(0x22c, PIN_INPUT_PULLUP, 0) /* (B21) MMC1_DAT1 */
>  			AM62X_IOPAD(0x228, PIN_INPUT_PULLUP, 0) /* (C21) MMC1_DAT2 */

