Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86751EB5FD;
	Mon, 14 Sep 2026 20:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789418751; cv=fail; b=GGBhhylWMp4FQSgwO1VPPVfGpiTfNNJJhNm3vcMCjT47V9E6NYNeYqXf6b9Gtah6gkTdtxY6j8pElPMWeGwOVaqxXUdkGMtkRKjxPS7rtq2+jFzBkTaAOR9r9/b9BuY4ZOFeLQ9nsHf7UaIjWwGqsiyKYYVSspggkldoko4/Htw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789418751; c=relaxed/simple;
	bh=nwQgxPxTiZRbU7r/6o3hGzj/U0Fg8/Qv/XKmyFaY1sY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F+TVTJ3wFTY9DEx9rDwtAwv1lfMBZTjAQqpXvSDdxBLivaAVPcFgJE9UcTCbUT/gO+cJqwaJhqBLCwW0istijO8sWQYcznOcjHXYRm55/wDg5pBu5WGC5U740jtJuWVndnF1me9P/9fiZlpSSqkKsJFt3M14Ca8NBgvw9pv4+zQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=YO0+cxOZ; arc=fail smtp.client-ip=40.107.200.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="YO0+cxOZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Le5DsReVpPedGiWG8eSs954CbEEJu7qmC7NDFymOGbcnsvCXy2JEKsW/ceTBPkPvmwPTS42kaGU89Hf6SfywMC2tYGZvbZDJjZhizT/BHa8PUP8ynCYAYLu52L05wgWt7vE456EyxW/txrG88eQmKvJo5rrX5vHlVBaXlubHhRicUlC36NT0Smu64V8ep9Fb3CvanXi7W739lVf8BvDwddn2lMyw0sAndeD2ZWUoyIsiIHKZE+DuqORcdf2UsZuM0UiiwbwBEK6tg8pA0PcPBu9EmP59fjaAtQwhu8badyVoyjH3mqyav0leLIKuoq1bjmf+VeH/QE1GMddk137LgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jAewq/V5URvAeCU3v8tRfQ6FV5j6JO3AVHqj2M8BOU=;
 b=iWilAhgJZ82Rzs2WS2U6wud2cOXc9vYCv7vRT1YwFYM2w+ds9wUXUHxZ2avum2VcOxbBYGNf9zB7BZoXoIHPdDgXXc6dkdqPBeD6i1AK04cokYr0D/+nihZLXF/q+XQrVqO9wT0f8RtdsItnhWHu2apq4gutwHABHFeQvIMiUci/uh5LDrh2V93PdzzSKgdkmutsDbpfzsV4MK788b5jyW3aUmI2BMXOZNvvOnEFB/zxFl6rJfYka0uNwgDjo0miasPueGmK73MlxJjpduKyzC1XRnhCo6GkQVc71SfYWnZ8S56KvtX/hel57gmwWzI8sy7JdRAcZ3KRzPSEqJZNzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jAewq/V5URvAeCU3v8tRfQ6FV5j6JO3AVHqj2M8BOU=;
 b=YO0+cxOZF/vHkRx7mN8QX/mPU7G5iSVnnu69PJx1lyi1lXVkGKQbKI9Tt0rnPgk8Scj/wmg63KOZSGkeGMP5f48uwfHXArkXyXhbFnIZ69KJ1nF9gox7pCfVNuxcqH1gvvNgfZfHGL4uYYq2O/Sm5VHMuRagwjb9kndwlD1IcUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by BN7PPFA42F4F89B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6dd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 20:45:44 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 20:45:43 +0000
Message-ID: <e5d60b04-6bd4-49db-aee9-49983be17c71@amd.com>
Date: Mon, 14 Sep 2026 15:45:41 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 3/3] x86/resctrl: Keep mbm_assign_mode in default mode
 at boot
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 bp@alien8.de
Cc: x86@kernel.org, Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <cover.1788545152.git.babu.moger@amd.com>
 <176d53626058ae97c4003f77ff47371628da9f1f.1788545152.git.babu.moger@amd.com>
 <69044bcb-e606-4f7c-be83-2188169ddb51@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <69044bcb-e606-4f7c-be83-2188169ddb51@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:91::12) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|BN7PPFA42F4F89B:EE_
