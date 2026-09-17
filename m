Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CEB525A77;
	Thu, 17 Sep 2026 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653920; cv=fail; b=FFHhFL1QbOXqum7MxXFsFN2EbtIROgNTa3Vv8jwVie/80kegfKBumRYQYyLrerRkRzXqxovO9H3bmz8NsZa/haPd4zsW3QJTRb9ZC/UdqOpQ9XWrIaliPCmwRacNOpyQu1BDfD6UQuO5WwiCquUuwr83KI7UjtBvCE1htw1L5kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653920; c=relaxed/simple;
	bh=b4cbuU0/MDte3FLAEfgoA+yJz3NXlSn+DtSd2tJ3frc=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fGebZKQBurrCkKdlCiLYC3X4GqAYaTsa7Lol3Za6vraocRUmjWL/ZuKDfv+X3pK3P0/wSDPXYFwOmNfndBOJr7hW6LAlApSrFxchi+8sCo14pA4/kIfI5qjRfnU7ttd2wrwAeJu7OSoQ3rCAyUsQaLHXVUzKscAhDlraw+dRBd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TiXBhz12; arc=fail smtp.client-ip=52.101.43.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TiXBhz12"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zI+oUuM66UO05faJ48R7bc+unrjFgxlpJkaJoscAigWt7BqdE9iDQ6xaBy9SeF9NX0lrnNG2Ix7riUWHdapBUpvkeBI66QHUM3plOo2Jn121ENDsRYAOucsAi3Fu1zKjukzVHO8rGgubqsZfOnfW2YEPPsjB0Unh+Yzb3iTATf/qFwra2881/67AiB9LtjU4XjJbTQOuGvkgpjGChObWImQY+7igkRBbCUn4RyOgqA0ImVM6YzydwpbnzJ7DAQ64mxjtYhykFaxTkharcZcVabDkYSUrNqlECSpGr59U0i65qjdPFJOy/3u/LlakQ8OfV99uYSCTPSlYBhlUFxy+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vjRstHl2+QyycS3qKDKN52Yt1qv5edrPrfT5xTfMAM=;
 b=KwHt8HpjkLUMmXhwbkKhC+DyXlawYHu+GEYOV17IBlE1/d5GzYD1m3YUDcAapS7nonAxR/0oAdHHL9FTTeRUOZs+pZO2OkCy1whk6xBBReBjTqa8hNlF3iSaLFWNBokpOCa6PGGZBZBKToidard9+1cAmtCEPUxoSLvH32c7fxaqWa+NFfj2t/G82NmGqPmji6IrsJsL6M6A8c4aar2vQkOm79yl5sQh9S+Vl1mXm8oP3SBeW4rWGgi18qwi6djt6uPOnuJsjhiF1Ni6HPQ5EjkN/KeSiXkW6hDJ7029i79TT6wdArbF+npIWnUdrOsTfQEbKzkTpfhgm4dNUAVY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vjRstHl2+QyycS3qKDKN52Yt1qv5edrPrfT5xTfMAM=;
 b=TiXBhz12+sa2geiAjexpFyQkJGEyAhx1I33n1NnhztNcUOmRn4EVw/Ca6bWNgcb6G1XbobJjdu4CYsR4YzDj+plH0+hUxWJca3OVfjMBPJ331WDZ3wTHrmYQnCAa97/e1jzs+u6rTvZmm70+FBEdzsLkfO1iHvRZyjnMggJg0nY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS0PR12MB8576.namprd12.prod.outlook.com (2603:10b6:8:165::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 14:05:14 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 14:05:14 +0000
Message-ID: <56dcf2d4-5fc2-46a2-9391-1182a0a6ddde@amd.com>
Date: Thu, 17 Sep 2026 09:05:10 -0500
User-Agent: Mozilla Thunderbird Beta
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [PATCH v5 06/16] fs/resctrl: Introduce kernel mode states for
 resctrl
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
 <89413e63d627ed967108bb77e6f56e7ceb977571.1787772750.git.babu.moger@amd.com>
 <4277c043-c854-4c9f-90cd-9cceaab3c88c@intel.com>
Content-Language: en-US
In-Reply-To: <4277c043-c854-4c9f-90cd-9cceaab3c88c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:8:55::17) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS0PR12MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 456faeef-fab5-43dd-b462-08df14c4b1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|10067099003|3023799007|6133799003|5023799004|18002099003|22082099003|18092099006|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	vqVaP0JZD4lwPnak1CyAeMaPZtI5TbNEI16qvQrc2wOjTRiNbz/U6C7x0GT3aMro4tPmTQNfpd0ZsYee+7QjNIScLlQ8E5AvVZiq43Ol5EU/hn1IWA6pKvTp43CghAbM60aQzcUTrfP//9T4OZQCbm7xeQpfpmlicDKDHAFQUwkypT+88gwIAqnZFYgvc5QcazDEYiEe8As6nLrvC4YV+1zdhlA0v6EumztJPLof5KUSzfnhUgwLfOmYUnbjFbrDGIyy2UectVBzdCI+gvxzNsSSXGlGopkqn+YYIJ/vSJZu035MmS2M9qWjCoNG1paP5V7gKZl1Kpw1G0zG/q4Ap8SBze9sXMd68zok1T7bGMBng4Rs23v3KdHfzeD5oe/AV1QBJ4jmXbTs/HwTjvs0hxBVahLylsCeSdUbNxeEOW0+n/W5RPRxXj0R+fCiae37l5SVWCdkNVxsNVFhKvLgqx+KSg5O3I9ka6QEUhysiCuTNgmUyclu8uQomBb9xOWlMshVOUTVKv4T4tXvsi6WnbXuxy/64N70kfiDIm7NOlxiFPzXwkfQgri4BvcByjaEEy1kmsicTC9q0pwEjlV58s6a1bl5wntD9zeLLEfVe6GkcEXAD810jTJ9xzGutakPPwhMDUobLCcm0OwhFi+I8nBHnhfCe5I/w+CASZCzWNU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(10067099003)(3023799007)(6133799003)(5023799004)(18002099003)(22082099003)(18092099006)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmhmaXhIdEd6U3pEYVR3bkdpNEVibXI1WXFOL2E0UUZOTmlKYit4MGlnMERo?=
 =?utf-8?B?eFpqbUFOb1JNekVucUFjNW1mZzJuOWdFK1R6d3plWHhUdnNITGRaMURyc0cr?=
 =?utf-8?B?WG1BR3lvb3VMU25LQVl2ZC8rUERCL2QzM3FpMDRGS1Z3VUNLV2grTjA0NFRu?=
 =?utf-8?B?WHQ3MTNkTjBiY29jcXBzM254WlpmMVA3UlFDLzUvVVVDbWE0RElnelcrenNE?=
 =?utf-8?B?ZjMxbU0yakZWeVRGWkJsS1JqVUhhdVdQeUFKQ3RNU2tNTFdVTTlDQ20yYlA5?=
 =?utf-8?B?Q1dRdENoeWJyS2VlSktSUEVHLzcvM2Nuc0pWMG42SkpDLzAvSTZCK0lSSW5C?=
 =?utf-8?B?cWdwV25TYjg1NzhteFBJeExPNHhUTHFpRTFBQkpocngvbE1jUHhFRGtUM0E1?=
 =?utf-8?B?ZU9BcUE1VVpBYnZSOXVuRGN6SWg0UHlLOEJlenRyNUZsdHdBOFJZaVY2WmMx?=
 =?utf-8?B?MkdqTEpjNVc5ZXdtN24xUWRnUGJTbUtiQ214bWtCaURTYU1oMXpENnpmZjkx?=
 =?utf-8?B?eFV0SlRTL3hpZ2NNRWJRWG4xS0d1V0FqanF6Z3FmUFFITExLVENWV3l1ekht?=
 =?utf-8?B?aThuczFCTkhyVDM5K3lUQXk1WjF4ak91Mlk1OXVpRkxtUHlOc0QvTkcyU2h1?=
 =?utf-8?B?a0dsT3MrbDArODRscnplcEgvZHNXN1AzMWtScmpYL0ZJdXN0bzEwVFJHWDlV?=
 =?utf-8?B?VG92MXFDd1B6WGtIcXFUUkJsUHFhdFNvRHdRRUFZZGJJZnFUTmd0YlZnOVdC?=
 =?utf-8?B?SXh4TTZhY3lWQlpJYVNBQjBjMGNkRnFpZkRjb3pFaEZqWG9RZUlOSllTOXBM?=
 =?utf-8?B?bDNZcExwT0o3UzV0RGdPVEpUeThYd0xRdHhLS2FqWW0rUFUxT2V5ODdNSmtK?=
 =?utf-8?B?TGN2Wk82VllORFkzdDhqYy9icG52NGErYTMzYjNFWkVuYjlmZCtFck5KVmVx?=
 =?utf-8?B?QVFWUmRlU3BiaktXUmxqQzFRYVFyNlEyM21tWGhLeGRLa3F1YTZEYm9mY2lt?=
 =?utf-8?B?aHg0ai9TeHdZZ2NBazhZNmhISnI5MG05WmMxMVNvaFFOQmxpSFE4Z09PUmhR?=
 =?utf-8?B?VS83cjlGYkZjWDd0aE1EUFJZeXY0U0h1emdYYTNnd29ZK2dKVVVFamJjSzBU?=
 =?utf-8?B?eFBzZ0JPcUxnZGlQRzN4VDRWdUlPL05jcWhRaEFmNlIvN1doYXdEK1VnRUcz?=
 =?utf-8?B?R21hdm9Vckt2YjhwQUY0SFVEQXlGMG5EUC9ITnE4TmZlL3BDcUwrN1pZbmpN?=
 =?utf-8?B?MVhrQm5nSmVPY2RzT29kS2FydElGVXZxN3ErRUFYU3FMdFpQa0s4YlhNMmds?=
 =?utf-8?B?RVI3dDdDdjF0TEhSQk83ZWVyMk9yNVh0dTNWaWhJbjNSUE9NWG9Ea3kyVHhk?=
 =?utf-8?B?Ymo3dmtiajVwUWc4bENXV0NUVkd6TGJmN3dMaDlvOUVTWFM5cU1RM3MyN3Y3?=
 =?utf-8?B?Q0lHOXA3Z0ZobHd1WkxVMzRmMndHRzZRWkhUbVBWamVITkVzRjlYOFdsbFdj?=
 =?utf-8?B?aFpuSzJuOFpEWXQ0aG43dCszQVVxeXgvT3ZvQUtQQXpDQ2dOZzh1VnlaTzFK?=
 =?utf-8?B?MXVmWFhxaXRxTmhvdXpqWjZtV2J0R2dMS1JoUWp0TWpvc2JFUWE0Z1BVRGpo?=
 =?utf-8?B?U2pmcGZ6RWs1cWduaHNacFNWOWlDdzdBVTNpVEZxZ3NqdWd3V3A1L2lPM2xR?=
 =?utf-8?B?K2g4VE9RWHJabUo0Lyt4VTRzb0pXRnM0cnJicFlTZUd5Vk42NU5ZcnNMQkJX?=
 =?utf-8?B?MXpGQWVDZmZFVHFiMnJ0Y2VTZGhnM3J1SHRxV2NwN0tyUmJ1ZktMMnJzY1RP?=
 =?utf-8?B?UHhzcmR4cE0rSDFZZzRTUEZGa0FCQVBxZGlKUkdWNHpsdVVLcUZsNHR5L2R0?=
 =?utf-8?B?T3p6MkNuQTVEeFpoTFpXci9PdWRPa3g2M1hKdzdOK3lqZVk3RFZRWG9yTlNK?=
 =?utf-8?B?R1A2QzlMU2dnRkhNQlNXTk91U0cvczZSRHZUSlN5Vlg2RDArTG5pOU1RWmdu?=
 =?utf-8?B?alR0VDBPNGVnbU1oc2xRUmtPK29wK1NqODFNU0tLWkhYc0prS0htTXVqbXox?=
 =?utf-8?B?Qmw2ZWo2cWw3bGRlbUcxSkpXRWRteS9TaFdaeFQ2akh5THpNalRFODJtVWN2?=
 =?utf-8?B?QXBLYzdubURDbDh5Q2ZndkhZUENPM3hmTnJHZ0VodDdNdlFYalJLUm82SXQ5?=
 =?utf-8?B?eE85QkRScXhTNnVnbU4veFdzb2ZRdVcwd3lCNGZCYWZocUNFNEM1clN6RmYv?=
 =?utf-8?B?NWZrOGpUUXpzT0pRb05GTzgrZGdxR1dtV0xDT0JoTlBSdzRKZFF1ZStQUlM1?=
 =?utf-8?Q?H8wVv1AT2ABzutKvZw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 456faeef-fab5-43dd-b462-08df14c4b1d3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 14:05:14.1110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGXExHFohRJHwUDJbLczeUY3o6Xf6S3nglKS0mZOUjNVUyvfAiR3w+rRnrvZJw8I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8576

