Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793781113;
	b=mxLZvy2xud8irH8b/3mLeML/fojyjsmQGMDFlhK3Nd/czpXwDpIKyaupWbgUl5CrcHtr
	 JdVc8RSLOi+ln0WvI0JO7W0PUQJ12pNcto6PAzmblokRF3GPiBug6NH2/yv9pYnfVJFdO
	 R89NWm0lx6DL+OQoK3CO/oPJsxcqqD5xsgx4h1Et0/kXZn0xck/EhskRuaTjj0oIaH0Ni
	 cgGoiZa4QM27b0LwqOUPLBCBizzu8k1vm5mFWdA9trXi5gXV9liZsU29+M4TY0b6PNn3Y
	 L9B3K6WhzAOXSJzMikICMvI84VJC4Ne1hjVdPsskihU7PmHNWq+MFj02XZs/k0BQkKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781113;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
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
	bh=582ikX0ox6cKt40Ha8Lvn61SLio79/q2mfArY4iSqLc=;
	b=A3aQFRMNJy0fS7l19mR9op7g7GK6XMgRLGos1mlccO7RcBSLGGxHhSiBjIzrI81jT2Ca
	 94OWjk7aALF6V6OHVZTksvanWZGX9KCspPz5heYawMKJ2GvUxnS/V/oyalAty42vfwRr4
	 35x5BxAjcUe28xWhoVJSAI6C2rWzlx6Zxvi1WrsPOJt3M46ip0MA0aMYQRMWag6bk/gQA
	 8I6W6KhgD/yJ/B6Q4nEN6UQGK9ah7GxqlqvVatCTOZlDU0hsRWDt1AfwlqRX0VnSgWO9c
	 9YzSgHkC3M8o21ZCRNZrditUKKtfzVgxECpoZUevdih/fuaFxzsEzoi2D+5mND7xZeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="yA4lF/Q4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.7
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010007.outbound.protection.outlook.com [40.93.198.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF26606A31B;
	Wed,  4 Nov 2026 08:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF26606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yA4lF/Q4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJZzxlotb+VctFCdlcr0F74V2U9l83Q1v+Q1uQfe28bhvr3hGVPyNANxQuA77wjTF2E+GMTTpP2YHqyO7+AD4yqEKGg4dhTn9SspWZN3A2rVHaI88Hkq376TCuMDA4VQPKF766GWBLOJQxdJzK0mUCUswEVJ2OnGpfcWTQg6185LmZyle47i0UwSl6A5GztA5y37lM30B+xx5lqFPejSu4tMr8QnQXpldW0YRqrhkvR7Qqo5QITEneNFgRXgUCYTM2RpUHEekjapAWlzpK1V2kzZ3bCKXkJLe/cLI8NZOcsR6+ENApt1mti0KmDe0qLEePgQSiTORL2jnXhsR37chA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=582ikX0ox6cKt40Ha8Lvn61SLio79/q2mfArY4iSqLc=;
 b=MXta/5ov/0bMiNTFTMLwrvU9ktmwO+qUXAzwTLq9rx7jTSHYdEcUNzsgnNHNEv+0edmnkSXzApE9DSEcvotfJJt5pBSFm9/XUE75HyfB5Zj5O9ZG2+izsiQqJDd8a17JjqplmfdFhKBrqmheFXwyQXI+JJTs7/pq38QVQ8RbFrBcd9wOCKPGtz7Rgmwb+QkIvVJTOuqMwsJGClQLGoA26c0/6MolNnNI9lz0QJXTHRxiq4gIT1v7fGea/ZSn5NIsuDw7zxYlLqhUeOuZj0KEeJuEL6UMPZke7SGkHkCPvdclqgqYeqM80dB3G6gBmqkZ4OdnOP7wT/mVgsI4idlB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=582ikX0ox6cKt40Ha8Lvn61SLio79/q2mfArY4iSqLc=;
 b=yA4lF/Q4rX5dKdjMm0AxswAtZHHRErBsvV6DN+PA98TCEzZRXA4yEYvj7Y9AU23xL4Pj1kjlP7gFljL5mkxVHyJBCoZXSA+D1SnhW16QO3jxjsIudAQdKiabTrPvEVBXjZMJXObXH8QJmUYI0Q0rBh+twkIb84RMBUHFtOx35pg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS6PR12MB312928.namprd12.prod.outlook.com (2603:10b6:8:532::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 08:31:50 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 08:31:49 +0000
Message-ID: <47ec785c-dc15-42c0-84f5-58ca501d7881@amd.com>
Date: Wed, 4 Nov 2026 09:31:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: host: ehci-xilinx-of: remove the driver
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 gregkh@linuxfoundation.org, stern@rowland.harvard.edu, robh@kernel.org,
 saravanak@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20261103181722.2174208-1-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:254::21) To LV5PR12MB9779.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS6PR12MB312928:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b25e4d2-3346-491f-a1a5-08df3a4e123f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261022105027099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	W2K2QwSINHGp33N5p7Nr9RAE/eFzUL4lFqLelyKC3nHwcOGjs7/6HTbYNGZ7/Pucw2wx9XxgN7IcfdacgNUWATA80z+54XmtgwMWlB+nxaC38go4Y6zmza5RtOomBTl82ig3eyTQ+V41JQ8fyfGiR5TMuC4yPDTWzHhmUK7B1/jOO5ZZkEMAkzUUX+EnKe4Is/tu3BtL25Jhh9bMyJqiHak1X/OfgSDhhQPYbjHbMYPtVy4iLC8TGGn+j2mXNKsgpVwtlsYMYCdRih5tVj+V4Rz+udcJovCJzP/i3TY4+jKkHIQUlTwZ02sMl3SQ7lziP4hlbpfgwIMai3Fmod/bQ4k2an7U7icytjzcg5eCrcFkUif9DXZTWFqMx6vKThjdj/BjKFs/a7S7xVjt7Vmvz6OLabo7m6RU1+8DX8rwu8XBR4B/u2EGWVot/yEvJlmfJABvDYYZgQ3Nu//fiR+sSKSme9onhj1oSV++J9Jd862T6mbLdZacoTYo/agj7eVyftvk37R/o/z+4fWLlGPUr6Wk5n/7px/dzPIvOET8zmtRqYK9brknzdFuSIqtKChKr/qxXDJRgTEoEegimRrFLq8biXV3SnzyBaru5sSzzUAxjGbgL3NQERcfTBk73jsh9lbAlSpptEdh0v9WJIz2ch6x8bCWwxmi6A5aQW6qWGc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261022105027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjVyR2Y0ZUpESTFiTDZqUTFMOVhzSVNheXQ2enFXdFFaMFJRU2IwR1lJVTRB?=
 =?utf-8?B?Mlp6Nis5WFZSS1dCYlRQYlBWeVFDR3dBVXdHa0xWNDJ3b3ZEUGgrelNUbEQ1?=
 =?utf-8?B?cy85NUhET3hZTnhuSzlzenIzTG9Odno3ZmY2WmJycy92enpHT24vck9RWnhP?=
 =?utf-8?B?MCt6YUhpY3JPbTEwa2YrNjFkYnEwVE1xSVJoR3ZESWx1dUJEZ0VpWFV1b2Fr?=
 =?utf-8?B?THFYRFl3MFgrNGxna21yRkJjWlF5UkN3dktlQS9KMkcxUGppSndJYlcyTkpR?=
 =?utf-8?B?MmdCRmppbnpvSmtvTXF3Nkd1RldJWkszRlEvZmgra0l5MjF5bkI3S3ZkcnNh?=
 =?utf-8?B?MXhMYnRESi9VcFpONncwUHk0aGloTnZ3ZEdidmJnRTl5REpORE11c2gvbVo5?=
 =?utf-8?B?VHZzdFNXVThaZDJqcW1HRFlyMEd2SklMaDdTekt0cDB5VHBoWkVZTU9lN0lT?=
 =?utf-8?B?RjR2VTFONnNTUG1USEtKNElSbFBrUkRzM2UrS2E3R2hxenJqdEQ0Lyt4bnVI?=
 =?utf-8?B?UEZpN3E0ZTZLNVRYT3hOSVdzWitOYUlKd082NTJhOFpBb09PNHRCSDFkRWov?=
 =?utf-8?B?UzkvQWJpSU1HK0QvdDdVOUlqMGdkMUFsK0hueW9qL2xoSnJqVG1mUG1yNU9V?=
 =?utf-8?B?THJLYi83Y1FVekJ2Z3FtQWRXdGs0VUVCQXVvMGR0NHF3SzdYSGNKWGtUU1FI?=
 =?utf-8?B?blAwVVdyMXVncm9TblU4RUdOUStZdCtnQ2UyU0ZLKzlqV3NwVndMZ3JiZC9Y?=
 =?utf-8?B?cXdWeTI5cU9rU2o0WVlBZCtLWnVwLzlaRXczcDJjKzVnRlNpbkg0dFFPRXpO?=
 =?utf-8?B?TGpSWHkyQjc3LzVRWENsQTRrR2ZIOG9iMldnVWZuL0pkcHpZbXFidENETkZa?=
 =?utf-8?B?OHRSLzBMS1pPaFhnWGRrL3RKTWJaRTJpOVZNL0krRm0xdy9oT25jV1hKbVRQ?=
 =?utf-8?B?ZUtxNjhzb21QTG5NeTliSGd0UmMvL241aUNSSHVaT3VSYVlwU3pHSnBtQ1dk?=
 =?utf-8?B?WU0xZk1QRFN0d3dsQXRIQWZrdmVleFlhWWQ4MW9Kc2lTU3FDb29MS2NFM0RB?=
 =?utf-8?B?NUh6N3Rlemc4N1lQOEhQTUU0bjNoRjAybVpmdnp0cXNKa3UzdHpmcUFQajUx?=
 =?utf-8?B?UnRHYVJrSm1XemtlMHF5TjlCMGN3QUF6RUZLSHNqRENyR2l6ZzEvdlFyL1Rw?=
 =?utf-8?B?SWxJSTJwU2hqREU3NnplOE9EMHRmYk01d3YzUWI0WmUzSzdEYkNSZFY3Vkdy?=
 =?utf-8?B?alFiTjBPMHZTWkZqMFNIS3c0aWhIL1g5bnhIcGN3NmJ4WXYzNFpVMlJnQk84?=
 =?utf-8?B?bWs2NS9xZUlHaTZXbkYvaFN6dVZzakEra3krMXRuOU1vdUdpNTZXU055ODR1?=
 =?utf-8?B?YlIxOEszMUp6U05rdXNkYStKN3grc0FNNk9kakVSbWxGbWxDWklwWVJUd1Bz?=
 =?utf-8?B?SXRxeitjektlc2NOUmIrSE9aaW5JbTVOYU13bUNaQlRlUitDL0hhR1BMY1p0?=
 =?utf-8?B?VlY5Y1k0aUFjTEpJYlhjWHZNeXQyM2JDaGhMTDVkdkpqRHplQnhLQ2JYMW5J?=
 =?utf-8?B?RW10eTZ1YXErdEZjUlplLzF1UW51YXpOZ010OFNYZnpkbi93VzVES3puSVFx?=
 =?utf-8?B?c3ppY3RtdUNFUkhXUE55UytmZWIxZStFUGNjRWhyQi84MFgrVVE4eUp1aVNj?=
 =?utf-8?B?R1RjZk1iL2ZHQURqUWZleGt1ZjVhbTYvNmJpdUZnZER1eDNMMXplWXhaTUU3?=
 =?utf-8?B?amVIRnFjOGhiL1J3bUhLZXMydjhvS3RKTklrbG9ya1l0MWNFUEtmTWwyc3h5?=
 =?utf-8?B?Q08vZzV6Y2dNNldLc0h3Q1NiV2RITFpseC9aWmFaUjNMeWNidStxMjNIVUZS?=
 =?utf-8?B?dUZyYXBWcUhpYS8vVE9JdlJMdFpLaHVrTXRheGFRbjJxTE5GZEYxZmNrQVlq?=
 =?utf-8?B?WDJLcHdnQUY5bnEvTUdEZ3ZCS3hqL0VHMVJHSnZ6dXp4a1JGeFc3bGVqRWFW?=
 =?utf-8?B?TDI5WnQvTWFBbFpYdDFrQ2loMTRDemNLU3lZejhwTXdTeGtPZUdpMGhlY3pK?=
 =?utf-8?B?dXBEeWdSWE9DVjd5LzdRVUh2WnJKM0c0VHF6dERYUnVMTXhjT0xDaCtmUzM2?=
 =?utf-8?B?M3czTEpMNmQ2SkRqYTU0Q1BFRjRWd1RCMUZwMFN5ckdDdUhDRWhoZHBkWWRz?=
 =?utf-8?B?eXpPdU4zVUhHU0dsdzRaRk5LNGJ6VTYrL2hUSVB6czZFVUtNT2xwOC9zNWk5?=
 =?utf-8?B?cjhYSUlVRnRFem1JeWZpVk1aeExDYXVlUjRGYklPU3JCWUhSMXNPLzR5M3Vm?=
 =?utf-8?B?NC9ib2Y1M1JtNityemFNbjNSSFNVY2UxWjhTWkRtZkhINk5vRTVaZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b25e4d2-3346-491f-a1a5-08df3a4e123f
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 08:31:49.9208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npjQ2d++y0DPZGOUuqUPfMFYtl4eqlwKtevnkbl/3mzmk6aLqKOusBFIYznAEcM6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB312928



On 11/3/26 19:17, Radhey Shyam Pandey wrote:
> The Xilinx XPS USB host controller is legacy soft IP for PPC405 and
> MicroBlaze FPGA designs.
> 
> This IP core relies on Xilinx Platform Studio (XPS) and the ISE Design
> Suite, both of which were discontinued by Xilinx years ago. Furthermore,
> modern AMD toolchains (Vivado Design Suite and Vitis) provide no support
> for the legacy PLB (Processor Local Bus) architecture used by this core.
> As a result, no new hardware designs can be built using this IP.
> 
> Nothing in the upstream tree carries its "xlnx,xps-usb-host-1.00.a"
> compatible string, no defconfig enables CONFIG_XPS_USB_HCD_XILINX, and
> the compatible was never documented as a binding.
> 
> It is also one of the few remaining users of the deprecated glue model
> where the .c file is #included into ehci-hcd.c rather than built as its
> own object.
> 
> Given the complete obsolescence of the supporting hardware development
> tools and the lack of upstream users, remove the dead driver.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
>   drivers/usb/host/Kconfig          |  11 --
>   drivers/usb/host/ehci-hcd.c       |   7 -
>   drivers/usb/host/ehci-xilinx-of.c | 229 ------------------------------
>   scripts/dtc/dt_to_config          |   8 +-
>   4 files changed, 2 insertions(+), 253 deletions(-)
>   delete mode 100644 drivers/usb/host/ehci-xilinx-of.c
We discussed this in context of Documentation/devicetree/bindings/xilinx.txt but 
there should be one more patch which removes that one documented property from 
xilinx.txt here.

It means please also send another patch which removes this part. I would suggest 
that this should be series of 2 patches. Where one removes driver itself and 
second this paragraph from xilinx.txt.

This patch is file that's why feel free to add

Reviewed-by: Michal Simek <michal.simek@amd.com>

diff --git a/Documentation/devicetree/bindings/xilinx.txt 
b/Documentation/devicetree/bindings/xilinx.txt
index a1a2cde7b7d8..5049af6ff4cf 100644
--- a/Documentation/devicetree/bindings/xilinx.txt
+++ b/Documentation/devicetree/bindings/xilinx.txt
@@ -29,15 +29,3 @@
                 - compatible : should contain "xlnx,xps-hwicap-1.00.a" or
                                 "xlnx,opb-hwicap-1.00.b".

-      vii) Xilinx USB Host controller
-
-      The Xilinx USB host controller is EHCI compatible but with a different
-      base address for the EHCI registers, and it is always a big-endian
-      USB Host controller. The hardware can be configured as high speed only,
-      or high speed/full speed hybrid.
-
-      Required properties:
-      - xlnx,support-usb-fs: A value 0 means the core is built as high speed
-                             only. A value 1 means the core also supports
-                             full speed devices.
-

Thanks,
Michal
