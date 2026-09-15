Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010069.outbound.protection.outlook.com [52.101.46.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F8A318ED2;
	Tue, 15 Sep 2026 01:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434698; cv=fail; b=TvJCVKX8xpUTKEZ04kD161GLp2heqRIxWBMYSezgUwUEmrNOmgMAFNpTfdG4EcI5c29XSkVfo8MZ9Q5sZArJSrFOWkKCaDTWroev3iaDY9yLN1CM5fP81ljDnVgmSFwC+gXxTYUr4S9IHplV+VwPUiyVhm2n9IgAmlZhcYjXD0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434698; c=relaxed/simple;
	bh=n2JnZnGc7/aVksCGxsj4jn1PnVyq02Ee03wm95gazT0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YRTBB5WeduS/zut7tdLZzy5z3ic4IbNs04NdKAKa8h598lYYNdmrQJOmzKfjFHYoWqEwWcQkxTLlaq/22syCoB5Xtq4GHFfYZ77S4vt786PqSzPL+3OOidNy83zxUE0zYNhnwuPulmVFf3cfsUBFG3J6LyuO+BgjMMp5j5OJMZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GJAsAOTu; arc=fail smtp.client-ip=52.101.46.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GJAsAOTu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvaU4q1KwZMlVaxYCtEQfelottroxdQYUxNOjnM8hT/n/i8JBP/4t6SedCL5+dmsHEFj0gY2Q4RyNQp+EKfu0qZup42Cwj/CzTDRi65ENVH0LHH5jR1pPZ9osM/Y95fvoEQdbdI8isIshNfzcJLIbb1ne7wVuV7+o3UwxUptL0ZHgXz1kWpV0LsIKkM/XjECU5YD9PWtBHFpcfPZUY5Rerv8mT/nXsq6YQsLKjeUTe1TAo8Xm+mkzCHk53w03vntv8KRcPLgriid5QNqQ3SJOeCTx3RdZN3+iINedftUrcXz/EiQtAtKQnI7fz9znFcEPdYpnOfDLDRIR5TJue904Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9jeIQ6pJppzZe5QvjKOwlARQizRxBE/cyoW/8dt5mtI=;
 b=DJicLi+RosmuT4y8NEOST/Vtj/srGwkQ83d4ATJ5WlALmLPtxEynmuYN3URbwNhvdFdQGDvu/GQ+fMdUlAMB2/DFo8j7Qfc9nusnCQWst5yDSjwFjBJI9s5o6VuwGnDNjuxtk8tiHehS02kOGJuPE1koT5UAVmuqxdLTAQ6FFlXs5G+6ByEXb36qwpdF4xzRLbIH/Xg8GDTEzbOdGIggwPdrNXc3DmVwYJBIXCbJpxVAzrNlEb2JZlUOXnv/dWN9fLnmjuiM14ZLgdqLAqMeGBQjyaERsGvSMoVHq9oVCfgTGAzlvlu9N+Y9yDZx3wRKAYo9HeG2cvRG/Gd4N+XbfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9jeIQ6pJppzZe5QvjKOwlARQizRxBE/cyoW/8dt5mtI=;
 b=GJAsAOTuwzkPJLBajBMqHvEr9DSHGcW/IdeNJjx3e/K8KIImcjEhJwkcTNUlOM0JFHUlaa3nhCMJifWDS6CP1hpchWlzy3hABFGXmXnkUKdAFOp9r2Vuyv1hW9PDFKiBgzlSaSn+ZLa7PHroX99PZwt4HMs5oqcfe/vpXO1Pgic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by BL3PR12MB6570.namprd12.prod.outlook.com (2603:10b6:208:38d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 01:11:30 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 01:11:30 +0000
Message-ID: <02254e94-35de-406e-a40f-f2a566d1c4ec@amd.com>
Date: Mon, 14 Sep 2026 20:11:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/resctrl: Keep mbm_assign_mode in default mode
 at boot
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, tony.luck@intel.com, bp@alien8.de
Cc: x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <cover.1788545152.git.babu.moger@amd.com>
 <176d53626058ae97c4003f77ff47371628da9f1f.1788545152.git.babu.moger@amd.com>
 <69044bcb-e606-4f7c-be83-2188169ddb51@intel.com>
 <e5d60b04-6bd4-49db-aee9-49983be17c71@amd.com>
 <5e8c02f6-4352-42e5-83a8-f6d589278568@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <5e8c02f6-4352-42e5-83a8-f6d589278568@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0163.namprd04.prod.outlook.com
 (2603:10b6:806:125::18) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|BL3PR12MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: 51eefc5d-0e15-45f1-8edc-08df12c6461f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|13003099007|6133799003|3023799007|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	M9Eh5Igt0cR0PUhvVcwotJg09ZlZjrtDmODOeAwUjUU8kUiyjTUr3rwx0TiHAMrNCr3hN2kbWRoC+KcszyAjTZJXgqgalCXZPaceH3JJHlXgGjuqB4kOImV8qBxyByq8N/eAf+g7SXefaSg/hjlykge47O4a8ykX3Tg2K8hi7/hnPHo0ZO0r3fF61IRPzx/40ZtAnPIOfvFBsv16yyxqfBH7qoG4xuGFr2NDiA4AVIZZczhyuoQfI976KJe5CzGU+FLY8Fd4kxkOJ4Kgz3b06WLM8bWCn6Yqfy4+0UkcsyNM4ThxGIq0NiMQ1+ML2JtiZUqFSRDcB44wTfUZXgN5I/L0tsO/MS/EeXemV1xt49BVtaZUT9qP0DPIXrxkIisjkaoWe9fCgDz/ZIDeGxZCIhmFeRZqCb6tXVQ7nsoEtK3YClZ+h0eniF7CCTMQTSAKHcFOidaURypG0wlDcik2TAR2ZtrsI8AzXjt3LPSpUv26XdgtNy8+2clp3Aze2AVoE3MuFM2gETZ044xpPzXyaL3xD8tLKYg2pJGM62SP9KKcWpqNTBLR8lpVMy9J5RfUsD38SPhe7qTYu15NcNz8EZZET2JI3cgKtOJc47fgKCP5j4gT0SVZGWP0jtOY9wDRRGv10dsd/HSPG8afqwoBKvK4U0KfGhUP0JyG66LlNQE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(13003099007)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnRzMkhQVjBYd0NxWGJ0T1Z6bm91U3c3Y2Y2QjBPZzJjVXBnNVdCdXQ1NHZo?=
 =?utf-8?B?UHFWUkUzNTNWRVYwN2RNeVdWKzlldXMwNkVyNDVRaDhNeTVwTzRtVW1xMlhj?=
 =?utf-8?B?aWFBREZYSDgvbEpzK3F4Z0J6UU16ZkkvMzQ4MnBsbzNPTDNBUWxzTitrUmJy?=
 =?utf-8?B?VjI2bjUvWHVlZitnRVNVZzhLN3hIMHQ4aU0wQnc2d1Z2Z1BvcGx6dWdMcVdR?=
 =?utf-8?B?UEh1dk9lVFRsb2xBa3ZHV1V0NFlOY2hSTkQ0dWg2cHlUWmh6cWUxZWM0RFNw?=
 =?utf-8?B?c3Q5aWdiVWZFT1RPRW8vTWt2UDVibkx1R0hpN2NIRTI1VldsTnJhZjcvaDV1?=
 =?utf-8?B?MHdVWFA2MG5aYWxiUXhnbU4zSUlXSllNMXV5TnBMSnZCWE8vQTRVamhzd1dn?=
 =?utf-8?B?azVlcGY1M1ZJUHgyQmpwZEEwMUtJWE5UZEtETlhIbHVtaG1hUEZRUHJTc1Zt?=
 =?utf-8?B?VFZzVDNCd2VKaWoxdWF4ekFqYlQ5VU8wZjhUZW93aE13TjlDUjRlNWRnM3Zh?=
 =?utf-8?B?WGFOS1FBM3VsRlRzWlJlR1V0VlpQN2tSNlRuUXFKTlNBemYyTnFGRTVJRGpZ?=
 =?utf-8?B?QWJiZ1JydDdoQU44MUtGNUJCdHhQWFFuV3Q2dFB6dDRTakpibFhsQ2p6RU4r?=
 =?utf-8?B?UWhPUEUyQ2o3d1R2NGJNVkVUdUJ0WVRkRVNyUHVweG8yVUtJellvRnRTSDdO?=
 =?utf-8?B?K29iNjdHdnZqNDlUTnFYY3hUdFJ2eTdpQUVZSTZRK0JteEhJVzlZM0EwT1FR?=
 =?utf-8?B?cVNaYzRUOVN5SDMwdlVnZURWM1RyY0FuVGUzLzhjUGFLODNxb3RJZnkzNzBj?=
 =?utf-8?B?eXI4OVF4emtXSVlUczM3R3pSdDRJL0UxcGlnTG9pc1E0T0EwOWFvR05lL3hP?=
 =?utf-8?B?cVNMcUdDUS8xWUdNd1RjOExXSUhzeDNwZWJNL01hMHY4OW4xU0owTHFjMU02?=
 =?utf-8?B?Vmd6UmF1MkNrZ3B3NUJJb0dQQjNnQXhRd0RrZ0ozZElIYzRTeUhaaTc3K0sz?=
 =?utf-8?B?MUFRR2JmRElSV0tlWTkzOHdiNmd1QUZJU0hZeWh0STNjQlhqYS9mR1NQM1FV?=
 =?utf-8?B?aHBpaCtFdFBQRUQ5S01oeW8xR3JiN0dxMGxTd1hJRWhRN2xqbVlML21yRGl0?=
 =?utf-8?B?RGJYSWNEV2cyZ0lnNitsbTJpZGE4VGkzbmpOTGtxRC9pNVdBM0ljaDRRZHlw?=
 =?utf-8?B?SzI5N2dwaHpyRTNXVUxFb0VpSVhxV3dhY0h2RkEvUG91WG10U1NBNDZWTUtz?=
 =?utf-8?B?VTVER216YmxTTmx0VnFKOTF5eUxHVURiZlpLWE83cy82ZWoxUWJKbjZJVjk2?=
 =?utf-8?B?bStyR1BJaHlONUdNc1gzaDlRS2RpdFdHcm4zN3lUckhHT3ZJYng3R1JJblV2?=
 =?utf-8?B?Tml6TSt2RlpsSWZLS0RRTEx6U2VYdzk2UUFQU0xyUXd5T1kzZU9CYmtWc0xo?=
 =?utf-8?B?VThrNzR0QlVEcmYrUHp5eEFJajZxNzF5WUJ2bUV4dkVTNTQ4QVBtUjltcXlT?=
 =?utf-8?B?aS9jeFhCYXNBV0swbWNXMlpBQjhSRVFGZ3pMUXhwM1JzcGYwbzVLS0VodXRU?=
 =?utf-8?B?YWRBMHJod1NvNGxMWkd2Y1p2eUxiTWJQY2dMYjdaTDN4SnNhck0yWm0xQlk2?=
 =?utf-8?B?N3hhY2cxUGJKWlMzT3IyVWk2SXdGMlZJWE1FeGMvZllmSTMrd0dOVmhEZGFR?=
 =?utf-8?B?WEhBTVFCR1RPSGlPR3hNVTJ2aE9IRHlzbHRGYm5tQzIxM1I4bHlTMUxwVjB6?=
 =?utf-8?B?S25Ycjd1UGR4VVh2THdJVzdJRytmTUlUTDNBcDk4NW1yY2VwbnlrNWkrazZL?=
 =?utf-8?B?YWV0ZEZzVlJ2SFhKUzRXUnFEN004NU1mQkd5QkQ0d0NxU0dsdExUamthTmcv?=
 =?utf-8?B?OStqZ0VicFZ3NFBJMmFIZzk2RU5rRDRiQURQRUJuUkI0dExDTGJTWGZyT0Nm?=
 =?utf-8?B?SEVReUxlQ3lIbTEvSE4zRXUxYlJ4eUtOSW92bHZJY29zcEtyU0IwUkVmeXRL?=
 =?utf-8?B?aDUvYzVGS1JseVJOeEJRSWlESGdYbmxZZTRrTFI1RXNaSWtScHI3cG1XeGRr?=
 =?utf-8?B?djRTbFZMQmp3Z2tMaWdtTk9OWVZIMVlwT2pzVFVNUllja1E3ZDBVQkFUdHFs?=
 =?utf-8?B?NVBGZVBFQ01rbnE2SHhHdjFXWmpFamJUSllNcStxaEFYaXJscjRycnJsVmNm?=
 =?utf-8?B?VGp6cEovanR6TUlJcVNuSFRtNjdSa1JGUlR1QkdWWENQaUpzc0duTi9HdzdY?=
 =?utf-8?B?aEpLODJrU1E3OWpjMWU1NXh6QTFCRGtHVlk1UzMzQXBkbWttbWpyRWtYcjVX?=
 =?utf-8?Q?F8bpZIpBFDjDD8t1Ww?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51eefc5d-0e15-45f1-8edc-08df12c6461f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 01:11:30.0024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fr6Ovk95BYY+6t1kYnepX94zTlip8GgRGOqNmXIqRGwbkwxkKRbjA8Wn/ScxA6no
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6570

Hi Reinette,

On 9/14/2026 4:31 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 9/14/26 1:45 PM, Babu Moger wrote:
>> On 9/11/26 17:25, Reinette Chatre wrote:
>>> On 9/4/26 11:06 AM, Babu Moger wrote:
> 
> ...>>> systems with limited MBM counters and breaks existing userspace that
>>>> assumes the historical default mode, including the pqos tool from
>>>> intel-cmt-cat [1].
>>>
>>> There is no record of this breaking pqos. *you* created [1] *after* you
>>> submitted v1. What a strategy! I mentioned a couple of times that this is
>>
>> Agreed.
>>
>>> misleading. Since you insist on proclaiming "we cannot break pqos!" as
>>> motivation for this change you have to also disclose the consequence of
>>> this change on pqos followed by motivation why that is acceptable. Specifically:
>>>
>>>      https://lore.kernel.org/lkml/77f77d02-fae7-401d-9bb5-c62b244d23cd@intel.com/
>>
>> I can provide output that demonstrates the issue, where the event counters report zeros. However, we won't observe the large counter values because the hardware resets the counters after reallocation.
>>
>> Will that be ok?
> 
> No. This is not about hardware resetting the counters. This is about pqos not handling
> text return values, for example "Unavailable" and "Unassigned". This patch only
> focuses on pqos treating "Unassigned" as 0, but in "default" mode "Unavailable" will
> be encountered and pqos treating it as 0 is more severe.
> 
> Consider a scenario where a counter is re-assigned. When user space reads the event
> value then it may see:
> 
> <return A>, <return "Unavailable">, <return B (larger than A)>, <return "Unavailable">, ...
> 
> "B" is computed by adding the new hardware counter value to A. As you indicate, hardware
> did reset the counter after re-allocation but that only means that "B" is no longer
> accurate. "B" is still returned and it is still larger than "A".
> 
> Based on above, pqos sees:
> A, 0, B, 0, ...
> 
> These jumps between bandwidth counts and zero is what pqos perceives as wraparound that is
> presented in the example:
> 
> 	https://lore.kernel.org/lkml/77f77d02-fae7-401d-9bb5-c62b244d23cd@intel.com/

Got it. I can add the output of the issue. Something like this.

TIME 2026-09-15 00:53:46
CORE     IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
0        0.76         60k        32.0         0.0         0.0
1        0.45          1k        32.0         0.0         0.0
2        1.57        107k        64.0         0.0 17592186044184.9
3        1.62        276k      4928.0         3.2         0.5
4        0.53          1k       160.0         0.0         0.0
5        0.63         39k      1664.0         0.2         0.0
6        0.44          6k       128.0         0.0         0.0
7        0.50          1k       320.0         0.0         0.0


> 
>>>> For example, pqos mounts resctrl and creates 16 or more monitoring groups,
>>>> using two counters per group (mbm_local_bytes and mbm_total_bytes). On
>>>> platforms that provide 32 MBM counters per domain, this consumes the entire
>>>> counter pool. Additional groups cannot be assigned counters and pqos
>>>> reports zero bandwidth for them.
>>>>
>>>> Leave mbm_assign_mode in "default" mode during initialization. Default mode
>>>> can support more monitoring groups (up to 64) than mbm_event mode, which is
>>>
>>> "up to 64" - so it may be fewer than 64? What is guidance to users about
>>> how many monitoring groups in "default" mode are "safe"?
>>
>> It is 64. It be more on newer h/w (don't know exact count).
> 
> Should it then read "64 or more" instead of "up to 64"?

Sure.

> 
> ...
> 
>>>
>>> Although, the earlier text is "up to 64" so above attempt at guidance may not
>>> be correct and there is no knowing how many monitoring groups are guaranteed
>>> to receive accurate counts?
>>
>> That is correct. We can get this count by assigning counters
>> iteratively until an "unavailable" response is returned. However,
>> the specification does not mention this behavior.
> 
> This is about determining the "magic" number of RMIDs, not about counter assignment.
> User space does not do any counter assignment here. In this case user space can create
> monitoring groups up to the maximum number of RMIDs supported.

Little bit confused here. How about we revisit this text again in v3?

> 
> ...
> 
>>
>>>
>>>> +    remain accurate. Creating more groups than that pool (for example 64 or
>>>
>>> "64" -> "65"?
>>
>> Sure.
> 
> This would only be useful if all hardware support the same number of magic RMID though.

It

> 
>>
>>>
>>>> +    more) can cause hardware to re-allocate counters
>>>> +    between reads. Bandwidth values may then be misleading, or reads may return
>>>
>>> "between reads" - what reads are referred to here?
>>
>> "between two event reads" ?
>>
> 
> This is unclear to me at this point.

Lets me revise the text an revisit.

> 
> ...
> 
>>>> @@ -474,8 +484,8 @@ with the following files:
>>>>          Determines if a counter will automatically be assigned to an RMID, MBM event
>>>>        pair when its associated monitor group is created via mkdir. Enabled by default
>>>> -    on boot, also when switched from "default" mode to "mbm_event" counter assignment
>>>> -    mode. Users can disable this capability by writing to the interface.
>>>> +    when switched to "mbm_event" counter assignment mode. Users can disable this
>>>
>>> Why is this change necessary? It seems to drop the text that mbm_assign_on_mkdir is
>>> enabled on boot ... but it is still enabled on boot, no?
>>
>> Yes. It is enabled on boot. It should not be set by default. Will update the patch.
> 
> This is about mbm_assign_on_mkdir that *is* set by default, on boot and when switching to
> "default" mode, no?

Yes. That is correct. This is about mbm_assign_on_mkdir.
Thanks
Babu
