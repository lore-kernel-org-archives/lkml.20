Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793791413;
	b=wnExVtheBdt383RvtylfiREnFici8e3KHhtYnxD/g1fr7+3l8uAX8CNVwMB1jhfxzxSb
	 DGkmm2BOl2UYA2kpvtQlU6D+q+O2ZIFDdfI1uWqVttYhcrJe0e2PB4cvSLm1oaVrZKi+o
	 HYi86C9GkhA0yY1o8jPDZHiry59xppqM76MAFUhhMKGjdgTgbQIInebvGeiqb46SAThRH
	 DZdhUDAsnpgnrId1a5CLOh3DS5hXd+gxGVwihGZU0JKmGIFEdwKsb23bm6aB6NC3/mvoG
	 voXy9rHhG67T3O17JCU7PjedUwnk9/CO53MFflbB8TepGSHoUCmovbxmi3j5fraJNWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793791413;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
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
	bh=vWE1Eh9TxUyVkYS1aTv47WVgxeHnZ5Mnm3RbYeH4RC0=;
	b=Rva13V77G1p54QBeA2UmP2fdntfZOcMIAtSZFaB2bVpN2nkqbXYFiA3LFgILTZHW2qff
	 9k5u9vKvceB0H3cVO3LaToZZg4ZBivRP0W99wXdMQAHStG1xds/FofcrMdotV6qKgbMic
	 HtjaNfRZ9Rv+xeECtK9IwpreVhRed92rd7uUlWuUqcZOM1VgF8HuqttuxDIlfmmS1GnFz
	 rxaqkni2e0SwzgEuLpcqIxvT7k5l/o2MW2GV57mNiVq1suNs6b9HWv+AW+44A80kBeBeb
	 1dJ9SK9flmkbiQuLUTQHOS2J64sYrwVRCZfBVBI3X8efjCJcw8qv+UrjWSV+5w/Vzhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3bte7uug;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.4
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010004.outbound.protection.outlook.com [40.93.198.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6B1606A332;
	Wed,  4 Nov 2026 11:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A6B1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=3bte7uug
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSUFLRsnkwyIK8k+89TlsybnaM7l8iIKhwnLLHyd2wuJ58IouORXAUhc3d+nmFG5hTIwnPbxNObpdLFKtB2Qdzl6EkOruwdjTXhDsJ//O+p2t8w5tgh2HcuUrPJsmo1AAyUgAAcLzHocwm5kKmEu/B6FaaRcgX4fEdDzahG1RUIYCzassesn/Apw6WpAp8GEbdvIZzKtojDoyfBTBiPRSAcKCBi9SM8PW3k84rpXfuahmg4FkQgxaRxzFSKHCH0GqotkUWbt6dCB99Bw4Bq8P1AX+3vnbzr4ntTR8EHRdQZqwUh66LWNI46K07nCQc/kNJ74c24qqNBL86SsAYUsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWE1Eh9TxUyVkYS1aTv47WVgxeHnZ5Mnm3RbYeH4RC0=;
 b=ANypNmeTQmJh81uUvnpVkiryuGXe8uMD2fv7N14PIJbgwJs7yRnP+XlYQxA6lQP3azL1pj01ZWcUneH0OH/cxl+lyfKyAraP5+kwyolb9X8A+yon6fm3rGW8eucLj/6CuzrCilcg7S0+o+F46d1sV04SJ1d6B34ojbwvqlAyjMypinf3l9//ofYwgxy2f3DpPl/DXDKxZysEJLM9ikG3KCvE/ia2fMuao8cXC+3o9MPq5wOewqDp/DWSghTLEyjDF/Tz9IuQlnTe8y2wBjnQjqNZMFPOsNahFnZScuqkdE1MoHV4smtYOyCqqchP7Wh6U82dAdN1obqd/x6IV7lgKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWE1Eh9TxUyVkYS1aTv47WVgxeHnZ5Mnm3RbYeH4RC0=;
 b=3bte7uuga4A0FIkjALGiuFmoNyodtzkjXzCFxLYqwpiKtyP8Lw+VOkbxxyYAVkSMuCRokeChLjOmnCSQPOWZW2IFzP2piCCahDJn87nlLtV+f2FPircQ7Sill1Czjf3j5pXtLU43UJ+L7d7vk7EddiYGn6gMzClWTb9mgjS7USQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by LV2PR12MB378049.namprd12.prod.outlook.com (2603:10b6:404:302::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 11:23:30 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 11:23:30 +0000
Message-ID: <59fb3819-a608-4ec8-b092-5df5234864bf@amd.com>
Date: Wed, 4 Nov 2026 12:23:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: dts: xilinx: parallella: Enable QSPI and NOR flash
To: Aleksander Jan Bajkowski <olek2@wp.pl>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260917225317.319745-1-olek2@wp.pl>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260917225317.319745-1-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|LV2PR12MB378049:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c6d2f8-2718-44ab-ad54-08df3a660dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|18002099003|22082099003|261009223027099003|261021121427099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+wsmm1JrAi9NCYlKadWUNJtsHufPevudshM8Gm3nep9Qj/OyfMkF9ITceYUzncDeifJpLPlWu70lypySxTv6n5C52lkGC9mz3mS+CEWHIMO6H2d5PRzEA0wH1ipx/AlJevMMC2Xkr4eYBMbPsfm3JAd6L5g9pZebB8GAGh54FW/01DLVNAVD62je5X2k2F1OaESM5Z9NL85VLwbq9JQRlduJvIqoFDi+ocPqLI2g6iIrJbOXlEoMf/Fnzq1x8MyIMwvwGLRm0nU0GPV5XdW0aWKiITi++AJ/DhbaEIZAxfj6wlaBAILcEGH5QUOwGZnNjJPF9LgQfNRjjxMCvp5DO81O0SsrE5DHkqXaj2fQO1bRE1AftYrxEDVrMc3A0Zdc6JRWQS1OgYBJjWI7zi67L82NA96VIdUGydySFkzyZyrhL4jtZ/jK5/OUWuLjwMbDULUt/H4x7tp0Yq4o46346fmBedwSsW5LwfZMNUBMjoJjqmFG2LzrRUXAi7D/BiQdFe3HGRoAMwNQ2vU2P1ahGVgSKBkDLZVevdoOHcHLjbkzvb1ZFpWmQof/gR5TexCJgg1FxHzUjV4OsmCvHf6AEtuDUdDrDBZanZzwND3o4VBpA2kbDuGnRkToN5duRn/R9qBxXclGL1NBQSWaG1ev0anfX72V4Jojt4PXdWepW2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(261009223027099003)(261021121427099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1puZVhCSUlac2pBSDM1ZG1Fd2ZET29RUURmWGoxdHIydDNxNXQwMURFL1dG?=
 =?utf-8?B?SGswK0pHZnFhb2VjRjgrRENuWGZNd0IwOGRQb28vWTNjcDJMblZ4M1BYZEJm?=
 =?utf-8?B?dHRkcW16dmlWbCt2RUt4N1VLanZPUzE4aWRFd1R6UnlNUjRUcm13ZmY2aSs1?=
 =?utf-8?B?eWpMQ3dKRGhjZEsyZlVEdVEvRHgvSWJkS2JYSitKaGk3VzkyejIrV2ZqTldz?=
 =?utf-8?B?UHJrY0RHMFkyVjE2dUdlZVpaM0F1QU05cmU0SURRYTd5Q0xkelMwTURsbEYz?=
 =?utf-8?B?U2l5eEpKUVp4RzNlNmlkOFU5ZDlWd29vRzZiSldNa25NelIyVVZlYXVDZE5w?=
 =?utf-8?B?ZW5yS05xbGFhemgwb3dBRXdBYXMzY0p1akk4UmlVYUxIdmZ3YjBZcTRlZVEr?=
 =?utf-8?B?Rm9BSDhkcTVlbUdBeU9BMllFUzV3ZHpvRDVjTmgxSFNpbU5ZRzNLOUN4bDRX?=
 =?utf-8?B?ZStxbTdpY296OVJxVlN5Mkh4L1VJbHdsL2RVVkpqUTkwNTJXZjJKTzhEcXpK?=
 =?utf-8?B?OEduRDJCK2JNR3Q2RHdGR2FKelNkekV6ZTJyMXpUQm53OVJ2UGVhMEpBYmFt?=
 =?utf-8?B?TTBRcmNKb3JSN29LZW9VVG03dlRxVkk3M0tjYmpPSHMyelZrdmNrQWhIa014?=
 =?utf-8?B?SVBzZmJLMldNZHdpSXRSbW1WeVN3NDRDQzE4OGg1M2o2M0FpeDM4MXA2STB2?=
 =?utf-8?B?dkszUjNDTEJ3RHBodlEvRk10dU90c29aTkl0ZmZQeHBPZS9QY1FPYVZTM05p?=
 =?utf-8?B?L3RGcnZOVzdMNHl4WVBUMFJnQk5rVjNMSjd2amtJaE1rbHc5NW90QjlVR0ZX?=
 =?utf-8?B?Qks0cWtSTlkzRWhObmJQSzNndDg5TXQzNFBMejBpZWxnR3h1L2FjaHRENExK?=
 =?utf-8?B?alJlbXdpdUJ0aWxOTUtwenpRWllwc1pwRDRSWXdlK2hSQi9Zc29VaG1DekF6?=
 =?utf-8?B?eWlsRTNOeWNYYXQ4VVdIZEprcUlBL3JWQkZrQ3NDdUhWUGpwOGhOYlZnc1Nr?=
 =?utf-8?B?YUpVSVVpTkR2WlhqcEtZTDJ1emdsMnFqRXVXUlByaWhsQ29iazJMdjhiYStL?=
 =?utf-8?B?K1RPUC9IRVJMc3p3ZDNiWk5hSmJCcFMxZ05QZEEyK0QzUnZNOXg4SDY2UWVp?=
 =?utf-8?B?eEhkSGxzd2tManRLZ3VDOFpTWmlHWVZlUnJ5NllCeWpiWGs2eVJsMHhhaXhS?=
 =?utf-8?B?a0JQczFzeldHd3RwWjRlMXE1VGExQm12cjZIM2NNQmNBb0pBL2F2YlR1bE9r?=
 =?utf-8?B?cXJhbnF4dnJMa2dvc2lxMldpMVRxNlMxL1Bjb2QvdjRGc3VBY3RLRU9wczY2?=
 =?utf-8?B?R0JNdm95dTMrOUVOcEw4TGdXcVVMa2plZXFoT2tIcHFZNm95aElBclNYMSsr?=
 =?utf-8?B?ZDJ4ZjducU1mMFhVL1dycGdBTU1mdnY4bVFwU3FxRVlNUG9od2JvZ1BjTVUy?=
 =?utf-8?B?bFd5ZDE1Q2xJOVpzc25Qc0h3UUpOZzlhYVo1RkRFOFp3cHVCTnJCR2taZjBa?=
 =?utf-8?B?KzhuVXBPSGozRy9CT21lY1FESlgwWmtkUEFvTDk2WjlxRG5wb0ZoSmVFQ1o4?=
 =?utf-8?B?OVFNMnhJLzJTVTU5WndQc0lPNFQ0em1DanFpbEZEdjV1NEJCbC94NGw1WTAz?=
 =?utf-8?B?bElYdXlSTHFSY3BHWjNMTmlVZ0JZZ3A3L1c0K0dSWXdiMGlxWGdzZTk2Y0hG?=
 =?utf-8?B?cVpydFV1WTRxVlY3RjZ4Qi8vMjFsODN2TkhiZTMvS1Vueml4ZTNwcWRnNi9C?=
 =?utf-8?B?MFV2dDJySEJqTnltdFJSdnhYdXRLZndGcmYwT0crOWloQzQzMDB0dFJ1dUNO?=
 =?utf-8?B?dnNzdGxENTkxaWxNV3FwWXJYY1dhWTRqY3JZWlNwMjJGNnNqenJCY0gzL0d3?=
 =?utf-8?B?ejF6YmhvRDhZTThWQjBXVkZWVVFWNExGOGIzc1E2N25peUhrcG55QzJla0ly?=
 =?utf-8?B?dGVBV2xvSytDOFVQNTZuSUpFQkRJd0p2SGkyb0lLMXNqaEw0QTNZaDFCcHFy?=
 =?utf-8?B?b0phVjE1K3hZMlEwMXFPZGFkb0cxNmFBTWpUR2tPVHd2NFFoNTd2UFJTS3Z0?=
 =?utf-8?B?VkJLY1czeTNSUFFiLzdsZHFkQjNJWk44bXE1Vml2NFE0T0huamV5SjMxcDNX?=
 =?utf-8?B?ZEV3UFJBSEJmYU9QMmZYYk5pcWY2b3JQZTNBZ21FTU02OFVHbnhHWFZIVkNN?=
 =?utf-8?B?QUU3WnVGbTZ5SktVM2pqN28vclpsYjROSWE0OVRUZUtqL2oyL0ZKbHRxSmtz?=
 =?utf-8?B?UWw4amwrZTNlWTdhRUgxZmpzSlhqNnJnN2xuWkgySHY0c0VKeGdvTkhqSnVK?=
 =?utf-8?B?NWN6NGVPUkYzYnlLMEJidWpoV01MQVJNaExJaFJWR1pzTy93bGJQUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c6d2f8-2718-44ab-ad54-08df3a660dcf
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:23:30.3834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oSoNyjnzKQC5+yAJunvitkXKbd0smxLp7XgYClI4eLQ2m6S6ENZHCLeY9JvWhnb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB378049



On 9/18/26 00:53, Aleksander Jan Bajkowski wrote:
> The Parallella board has a SPI-NOR flash connected to the QSPI controller.
> Enable the QSPI controller and add the corresponding SPI-NOR flash node
> to allow the system to access it.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>   arch/arm/boot/dts/xilinx/zynq-parallella.dts | 33 ++++++++++++++++++++
>   1 file changed, 33 insertions(+)
Applied.
M
