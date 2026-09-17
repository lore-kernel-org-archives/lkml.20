Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241225012AE;
	Thu, 17 Sep 2026 17:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664942; cv=fail; b=iUWUkKViEjNxC6WuSpcRXxgThSBySYqT/i2AsPcC2Ge7zxgnu43OhZGq3kK/5wB3DjX4YK3Zr+DxQDT3j+NA73SZKAWMU8bI0HG2ZrGxI0WA4RhTeLBMg5KJTZv+LYU6perxOzI3BkLdMRAkrXpYVlhhOmJ99wfewxcPo7O/uBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664942; c=relaxed/simple;
	bh=KzZM3b+rE0IaiYfZ/WX8J1Nhxn1vodg2flhIXBigC+k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M02ZDHYW+cX+6n0KQ1mwxOzFp0n3PrB/V7PE9rj0eU/BVNNSXQH4RIaWFjDaMVmc5NFcsl+G+zxAyhQ85IeIDET3XBxUI3nIBw7El2VaXq1gQXmx+JZG3LxVXlB+YD8V+vTiyV9JnNSOhshRqzJjRzRbGR76qNYVtPSCxFq9WK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CP/LiFqk; arc=fail smtp.client-ip=52.101.61.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CP/LiFqk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDVY9YcRoX+g8OfvNzQMNAN2r1BJK6TGWDNSY4mqF6QfxoEViVGkAI2E0cZ0w0o3UXaWT8W4y8ttITk+uIQUfx8us6Lj4a6LBjAuYQ9J0gSETbxWDEPieTXjZ3ZUZCO2OgYpKVCjl5bOcWa8PWfxoipGXC9YJ+fP2Jm2Q3fARX4kQYqOa8G6g18Vqx568AH/lvlBC+ECR+ICmXLJ7duLwOgzCcb2MMOprP5j+LqQFJtp3yJpkw1uPa7rLD72UFCFXPnV8vsnrDAIiBxp8ye6T0788Ff6VPEKbDM8XkQreFXj4/tUPHfDusm7OScwU5X4uNBnmO9sWcR+bRacr4VWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9rM9vc6eikW1Yapn4wkVWNGtMnCbPq6QVFGOUKl9OxA=;
 b=XFcfidrhQNU/cQc1qEdPi7pNsCLdYegZrQ6hiPcRHrAZzdXEzsidI8z30FniRFYlmk9OEdiswcBv5Hl2EJJ2HUCqXdAjM9XY0a33vCPXRmbFbCUp4Jdrk6ZxT+WBgW3t8pnf9Dhx2NkBpYpMF7mxWI9revyU2PXQEz6JD8+Bo5TbSR5CcL28yK5mZjlf8d3DTLwvr1txA+a1pZm7gVNHEwQxZgTw74ON8+lFiFlpVP0dAwuXApthrQxA8V827+MZcp7tj72hBiJ8Vi4E8QbcKuQee61RFHZhusv7eiDw0kdve2DbR0A3DOz+V71RffuzgErMiS7vN42IT/3xP4Gasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9rM9vc6eikW1Yapn4wkVWNGtMnCbPq6QVFGOUKl9OxA=;
 b=CP/LiFqkVrqiRVV3aHq7OFeipBOk8z/zmwdnDLg/RlED8YXFP2Wmgzr74gtY27FhFrt2zwlKL4DWU0EHgTpzoJ9B+ZTHNCrw6wfAogQhVzTdo4XzqJqETfBiXUiXNqK4TdewUeK88HgrUekjrY00zExzuq1UopvoHpwDTLa/tjs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA3PR12MB8764.namprd12.prod.outlook.com (2603:10b6:806:317::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 17:08:26 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 17:08:25 +0000
Message-ID: <ae54323b-d687-4340-9134-f8eb9fad859e@amd.com>
Date: Thu, 17 Sep 2026 12:08:21 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 01/16] x86/cpufeatures: Support Privilege Level Zero
 Association (PLZA)
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, bp@alien8.de, ben.horgan@arm.com
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, fenghuay@nvidia.com, akpm@linux-foundation.org,
 rppt@kernel.org, dapeng1.mi@linux.intel.com, elver@google.com,
 jlayton@kernel.org, enelsonmoore@gmail.com, kuba@kernel.org,
 ebiggers@kernel.org, seanjc@google.com, peterz@infradead.org,
 chao.gao@intel.com, jmattson@google.com, naveen@kernel.org,
 ricardo.neri-calderon@linux.intel.com, tiala@microsoft.com,
 chang.seok.bae@intel.com, prathyushi.nangia@amd.com, kim.phillips@amd.com,
 elena.reshetova@intel.com, darwi@linutronix.de, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <cover.1787772750.git.babu.moger@amd.com>
 <1e7f4c3b0cb570f6e501a01d361745b180271f30.1787772750.git.babu.moger@amd.com>
 <0b4f2242-c22f-4557-99cc-ff622be9ee2c@intel.com>
 <d528fe23-3c1d-4eab-99ba-567983dd805d@amd.com>
 <75120223-ed93-478d-924a-12507a1fb3c6@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <75120223-ed93-478d-924a-12507a1fb3c6@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:610:11a::31) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA3PR12MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: e8217e66-5c88-46bc-ca3b-08df14de491d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	l/uaFNF+Dpd/E8HmcgC8Wizz2b5uAcFmyKngcRNTBDm2yUALt9Jtiy2t2k+kL3oLvP25ODZ/vMtMRfzmMT6OpX657t/RrBv2eF4fgOTxZRTZT10YPsYwXS5n8cmNXc//PQKFaKfRrQylzTusG0q3J0LrCcKvLNcuRSe/FAoGN1Jz+DTsnQyrNijzo6yYVvmD3x8Wz/RlxMyWbd1leZWSDuvCDHnZgnBBwUwS//MUvTEi0xmIAY0ssWJ76d2K6hucxSKES55xAzXTG2mPIYwF825fxGjaVApWCbtUKP8swNN+0Lub+OXVD+PrxIS6Se1f9CEisvzHtG9HQVOpeMFYmGRMZWG766XXzG4cJFt1OWS2dbedYQPc356QqSgSjJmu5bscysQX2v0cQ9mTH5zrQ+8qL9S1kQBDBAj+uF7ZyIrutsXZhN2WPM1buLslERkM805+8CLtd6mLu7LK1icI1oK6k8XR9En2j/JYBEoc9/7mttAi1fYVmWtnkIU+PLds90+Jq3sX4vci6J41QXnqVOKjX2SwDx5zB0ChslOfbI7pd3xE4yOnVCTFAk6DMSpKpjUp38CdMhlAsr8LlBka3H+CwpuSEZG0AakgOKyfKtAuKuZI+Bmg4NYwJzRBNc9V2j392Wv96GGjPna/fjw6OObOvDaa3kgfmZPuhMw2D+g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFNJM2ZkNDlsUzNPV0xYQ21ONlZXYmF0MDhFejZmNTJVaktSMnE5eUhjMkR6?=
 =?utf-8?B?Vkg5ZWNpR1l4Zm8wSE1DbUZkblpjODNXS3EzRng3YU1lcEJNTnlmZFpFM1F3?=
 =?utf-8?B?dzV6ZTc2RjlOVkh3bUNQR0h5bVRqUm9uaEJRTmVNbWNtVE5XaU1ZKzJxeGJU?=
 =?utf-8?B?aFdoZ1Q0NkpXMTNUOHRlME5jQ3Q4cktQVStsUkxDeFNLSWZjTitocHFDTTRW?=
 =?utf-8?B?WFNwTW9pRG95am9ibmVXRlh0UjBtS1MybzZxUSs5KzdzaUVMQkt0dXU4VGoz?=
 =?utf-8?B?aExKaEoxMjNJbzErbzF4UFVkVDNadHdEalUxelhLNEM3ZkhHMnJVSnY3ZXFB?=
 =?utf-8?B?NmpYTjNRRE1XSTF4ZGM3a3JDQjhwU0piYjBKaWJFQnhPYUQzYXlDMC9WaEpm?=
 =?utf-8?B?TXNZMWx4SVMzRUpXczVITjZHS3VuVURqQnlvRU8yaW12RklKcmhHcHQ2d09m?=
 =?utf-8?B?Ni93Y0Qrd3p6WXFtcXpTZnJ2dXk5MzNQV2c0R3BzeUhXQ25wTWo3QWNQdXpp?=
 =?utf-8?B?UlVOVWZyZEFMam54ditFS2trVVlOS3M4bmtZYWx0UU84cFFNTUhnKzFHR1NQ?=
 =?utf-8?B?cXo2OFltaW93ak9OMWJoRE1acllPOFRHYWNKWDFKYkhmZGlCaCsxSDZQdTRk?=
 =?utf-8?B?SjJhcG9PRVlJVDFZWnJEV2hEOEFPR2pnYldWM0cwLzNkL0pqeEQ5S0FaeW00?=
 =?utf-8?B?enZHbWZuYklBaERsdXB0R2puUmk1eVpUSjN6RWFMWnNYd1pwcysrSy9ST2Vy?=
 =?utf-8?B?RS9EUFNsbDZhRUJzNWl1WWpBM2lxamRFc2svR2xwS1p4aHJUWmhHNmhIWFA5?=
 =?utf-8?B?VzBxMUg5dkgrM2JCcXlvUVJtbzNoUWdFUldTQ2pKTjNzN0RVWDd0NWd5dHpo?=
 =?utf-8?B?WUpvMlpyQXdPUFRhMlM5VmR2cW5RWHFHVzFJcDRUeWY5d053dTZueThTZndW?=
 =?utf-8?B?US8yTDhEbHdaN0JYK3VweE4wekdTczRycHZSTmVXTkk0bzBhQ2l0UHp6ZWJn?=
 =?utf-8?B?NGptYzlBTHI3dUZ6Wjh3NStobHVHZGNIK0pZWFU5THRSbkJ6WlBpWXR6MUxN?=
 =?utf-8?B?M0tnQm4vdVBrdXBFeU0xcjRpdXJvSUNvVUloeVJVeEdYMTlqY0hrcGZna1RO?=
 =?utf-8?B?ZHpPUXBlRlNqMjNDTjJId3BvVHhTUmRZUncyd0UvZG8zQ2lYaFA1bUJxdXlE?=
 =?utf-8?B?WEN4UUYzT1RKY2wzRHNJanhqVmUwZm5EYmpyNXp2dnY1dG10aiszT09aYXJk?=
 =?utf-8?B?WVVNVmlOWnN0QWpqNDdCV0dLU3dJRXY3Tmh4MDdxWDdhMnlZMjI0c3FQSmtN?=
 =?utf-8?B?eDNORFJaN2x1bTBmOVp6eTNTdXlyVlhTTi9WQ3V5NGpBbTVMbmNXazBMSzJS?=
 =?utf-8?B?U3RPbmxFOUMwdU5md1JXQ2d0YXVWMDdzVDRRSXRvbHFxL0lJbDhYaXlxNlVY?=
 =?utf-8?B?ckFKeitSYVo2QUlGdVRFL1Q5dXFzNHdZUWUwVUplV0M2V0swU3pRVENSdVBw?=
 =?utf-8?B?dUhmZjd2SUZvNWNnR2RWTGVScGszWFlhdjdST0NadWdhMzNISWpocmVkMEZG?=
 =?utf-8?B?Y1dFb29JNFBhT1QyOU1VdGZhZk5TeVpTNDdOYU5waWxCQU9uMStrSE50T2dI?=
 =?utf-8?B?bUtJQ3p5N3FyTDhvMC8zdUhVZDExMHhwR2Y3UE9mQ1VWb3IrdzlFV3p6Ulcx?=
 =?utf-8?B?U3h6dm9zb29LNG9nMFk3Y3Z4bllUWWszemJFaW9Wam9NUjd6R2pqc3ZiUSs0?=
 =?utf-8?B?V3VsS2FKcW94NnQ3dzI1ZEx6eGRRNXVCOUIxZzlBTVlnb3JuWnhuVmlKK0xT?=
 =?utf-8?B?Z1hOOXk5VTBiWkpzc3B0VDM2Z2d2WWZWNnlpYUdvb3VUZmlwQURHbmIxdUVt?=
 =?utf-8?B?M0NDZ0F3T1dyTnlDUk5NYmhTUnF5dGdTcWJpYWtSK0lOVkIyTC9DUi9veElq?=
 =?utf-8?B?aDBXYjcyVHROL1IzMWcxS2dXY2ROSW1yTW15b0VTdUVhRkJVNit5UTdUczcx?=
 =?utf-8?B?eXJicERNQU9XTmR6bUQ3dXJYbXRVQWdpS3RIbEIxaGFRU3JNaHhJT2ZqZ1R3?=
 =?utf-8?B?TjVpekpsUWlvRXNodno4ckdYUjZHNWpBL01hYXN6ekkrMWRIYWFXcDBrZ3Ex?=
 =?utf-8?B?T0w0NWJscW84eW9tU2ZJM0kxOU5UOHJ6bXF0Slp6OHcwb2I0VGZEa3RiRk16?=
 =?utf-8?B?WklSRkErZXRtZkNtaFpKTllXMFhRaTZIUHpyVFFBTFlJVnpUV2hlMnNkVFBY?=
 =?utf-8?B?UzdJVVlwaXJ6Q3dKU2dnUW4xd0pqZFhGRHlxRGNpQk1NWlAwa3RVTzVKUTBQ?=
 =?utf-8?Q?VseENcMsc4xtBcDMnd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8217e66-5c88-46bc-ca3b-08df14de491d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 17:08:25.5451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q15lsCxsJ1EBMi1DAXyYRPSgf1k0gdxcoflI4JJxv8lSc9t+MMTRavh4qT2G5kpt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8764