Hi Reinette,

On 9/16/26 00:28, Reinette Chatre wrote:
> Hi Babu,
> 
> On 8/26/26 12:32 PM, Babu Moger wrote:
> 
>> ---
>>   fs/resctrl/internal.h | 51 +++++++++++++++++++++++++++++++++++++++++++
>>   fs/resctrl/rdtgroup.c | 33 ++++++++++++++++++++++++++++
>>   2 files changed, 84 insertions(+)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index e62a277dee85..4087bf44a06d 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -314,6 +314,57 @@ struct mbm_state {
>>   	u32	prev_bw;
>>   };
>>   
>> +/**
>> + * enum kmode_state - Control or monitoring state for a kernel mode
>> + * @KMODE_INHERIT: Inherit from the user space task.
>> + * @KMODE_ASSIGN: Use a global assignment for kernel mode.
>> + */
>> +enum kmode_state {
>> +	KMODE_INHERIT,
>> +	KMODE_ASSIGN
>> +};
>> +
>> +/**
>> + * struct resctrl_kmode_caps - Static kernel mode capabilities
>> + * @kmode_sup:	Bitmap of supported kernel modes. Empty when neither
>> + *		@ctrl_en nor @mon_en is set and kernel mode policy is
>> + *		unavailable on this system.
>> + * @ctrl_en:	Whether kernel mode may use global assignment for control.
>> + * @mon_en:	Whether kernel mode may use global assignment for monitoring.
> 
> Why is ctrl_en and mon_en needed? It seems to just store the output of
> whether system supports allocation and monitoring. I only see these used
> when user interacts reads or writes the kernel mode so not a "hot path" that
> needs to be optimized. Can these just be dropped and just use resctrl_arch_alloc_capable()
> and resctrl_arch_mon_capable() directly? Please note they are in process of
> being changed/renamed:

Sure. I'll remove it.

That also means we can consolidate everything into a single 
resctrl_kmode_cfg structure.


> https://lore.kernel.org/lkml/20260831174421.13921-7-tony.luck@intel.com/
> 
>> + */
>> +struct resctrl_kmode_caps {
>> +	DECLARE_BITMAP(kmode_sup, RESCTRL_NUM_KERNEL_MODES);
>> +	bool				ctrl_en;
>> +	bool				mon_en;
>> +};
>> +
>> +/**
>> + * struct resctrl_kmode_active - Runtime kernel mode state
>> + * @kmode_cur:	Currently selected kernel mode.
>> + * @ctrl_mode:	Control assignment state when kernel mode is active.
>> + * @mon_mode:	Monitoring assignment state when kernel mode is active.
>> + * @k_rdtgrp:	Resource group backing global assignment mode.
>> + *
>> + * When @kmode_cur is %RESCTRL_INHERIT_USER, assignment state is ignored and
>> + * @k_rdtgrp is %NULL.
> 
> This implies that this is only the state for RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU.
> If it is made specifically so there is no need to pretend it is generic and
> add all these caveats.

ok.

> 
>> + */
>> +struct resctrl_kmode_active {
>> +	enum resctrl_kernel_mode	kmode_cur;
>> +	enum kmode_state		ctrl_mode;
>> +	enum kmode_state		mon_mode;
> 
> Is "mode" accurate? This is all about kernel "mode" and now control and
> monitoring have other modes?

It can be control and monitor.

> 
>> +	struct rdtgroup			*k_rdtgrp;
> 
> Could naming be consistent? Consider, for example, kmode_rdtgrp? Although
> if this struct can be specific to the global per-CPU kernel mode then it can
> just be "rdtgrp".

Sure.

> 
>> +};
>> +
>> +/**
>> + * struct resctrl_kmode_cfg - Global kernel mode state
>> + * @caps:	Supported modes and assignment capabilities.
>> + * @active:	Active mode, assignment state, and assigned group.
> 
> Please do not list the struct members as part of its description elsewhere since
> that will be difficult to keep accurate. Just describe what the struct represents.

Will remove it.
> 
>> + */
>> +struct resctrl_kmode_cfg {
>> +	struct resctrl_kmode_caps	caps;
>> +	struct resctrl_kmode_active	active;
>> +};
>> +
>>   extern struct mutex rdtgroup_mutex;
>>   
>>   static inline const char *rdt_kn_name(const struct kernfs_node *kn)
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 5dcbb0a964e8..3c53f3f74e5a 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -76,6 +76,13 @@ static void rdtgroup_destroy_root(void);
>>   
>>   struct dentry *debugfs_resctrl;
>>   
>> +/*
>> + * Global kernel mode policy state: supported modes, active mode, assignment
>> + * capabilities, assignment state, and the resource group selected for a global
>> + * assignment.
> 
> Same here - please do not just provide a list of the struct's members. A high level
> description instead.

ok.

> 
> This code is really strange. This whole series is difficult to read. I have not seen
> these styles used before and surprised that it comes from you.

ack.

> 
>> + */
>> +static struct resctrl_kmode_cfg resctrl_kcfg;
> 
> I think the code will be easier to read if "resctrl_kcfg" -> "resctrl_kmode".

Sure.

> 
>> +
>>   /*
>>    * Memory bandwidth monitoring event to use for the default CTRL_MON group
>>    * and each new CTRL_MON group created by the user.  Only relevant when
>> @@ -2297,6 +2304,30 @@ static void io_alloc_init(void)
>>   	}
>>   }
>>   
>> +/*
>> + * Initialize kernel mode policy defaults from architecture capabilities.
>> + *
>> + * When ctrl_en or mon_en is set, RESCTRL_INHERIT_USER is supported and
>> + * selected as the initial active mode. When neither is set, kmode_sup is
>> + * left empty, kernel mode policy is unavailable, and kmode_cur remains at
>> + * its zero-initialized default (RESCTRL_INHERIT_USER) but is unused.
> 
> Above just verbatim describes the code. Please provide higher level why the
> code does what it does.

ok.

Thanks
Babu
