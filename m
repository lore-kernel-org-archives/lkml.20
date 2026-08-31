Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A81838F64E;
	Mon, 31 Aug 2026 22:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217152; cv=fail; b=FifknKRsHvZ2+uCoZNq8pvnm3zGiEs3Qta3ayGZyAmE6YKagH943Ufa6k4xmnCQbN0ILYLOfxAja1nCGALZvrr+CQMibKWD+AM5u+DcX95PTxg6KI3j/PGPl2UVdgqEYXzzb03tXgHOxzcViJWWhpZ4GedNzml06phfj7lY07Og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217152; c=relaxed/simple;
	bh=OVgjosZGuBIFykZjMw8bjOMvqOHz7ckWMAS7p5BvKSw=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kyVb/N7J/Lt9iClJSAyASlk4/uPajemdFZyy6YeNOs9yhnoiUhcMfbp9j4dHjOUHxed7LVUcfrPNsSzhAt5lcr2qf+MGrdtS5eWIdPCN2CmbfHF3VTF6ayCKccjjI0XXFAevEajttNztq9XdsayOwSuATTtJ0CazcB672Hb+j3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Hmn8dt9j; arc=fail smtp.client-ip=52.101.61.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Hmn8dt9j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=erhGTf+0W1QSpjobdQbD6RONUFkKU3hsAQDhOVW7BI8jqd6P9q7xj5lt4SWZj4QeHfg1wmKmWIQhbJuDtRU+GA6QU0AsjlX3GshFp3v15t4qyVoWJbT79YHI/lmbejjKZCZxV3Dhes1BgUsytqWgt2kDHJecbVoT7Ln6CtPCCs2B/qhqWPTE3eC2QU7vjRZy3ozzKFWWYFqB6zHwC3G1iUnMJIrzagpg5EKMxyTWwQjs9rWdQwdzCV1L2KUxFsPf5x67SkCj5vbcWZZtOBzrN3zQZXxOxsXYdo0hjR0aA1RvQbAD9vwu/hjonF/LUTRF2J33Lc1ZGNRtlY6PdHd2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQF/ZxsFfz1BLOkqXkyw9i4hO3qGKSFXTEGnRkppxug=;
 b=CJkFhk3jQjC01pOFLHv09wYsY1KCBrDF3mlFRz0FWPkCgYrgfsdD/Y0MvFfEd190f9M9NVqyjYXpQ7S+El5J11FakWsYGWtv1Y8y0UJtK/5qSO1lamyjZiHZ+M4KVBhxPVtP9wtiRDdA/Hv/4GXFZVe4h8RQkKcsQDP616F3kLkUNnWTFzOlLwSgg11nHuDq+DLpkU5sWziWdomTfn724PvlpSlELOGWSVU39nyzrZeYcyIfgsUrKeR+ZxZCLDluYl058KH0gEZm1u1Pg9MDnaG+1D6UtGKAOahwKDjTcQHvNNAgY+xFoNY6zc2AqB25owY3dHQjhGCuh0f9Mxk6hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQF/ZxsFfz1BLOkqXkyw9i4hO3qGKSFXTEGnRkppxug=;
 b=Hmn8dt9jFIz+bWrLCiQntT7pAPyQfWthQ/vnb2xaCRN/zBP4xGyhcY7IZFarwrLnGHHpCAT7hsuDbt74pjUlmNJI2jdMkusL2j9GAeA5k3OEe/Nl/VtTdhEtgKomMUfceYWNyeRvIDUe0KCnbpF7T2O5HEGeWBenkW3Bw9VB+Js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by MW5PR12MB5621.namprd12.prod.outlook.com (2603:10b6:303:193::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 22:59:03 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 22:59:03 +0000
Message-ID: <ad90a776-7be2-4d5d-88b4-280bc46b7387@amd.com>
Date: Mon, 31 Aug 2026 17:59:02 -0500
User-Agent: Mozilla Thunderbird
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: "Moger, Babu" <bmoger@amd.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: "Luck, Tony" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
 "james.morse@arm.com" <james.morse@arm.com>, "corbet@lwn.net"
 <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Eranian, Stephane" <eranian@google.com>,
 "peternewman@google.com" <peternewman@google.com>
References: <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
 <112cebea-d455-4b75-847b-bb7d4aa4847d@intel.com>
 <1fe5cb09-aa2e-4b3d-9fbd-293d8e9f33d7@amd.com>
Content-Language: en-US
In-Reply-To: <1fe5cb09-aa2e-4b3d-9fbd-293d8e9f33d7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:806:a7::21) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|MW5PR12MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 416b0470-c014-480f-eba3-08df07b373cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|56012099006|3023799007|5023799004|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	oNdQGyZhnadoWSLdo+4wzAHYUAx2isBWNEYuBaISEA/f/uRBF3Cv07Qu/9Qwz9aUcnuGFZrDQ7iHLDTh9bqYQhBOPTRZxYoR5lwEwN4FvuLuN2gbuOemrHJlI8VJNSHreliFuIlDf6J8TWf++KGWCFL8QiMale9pr5iEe6UeFttk/tF1I2vzYZzprmz1Sdula9rlc2Tj0cYRZadZwYFqAXrsVULeaMYqzbO1anhwZFM/c3GCoa4C+coH8AEroWAuz0CfwJ/gpMVUMDoQRIjDSFjEvaEk+voANz2kzjKl/hQOqr86O1QHmCiehxKlIoaDFuT61vVHcfqQG9tmRBSaP/yn/1IDfGxS1JcNfnxGvKq64asQyV8ooJpCIL3iydf6L4Wg79tEieWl7KuRDFVzdH/1/hzA+1goE9uflYYYsLhVeAAftorakEuFDMPKnSmGX3t/fgTe7B8nFMQE/981SvYLYksvG6Xld5sg7ht0skTYjdMI+kCeaFBK3jfII7SURbsjgQPW1aVlSwUOejYJIS4Yd4WsXpk+YO7bsp5iacI/X18NSOM0UuWL9mSloIYaihTN2ZtqpT7WsGKUyrmltFRDFbywRFh0JJC+/6Fddk5UbBTaAc6VgP1/M2soaRLxivz1lD6Dabag5RuTcACbfA33R5HjlgnQ5DBgokQB32c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(56012099006)(3023799007)(5023799004)(11063799006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T01VV09yOUdSN2NRVit4eUhwTjRWb0ZjK1Jxck9sR1E4YXFtdG5FaFhRYVNo?=
 =?utf-8?B?QWpvZWxUZmpPRE41a0FsOWltS29lTFZGWHd3cm5YRTkrVFByMDVjT2V2cE8w?=
 =?utf-8?B?ZGE2Qm12RUpPdmE1elpUVEF0VXFSNzJWbk5jL216eXYxR1YxWC9wVExsbkJJ?=
 =?utf-8?B?UUV2Q2Q0R1NmMW9MSjU5cTFjL3IrR3o0RHBFckYzYlJndEVtczlqV3dUdVo2?=
 =?utf-8?B?ZFVjS3NzbkJBZVU2Wm9STmo1WG9sVDc5cmdJcnNVaGdxdSs5aXdoRVRxL3k2?=
 =?utf-8?B?Z3duNVhNcEl1Q1VoSDVFbTI2cEVMZzVEU2tqWkk1UzVTR1R2bDZPTzdsVGpi?=
 =?utf-8?B?SzZEZ00zTSt4S2xCQWFlZnpyc09aY1kyeDZXTkprVlYvZFdLS1cxUGNGbHhC?=
 =?utf-8?B?cnYwRU9TS2pPdlpmN1VmZWxqUkx1WURDaWdwT2hNSFNwdjRWekZJU3BJVW4z?=
 =?utf-8?B?b1F3dTFORnBQK3BTS1ZkWjVJOHlZYUdZWWlJQnR2Vm9DazlHWldqbldOa1hD?=
 =?utf-8?B?SUVzVzVVU1FTWDkwYVhiK2U0MzJ2SnJpTU1LSWJURTRNcExra3RKajd1M0xM?=
 =?utf-8?B?ZVU5Y2xXcjBQbkl0dXVHbVNBMDhKcjRBbnJHWHZRMUMzbndkZGtFRUlMN3lO?=
 =?utf-8?B?UnIxRDBBQVVUb1hHSmJPUHZNYkFoOEdmOE1TUFYydVA5cVFWNmxqb0hlS2ww?=
 =?utf-8?B?cFZ4R2Fvck1ZUUw3MjFIdm1oMGtrbWZhMGRwUGhnKzRua2JGTGltV0VTZ29E?=
 =?utf-8?B?TVVxVDhPSVFBZmI5M09jMXQ3aXY0M1dVd1NSYk00K0hoTi9kYnhYUWh2M2pC?=
 =?utf-8?B?Rm1OWWw1UEgzdU1nSWcyUWUrNGo0Wmh3c2ZJQ3JqOVFDRG9Ra2krVWk4ZHJZ?=
 =?utf-8?B?aG5rbVR6T1NzNlgvZzJXQm1zSFpaZEpEYWVrOFAzOXVZM0hOSW9UeXdoTzIr?=
 =?utf-8?B?M1FRSGp0SDEvQWlKL2Z2bWUyWFE5aDZmd1ZIckNPVmlkN1Q2N2RESnFBaHRV?=
 =?utf-8?B?MnZRVmFuemYwQ2lYTmVrNU1pUlluOFBqQTk2cW9wT2VFMllOUWIvdlhWSmRO?=
 =?utf-8?B?VHlFcjNVUTBFK2p5TkkxTnB1ZlRwMEhVaDg5TElteHpZOUF4UVJtdy9neEpE?=
 =?utf-8?B?TTZLajlhTk10V3hFRWEzWVV4WDMzaEx3eFlBRG9TZzdyZDlERFd1ODVRa2Iz?=
 =?utf-8?B?Z2pySi8rYWUzNWN4Q2hQdEJZVlJBdnBzbEVEUllWa0J2OGRObzE4dFpnK3RB?=
 =?utf-8?B?SXR1R3VjQWdmMzd5VHRLa3ZFSmVmbEROaHRqdXZwYmtVa0hEQ3ZRVTBXbnA2?=
 =?utf-8?B?Mit4SWIzYTlnc3lDdUVFWlZvYTJ4QTVLbE5iNk52OVlkNzdNWVpBejZtbVVX?=
 =?utf-8?B?Z205T1BnMjF1TU1PS3p3RlQyc1JUQ3BabWR4blhNbWFsbjY3YTlBRnRWZTVq?=
 =?utf-8?B?dWJXa1dlZTdCL0ZFRmJNVzRnaGJEUmt5SGgyVXdrSDNwRXFWblJldW0wZm5O?=
 =?utf-8?B?OWNGNGF5WmNHS2Y2MndUbWxKeUp6dnNiTzBwelA5cGFYbDVhTDdMY3BCZGw4?=
 =?utf-8?B?VURsZVFDMlkyTUFTSzFwU0s2WEpsU24zeWdxYm5aMm1FSHlveit4SHJMU2tS?=
 =?utf-8?B?aEtCZmNZOWV5S1cwSldnaTY0UXMrTC9ueERreXZDUHlydnk5aThsNnRaSXdO?=
 =?utf-8?B?dDZBUkZmMEpOZFJTd2pFRmhMdkZwVFEvVG11cjl2MFYrbWQ1YjI0TGxSbStG?=
 =?utf-8?B?U29MUWMrc1RCUVBLNzQ4NWVDUUxIZ2svL2Zyd3kxTVU2ZldMdE91Nit4NGI5?=
 =?utf-8?B?ME5xc3U1ZUkzOStMTEpvVk9jeTJIMi8wUzNSOG9jaFJ0OTRsUExjZmx6TEpL?=
 =?utf-8?B?amx0RXN0b09WcWc3VjY3L1A1ZlRMTjFJZ0pHMm14eS8yNnZoSFlaTmpXWUwv?=
 =?utf-8?B?SkR5RzVTamFOeXh5cmxVUVZnYjVsdUpRcWk4TjVBMVV6aFNCVHBFSHdic003?=
 =?utf-8?B?RGtBRVdKWnNobkI3MDBkS2xUZ2RiTWJsUDQ4S1hlOGF2RjFsWHhJQTlwTURv?=
 =?utf-8?B?UEhxeEE5SGMzTlhiTlZEZ3dWRzZsQmVjalZFMDRvMmd4blJ5TUt3aUZ6SEtY?=
 =?utf-8?B?U2E0Zm91YnpGVFR2UjFaeDBoa2NWb2FET1RIYzhKSk9WSGZ3ZTZIbnVJREly?=
 =?utf-8?B?ZjhXL3FURjFnM01yRUN2ZG5uOEFFZGhiYnZQMTg1VWl4c0RvL3B1VVhEa3ow?=
 =?utf-8?B?b0I0RVZ2Vm5rWG9xRnJTeDRUZjdYOGZrV2cvdCt4dnAvdS9Tc2ptSHRvQzdK?=
 =?utf-8?Q?AFWw1rsKSbeFGkk/58?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416b0470-c014-480f-eba3-08df07b373cd
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 22:59:03.5083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Fk9lrPykWHDUzu5hGPMqboljbWO5LoWTnI8xvQidRr2gmtFMnxrPSYMTLvXqEFu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5621

Hi Maintainers,

It's been a while since we last discussed this thread, and this item has 
been outstanding for some time. I'd like to revisit the conversation and 
understand the plan moving forward.

Please advice. More below.

On 8/5/26 17:40, Moger, Babu wrote:
> Hi Reinette/Boris,
> 
> On 8/4/2026 6:35 PM, Reinette Chatre wrote:
>> Hi Boris,
>>
>> On 8/4/26 3:47 PM, Borislav Petkov wrote:
>>> On Tue, Aug 04, 2026 at 03:10:18PM -0700, Reinette Chatre wrote:
>>>>> So, long story short - and I appreciate the explaining - we should 
>>>>> switch
>>>>> AMD's default behavior back to RMID + 64 counters - exactly like it 
>>>>> is on
>>>>> Intel - and the ABMC thing will be explicitly selectable by the user.
>>>>
>>>> nit: s/exactly like it is on Intel//
>>>
>>> What does that mean?
>>>
>>> What's the difference between Intel's RMID mode + 64 counters and AMD's?
>>
>> Expanding on what Tony answered ...
>>
>> The 64 magic number only applies to AMD.
>>
>> In default mode both Intel and AMD enumerates the number of RMIDs 
>> supported
>> by each resource and both Intel and AMD limits the number of monitor 
>> groups
>> a user can create to the minimum RMID ("minRMID" below) supported 
>> across all
>> resources.
>>
>> On Intel the monitoring behavior is consistent no matter how many 
>> monitor groups the
>> user creates. User can create up to minRMID monitor groups and reading 
>> monitoring
>> data from all the monitor groups always return accurate data (never 
>> "Unavailable").
>>
>> On AMD the monitoring behavior (without assignable counters, aka 
>> "default mode") changes
>> depending on how many monitor groups the user creates:
>> User creates 0 to 64 monitor groups:
>>     reading monitoring data from any of these monitor groups will 
>> always return data
>>     and it will be accurate
>>
>> User creates from 65 to minRMID monitor groups:
>>     reading monitoring data from *any* monitor group may return 
>> "Unavailable" and
>>     vary in accuracy
>>
>>
>>>> ok.
>>>>
>>>>> This way there are no surprises when running any tools on either 
>>>>> vendor and if
>>>>> one wants something special, one selects it.
>>>> This patch, once minimized for easier backporting and marked for 
>>>> stable, would
>>>> accomplish this.
>>>>
>>>> Two nitpicks:
>>>> * "no surprises" should be "no surprises (as long as AMD hardware 
>>>> does not return
>>>>    "Unavailable")".
>>>
>>> AFAIK, Babu was unable to reproduce that.
>>
>> If this cannot be reproduced on AMD hardware then AMD did not need to 
>> create ABMC, no?
> 
> I haven't been able to reproduce the issue in my test environment yet, 
> even though this has been the case since the very beginning. I'm working 
> on reproducing it though. It requires a very specific scenario where 
> more than 64 monitoring groups are active within the same L3 domain.
> 
> Prior to ABMC, there was an attempt to address the problem using a 
> "soft-RMID" approach. Saving and restoring the counters in software.
> However, that solution was eventually abandoned because it introduced 
> unacceptable overhead in the context-switch path.
> 
> This is where ABMC comes in - because reading counters can be very 
> expensive on every context switch, with ABMC you get the ability to pin 
> certain RMIDs for longer without the hardware invalidating them as long 
> as it is pinned.
> 
> You can imagine that there are hardware limitations which cannot allow 
> you to pin 2 counters for *each* RMID. So you end up monitoring a subset 
> of groups.
> 
>>
>>>
>>>>     There is the known issue with the default mode on AMD where 
>>>> return of "Unavailable"
>>>>     is treated as wraparound by pqos.
>>>
>>> I guess Babu can address that.
>>>
>>>> * "one wants something special" should be "one wants accurate data".
>>>>     Caveat: User does not know how inaccurate data is in default 
>>>> mode. Users need to learn
>>>>     about existence of accurate data from outside resctrl via 
>>>> external sources, possibly
>>>>     leaving it up to the tools considered here.
>>>
>>> With my simple thinking, I would expect that accurate data means, the 
>>> number
>>> of counters being in use is not hitting the arch limit. The moment that
>>> happens, I guess one could deem that measurement innacurate.
>>
>> Agreed and matches above summary. The arch limit here would be the 64 
>> RMID that can
>> be guaranteed to be counted. resctrl does not limit the number of 
>> monitor groups to
>> this number though but instead uses the number enumerated from 
>> hardware (4096 on this hardware).
>> To guarantee accurate data in "default" mode a solution could be to 
>> add model specific
>> information that teaches resctrl about "64" and it can use that as 
>> RMID limit instead.
>>
>>>> What is the plan with https://github.com/intel/intel-cmt-cat/ 
>>>> issues/311 ?
>>>
>>> I guess that should be closed once we switch back the default.
>>
>> I expect so also. Even so, it does open a new question of if and how 
>> tools are
>> expected to interact with assignable counters. Instead of this bug I 
>> would propose
>> that AMD work with pqos folks on expectations from tools to support 
>> assignable
>> counters. To me this bug implies that AMD considers enabling 
>> assignable mode on
>> a system as a bug.
>>
> 
> We have discussed adding ABMC support to the pqos tool, but it has not 
> been a priority so far. Given the current discussion, we will need to 
> revisit it.
> 
> We would prefer to keep the current mode as the "default" for the 
> following reasons:
> 
> 1. The "Unavailable" issue is not new and has existed for a long time.
> Most users are unlikely to encounter it.
> 
> 2. Users who do encounter the issue can use ABMC with the intended usage 
> model described in [A], where a subset of groups is monitored at a time.
> We will document this properly.
> 
> 3. It solves the current "pqos" tool issue.
> 
> 4. From AMD's perspective, this is the most practical until we find a 
> long term solution.
> 
> Thanks,
> Babu

