Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5AC4A49A5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439298; cv=fail; b=h56Q05ACCPgcU8iBytR6PhpByFj9ANiCKxvvaM6Ce0gK35yM5dYo3tMgIjd60lsfB1PDcqdrY1tQBy8sQByWt3jnJPuCjkI0e2c8INw7SJNKNbPv7v9CyXxAbCEpqs9aDjpxFW9XkBbpmo+CNyA/oeh+tkuSRkN/b6DjDXJ+StI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439298; c=relaxed/simple;
	bh=5CVhEejw8H8X1kgCFUsbIAYl63mnbgiHLb2rro93714=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F6AmrF9q5E0qOsAFmrHSTOGzAoHYw6D5cHzyTkeGw0cgz7s31wflWhroBPNVkk72qyyuyUnETxEvUK6bX2B+UKKUAnIQAoi7H9sv7mG46Q99dJhROMm2spO58jIP2mUx47Vh9DyDqWJV8J5ZcyvwiiJUlR0mm1grVL1UIMoMCrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ufi6NXMp; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ufi6NXMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788439296; x=1819975296;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5CVhEejw8H8X1kgCFUsbIAYl63mnbgiHLb2rro93714=;
  b=Ufi6NXMpLtD290Fur6yBkdfURA4fZJ5/J2xvh8VqF6MCZyAQ9uTmlAXp
   jPAinGHtJKNZmvqwE9bsenrhQuQQycRvasYPR9+99rD2mPaSouUv2Gpwq
   fxmnz3DReqMyr1dLjhGU48KiOr0aMqY6ObWjO4A9eY23NwYHQEA7GhmnC
   jMRAb/l/rIhdvVfYlvQS5H3v5yzuUCP7SKbKq9a91tndZCxfOgYsff3Ft
   tKuvV84O9/snfwvcpflIO/270y1jHyWqOmOAb9KqWvi1H8IddiYRU2tTO
   us/LET5yIA1ng6xyH4uKhSOfFlTsSpchojMYswat8a8upwAqTgsaO2Tmy
   A==;
X-CSE-ConnectionGUID: QDzO03AcSqG12oBz8Uhd5w==
X-CSE-MsgGUID: U2Oaet4WSoyXkW4Hil78FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="111692662"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111692662"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 05:41:35 -0700
X-CSE-ConnectionGUID: 8n3y/FlmSdCpmVuJ7CG65A==
X-CSE-MsgGUID: ZgKv1DJDR7adSx2u/8GG3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="271677802"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 05:41:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 05:41:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 05:41:34 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.22) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 05:41:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzXn30m3fiUdzGvKnWsftpIJdOU3mAWQGKzyLP6vYISG+f5+wEzBGOdWTRGxe+uS4zpKp53RFsZP7+AQFDZocJF5jrWUlPaM7C+JDcPimTewA2aFHnXa+9owip7kbXCcleEHCSfSI3GLVV197VQSZEJfIR2+jjJbMkBlUYcf514KwhcISby0c82q2UjMYeWfv1glKBwyl9ok9Kg1g2+d6aY0t8+OsNlgSqpN+s/nc36sUfGMmXlLdH5NQfXfl4Oly4sOm4I20pVCDh4z1zFCYP1IcL51bWhoDX/tYEx/muJbYnubXGR/ojnNRkTCV1bwoKhgxmgOVJLTl82dTqKYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvLyNiXK3o1oKuwgI3wKgUUAYhuy0/0FzfRX9Y5U1Fk=;
 b=PUautWrlmxw4mxsXQTP5cvNQhMjORDdAoBNoDe/FBP9WRSSn2tbsxV1k2YsMLgLoVel+auvtMmF6eURF8pdZQ+V2td7Yn3KO8RgOxFCuckzehckbKO0CCzmehNN5TYgETXELFq2DjrKTzpjr9c87bQ3udmYSFhebQYv67O2pW2urZzKft5le2c5X+6Jju71QuuRGIJkq7fBi47VpOuuRyXEQpnVSz7EprFW9EGGkrwPZb67/eVt1hdoNEGDTKudMnY/u1qvt8Plwg7oXkpRax9s3W76JBiAKIomzffPUXMWqTXdAwQnDHrGQOOOvs76drG50TfmRenHeGuMeLxapXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Thu, 3 Sep 2026 12:41:32 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 12:41:31 +0000