X-MS-Office365-Filtering-Correlation-Id: 3193dedc-0977-4e20-6925-08df12a12559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|6133799003|22082099003|18002099003|3023799007|4143699003|10067099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	6NJVYQgq8ej76rsUHmLUXBG6WiAEBH9ZGUKmMjAoy5xyszyKfFjOpZWZqSzjMCM0pd13upWGsI2PsjXlF1N6ualfpefhBJrLhl84JJ9sDFGo7A6MSHaXULpEKmHUU+GA70fGaIaqaCp44S3eyvwVMNN2BJ02woTDisnC9JDdar4/tXZJwqFBan0Ic1yNM2m+nwt4zp0M6PJFHjIRAqivyOcCrzp7NrzLq3g+ycafOZ67yU/45GRkTPt64BDLNZ7ockg3bcWRiGYIFrbzSTKn+Vv0qoch/xPVh0jLNz+DcYVY/Ig5RsSbqEX0fd6cnnpXwRsmFRZoMHG/OCscuDvtW308NacQkghZ2LSJEZkSe4LDklRlFD0yWl2/qhX2l9okgYzMujkNo5M92DNfO1S+sxjDVbEI1xkBTADmvAkMlPWo+tMJVb2jvLwfdLc6vf55o2Dgi5o7+mnYTX3HUTxsxmdp3cjoYy+rtioesThHG/SG9p5R6YdvQLcLr/i1Nn7YP6txA3St31OyxiAuuv9YAyHe6JzSzEXgSv187arKt7YyRL/ltm7FDb1xj8/aG2M0DYyJIjzv/Lp1J8iGr7HNhh/oQNl6EMboaoXAudxH9/oj4/E0t3Ah3rp2B+PH8TcDscsN/nGshsIJ/S4xgp8pQ+Piay4FiZ+IGayHDbz9fCY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(4143699003)(10067099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFpvbGpaNy9FK1MzeXA5VFBJY2ZvV2hZbHQ3ZjA3L1pyMkhidXVPK1lqc2NN?=
 =?utf-8?B?MS9UN1RWRHpFWExDUnZseHhCeU10OFdiM2c3S0FHdC83THRtbVN3N2hLeGRi?=
 =?utf-8?B?ek9Zc1FYZVl3MldmWkNQazliZzYwemJEeWx1bmxocDdvSm9JVk1ZYStmazFQ?=
 =?utf-8?B?Tk1UZkk3L3BncVZ3NER3SUxRU3NLd0VWWEpFZnd3SnMvSjl6a1pQR0NuRHNU?=
 =?utf-8?B?bmFYRmUrRENyUHhUWDF0RS9SUExIWjdQR1BIekcyQ3hvYk51cXB0YllRMlo0?=
 =?utf-8?B?c1R3azRSU2RJVHJiaFpVNlVIY3JFVkVqSlc5ODNHOTd4ZFAxMW1MdjNTSjgv?=
 =?utf-8?B?b2ZZZ3dETjhURVNqUjhNR2Q2ejQvZWFZdXFrWWFzVUROeU9wdE9EYlJaOGpq?=
 =?utf-8?B?QXN4NUREbjFEZUZKMkFKWXlVbHh2QU1sdktwanNVVGtHTVpma09WQmc5cEJI?=
 =?utf-8?B?ZFU5eUlUcFpwN0RBeUI5QjMzT0NudFJRUmZzZEExTkZEWG1wWkFpalZ6eTJw?=
 =?utf-8?B?OTFqTnJ5L0F0cVlQYktkbXNMb0c2amc4WlhJU1dhTmxqZTRPUVQ1VmduL3Zl?=
 =?utf-8?B?VDVlSmYvMWc2SDVWMVFnOWs2ZHRJb0FYUm5PUzR2SzUxQkZ0Ymtic25PRG5I?=
 =?utf-8?B?bnM0dGZJUEtMeFR5dUVmNmQ0L1FGMXdsRThpZ0FuZkJ2dzFNd09SRUlyMG8w?=
 =?utf-8?B?dEd3dUMzSU5URUdObVoyUW1MMUhiTjFMd1VJdmhuaWdEUndBREtvZnl4SzBm?=
 =?utf-8?B?MmdjZVJHbm0zUHRJcUl1S2o5TTViUDlpQzhvTGNTa2pYTXhIUllzVG9HRVBQ?=
 =?utf-8?B?bm9ZaDdmT1NmQUpmQnE0c2h5eTk5Q0JvNDBzMGV2UWhxUUlMemxMUjIwM3M1?=
 =?utf-8?B?MHg4L2FIMjhTZ0d2cjU2UXEvbitPRmdTYlFMaTJ0dm5OLzNKQi90SnU5UDJO?=
 =?utf-8?B?d1lrMC9pSGNVeTNrOUpMNWFWUnNCQUE2U1dJZDBLZGR6aGttNW5YL1lXQTRx?=
 =?utf-8?B?TUd5SFlmbllyeXdWTnQxc0tXZUxMVTdhUEMzR0hRdkdUTFZvcW5vQmplNU9B?=
 =?utf-8?B?L2d4S2F3enI4MGNXeURlQzBrM01KS01HQWZkd3krcjZSSE9uUHhYUmN3KzB3?=
 =?utf-8?B?aWEySkZOLythRkQ1RndXRXpFZnlGaXhmRk5KaVM0ZlFwdHJBaU94M1FBZ2Rk?=
 =?utf-8?B?ZUFHVEM3YmN6SUxXTmEwaVBkY0duZmwxNjFHcjliZnhjeE1UNXdJZXE3SlN3?=
 =?utf-8?B?OUZPK0lUNXltUjYzd1U5TWNUTjFJVFN5SjJZWUloMVhYdVAzSEo3V3FXWnB0?=
 =?utf-8?B?R2NLODhpWDdIeXRnZ050cFBPc3o2QlJXRGJtYVJsMzQxTFlsUERXNjRuOUtO?=
 =?utf-8?B?UnNQOEFPS210TWtIRWRWQm1mMEdXSWxLY2loTXZRVEpKVlJlcGNZeG5lSmk0?=
 =?utf-8?B?SGNDUk9BTzFkazArSkEzUjZrT1NIV09LenZzOUpVRElhN0VuelJSakJlSmEv?=
 =?utf-8?B?S2lLTGJIc3BXOG5yZTdSMWVNOTZJMW1sdjNZdTdxQ01uMDlGVDFaN1NWSXYy?=
 =?utf-8?B?MlM5S0ZNLzdDYTh3NnRGSmU0bTJHVTJOckdSOFAwTnFtVy9qN3FRK3VYSDIv?=
 =?utf-8?B?aGdOQ0Z1V2g4WTdLUzFZem95MXQ5QTNDaEFIM2kxT1N3V1VvWjl1eUlpYktI?=
 =?utf-8?B?WnQzYi9tdWtYUjJzLzJwbWNPU0JMNFpZMmVTT2JrZlphUHBkWFZteTdidHJU?=
 =?utf-8?B?Qjg4VFVkelB2Y2VDUEJGamx0M1cyV2JORmVkYytYSVhTZDFMYkFOUHJtbmdG?=
 =?utf-8?B?REdaVDJ1emZYc0N1dHBBM3Z6T2Y3RG1sRUJXaWlJYWIwQlQ4Ti9kYVJFbTBj?=
 =?utf-8?B?YjFPMWZjZjhqOWNFOGdzY2tzUVNGS0JveDF4NHlDbjlnZ2svQzN0ZzFkL3p1?=
 =?utf-8?B?dlpkWGdod0dZa21lTWRDZm0rZWw0MkE2dEs5citUNHZtK1dDLzZUa0dPUG1G?=
 =?utf-8?B?MzZOMVo4ZW4yRGp5NVY0ZjE5Q3JuYndwZmx5bnJoZUJUQTRhTzJqcWZsTXMr?=
 =?utf-8?B?bTNKWU4yUnRkYmN2Qk0ySkI1cnhEOXBJaGxGZzBvQStaQ3NGSUlHalNpc2FV?=
 =?utf-8?B?UUVTMkd1QlU0bEdjejVsTTM1NkFuSVNpbUVvS0x5SkdmcGkvdjR5WG9CUGRB?=
 =?utf-8?B?cktyVzBpSHhqNXNpN25DQWE3QlJtTmtIMW5lelJrdXZ0SUtSY3ZPTjZFRDNH?=
 =?utf-8?B?cEd1anJ0Vjd1L3d0VnhOZDRQaUptNFlhNG5XRHA5Q1gzbENhbmZlV1ZybXJ6?=
 =?utf-8?Q?140TGQEWEVG+ZJjA0o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3193dedc-0977-4e20-6925-08df12a12559
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 20:45:43.7083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Epc0woLuBtcDgkt9IIOuYQhdNeSB1/zM4HTwCFVzIBt4LdNwsYYgR5VgJ+u22T7G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFA42F4F89B

Hi Reinette,

On 9/11/26 17:25, Reinette Chatre wrote:
> Hi Babu,
> 
> On 9/4/26 11:06 AM, Babu Moger wrote:
>> ABMC ("mbm_event" mode) allows explicit assignment of hardware MBM counters
>> to RMID/event pairs. It is intended for deployments that need to manage
>> counter assignment on platforms where the number of monitoring groups
>> exceeds the available hardware counters. Because hardware MBM counters are
>> scarce, mbm_event mode is best suited for snapshot-and-rotation workflows
>> that monitor a subset of groups at a time.
>>
>> Commit 0f1576e43adc ("x86/resctrl: Configure mbm_event mode if supported")
>> enabled ABMC automatically during initialization. This causes problems on
> 
> Se "Fixes:" tag notes in Documentation/process/maintainer-tip.rst

oh ok. This needs to go to "Fixes:" tag.

> 
>> systems with limited MBM counters and breaks existing userspace that
>> assumes the historical default mode, including the pqos tool from
>> intel-cmt-cat [1].
> 
> There is no record of this breaking pqos. *you* created [1] *after* you
> submitted v1. What a strategy! I mentioned a couple of times that this is

Agreed.

> misleading. Since you insist on proclaiming "we cannot break pqos!" as
> motivation for this change you have to also disclose the consequence of
> this change on pqos followed by motivation why that is acceptable. Specifically:
> 
> 	https://lore.kernel.org/lkml/77f77d02-fae7-401d-9bb5-c62b244d23cd@intel.com/

I can provide output that demonstrates the issue, where the event 
counters report zeros. However, we won't observe the large counter 
values because the hardware resets the counters after reallocation.

Will that be ok?
   >
>>
>> For example, pqos mounts resctrl and creates 16 or more monitoring groups,
>> using two counters per group (mbm_local_bytes and mbm_total_bytes). On
>> platforms that provide 32 MBM counters per domain, this consumes the entire
>> counter pool. Additional groups cannot be assigned counters and pqos
>> reports zero bandwidth for them.
>>
>> Leave mbm_assign_mode in "default" mode during initialization. Default mode
>> can support more monitoring groups (up to 64) than mbm_event mode, which is
> 
> "up to 64" - so it may be fewer than 64? What is guidance to users about
> how many monitoring groups in "default" mode are "safe"?

It is 64. It be more on newer h/w (don't know exact count).

> 
>> typically limited to 16 groups because of hardware counter availability.
>> Common deployments with a modest number of monitoring groups continue to
>> receive accurate bandwidth measurements.
> 
> Please be specific and do not hide the consequences in a note at the end of changelog.
> For example,
> 	Deployments with 64 or fewer monitoring groups will receive accurate
> 	bandwidth measurements. The hardware supports 4096 monitoring groups.
> 	Deployments with 65 to 4096 monitoring groups may (without user-visible
> 	indication) receive misleading values or "Unavailable".
> 
> 	Users that need stable measurements across 65 or more monitoring
> 	groups should use mbm_event mode and rotate assignments as needed.

Sure. Thanks

> 
> Although, the earlier text is "up to 64" so above attempt at guidance may not
> be correct and there is no knowing how many monitoring groups are guaranteed
> to receive accurate counts?

That is correct. We can get this count by assigning counters iteratively 
until an "unavailable" response is returned. However, the specification 
does not mention this behavior.

> 
>>
>> Users that require ABMC functionality can enable it explicitly:
>>
>>    echo mbm_event > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>
>> Note that default mode has a long-standing limitation when the number of
>> monitoring groups exceeds the available counter pool. After hardware
>> counter reallocation, reads may return "Unavailable" or misleading values.
>> Users that need stable measurements across a large number of monitoring
>> groups should use mbm_event mode and rotate assignments as needed.
>>
>> Update Documentation/filesystems/resctrl.rst to reflect the default boot
>> behavior, document the limitations of default mode, and adjust
>> mbm_assign_mode examples accordingly.
>>
> 
> If the plan is to send this to stable then it needs a "Fixes:" tag.

Sure.

> 
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> Link: https://github.com/intel/intel-cmt-cat/issues/311 # [1]
> 
> "Link:" -> "Closes:" (and then move it above SoB)?

Sure.

> 
>> ---
>> v2:
>>    Added documentation describing the known issue with the default mode.
>>    Will add cc to stable once we have all the things in order.
>>    Let me know if I missed anything.
>>
>> v1:
>>    https://lore.kernel.org/lkml/8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com/
>> ---
>>   Documentation/filesystems/resctrl.rst | 79 +++++++++++++++++----------
>>   arch/x86/kernel/cpu/resctrl/monitor.c |  1 -
>>   2 files changed, 49 insertions(+), 31 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 79feeb1dc296..a43ed3c89a93 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -355,8 +355,8 @@ with the following files:
>>   	::
>>   
>>   	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> -	  [mbm_event]
>> -	  default
>> +	  [default]
>> +	  mbm_event
>>   
>>   	"mbm_event":
>>   
>> @@ -377,20 +377,30 @@ with the following files:
>>   	will return 'Unassigned' when read until the user assigns one using
>>   	"mbm_L3_assignments".
>>   
>> -	The mode is beneficial for AMD platforms that support more CTRL_MON
>> -	and MON groups than available hardware counters. By default, this
>> -	feature is enabled on AMD platforms with the ABMC (Assignable Bandwidth
>> -	Monitoring Counters) capability, ensuring counters remain assigned even
>> -	when the corresponding RMID is not actively used by any processor.
>> +	The mode is beneficial for AMD platforms that support more CTRL_MON and MON
>> +	groups than available hardware counters. The mbm_event mode ensures counters
>> +	remain assigned even when the corresponding RMID is not actively monitored.
>>   
>>   	"default":
>>   
>>   	In default mode, resctrl assumes there is a hardware counter for each
>> -	event within every CTRL_MON and MON group. On AMD platforms, it is
>> -	recommended to use the mbm_event mode, if supported, to prevent reset of MBM
>> -	events between reads resulting from hardware re-allocating counters. This can
>> -	result in misleading values or display "Unavailable" if no counter is assigned
>> -	to the event.
>> +	event within every CTRL_MON and MON group. This mode is enabled by default.
>> +
>> +	Default mode has a long-standing limitation on AMD platforms that support
> 
> Please be specific and drop unnecessary words. For example, "long-standing" can be dropped.

ok.

> 
>> +	more CTRL_MON and MON groups than hardware counters. Hardware dynamically
>> +	shares a smaller pool of counters among RMIDs. The size of that pool is
>> +	not enumerated to software (unlike "num_mbm_cntrs" in mbm_event mode), and
> 
> I do not think access to "num_mbm_cntrs" depends on mbm_event mode being enabled
> so "in mbm_event mode" can just be dropped?

ok.

> 
>> +	"num_rmids" may be much larger. On current AMD platforms this pool can
> 
> "current AMD platforms" does not age well in documentation. Can "current" just be dropped?

sure.

> 
>> +	provide more counters than mbm_event mode (for example 64, versus 32 ABMC
> 
> "ABMC" -> "mbm_event mode"?

Yes.

> 
> There seems to be another distinction that just "more counters": what can be counted
> by such counter. Specifically, a single counter from from the "pool of 64" seems to count
> *all* events associated with an RMID, while a single counter from the "pool of 32 mbm_event
> mode counters" can only count a single event associated with an RMID? This documentation
> uses the term "counter" interchangeably and is difficult to follow.

Will add a line on that differentiation in the beginning of the paragraph.

> 
>> +	counters), so more groups can be monitored accurately than with mbm_event.
> 
> "mbm_event" -> "mbm_event mode"?

Sure.

> 
>> +	Typical usage with fewer groups keeps a counter attached and readings
> 
> Drop "Typical usage" and just be specific about the different scenarios. It will be easier
> for user to determine how their usage matches to specific scenarios than to try and
> determine if their usage is "typical".

ok.

> 
> Also related to above text, since resctrl documentation usually refers to counters being
> assigned to event/group pairs this is not clear about what the counter is attached to.

Let me add a text to clarify.

> 
>> +	remain accurate. Creating more groups than that pool (for example 64 or
> 
> "64" -> "65"?

Sure.

> 
>> +	more) can cause hardware to re-allocate counters
>> +	between reads. Bandwidth values may then be misleading, or reads may return
> 
> "between reads" - what reads are referred to here?

"between two event reads" ?


> 
>> +	"Unavailable" if no counter is allocated to the event. There is no
> 
> hmmm ... now it is refering to counter being allocated to event, but this seems to
> be referring to the counters assigned to RMID which would mean it counts all the events?

It should be "events".  Need to clarify this in beginning of the 
paragraph.>
>> +	user-visible indication when this begins. Users who need stable readings
>> +	for many groups should switch to mbm_event mode, if supported, and assign
> 
> "many groups" -> "65 or more"?

Sure.

> 
> Since this is not enumerated this may be the best guidance that can be provided ... although
> since the changelog mentions "up to 64" there really seems no way for users to know how
> many monitor groups are "safe"?

That is correct.

> 
>> +	counters to the groups of interest (rotating assignments as needed).
>>   
>>   	* To enable "mbm_event" counter assignment mode:
>>   	  ::
>> @@ -474,8 +484,8 @@ with the following files:
>>   
>>   	Determines if a counter will automatically be assigned to an RMID, MBM event
>>   	pair when its associated monitor group is created via mkdir. Enabled by default
>> -	on boot, also when switched from "default" mode to "mbm_event" counter assignment
>> -	mode. Users can disable this capability by writing to the interface.
>> +	when switched to "mbm_event" counter assignment mode. Users can disable this
> 
> Why is this change necessary? It seems to drop the text that mbm_assign_on_mkdir is
> enabled on boot ... but it is still enabled on boot, no?

Yes. It is enabled on boot. It should not be set by default. Will update 
the patch.

> 
>> +	capability by writing to the interface.
>>   
>>   	"0":
>>   		Auto assignment is disabled.
>> @@ -1791,32 +1801,41 @@ a. Check if MBM counter assignment mode is supported.
>>   
>>     # mount -t resctrl resctrl /sys/fs/resctrl/
>>   
>> +  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +  [default]
>> +  mbm_event
>> +
>> +The "mbm_event" and "default" modes are supported. The "default" mode
>> +is enabled by default.
>> +
>> +b. Enable "mbm_event" counter assignment mode.
>> +::
>> +
>> +  # echo "mbm_event" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>     # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>>     [mbm_event]
>>     default
>>   
>> -The "mbm_event" mode is detected and enabled.
>> -
>> -b. Check how many assignable counters are supported.
>> +c. Check how many assignable counters are supported.
> 
> <snip>
> 
> So many hunks follow and all they do is relabel the steps. This is a lot of churn for
> a fix.
> 
> What if "step a" instead just drops the
> 	# mount -t resctrl resctrl /sys/fs/resctrl/
> step that implies "mbm_event" is the default?
> 
> If so, all these hunks could just be replaced with, for example:

Sure.

> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index e4b66af55ffb..1c3c27444dd3 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -1783,11 +1783,9 @@ View the llc occupancy snapshot::
>   Examples on working with mbm_assign_mode
>   ========================================
>   
> -a. Check if MBM counter assignment mode is supported.
> +a. Check if MBM counter assignment mode is supported and enabled.
>   ::
>   
> -  # mount -t resctrl resctrl /sys/fs/resctrl/
> -
>     # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>     [mbm_event]
>     default
> 
> 
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 3838e0a13d36..8a0d6086518b 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -471,7 +471,6 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
>>   		r->mon.mbm_cntr_configurable = true;
>>   		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
>>   		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
>> -		hw_res->mbm_cntr_assign_enabled = true;
>>   	}
>>   
>>   	r->mon_capable = true;
> 
> Reinette

Thanks
Babu
