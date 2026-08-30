Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazolkn19012052.outbound.protection.outlook.com [52.103.20.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F12D26ED40;
	Sun, 30 Aug 2026 03:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788059551; cv=fail; b=UMhPmpcI2ABgzVC+aVDXi80/am/KDoaYiaaK5/KdLNnLidt63rkZr072qtBD6b1J7ocQw7rPf06dXBzAIUZ/EV+W6rBXoy0sTlpKK9IE+HKXkJtHCxnbQhmcq0tmCmKf+OQu8KNaLCK6vpeCq2Lf3kbSYfYK40nthHoqp9z8mHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788059551; c=relaxed/simple;
	bh=7ESd86pAzP3kxxxxWEM3jEoPJ0s8OIX5olmzqldIzKQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ShgcaUn6RZ0bwQyPsqTNy0tUAWDVpINR73RDNbd3/vcROP/WF0bLiYPADaZ9fEBrYV4xZthOC0y0OAZrLCDKsOQctUJtFYKxp/UdQZrZ1gwkr/co5bskNXwfK8rQIJlNQGV/mXlb0P9pXCpmvjfQhQ32WI9Z4rzLxEZS0EVhDb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=tem003cT; arc=fail smtp.client-ip=52.103.20.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="tem003cT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUbbvE47z+C/Ql1496UyqDISr7JtXjK7YicZZdRo0v/04vUmWigGv+68uet6XSz8noWRAO3XT7Y99nOQ6cGwgrQFxnbfvD9TUBf7AvPsrqahdp2yEH+lGV1nhr0PIenVQoNhNneht2lXMldnX1iHaL8FcbCx/xavlz84AlnDpGEpRhUp8CLbjuVUS5sSe/wLvEt4m5OfjR6TGORt7KyqHCVUR/hwTziEgF20AJEwDnmIB2OIflWTFKnf3xrdtpZ4Rfn7PSq2qZ0V5DEnItbhnhjzH0CS60frqmCZwE4+X33vlrPnF2RhxbD5qhkNNjGStzClNubUlAkHEazWrBfUSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVp8U7WuiIFuaBezo2ifBJZiGXx1uwesgPNL07DhKZg=;
 b=ZyO4n7bZ9Bq3G+fgt3gC8yQiHGPGpAO/kIbxUherkQOo5QyTkeFXFkNjZyAKx0mdFrpDyZZZZxbuPmwnnRLqAVY9bHyGQJnA4FF7S8Oe3HkTyf0pYE+HBCqNYe8foRBuAgnynMspFSxgzzK2LzOt/7aKI+ywrjYR11HuUSpqHioMVCYzexXvoFrBxYmQb4QCNnuhN5/2NIUCh1nJA/jzqzz74u0rBMV0dM5TY/Aew25iw76L3YD4fajlXOYka9SrDgQv1/bXgiwiFvrMZ6vuVEQEOx+QcvekHc8rZw7pDyM4Jh6ae40LR5LfgzcSiwm3y4dKgZcJLAujPOGvKgcxJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVp8U7WuiIFuaBezo2ifBJZiGXx1uwesgPNL07DhKZg=;
 b=tem003cTVrYjMV8ZBgn9wYZs/TgpwgK/JVVjF0Ob6d57Cf6+T9smwSHd2EdeIZFYQSHwTmlFkl9T/CFKXgvMzgoHkLow6ToXDruMDTxKQofO1NEitCyNENzSBAVQlpxNYSwvLNQaEPivsGc7Ou6FPCnzded8Ky97OW9zgopme20+55M6u38tC8BAVlFSoIfS4jK93nMoq6kKWeNHw8dZyZv9wEM9M5EM+rgyXh5nS5v7dQSJ81rmKmoAqGrP7UxkUXKoDqQGWdD19wGpGE8maM3ptV/JNMNTXvemObR1Z8LiH0yLv4EdoAYvU7ToF5VNUGIkq/QCOYZQbxwbpWtcMQ==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by CH3PR19MB8237.namprd19.prod.outlook.com (2603:10b6:610:195::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sun, 30 Aug
 2026 03:12:27 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 03:12:27 +0000
Message-ID:
 <SN7PR19MB67361579E71DBC197E21F44E9DAA2@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Sun, 30 Aug 2026 07:12:19 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] arm64: dts: qcom: ipq6018: Flatten usb controller
 nodes
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
 <20260825-ipq-flatten-usb-v1-7-5c1f3170bbe9@outlook.com>
 <bfb0d840-fc9c-41a2-9b05-959f2222a298@oss.qualcomm.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <bfb0d840-fc9c-41a2-9b05-959f2222a298@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DX0P273CA0008.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:26::12) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <8f06320c-ac75-4204-906f-c4ada1efcedb@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|CH3PR19MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fe885d2-f719-41e6-2a21-08df064484b7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|37011999003|19110799012|8060799015|51005399006|15080799012|24021099003|6090799003|5072599009|25010399006|40105399003|2607281247196008|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1hEOEtVMGs0WWhPN3kzQkVBald5Z29mVkk2L1ErSmJ4RzFiNEFNcmJSb3Zm?=
 =?utf-8?B?UjIyOUxwbEZVamNQa3c0SW5HRS9neVpVSzAzQnBNcmdZd1pIbStkTC91a09H?=
 =?utf-8?B?a0paSUxNbXZ1ODRLdERuaDU4bndERDNnY0xHZE1na2doV3Z2MWFJN2FsRm95?=
 =?utf-8?B?OSt0ZDdVTXF3R1NOTzBJMWVzeFNWcGcyU0tMME0rb25nbW9oQzBLcGNvK1J4?=
 =?utf-8?B?MXB4M0wvZ2VVeXFMS0hIbTRaZWJ2MmNUT3p2MG8zOFZSRmpNcVEwRjhIdXA5?=
 =?utf-8?B?RXpyZ0RLdnFlSThjamptTUQzR2NwNDRNamo2c1hGMzc4cm4zRU0wZnJnZlor?=
 =?utf-8?B?NDdXeHRvdndiSC92V0Rub0puYkdLeUZDL0QyUUxoRGtXRzdxb3VxeDdvS1o4?=
 =?utf-8?B?Z2c4cXpqcVY5SzhuRGVDRXpUVTdKS0E0UkdMMDNVZHRNU2xNL1d6MUxZVXNl?=
 =?utf-8?B?dUFRT3I0ZHlmMXFsK2pTSVVRZkJnYlFlVEtCeitnRWxlNy85clFRTkF5SXBQ?=
 =?utf-8?B?TjhmRUVMYzhHdlRhaHlyODcyTjcwQndqUDZmSnJVaTkwZ2JPRWErdGJuNVQv?=
 =?utf-8?B?RTkvdDNtZ3FUMmR0Rm01cUJiS3E1Ry80ejFITzI5OGxiS3RRN05VVENOQ3ln?=
 =?utf-8?B?MktZNEx0QnJpNEM5RzhmaEYvMnNRSFhkYjZFQ1Y0UUM2cWVoSGhVUFBVbnk1?=
 =?utf-8?B?TXQ4czc1Yzh4TVIzYVVVZnhFRThGTzlFWmx0dnphZkxseGczMjlqdGkrZVpY?=
 =?utf-8?B?YWpGOVlQem1qTEJ1Qi9XcXFBUWYzUURBQXg1Q09xSlVLRU96TnhzOHpXRnVa?=
 =?utf-8?B?N2p0ZGtub0pZdTBKWnM4Q01lQ1NaN3ZTMjVXeUo1Q0wwMkEycGxjUXRremZl?=
 =?utf-8?B?MVVVRXgxcnBBUm15Sk9SS1BxSDJBUmt4WllZYndWZm1YaUVwV3RpQk5YUlpE?=
 =?utf-8?B?Q3IrWW1LRnFvOVY1NmpEYm9PSFdDTzB4KzlVUWJEeWI1RzlXQWF4enRIVTRa?=
 =?utf-8?B?bUlzOVZPMk42aUFWMUEvZGc4dSswenhjVVNMb0FxSC9PZkNZbkVEWUQxRVdr?=
 =?utf-8?B?eWpGRTlSU3dXYjF1K1VPOWlGbytWOWFUeEdEUkRUd1k3ZkVnejhKQUZLV1Bw?=
 =?utf-8?B?b0ZGNXhyQUYyaWZmMTUvTDV6Z09OWXZOQ1FCeWZNbTA0Mnh1ZFVaK2ppb3ho?=
 =?utf-8?B?UHlzdTRaSHI1RFA0aXVQbmF5c2RpTmNhQ0cwb3BtYmZvRGtOdHN0WlU0em44?=
 =?utf-8?B?V1Nvbkpna1RDZTV2Q2tQaEhyczBlZklZSWxKOW1CdTBicFRaallPVEpjVkIx?=
 =?utf-8?Q?K2L2td9S3KzdqVOXh0jO/cZXFGvEZHo83D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3liZWs5cTBBQVpGRlZXOHBvaUVFek16UWJxY2gyaThJRkkvYm5rbG1uZ3A3?=
 =?utf-8?B?SWVzWmtTd29LR0gzZ2pnblkxMjZlTXFveWZ4Tkp6TFJoNVNYNmszYW5zK0o0?=
 =?utf-8?B?a1ZINXU3ZlQyRFJkc2lFNWFTS2tDU2xCRUM1RHQxODFkbUdhdnlCaHpZMjlM?=
 =?utf-8?B?ZUhMWDY1eXdVZDlBOE8xa05aYk93ZUdvZXBMSmNZRnBuWFE3anJXMUFBMXFH?=
 =?utf-8?B?WUJ4WnpYUHFDd2o3ZU5FSTRhdU11UFdndU4yaGxUVWVYdFA4NUN4UXdUYnZF?=
 =?utf-8?B?TnRTZzBCYW1NTlJod0w2VXFtVGorTDQrR241LzBYVW1iMno0c0d4eXRNblNS?=
 =?utf-8?B?OUR6UU5HSGtJSXg3cDZXRzVxNHFVRmlZSDhBUHZsN1l1T2dLLzNFc0FHOGF0?=
 =?utf-8?B?clpXMVlSa2xwcGQ3REFtQ2RhQU11Mmttb09OYjhVaFdpb255QmxOblRPZ2Vz?=
 =?utf-8?B?Q1NNZ3NQU1JkUUhtSTk1Q0NrRlNoaFQwb3EzWXJGbXdoN0VVM2FBd2J2S3Nt?=
 =?utf-8?B?djJValIyVk9Fakd3M2FmWEVEWU1SWDgzZ29aVUhBTk1rMm1sb2FpakJwTHcz?=
 =?utf-8?B?WXNKTTYrcE53MmtMT1NlWnhOTDQ2SXRFRHczeVBWb1NHYkJBeEtPLzhlNURq?=
 =?utf-8?B?RXZTK3o4Q3ZrSEo3RFI1MHJ1SlU4ZmZzZHhUMDk4QmFBa3pvQkprLytJWGM4?=
 =?utf-8?B?QkFCVm1saENQZ2twbGtTeUNINXBvSTh6VG5YSDlpN0IxUEc2eFRZRkFsaE1r?=
 =?utf-8?B?cmVlRzQ2OVZ4YWRxK09UR1RUQ1dwWm1RbzVaUnNCc08wTFZLaE5qNHJRTUI0?=
 =?utf-8?B?bVlnNUJ5d0w2VTUwRHhRMTVmWVdOempGalV0T3FqWWhZUDZYeEtaOTFsbXBi?=
 =?utf-8?B?Tkhqai83aG1HYXF4ckJVeWVGdThjUy8ycHQ4bCtSUVJHdjAyOUdsbmVXdUhz?=
 =?utf-8?B?NmhERkZJRDU5VzIySVdDYlI5blRFRmNXZXBma0FGVzMreE81eDAwUFRINnhY?=
 =?utf-8?B?VWc3VDRaZ3VJUGNCOXllNlZNckszbU5Zb2k5WXBjMTJwbHdHTXYyMnhiUno2?=
 =?utf-8?B?aHBLYzZ5L21ySFk0S1VTL1NadXIvMk0rQXpwWlRLVnJDRmpJaDJrbUVHWnV6?=
 =?utf-8?B?R2VtZVpMcER2bTNyL1daeHlHYlA3ZGF6Z0lhZVY4Y01HbHdZWkVtekdVNTlr?=
 =?utf-8?B?Y05oNEswVUYxZHZUV3lOVXdGVzg4dFFuZDgyMERHNnZxZ1pDWmJ2NGlqb3k0?=
 =?utf-8?B?dVg5a2RzWitia2cydjhjMVVxcVFwdFY5Nmd5Nnl5eG1WNkd4QnMxeUFMdEll?=
 =?utf-8?B?bXZjeTdtcURzbWpTQ3ZmRWVab2ZnbG15aVYxWG5SYXo1RTFjNFJHc0pHZ3Ix?=
 =?utf-8?B?QUdVTysrdDNaQVdpbkFwWHB1bHlpazFrc1dCVitwc21OODgySVNVWkJkT1g1?=
 =?utf-8?B?Ymx5OWYrYlFXSXRicWxVZ1JlSGIxY2J3MkdwMlN6ZW1yQjFTczJTc1JRc0cy?=
 =?utf-8?B?cloxNVFrSGxnd3JId0gvRXlqa2IvNTg4anNmOFpNakRyL2xDQTVWODJqOHZh?=
 =?utf-8?B?SnZoQlZyTVNQNXcwc2xCTzQwSXhReStTalphakN4aW5yaGpUT1FYM1p2eXZn?=
 =?utf-8?B?cXdMdi9RQVVPMzViQ0tFSnNYSDBtM21hMExqVHk5d3RsVzZ2K1BYdVdyOTF6?=
 =?utf-8?B?bXNWYnNGamhVWWZEUWJTV0hOeWNTSW1wWm9aOW9kVk1vN0luOWpCeitDMlR1?=
 =?utf-8?B?UllRYTM3NzNKbmZLNkp5NnpoRzZscmUwaVRoN3k3cXNoZC9FNWVCZnlkckpX?=
 =?utf-8?B?WTdWQjdWK29xS01ES0Q5dWsxUE5CRHV5ZXBCNk9zcUM3NHBBMkVhRkNGeXVY?=
 =?utf-8?B?K0IwbmwyWTRUbXM4b3dsMGNHQjMrdlB0NlZEcnRqTzJtYUE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fe885d2-f719-41e6-2a21-08df064484b7
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 03:12:26.8418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8237