Message-ID: <4593a7a4-cde1-499c-bba8-2fbe24f35422@intel.com>
Date: Thu, 3 Sep 2026 20:41:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] sched/numa: Drive NUMA task tick from execution
 context
To: Hui Su <sh_def@163.com>
CC: K Prateek Nayak <kprateek.nayak@amd.com>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider
	<vschneid@redhat.com>, John Stultz <jstultz@google.com>, Ingo Molnar
	<mingo@redhat.com>, Tim Chen <tim.c.chen@linux.intel.com>, Peter Zijlstra
	<peterz@infradead.org>, <linux-kernel@vger.kernel.org>, "chen.yu@linux.dev"
	<chen.yu@linux.dev>
References: <20260903041154.2479761-1-sh_def@163.com>
 <20260903041154.2479761-2-sh_def@163.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20260903041154.2479761-2-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KU2P306CA0003.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::18) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH0PR11MB4806:EE_
X-MS-Office365-Filtering-Correlation-Id: a4dc7488-1a77-4994-5c60-08df09b8ae94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|10067099003|6133799003|22082099003|4143699003|11063799006|56012099006|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info: 2eRhVSI0YSMq9wvFJ/G7h2WydaZnD2p4pubV5X7YuUGiswMKh3LLbQLwJCZUxix+zLUUmNCrMgP8ic4hWgEIGLogskaLbiwqh3xB/Qb+LHiqy84hib2armavMospsl3mfVVa1yWRoHEQZiuOV/7hKJFsjUFThrAAWnT1S9cTygEaM0iYg+SXcQYVymPn20P5CLafcnhcPXDXKf7jgh47PU6s0+W+LYhQiJAp+vVt98N/sCYiNdJt2NV1mnfh9I7i5vE4tCIbabgdDj3OWeSuygoH+R92QOxQLO28tecG230Fk5lInE2vaNswUuOdC4yAwIt2OkXrze1tmBQTyAW2TNbmnZ/8bIvqZ13ZoNI49AD0uNQ4cUQwr1cN5Z5TmFBoXhW1cl3VZQQ7kMhF0Yq6CQqXt9KK9FzAsudCJ5BIFZoaTFXDM3cmGS5YngF7QLEyHdSP8r8mN8j0FoSLl7hzPBR1A/i8rQGB+7s9b7KQvEgKZ5w5OmU6GJZRgDA+fYwT96G5xxxg6h+XHJ8d5dnghfmKYe/to7eNt8fXJhGdozprO644Z4vrZ029h0wAKRxw0Da1jOaXOpufKbOPGTwZqWEstd9g5FCcCxnI8cL2P5VdhX5w9VAfOfFYL2BAUtepnyezJmEawaUqW5fDDlmPzk020KD8lJgBg/Wq8l3c0Tc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(6133799003)(22082099003)(4143699003)(11063799006)(56012099006)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDV0ZjUyMGhQVy9ZdzVEcWIyVzk0V3pwenNHU3U1cGpTUzRJNDNiZXltdUlJ?=
 =?utf-8?B?WHRLT3ozMXdGc24xSHMzNENjbG5sdGtGcElKT1ZpT1ZnaFE4aGxBVms3VXhK?=
 =?utf-8?B?Y2tFVmw0V3FMR3hUYVRjT1E5OXRoWGNIK2NtSEF5a0szSTlMSkt0VTJkRmFr?=
 =?utf-8?B?b2ljZXR3Q0JnaHd1SCtjQ3RaaWJvVjNaVkRmbUhiVW9JenZMTjl5VzJNZ0px?=
 =?utf-8?B?elhIYnJYend2VTgrK2ZvaUlSMkdiWjdxNVh6RmFWcFhtMXBuMnhrNDY0aE1a?=
 =?utf-8?B?akVLY2xhbnRwajVaYlZXMFpiekxPb0Zic1NvM2tCUEVzcGNwTlBOclUxVGdx?=
 =?utf-8?B?MkV1S05HbXd4L1hCQ0VrYkNWdkNHT3E5VXI3YWtmSXZjQ0pTU1R4NDd0NzNU?=
 =?utf-8?B?cWtYUlM0YkF3bFJINTB4djEwTG54bXBaSXc4SXNvaENMakxKejdaNGtPeGFU?=
 =?utf-8?B?aTlHQklCTXdKYkN0ei8rQTJqSzVmSk5xZUpEZmxCSDZINEdrZVlFYlV1bnI0?=
 =?utf-8?B?SXNiTDJDUThRMmNYaE9BbWJINkVRdzhQZ21hT0laeVJHb1JwdXZYSVNOODh2?=
 =?utf-8?B?aThXTmdmd3RSQ3kxTmZHRUZKMHppcVFaY1JlMDAyYXBNNXF6dHRtTHVHR2ZZ?=
 =?utf-8?B?L0lCUmxxRWllL2w5RUFraVVVOS9CUDRyOHBxRUlaalBKM3J1NmJFcmRtR2Mx?=
 =?utf-8?B?UC9NVXZDampkeVE4YitqaGw5dmVpYTRyTVpTNVg5T0IwbGZYT2VDSXluclFt?=
 =?utf-8?B?Z1lQcjJGNzJadlRvZWRuZkpjUjRudm8xRHl1bk5Xc1p2blF6T1NqRFc1TDk1?=
 =?utf-8?B?djZqcmVtajhHeW9FME1pcGlQSjhibU1sVG40b0d6Wm5jVWZBT3pCanRNRHFN?=
 =?utf-8?B?V2hsZlo3VHRxajQ3dkxvbW1uNUpEQktDR0Y0aDJqWmZybmIrQ2tSaUVSWXEy?=
 =?utf-8?B?SXZQeWhzMWl6UkJJczRxMExjcFVUV3g0T3FTcEFTVVR0MUs5OFQwUXEvem5J?=
 =?utf-8?B?bE1LbEtXcGwyNmwzd0VIcGRZdHZqaDhUeityMUpoa01Gb21MbU1XMW5lUGp2?=
 =?utf-8?B?OFZXTjd4azNjRUF4aWhYYkhOUjBwejd6TEoxR2xuZEtNSXZPbWQxeUJ3T2J0?=
 =?utf-8?B?ZlhPWHEvWEdjYTEyZXVueXJrSGFSM0MzRTR1M3kwQzFOUHJwK05jMDRqYloz?=
 =?utf-8?B?Umd5YlVOb3NBSUFQWGE1djM1NXoyY0RaZVY1Tm1od21zTk9URUt1dG1jcStB?=
 =?utf-8?B?emFGVnY0eEF2NnZVM0JLK0ZqVTNRK3pLK2g0RGdSNitXMjFaQk0wQkcvOTM0?=
 =?utf-8?B?RjROcW1GZWZsd09tNFFuekZ2WXVtZjFBaTlHc3hDZnMwMkI1Y3hZeVNCTGlh?=
 =?utf-8?B?SjdjUzlFUW1FeG9MbFE2K0tyQW1IQ3ZvelZwalB4cEJTWmRKMDBnNXl2UzI5?=
 =?utf-8?B?RjNKR3hLbUpsWTR5cWc3d25TS3crYXNiNldLbTVDRVEvQXJoQmJoNkIyaThP?=
 =?utf-8?B?RGIySEFmRnpvSzNZMXFubUZVamxuVmtBZ20vazVRam5oTzVJRk1zaHZKK05r?=
 =?utf-8?B?L0hvUmdWTTc4UldCMGNCanZBS1g2clUyajBRMldNdXphVmpZTEpZaGJUVEVW?=
 =?utf-8?B?K3M4c0FtYzkxRHVsMVV5QmRMUTFEbjRxbDNMMXJXamJyWmNTbnJ1MFFpRGow?=
 =?utf-8?B?UEFoMTZVRWFMakRET1NYUkpnVlhuVEtWWXhhWkduclBCZ3d0Rkd5Z0x3ck5i?=
 =?utf-8?B?RG0zak5qeS8yTVpOTU5zRGljMkxKOWM4cURNVEpzb05sbkJaZytnazRWNU1n?=
 =?utf-8?B?dERjeW9oMVN3MVI5ZUhXMGtaek5HTTVVWUNYOS9RemozTHE2d0FtVFBDTS80?=
 =?utf-8?B?RE4rZlMyQXVSZThVTTluYmxwMDYzZ2RaUHQ1V3V2SkJJYXhTVUZYdm9vMERw?=
 =?utf-8?B?dXhWNFJ5dUxKSlYxa1Judi9XWUZiaDB4OHhjSkpNMkRkcVZycUNJaDFWOXVM?=
 =?utf-8?B?UDF2ZkZXdFl2aEZPN2ZmVEhDakw3cUNiKzNYZVk2ZjQwZjBFNTh4T01iclBs?=
 =?utf-8?B?L0g4anpweDk1emh6WDA1REpxeHZ5WVRrVlE2UFlnV2tVMEYxRHlRRkIrTjBn?=
 =?utf-8?B?cU5aVCtyQ2FSbWs2VElEczYxUGhzc0RzU3IzQmxIbEtYcDVJM3BmbFFUdkhB?=
 =?utf-8?B?TU5RTE42dmFuU1JoQ2N3dmxIelpKU2RPYUlmbGNnNzFpeHZWVXRyUTZhaTdp?=
 =?utf-8?B?WGtJRGZsRFFncDFsQ3o4Tjhqbmc1SjBIUURWNlg4YWtIdW1aUGYwTUlsTWlv?=
 =?utf-8?B?UVNKY01GTVhxUWY5SXFLRzR2bWF3d3dsYXVNR0Y1bHNlcWM5cENsZz09?=
