Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020097.outbound.protection.outlook.com [52.101.84.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FED4B0CA9;
	Tue, 15 Sep 2026 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491269; cv=fail; b=AyLA31OXkNmlgAR5zwiGYDEgBBR5MLdv9MvC8FFP/fpavdsCq2lRd/yodIssw+W4/nUxGstSjH5BgHgBAaUPaHry+urv7Rd/EoASZ0Rxh+JVpNexT1jXjfh9R3lko679JX7fYFx4LIs8RPocppiZiU3e1OLF2A3cB0iwAmkcl60=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491269; c=relaxed/simple;
	bh=T1ld8V7dcZBRWPmIb3UDhV0m89hblMUHV8mmoChXucA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hmRCm0ujLD23bwA1lZHm6GD51KjC8sMIYGltcJ9tY2zcNQ1F+xtaFnSvcOZIGgJ7XMtrVQTDMiM4Q6m/aQC7qX3EzhvLE9AZkql/sosGyeofpMlACwpBVyiWpp5A9czo8spgFJTjLvIr+EA8khovazEX+mhMzvc19Aj9EbWUvgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=fIC+ymmp; arc=fail smtp.client-ip=52.101.84.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="fIC+ymmp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tl42siPJimCZyGKaj2aNpb2HkghHlvTkoOpDMBPO6oc7Fx38c/StOSs4r1x3afJOeWn2ecuwelFdT2oQkDFqDz4SGPIQZXoy1kVp936d2nTtNFs7Qxy4lAfIRuzyBpV78yT0J0iD+9iMbiW+VL6e2pp8xFNZhgOpLopatFjJYt3CbLA5IPfotxFjKasYCRcCvcHyGx7LiUnFaJD9DopAoanvg1MOF4ZTAEz6lv8q2THO9oeZGlbKoI43Xj25dq+rOKNXfqgIGMBBOrSPZuYejZ+VNpaZdyF+13xD99/+Rnv4RCCOQqNCeJgTAiTe5vHhtTeAps2TaE0HkfLV3oTecA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0WGQSqMo9XJ6D8y/CMPKY53z57Ufwz8jRrt6SS35TE=;
 b=uDeY4hJ1hJzoYCStX6Obehyz3tk2fTj665wsZOzL5tEDS0gOL91kSoCBJs8m8q3iyZK2ApSg0rP8T8JqxSEawVxs6YaglKptbVq79uasPvMNNdr0jlISQhC1Q9mfViEw0UqU9QvdnUse7iq35hGw5HeTo27yHH8IuLmgbqZAVt9Y+BRlkXLfUSTg5TGyGe5lYorbJ4oIYmBiS3CmycHWJTHVrO9VCLxO2L4T5B4Q+CFt3fRtf+RhELalG6x0Ud019joSg4R+LC+YIGKOItldhXe+Bhxb8hzRRWPez6MJ+g2DWWbNukaUabXHpY8roe435lD5TbQtE55rQ18MjJ+JNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0WGQSqMo9XJ6D8y/CMPKY53z57Ufwz8jRrt6SS35TE=;
 b=fIC+ymmpROuTlJOfyjCdUNbn2+pKQCCGWT97iG8I7dGuBe3UNYLm6PNjPSRUDOEjPhhurMEN6PEJFaJzqcVIlwxPcRmYt9lxM0+LS3lnbrHT7GxN+mOP3Ox2VlP56L4rxV5Fl76OXY+hRHJEpMfIXXM3keEbPLwXSayu92ezlVzoQbB1DcKE3w4ruBYOXNAlhZbodWCNfL0U5hifzRBOuDD0bf9gfcTqih2t5wEz8W94TP0r2rERmpvhf8/jqmr24co0ChDXWThax/uDdtsMelddd+az0tydQsThchBGbvHcchYrxhMudY5MfWiYC7Y4amQFkt3TaqQ9fXRZJrIOsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by DB9P195MB1707.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:396::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 16:54:22 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 16:54:22 +0000
Message-ID: <22fd1887-1641-4649-8af1-bd2a52eff894@phytec.de>
Date: Tue, 15 Sep 2026 19:54:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/15] arm64: dts: ti: k3-am62-phycore-som: Set eMMC
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
 <20260909214743.899477-12-jm@ti.com>
