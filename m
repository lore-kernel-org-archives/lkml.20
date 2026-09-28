Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29FC48CD46
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630510; cv=fail; b=N0NBnaq6ujGdTcaGv5GqVYXq99lwnBDsM5CH0ZSc8oO5zidV80FH6vDhnEXT9wDkTXd7pFaPeNmlxAikr6fX7lmajZhSQ1tOEIc6FmgLCFRAkS88rnI2X4xqMVNMUdsinouWQL31vetlpa3fWAeMGKtvnMr9x+TEd9z0Ljyi6Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630510; c=relaxed/simple;
	bh=iMEGq5wAJnqTaoN03g2ti8xEMEN6onk3lDxyNExWn4M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q4m/SFpJ/XYQoX0PfD/Zzm6ZyD0PWo/RMncHEIDCPgBD2meyA7s8JE5ib8W94jdWdO3nDX/thcAC3PFb31QTHVWguCNxJVQW9huPUn+ZWdV4r7cZcPuWEwtlYHjZYTAAN0RDfrcn3hmttFIdznVqoXvNF1Ii+1txRt62b23XyWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNYXuMRW; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNYXuMRW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790630509; x=1822166509;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iMEGq5wAJnqTaoN03g2ti8xEMEN6onk3lDxyNExWn4M=;
  b=ZNYXuMRWChzCk1aUf07IT/VHc1WRXZIpCKUZpJU7XD6UMF5Fk4gppZyo
   zJyLMViV9r5WKMGvrztVEIIc7LXKGc0+ey/KYHy7hFlGASZ3Di/JXCz2v
   uX3H704BpTZPyb9P+G6fXhMAFkFORIT3+iysNuyaIP17yMIBdHspQ3kR6
   e5SXbMx1J+SFb9XbjWDtYOalmEglzuaOspVYYTv6gLWVk85+5qIZJ3eq8
   SrOVwThEJNnEXeDqmEDa76J4hACPQQ9lW3DviPrCRS4GtJWFdnDqwgPAV
   lTXZcl5YwhOhGnju5OM2ojx4jGAI8qAWXMXOCwYfARN2JkWqVXrAYGTgM
   w==;
