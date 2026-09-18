Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4146513576;
	Fri, 18 Sep 2026 16:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749997; cv=fail; b=pIBMvw7DgKOlt5xfed5f73/jKb4KZDN8huSs01zk0bzLcAqSPnttSThq2gQU3evjbjbt4EMNjtDPpnGOhvSZ7rFTEQ93Q706fsqs6IH5zzWa2tacRQ2AUKQa7fAUvNckShE/lNKIaNUeSsjpSRPPB/cwlFnhcUp3f5BuNYg7Fik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749997; c=relaxed/simple;
	bh=Uz50J+095UocwPLbJ9GBkzSFpUI+X9cx8ycyFwHkwTY=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HhAUy4Xf9WiVR8338aqXUgajyVIR7Mq1368LsFb+YiONtkQDcwF4ehlsxIFZMMDdLpleir2sfQ7IeyK/itU3arR4pqEtx/fC1A80YFoOD43ojn868kxuIpViq1byo+ob/Wl6KvujDz0sIEVWaKimwxC8cPs3psnyGqeXCqbsSyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=mbloKybi; arc=fail smtp.client-ip=52.101.85.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="mbloKybi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVQlFXk2PC4YMceqr35loGJMOZTxY4UgKRmlEpv47oYKnKDob82ySzHzkHcDXPxxd9JwW+YS3RktBWkHPqgmCvveSa+8GiU8oajlF9U5mFJMK8OeGhtFamxQROZxs/PS+8uXVfNRMaHHWKrDJzMnBdUPULgmcCIpwrIHbjtu5bGXU06KRopXHfHdqUuZ+6VwZmTYISJVG3qGuheJE5YJzz86r8Qn+ONBHG89wVMAVcLxq24lBojh7O4FV31e0TqEEB5I4d7UgvcqqG+r3VDSmVxuVdXzMbttokT4P6+0tldJd2tebzBNbEg/NtwIlwZh7AsSOs+eEWzmsr9fqKU9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgbIMmgd1gBjooo8RlfdMKmEzrEORK1ay/rwCC6F2fk=;
 b=NjESOugtGGPsc5+FpSVGxDo6fZr/M3y7X/2BZxF9Q6QK5M0NpJiObmSvGA49IWcILhbJAeQoNvAKcIz15qgfXWo71PwYYR13SSpw3z18dQYVOVSwx/IZ8Zdq33VA71vQWuhevSEbjUoypikDwb4oND7Hm01JJ6+upByZN99+yJ9zJjm7sPQl1JFDqEx9cf00sfM/ZCYOHetnEH2qFpGfeJB8gXCAV+aN4aYVi9VaX2Xe+pGiuMzCsk5p62Nf5EBGwixc9JJ5WYWpx1TA/MAan+OY30Z11/MkJqGkLCB/oB2zzfFDOlZ3C5XrXVRnHIp+sNRzZGhr2vysgIBctucA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgbIMmgd1gBjooo8RlfdMKmEzrEORK1ay/rwCC6F2fk=;
 b=mbloKybiMNgXhBgx16vjTh1Q45w5v4A/OtBY7Zb/DOGuflZ0Cml3Y1aI7C31qs8FnkTmgx0Tw4lTB5iWkAuxWn99uoUwl2OarQyuu/4P11R7Q3PAqy0yTq1JEr3Thdajerxk6c+yIVQju+yhq8pUW1odAaUrZc+sKlmZ8AEPADuJGeo+34aymcs4dABqxMszAazVUfiQ0lpT1XGEhR/V8WXQ/r7UYPHsnBwyN56IrqTczFTLczkj76uNqS23590VgjOdZuCMLc39ZtkTOEjiWxcMUPUxe5h6ObR6Ge5XHdhxXQ8t4MlPuNm0O1t7xHLtaqAyX/lTgX19YaHjwAmQlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by CO1PR03MB5763.namprd03.prod.outlook.com (2603:10b6:303:9a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 16:46:29 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%3]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 16:46:29 +0000
