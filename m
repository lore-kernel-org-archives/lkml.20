Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013082.outbound.protection.outlook.com [52.103.7.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8417632;
	Sun, 30 Aug 2026 03:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788059749; cv=fail; b=qREz5x/nUaZopwbkSC2e4hD5YSL4cTLeCV1ZUuB0RqzaO5Bv1rQ9MghZmnwnGGe0BbBWav7nFbghHO5lwlnwOQtCOQqsZEsY0SlrMwoim2UpB/gtpplDkBl+U0kv9pe3O3VZkGIlG+RQSf5/MMi6KBVjwW/5LDHEUTpgPsWszJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788059749; c=relaxed/simple;
	bh=RGHZAAR5p+ak429WxT0aQv9tEp+4wxxzfquxAiW55mg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MCBmsKczfmNxfOQ/oFsdDrSau2JxKXKlmB9S4uNABcq34D8B4UzMMO1s6LpNTzoh3WFQTNfOvLwmdNcwIe+wROcc1eUWJECYSb1WqgNNG8IjwXktuda1pBZNNsITHTXwTYvAPJx7qsPh3M0ovZnrB0ym0sQfu1M1pnIgTRTzo5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=KoCYKXK+; arc=fail smtp.client-ip=52.103.7.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="KoCYKXK+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKGevRJsDV9t5DhmQ4OIUXDrSHO9DefY11j1eXPijHfYsfw+DU3MyH2n9voA3HrfFgpIPvQAsavFsfrrHejqlsT60R+24U1jcLm0tKEOkcFrNA1BgZGZhtPrI96OmDbPEWEA4/7gKl0xpLUpFdT25rWmymA9fb6vLFX7ZqtPhYjJLdyKiRWs52qp5a5VCkHq9okpQtZuWoI8gDlSbu0DmsUzlJiYnkAdnetTgF/RG2h2ceGOOLjI6584Wy/z31sXeckPIPzB7vSWtr1f697db43hBpKt7FVHI1cTp+Px1cydoHXZSDUxuE9U28X23Dujj9RbVUTpqkDMaUcAtRGPVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UA3dDMIMDyEwJa0G5yQZ8v1Cq4I4QzZZ1Rh7bBetamA=;
 b=UtEcKsh4XOiZkN66uDlh1uosQCvFkwRKqac7B7WP8qyyDR5/npIbX/NZCDr3mQq5if0pTNVFypt7l7/EXFwBVTr9vJp1OEtqX7ieV1cb30LMNs8fFFg0ezHyvD2wxPd+kdmuRzHA/fA6KUiOq5eLOx4OJEMpbrDEFSOfEtGclBqREcYQJRVG8ZavgHQgvBsDyNNvUq2PRnJJ1ZDzOAKqWLGRKY5GCgSAB9Sf8qQF/ADC39e7lJNedbbC6dTb9Zc0jp+/PUNqDox2tn1NycoBZMyuPFmoRKjpFoQCeBJYenoMqyt7FpnJeqoTLBvaPlpLajNScUWBXpEFlEnNJm3mdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UA3dDMIMDyEwJa0G5yQZ8v1Cq4I4QzZZ1Rh7bBetamA=;
 b=KoCYKXK+BQkgG+euu8YX+eo8kLh9YBgNYnoONe2s9GivhkTKYwlj0t2apCPyoGf7agoOPzYjdPYxHrBUxOkOxodbeNFPde3baFawtBpcOS6RXh8CMgJFjOJGD6JIXUvOZ9BbdaHpDQjhODz8k2H/3hVhUcSTGRi3Dqq2qdHWd05ahWtjSsqr/7ebwNpQtweVjyJA8ZSybsQS9lcBcrICVKLWHiQv5WYx+cssFc8RO4LfNjU/45/k8S/zRGIxTM/joVYdOAKlciKEjrhZjJThm9tfCuE4aSgOgbGWXCTnSG8XzL19Up4QkzBJyzTyLMUVGY4V+X9hYMsh4vfmBfRpwQ==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by BL1PPFCAA20E3D1.namprd19.prod.outlook.com (2603:10b6:20f:fc04::ed2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Sun, 30 Aug
 2026 03:15:45 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 03:15:45 +0000
Message-ID:
 <SN7PR19MB6736A2D20FFD4D62A1F63EC59DAA2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Sun, 30 Aug 2026 07:15:37 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] arm64: dts: qcom: ipq9574: Flatten usb controller
 node
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-9-5c1f3170bbe9@outlook.com>
 <cd5fc80b-e52d-4fda-a831-298f6bd56fea@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <cd5fc80b-e52d-4fda-a831-298f6bd56fea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX0P273CA0004.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::8) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <15508900-2170-40ac-85ac-966a07af3626@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|BL1PPFCAA20E3D1:EE_