Wanted to re-start the patch with some more reasoning. Please see if 
this reasoning makes sense.
-----------------------------------------------------------------

x86/resctrl, Documentation: Keep mbm_assign_mode at default on boot

ABMC ("mbm_event" mode) allows explicit assignment of hardware MBM
counters to RMID/event pairs.  It targets deployments that deliberately
manage counter assignment on platforms with more monitoring groups than
dynamically shareable hardware counters.  It is suited to workflows 
where users snapshot bandwidth for a limited set of groups of interest, 
then move on to another set—not as a general replacement for legacy 
default monitoring on every ABMC-capable system.

Commit 0f1576e43adc ("x86/resctrl: Configure mbm_event mode if
supported") enabled ABMC at boot by setting mbm_cntr_assign_enabled
during L3 monitor initialization.  That breaks existing userspace that
assumes legacy default mode, notably the pqos tool from intel-cmt-cat.

When pqos starts, it mounts resctrl and creates 16 or more monitoring
groups by default (two counters per group: mbm_local_bytes and
mbm_total_bytes).  On platforms with 32 ABMC counters per domain, the
default pqos layout can consume the entire counter pool.  Additional
groups then fail to obtain counters and pqos reports zero bandwidth for
those groups.  The workaround today is to switch back to default mode
before running pqos:

   echo default > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode

Stop enabling ABMC implicitly at boot.  Leave mbm_assign_mode in
"default" mode during initialization; users who need ABMC can enable
it explicitly:

   echo mbm_event > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode


Default mode has a long-standing limitation on AMD platforms with more
monitoring groups than hardware counters: bandwidth reads may report
"Unavailable" or misleading values due to counter re-allocation between
reads.  This typically affects deployments with a large number of
groups (e.g. 64 or more), not typical usage with fewer groups.  Users
who need stable readings for many groups should switch to mbm_event
mode and use a snapshot/rotation workflow.

ABMC capability detection and the mbm_assign_mode interface are
unchanged—only the boot-time opt-in is removed.

Update Documentation/filesystems/resctrl.rst to reflect the boot-time
default, document pqos compatibility, and adjust mbm_assign_mode
examples accordingly.

Link: 
https://lore.kernel.org/lkml/1fe5cb09-aa2e-4b3d-9fbd-293d8e9f33d7@amd.com/
Signed-off-by: Babu Moger <babu.moger@amd.com>

---------------------------------------------------------------------
Thanks
Babu