X-CSE-ConnectionGUID: kDmqPycmTSO09bjv6eg18Q==
X-CSE-MsgGUID: J6kYEt03Sk24/jb4qoYK9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91362108"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="91362108"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:21:48 -0700
X-CSE-ConnectionGUID: xneNxqo7Q5uwRYlB+6ueoQ==
X-CSE-MsgGUID: N58FOyzWQXSIhgpMuvFTzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="278373693"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:21:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:21:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 14:21:47 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:21:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vznl5NE8iIV/RsrFnee3N7w28xRHJCuOdNR1p/RrGY+VHrJeuUa+mHH7dSChuRxoMd38PdbCXmuhb9BOKLAnLEprXenXjAqM3tO/KOOu19UrcHLRn8BmKD/fOZdr4sITceCMOkgnIcOgitHwiNw8tzkLnxh8WMFHTBSFbD3LRs0JrwsIR1AxovI9DMf0BWmgNQNeepCKvyGdHGPXn7uUSEsv+SAOgoknLaZJ/iB2uTfUsq/J/dAAp1bOvmF2Wig7qM+LlJJ53C2lP7/3WMBrO6YA0h9k7s2PjWHHCIxJ+WdIXa6NHRQZxkwVPEhDeY4oGkG1vbsMMAhC6bhlJ2hjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7eGEvf8r2RQtS39tzrzC+9Zyfm3tDxeUlGAglE8n018=;
 b=DuQRm4goN59DqtNs0LLEVwZCVmJ0YIZmkJ50djAqMrWL2V/AjxwDZkPhGZUHRb5CsZ9OE8xYpIqjBF/8LYwz4PPX782LgXCLkKNFxzGOCQIy3yBiIU7Gzy1YL+rEwBX4OFfMrJm0jaUZEkqzr7mFDRiZYI2vW+ws1yVGtGKXosCYndX7DT2AGqLu5nGZGShj/D05jMGjOjOIRrz12z2Ww15z2FsjbYPYeayJUr/PI2x+WN2oXE4rpYFZsXJHFtq0i6iuRjcyn69FSQ7/6CAwi9ot4dFJzR+zxu+sezGLL8JcctXHJaByZ59unhkpxu9hjbWSqm9SmiEPSyeFknwGfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA3PR11MB7628.namprd11.prod.outlook.com (2603:10b6:806:312::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 21:21:43 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 21:21:43 +0000
Message-ID: <71826bc0-df95-4f07-bd2f-dd8b4775802e@intel.com>
Date: Mon, 28 Sep 2026 14:21:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] x86/resctrl: Require 64-bit x86 for resctrl
 support
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <711a7976e0a33cd6fa2872ff10898b66d34fcd70.1789705667.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <711a7976e0a33cd6fa2872ff10898b66d34fcd70.1789705667.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:303:b8::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA3PR11MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: bbab699a-c517-48fb-7002-08df1da67e57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|6133799003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UfF6ZbJBMIcHbNTbLEege0grbaaiIoW7fpY79V+i0lPFLFNUPjENu3EqzFjPW4lz/E4InsJZRimcf1/sm+64AGVTzRKE3Lsu39OAdGQFBjVhQSrNnu9ZmkluQzAILDbycKSY8nr+AKXqWymmd4b6dkyF1d3APByMtSv0SPee+mlaDgRINV9fuP7BmN+jvD2xaJag3OYXNKNEOWqApwSv6FdBro+Qhv6NvcScP68WFAceLYksxkCrtZmafPh0hvGnAh1Q6sw5FDlv6nJwdvAI/2coA5gkknHV6ZWStCaT7nEu94IBil3ai2XYjtL7MLfcQL0/xivZ4v8Z9ydI4v6y4FN0s3Trpzyk/jgTyn4wKed3whTozaNveDtVDZ/ZeC249yWNldakHt8zdY3Rai/oFtyzriYNjX8OQhIZbRRHndCZ5W+sIH1FqIxruihZvUVOspjueKIajtxpNsnEBj9hrSClxCTEWNEaHAup5FUKmfFM0pQVruVS+yKuwGORakaGzxRmRqYDvT/ay1cAw73LxSVstBFDtWJRVi3DrSf1R4LsvwX+6Co4xftP2W0UtnHzHiFJLZg+3WG2P40t1XSEAe247Xz5CBlIiOJXbOzOigtUXE8DMrmLakajrDKAXyF9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmdTVFZvVzhNQWUycXdUTEVWc0RSLy9TTm5nVjNtZExmblp1bHpvcXdlOUlI?=
 =?utf-8?B?a0VuNDhKWHpYNWZUMEFHZG9DMFV2YjZwMUw4eW5jNTZ2cVVWdVNQd3M0R1M1?=
 =?utf-8?B?VEE4Y0RmaXI5dlo2UmhyYy9xb2oyZ2Rna3dSYVM3YUxKTy9sT0sva2JWWUdI?=
 =?utf-8?B?ZnFwUFpyRm1vNXhiMkNLN2FQM1RwQm5ndE5lT2Fva3NpeFhQZE5hZkVTc051?=
 =?utf-8?B?SFBjQytnQkFDemZEUit6TmRWVy81OHBqRWo0aW4rWmtWTkRhYkZPaW1qNlgw?=
 =?utf-8?B?c3gxeFFEcm1HWTdKQTBqdVRYRUN0em5hQWg2cHZOaWUwYnF2Zm1FTDJWVkZC?=
 =?utf-8?B?SHZjN0JjcVBHM1FxNlB3TEtMbnAvellKRDdJbHlzaXd3TVFxUkdBU2c3WHJT?=
 =?utf-8?B?TFZwblZXZC8wRk5aU2pPdjFnTHphQ1NNSVliNU9QSnRtd2lDbzlZcHpjRjlt?=
 =?utf-8?B?TDI3eVl6K0RtYnp1V3E4ZGorN2tiUWMxRVIwYVByWFpzbzZwZHdZYSs0ZmZi?=
 =?utf-8?B?KzhwaFdLMmNocFdsU1RyaW5LYVZzWUxJcmJ4L3dURmFGZmRHYUFhM2x3ODND?=
 =?utf-8?B?eVNWZnI2Z3lHamF1M0tIQTEwQWZPWTAzUms4dkpSSzBTTnNMU0toNXB1cktn?=
 =?utf-8?B?bmp0RllBbFg1ZDRVSEJvc0t2Qmh5NVg0eGJsb0s5RDdwbEtabGVaTXQweVE2?=
 =?utf-8?B?ZzM2YlJNWm5mMDBiWXVHWllsZTc5c2RVRFJHTytJdDZVcFhaaVdHcHVDRWt4?=
 =?utf-8?B?Y0FxYW5Cd0YxRThad2JCbkJ1NnRlVm9xNWZQUERZRXF3Z29ZYnhrKzc3UG16?=
 =?utf-8?B?WWo0SGx0Q1VIUVVvVm42UkxDZHVmWUkvaGc4b3pQN0I0emsrQzY3VklNS0xF?=
 =?utf-8?B?LzRWeUFNdTJSb211Vmw0Qlltb0VKNWk2UzF1VW5IeTJSM29QTUwxbDB3Ym1M?=
 =?utf-8?B?VlBnUWZMK3ZISC9obTNwV0htV2lpZVRrTnZqTURRLzF6UE1qVTVnZ1NubTdY?=
 =?utf-8?B?ZWxmb29aODBGMHFsc05hVUUyVEs1UTNwdlpneVZ6dWQ5ZlZFUTNWeVhldUtl?=
 =?utf-8?B?RWVRU05yOXVMZldLcFZMdVRUWEt2Q1ozK1FGMVB3bWhBbitYTThaaUtKc3d1?=
 =?utf-8?B?S2tVNEpaeGpnbEdQNU5sNElUK0dHV25nUjMwSlFSdkN0ZU0wMGEyOS81NzlL?=
 =?utf-8?B?QkNTcVhrSFBkdC85TFExSzNyTHA0ck0rMFdHbkpTT0tpb3FHUHpwNXRpSnZH?=
 =?utf-8?B?emNxN1BPZTEyMnRpSkQvdEVSZ2lKL1lBeFFXeDVQNlFIaTBvQnlpYXU3dTgw?=
 =?utf-8?B?SElWTDR4VVlITDY1K2pNSHhHZVk2eW9MTVZDSEpmYno3WFJLS1kwQ2kvcXBs?=
 =?utf-8?B?Ykg4ejZWL2YweXBUS25ZbThac3VWcWRRQk0vLzRtRnk4endwOFp2T09HbWhy?=
 =?utf-8?B?ZmtnOUhQN29uSjdRZEdLM3ViSmVhN3JhM2U2ZVVOK0VUVGJOWEQrTE5ucWVS?=
 =?utf-8?B?MUVNZlI3WlB3cTA0S0xIVHAwb2o2R0hKYVJ6WVZDNmlhWWJOYkhTQkxnQlhD?=
 =?utf-8?B?Zk9EVC9naHpUR1pZQjcwSDRFcVgzRThzRnVyUzhBWmlwQjBDcW5xNDBtNjdt?=
 =?utf-8?B?ZERXTzFRbGZqWlRER3Y5SEgvSm9yVTRQZ0FHNkNyczhPYThRb0NoOCtPWG44?=
 =?utf-8?B?TGNud1RNL2UvUmlWKzMzaDRjU1BCeGVIbEF4TW1uVTRSSjUrNHpnektmemVt?=
 =?utf-8?B?cmxueS9qWDJPQ1hmTzNVak5wcDREeHdCVjQreGkzNnR2a2VjY1docW55S29L?=
 =?utf-8?B?RU0vSHgrZFhVUWdXWjFiVXBZdUlKTjRBVWU2Y1ZUYWNKb0h4WDd4MXBHSlFR?=
 =?utf-8?B?UDJCdnF5M3UybkxRWjBDVjYyc3JCcWNiK0tsVmUwNmF3QjJhVGhXMFlseVZL?=
 =?utf-8?B?QmJNSHNZbitzeHJCK3hIQktBZ2VuUk5zcXBnWDJMRVdrdEF5dUViZXhuUE9o?=
 =?utf-8?B?SVBWcjliTEFkMjU4Q3B1WnlwU3BkTkV4Y01sVFIzZkhwQ0Z1RlZXZDVhdnNH?=
 =?utf-8?B?MXJtNXhUYSsyN0MwaThVelhPdDQ0OEJZNW9Rdnk5WXA3Q0VCd3MwYjU0YnB3?=
 =?utf-8?B?dms4TjVDd1lNWVNSTmlua01jUHoxdDd3K212QURDSHduVzFoRmtkVjYzdG1K?=
 =?utf-8?B?UmxhWU5ZSHZKdGd0UFFQZmRaSlZ0YkppbFhZVWdqcDR1M21udk9rc21BbENX?=
 =?utf-8?B?MTl1NWtRRmJkN0tmZXdPYU5wOGRiZ0FFZVNPaXVsV1J6cWV3d0MwVFlMSUpX?=
 =?utf-8?B?VVZWKzUybytNc2ZVUjR2WFJuRkFHV2dOeTlQR3NOOEVFVUNSNVc0elRKVlhr?=
 =?utf-8?Q?2HMjAv0P2zUvSNNo=3D?=