On 8/29/26 20:48, Krishna Kurapati wrote:
> 
> 
> On 8/25/2026 4:12 PM, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> Flatten usb controller nodes and update to using latest bindings and
>> flattened driver approach.
>>
>> This SoC has two USB controllers of which the USB3 node had a ref clock
>> populated in the DWC3 child node. Add property to the USB3 node only to
>> select UTMI as reference clock for the DWC3 core to calculate the right
>> values for the period and frame length adjustment.
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> 
> [...]
> 
>>   -            interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>> +            interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>>                        <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
>> -            interrupt-names = "pwr_event",
>> +            interrupt-names = "dwc_usb3",
>> +                      "pwr_event",
>>                         "qusb2_phy";
>>   
> 
> You are adding pwr_event irq here. Do mention that in the commit message
> or send this particular interrupt addition as a separate patch.

I think you may have misread, I'm not adding the pwr_event irq. It was
already there. I'm simply moving up the dwc_usb3 irq from the dwc node.

> 
>>               resets = <&gcc GCC_USB1_BCR>;
>> -            status = "disabled";
>>   -            dwc_1: usb@7000000 {
>> -                compatible = "snps,dwc3";
>> -                reg = <0x0 0x07000000 0x0 0xcd00>;
>> -                interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
>> -                phys = <&qusb_phy_1>;
>> -                phy-names = "usb2-phy";
>> -                tx-fifo-resize;
>> -                snps,is-utmi-l1-suspend;
>> -                snps,hird-threshold = /bits/ 8 <0x0>;
>> -                snps,dis_u2_susphy_quirk;
>> -                snps,dis_u3_susphy_quirk;
>> -                dr_mode = "host";
>> -            };
>> +            phys = <&qusb_phy_1>;
>> +            phy-names = "usb2-phy";
>> +
>> +            tx-fifo-resize;
>> +            snps,is-utmi-l1-suspend;
>> +            snps,hird-threshold = /bits/ 8 <0x0>;
>> +            snps,dis_u2_susphy_quirk;
>> +            snps,dis_u3_susphy_quirk;
>> +            dr_mode = "host";
>> +
> 
> If this is HS only, do we need to add "qcom,select-utmi-as-pipe-clk" ?