X-Exchange-RoutingPolicyChecked: dMs7KrDOcVDB++EelAx99rPjCttUC+sbYXPQ5Za8QO9I0lB7VS6uS2TFT+PSl4NMWFiomQa6GE2Xz0++cLdk9poDOFVdSCLn3S0UvDf9HFcYUin+c4fe2PyYU7UOiJm18b9/A9o1dz4bG5ErDQYwLY4Fi26PJyWIBAPzo2sx1heLo/cPHgOCQdUyijgLlv/Wy3cPQ934NA6QvPzL8/sF/ck6AbFhhPKDjKidsz+VzDpbw6v6gFwzPtLnM82fog1N1cgIgHo8UzaigyIMr7P8MhLnNnLwY/TvHZSr+TClyD07xk59STF756aDDy6Nv2V8GXee0KA9+ldXbfnaZN3vDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4dc7488-1a77-4994-5c60-08df09b8ae94
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 12:41:31.8950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aye2RqLOjA8lZWuLfddmAqfQU+98SllNMtpjp651Vtf+//XJqojdpYRIJcLZgqP6aFHHHiBEnGLPyd/liJPR+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4806
X-OriginatorOrg: intel.com

Hi Su,

On 9/3/2026 12:11 PM, Hui Su wrote:
> Proxy execution separates the scheduling context in rq->donor from the
> execution context in rq->curr. sched_tick() invokes task_tick() for the
> donor's scheduling class.
> 
> task_tick_numa() is currently called from task_tick_fair(). This works
> when the donor is a fair task, but not when a fair task executes on
> behalf of an RT or deadline donor. In that case the donor's task_tick()
> still updates the execution task's sum_exec_runtime through
> update_curr_common(), but task_tick_fair() is not invoked and NUMA scan
> work for the execution task is not driven.

