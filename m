Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013035.outbound.protection.outlook.com [40.93.196.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7291A3AFD05;
	Wed, 16 Sep 2026 16:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574973; cv=fail; b=uEchri0VE5YA6fFGDYMIwV/rklBxxsUyW72TXjkwbAsY9e31OUjdWOsLN5A5dQG3q/2+REqV683+xWo8dYRNzWW6HgfstdcoEiI7gjH3btXNMNBpNYdJmmH7i44S3lMvV5SP+8Kvlc0k9y53z+5Gi4I8ybpvMZYK5B6D6GhdPaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574973; c=relaxed/simple;
	bh=lIabpoxGnqOmjxqCt668BIvuNZUedSlNpwmPZxdBsVQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R7aah+JmM7cREuSw4FNvvBkd2xKX+vmIonxRoOKXyzoBliys1o2iDuSN36HosBjpAYAuxDaJoPk1syQ60gWL3fM6p/pnIFu7sEFzPEdkHET0BnN1jmDfkZlHnHhUMJw3dJniZ8SnlULT5lJQds9gpgQWguomp8MmqYV4PqsT8WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DxKYdnsa; arc=fail smtp.client-ip=40.93.196.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DxKYdnsa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQrzug5NyoQjMdmcGuI3lEpRbjr17OweOB+jQ251OQ41Q7msIbhaHpsicifWzi0Ts3cIriByzOZDRgXx3OI4crpd0gNw5noDUwD6CUxKbG2nOR6QZta56znAnvaiPGsWPsNkEI1l87a4ijUGfOR0E9z7Atqbx2JgAvcMkBekYIbio1b7VhA8yxNygbcqEUhd1KGEVPn//U4tPzbKXlYTHzYlDNMbSjjNOcfz6uwqLMFwTRNuSsDE1Uqk0IjVw0RYwVxsPIEW8va4mjmA6uF8WJHx0nxTtwDe4w3rdwNVeL/tWvHaL/DjpLbE/1aP5oPZNbQIeQ7O3qMY8pYSiI3Uhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0P44Vv4HUDWeMIOcuXKWKYXa+mDVEPvuWUG56a34Oyc=;
 b=W+4O7KfFfJwS4mXDafRj4l5U7ahGuvUbH/UT8sFXZcqpO1/n0ZYaW/7n34Tw4c5YyZNXs/0LoWwqATyDf9DJfh+0O/8XMS1LsEIerOaDjpCQbJNskLY0Qo5jfcKw4ptAz8c/Tf1BTYUnBRzelhbmIwKvOke0RuQfUiHWd2mNB75oxTZThTHJIwvN68QMwGqN6W7ulgLneufobvSecFEx+jSOCSBo9d3nCDfIrmN69V9kWmaoq8LRSyEl1efnl/LphsVXR/leY7z4VBG/hnhfl2OEf32VFLQOhI4ysaqwv517ZFrxCCPeI7+QexL9W/My07bBIeUIXSozSAqRRAgvPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0P44Vv4HUDWeMIOcuXKWKYXa+mDVEPvuWUG56a34Oyc=;
 b=DxKYdnsa0zlGfkz2hPNVn7NWJiuGNYTFxW2+Y49E/R1OldJlEa2KEn4MuQ8bXHVKSTpnQTGIW/L/0c0i4L4FgmBq1DtNlqqGrtev7I/za9WOCpXEddDojSWu1VKU96ANIfkjr9Wi2mZTY8HOj1/wFc9k96ZHyfq8H+usV1fMU/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 16:09:16 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 16:09:13 +0000
Message-ID: <e5b6163d-46c7-42c0-aef1-f091c23b7d2e@amd.com>
Date: Wed, 16 Sep 2026 11:09:10 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 3/3] x86/resctrl: Keep mbm_assign_mode in default mode
 at boot
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, tony.luck@intel.com, bp@alien8.de
Cc: x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <cover.1788545152.git.babu.moger@amd.com>
 <176d53626058ae97c4003f77ff47371628da9f1f.1788545152.git.babu.moger@amd.com>
 <69044bcb-e606-4f7c-be83-2188169ddb51@intel.com>
 <e5d60b04-6bd4-49db-aee9-49983be17c71@amd.com>
 <5e8c02f6-4352-42e5-83a8-f6d589278568@intel.com>
 <02254e94-35de-406e-a40f-f2a566d1c4ec@amd.com>
 <2b2c5fed-0a4e-4549-977a-4eb9b6f27b70@amd.com>
 <6d89b319-f5e4-4314-9970-a7762d3f3bee@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <6d89b319-f5e4-4314-9970-a7762d3f3bee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:610:76::22) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c2a15b-03b6-4e75-c2f2-08df140cd9ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|366016|10067099003|3023799007|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	rYif0uWgUEI0dHLqWc3U2XDkVmWY+4UShuX17qBzD7LGTPvKrKT8pSlYJARvBZMix4HmET3PNcaWTRcBfaTxMukR8j2V/7bCkBbuocZ36Nbpwhnx62hmQi+NeypBc10pY52GmCw86JNQM28BDuOS7dI+NtcxdhRi/u5UUIQpmEIkO7Vu9aPNx3/gMxuoFiBt0oK8GK3mglCWxyal1CovEqEm+p2ZnrcD3Jtj6yMPyLgJqNXHuIOGsjvaklCbwhpd/Bd476jAhNh7fbNUOv0YH+GlrfOfsbwdktdOFftCXUtDto0AQw4un54G8oWpQOEDrhrj5d6IoLaTDjRD5xMw+iE+uYxJfyyYtrmEmLoWnWE99J9K7eUf99DgVtcIBAKBMYCjdHSLENwh2ShO97M/xCv/toTxSVL+RKiAqSXnpajgwnA5LPbBAq7MXbLfD64UwgJ5GuXytxB2emcn2pObNMEwWpXZAMvKZS6KDcd2kzswo5K4vR060BxtrSn0WkMRYKY+C1zst6kXxmSNMF61wn3KNqayBBV44VRVZ04hZVDerB7uOW+CRAfhTtikv3FuB/0mAiSdxkxcW74Sr/i4FevVDZgyoPBHXbx5TxwlH/x+75Scnlb9Nac8WVpfLCWXks8fKyZ6PzqHw4/HqrzccIHZgCNNZtVLwBgTLiocfD0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(366016)(10067099003)(3023799007)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzhCRTI5dUxSNXpYNmlBUjlBUEh2Tjh5OG9mcjFuTUZjcHYwZC9RdHYvd29J?=
 =?utf-8?B?aEJGZFQrcmFRRTBpUUE5UjNiZDR4MmU0NEtkR2pMbTFhSStqdjQ1dE9CS1Yx?=
 =?utf-8?B?b2lRaFB0b0dpcTBkKzFLREFGMjZIUHpoVGhTaGkvUmVKTklyVUZzTlhHWU1z?=
 =?utf-8?B?cFZlNjdwQ1RKSTBVWElqNEdkMHJveVV5YUIxQUlMZTdUWTZoVjA2UWtoSlY5?=
 =?utf-8?B?QXIxMlkvaGZzdURKcGYzVWhzWFl4dExIcWZJZXB2WHB3SnRhMHJTeG8wYkQ0?=
 =?utf-8?B?L0xuNDc5TWtJZDQ4VkIyalhFOVA4UXQvdGE2dGNHYTh6ZkpzRnFuNTJ5MXps?=
 =?utf-8?B?MkdSTXFkL0s4ZjlEanhKT1JXSHFqTDNuQVFPL2cxbUpEYVc0eXRrTUZjeXhi?=
 =?utf-8?B?VUp4VUVjbDBKWHRxVlJsZk9mTkxHU3JsYld6YzRCNHlMUmhoSUY4R1hZUkhL?=
 =?utf-8?B?ekRQSURCNmZEZkc1SWdncjNwYmRVQnFseFRGenZ6ZkJUQXJCdG5vZHFBeXhX?=
 =?utf-8?B?eG9FalNYdmczeTBuS0ZCaFVSampwNGFTcmZSR1diSncxazlvV1B3SWhFbm5z?=
 =?utf-8?B?NWxFRE0vTEQ0bmxMQXZBdnRNbUw0TGdjM0dsQXVmOGU4eU13SjRETVNuSjA3?=
 =?utf-8?B?OHdDUVpRbkMyRktPaXY1OU00TDBGRkZJMnE3bGJDWWQrZEhvMzF0aGtUUUpP?=
 =?utf-8?B?RjZFTGFSb1FXZTNQaGZrT3VrSVh3bXBjL1RtWjVhWWJ0TzhMU1VVUzlMSDgx?=
 =?utf-8?B?bFNYRFJGRVZ4RVZmVXVaR2pITlg2WXY2elNJUVVWRXpaRHVYTUN1aEEvTTMz?=
 =?utf-8?B?cVBtUE5BbVZYUUJYeVE4ZFF2S3pKeDVrK3gzM3pHUnVXOHl1L01mdFZ4ckVK?=
 =?utf-8?B?QStrSjRURDZuc29YZUgvY3Z0dFl0Vy92TWFtZVZsUDZCT05ZTy9iUnJNTTAw?=
 =?utf-8?B?Y3FUSjZTMjZ0WVA2OVZOejFScmxYYkNXNGc0bk9vREF6QjlrS001WWxRU1Fy?=
 =?utf-8?B?UzZacG5xQkV2UFM3bFAzbFRlQkpPMnQrbG9sSDFDcTB3VVhqdGpwaHllRTV3?=
 =?utf-8?B?M2J2THdJTlhrWnFJMXI4WFBGQVBkWENzeUpER2o0Q3pCWEVCOUhLY2pKY1lH?=
 =?utf-8?B?MC8xTFVGNWdXQW1RMWhRb3MyWXVQc1g1Z1k4eWZVaERXQVVxc2M0M3dQeHNB?=
 =?utf-8?B?UTVrM2JhdXAxanJJTlk1SkhTVm5PT1IyNWc5Z3lta0d5OWlZZEEzUDdaWUF4?=
 =?utf-8?B?NlhScVFzckJ0cGNtVUtQSnZzWm1tZDVqWEIxNlB2QW9lSEg2OElHbmhTL09N?=
 =?utf-8?B?NFAwWVJSZDR6V3hpRWxlaTJxSk5GSzhOVGlZbkZYNGhJMmIreUpjRlY4VWRM?=
 =?utf-8?B?Vlc2U3ZscStjS1cwekRtR1pCRDNSUUQxQzRVcW1WK21iQmdjdFgycFZoNzRM?=
 =?utf-8?B?UFlTZlA2RFlUN1JJeWt4dUpJSldFdmVWOHNTMVU1WnJPak5OTkdwbzRTSEZw?=
 =?utf-8?B?QTAxbjYyUlFCYkZYWWdBcmEyUmFrSjhSeWpjV3FtRE80NTVkenhhd0NrQ0hs?=
 =?utf-8?B?NVdIQ2g2VHVVbjM2MGdvSktxMkRGcDdTUHBzSVg0dGt0YzR5WGovTmFUZWlT?=
 =?utf-8?B?Z1N5Szc4RFh1UVNLU1JXdmwwZ3NvRkdrQWFVOVJDL1RKZFVFL3NoMUJpRndr?=
 =?utf-8?B?UmdwMlBNaHZNaHNmZXo4dkNJVUZ0N3Y0b2dGMnpLcG9iOXBhc1gzbmdiS0N6?=
 =?utf-8?B?NHhiQ1pJMnFGb0FmcFRTKy9lWjdoR3h3Vmdub21BWlRPcjhDV1RqQlBGSUVk?=
 =?utf-8?B?SCtlRWozV0ZiYTV4VGEzY0VuemFMb2k3dXdZVnRnS2xJVzl1NjJvWVZoZjVj?=
 =?utf-8?B?T2FsVTZ0bEN0amVpQXhTbzRIS0lnSzNVZGdOVmNJYVM3UmJidkFwM1RwTG5F?=
 =?utf-8?B?OVRkeVZ0Uy9IUTJZTnllSC9UNzI2VEtseG1lSWI5RzAyWHd3amVNVm9IR2Va?=
 =?utf-8?B?QTVzYVdMZ2grQVRvcmxKblcwdEwyQ2ZkMWpjZ2x5aXZDZTlzS0pOWGdVRXB1?=
 =?utf-8?B?M1gyejhJUGI3SVFoL1VvRXJmczZ0L2FzNG8veW8rZFZteFBLaGhhd0VISzNC?=
 =?utf-8?B?N1NZdEtPbiswWmNzRXpYYzEvRUZseUtqeEdLemhkVVZ4VUMvN1lFT05udEk2?=
 =?utf-8?B?cHlpL1QzZlh1WmtwZDk4THFobEoweWJOUXhLaUJRZDJPTUtZM01nR3NSSWlh?=
 =?utf-8?B?TmFHZ2E1Z0FsT1FYMEd6SEZocUNnY24yWDl5c2szSlh4OEw3QXBrVDE0U1Z5?=
 =?utf-8?Q?TzD1lFMVT0dEcIaEwh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c2a15b-03b6-4e75-c2f2-08df140cd9ca
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 16:09:13.7518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4zK4oUCSr74NQg1cfQesE5mzTR2FoJznqTvmGm0COpe/gdHn1Iik6npjnHb1KH3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726