Message-ID: <6d259ee3-a737-4074-9066-3b01e3673e1c@altera.com>
Date: Sat, 19 Sep 2026 00:46:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] usb: dwc3: add Altera Agilex5 DWC3 support
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
Content-Language: en-US
From: "Ng, Adrian Ho Yin" <adrian.ho.yin.ng@altera.com>
In-Reply-To: <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|CO1PR03MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e0409ce-40ff-4e75-8196-08df15a462db
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|55112099003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/5bslwe9Di4fmiDeNZYZ5vZ7H8FUqsEvs//XPjFceNOCrK5s87g3MugEbiO35dBohHRCRS1qQThGisIeim0lLGwjR1Q6hznXuSF8EnGLdU7nxDu1umrK28N567SCcE4eXzV0G+dQCXVGy6sq5YNSlR6qm8YPSC6O8RA87FNfLDgxy2ynzh2mSm/Q8c9T7az0jz6SbzzvUG/8sAxbdOnqYmmpSGMmpbJtSZDsEGpDtr57MXzNHo78DzsRMGYr8cIdfW0EUEfIgfx0iLYiI6jzJSfVXJajA68M/azjP2F3otadJUQmhZBpX5/fPU3CfmqQtgomtcoILMpclbFh2UV4cK78Jbj0wxE/0PcpVdghqzdRcCfecBTewwgj0G6Mx2uK7b+jSqGLa3bHt9P3Fvm7o22o1uiHcc5wxuydCawaL52TrBry0ARu4bjD2edALMDmubrXyp4BjsQ0E/b10AxB9T1VMo90wbzsQkMPiGE25lBpc4mLYb+y4Kn1FBw9Sgl7mUEdYmvO3Me4H4c/tfwZtAcXYmPEoOR1S456l7O/5cJxnc96dHN8gAM5tzhRZAfugCL0dtbqvTZ/Sz10vv62TtNddkKSYx0Z5D/WyPPuisbL9av7+KP8zk76Osywj7W4MqZjkDrHhigyum7igoDALKZCNpp3ESumhnfZXAPPkoQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(55112099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWFTc25HOU1TQ2FUYmYvbXRMcDRJNi8rMzRSRHFkdUlDRDY0bUpWUDM3NDFl?=
 =?utf-8?B?Y1Y4MXBWOVVxa1J2S0hsckQ2RTQrWDhDcTcyTkh4UE5ld1c4d3AzZVAyQlQ5?=
 =?utf-8?B?aEZqUFhaN3liWE9WWGM3akdBYzFNbFNqU3llc09KSE8yRU9rcjZycGxlOVpG?=
 =?utf-8?B?TERwK3pVZEY5MzV2Tm9CRC9Xb3dtUHZ1aEdBRFlaVDdtTG5DRzgwVC9JL0gy?=
 =?utf-8?B?S2xXenFTTEhidmxuVkhxa25VR2E1OUNOdjkrMzYxK0dGamxlWUxLTWZzUi9D?=
 =?utf-8?B?VEg5ZjR1QW9zaXpKV0F6WFkyR1FnQ2JNQjVqYjhYVUp1dE5QOUM5QUxwQlBv?=
 =?utf-8?B?OHZ1SUFhY1RBT2M2QlA1eDREQkovVWw4K2RNdXNIdlIxL2RrbkVGOUhScHFx?=
 =?utf-8?B?YWQzMHBsV3NZak1VOUtwN1NBemFGUkxEUWZPZHk4OVZQdTFjSVFaN0hhdzRO?=
 =?utf-8?B?bkR2ckx4NkZQUHFpTndEbGRwTWJQclBHVjVoU1Z3a3BmYnkvYTdPTUNiUXFt?=
 =?utf-8?B?b25KcWlCQ3BMd0tZRXpNR0dSVGlCN0xveGc3TFRPZDFlRXVMeHZxYWZ6ejBC?=
 =?utf-8?B?dGJBWXZtTmFENHFKai81V1lHeDhuTms3UlE4bUlVaEJIazJlU0wyR1p0a1Zp?=
 =?utf-8?B?d25xZ3V0d2x2R280cFNTeng4T0hSOXZJWUpYcWxqS0ZMa2Qzb0lzRWhsWmlY?=
 =?utf-8?B?SmdHTG0wZkU2d0tGQTJUM284aUlONU05M2hyODdMOTI5b1FNTGcvQWJaTlBS?=
 =?utf-8?B?SGtnMWsvNWJDbVBBbDN4YVFYdTU2VnpxTDFzTWN2TFhhZVR0cU1tbkV4MkRq?=
 =?utf-8?B?OVYvVU9DMlVUUzNhRkl5WWNSMW5aVkhJS1VnSzlDR1BHb2tybi8zSnRQWkNC?=
 =?utf-8?B?NWgyY0EyUzVQWjRFa3hLRW4zWENnS01MZEFMNWJNKzh5Tm45TGQ3RGlta3RP?=
 =?utf-8?B?eXFaYlN3dmNpZjgxSWYwYW9Na3U3MmlpRTJTOEdPaWREeTl5c0hLK1dTcUtI?=
 =?utf-8?B?eHcyUDE0azZ4ZEVWcjNwZEEzMDk5Y3NqLzJnUlE1VjNoUGpoNE5LakJROGta?=
 =?utf-8?B?TU9HaUMrV2prNUhSTkRncFVjS0ZKeVB4Y0wyN05JdFhjYy9EVkRnSVh5MFhF?=
 =?utf-8?B?MmtDWHh3NWIxd2U0OENGWnN2MS96QzVXb2JxYnpwZ0EzZXZPQlI5c2ZQZW5C?=
 =?utf-8?B?clBWb3dsQTNOeDJoR052NDBxK0ZWLzhlL0YxamU0bU40M3cweUNkeTdHR3hU?=
 =?utf-8?B?amRzZlRXT3hvT2hYK0d0SWZsaTFaYktoL1ZrVzAzejZNcE5mV2d5Y0pQK2gy?=
 =?utf-8?B?YjRBL3YycnhidzFZSmZINUs3ZDJvNGo0ZmM3ZU9EQUZML2FKVkx3eWQyNzFj?=
 =?utf-8?B?a1FPUy9sMlJpOFI2dkRNTmtPeS9wLzZPcmdJVWFld1c4WnYzSTgzUGVJaEZn?=
 =?utf-8?B?WHZZUzl4R0xpWkd6cllpU3hTQ2tIUmZzbDZBTVQ2T09OSXJkQmNsL1F3VmI1?=
 =?utf-8?B?UzFiSlliL1RLeEllSTdha1dtcU1YU0xWc2cyTGN5WXpjQjRkWWczL1c2K0RI?=
 =?utf-8?B?LzdjQWg2eUNkTm9WK0hoblNRbUtGSkw1MXpNTDFjclB0SUhyYUpLeVlMRERS?=
 =?utf-8?B?NHRSYmNCK0wxOHZERzJtb0Y5ZlF2UVF3SzRjZldKRHFLK0laUVNZVzNnTDVN?=
 =?utf-8?B?OGRYUTQxODg2K3NmSjI2Q2V6UHVKcTRqTTRMeC9BNW13SWRWUkYvZytmaTJG?=
 =?utf-8?B?VlJ6R1ZjdCtxMUExd05UekJxRWJPS2ptMGNRRlZrMytNazNPa0FaQ1hRb3NK?=
 =?utf-8?B?QnExZEVkVzdSQktLNXZsb0hwTEdYejNBcE12WTdkNVJ2QnNCUHJGc3BmV01i?=
 =?utf-8?B?U2tkKzJQOWtFYjZJcStzT01pQmZ1N0dlUllkVUN6VnlJNmxaaWNFN05CYmtr?=
 =?utf-8?B?KzU5MFk3ei9XbFN6YmxPb21PZ2dWdm1lSEhGb1FHMGpvNmRGZnRtRERkSE0y?=
 =?utf-8?B?MVlqaFA0Vklackp5Y1lORjY0d21PQ0hvcU1pRnIzNlVQSHlxbE15alc4Tmt1?=
 =?utf-8?B?VWkwVXRZK1MwNGJPb1RMdTVjM2ErWVNDZVBIMVptMFBYYVczLzR1d09XVTFs?=
 =?utf-8?B?aWt1bkVoeWxPRjY1MW1jNEpzKzAwWmpVRStST0FPcnhieVhhcEN5Zlg2NkRk?=
 =?utf-8?B?VnRGNGdUdWhRWXhrdHN0emtUZklZT3kyNHdPRmRBK09IUFAyMUphUDNtTjFE?=
 =?utf-8?B?Sjg0SlRlZkt3cCtYbUtoVC8wM3N2VzVFNUxXdENISHVydDF0RFJtK1FzSmFx?=
 =?utf-8?B?c3J0dnB2b3NRaFZvRFpMSDF0U0pPZW1yOE5CdjNnNnM1RVFyZUxFMjdMUGZz?=
 =?utf-8?Q?at5DbtvK1mDVfJXc=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0409ce-40ff-4e75-8196-08df15a462db
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 16:46:28.9446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfgnuqqhgizXehK0KQkCvZErv5LpzHErJAqaXz9v89KWujKfF/2JBRujaAhm4mHth6PVaXngjHdiXUqOVj/SMF+RPHUCCMfT2ptI+5S3F18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5763

