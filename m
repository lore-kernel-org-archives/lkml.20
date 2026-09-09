Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012071.outbound.protection.outlook.com [52.101.43.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A2D581229;
	Wed,  9 Sep 2026 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788969304; cv=fail; b=G3qhb7fc7eyFCzOw8VRyEFwnHf+YrcBo2P04gL5j5JIoB9LJDR3iyWsMWXzowe+HPHhe+JXJIiMY3v9StsRh+BeGxZMfy0PRL5NDIPI6WOviixjRS7dUVRkjZtCjjUsUC4FrQTe3xz/88yeTUEA+djOKzjn9ebO9BTss2y2WNQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788969304; c=relaxed/simple;
	bh=WJyUYFYfF7JD2cXgKMznWDMGIYDjW3F8gMG49Ijags8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IaAACbnXfrW0FPL8OgDeVteHCNlPC9FW9cifgicH+4KoqXJzi/+KtmAcz69Br0mxshZh1wnxWZeFc89zi67SNk7uAjN4EMzQF+zJbiMYaEp6ioX3+1g6oYaelJAldHX7IxHNi5Cu0yB1Eyo+geztbjmt2O3JgXoo3fto7iypabI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tbJd8b34; arc=fail smtp.client-ip=52.101.43.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tbJd8b34"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cP9ej9XjJvfiCqB+HhqUEiileSXg3p7eeKyXQFqNdfRLDYLPTWt9+zNOA2RCzkJJdLWGOfHUoccXFbgygxR03i36jykac3zS7KURSDMCXP30kTsuQHGrGBZPfRW7EWYkMqYKBTrip7zuNEGO8FfJWiALItjxZovAQBoNMWCrBns9C6+m3vvZoBGCmvfsLt97exAomvX6f9RPfM1WyZIYh7rwFSCOEnzCJBqvbgM63seisc0PPbgUql+IeacaF9iXgDyg++Zp2TOqym7ak/iqicLaq5S8nKbtcMBRjF+awObraO7Ge2PMEXEmajbxT7Q1J48c43txCjxBBMItZYfLbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxzvUgPueOb0eyswU0xaB9zEwoUujQV6Nvt2wHUAKxU=;
 b=YvoNL2YZ3kacqb3IR3qBUBsmmbBdR2V4vamw5jopPLzgoFZXNzLeV4I2tM9itTaj/pkgfT/kV5x5iYOaX8LfBymXrkqWidBRwzQbkqRe4Yt9M7/XGVffvjv2GY/nfd9x0P/+6jydjsduJBPoqOQgalYOWQ8uf82fWPYl6Q5oCyyXq2wpclA1NkYSjr6gxxA8rPUR5Fp1qje2nX0MHMuFdNmrOOTRsSJjl7co6whITNfms2rE8PqpLuzwnMB5QmUVqNuBGA7Ixo476dA7W6N2sjRfd6F+kyQ1W0ghTErKxnXnoVLAie62Gp09FQh0Zx2kVY6SLM1+aSGPOBw39xux5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxzvUgPueOb0eyswU0xaB9zEwoUujQV6Nvt2wHUAKxU=;
 b=tbJd8b34nvHRYw/nnV3DLfDGle6prdSBftNtObF0Q4372b1q3bEhftrENzcKVR23K43UoxC1kP5S0ZzA/oVa/EOPf70Ssm8ie3691Kpyu55bNN9ytt9WLMNoRTnAnzbAAi1VL0WZ3tUo7F/n86sA8r9qKe5gLjyMofQKm0xiVO9S3G+NQr8qiYphRw0CbGaXniSHOnD+5nSOmdjW4Vqy0apKG28Km0f2nCSPpOjEaiiVQGi8Ct6j/uo0bUNWgctP6ev5KJs/QInQKLESdWROPDsy8JCPiPoU4x4igMGZnp+hWIc3ExpZYZy1SqY9MSI+i/zNMXaKBoMok7Bry1tSpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SJ2PR12MB9140.namprd12.prod.outlook.com (2603:10b6:a03:55f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 15:54:56 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 15:54:56 +0000
From: Zi Yan <ziy@nvidia.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 "zhen.ni" <zhen.ni@easystack.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
Date: Wed, 09 Sep 2026 11:54:51 -0400
X-Mailer: MailMate (3.0r7028)
Message-ID: <22D1EC4B-FBCB-421E-B8DA-345B5F3505FB@nvidia.com>
In-Reply-To: <b8e23456-00af-4097-a769-210a087d2b90@kernel.org>
References: <20260907082620.2083838-1-zhen.ni@easystack.cn>
 <79548641-25f3-4ec3-a549-782fad168962@kernel.org>
 <6e8bfb0d-d595-4e6b-9536-0323ada57e25@easystack.cn>
 <b8e23456-00af-4097-a769-210a087d2b90@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MS-Reactions: disallow
X-ClientProxiedBy: BLAP220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::17) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SJ2PR12MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f6e43f-0234-4e76-b05d-08df0e8ab1ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mugjU9ah/DpZgficRt9JAHGUbcTHrQhB9mEYiloQ59JuPvE0IFDKgiSBCoaZZbIKbYOyfz5Y6Fzrh1SxDdHtqxWPOFQ4IM0e49fZyk72B+KdL1xqDia6HERtQVg1mGUffGSyxcdrAIK37LOnldq/XRoQli19nPN1ZnOzRSvYrl0UO8DXO/uXEWMt8mBCemnorfN+bBcnvvWnRoEwJqaemJY3Tzq/IvhJSnWroYdN7TZ8s+gHbMfLqob5Q0xf3W3LOFbrjd21joyOazVzwYru63BFvkaGSbPWoz41tIt/wZi9n/HJkVjFsznhTIWZxNEhihah4Sg3p7bOtrPyGtwnyCqm2ZbF55zeAA31tkauHqzEgMgRsz1wRCwOXjefzvO+VKdNYbraYDzY3OCsbD04YCMq6cIUrA/TbnNYZGa6C9b6aQqmxGYx6cIoP86Fqbk4Xr6eYRHsmOsYfp53bfF445LzrgkuPGHaeY2hURdq06lmqXgQGv2p584SpeZhZtDNDPE+abeLvjVT60cJqVBNlJiKMIbUhsu1jNQWK8GgDKXmmb3mYJuO5rN1XsaiBkKmdtb+SffE3M5u9fsXLOd3hdZmItAJKKUivlZKg3+6uW1/7Iljgl47Bnl1yKxHu3c62cpOiUo5rSOggJaLTnyaCJmcLjtd/GcNm/rxCoGdcHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUVBOUdEVHBKY0FURktRZ2ZKMjFlYXQwUkx1T1JBaEtMQ0JQRDV0aVFTMXpP?=
 =?utf-8?B?UVR0V1FQSXRCVzE3VTZKVGVaRGwxQ2hpdE1uVTAxTUUrWXZ5NGF2ejRIeU5G?=
 =?utf-8?B?bUxoSU0zNWpuMjZIeElidEltY1RycS82Q1hOQ0pvQmZHNjZ6dUVhbkpQazlM?=
 =?utf-8?B?L3dJWXFvbDVia3pkZFR6Z014ZW5RUXRmWGcrZ215aDNQZ0luSTgrWTQwcnpL?=
 =?utf-8?B?WDdoUWpML2VrQzlUVERZZGR5Wm9kREk5V20zRDVuNVo5Z1MyTEk3MWw3cnd6?=
 =?utf-8?B?djhyRFh6N0N5TFNvZThqWXdFU1cwZWNmdjdGK2VQYzk3dm5UaUNmSG44UUE0?=
 =?utf-8?B?WGpMRU9WVnBLRGpxVnZqN0JzR2hoT0Y4M005QjFyMXRyRE5SeE5SYzkvVU43?=
 =?utf-8?B?aG1YNmJRV2ZSRzJ4TlNXdVh6M2Z2dFZ2OU9LVlhzMmpsSFIrdmMrQ3FoUGNQ?=
 =?utf-8?B?WFI5QkNQLzBmdWJBQlJtK1hmOEorMzNsaEVlUlA0S25SdDFTbHlUN2FpVHdM?=
 =?utf-8?B?SUlycUJXOERzamMrZitFSlE0UU9rWk5VYTc2VEdHdTRBUEl4VzVDUDZUVjI1?=
 =?utf-8?B?TWl6ajlJLzB6K082NWZOWVVwZzVjR3J4Z215bGl4YmJQZGdiUDkxT0JlaTY5?=
 =?utf-8?B?RC9jTlkwK1h4NUZPUUkzU09nYUZvL2plaEFId2N4dEcvcEI5R1RieEo3WWVN?=
 =?utf-8?B?REtHa0wyb0puZkRQcWF0R09LMmhsYTdLbUw4R3RDdzk4N3NKMjdicWhjUGJo?=
 =?utf-8?B?eWZZRGxoMjJwdzlKd3ZxdjdRSmF3bGNENUMwdXQ0cHRHOHVBeW9LOVFFc1ZU?=
 =?utf-8?B?cnR4WUNtVXhzMC96R2c0V014WFRBMjV0RGpBYWdxY3JRTGxWYlpUaldVWmQy?=
 =?utf-8?B?UmhmTTZ2R3o2RkYvSGkwelE4eXdkeHNvMkIyK3FSSGJEZ2g3cXg5N0V6Njli?=
 =?utf-8?B?UWJFQkNlR1pJQi9SM2Z6cnBaRlc4cXlidk5rOVM3d3ZJUW1iNFRRMTh0UTYv?=
 =?utf-8?B?cVlNYUpkYVhaaytCYm9NZnIvTWRPK1M0VFRSZTgxME4rQjBQWGdMeEhka2Nz?=
 =?utf-8?B?RzNzaEdTVk82R01YMHhsenh6bDJTS1h0SkJuSWlQQm9kT0NnR0prbm9CdzNv?=
 =?utf-8?B?azdZbUhqZXZ0aUpoQnBFd2h1dXFhK3pOMnc2TkFkdEluTTcycFQ4K1h5ZFBZ?=
 =?utf-8?B?WStaTHlzQnRod0QwZFgrRFhBOVVEOENkU1NXOUplUGhZa0dSVFM5aEk3aGhH?=
 =?utf-8?B?K1pOT0FFcGRBVXV0R0ViYXd4UmNWQTNuYytFdDBtRE0rS3FOODZSSGk1cXJZ?=
 =?utf-8?B?NTBSWHZ4NXNuWFJzRlJVbllzUWtJTXdtNmxXR1NWckVIWEZWYVZUTnprSGxy?=
 =?utf-8?B?UC9NUm9jZ3JRWUgra2hiR0NWdzB1bXBYSXBSK3NaOUZjMzB1TXU2TzBQZFRE?=
 =?utf-8?B?Sm5HMitoQW5NVzRpUDlHWGkrOEJNYnIvZWcrRVM4bFVJcTl0MklTNHNNeFJ2?=
 =?utf-8?B?cXNGblpmOWkyK3U5ellFOVVZYklSN2xRNWNqSU02aFkwWXBMQnowdG5KWDNQ?=
 =?utf-8?B?UWVWMFRhVUQ0V0JibnpDQlJtdzR2OFU1aG1ER1k4SGZEK1V6OHQ4ZXBCKzE0?=
 =?utf-8?B?d1pnTSsxMDNaUkw0MzdQUzZ1ZkhnSGQvbmZwWXBaUUhoOEh2L2RJMnJWQWx1?=
 =?utf-8?B?cWo2b0ZwK0U1OXlxTG8wQU1CdWYwaG9PaGFVSmJEclA1V25wVHNPZ3RwSVFY?=
 =?utf-8?B?Qm42WWVEYXF4d1pmU0VRVmE4M1FBd2kvdTd6ZFkrcWFrU2dOTGxvYnRnSnho?=
 =?utf-8?B?Q3dlQ3RBYzNXbnhoTE1Wc2dqdFB6NlFKSDFYYjhobk1VYnNwdkNvR1FxQ0JH?=
 =?utf-8?B?b2pwd3lsVlJ0ZHd0VExEaEdzWWVFa00xaW9QSVB2dkRFQ0lOY2RsbkhURjJX?=
 =?utf-8?B?dmtGTDRYQ2s3SkpISU54bGtIa1hWVlh5dDVFNTQyN3BTMzBlUHBZS1VtdGF2?=
 =?utf-8?B?eGYvMkJtWFYrYk1WaEw5Wnl5OERUS0c1c3dXSTdqKzRoblJUSTRaVGxmditv?=
 =?utf-8?B?Q1dyclo0UkRtNmZWZkNLK1lFbFJWVFZmMmcyWm80S1hoSzQ2YzRqODBOek05?=
 =?utf-8?B?dkNJcjRMNjN2ckxGMEJjSlEzOEF6TmtEd00rZlZaRTQ4MkhUaWNKYk9PWklT?=
 =?utf-8?B?M3diV1BIRmpvU1VuVHNyODFkak5SbjlsRlcwcVZxb05HRWNrNEtYS09Ca1FO?=
 =?utf-8?B?cGYraHFjYVpGZmFsM3l3SkR4UFdKc25KV08vT25xRHpXKzcwK1NSRnV6bUlF?=
 =?utf-8?B?cXorekFHVGZWMWtkK2FKY0J1NStIdWI2MW1OK1FQRW5SSFhMbCtVUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f6e43f-0234-4e76-b05d-08df0e8ab1ea
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 15:54:56.4262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z6S8cFg9hAJy8yvYerFHB6HS8PVJK+XdJUPY6XGR+a+V0Hiou/stMFeiRWjkU/tI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9140

On 9 Sep 2026, at 6:28, David Hildenbrand (Arm) wrote:

> On 9/9/26 04:35, zhen.ni wrote:
>>
>>
>> 在 2026/9/8 22:30, David Hildenbrand (Arm) 写道:
>>> On 9/7/26 10:26, Zhen Ni wrote:
>>>> This patch series adds process and memory cgroup filtering support to
>>>> page_owner. Following the previous series that introduced print_mode and
>>>> NUMA node filters:
>>>>    https://lore.kernel.org/linux-mm/20260707115411.1714314-1-
>>>> zhen.ni@easystack.cn/
>>>>
>>>> This series adds filtering capabilities to page_owner, allowing users to
>>>> filter output by specific processes and memory cgroups. Users can now
>>>> filter page_owner output by PID, TGID, COMM (with wildcard support), and
>>>> memory cgroup path. This makes page_owner debugging more focused and
>>>> efficient for tracking memory allocations in specific contexts.
>>>>
>>>> Targeted filtering provides significant performance benefits on large memory
>>>> servers by reducing both execution time and output size. By filtering at the
>>>> kernel level before reading, only relevant page allocations are processed,
>>>> dramatically reducing the amount of data that needs to be handled in userspace.
>>>
>>> page_owner is used for debugging. Why do we have to add kernel code to make it
>>> faster?
>>>
>>> How much faster are we talking about?
>>
>> On my VM with just 2GB of RAM, the raw page_owner output takes real
>> 0m6.178s. Filter it down to PID 1, and it drops to real 0m0.286s. Handle
>> mode takes real 0m0.938s — roughly an 85% speedup. I've also tried this
>> on a 1TB server, and it's very slow. The numbers would look even more
>> extreme.
>>
>> You're right that execution time isn't the main concern for a debug
>> tool. But that's kind of the point — I'm trying to optimize the current
>> execution flow of page_owner, reduce unnecessary overhead, and make the
>> tool more user-friendly (especially for servers with 1TB+ of memory).If
>> the user only cares about a specific slice of memory, why dump
>> everything from the kernel side and then filter it all over again in
>> userspace? Might as well filter at the source.
>
> Because it results in less kernel code  :)
>
> And less kernel code is good. Unless unavoidable.

An alternative is to add BPF hooks like bpf_iter to do the filtering
and by default, when no BPF program is attached, everything is printed.


Best Regards,
Yan, Zi
