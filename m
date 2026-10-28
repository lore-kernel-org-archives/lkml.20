Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793195170;
	b=iqjgT+CqNkp1CLpLIrE4S8KHurMkSHlVv6LoJGfp2Av5kOWs6cqjhKfKdnoiDHw2ZYcj
	 t5prF28pM/jaF5oVHpxd26tuKLk45cAdkRpwlClchrYUQYsC+VNG6nQOTPAXfKT44XwcL
	 ozkFcCzn6C/3i/ijXw62C+nmwqSTtDhLm1LRToCHDok3mHE6bFTlaXN2PEL82Bt3toiS4
	 t8S7oZGWnsQf/EfeqIiff9U+lgCcviDCWma53OkMujEFQU9JNm1gxvPZEa2Y5hb4agjLD
	 EZfh85K8HZzvSNXJt31rOwWo2IA1dhEg5DcLeloG9h4a2RDBR+C0yWRWAxcVziD0p4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195170;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=HpsUTsNAF3NkbJmrR6SJ4nk06XyWEgmqW3Sq8u6ssN4=;
	b=nL0pScDmNrnOtbPfT28dG/0pEH0kGZsv1fUzGZqBWQswQrnCJj01jJiIqTfYOTN1g8+f
	 ALXWW1hxwyX5b7d8tMf8R8yAe7W1G+FO7mLor0PKJLIFsF0NcHs+4+CeM3K3r7C3uruVQ
	 VPIlkhJLabTyHar/7cHfXPMrtWS5CAbr/kKS9tTkjLnOnBSL9UcGw7SKMJeFf/f5l2bRs
	 Cn8yNQxM1pvDD1SfQCp/STIdiGj8Xedj29IPsX5jz7A5pSXYFZcPfWwwp8eUjH3zhplZF
	 fbYhnnHACpp/LI9bBRp195orS5FiCfsUAj8mwKfwA54V+CHGtLhR28xPBoJoFlhQgKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ss6IRGfd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.51
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010051.outbound.protection.outlook.com [40.93.198.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB5B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB5B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ss6IRGfd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHEroRHD5ULjiB58kujRZWXtMKm/UzZh1wHSgbI7wDFPZu7/+HJWh4Rhcz2NLrSq7597mu7ORwXS/fwQiJqpPNaeG4HmwIKrAdF/8RntU/2n1DzGBSIZ9HPVpjK56QTiglvnALdKiv5Xt+mmB4YluPne89BDmAt9nBuC4ZqR18SBCOYjS1j0Zzyi+KkXd1yp2rHdVJ3/fjiprIHFi8uUfS9Y3kfgWBbZQGTz4vZReSZJkqQD4mtDMr+hIQn+/VzljPEYjga6VYMA7GxSS3lJIgzKdB+wGFg6/j2c2cgKqdFy5ohe1LAzikWsZOEN0lFfP4H3wqqQjZMWsHlrd7fjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpsUTsNAF3NkbJmrR6SJ4nk06XyWEgmqW3Sq8u6ssN4=;
 b=kwQO1PxwLVBjN/nwmLsb8fN0wGJksMYcOUMsMHVT9mbTsMg6Yww3DofhHS5IfdFb7nPrhf94W66n+NPA2piY2KusRRfh64RXYOgV0ruMcrRNcZ1ZgPJFPlyyFNlWmXUPTrN1R6p/3MmkiJuAE4Y3DE+/3FC1px2l/OVHlLXqILePJtTJAj52kRZ1ORW7zPEGUgEZbBMgrBKQF66zFte/9u26m+ohuzYb4rPQDn9FqHDBXs9V+mrpq1uYRVPPfSLpqnTSIhRFcMGeL3tP8fRM8tgt9htrH0v1iBzkVf/iasmf6BzQVi8duom0fVUP2Jc8gbSmWVq6z/IZNV08uROBvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HpsUTsNAF3NkbJmrR6SJ4nk06XyWEgmqW3Sq8u6ssN4=;
 b=ss6IRGfd9VkmnTSd5u7Kq+p1t7jeClDCtKwoHmQ1B90TlW8qSNEPh2nynhdNHtTj82Z7xZLZVtzUopvOjTpaGurk+780RR96jvJyyj+QmZXjf4gIK2QBpBJBUZpLQfn18NiIvo0Q3P9+yrNghvEvf6a5aApI7ZrBdJMETUi5Z/YLG7d0UuBe7gWkN1liyRy/ssZKKp6P5TNYT8F3UuI9DfyLBzSLUtzwoVXZnK5tsStlVoSrVAbjgyCaBNj2y+/RlR1TU4ZoR4Xt+MxgU4aOha8pOgKMMXJfqyr9aHjIbupXjuzKgw99gpmHhzxVsA6hnR+qMmCzqe7zP79Kcj5xMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SN7PR12MB7153.namprd12.prod.outlook.com (2603:10b6:806:2a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 13:46:03 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 13:46:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Oct 2026 09:46:00 -0400
Message-Id: <DMGIMSCNW6YL.1R45Z2AH6EBKE@nvidia.com>
Subject: Re: [PATCH] mm/compaction: annotate data race for
 zone->free_area[order].nr_free
Cc: "teawater" <zhuhui@kylinos.cn>
To: "Dev Jain" <dev.jain@arm.com>, "Hui Zhu" <hui.zhu@linux.dev>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Brendan Jackman" <brendan.jackman@linux.dev>, "Johannes Weiner"
 <hannes@cmpxchg.org>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261028090747.68086-1-hui.zhu@linux.dev>
 <548d9950-cc77-4c1b-b78a-34e304adb989@arm.com>
In-Reply-To: <548d9950-cc77-4c1b-b78a-34e304adb989@arm.com>
X-ClientProxiedBy: SA0PR11CA0199.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::24) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SN7PR12MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca93c79-ea5c-42fa-459f-08df34f9ced9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|22082099003|18002099003|261026140227099003|921020|11063799006|56012099006|10067099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003|4143699003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	FCSYrVsUKeLacvMWNGOiemnuI/eBP7mxJ4dWZW0CMganrMU2+gPj4r2KXdbz+JmsW93AUVRQ/flI/JysFXqAjSpU5YmcCiQRQIDk+628ilk2IT2IJYuz4okJPD7RL+dqi0/XbQEmB76Dra11RN/5PI+Xvjvgeuh2iij+jcuZX089fr67L5txWAPeZCro3E6cIbeyTNPsN8P5Hemqcgdr8mbVpN2D+nydzsNj/2iBxxkQgVT6qzPpQfVEjm412yScEfRcp91UkcBMKjDV/9SJYmwZeM78zBAgCs5LjG2MRRZEIuTRSycAo3shfur0ftOSGUBTxrqkFGBdUYga3oF2ZqakufbiXuIRG+1CRd1zr8PE5KFkg3gqXajWIYk4+YHnoKK7jwzgWQMQ2CllemxDRyMRayZIDJhA7C7IX6aZHl6kN2wrCaib9eXOS73EOJYH1YEbYsNWtPqE0kwuxtLOGq+L/hu/RcHQL5dxz1Ci9lfUXBZqDMg5tHwd2ZNaOC/FoXk/W6DFdgQktpVVZqvWdgmhOql4b+gd/9GR2OIt8iNDIAwhiqTbAczsLdew4KrhfRaPfuisSMwVql48bxTBvw2UXnaWIsipYXMVQoVW8w2mE0q/c57R+ymW4AEuy4gwVUgcblH1phk1ksubsDPi0HA/QvH32+b2iXzwSGGl7YpXbw77rb/QV+Na/VYOXU6+exVVg97kdwKALzdAiDtgGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(22082099003)(18002099003)(261026140227099003)(921020)(11063799006)(56012099006)(10067099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(4143699003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YStqdW1ZZlZ3eEZDSTdSUHNtQ2M1UDI0MVB4ZmFkR0lINzhvOVh1QzRZZGVl?=
 =?utf-8?B?ekFhWE1xMTMvcFAyYjVzNmR6WDljalF5d29ETVBFTnIxbHdUd0EwN3JFL3RS?=
 =?utf-8?B?V3ZrWGhGMjRsZDBJRm84dVBCYXFSMzNPdU5HZFFEVFNWVm5laEpaUnhEeTRy?=
 =?utf-8?B?SDFHU3J0ZzhHT2twMFVEVG4vSmJQYzJ5U0szU09FMVhkVkUwSXg2Mnc5cDRW?=
 =?utf-8?B?WGczekwrZlgyazM2UjAxWndrL3hHbWJwWmtYMVpka0V5Vm55bVlNS1lPR3la?=
 =?utf-8?B?eHhKY24wQ0NraDlZanlUaXMvU3VKeEJ6Q3lzbVo5RjBWVEdQRXVwSWNxckJm?=
 =?utf-8?B?VmJmWmk0TXZVNit3cDBsNkxHb2pZb0hpMVNqRExLUU4wTDFna09SUFBaTXN1?=
 =?utf-8?B?WlZQbExEOXFQR1dQYzRKYnczcEdxWVprSkZaSWNTNExsTGV6R0FZVzlKb1p0?=
 =?utf-8?B?cEZHb0FpbzViRExXQ2hxY0M1enViY3VVY0tMRUZoOTlTanh0VGUrMHQ1RGkz?=
 =?utf-8?B?U1VkV3lJQzROQm9oTVJnZFIvQ0xzc3NiZXBpVjZqTUtOVmt6RzhQL3Y1azRl?=
 =?utf-8?B?NUJNUTdTOUNJdXE1WjdqMks4RllDN1FYMGNIeWhPOWg5RGFaYXQrblZPQno3?=
 =?utf-8?B?dmpaT2lIdzdIZkg3NmVGTU1lN3NKa1U4MDRZV1MvZWk5NkRFeXlNOWxuNkxu?=
 =?utf-8?B?OFVhdEpqUElTVGZnU2RsbVBPWDFkcVRwRkZCNjllRkhQM3FMNUVYVG9KYkpM?=
 =?utf-8?B?M3A0dXNrT2Z3QVE1MHExQ2ZOdGdWSVpjNmUrcDN6Wjl2dWlRZlJITGJSWEsy?=
 =?utf-8?B?T1g2WVN0RzlSRGR4aUxMazZlMFNYdjd1YzlIZlVZb0d3TkVRNXRWK1hSREll?=
 =?utf-8?B?bnMrYzVsQnMySmpNU1JvMVd4eTFncUJyTFZVT21sRWdoTHFLRTI4cGh1NzNa?=
 =?utf-8?B?cUpGZFlEVmorR3Y1eEE4WHMvZTlGYWxFdU1FRXBWdUJVMVA4VGxuenFDVmdI?=
 =?utf-8?B?WjVhT3ZTb1FDVkxRVHhQMDg3ZmtqRVBhRUVwMFdLaktPSWFXVjk0ZWtOVHRw?=
 =?utf-8?B?b2t5elVjdE00VGkrTGV6MEMvYmFoSVBjL0t4dThQak5wSThBZGpKQlB0Q3NR?=
 =?utf-8?B?NVZPSFZzTlplN1g3OW52bjZGd3pTdlJsNGVpT0JneXhKUEl3cVdHZWhkVUlh?=
 =?utf-8?B?MWs3K2hHbEtVVzB1dTd0QXZiUTZIeENLN3NBbGc4KytzbVJ3MlRZdk9SZThn?=
 =?utf-8?B?TlRPay90dGt1dUJGSW5qVUFwVkk1dDllWnRFcGQ1NStGNjJaMU1Gbk5UMTkv?=
 =?utf-8?B?WmlYOUY4U1NiSnJ1NTRUeVJMUDNtaE1jaWxjU0VFTTBsUERuL3A1MjRkVmZT?=
 =?utf-8?B?MUcvRXZRb2ptQVNMaTlEMHdlcUhHQXZDdWtoY1NGZmk2SkppYzhsR2VTU0p2?=
 =?utf-8?B?L1FSWjdwS1BhL25zcWlza0tuQTJOZys2aGNMcjlTNGtuZ3VBM2RBYVVnenBi?=
 =?utf-8?B?eUpKVXltMkMwQ0FyNVRkWCtrbmhsdTRkK3NBR2tMWWxlN2hVbzkySHJMc1Vo?=
 =?utf-8?B?cnRkRmcrZHRKOVM1TG9YelRxMmRWbE1tNXorVXRILzVqTHN0VmhHU2FUdzlr?=
 =?utf-8?B?Zlh4N2gxVVZ3eExKTHZTTTkwN2Qramd1NmxnZlVsaldKanNPeWI4cy9GV1hJ?=
 =?utf-8?B?MmRzUVI4S3owMSttYlZIM29OMWE2d2hDbGxFNko3Tm1RaVZ4VzcvSm0yZzZ5?=
 =?utf-8?B?SUp0YkJ6SWFnbVRHNWJtdEFkK3lqZzl5UlVIWGZldDY2YzArQXVaNEhoOGRt?=
 =?utf-8?B?WXM2dXJIUHNTSnB2emlHbWMzTS8zNU1RVCswenNzYTFueFNUN0RtZkJLc1Zx?=
 =?utf-8?B?YThKeFJhbWJ2ci9VZ0VtMDI5TXUweS9vc01aMm5YditYY3FNcmQyNkZiVjRv?=
 =?utf-8?B?bUdSa0tEUWd2Rnl6ZTVMYitveWkzUUxRNitkREZyR0J5SlMxbHhwL2FOTGd1?=
 =?utf-8?B?M0hXMVA1L1lpeElRbE1keWJWdVhLa3ZBK1dzdnMya25FSXNLN3I4SHY0WWN1?=
 =?utf-8?B?MlNnQzVJUGRaVzZIM3drUjluTVFlcVU0R2I2dDdCeUF3a0pDOWVTK2xNZjVC?=
 =?utf-8?B?Ni91MW1mSGxEcG50M3dQSVdLOWpPQWdDcitUaHJWN2MzN1llckhBSCtBUnZn?=
 =?utf-8?B?MWRqSHdoanZzMi84VHIxTXZFZ0RYZ0RRVmNVRmlIakRWQ3R2Zkl2MTFmcG92?=
 =?utf-8?B?Y2thd2daZWpoUDdHQ25SbzZpMGFENnkzaWNadWxXcWlQaU15T3Foei9Ocjd6?=
 =?utf-8?Q?Vo3gotoUuHhshi9P8g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca93c79-ea5c-42fa-459f-08df34f9ced9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 13:46:03.4121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRJrFf59yuXIRCWIzyz3w5XG1jQ/c6l6poqXhEUxG/L4njF1VHElAJroxmZlYcqB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7153

On Wed Oct 28, 2026 at 6:30 AM EDT, Dev Jain wrote:
>
>
> On 28/10/26 2:37 pm, Hui Zhu wrote:
>> From: teawater <zhuhui@kylinos.cn>
>>=20
>> KCSAN reports a data-race on nr_free which also exists on mainline:
>>=20
>>   BUG: KCSAN: data-race in fast_isolate_freepages+0x284/0x1550 mm/compac=
tion.c:1589
>>=20
>>   race at unknown origin, with read to 0xffff9894ff3dcb60 of 8 bytes by =
task 179078 on cpu 12:
>>    fast_isolate_freepages+0x284/0x1550 mm/compaction.c:1589
>>    isolate_freepages+0x52/0x650 mm/compaction.c:1722
>>    compaction_alloc_noprof+0x36e/0x3e0 mm/compaction.c:1850
>>    compaction_alloc+0x21/0x30 mm/compaction.c:1880
>>    migrate_folio_unmap+0x7f/0x820 mm/migrate.c:1177
>>    migrate_pages_batch+0x37e/0x1200 mm/migrate.c:1762
>>    migrate_pages_sync+0xce/0x560 mm/migrate.c:1928
>>    migrate_pages+0x8c6/0xc20 mm/migrate.c:2037
>>    compact_zone+0x539/0x10b0 mm/compaction.c:2660
>>    compact_zone_order+0x1b8/0x230 mm/compaction.c:2795
>>    try_to_compact_pages+0x20b/0x630 mm/compaction.c:2851
>>    __alloc_pages_direct_compact+0x98/0x2b0 mm/page_alloc.c:3722
>>    __alloc_pages_slowpath.constprop.0+0x452/0xdf0 mm/page_alloc.c:4401
>>    __alloc_pages_noprof+0x28a/0x2d0 mm/page_alloc.c:4794
>>    alloc_pages_mpol_noprof+0x1b1/0x470 mm/mempolicy.c:2270
>>    alloc_pages_noprof+0x7a/0xe0 mm/mempolicy.c:2347
>>    io_mem_alloc_compound io_uring/io_uring.c:2848 [inline]
>>    io_pages_map+0xb9/0x330 io_uring/io_uring.c:2892
>>    io_allocate_scq_urings+0x231/0x300 io_uring/io_uring.c:3933
>>    io_uring_create+0x29c/0x9c0 io_uring/io_uring.c:4091
>>    io_uring_setup+0xb6/0x100 io_uring/io_uring.c:4203
>>    __do_sys_io_uring_setup io_uring/io_uring.c:4230 [inline]
>>    __se_sys_io_uring_setup io_uring/io_uring.c:4224 [inline]
>>    __x64_sys_io_uring_setup+0x66/0xe0 io_uring/io_uring.c:4224
>>    x64_sys_call+0x1816/0x1d90 arch/x86/include/generated/asm/syscalls_64=
.h:426
>>    do_syscall_x64 arch/x86/entry/common.c:51 [inline]
>>    do_syscall_64+0x70/0x2a0 arch/x86/entry/common.c:81
>>    entry_SYSCALL_64_after_hwframe+0x76/0xe0
>>=20
>>   value changed: 0x00000000000002f4 -> 0x00000000000002f5
>>=20
>> nr_free is only updated with zone->lock held, but fast_isolate_freepages=
()
>> and fast_find_migrateblock() read it locklessly to skip an order that ha=
s
>> no free pages.  page_alloc.o is excluded from KCSAN, so the writer is no=
t
>> instrumented and the report is of unknown origin.
>>=20
>> The race is benign: a stale zero only skips the order for this round, an=
d
>> a stale non-zero just finds an empty MIGRATE_MOVABLE freelist under the
>> lock.  Annotate both reads with data_race(), following commit
>> af1c31acc853 ("mm/vmstat: annotate data race for zone->free_area[order].=
nr_free").
>>=20
>> No functional change intended.
>>=20
>> Signed-off-by: teawater <zhuhui@kylinos.cn>
>
> teawater? What?
>
>
>> ---
>>  mm/compaction.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/mm/compaction.c b/mm/compaction.c
>> index f1b2060eb2016..499ec7ceaa3ed 100644
>> --- a/mm/compaction.c
>> +++ b/mm/compaction.c
>> @@ -1601,7 +1601,11 @@ static void fast_isolate_freepages(struct compact=
_control *cc)
>>  		unsigned int order_scanned =3D 0;
>>  		unsigned long high_pfn =3D 0;
>> =20
>> -		if (!area->nr_free)
>> +		/*
>> +		 * Access to nr_free is lockless as it is only a hint; a stale
>> +		 * value is harmless. Use data_race to avoid KCSAN warning.
>> +		 */
>
> The comment is noise, the reason of using data_race() is a well-known fac=
t.

IIRC, checkpatch.pl requires a comment for each data_race(). The
comments need to stay until you send a patch to change checkpatch.pl.

>
> Apart from that, do we have the same problem with zone_watermark_ok? It a=
lso
> uses area->nr_free without zone lock.
>
>> +		if (!data_race(area->nr_free))
>>  			continue;
>> =20
>>  		spin_lock_irqsave(&cc->zone->lock, flags);
>> @@ -2031,7 +2035,11 @@ static unsigned long fast_find_migrateblock(struc=
t compact_control *cc)
>>  		unsigned long flags;
>>  		struct page *freepage;
>> =20
>> -		if (!area->nr_free)
>> +		/*
>> +		 * Access to nr_free is lockless as it is only a hint; a stale
>> +		 * value is harmless. Use data_race to avoid KCSAN warning.
>> +		 */
>> +		if (!data_race(area->nr_free))
>>  			continue;
>> =20
>>  		spin_lock_irqsave(&cc->zone->lock, flags);




--=20
Best Regards,
Yan, Zi