On 9/11/2026 5:04 PM, adrian.ho.yin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> 
> Agilex5 integrates a Synopsys DesignWare USB3 controller that is probed
> through dwc3-generic-plat. This series adds:
> 
> 1. dt-bindings for compatible "altr,agilex5-dwc3"
> 2. matching entry in dwc3-generic-plat
> 
> arm64 DTS enablement is posted separately.
> 
Hi All,

Gentle reminder for this patchset.
The device tree patch has been applied by the DT maintainer.
https://lore.kernel.org/all/02d94760-6e5e-40cf-9354-63b9bca5d682@kernel.org/

Thanks
Adrian
> ---
> changelog:
> v6->v7:
> * Drop arm64 DTS patches from this series (DTS must not be mixed into a
>    USB-targeted series). DTS is reposted separately.
> 
> v6 patch link:
> https://lore.kernel.org/all/cover.1788886615.git.adrian.ho.yin.ng@altera.com/
> 
> v5->v6:
> * Make snps,dis_u2_susphy_quirk and snps,dis_u3_susphy_quirk required.
> 
> v5 patch link:
> https://lore.kernel.org/all/cover.1788757821.git.adrian.ho.yin.ng@altera.com/
> 
> v4->v5:
> * Binding: replace unevaluatedProperties: false with additionalProperties:
>    false, and allow only the extra DWC3 properties used on this SoC via
>    "foo: true".
> 
> v4 patch link:
> https://lore.kernel.org/all/cover.1788503540.git.adrian.ho.yin.ng@altera.com/
> 
> v3->v4:
> * Drop clk binding/driver patches; reuse AGILEX5_USB31_SUSPEND_CLK for
>    both "ref" and "suspend".
> * Update altr,agilex5-dwc3.yaml per review.
> * Limit the series to USB binding, DTS, and dwc3-generic-plat.
> 
> v3 patch link:
> https://lore.kernel.org/all/cover.1786518803.git.adrian.ho.yin.ng@altera.com/
> 
> v2->v3:
> * Drop dma_addressable_bits; describe 40-bit DMA limit with dma-ranges.
> * Keep Agilex5 support in dwc3-generic-plat as a compatible match only.
> 
> v2 patch link:
> https://lore.kernel.org/all/cover.1765249127.git.adrianhoyin.ng@altera.com/
> 
> v1->v2:
> * Flattened model + dwc3-generic-plat instead of dwc3-of-simple.
> * Split USB3 add vs USB0 disable in DTS (still wrongly kept in USB
>    series until v7).
> 
> v1 patch link:
> https://lore.kernel.org/all/cover.1762839776.git.adrianhoyin.ng@altera.com/
> ---
> 
> Adrian Ng Ho Yin (2):
>    dt-bindings: usb: add Altera Agilex5 DWC3 controller
>    usb: dwc3: add Altera Agilex5 support to generic platform driver
> 
>   .../bindings/usb/altr,agilex5-dwc3.yaml       | 112 ++++++++++++++++++
>   drivers/usb/dwc3/dwc3-generic-plat.c          |   1 +
>   2 files changed, 113 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml
> 
> 
> base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d