X-MS-Office365-Filtering-Correlation-Id: bbdd09b5-e9e0-4524-ea50-08df0644fb00
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|51005399006|15080799012|24021099003|6090799003|23021999003|8060799015|19110799012|37011999003|25010399006|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bE1wTExyV3NiYnRJR1g2eDN4WEZkcENzNWxMaC92Z2JBVEg2a3I1My9jK2V2?=
 =?utf-8?B?WWtFTVErbWZKMWxqTVlEZld1NGFwZ1FIUVZQTExUNG55aCtLYzg4bUo0Qlhh?=
 =?utf-8?B?ZEg2OENPUlhrTlNIZGsydmh1akNkRmpzcHM4QmZqb0NXdkU4N3AvK0JzSmlU?=
 =?utf-8?B?ckVQc3VyN1ZVcG9lY1o1VDZETzRCSGxSSTlUL3gyLytxN0NBRFhwVnNPdFpw?=
 =?utf-8?B?dlZOZ0VKU0ZiNGx4b0dLaEQzb3hCVzBrZFYzVlZMS2tuTERvWHV0bFpmUytR?=
 =?utf-8?B?VXM3Unl3N2JwS0QvOWNwMldlc0theFdOSFlVN2J3M3JWMnZMeldiWVMxQ1Fx?=
 =?utf-8?B?VVBwcTdNVlRhMzIrY0t5N3RvNHVVU0xpUVg0cTYzeDJuVHl3V0w5OERLZDNN?=
 =?utf-8?B?ejF6WWRCdlFWWWF5ekNIaU4zK04rNjAvbWVMbmZrTGNCNVVYWk90NWdLRGEr?=
 =?utf-8?B?cVRSWkFjQUpwVFhQK2NCczlobEdnMGhWb2h1UzNadExTdTgyT3lJbGVMYjVC?=
 =?utf-8?B?bGZJWmc2dGdaclh3MGZhN0ROVnU3Z3lTR2JIK3REZ1BUQzhuejZwUlNIb29H?=
 =?utf-8?B?RktHTWcxNkJ6MFNlblVLcGhlSGlTV2YydjdDakYrK1VWTHNHU1BiaHo5bkho?=
 =?utf-8?B?YzdEbThsNmNCT1ZFdE8xRm5XVEttelR0Q2R4K25oRmxTQjVWQjVhQ3M4OHN0?=
 =?utf-8?B?VEJSNTArbG1xQjg0aGd4cnZHL1Vob00vb0ZlQllBRzJRM2t6NEFCMlB0RE9P?=
 =?utf-8?B?eTVWSkJxNFFaRWpiL1cxYytFeFo2WjNwdjQ2S3VTUjNFNm1qaVZRRVpwL1FE?=
 =?utf-8?B?UDNVaXdkZlpyQU9KVVp4MEVEQkZmRldVcG1qbW12c1dJbHk2MnhLazNpN3JD?=
 =?utf-8?B?ZGdGNmlsTUwwWnhoc1ZvNjZJT0dSR1B0YkdYTzVOd1VzYThmbWlJNjRqcmsx?=
 =?utf-8?B?bGowZThVejl2dHBRYUN4TFh2SXZnU1RpK3ZQYzBiaUJqSWQ4TzlHaHRCYkVp?=
 =?utf-8?B?aDVxWEkwd0FCK2RDbUYxTVdwSkd0Z01wTVlaYi9RYlF2bExXaWw0MlJ4d0pU?=
 =?utf-8?B?c1ZBUndSWGsxY3NUbkRiY1VDNW5FQ0tGN3E3ZVpIeHpFYjlGVjhxdU52Y2lk?=
 =?utf-8?B?RU5mK3ZDS2t4MVVrK2dZRStzTytoMkNOd252NVlwWGVZZ3BJbkpiYWtkWjMw?=
 =?utf-8?B?Zm1kbmp5Q3dIRXo0WURFQnZucmRuMXZzdlplOGYraTlQSzNZMDVQV0RyaUZs?=
 =?utf-8?B?bzZVa1JBWU0xQlBrVFBpaHVCZmg2bzh4dmJKNGxyOElPU1N5dnFBdEdaTzIy?=
 =?utf-8?Q?28E6VAiCEZ+ngj8lmSSzskbY8dcDnh+5hA?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0JpVE5vV0NvYWs2dEZPMVVCbzNvUnZlSXhqQ2wzRUE3aTJpdjl3U21sZHJi?=
 =?utf-8?B?cXAzaUc0bWcvNFpvbzZKNlRaaEJwZ0h6bGdpL1pnbmkra2RMOG9EQzIveWNO?=
 =?utf-8?B?cnJNbmxZYXRBSVVyVWtOOHZUTHlQbEVMbGNsTmtDRDdFMjBKb2FjOTYvQUdt?=
 =?utf-8?B?bnRrMHVBaHB2eHVPNldIV29nSDZYZUhLU00yNEFjd05tQUFrYWV4Tkw4dW9p?=
 =?utf-8?B?Q2cvTnRNUFNVKzFPU1ZKQnJkdDhKVlQvdVgweUdQdENWQ1NLWVdsb1g5OFMy?=
 =?utf-8?B?emVFZk16VkZoZ2g4UHo4N1lsZVpVbHY2SW0rTUxRdnB0cExTQ3VSa1EwNDFr?=
 =?utf-8?B?Y2VPVTlzeWdFa2dBM29FWkMzd1ZRVEtuSndEZkhHcTlUM1VoSG5DQjljekNH?=
 =?utf-8?B?NUxNRmxHT3h6N0w3M3BTRklIMkJibjczNC9oSkxOS3JGK04yNHczK2oyK0p0?=
 =?utf-8?B?dUt2L2tMYTZDNXdpRi8yZjAwbzM5Q1hsd0tBaDVJeFNmVnVtaXZpL1NKUlRR?=
 =?utf-8?B?aSthRHVmam80U1BpaTNjaXlORUhNVm14Z0x6YzBuK0tSQ3hwTEE0dE9zU0Z6?=
 =?utf-8?B?ZDBSM3BONGtoODZaWlJsVW1Mb3Exd0tHbC9VTk5aYjZTOEZMN1ZYSUx1Mnl3?=
 =?utf-8?B?c1VKSlJWS2U3SXhRMXJHeThaTHFoamw5a1BmaWlZeENLd3JiV1QyNEo1Uzh2?=
 =?utf-8?B?bis4bFpCQkRQQkJ1d3FWVytEZStjRXlRWTdnb0U3SllFdkJKRUR2YXV5OFZa?=
 =?utf-8?B?NXhKMStScXBaZ09IQnVJZ3NSY3UyQnhrdUFIMkp5emk3bmIvZ2Zsd0dPNmZW?=
 =?utf-8?B?cGtMSDJSSnVpbmR6dk9hR1M3WlQyQ0hvdFg1WHMwVWRTeVBvSlJSeFl5WUZ1?=
 =?utf-8?B?VS8yT1ZORnlLbHIxbldmTzlvdHJUOGo5aUttQWE3TlBsMzF3bC9vYS9GVGlX?=
 =?utf-8?B?YjUvd2ltNVJORjFDMzBIcnRDbjA4Q2E0Sk5wK0dtQWFQYlpSY0xPVGJTaW9a?=
 =?utf-8?B?ZjVxa1FEQSsrMS9aRTlZbFV1blBxbGpWLzlFaXAzYTJZdjJOYUcvSDJmajlC?=
 =?utf-8?B?aGgzWjh6M2ZrK2l5RTd0NjhkRHdUZ2YvWjVoMi9UblVtWklpMHJxbCtCZkND?=
 =?utf-8?B?R05Pb3dpak5jd2d0V1pvbFZhNGZhNUdyWUdNaVNPY1gvYzZ4TmxyRUNGTDJw?=
 =?utf-8?B?VTNHeGxhSzVmZWRPYldGY2J2SEwwTFk0Qy91bGVYMDkxSUZ4SEdmSFpnNDhr?=
 =?utf-8?B?TGs2alVhVnhyczJWTVU3SXQrUkV3aTJZQ1lXendqWlNURXp2ZUJaNVlQREZN?=
 =?utf-8?B?aDViRmd2eTRhb3c2VSszUlRzLzNjU3M3Mm1uNmRTQWlKZWJPNFFSd2hZb2RB?=
 =?utf-8?B?RDBrVU9LNTNiaDk2RkI5MDhZV0kwcUdIYmlpanFEZU11TFpFN2Zqb3oyWHRH?=
 =?utf-8?B?T1ZMQUowYVJvTTM1SlJaeGx2eld4d1crNitHKzMxNld3TWpXa0p2WjBIdnRN?=
 =?utf-8?B?d0NKMmMxSWducVJ1NDZNWTdTdlgvUm9GTVh2WFJ3QVorU1JRQ2VpNWxUUTB2?=
 =?utf-8?B?dHUxNmJCUWhoTXoxOUZFSlRzbjBRclpySmNDZm83TTRjS3RSN0RHbEZyYkhi?=
 =?utf-8?B?WTlHd09iV2VMakdqbi9WUGErVFp1M2dzcXRldEM0RER0WUZvdlpnQm1HanpP?=
 =?utf-8?B?WFhPdjZGT2VkQndHb2JJczVKR3phTXgrak5ZWHFtWG1XVEk0Si9QV2JlRFhP?=
 =?utf-8?B?NGdHVmNjNWZ5TmVuS3lpTDh3OW5WMmNsUlY1bWxveGRkejhUTzhyL2x3aERL?=
 =?utf-8?B?cjZGdmI3L2FXUEE2M2daSkdqUmJYYzh2RlZ6dUVjNU1rc01pVUhpWkNxM1dN?=
 =?utf-8?B?RTl4K0NlcThFUlZJOHhNbm0wL2lVT09KNThHZzhaQzlTL0E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdd09b5-e9e0-4524-ea50-08df0644fb00
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 03:15:45.4337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFCAA20E3D1