From: Wadim Egorov <w.egorov@phytec.de>
Content-Language: en-US
In-Reply-To: <20260909214743.899477-12-jm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0027.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:3::7)
 To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|DB9P195MB1707:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc85ef9-d506-4be5-0b1a-08df1349fe09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|10070799003|18002099003|22082099003|3023799007|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	6vZX3r24IH+pA8dI5+rPhLYImWlnhiCiDXjJXu8VG9caRg1Tdm68jWMFJv42eAFCAvMScPXstU8+x54byxp+S6N0VYSHxnaP0diLAn/mWpA7qGVu+hSmrIsMlJfeLvH6YWcYnS7hJsq5cHyeZsqvYLXDqJkJ1NgMlfj0+YhzvyHBL5VLvXGuqqqVyl2hJQJEthJRHBgxXEdY4Pm12qv7rS6SViH5r8IHHppZ9XCfZbI/Qry+961D1T0sEjdLysn5PN9lMsWWP6EvAb35UsKMlASwjlAlfqOFYUIC6QPgOquO5MQMhDqGp1WxHy8KE1OzV8/HzyjgW2vZfU8gAdS19f9NJkJ8DOIPgULxuXOHNd7xQ3DnEmS3is9veFbov+vCulNRwAyKWMS7Pyw9Nm9V17vCinPovrjCyY9Nyh8Ep12GQgPr/eMxGVjiIob4VHAd07dFRE36jRJmELnvdTSADR4sDLWBBFtGZ7HjRbm8Yt0nH5phyeHvH3neVAVHo+Q3doMO9BfXmghgeWksoToTtsURbDye2XOi2l2PkSAxHd7CTyqIyA3DEHtl/sdxrsd3a8+mIhwqULoO9AIHcXN4AGdwZfTDiDD1mfgkQt4LVt/WjGD+zZrUi4QfwGPoyzzV3FxuUPjf0smxRkddB6YTRTg0NZMOmp6EAHIx5eMKUYE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(10070799003)(18002099003)(22082099003)(3023799007)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlhGY05VeXV6K3RvUHB2VUxGTUs4NE1oTUJUeDNCOXRYVTVncFdCUG1UREti?=
 =?utf-8?B?Uy9zWWIxVEZzdWZ1S3JsKzFteUR1NFdCbUpmVkdOa1pwNG5GbTdYVlAySG5R?=
 =?utf-8?B?VCtseUVJK2dpdThubm1nbnQ5Ujh3dy9LN2V2S3NnOElGZlRrYkZ4MnMwWTlO?=
 =?utf-8?B?R3lBU050ZWdSeStxUDZ6NWMvZGtqa0cwZ1Ayc3hKTnVISnpmOTdtRDJWWGhh?=
 =?utf-8?B?U1ppU1F1WDlJclRDMGZOMkxkWmVaODIyMGxtSlh2ZDJRTUZtczU0U2UyUHB1?=
 =?utf-8?B?TGgraW4zSFVIamxscEFWYTA3RFB0Sy9tRjVndnJxbWVlTkJCZVhuYmlvcisz?=
 =?utf-8?B?Y1ZJUm0wYWhQWThyMngzbnM2eG1ieFIxL0ZDU2NZczE3eGlnbXllamFMUFMv?=
 =?utf-8?B?TWxjb0V1T2NCSjUwMkpwbHYwMEZiMTBjanZVaGFQMHdWNjd3K1BLQXJYNVBW?=
 =?utf-8?B?bFVtTkxHUDlLUDFzbWx2TDBKU29aZGpORzliRlVzOUdSczA3UENXbm9kRzNo?=
 =?utf-8?B?bm80UkRISVhKRk1zaTlETHVmL2hRS0F4REdKVVZoMFFOc29KczNyZVpkMWY5?=
 =?utf-8?B?cUxUTisyZ3pLRFFlZUk5ZzNua21xcnd5M3EzQXNuR1FSWUZmVzQxdHVNb01x?=
 =?utf-8?B?cmNWNkhYSzA3WUx2V1hPbFNoWXk2akRLaHJSRTdHaDdkTC80WkwzbWpIS3JW?=
 =?utf-8?B?Y1hiU2REd1ZQK3NSQXlJaFJSOFZJYldZdkpQL05lWUlJMTZpQkdmTDA2L3Vn?=
 =?utf-8?B?UnlHVTI4SGJpbWVKdFFKcGkvL2VCcmZLdE9SV1JXNU5xNWdXVm9qUDg5amZh?=
 =?utf-8?B?WXhxN1E2WFFZVVpiZjY2MjhFaUJTY0NYYWswdU5vMmo1WXJpOTRGTlZzVGdp?=
 =?utf-8?B?c3lHQWNLRFpoTkRIaVZTOVdKR3NwdG0vRXZrZURMb2xYc1VpcTA0QzZxanB5?=
 =?utf-8?B?UDlOWkd3MExza0VKWDl5Nklka2lwUHF3aStEaTdGSGhHU1R0RDM0YXJLVnBo?=
 =?utf-8?B?RXpFS0VrUUVEQUl0NkpBcGw3Snp6UUxaZ3EzVzBtRzc2MWVJMVppYVphZEhW?=
 =?utf-8?B?ejRBei9YbkxzaVcrMytjNVdRTk5ZamtHZ0ZXQ3Y5RDZSR29XN3llZ1hTZm1Q?=
 =?utf-8?B?UnEvdEhGOFpLR0hvNUoxUmUvczdDK1hHenord0RHYmtIUGF2d3pybU1aM1lo?=
 =?utf-8?B?dmlMbm9PT2dsK0JFYmJ2NTdlbkM2cnhUVWJTNjJuSXdza0xsRGhtQWw5c084?=
 =?utf-8?B?RU1DRGw5VjZMYit0VjI1UGJjZE1ReGdJY2tkSFFKTGNpVVk4U3JsNjFFUnc4?=
 =?utf-8?B?K1NHSk14ZVFpRWF3N1ZQNnlDcWZXT1Uza3VrUW01SXFGWVZmVTJXRmthcWRw?=
 =?utf-8?B?V1hBN29zZ2FBZXFPM283aEZqUS9iY3l1WmRoZEJkUmhpUExkUk1nSDY3ZmxT?=
 =?utf-8?B?TDBCYXVobnJ2alk3ZEtmd1NFeDlwVm1xcHRLVVB4VkVibFNFR1NDMFdBakFU?=
 =?utf-8?B?bU1vVUdjaW5zYWpQckZZWW5mdi83dUg5eGRTWWlKeDNDVEJRM3BPeldGZlV1?=
 =?utf-8?B?VU5BYnJpakprUTJBY2JMSTAzK2pKbmxuMlZwRlZET0RGUDQrejBTeFV0c0ZB?=
 =?utf-8?B?ZVpvdERMUUhLMHFjQXVGWGNFbWN1MDZTWEM1Z2VMR2FzUFBZZk1iNEJybWw4?=
 =?utf-8?B?eDJlelZad1ZRWlZEZkNGNzJUdGM4VDJUQU1DbElKZXFGdVNBbjJ5UFFsM01Z?=
 =?utf-8?B?eEZIdmpCV0d3TzZEV2JiQTdzTWhSSVZQcktPUmhzZWVFR2JYYlNnVG1SVHdB?=
 =?utf-8?B?VHZ3Z1IrZ1lqeXZ5OVl6ZENUU0VzN1NmNVlOQ05JNTRxcFFNV3ZGMkQycncz?=
 =?utf-8?B?SzhrZ0p6SHV3SjBLeEtBM3ZLOXdMaDk5TU5peEt4YWphczBwUkNYQmhtSWVo?=
 =?utf-8?B?REV1VFZackwrQWVOYjlETlMremh2WWxYd3pVVkY3YTZjUnpleTBxVlB5UTE4?=
 =?utf-8?B?RW01MEp3YVB2ZCtPa2J0Q24vUnlzanNwaEp2aG9yWDUxd3ZsMU9PczlhbEtU?=
 =?utf-8?B?bTduQ0xQalRWek90ZzlHS1ByMDZhMGhGR0pkYnEwZlh3c0ozdDRjbllITDcz?=
 =?utf-8?B?bjFrT1hKU1k0VGd6N2JDTlJBQzdzMmhvbGovc1hTakhQUmhoS3hHSXN4NGVo?=
 =?utf-8?B?Ti8wTUhZanF2aUdhL1M3Qk12MHh4Y3FGYlUyMGZldDZSc1pHVHdneXIzZjdo?=
 =?utf-8?B?QytyVkNkdTNycGd6SE1md3pSaXdNV000ZXd6eG0va25tc1RGTEtRNnk4Y25S?=
 =?utf-8?B?OFhhYk1CY09Qa094eVl5ZjUvbEFwT1lidUJBb0FJdnpDU2s1akszczlGVW95?=
 =?utf-8?Q?2gjc0xlilg/3Zim/3qJTO/cfE+oI3BRBC/7ariz/L0b5W?=