Thanks for bringing this up. Previously Prateek has suggested to fix the 
rq->donor
issue [1] and unfortunately I missed the task_tick_cache() part.

Regarding above line in the commit log, although I agree that 
task_tick_numa()
should be moved one level up, I did not quite get the reason why 
sum_exec_runtime
is mentioned here, could you please elaborate a little more?
I guess what you mean is that, in task_tick_numa(), the 
curr->se.sum_exec_runtime
is used to check if there is a timeout to launch the task_numa_work(), so
curr->se.sum_exec_runtime has to be up-to-date. With proxy execution, the
se.sum_exec_runtime is only accumulated in rq->curr rather than rq->donor,
so passing a "paused" rq->donor.sum_exec_runtime to task_tick_numa() is
inaccurate?

But I also see that in task_tick_core(), the sum_exec_runtime is also 
leveraged
to calculate the delta "wall time" via __entity_slice_used():
se->sum_exec_runtime - se->prev_sum_exec_runtime
does it mean task_tick_core() also needs to be bring one level up to 
sched_tick()
and passed with rq->curr?

On the other hand, as Prateek mentioned in [1], it seems that 
sum_exec_runtime
might not the reason for passing rq->curr, but it could be:
"with "rq->curr->mm" being the one that is being used on CPU",
both sched_cache and NUMA balance fit Prateek's conclusion.