X-Exchange-RoutingPolicyChecked: ropNo6WVIUVjHxgRYvD109u48EVCqYf3b6wqt6YlDMzqDBbzPiwUYmMLECJBCxZ1xjBnHwImzoxOfzIvuCA1XJirzqgCmKMRbbyaTDLTY6qFQ6/uKnM1ROWPnH6CoManJaYbI1ASqSZF8fn6Dt2ibN1L36EeyYawzO7PcZJXGqtGtxYxf08dOO4qTMWLfb6iKT/Nubkr507Vlcfq3JoIuowFQgbKawpynGGRi9u/hK9avgivbhLXIrmlT7D2+/GkbDOvWlVOYD8PB5ym+mO2a4jQWJ9FC4atux/DOZSoZ++nUMF478nc03RkayqgNyHD57ACYn6+jVSBScrC9fk3rA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bbab699a-c517-48fb-7002-08df1da67e57
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 21:21:43.3617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WgbIwOlp258vUHNK7ozc2Y9i5NSMSVh+QWRrgIY9R1cvBfPL+x2WYl8VUuVgWIj3bEU32vPXNRm7S14J5oWGOQ4h1c9I9RPicXUJsrm2GUA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7628
X-OriginatorOrg: intel.com

Hi Chenyu,

On 9/17/26 9:48 PM, Chen Yu wrote:
> From: Tony Luck <tony.luck@intel.com>
> 
> Intel Application Energy Telemetry (AET) provides event counts in 64-bit
> registers in MMIO space. For accurate results these should be read with a
> single 64-bit load operation from the CPU.
> 
> In preparation for the removal of the separate CONFIG_X86_CPU_RESCTRL_INTEL_AET
> configuration option, move the X86_64 dependency to X86_CPU_RESCTRL.
> 
> This in line with Dave Hansen's proposal[1] for an addition to Linux
> documentation that details the state of 32-bit x86 support.
> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Link: https://lore.kernel.org/all/c6ab0c24-8931-4f0d-9be6-23498ab4c38b@intel.com/ # [1]
> ---

This patch is being submitted as part of two different series. That is ok
but the versions need to be consistent. To help with this I'll not add any
comments here but instead just point to most recent review:

https://lore.kernel.org/lkml/15de2e2f-fc2e-4d06-9179-100398865624@intel.com/

Reinette
