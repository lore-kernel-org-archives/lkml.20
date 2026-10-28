Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793189983;
	b=0ugEK54ssIeQgfN/UBqSt3M2kjF0qCuJ0i5T9tF3RNKdmcNOMhAPtR3rHz/boQSFMfM4
	 SPZHLdNE3GQFl7paUc8e12kmsCkP3yigPZKC4nuFjGI4GyssLB+Qa3Smtrm7YUpwiaa88
	 I1u/ghC83Ewnbq/3sHzn1Q3qhAD63wabQaBcpT97pbJtt6GApagdocvZwQpErT99yz73M
	 UulHX7jwj7H1PHfmXd4JNS/RV2PMEewCNFExJfHQVFIqusVSrehZvz0dBLzFhemg1fBN8
	 1M2qmuYwIgONuMZrEqiTLU28GqBg5Lji1fGZ6LHJYU2CEZJ+R8wxYR/4JjiLpMai3vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189983;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:From:Subject:To:Cc:References:Content-Language:In-Reply-To:
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
	bh=noatuxH+5lH91j/aVEfMVtP8fV9Gyk2BFuAxe6aEhxQ=;
	b=KPhlb7e8RhkJnIG1j3RjY3zIapRRqHN+ggQr9P0HabemfUHTwvzB9SLPbHlSOOaa5c8N
	 CMryDobCjPtjbdECCf9OFV30t+g6CxTwy79sIOHwMV+IoaWtXRXtIpLqJO65KSOS2dClD
	 oQDGBJV9A01GxmnYlqybVuj4WVm+0BrUGQgllE+wBRyZfE+ipAdE2hJ8DqJvBd+0y+LhV
	 MKaF/rbBADQQqUeGXay50jbeoge4+DuxFWTAFOhrrwvWNqLoNA1falySiX32TSKUdsW/q
	 RJ8pv/utWGrnaDp4SOgPl8AThdXUXX+2a8pnnsSxqPcRsbt28NXn//XUyMypOEYVNDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LBmz2ig3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.43
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010043.outbound.protection.outlook.com [52.101.56.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1107606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1107606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LBmz2ig3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=js0l9SFjHotzb9KgppojhiiJcWORGJsHg3HYgMmX4416QCqrsPY/wyUJREEcu7UHyp8uA+Zx6hIaA4ZfxlpKPw7jjQyn9wFENVy6HjwOh5rpQAazAd/CEEIzvL3UjfdVv1lQqDGwBGPsLXfxspr0OgZQMlxsyC8v5YJ6SBoeYy6aMjICpCt//TRV/24UK8Wr0qF5bezWS/CsYdFckBRCnZERGnt8Rwc57QcxuhOYN99v+/aG72bLzUngkglib04omsiwDXBrkKBK0vEsj4GSCT31ZZdlr9j9SLjoqXnJkngQNRScX1ZYavlbbJYzSo8JHwyyPhgyW6M74F0Ez8QYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noatuxH+5lH91j/aVEfMVtP8fV9Gyk2BFuAxe6aEhxQ=;
 b=i4D0Onnts8HiS/Clu00IE0zdC/TyCTck7zbTu9j8LJ/0RhwHdlFYHsA2TEvmXzEMqtkVt9dDhK0sMu9hBUHmXt1tbTbDn3QWm3CCHp9H6vEKqI8719HWUIhM2ouwJIUEklh4j5scU/H/+gFRPRS3qfhSuzjzekse9EvuzwEDXrJ9cyUXVK3QQYB4FQxTeFiRSHv/pa/coFmBHJgOFR4T4KxSDYNxduG0tSa1Kw85mv9xECkiXPCiK7M4S/k9+xrkxwd0X5o5Efvz4bxO9JKMJ4iJ7kzV/dZWe8Tj8VIc4gHMJzMxKO6Kxs6Y3o301gW4VQqjKypiXbv7bSnvgK+nZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noatuxH+5lH91j/aVEfMVtP8fV9Gyk2BFuAxe6aEhxQ=;
 b=LBmz2ig3sXVRWx4C0PCLE9ozegxFVEM7pQaxdpgUB5xhkHeZ+n0ijLv0wCrYrJ6bCbTxg1Fve70FW/D6M+zwwyFFNwNvlgBKX9klpFMpDqbqHyC2bCeMtGaZlFkIt7lTS07dRXjibtK+dsUbUMAp/MmU3XtwYGIiF8t15LOB6TU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5354.namprd12.prod.outlook.com (2603:10b6:408:103::22)
 by PH8PR12MB6940.namprd12.prod.outlook.com (2603:10b6:510:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 12:19:38 +0000
Received: from BN9PR12MB5354.namprd12.prod.outlook.com
 ([fe80::7ae3:c4f2:733a:50bd]) by BN9PR12MB5354.namprd12.prod.outlook.com
 ([fe80::7ae3:c4f2:733a:50bd%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 12:19:37 +0000
Message-ID: <dae36cea-b00a-4b3c-aa79-d82bfbb67f3e@amd.com>
Date: Wed, 28 Oct 2026 17:49:32 +0530
User-Agent: Mozilla Thunderbird
From: "Gupta, Akshay" <Akshay.Gupta@amd.com>
Subject: Re: [PATCH v1] misc: amd-sbi: Fix use-after-free on driver unbind
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, arnd@arndb.de,
 naveenkrishna.chatradhi@amd.com, Anand.Umarji@amd.com,
 Prathima L K <Prathima.Lk@amd.com>
References: <20261026113910.1003008-1-Akshay.Gupta@amd.com>
 <2026102651-prideful-finance-b60a@gregkh>
Content-Language: en-US
In-Reply-To: <2026102651-prideful-finance-b60a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::7) To BN9PR12MB5354.namprd12.prod.outlook.com
 (2603:10b6:408:103::22)
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
X-MS-TrafficTypeDiagnostic: BN9PR12MB5354:EE_|PH8PR12MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b8e229-0947-4ad9-5a1d-08df34edbc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|4143699003|11063799006|56012099006|261022105027099003|261009223027099003|261022075727099003|261022113327099003|261021121427099003|261026121527099003|261026140227099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ctu7iEwWHbT5fyPnjB7lkQNfaI7x8GuOSxApWi7e5nDpUxflYpkuFh4vl23QAUPw93UcNkYr9WfJF2VSD7kDy2TKgWB3xnPA23WpbtxWoKRyLZGJIGwDs2XBcdEKL/4Sebt+apUpmDw8noRRRyRvv+Xe4BSz+FkBRQJQbvO9H/G8l9Z0Ugs/xq8xOxO4RdJ0nOuxA4j9cbXCUAOqxRplR6SGVL7XSjKFCVMWLLcYQRDgSujmUl1KUOZA9oU0qt7p6DTLBE6RBVSDkkcZhbKie36hlZkaDHa5CFZL9WSdP+diOiLFCuqzBgTQJkIRG4Lf90Obaxw76zwDNqLYHq9HGPv8L0xEjfFHj9WBevQuII2VoG8fZ1BvtB7/w5VsFWoRYdGyq6erVZRr8oBMRyqxyXmYYTW6BuOx/GftXyq4ytdCEPM4xfZh6R2vXKXlOgzVRIYVJu54llZ1P8va7FuV0PndL/RCT/NfteEVAqJvp+og/ZNtQTV4zgQmLfr2G6Qo4G0L6PJ93UhQPrj7wUzaZBAPplTDjMCd9oves6Y6bsAy4V2yrrTQGRQlzvN/DYiRMK9MzUnDXc+47+xMrVtfRxWXReuvF5m6sW5XD/mAKffdge10rKUY0a603DQwzithoxcXo0K6OnENHijXbv27d4Rhp7JJe83R3UOQjrRulQw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5354.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(11063799006)(56012099006)(261022105027099003)(261009223027099003)(261022075727099003)(261022113327099003)(261021121427099003)(261026121527099003)(261026140227099003)(261021123027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVp6QktUeit5NDR6TWJ0eUhYVWEwcE5Gb0tVYkRvcEo4SG9aNnZRUXU0OHJp?=
 =?utf-8?B?TTBhQmt1Z2U3K1hTYlU0ODVueElYemRUdGV5b25ON2dwTWtlaTNhK2ZpdGQw?=
 =?utf-8?B?M1R2L3RpWFp6TDIrQlEzdFZWNTk1N0lhYmN0K3BxSGkyOFRtWDQ2R1RZSm0y?=
 =?utf-8?B?TmFIUGZ5ZWVZaUdsVWk0dUJkOThBd2IxN29mU0l5UW9VUTlvQWZSTit1TVpi?=
 =?utf-8?B?NzFPZEJjY0xjZEVNTC96aGpGTkVPbGRteW5OZHZ2NmVRSkpseEJEL0hqZGpU?=
 =?utf-8?B?Z2VHNW9qaVNhWm13ZWNCQXB2bnNIbURLZEszRTFaVVpqNXBwZ2RQeVV3QmFW?=
 =?utf-8?B?QjNwQ1RETktFTk5ES2NJbXBpc1J4QUp1SkZTL0U3ekZHS2ZXN0ZLTnlzM2Zt?=
 =?utf-8?B?YnhFQkpqRDZwRUpzWmh0RDhDWWF2SVVsODc5VEM2N0xqZ001dEtVc2xubk5P?=
 =?utf-8?B?VEdQWEd3Wk43RTFma0J4M3Z6T29hMEVGeHVmc0U5aWpldnVLSHBiempXRDg4?=
 =?utf-8?B?VlJRcjZ4WmpRNkxSc3N1YXNPRHBoaFBWWFZ3akVkN05jWjNaRmFDTmd2WVUv?=
 =?utf-8?B?L3hLeHhKV0NvV0hvdElTZld4YkFWNFIySXBCeGd4ZEI4SWJEd2E5U2ZPRXVy?=
 =?utf-8?B?aFJIS2lTNzB1K1o0eGYreTBNV0NsOUtkeGFWRFNEMWF3TXhTL1FPMGhQai9n?=
 =?utf-8?B?aUFNa2NQb3RUellLckNhTldDM1JpanJidVMwMjhYOEZTeDhRNnNwU0dNUUhD?=
 =?utf-8?B?SGpyVVIvd0xOd0F6OURCdmRmdFdBSUY2dkVUNHpVdzVUaEszYnZDbDdYc1NI?=
 =?utf-8?B?di9CTEFhSEpZS0ZPSkgzNEVtamF4VFdmZ1hzT084bnBmRmJqeE5VazN5cjc4?=
 =?utf-8?B?Rnd2OUhVZmVPSC9FVmREQmlpUmg3SjY0QlplZUVYYVRleHd4azZDMmZ4U3Yv?=
 =?utf-8?B?TG5DbjcxZEZ4OHlpSEhPZWQyUWJPVmljSlhtUjNzdWphT0twNEgyTHp3eDZ5?=
 =?utf-8?B?OG1pQnVCZ2RPQU9UMVNLdHBSV28zYld1V1NxUGRoSCs5ZDdnekpna3U1L1BR?=
 =?utf-8?B?SHIwS0JaSG1KaDhROWtobHRmaTRQNzJLMWozZGdSUUpkUWp1L3JIUlREQVI4?=
 =?utf-8?B?aDA0Szl3NXkyYU1ONE5rZFhTV3p2SnFsd1NpUEc1QUppWDhrREQwMHpyYlpx?=
 =?utf-8?B?MGhEenI3cUxFYThjZUJTWHpnQjVMVUNvc0Q0S1ZVTG5IbnQ0V0UyM3BvaXNy?=
 =?utf-8?B?UkJuRHA5WGJML0wrNWE3cTI1WmJlMWpDbzNMTlJVNlBjRC9JWVpDeHQ3cEJX?=
 =?utf-8?B?ZDFLTVBBQTE2TW9zWDY0OFBpdCtCVXo4OC9WZlBRb2pmUVVOM3Q3TkE2TmFB?=
 =?utf-8?B?N0VHTGtmWThMbjRNSkFSM0pvMUk4RjBqblZuMjFQNE5tSnFCT1ZwM04rU09O?=
 =?utf-8?B?TXJPdGcwNlY1bWhCRlJjZHhQNHdVUEo3RGNvNU1QWU8vaFJ3SEd6b0VEUXNr?=
 =?utf-8?B?NW12ajBoNklSdWJOb24yM3BTMjYrYmpYL09LMEk4amZXZkI3WndJaklWbkJo?=
 =?utf-8?B?M3M1UWU1d3llWHdyQUxKYkVJNGJkckxhTHNxUzBzT1B6TXJsODJIUGtUNkR4?=
 =?utf-8?B?b2U5WTJ1cGZ3dnVrUXNHRlJmSE1wd1V1d2tDV1hPUzM0Z2hkcnV6Ry9aSEhY?=
 =?utf-8?B?MjZ4TkNvR2s2Vkg2NlBHeDgzdzZHRlQ4emRXWllvWFJjL3pWWS9WVkt6VlBE?=
 =?utf-8?B?Ry9VTU5DZkdrdHRDZmZUU1pCTkFkbDVmZFZ4dkE0bVYwYm1YSGxha1JBbmd3?=
 =?utf-8?B?dXdONy81TkpyeklhODhzczk4amwzczZTMm5ieG9lbmRKVFRpMWdTWWc4aHNH?=
 =?utf-8?B?UmJvTDNBQTJjYVpMSEErQUF2b05SaDdjdHh5TmNabE1PRXlTb2t1cmlTRllF?=
 =?utf-8?B?bm84a1NvNUljc2N4MTJIbmJQUDhwVkZ4citBeHdZUjRkdmZVNlNXcWxsWW1h?=
 =?utf-8?B?Ujc4WTYwUE5qZ1oyakxtWnhSOUFTUE10VzdaQzdiUnJBYmFta1lvTWhXY3VV?=
 =?utf-8?B?RS80MnhyWTJCVkNtd01xUW52cjRPdkNSOU9tdGJLc2YvNTIyNVJ2OGdKOUow?=
 =?utf-8?B?b1gvd1IzTHZGRjlaSk9ZRUxBMHdPRm1MaUF2bzJsZ2Vrd3hWdEZsVGUxUU5q?=
 =?utf-8?B?UUVjSkc5SlNnVnFlc0lJS29tMEUxSWFvZkplZlNlVkljY3JMQWdXRkpreUVP?=
 =?utf-8?B?WjY3NGNTSlZxVkpCWEtrUjRxaXp3dU40cHBFUmJVK0VVZS9mcG0rUEFMd2pn?=
 =?utf-8?Q?fdacRJpd1Y1Vz/fW7U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b8e229-0947-4ad9-5a1d-08df34edbc21
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5354.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 12:19:37.9242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyFQFEHkXb1O37qyUAzq9FJJy+BE7qaCXRNhCKJZKQxqvVDY2kOTazEVg2PMrkNk5esCRQNr7LVOpIi0ExPI0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6940


On 10/26/2026 5:44 PM, Greg KH wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Mon, Oct 26, 2026 at 05:09:10PM +0530, Akshay Gupta wrote:
>> From: Prathima L K <Prathima.Lk@amd.com>
>>
>> sbrmi_data was allocated with devm_kzalloc() and freed at unbind while
>> an open /dev/sbrmi-* fd could still reference it, leading to a
>> use-after-free on ioctl after removal.
>>
>> Refcount sbrmi_data with a kref: take a reference in open(), drop it in
>> release(), and free the structure only when the last fd closes. Mark the
>> device 'detached' under lock when the misc device is deregistered so all
>> ioctl/xfer paths return -ENODEV. Move misc deregistration to a devm
>> action and drop the now-unneeded i2c/i3c ".remove" callbacks.
>>
>> Fixes: 35ac2034db72bbbc73609aab5f05ff6e0d38fdd0 ("misc: amd-sbi: Add support for AMD_SBI IOCTL")
> The documentation shows how to properly format this line, please fix it
> up, and don't put a blank line between it and these:

Hi Greg,

Thank you for the feedback.

Will update the commit message in proper format.

>
>> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
>> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
> signed-off-by implies review.
>
>> Signed-off-by: Prathima L K <Prathima.Lk@amd.com>
> Wait, this is out of order, yours should be below this, right?
>
I will drop my Reviewed-by, and fix the order
>
>> ---
>>   drivers/misc/amd-sbi/rmi-core.c | 54 +++++++++++++++++++++++++++++++++
>>   drivers/misc/amd-sbi/rmi-core.h |  6 ++++
>>   drivers/misc/amd-sbi/rmi-i2c.c  | 54 +++++++++++++++++++--------------
>>   3 files changed, 91 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/misc/amd-sbi/rmi-core.c b/drivers/misc/amd-sbi/rmi-core.c
>> index 95c9109101b5..e77f114c16c6 100644
>> --- a/drivers/misc/amd-sbi/rmi-core.c
>> +++ b/drivers/misc/amd-sbi/rmi-core.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/regmap.h>
>> +#include <linux/slab.h>
>>   #include "rmi-core.h"
>>
>>   /* Mask for Status Register bit[1] */
>> @@ -193,6 +194,10 @@ static int rmi_cpuid_read(struct sbrmi_data *data,
>>        u16 thread;
>>
>>        mutex_lock(&data->lock);
>> +     if (data->detached) {
>> +             ret = -ENODEV;
>> +             goto exit_unlock;
> Why isn't a guard being used here instead?  Then you can do a simple
> "return -ENODEV", right?

The existing code in rmi-core.c take data->lock with mutex_lock() and 
release through mutex_unlock()
The new code added as part of this fix patch, follows this so patch 
stays a lifetime fix.
I can submit separate patch converting the mutex_lock/mutex_unlock() to 
guard(mutex) after the fix patch is merged.
Let me know your opinion if you suggest to submit the guard_mutex() 
patch before the fix patch.

>> +static int sbrmi_open(struct inode *inode, struct file *fp)
>> +{
>> +     struct sbrmi_data *data;
>> +
>> +     data = container_of(fp->private_data, struct sbrmi_data, sbrmi_misc_dev);
>> +
>> +     mutex_lock(&data->lock);
> Again, please use a guard.
same as above.
>> +     if (data->detached) {
>> +             mutex_unlock(&data->lock);
>> +             return -ENODEV;
>> +     }
>> +     mutex_unlock(&data->lock);
>> +
>> +     kref_get(&data->kref);
> Are you attempting to use a kref without a lock?  That way lies madness
> and is sure to be wrong.
>
> Are you attempting to keep the data "alive" somehow?  Are you sure this
> is correct?
Yes, the kref is there to keep sbrmi_data alive. kref_get() in open() 
does not race with the final put. misc_open() calls ->open() while 
holding misc_mtx, and misc_deregister() takes that same mutex. The probe 
reference is dropped by a devm action that runs only after
misc_deregister() has returned, so the object cannot reach zero while 
open() runs.
kref_get() and kref_put() are atomic. I will add a comment at the 
kref_get() saying this.
>> +
>> +     return 0;
>> +}
>> +
>> +static int sbrmi_release(struct inode *inode, struct file *fp)
>> +{
>> +     struct sbrmi_data *data;
>> +
>> +     data = container_of(fp->private_data, struct sbrmi_data, sbrmi_misc_dev);
>> +     kref_put(&data->kref, sbrmi_data_release);
> If open is the only thing that can get the reference to the kref, and
> this is the thing that drops it, why is the kref needed at all?
open () is not the only holder, kref_init() is the reference owned by 
the driver binding and a devm action drops it on unbind. each open() 
takes another reference and drops it in release().
sbrmi_data is freed only when both are gone, which is what closes the 
window where devm frees the structure while an ioctl is still using it.
>
>
>> +     return 0;
>> +}
>> +
>>   static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>   {
>>        void __user *argp = (void __user *)arg;
>> @@ -570,6 +622,8 @@ static long sbrmi_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>
>>   static const struct file_operations sbrmi_fops = {
>>        .owner          = THIS_MODULE,
>> +     .open           = sbrmi_open,
>> +     .release        = sbrmi_release,
>>        .unlocked_ioctl = sbrmi_ioctl,
>>        .compat_ioctl   = compat_ptr_ioctl,
>>   };
>> diff --git a/drivers/misc/amd-sbi/rmi-core.h b/drivers/misc/amd-sbi/rmi-core.h
>> index 975ae858e9fd..ae084beb6c03 100644
>> --- a/drivers/misc/amd-sbi/rmi-core.h
>> +++ b/drivers/misc/amd-sbi/rmi-core.h
>> @@ -9,6 +9,7 @@
>>   #include <linux/miscdevice.h>
>>   #include <linux/mutex.h>
>>   #include <linux/i2c.h>
>> +#include <linux/kref.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/regmap.h>
>>   #include <uapi/misc/amd-apml.h>
>> @@ -56,9 +57,13 @@ struct sbrmi_data {
>>        struct regmap *regmap;
>>        /* Mutex locking */
>>        struct mutex lock;
>> +     /* Reference count; keeps @sbrmi_data alive while misc fds are open */
>> +     struct kref kref;
>>        u32 pwr_limit_max;
>>        u8 dev_static_addr;
>>        u8 rev;
>> +     /* Set on driver unbind; open/ioctl return -ENODEV afterward */
>> +     bool detached;
> How can open/ioctl even run if the driver is unloaded?  You aren't using
> the cdev api properly I think...

This fix addresses driver unbind, including unbind through sysfs; it is 
not limited to module unload. misc_deregister() removes the miscdevice 
from the misc-device list and destroys its device node. Although it 
prevents new opens, it does not retain a reference to the driver-private 
sbrmi_data for files that are already open. Such files retain sbrmi_fops 
and private_data, so a later ioctl can still enter the driver.

Without the kref, unbind cleanup could free sbrmi_data while an open 
file still refers to its embedded miscdevice, causing a use-after-free 
on a subsequent ioctl. With the kref, unbind marks the device detached, 
deregisters the miscdevice, and drops the probe reference. Existing open 
files retain their references, and the object is freed only after the 
final close. Subsequent ioctl operations on those lingering descriptors 
observe detached and return -ENODEV.

>
> thanks,
>
> greg k-h
