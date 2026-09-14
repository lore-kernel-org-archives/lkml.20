Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023140.outbound.protection.outlook.com [52.101.127.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326963264F4;
	Mon, 14 Sep 2026 02:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354252; cv=fail; b=DOJT4cECg0VPWVHdyIFOM7Yf1RtTW2mI4s/h914BJGSlW8elWTNz+cy3izQz5WDf/ezwR2YbHpDQsM1wkys/qLy7XaEL092PmGGDQBww24M1CA2nXGUdsvaVPSSFXD0rjWefoEs1tn8sc7rv3bm4AsfQ1oWnkwGXudCX1HBIwb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354252; c=relaxed/simple;
	bh=R9wu7mrOM933sDl1McOY5FxSPh8chOJ0p3qFLJUOdEE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=maRgjQ1SceRav106fHSu96zLj/jmQevB/QJO4n33w5+m+DTouZvJw9Zd86z6VosYNQ+hJgjt4LsmWzvAW5MqU9cVby1Qh6QyjM5FC8BPh5CT2BKxR0ub5nwQpSEZAdeoyKZ2eeNmHmLMDVrihoYxIOKWlyEqSB+GHN1FdMi86GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=mGeEwJEQ; arc=fail smtp.client-ip=52.101.127.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="mGeEwJEQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqNGTmlG+ht53iYTzyLi3vamFel481oEenwVwYUMmk4NMj7twTuqC2u00GPT7vfKMuZnc04v3jA1YIdChr4fvIHpYLPAtxFbIPt+1cFfwHZ6WVhzHSExFdoIrJ0C3lVQShjq9Bj1NxcdTtKIlMblmIBmJP7hUKOxe+O3v8U7PfupYPHWpXvB8R2Owmt3ibU5tRvVKbHnaf65ijXoe+NYzRKEILZFoihrzhoQgqYdB69hJTKBBPR8kL/fphBUtGN9H2CCPIjSiWNUo9OwYJIRv0VNPySgQDH6qbfzIoGzQPBCAEPdXev+7YQvURUAdzCa1CXoO/sJREzJ0oq1BBS9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wthbtElPX6ZRoIpwYW4vRW0NyaaUsGq4vs71DKi7gZs=;
 b=G+vk2Mdz149e/R9jNwXg0rrcmVpbK5ZSWptqTEouLWKm5YJnB71iyi9E0W1E9Na0c8lHDJa/EimiWYRt/XEc+kEYzFb0I0P8BKQpPQ2lNlKW+h0ywsijnAlSWTevq/bAuBeaGwfTUY7w5tfmh2Qer0AfiI3a2wWM68xZOGryBx6Xt94Y6bPggOQH5Og3T6uLVBNkQuaJKQyRih91EgFFmtC8BBCQJPZqVKpXwI9o251m5zM0NUcuXYriTJcxX8VZ398gAlgjAi2CzQobRt4O8CIOJoJ65U/vu5LVTSc8e+39Nl4via1BEGbeEkB+bHk+TrwqKoQGs70/dOY4Iibyug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wthbtElPX6ZRoIpwYW4vRW0NyaaUsGq4vs71DKi7gZs=;
 b=mGeEwJEQBx3lgHW/zZXKi1YEHGEqi0nK4pJAh1MgAeM3G+sjLGHrJPA5AhwmIexOY+559I579HcQMuSHNqRVtgFz+xwI8iHUn+znGG/qap3hWNGjpqBGpfFmjVirLWV2D9IQA8TzMKGSj22ZrHoRsUcZG+bTOft8oRK/S929XNWgFvPoy/dzULciNBm1U5+AfC4Yr6J5fcYrb08cztFwmBmBh7wX5iibdcnfeu38yQqVcp8tjTA0YTbX+LEH89FbRv2IYz3VNKwx2/VaN54UuxRV+tTyv/qBPiVolvaTJhu4+74+kYLHgZzpQZHS6sbfKSjWgMWtMPUQDK4AUtgFDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by JH0PR03MB8842.apcprd03.prod.outlook.com (2603:1096:990:a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 02:50:47 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 02:50:47 +0000
Message-ID: <b3c0aa20-7e63-4b88-8663-0713d8cc5c47@amlogic.com>
Date: Mon, 14 Sep 2026 10:50:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] dt-bindings: soc: amlogic: Add compatible to
 support more SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
 <20260911-more-socs-to-support-clk_measure-v1-1-940e269aa52f@amlogic.com>
 <20260913-resilient-terrier-of-sympathy-e50c85@quoll>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20260913-resilient-terrier-of-sympathy-e50c85@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::7) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|JH0PR03MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: 6168522d-c394-4484-e0d7-08df120afa29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Z4mAU0pQTJSWmKItw7c/qCbGu9PbbDHMmBq1unsBIoGNs6nmH7T0oqYBiPCfuAKW1PYF6bs7dO0u/E37f4dBTapH9f1G3kau12SrIwmlJ0y9NV8M+n1K69vpYm1yuPHZVNqIecag9mKYF5LHchxA9XV+dIk0OlV/+CX5sWHOake8lLTrIQ93HHm8YcACDNAxyWd7b0QbYnFX3uNcfjpSDln4yl6/SJIwokIg80ZZH5CpoYlQmPlNgAhKQ51wgLxIExVaWkevricWzBhg4WhpN7Kets7uVFrWi1XqxziKuE5Q2S1OQQFfG4ngpRlhNZZrj+y/RmbRap00yVwNHWMi3ZbWNbBwfV2tmKSbAKkcqM6yPcG0gvJqwVTGZr157Mm1Ni1FlGR8BULpWFaXhzn9Lm4Zb00ikyhV34zTZ2S6S/CgxlFk0NgG3A0cNmYQrLSDNBHnCxrxiopNp+SV0GZbblhyze8JW38CmAcvnzflwzJqjWgN6gNbbxreRYZFYadengSSyhZK+KiD996zPaUApVGbgnCERDiJ4utoagg5byZSJXsLG8kD341RGb+AIGZne18c32WyBb/PYhOg5B/VwopDk0N6qH7fC5YEmU1L3DkSxs78VxfoEc9XU/Wz53VFBBR0t/OlbwUMvY6MOPpUyhmjNij2bZfpao3KBcNt6V4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzBSbU8raVoyNG54R0twa3pSZ2QyZjl2THhDb0crY1c3MFM5SnF1dWJrNE9r?=
 =?utf-8?B?Z1kyeFhHZWphaWRMUXp1VFZiZ3hiaXBjZkZVS1hCOFZkT3FVUXNEOStBTVBq?=
 =?utf-8?B?Wjl3cFBxQnhwOGVVdVU4YzFzL2N1MUFQU3cvaWdLYnhmMXdVa01TaUlHTzVx?=
 =?utf-8?B?Slc5VDVmcWt3bEo5V1NQa3RLUEVJRUx1TDl2MUhDeTYzN0NRT0ZobWdDYkM0?=
 =?utf-8?B?RDdpNUZNd3NRUlp3blprcTEzbVkrT3lxUlhHVFc2aFl5NkQ1ak55bUpiTUNt?=
 =?utf-8?B?MDIwakZkZVlnNGNad015RlhVTHV4ZW0rNFdRVFJxL2JsT00xSTB3TnNYalhq?=
 =?utf-8?B?aW1TZndhNmlaZThUbmIrRHJ0YWM4dmU3M3pyL1pWM3ZwU1VWYzUvNkJYNkQ3?=
 =?utf-8?B?VjBlNFZqTTlQU3JlZnk4OElvOUJkc0VqcUlFbEhZU3E0ck1jNTErSjhNZk4y?=
 =?utf-8?B?WW5yaHhlME9lL0QyQlBmVEJoVTFuRkdJZ3huZStJQ0ozcU44eWxiREdWZlhW?=
 =?utf-8?B?SDMvT05kM1ZSWlFqRzNYN2xVVVJ6UnZYVFpORmM5MkZ0Z0YzNkRCMU1Xd3l1?=
 =?utf-8?B?VFlMYUlZRVZMM0ZBbmV2NGIvWWtXTSszV1pOU0VrNnBZVlE1bHpoUG52LzQ0?=
 =?utf-8?B?d3VaRkxKeUR5UzNQeUY4UkpYamRrVGxZRnMvT2hiZFkzcGVvWC9GU0huSzVO?=
 =?utf-8?B?bGt2VUVEeEREc0NrWUZoMnBJdFRraHN6R1JxT0s3R0dIMDF1L3kvZndtbE5Q?=
 =?utf-8?B?dzl3N2dlSHIwL2l4Vi9PdWQ2QU85N29hUXRrVGV6cnZXcTRtY1VldXYwcmE1?=
 =?utf-8?B?OFZwWVZOZnI5bXZkd1FEMjhZS1cvRHFrUzUyRGl5YmdGYnRiUTQ2ZlNMTU13?=
 =?utf-8?B?Y1lVK2NoNW43YlBkWE0rU2F1UEdVVllGU0NCL3ZiNDRSWC9wRVVDWEJmekUz?=
 =?utf-8?B?cnJxOUNueDNub0RxLzFxbFAzVHZDeGZxL0tFNmRtVVNaT3N0aGE1QktILzhy?=
 =?utf-8?B?blhTK1RRcEdNT3BmY1h4blJTMVVZaUY5cHlRNjloV0lORllkcFBFaTRNcUNJ?=
 =?utf-8?B?VmF5dHhlL3dCbWFwc0FzS1FTRUtkVXVwRUxmeUhnZENSZzhHQlBoQlRUUElQ?=
 =?utf-8?B?UFdTRmRLQjdpVDBRbGdEbTdna25WSTZGcWZTRjRHbzkzZFNhTVM0d0ppWDlr?=
 =?utf-8?B?bHl2d0hYN1gxUlBtZzdRRDRNT1E5bmMzU2dFMi9mdURuYUROQUZtWDBMOEZT?=
 =?utf-8?B?ZTBTNDNjOFFGZVVDOElGd0xZRThpdGg2SUgwRlRXQTVSdnVqWUJyTXN4eFdw?=
 =?utf-8?B?L3N0azRCVGFXdGJNb21LQ3BEa2Z1bVh6RllDc0QrNHU0R0kxL2ZLR3dSdGRE?=
 =?utf-8?B?eXU2WXlyanJJZHJDV3NXRVZVV3AxVFlFZzhBY0ZUaXpxSkttTWZLMGZvSWh5?=
 =?utf-8?B?WmQ5ZFhNbzdZRExvQmVqK1NpYWxCSVFEN1YvUDFGZDNOYkttVmdMVHovR2Vp?=
 =?utf-8?B?NG1wMGZQUFZjcGc2UWhrVFpOQTdTb1R6M2tNcWV2VUpNdENVemVLUU8yaDgz?=
 =?utf-8?B?STZ5dzZlT1JVNjMzaVU2cWFPMGxqalY0Uk44Z2hWREVXRGRXVE9MZGZkWDM1?=
 =?utf-8?B?emNqY09xdTl1ZllrLy9EcmorU0xxejliakZ4b2J4MFd2c0pzcDY1Y3lFbnVy?=
 =?utf-8?B?NCtvV290S1dTWVE2anlGSVFlQ3ExVGtvV21DY3RFTFdDOFlUNWFpWG1xQ3BT?=
 =?utf-8?B?aDFoZDNmaUhMNWpRMmhyak56WVNINVgxdXpqUHhiMWJYTFAxSDRUcDZoR1ps?=
 =?utf-8?B?eitmVW8xQmxiSFE2dVdGSXFUdEVxRElraEFSL0J4bG8xSlh1bnN1K0ZyV1RV?=
 =?utf-8?B?dHlOazVxdXREYUdyNnNTcldqc2ViRG93RG5NbCs5WDY0NTJUTVMwKzV4T2k0?=
 =?utf-8?B?c1l4YVNFZ0Y4bkNoTkxyS0NXMDhheXZJZjJNbGRML25zSXliSEoxeHRWdCtK?=
 =?utf-8?B?YmhxejRpdkt0V1J1WW1VMndOcTdBUURSeXY5ZHBUL1BoejVzaWtwWGk2cGxG?=
 =?utf-8?B?YUhhZGlNdG1DL1dnRy9jL0MwOVVmaWtXRWpNQ1lTRHlDWHl4VG1EeVYwdVVX?=
 =?utf-8?B?SzFoSXhrb1dFZG4xYjhrMHFkK0d4NTBzQWtTRkh4YUQ1RTFGK1JuY1VTWW16?=
 =?utf-8?B?RStZVDVXcW1VTk9wUzI2MHE2SEExamNDRElLbnpBb3c5YndLc0QwK004TnFY?=
 =?utf-8?B?enNKb1FGRDVXSy9PRmFqeUJHNlZNWkR0bWZaZ2RIR0paMzI1OFU4ajhMc015?=
 =?utf-8?B?eFh6UGhJQ3BxcSs5TWlDVzZMdzRRZ3FKUDNNOVVyQ2pYRzlKTDBLUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6168522d-c394-4484-e0d7-08df120afa29
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 02:50:46.9452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ocWUBcKJbSyVNpNBDakx18uPSZRsn+976L8C6ev+UpHdqZOgpdDr2vUGYSRhsjHa3dD39aINaT8hbAfO/4F5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8842

Hi Krzysztof,

On 9/13/2026 5:03 PM, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On Fri, Sep 11, 2026 at 04:28:28PM +0800, Chuan Liu wrote:
>> Add clk-measure compatible for amlogic A5, A4, S7, S7D, S6 and A9 SoCs.
>>
>> Although the clk-measure IP itself has little hardware difference across
>> SoCs, the clock inputs connected to the clk-measure block vary between
>> SoCs. Therefore, it is difficult to fall back to the configuration used
>> by previous SoCs.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> ---
>>   .../bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml          | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
>> index b1200e6940ac..125be01e3b2c 100644
>> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
>> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
>> @@ -26,6 +26,12 @@ properties:
>>         - amlogic,s4-clk-measure
>>         - amlogic,a1-clk-measure
>>         - amlogic,t7-clk-measure
>> +      - amlogic,a5-clk-measure
> 
> Why is a5 after a1? Are you all adding here to the end of the list all
> the time?
> 

Thanks for pointing this out. I arrange the newly supported SoCs in the 
order in which they were released. I will reorder the list 
alphabetically in v2.

> Best regards,
> Krzysztof
> 

-- 
Best regards,
Chuan

