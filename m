Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792736517;
	b=tDS6SrPFnDnXwBct5RboSlGTjNNscqXPnIopXbAc7ASz46C6WZIzEhLXrTUxzOSp6sjl
	 XwtiunqG8LyqGQU6LqT016IUshNKKmDa7s6o6UoJ8wfmqMOaNAQj4GvX/FNulwbfMPhxk
	 04OMwyAU3e3wbTKgwxbvIrIbBO+u/TTlXuzV+Bp8PdQReFRPdefG6Zy5JmX30f5puBipW
	 qKNq9I1viM5LTK3yxGG5QYrI1DF/T/Ik+ro3JPsyZtmURlFSvmsMHMt305CpkUqPV1hRj
	 fIBRSiRtz4zjY4ZxlDQgFMv8dW2Hb1wGu3xzzEvUXiSxQLX6liv3hN1a/NSUitaV5Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792736517;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=t5r/6rSnGHaJmJCA8z0nlLKUvEV3YDjmNaf4ENMJmls=;
	b=eDlG9u7yzexES/eue5yiMEkAYvFuK3dKojMchb7V6KGQHW/NGXnDU51XBcgDQQ7fxTiK
	 mXmESdFdAGWKj4qzJZBFOcZLyhKsNaIpYu+DwrLMFKJrZ8IAFTXQt1uJXOyh+rKyhFF8O
	 8ZjABqCUh/fndtdfa5yBJXDfREE7pNU4WR3iZoq6jb1hHAwxvRknraHVykE5DxcDh8vRy
	 RRAxxpSvlLAbIJdGBXEWBJHmsAPFmKhTRsiQuwXS+Y2JhHyJsuWbiByhDr+QiS+iL5oCB
	 OfdP1hGGVY501jEA7LnKsKgHxqVQmG2QZ95i/+RtsRC3Dvb8rlv/R/5dsBTe1p3J9LQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=G7Of7B6M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.43
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012043.outbound.protection.outlook.com [52.101.48.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704DA606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 704DA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=G7Of7B6M
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HStmGqWQFHkXIZfgyeX+qtA65hnYXx/0lr+4pL95Oma0pIo5qB6AtDkITl/n8zgrOCCcZHbJE+4sh6GoZsUURxDTdMAu0tD6Cfk1/hho+sjgDR8Rhw45Bz1eUPFdoZ/XHSil5j2ElyCN9zOv4eay1D49Mbkyy4nGmH8+6f+LFxffVcQAXbXnqjU3X1hhWwGts14jk1llzQijt5oUdDjvCaEo/5wa4vXBsUye79CwJ/md7igxSfXv0EVzLlgi+MJAAuXbvW2kvAZHQ0VSumxvB69D7ankBpBh19PsrnMK4ZrEK0PZ0PcuZYrVxNzanAyA4Tt+2al89apLnxHclPun9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5r/6rSnGHaJmJCA8z0nlLKUvEV3YDjmNaf4ENMJmls=;
 b=bUIacCAxNgx8qTF0/QVt0MWAghHJQQ3FTw9R2FU/egRmUDNzIRci6PYiAdrzj4auCLsxRZGANBxAWdbdjA4kCh2EZJo1nEgOqv6JrfURS2GeP1V/RLWLGoGe0SpezID50JtsCVm//TFc9LvoCPLXycaVg3eOjjE8K7kmwb3sOXCWY7FB4DwBK+GUAWaRgFUonXPYaWPkjDG4i/V4UiSkQzj1AuFQ5swGjD9B5o18it3TmXqQnqN7djsBGdzNAc3k9GIUupEuJtjImToZKb3XmXGnkVM6oM7zpsWNjcC8crViFScT9hj4A+H+fvEsB1YZMIMfg6kaYGIB1R/9ZOy9/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5r/6rSnGHaJmJCA8z0nlLKUvEV3YDjmNaf4ENMJmls=;
 b=G7Of7B6MVs1vb7vnlzM28xCtltfvpbAfKwf9D5pRzrbdDXRYO1Il/CuLNuzZ2mixsyAb3fTTYeEjgSy28XcRmg1I7Bj6atKCoFNnbT/F++aQR9pE4UoShM+2fRNccCTpx67U6MP5t1VwRg5R4AYoTMFnSmrXzNSV3wECdj+NlZM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL4PR12MB9505.namprd12.prod.outlook.com (2603:10b6:208:591::16)
 by SJ2PR12MB7964.namprd12.prod.outlook.com (2603:10b6:a03:4cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 06:21:53 +0000
Received: from BL4PR12MB9505.namprd12.prod.outlook.com
 ([fe80::73aa:eb8c:a86b:5a83]) by BL4PR12MB9505.namprd12.prod.outlook.com
 ([fe80::73aa:eb8c:a86b:5a83%5]) with mapi id 15.21.0522.017; Fri, 23 Oct 2026
 06:21:53 +0000
Message-ID: <b7d3a4f4-0ab2-45e9-b9b0-8ea9dc0b2b3e@amd.com>
Date: Fri, 23 Oct 2026 11:51:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG][AMD IOMMU][VFIO] IVMD exclusion ranges block GPU
 passthrough on ASUS GA403UI, reproduced on 7.4-rc0
To: =?UTF-8?Q?C=C3=A9sar_Zapata?= <el_caesar@outlook.com>,
 "joro@8bytes.org" <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "will@kernel.org" <will@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <RO2P152MB51059B868259A82B182943F48D652@RO2P152MB5105.LAMP152.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Vasant Hegde <vasant.hegde@amd.com>
In-Reply-To: <RO2P152MB51059B868259A82B182943F48D652@RO2P152MB5105.LAMP152.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0185.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::6) To BL4PR12MB9505.namprd12.prod.outlook.com
 (2603:10b6:208:591::16)
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
X-MS-TrafficTypeDiagnostic: BL4PR12MB9505:EE_|SJ2PR12MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5b41b3-fac2-4bb1-2c4c-08df30cdee26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|261022105027099003|261022075727099003|56012099006|11063799006|261009223027099003|261021121427099003|261021135927099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	0k7iMy47z8ov20xvIY4PqJ1mOzxmYlgkq6r5u51sGJStxBY3m128GhbwDpojqcJ41U4Slmh9SYp+Er1rZigF1S1Pm/8olcFsVGZboKuEOxux3d4R16Fbh3BF/nzsJvmLjWIbhSpE/Q3c7fxSrd3AzDR/hiGRv5ZasIaEZ6Vl1fw89QsVBVlYzi/zgelSqW3RjOjR7Lyc9URcm5J6OgNIfzaR1QGX0HtOxBg5bGE9T69VJKRJjMbT0t3F0wTlwaHZfcy40z3xkVlLen8invoHcGB3FvqOLYx+yuJC6qfVGRlLjrbS0wGpXnrbJSlRHoM6L38HSLAw3WAzZ7HVybtaAs/CNM3tuW7byPr08JbC8nZnW/baYQ6Y9/iEVNTNPrIK0V2hGRvufzom6F0ZvvYZQbw8+Ko434ZMdYp7gmO6r8PFTiobKYYVGdlYq/3rBoxB9b4NumCHBG8r4Wuesucnd3XryVEYyHNy1Fmfh2fAKVRj71fJJkalJYKMtxtLQfyWnJj0w6TS489y4fae/tmwqpS9CI+eBhUYGBsxYG6PS3gKs6w8dyVzqEyTUK7pOwCd2AXhMzF9ls0V5glru6DALd8cwRHtS7W1w0+rtgX4ThS8ps3NDl/EW2FZZj0088RC3esf5sNv15MAMweBMXZO+CaZKRi5VIQGIGgPHeXerpY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9505.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261022105027099003)(261022075727099003)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(261021135927099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmFDY0Q1U3JzWEd1eFd5eTlhUUd4a1gxZWJ6Ly9HcU5Gai9KNmlrQ0xteFRV?=
 =?utf-8?B?OXNTNWNZRnd3U0xiMFpJTVRaY2VDbjVSZmVCS2FqYTI2MlVnMDFkMFRnZWx5?=
 =?utf-8?B?YlpmZzJjNXhIMkNhaytpdk1NdnJIdFRNQjdmVmZiMmhvRER5a3kwM1c2UzZ0?=
 =?utf-8?B?M3lRZlNXL09XWkJ0MzJZU1BMTDVrSFpBczdteTlmMHFqcnNjdExpb0hmL3Vx?=
 =?utf-8?B?SXJZbHR4b3Rza3VWMzJsMWhRbzd4emhjeEl4YUZpVFllelBPcnJYSU4wcGE3?=
 =?utf-8?B?dnFWeWFOdEhKMTZjZnRyb01oVXpJQk93V2IwNUwrUTNpVVh5c2FZbjJmZUdF?=
 =?utf-8?B?YVRrVTU4U1dTV2NlM0ltdVl1dFVheGE3Mm05clRjRkx0UDl4WEpsZlMyYTQw?=
 =?utf-8?B?b3J0Q1NJMDBabXZNK2Q1SHpLUjFRdDZoUFgxWTVwQ2JMMUZxbEY1MVlFUzBn?=
 =?utf-8?B?N2ZIMnV2WXR0TmxMMDFaYXFDZktoSUsydE9ZZ3JkQTk2aGd3OXhCaWdVaTI2?=
 =?utf-8?B?QUNuazl5TEVkT0o0WmdGaUdlT2o3ZTlxUzBlR0IzNEpNQWp2VUZZV3ZhK21m?=
 =?utf-8?B?NnFualBoamM1NVJlMS8xU3FKd1ZjREdhTisrdmRSU2lzVS9EMi8yK3R5dGVa?=
 =?utf-8?B?aC9MOFBaNG5DNFRaeUczRmRUMHNwZTdDQi9MYWZGVWVNNXpCTU9VcytoQk42?=
 =?utf-8?B?VGVoa2pyQWJYQmh0R2JFK2s2Wjc3V0FBSzJsaFdQeWpxSHlXUlcwM2ZoR1lJ?=
 =?utf-8?B?ZjYvVWdaVUdiTlFWcDJJeFlEdDNucG9jWFhYSTR3L0IwbzBsTnFSTlorbTdu?=
 =?utf-8?B?blFKV0dkeHJ4YitmZk5zeW1uTER6WTBmUmh2c0xSV3hFaisySnpYY0RMU0Jn?=
 =?utf-8?B?VU1rUVRJbDluSkhHNkJndUZYMnJzR20yY2pjbWJEblZha3F2OTNsa0FMZjNR?=
 =?utf-8?B?U0JZcUpkRitZcmdyQnR2MWVUMGwveWw4UVZaMzQxRmRSU2ozZzRDMjlwTTdI?=
 =?utf-8?B?NENuV21GZUgrT2V3ZlJ0VWx5dysrNmU0NGw3eEdoVUJ1OEdjRXZneDh5TjBG?=
 =?utf-8?B?ZDFJVW9DanVjbEhsZUlrZUJ1Q2pIRGZnempGb2RJRzdPRzd4L1dyOENyeURS?=
 =?utf-8?B?UWNkbHNNUG5ya0pDQ2swKzMvdWlnTnFMdmNNR0RYd2J3YXZnc20vYWU2RGpG?=
 =?utf-8?B?QlFFbUVhM25BYktHWEYxWUo1elNSTlRKTHBlT3p3M243bDM0cy9CWS9ZdGZN?=
 =?utf-8?B?NGxjdkpzMHdVNDFKUnptYm04alpjVVg5c3lKYnI0d3VKckZqaG0vdXk1eU15?=
 =?utf-8?B?akhWRkN2YTBORnZkOE5YOTlxNnZ2ZHhVaktYb1VOM2FSL2s0VXNUYWZJS0pP?=
 =?utf-8?B?d2VCUERmQjk1TVR2eExOVHJETW40a0d3WG9VZmd6TFE0L2IxYWgwOWdrd3lo?=
 =?utf-8?B?N0dnWE5rRzVkMi9KWE1UUlBqeFVlcEhFald5bTNEMkxyMXBiVGVINTlOY2pi?=
 =?utf-8?B?Q3RwWXpLZ1lUUlRFamVyeTNCOExEQ0xXa0RSZ09HZDBKazdqZWluaUxuSERi?=
 =?utf-8?B?WWhZSExSSVY1R1MrZHZUdTRGQkJsb1NLNjZyMFRzK3FlRlo3U0RwaFo0UFpB?=
 =?utf-8?B?a2Y1bkJsQ2xCb1VuUFVYWnJrNlRPQUNSbTkxZmVKeXVId2k2OVV1RUxCMldS?=
 =?utf-8?B?aGN1TFk1OURXK2F6NDcvSzhpUmsvc2dORkh1TnI5VjRmL0xtNjYxQmlWbVc4?=
 =?utf-8?B?ajdPeXNnNGluckVzS3JFcVpkNFdPNFFqeUVrWWd2QjVaeU81NlA5cmxVaWUr?=
 =?utf-8?B?RExZRTkrWS94SnV5RmN1Q2VSZFk4MHdwVGIwQTR3T3prWFNKSnZqeGk4VlVN?=
 =?utf-8?B?ank5TVNjOWtGS1FCelMvUW8zMUVFNVhGWWtaRGUyay9GS3ZNUkZvZ09JOFpk?=
 =?utf-8?B?S0JrRjlPa2ltaTBaOVBRYzVYbTE3d3AyNzI3M1pzeTZsYVJTLzRzNEpBTHNF?=
 =?utf-8?B?ZVZSWktTL0hyR2dZNEVacm5jQ3oxTFNnL1Z0Mi9UdldPNytTZURKNWFUWDlF?=
 =?utf-8?B?a28rdU5BbHJNbU82MG1lOE1Xb2lhTk1FelExSCt0ME1SYW9TeUhIN044TXNQ?=
 =?utf-8?B?VHFJejc0WUZ0MWJzZXVyYVVQQTg4YjFFa1BSWWlDSDczaUVmeDd4NVFlZnZG?=
 =?utf-8?B?ZGtHVFNWY2NzYjAzUjdZTWY3eWhvRkN4YjU4NlVBWnVKZm1zMVVZZ3Ywc1dk?=
 =?utf-8?B?OHhSUHJTMWs0aW1vUi83bVR2Wll5WjNIcVdvVmY5TzdkazVRMTYrWWNzRVVs?=
 =?utf-8?B?S0JnQWZYVHdSbHRlbmlJbHZVU2xIU012b0dFY2JMTjExaG1IeWtFZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5b41b3-fac2-4bb1-2c4c-08df30cdee26
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9505.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:21:53.3128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0gLY/JSbfhPVCmWqjx+NXz4PxLZ/6K1Rb+teC3ie3VrkgjX13slEXlEGavK/El/YtlFzYjN+oo5P/0uYkzOfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7964

Hi Cesar,


On 10/22/2026 11:22 PM, César Zapata wrote:
> Algunos contactos que recibieron este mensaje no suelen recibir correos electrónicos de el_caesar@outlook.com. Por qué es esto importante<https://aka.ms/LearnAboutSenderIdentification>
> Hello,
> I would like to report a reproducible AMD IOMMU/VFIO issue on an ASUS ROG Zephyrus G14 GA403UI, now confirmed using an upstream Linux Mainline Vanilla 7.4.0-rc0 kernel without the proprietary NVIDIA driver.
> The firmware publishes broad IVMD exclusion ranges that Linux exposes as IOMMU_RESV_DIRECT. Consequently, VFIO refuses to establish an IOMMU domain for an otherwise isolated NVIDIA GPU.
> System information

Thanks for the report. I believe below mention series should fix this issue.

@Suravee, Can you respin the series?

-Vasant

