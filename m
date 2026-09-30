Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012018.outbound.protection.outlook.com [52.101.48.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82BA46C83E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 22:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808352; cv=fail; b=btvtyS4Z8Eg2w3kbqu0LGV0zrUIEAn4AZJPuXBFYLcVWb8TPJRjVZfH/rRPApFxAOzm1RVOm9OLVeF3T+GKbz5O+oEqSHhdfNXRQO6UKtZL5Iel21X2BopYhqoqv6nRAtwLJBYpiu/u0iLX/7kYXKTAjpQOsC2t0MoQfRSzJDHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808352; c=relaxed/simple;
	bh=OY/Qrccyo0OaDIXQMEdVCnLzmgRlPvAIj6gN001hGZU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BAjp0D0HY+UUUhtl7KpdfsJMpHBZxQ97qosnRDLzDcJkGIKk0TjKo8cdQspc07p+hEqmcOm965MlqwqraI5dlIGUMpSlZ/16BvLPmeCZyUoImz6J2eesRKYRYObS5oUWhUUHTlgsVCQ/TpxeAliVFf2CCQcGEDJtDgCDTSN5r5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=a+BU6R+A; arc=fail smtp.client-ip=52.101.48.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="a+BU6R+A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnOx78GC6myOXnNnnK8rlWrOOu2k4iY4rOLVjE/SamJiOiZebic0Zi4REpW1RJ1QvVPA6zqeYsbRLs+NmQUEmCgMonr6qP+7pXfH/Tx3OR3hIyBQAUjKTQtYlYA2tYmKU2FfzBpD8lmUhsjeBss8Mmcj73EeSrz7/PSw8E3Ei0P87qtlObcGTYeX6x3ZUMD7FuigzurY9JK16+v7EkwwkaD2bxgtp8rP4JS+rH0mIMuhUXeOjjHFozv+WrT6L7rkRVc/2evhOcU1hq4G9UusjdSisfvB5Gl9oWrdTcX75/55YK7peVJgtzRy6BRRJvQq11fyNHQOAf9TXbmcDUe1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvNbf62MxFcXpFSSxFPLfUF3op9hnXw4csSCpKO32/w=;
 b=r0r7WjhVZtH/n5rH7inQPoicr4vbtHd/Trio321e/ZIKm0l+/R9jhRX8MKCmsp3EAr2KonHefADtx7FQuv7D15QbHHXqeESFoEYSeZGu7janWEmQohglKidrQ88VTJSh+F/lFTUqclDgluthrp3JhcYeACIEG4dCnNdPzmC3cyinmyVss+sHOcbQYKB+DSHdnR8RWmKyvlfYl4ttZx3HDx6UL2+y+vHwHKMoHvt9e0JZgEwXQjXpHiL28dkSHL7nwwaLGvEFVN1ANrWfxLD+3wY3E2K87XABg1akC3m+e2mILeBo2GFufjnuaZFtn5ULLfGRpiXEkmUD1cJRKJdJpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvNbf62MxFcXpFSSxFPLfUF3op9hnXw4csSCpKO32/w=;
 b=a+BU6R+AkDHPyGGHxy4EIsU+mPi1zkRFUfWAUpuAlNoptjiYG4b3ojwKi9olC2aIKAqBbb6gKiEWRY7dw38Rt2ls1w6y0rg2h81bdoyaD4q7DpAmvdi4c3jyEC6qunGVYI3yO1KpaR6KKEFAnVWynZ2G5Q7fv90If4wlNU1Spds=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 22:45:45 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 22:45:45 +0000
Message-ID: <1bcdfce7-c3cf-49d4-a3e1-e293edd1bc62@amd.com>
Date: Wed, 30 Sep 2026 17:45:42 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/resctrl: Rename AMD resctrl MSR defines to use
 MSR_AMD_ prefix
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, bp@alien8.de, tony.luck@intel.com
Cc: tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, Dave.Martin@arm.com, james.morse@arm.com,
 dapeng1.mi@linux.intel.com, peterz@infradead.org, thomas.lendacky@amd.com,
 chang.seok.bae@intel.com, jmattson@google.com, kim.phillips@amd.com,
 prathyushi.nangia@amd.com, acme@redhat.com, nik.borisov@suse.com,
 namhyung@kernel.org, linux-kernel@vger.kernel.org
References: <9ef5ec08d79c9c84f36b11251bd3189af1a38d52.1790721445.git.babu.moger@amd.com>
 <1f27dd5d-eb95-4eae-bbe0-f57ec6210a95@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <1f27dd5d-eb95-4eae-bbe0-f57ec6210a95@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0039.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::12) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: e74c1360-2c4f-4fd9-de8e-08df1f449077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	/h5ouQia3Tsu45bjQpV3qmdK5q4dDA7V8BAW1wV/U+tfMppykiqLizgo/nkxApKXkU+q8XUGEHnEsgSDd3A7EL2MtcD8zq7qQ7eNvzdcTQkgNo/ark5Kwsnvr3JcpCYkH4fCBXwTPQ8qeWqg1CfN1klYb+PXHmzfPyTlDs7Xl0GzcbMY+w2TVUuu9ntdEiyGhcPcVv9utiyfHD57A1AAbnQsLthwICFf0iR+4sBn+Fyb+7mYNysPMSBxaDBX93kirqzzJh5DfitwJhsbER/E6SHf099yzu82IBnkUfle309PYpJaxNryncHKOcAFERnNI+3LVO9vAoL4CSs3vuvZWsdSmTvJ3+sDn0ATs+vCJld04/Q2Eo23va29TRClpPe5MKXuid9hdQe0kiD3Lgl18jtT0r+6G1HmHSSUq6km2GOHGpysJUqXPsM100sE6uO3qi5fHLoPSLyr2lbgQ0Sid39wywfSCBHgA1xAysfIeUmfGVaA9448Pd9qeG/DEHhgSqN2FPOihAvuNM51qP3Y0jsD3TEmP33cI8yopViyR1FJL1yBZXE/aNgs4NgNuZiULA7frCH1JcXho+zXTTYAvzsj+5ouVor5b8yKtmZra+KuQeSDwj51VqJkpRz+hM4byuJWsxGm42qicQiDLlDox/kNPKlrjor/rZKkdsHqgjU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGNIcmtPQ0FtWGtsOGRLM0IyVTIwYzg2bFA5T3ZpSDhHLzJzc3p5YTEzUWk4?=
 =?utf-8?B?RWxPMDJmTEREWHgxbnYzOFdvVXk2Z3BYUDdRd1VHQUlNYWFRQXZxZUNBWlUv?=
 =?utf-8?B?QktLTXRDVndPaHpFMG52WGdSOTFBdjNyU2kzRkE1bTF0RzV0TXJhRjh0ZHpw?=
 =?utf-8?B?QTFCeHpRMWtVd05TWTFUVlUwLzROZGdPQzdtaHFIek5MT0YwaUVXVHFoWFpP?=
 =?utf-8?B?cEwxRDRhaHFuNGo2eG5wMzlLcHZaWnhGcEtmR2xsVkJSQTR5OWdmWVljOWo0?=
 =?utf-8?B?RTlxbTh5bDd5c3o2TmV6Q3VwT3UyNG5XODBiOUxURGtrZGRJNHRCT1FIQm96?=
 =?utf-8?B?NktKaGxkYkxSemQxdXBKaERCNlRabnFZM212UlVhRFRHL2YrdHZUNUdwdUF3?=
 =?utf-8?B?eU1RVXhGNVpkMzVwTmdlRHRBaGhCZEFIcWkrS0pza3JNR0RoMkt4M1RWUDZE?=
 =?utf-8?B?dEoySm1aeGFSSDgrSjVjM2xtRHdSOEhmYWxCY2xtQkY1anJQWHFIL05ocFdw?=
 =?utf-8?B?UjJ5VVpBR1hlUXRWeXBSb1FpakhtaDZ4NkkwZGh4MDZwZTYvM0xzcUhIcDNj?=
 =?utf-8?B?Mkdoc2M1b0Q0NHkwWUw1UmJpeE9ZQkh2NU9RQS9ZRTVhRHpxaWY5bnhZVVVM?=
 =?utf-8?B?Q0Y4L3R6VTNBbkEzWEdNN1BMaFg0UStqY1Q2WlVRc1ozMDVQelgwbUlvdm9F?=
 =?utf-8?B?aUNlamlsbG15bjBZSFBvbkN2cURQNlFqNXo1L3hmWkZCaHg4MkUra3FucVcy?=
 =?utf-8?B?OGJ2dklySCtjd3pFTFoyZ0J2TW5RWmlvbm1OUnprUlZIS2ZubkxkNWE0Qms3?=
 =?utf-8?B?eXpJQ0lqdUVhUFMzczNUVDcydUVpRkx2NzZ0TU5hbEc0dHVjZjdiUk5mTkxH?=
 =?utf-8?B?NkRFU2Y2SXFRYnFtU0t6a0NBMTRyVDRwUy9SM0JlYnVyVVBEb0pGNEVvTWpI?=
 =?utf-8?B?ZlFtemYxUmJSdFVoUGwzV3cyYzVzZW1yc2tVYWJFc3owOE80K3dqNjRNenpC?=
 =?utf-8?B?TnlYVSs1dC8rL3lhR2VlakorSW1aTUUxc21XL0xwcURaTTh0cmZhYU9FNTVL?=
 =?utf-8?B?SDdleGU5MFM0dk9tZkx5UE94bEpuN0ZXYmhuU25kZGZRYWwrbDFmUFZ3MklY?=
 =?utf-8?B?Uk5CMzdEdGFoeW9Ic0VVRzgwRkxOR3NwbTFRWThrbDRnU3AraDdXU0kvanJM?=
 =?utf-8?B?RWdabm51aVpvRGpYMU5aL3lrZi9qUjRGYnlNVzYzYjRuOFBESmV6OGc1em9q?=
 =?utf-8?B?bW9BZ3RrdnY4QnoycFdUWmFPYWF5Lzhpci83aDlYRzB1TEVRNy9ORzhtM3VM?=
 =?utf-8?B?VEY2TUlqTlFhckU5NUUwR3pxTXhkT3c5OHNoRjdSNEh3UFhnd1FLYllxU2lR?=
 =?utf-8?B?SW5naDZNUmhRb0tJR2NsWTFiQ0FCMVFrd1RrVkdOY3UwWFRsREhYbHFjeTY4?=
 =?utf-8?B?RjNkb0FET1YzMG4rK01VRlcxZWVEemZEMEhQandNWjB3T2lGSHdXcHhBN0JP?=
 =?utf-8?B?TkdvQmhTenVsTVFqOW95aTh1Q1dyOXE1N2JQL3N1ZkdEWFducEgvRmRIZldY?=
 =?utf-8?B?U2cvUmF2Nk5VK1pWTjd2WWVTS25qcmhPQmVJOEpNYlp1cWVPLzgwV1FzUjBL?=
 =?utf-8?B?cit4M2JMUnVWRUxXMDdUenhUQ254ZGtWTDlUdFBOWGZKN2ZXMlBjNnhYR0hK?=
 =?utf-8?B?VDVWVTNNaSt6YjdFU0c2eElwdHZ3dXE5ekdib3JGdW13a05DMERwZWtZa3cr?=
 =?utf-8?B?WElzNGhMS050OTVIajU2Yms1aHhtMWcwSHhxbVU5bHhIUVFpZHVUUEJKTlFy?=
 =?utf-8?B?enpWUitGZHlOMnBUMjRRbDN5WnU3YkdZbzVSN1dvTi9zUWJDY2puZjhWOEkv?=
 =?utf-8?B?enROVHdja1pENS9GTkpNZjFFeHRudnE5ZVdFNy9uVmVuR1MxMy9LV1ZVQldC?=
 =?utf-8?B?QmVRa0JzMjdJWnZvR1dmN3dtTldMd0hPUS9BSGQzMHczcFFhNWFtOXhUS2Jl?=
 =?utf-8?B?WkRBeDFWV205aC8wNWllKzZ1TUJCNEN3THMxYm1TWTV1TFNETnhkdUJGQldp?=
 =?utf-8?B?THBhbXY0M1NZdmVucUl1N1grQ3oyR3VuZ2ZNVngxelhwUEFiYVNZbTFVM1N3?=
 =?utf-8?B?SDZQSHovc0pod0J2VE5rRmpFVDlNYWZiTFZQSlpzUGRsTENsWDhSWGZtc0Jl?=
 =?utf-8?B?d3c2cnlOSUlncHhUbVhHaDhtdnpUSFhXQ2l1dEZGY0gzR2prdGh6U2pYbHR5?=
 =?utf-8?B?VXA4b0tEb3g3NUFtRkluK3U4VjlxRUhoNCswZEc4eDhONklrNFI2QThhckxh?=
 =?utf-8?Q?GyVYvZ6lFqYalUoXYH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74c1360-2c4f-4fd9-de8e-08df1f449077
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 22:45:45.3174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnikJoOameEX+0XUd6KHdr0Z1+0Tgc+HDr63pWB0BSnjX9EpSfCgHUaf1o4/wyYP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055

Hi Reinette,

On 9/30/2026 12:23 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 9/29/26 3:39 PM, Babu Moger wrote:
>> ---
>>   arch/x86/include/asm/msr-index.h          | 10 +++++-----
>>   arch/x86/kernel/cpu/resctrl/core.c        |  4 ++--
>>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 +++---
>>   arch/x86/kernel/cpu/resctrl/internal.h    |  6 +++---
>>   arch/x86/kernel/cpu/resctrl/monitor.c     |  8 ++++----
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c    |  4 ++--
>>   fs/resctrl/rdtgroup.c                     |  4 ++--
> 
> nit: subject prefix is missing the update to filesystem code:
> 	x86,fs/resctrl: Rename AMD resctrl MSR defines to use MSR_AMD_ prefix

Sure.

> 
> sidenote (not a critique of this change since it just renames
> existing things): we should aim to avoid using architecture
> specific register names in resctrl filesystem code.

Agree.

> 
> | Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> 

Thanks
Babu