No, I've not removed it, I've flattened the node as is.

> 
> [...]
> 
>> +        usb3: usb@8a00000 {
>> +            compatible = "qcom,ipq6018-dwc3", "qcom,snps-dwc3";
>> +            reg = <0x0 0x08a00000 0x0 0xfc100>;
>>                 clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
>> -                <&gcc GCC_USB0_MASTER_CLK>,
>> -                <&gcc GCC_USB0_SLEEP_CLK>,
>> -                <&gcc GCC_USB0_MOCK_UTMI_CLK>;
>> +                 <&gcc GCC_USB0_MASTER_CLK>,
>> +                 <&gcc GCC_USB0_SLEEP_CLK>,
>> +                 <&gcc GCC_USB0_MOCK_UTMI_CLK>;
>>               clock-names = "cfg_noc",
>> -                "core",
>> -                "sleep",
>> -                "mock_utmi";
>> +                      "core",
>> +                      "sleep",
>> +                      "mock_utmi";
>>                 assigned-clocks = <&gcc GCC_SYS_NOC_USB0_AXI_CLK>,
>>                         <&gcc GCC_USB0_MASTER_CLK>,
>> @@ -692,32 +686,31 @@ usb3: usb@8af8800 {
>>                              <133330000>,
>>                              <24000000>;
>>   -            interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>> +            interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
>> +                     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
>>                        <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
>>                        <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
>> -            interrupt-names = "pwr_event",
>> +            interrupt-names = "dwc_usb3",
>> +                      "pwr_event",
>>                         "qusb2_phy",
>>                         "ss_phy_irq";
> 
> Same comment as above.

Same reply as above.
> 
>>                 resets = <&gcc GCC_USB0_BCR>;
>> -            status = "disabled";
>>   -            dwc_0: usb@8a00000 {
>> -                compatible = "snps,dwc3";
>> -                reg = <0x0 0x08a00000 0x0 0xcd00>;
>> -                interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
>> -                phys = <&qusb_phy_0>, <&ssphy_0>;
>> -                phy-names = "usb2-phy", "usb3-phy";
>> -                clocks = <&xo>;
>> -                clock-names = "ref";
>> -                tx-fifo-resize;
>> -                snps,parkmode-disable-ss-quirk;
>> -                snps,is-utmi-l1-suspend;
>> -                snps,hird-threshold = /bits/ 8 <0x0>;
>> -                snps,dis_u2_susphy_quirk;
>> -                snps,dis_u3_susphy_quirk;
>> -                dr_mode = "host";
>> -            };
>> +            phys = <&qusb_phy_0>, <&ssphy_0>;
>> +            phy-names = "usb2-phy", "usb3-phy";
>> +
>> +            qcom,select-utmi-as-ref-clk;
>> +
>> +            tx-fifo-resize;
>> +            snps,parkmode-disable-ss-quirk;
>> +            snps,is-utmi-l1-suspend;
>> +            snps,hird-threshold = /bits/ 8 <0x0>;
>> +            snps,dis_u2_susphy_quirk;
>> +            snps,dis_u3_susphy_quirk;
>> +            dr_mode = "host";
> 
> This controller is DRD capable. Please move this dr_mode property to DTS
> file.

dr_mode was already there. Removing may break existing implementations
and should require a separate patch.

> 
> Regards,
> Krishna,