On 8/29/26 20:44, Krishna Kurapati wrote:
> 
> 
> On 8/25/2026 4:12 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Flatten usb controller nodes and update to using latest bindings and
>> flattened driver approach.
>>
>> Add property to the USB node to select UTMI as reference clock for the
>> DWC3 core to calculate the right values for the period and frame length
>> adjustment.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> 
> [...]
> 
>> @@ -780,32 +777,31 @@ usb3: usb@8af8800 {
>>               assigned-clock-rates = <200000000>,
>>                              <24000000>;
>>   -            interrupts-extended = <&intc GIC_SPI 134
>> IRQ_TYPE_LEVEL_HIGH>,
>> +            interrupts-extended = <&intc GIC_SPI 140
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                          <&intc GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>>                             <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
>>                             <&intc GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
>>                             <&intc GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
>> -            interrupt-names = "pwr_event",
>> +            interrupt-names = "dwc_usb3",
>> +                      "pwr_event",
>>                         "qusb2_phy",
>>                         "dm_hs_phy_irq",
>>                         "dp_hs_phy_irq";
>>   
> 
> You are adding pwr_event irq here. So please mention that in commit
> message. Or would be better if you can send this interrupt addition as a
> separate patch.

I think you may have misread, I'm not adding the pwr_event irq. It was
already there. I'm simply moving up the dwc_usb3 irq from the dwc node.

> 
> Regards,
> Krishna,

Best regards,
George