Hi Reinette,

On 9/16/26 09:42, Reinette Chatre wrote:
> Hi Babu,
> 
> On 9/15/26 12:59 PM, Babu Moger wrote:
>> On 9/14/26 20:11, Moger, Babu wrote:
>>> On 9/14/2026 4:31 PM, Reinette Chatre wrote:
>>>> On 9/14/26 1:45 PM, Babu Moger wrote:
>>>>> On 9/11/26 17:25, Reinette Chatre wrote:
>>>>>> On 9/4/26 11:06 AM, Babu Moger wrote:
>>>>
>>>> ...>>> systems with limited MBM counters and breaks existing userspace that
>>>>>>> assumes the historical default mode, including the pqos tool from
>>>>>>> intel-cmt-cat [1].
>>>>>>
>>>>>> There is no record of this breaking pqos. *you* created [1] *after* you
>>>>>> submitted v1. What a strategy! I mentioned a couple of times that this is
>>>>>
>>>>> Agreed.
>>>>>
>>>>>> misleading. Since you insist on proclaiming "we cannot break pqos!" as
>>>>>> motivation for this change you have to also disclose the consequence of
>>>>>> this change on pqos followed by motivation why that is acceptable. Specifically:
>>>>>>
>>>>>>       https://lore.kernel.org/lkml/77f77d02-fae7-401d-9bb5- c62b244d23cd@intel.com/
>>>>>
>>>>> I can provide output that demonstrates the issue, where the event counters report zeros. However, we won't observe the large counter values because the hardware resets the counters after reallocation.
>>>>>
>>>>> Will that be ok?
>>>>
>>>> No. This is not about hardware resetting the counters. This is about pqos not handling
>>>> text return values, for example "Unavailable" and "Unassigned". This patch only
>>>> focuses on pqos treating "Unassigned" as 0, but in "default" mode "Unavailable" will
>>>> be encountered and pqos treating it as 0 is more severe.
>>>>
>>>> Consider a scenario where a counter is re-assigned. When user space reads the event
>>>> value then it may see:
>>>>
>>>> <return A>, <return "Unavailable">, <return B (larger than A)>, <return "Unavailable">, ...
>>>>
>>>> "B" is computed by adding the new hardware counter value to A. As you indicate, hardware
>>>> did reset the counter after re-allocation but that only means that "B" is no longer
>>>> accurate. "B" is still returned and it is still larger than "A".
>>>>
>>>> Based on above, pqos sees:
>>>> A, 0, B, 0, ...
>>>>
>>>> These jumps between bandwidth counts and zero is what pqos perceives as wraparound that is
>>>> presented in the example:
>>>>
>>>>      https://lore.kernel.org/lkml/77f77d02-fae7-401d-9bb5- c62b244d23cd@intel.com/
>>>
>>> Got it. I can add the output of the issue. Something like this.
>>>
>>> TIME 2026-09-15 00:53:46
>>> CORE     IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
>>> 0        0.76         60k        32.0         0.0         0.0
>>> 1        0.45          1k        32.0         0.0         0.0
>>> 2        1.57        107k        64.0         0.0 17592186044184.9
>>> 3        1.62        276k      4928.0         3.2         0.5
>>> 4        0.53          1k       160.0         0.0         0.0
>>> 5        0.63         39k      1664.0         0.2         0.0
>>> 6        0.44          6k       128.0         0.0         0.0
>>> 7        0.50          1k       320.0         0.0         0.0
> 
> This would demonstrate how the change impacts pqos. Since the spirit of the
> changelog continues to be "resctrl should not break pqos" it should motivate
> why incorrect wraparound like above is more acceptable than returning 0 MB/s
> when counters are not assigned.

Will do.
Thanks
Babu