thanks,
Chenyu

[1]
https://lore.kernel.org/lkml/78c81f74-7b27-4f28-9ca2-0d1e27ed9c56@amd.com/

> 
> Move the NUMA tick handling one level up into sched_tick(), and invoke it
> when the execution context is a fair task.
> 
> Do the same in sched_tick_remote() so full-dynticks CPUs continue to
> receive NUMA tick handling after it is removed from task_tick_fair().
> 
> Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")
> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> Signed-off-by: Hui Su <sh_def@163.com>
> ---
>   kernel/sched/core.c  | 9 +++++++++
>   kernel/sched/fair.c  | 7 ++-----
>   kernel/sched/sched.h | 1 +
>   3 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index f78275192036..15fcc218d2fe 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5794,6 +5794,11 @@ void sched_tick(void)
>   		resched_curr(rq);
>   
>   	donor->sched_class->task_tick(rq, donor, 0);
> +
> +	if (rq->curr->sched_class == &fair_sched_class &&
> +	    static_branch_unlikely(&sched_numa_balancing))
> +		task_tick_numa(rq, rq->curr);
> +
>   	if (sched_feat(LATENCY_WARN))
>   		resched_latency = cpu_resched_latency(rq);
>   	calc_global_load_tick(rq);
> @@ -5891,6 +5896,10 @@ static void sched_tick_remote(struct work_struct *work)
>   			}
>   			curr->sched_class->task_tick(rq, curr, 0);
>   
> +			if (curr->sched_class == &fair_sched_class &&
> +			    static_branch_unlikely(&sched_numa_balancing))
> +				task_tick_numa(rq, curr);
> +
>   			calc_load_nohz_remote(rq);
>   		}
>   	}
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 8dff37059faf..55f0460e4ae3 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4425,7 +4425,7 @@ void init_numa_balancing(u64 clone_flags, struct task_struct *p)
>   /*
>    * Drive the periodic memory faults..
>    */
> -static void task_tick_numa(struct rq *rq, struct task_struct *curr)
> +void task_tick_numa(struct rq *rq, struct task_struct *curr)
>   {
>   	struct callback_head *work = &curr->numa_work;
>   	u64 period, now;
> @@ -4491,7 +4491,7 @@ static void update_scan_period(struct task_struct *p, int new_cpu)
>   
>   #else /* !CONFIG_NUMA_BALANCING: */
>   
> -static void task_tick_numa(struct rq *rq, struct task_struct *curr)
> +void task_tick_numa(struct rq *rq, struct task_struct *curr)
>   {
>   }
>   
> @@ -15042,9 +15042,6 @@ static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
>   	if (queued)
>   		return;
>   
> -	if (static_branch_unlikely(&sched_numa_balancing))
> -		task_tick_numa(rq, curr);
> -
>   	task_tick_cache(rq, curr);
>   
>   	update_misfit_status(curr, rq);
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index e656c7059bf8..4d619f272b15 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -4152,6 +4152,7 @@ extern void sched_cache_active_set(void);
>   void sched_domains_free_llc_id(int cpu);
>   
>   extern void init_sched_mm(struct task_struct *p);
> +void task_tick_numa(struct rq *rq, struct task_struct *p);
>   
>   extern u64 avg_vruntime(struct cfs_rq *cfs_rq);
>   extern int entity_eligible(struct cfs_rq *cfs_rq, struct sched_entity *se);
