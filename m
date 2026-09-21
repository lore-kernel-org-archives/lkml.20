Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011032.outbound.protection.outlook.com [40.93.194.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34041395AF1;
	Mon, 21 Sep 2026 19:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018874; cv=fail; b=f6M9IHV5P105ydV76/V7kFA5v005CLLwEk95tp4EpiSGECV3iXIuoi8cRFIuMl8Xf8UWbK2CgN0lkjYhlVhCgUAa7S0rFRXEekH6yRjdbdkkOv1RhDV+EwWKngkmMDtKuov5H3+GoLyJylCOFJTn14EB0z84Jl/gnwR4lKKFq6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018874; c=relaxed/simple;
	bh=IVCEV9WhQzibClMQHk1FNsDDiVtcIQfdj0HqJptSwck=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Odc19yCs+lR3gqEBT4JPR7aTkXu7lzncddxDD9cKyS1ps6ZipWt0dhr4OoS79M4q5g4mWUWJFZNg6mM2X26zUM94hhNibiCyVYWl6jga1/tVik10+ie5vRy9cPpILmHQfgdyBUSre3P6ZQMIyvfTvPl3+IeUssXkXvISNXq4c+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=w4xuPf0/; arc=fail smtp.client-ip=40.93.194.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="w4xuPf0/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Heyr4jpGT/h35GgBEVve/1XeVa39Xc7YipgTfUNZV2UaLnVAYF4wIbvZPWzyygJPSyTnr9N8ada72J6UrzPjgz/J8YaoX9lH0M5HdT3FbBNTWbJfwiE6m0OKYzRoIZ9sz3zB+/5PwMNHQysznswRCJ2e6gRffy4hKNagpAEb0cHPMevsd064xZwYVNwBcD13sS+7evI20I9cHRel50XPNOoqbNUhWX0VO9OYACGKugrw/2Ta5mxLmx+mbNjdP/VuEuYvT7NnAaoEttyCEUgl5il6Rw8pNmRE5rhKxy2hm43iRFN9bYaB/x3jc0p8yoTCH31XI55E0s10KI9uzTAVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7V3TXD4D7XTODRxUNjmEDvbxuPrBtoWEwcJf1Q1Ol0Q=;
 b=NxHhZLhfh1xcvrsYa8BQmWBoLCR1RRQ8Gz4IoflqZL1aCgvOT8sTL3jcgsAD5Ofy7SB2Ykbf9ZVxKS/18iMk9vdGxpLfdsnIOvK17NDIpVx4z4Jr4m3vPjC39E3t2qFon4N3w2vVWVfPSG0/UafQd/hDOao045UqFsxGSE+AsrOTuHLYjG6BL973uSn+7GyK6XYhfRf+zsZJQV6YK0pjOSWwF6LTMgqV4P28UyQ9wiyGPtPiQh99hAG/Sx3WCpvKccOWtrb3uYUiEly3x8Fk0jpCGx1YzvxzxVvJfpkAv8XUiDIhY4FHUpfsqhpYLLMHWVP9faUmpgbaJeaZ8iliiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7V3TXD4D7XTODRxUNjmEDvbxuPrBtoWEwcJf1Q1Ol0Q=;
 b=w4xuPf0/xv6s1/gjbUFrIawmIjV/Q/Jmgk6nb3g+eMsqWVagt5TubCs/DVjSWaV8xsfHRamjiDbiq+OlnbCHmUhu3F4a+de8hXQ8SyTjWxjwjNeuIU6y1lgrjK8UvVEyWu2msNicgVHXe1ayMj5ZU/MlGKpe6VGfvacA7d8USFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by BY5PR12MB4292.namprd12.prod.outlook.com (2603:10b6:a03:212::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 19:27:49 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 19:27:48 +0000
Message-ID: <0729c208-b3d6-40cd-8316-185226838310@amd.com>
Date: Mon, 21 Sep 2026 14:27:45 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 00/16] x86/resctrl: Add kernel-mode (e.g., PLZA)
 support to the resctrl subsystem
To: Chen Yu <yu.c.chen@intel.com>
Cc: tony.luck@intel.com, reinette.chatre@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, bp@alien8.de, ben.horgan@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, tglx@kernel.org,
 mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
 fenghuay@nvidia.com, akpm@linux-foundation.org, rppt@kernel.org,
 dapeng1.mi@linux.intel.com, elver@google.com, jlayton@kernel.org,
 enelsonmoore@gmail.com, kuba@kernel.org, ebiggers@kernel.org,
 seanjc@google.com, peterz@infradead.org, chao.gao@intel.com,
 jmattson@google.com, naveen@kernel.org,
 ricardo.neri-calderon@linux.intel.com, tiala@microsoft.com,
 chang.seok.bae@intel.com, prathyushi.nangia@amd.com, kim.phillips@amd.com,
 elena.reshetova@intel.com, darwi@linutronix.de, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, chen.yu@linux.dev
References: <cover.1787772750.git.babu.moger@amd.com>
 <arCjBqclcfHBP8fH@chenyu-dev>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <arCjBqclcfHBP8fH@chenyu-dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1ef::18) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|BY5PR12MB4292:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f38bb1f-0031-4377-a26b-08df18166b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|1800799024|376014|10067099003|56012099006|6133799003|3023799007|11063799006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	zVqQ03TYRPoiRBajxNl2MyhtJJynolPuH49qF6qzs7J14eEyE8xbeeOxSYI/DsKzpz5dVBc9mpPjksciIdhlZHEXHOxxg9TE9TdIYCCQsg89GColu4r2CNmyPiJyY0OUM1mjkuqAOPKnXtBWfTQKAgEXknxwvUkUL1oojD2XyqQneEV3ihZfnsIwGoJfK9wEBJOwVUEtdsCPFDnlJyZi3M3VbFMhYFfFn/oZOxSXOaxIjPJ21hnTekZ8P2BDC5XUbIWazWr6F7BgKwN3u9xF0U1kUZ5FOch02GqVjSL+zEP1dpLnnOoI+5cp9PhYJHgEJE3ptzC4TB6TXHl2CcpO3TS1sKeUm+Vpmyy4yUFJ0H+svDm8ffSAsiYDXpfJg7kIfAACtzq+6vVfFc6h2V6d3hkGzt6PiLzmpCM79ONHGi4a8yZlsk5TDGfoe/oqo0eVZiYqQKfcBz1hgGR/Lvn2R5rus6h+oyOm9dvEexvBX5scNdmtt2HVKY92m1f0OSiGzLGESZ4JHHZsboem6QzCYY9lptpleafk/6k7mXyDbqMNurqDo0QrLqyVIcD9oFNlF9yAwRs4ztQdB1t/UmUonve5HW19KV3tnIi4HVFk2FRRCdFXLhUk/r4mxQhxJ7TxSF2ocJM/c7xmkFOzmb9Ij5FpM2owFnNYVI+bowvr7Wk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(3023799007)(11063799006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE8vOEZWaklUaGxQOFdSNDd1cHBYQ3dFUU40bFhwZE1tVkoraWJjY2V2Nms3?=
 =?utf-8?B?K3J1ZDB5OW0vMVg5T2N0YkNEVjVVWHJSSUFDRmQwdSs5VzIrVHIza2ZLMnEw?=
 =?utf-8?B?ZGxQckdmVTlqMHIyQ2hTY2hSdWRHUk9MeXh1Q0EyWWxja2lQc0JmMzQzSEZP?=
 =?utf-8?B?VnFSUUtHbVVVUElkaWtjL0wzcjMxOUFHREFVYTAxYnpESHBibndSai91d1Rj?=
 =?utf-8?B?eSsvemNvakdHWENxaE5LVmtxM0poVGhnNmVRMGt4eWJFbmo3MWU4L3JsTmVy?=
 =?utf-8?B?NGNYVXorL1BiTTdGQ2U0aHZpZ2VIdGJiUFNUaFJEanUrWXBXeTdwcTZ5Q1BW?=
 =?utf-8?B?cXNkcU5TS0lidHY1T0QvUHVZTWNBVERuWGhSeXdOZDVhTDhGRUgvVjRKTGJh?=
 =?utf-8?B?UzZlQlBWQU92MmRuSDQ3Yy9tRjdNd05LZVBKRWNWZDU4cm9tTkZ0WEE2eWdm?=
 =?utf-8?B?eCtISTAxM3BxdzEvR204bEtJcGtvZ0p3MS8ya2VrNEIxTDBtd2pMRE1hUWVv?=
 =?utf-8?B?enY3SFJLVExCY3o5SGorM2tNZVhzc05vSFhhcmxjRkpiU1I0NlJ3a095UGkw?=
 =?utf-8?B?WHYwdDF3RDdDUXFBSDh6NUdiS1pxbDU3VG5EcW9pR0VyT0NlY3hzTXVsaXdI?=
 =?utf-8?B?Myt1TVJMUEFpMDBWRUhISDZYZWpndWNvOWg0V1UzNm1FRmprYUZ5Q2VHZThz?=
 =?utf-8?B?S2VLK3ZuZXJ6a0JGYUFjY3dWV1dWWTEzMmgyOXpMK2lyeUlaR0xTOEpybXdi?=
 =?utf-8?B?bnBRYUpHOGJQcFZLK0E3MkhrV3hMMjlmd1FaYy94anJqaGJxdmdteWF1TTRu?=
 =?utf-8?B?TmxsQjEvcG5pQUlwOHRTWjB2dkd2L1VmeHAzYWNvUFpNRTJIRmZ6Tnh6Rlh0?=
 =?utf-8?B?VTZ5cEN4QW9Jd0ZLci91V09IbEN0VjlQck4yV3RNYXZieHV1L0lmT0lLZlRX?=
 =?utf-8?B?VnN2NktoZ1B0SjBJYUZxUGlUTExpYmEySjR3VGtlaU1iWWpPVXp4VWE5YUhM?=
 =?utf-8?B?aGFZSXFRZ0pEN0Y5Qk9JL0RQeDErTmd4c1BmNWdMMUpRVkZ4ZkExdEZQWW5n?=
 =?utf-8?B?MUhrd0FSN0hDYjdIbG1nbnNpZmhxMXlxNEJKWVl5VnNoMFJJU0haMGZFcmZr?=
 =?utf-8?B?V1RTUGxZZzYyMzVWWUxPQjAzOUdwSmVWcnNCSkJqeDRGMTdRbXhjVlVyYTI5?=
 =?utf-8?B?RkhoQ3JvTkVDMVdnVWtoSWdSZHZyTTFTNzQxcFJLV3A0ZEo4Z1djR2UyWUZR?=
 =?utf-8?B?WHFkbWZGckVmeXBsVWR5NDF3YkZ2akZCOHp0RVVBMVo5c0FtY0pwa2hGcEFu?=
 =?utf-8?B?Sk9UNVY0YVZkTHNDUGVhbkROSWdPOW1XemNQeDNPSFk2NmFHTE1HcUlpUHB5?=
 =?utf-8?B?clgwMjI5NmZ0WktIYXliT09RS2NTUVJob2ZEUm5wdm43azVOdnFySllKWDdI?=
 =?utf-8?B?SUV2eC96ZGpOdnVocGphdEJQUXBsUk5sem5Eb1R5TDhKMW9wQWYyN3VEaW4x?=
 =?utf-8?B?cnJvM1JESmhxWFR6WTQ5RmI0UDVnZjB1MHlzTHJWTFVaRlRCQUZPMm9WWEtM?=
 =?utf-8?B?dEJkaFlpa0pNa20zSHN1R0NXQjVqRzNEUWhsanF1OVdpT3R6VFlxSytHQjJC?=
 =?utf-8?B?RjBLQ1Q2VW9GQllUenZNdnNjQXlKUDh2RmtxcXM5QUlCZU1NdjljV3h2Wnhv?=
 =?utf-8?B?TFA3WGxxWVNzTitTMjBEZ3Z2MGZ5RmNkdWRMb1ZOMWJ3L2REMHl4MzdHWEVl?=
 =?utf-8?B?bXk1MnBISURTNEtoWHhTRFE5dnZkd2trYjJLeVErN04wSis2MUhaQUk5QW1K?=
 =?utf-8?B?Z0NaN0VHdmhOL1o0cEp4bHk2NEI0cUlwZzRKL1JaZndwdkVlY2VYZUdLZHYr?=
 =?utf-8?B?WTRnYUpWcmZ0UVRnN1ZPNjJzL3pyN3pZY25mbFlKRW5objBRQU02TC9IOWhx?=
 =?utf-8?B?UmdhSkpkYjBTSkRPankzSGhNRTFGcnNOaTJVbkdFNXlhR1Fzd2Z1QUh3enZh?=
 =?utf-8?B?V3QyUG5uM3JLb0g2aHJGNDFBTHAxeHY2MVFPcUFid0s1K1FwYThvSkFhUVBo?=
 =?utf-8?B?eno2N1lDQ0tBNnNEUHBZbXJlYlN2ZWZqbUpVb0oyR0szbFQrNWdLR0d6ZVd2?=
 =?utf-8?B?OTA4MzZWWWlwamRUUkhVZFIvM2MxUGRsbVk1aE1QMEkyNzhUMjlKTzEvRzBL?=
 =?utf-8?B?eU92YXVUbzIwVmJXS1R2THpsUmtSbnpuR2hHZjJSNTZtdksvUzZ5azYyRXh3?=
 =?utf-8?B?NHljTE1LODBHTjJteWZjSS91MkxXbWRYb1BFbWljcjVBT3hhSC85WUJCQWcy?=
 =?utf-8?Q?MG3XMenzvusOyQA8IB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f38bb1f-0031-4377-a26b-08df18166b9b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 19:27:48.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGyxT+DIyu8A2vNeivvJAXFrju3ukcFqVRii5dSGldlxjpEJ9DIkox5X/0S6mtp9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4292

Hi Chenyu,

On 9/20/26 22:22, Chen Yu wrote:
> Hi Babu,
> 
> On Wed, Aug 26, 2026 at 02:32:14PM -0500, Babu Moger wrote:
>>
>>
>>    # Create a CTRL_MON group and associate kernel-mode allocation with it.
>>    # mkdir ctrl1
>>    # echo "assign_global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1//" \
>>            > info/kernel_mode
>>    # cat info/kernel_mode
>>    inherit_user
>>    [assign_global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1//]
>>
>>    # kmode_cpus and kmode_cpus_list are visible only on the associated group.
>>    # ls ctrl1/kmode_cpus*
>>    ctrl1/kmode_cpus  ctrl1/kmode_cpus_list
>>
> 
> Just curious, would the other existing files like "tasks" be exposed under ctrl1?
> If this ctrl1 is used only for "kernel space" mode, would the schemata of ctrl1 be
> shared by all tasks in the system? That is to say, it seems that there is no need to
> expose "tasks" under ctrl1. Should we hide "tasks" for the kernel group? Please
> correct me if I misunderstood.

No, I don't think we should hide the tasks interface here. It provides 
the option to use a group in a mixed mode.

# mkdir ctrl1
# cd ctrl1
# echo "1,2,3" > tasks

At this point, PIDs 1, 2, and 3 will use the schemata from ctrl1, 
regardless of which CPU they are running on. They will use the same 
limits in both user and kernel mode.

# echo 
"assign_global_enable_per_cpu:ctrl=assign;mon=inherit;group=ctrl1//" \
           > info/kernel_mode

After this, all CPUs in the system will use the schemata from ctrl1 
while running in kernel mode, including when executing on behalf of PIDs 
1, 2, and 3.

Essentially, this provides the flexibility to run in a mixed mode.

Thanks
Babu