Hi Reinette,

On 9/17/26 10:04, Reinette Chatre wrote:
> Hi Babu,
> 
> On 9/16/26 1:45 PM, Babu Moger wrote:
>> On 9/16/26 00:12, Reinette Chatre wrote:
>>> On 8/26/26 12:32 PM, Babu Moger wrote:
> 
> 
> ...
> 
>>
>>>
>>>>
>>>> PLZA also applies to cache allocation and monitoring features and provides
>>>> flexibility to manage allocation and monitoring associations independently.
>>>
>>> This reads like an afterthought. Are users expected to use cache allocation
>>> while PLZA is enabled? Since only one resource group can be assigned I expect
>>> there to be quite a few sharp corners when both are in use. Kernel work done
>>> on behalf of high as well as low priority work will use the same cache allocations
>>> and thus neither could actually get full benefit from having dedicated cache
>>> portions?
>>
>> The best-known use case today is to leave both cache allocation and
>> memory bandwidth allocation at their default (maximum) settings and
>> enable PLZA on all CPUs.
> 
> Interesting. This sounds like all kernel work can access the entire cache
> and thus evict data from any user space tasks that may have used cache allocation
> to avoid interference.
> 
>>
>> Users can, however, configure both cache allocation and memory bandwidth limits. In those cases, there can be corner-case behaviors and trade-offs.
>>
>> If you think the current wording is misleading, I can drop that text and rephrase it along these lines to include both cache and memory.
> 
> No, the wording is not misleading. The description just focuses on memory bandwidth
> allocation leaving impression that the feature only applies to that resource when it
> applies to all resources.
> 
>>
>> "When cache and/or memory bandwidth associated with a CLOSID is
>> aggressively throttled, and a task with that CLOSID moves into
>> kernel mode, the kernel operations are also aggressively throttled.
>> This can stall forward progress and eventually degrade overall
>> system performance.
>>
>> AMD hardware supports the Privilege Level Zero Association (PLZA)
>> feature, which allows the CPU's CLOSID and/or RMID association to be
>> changed during transitions from user mode to kernel mode. This
>> enables the kernel to run with a different CLOSID and/or RMID than
>> user space, improving system performance and/or allowing kernel work
>> to be monitored separately.">
> 
> I think what you have for memory bandwidth sounds good. I do not think
> the cache allocation and memory bandwidth usage descriptions should be
> mixed since the implications are so different. Could you please just
> add a snippet that highlights since the feature assigns CLOSID/RMID to
> kernel work it influences allocation and monitoring of all resources,
> not just memory bandwidth?
> 
Yes. Sure.
Thanks
Babu