X-MS-Exchange-AntiSpam-MessageData-1: rDsv+EC4zuklDA==
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc85ef9-d506-4be5-0b1a-08df1349fe09
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:54:22.6798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hA2azfMu73P2OOJsB8QbctFdcUaXt4WpGGdgSerBkPX+g+iu6kil5mE9PCqhoDqTiacxhVVHYEvnv0VyiL+owA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1707



On 9/10/26 12:47 AM, Judith Mendez wrote:
> MMC clock pins must be configured as OUTPUT-only per TRM [0] with
> receiver disabled (RXACTIVE bit = 0). Change MMC CLK pins from
> PIN_INPUT to PIN_OUTPUT to match documentation.
> 
> [0] https://www.ti.com/lit/pdf/spruiv7 Rev. C: Table 12-246. MMCSDi I/O Signals
> 
> Fixes: 3443c1c4ed61 ("arm64: dts: ti: Add basic support for phyBOARD-Lyra-AM625")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Judith Mendez <jm@ti.com>

Acked-by: Wadim Egorov <w.egorov@phytec.de>

> ---
>  arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> index 3baa653257bb6..ce3e5165bd310 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62-phycore-som.dtsi
> @@ -153,7 +153,7 @@ AM62X_IOPAD(0x15c, PIN_INPUT, 0) /* (AB22) MDIO0_MDIO */
>  	main_mmc0_pins_default: main-mmc0-default-pins {
>  		pinctrl-single,pins = <
>  			AM62X_IOPAD(0x220, PIN_INPUT_PULLUP, 0) /* (Y3) MMC0_CMD */
> -			AM62X_IOPAD(0x218, PIN_INPUT_PULLDOWN, 0) /* (AB1) MMC0_CLK */
> +			AM62X_IOPAD(0x218, PIN_OUTPUT_PULLDOWN, 0) /* (AB1) MMC0_CLK */
>  			AM62X_IOPAD(0x214, PIN_INPUT_PULLUP, 0) /* (AA2) MMC0_DAT0 */
>  			AM62X_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
>  			AM62X_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */

