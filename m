Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822D126AF4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853252; cv=fail; b=jqchBW9ILWsk4dPdh/aJ8REErJ/DV/1RnUKvwoQqCMfAvyEPdekvkQ3fLyulSAO3clOS3YTqOK+7zTuRxCsgjrWTDtNXa7K47uVHIAHuLkDguhcwQ9oQE53mwOM+YSrpJCLJRh5Z5gzQdfZ/Z02qz9KpDSyRbxhwjpRXb0RPSw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853252; c=relaxed/simple;
	bh=VWs61X3qJhm0YNc1H2j+LE4gXlw7tD/kwCmmpIcs1lE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qUGq8qQKZVorHPSKxe/xMxkuQNe5qFncIkwR1z7l4QvEd+bewCjwAefj5TNiJqzNWVoFWvckHkxoaqNEZ8zLxga3nKPM64h49FdnpGO/qknxA//KZpAQLc5yjr+8AhpTOuJebGPsKi7j3ZvYyXfJrKamkAk/lMJ+qbpbiZAC+PU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2VB4OEZ; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2VB4OEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788853250; x=1820389250;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VWs61X3qJhm0YNc1H2j+LE4gXlw7tD/kwCmmpIcs1lE=;
  b=X2VB4OEZtyKB0ksdjUCcNvcXYiuiz5UneKppcK4427DCmW/Vu0r0Y+l4
   BMykeEpQN+1wQJJXAH7yWiKU1PR+KqT0mTuC9zPUAC6oLwDcdd1PdeUKJ
   R9d2B2xhGhAHqMi9Lod+nvMqhvY3jAusKZ4q38SpCamW/60YXziQdLMeF
   NV4fiyxLY7Bj/G4z2Lk5g6kHbx4+3j1Y4wpPaUX9xSGtQAomfVD2VymH9
   E1s1gmc7RgPHHZfwCWgNGSqYJLl4jgJGuL/CUMRyigI3XkFUi3CPE2elj
   8jrEH3ysD0LmwtMJnSpbTdF23OnFt7f4Dtglw2yubiHgX7KlzwhVovaDx
   A==;
X-CSE-ConnectionGUID: 5JmSxvgpRYqX/IQ5PI1zJw==
X-CSE-MsgGUID: BzTZV7kTRfKXZvdt0pd1Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106618864"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="106618864"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:40:49 -0700
X-CSE-ConnectionGUID: 58o0ze9oR2GoRJJo5+J8oQ==
X-CSE-MsgGUID: 3zCFuY79QjStxO0HSuFOiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="270878733"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 00:40:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:40:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 00:40:49 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 00:40:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJjyj/bQ2FEFIu7ww5hXFAMgOpqkmx4aNrXC4NCcZD1n/nDZXcfT1sR2G/x9gqyegLMFqX6zlURofYmo5POqdJd/pFUyssK58FQKzi8uCjToK7YsWhVicHmwq+6YanKSiCD27tktAWXWEdMLEFgZ5X01vU2zFzh/ISqVAFqbrHYuaXmeR7J0/qm0RTXHkeuilNnN1tmCSu39X3IvLWdLAeBSgCd/dTd3dOBWFQ/lkDZzvYT1djDEOK7nL4F7ftU+r8q1BLqg4qYleIh3l1yluveo9VC/7K4OyaJgFPPf8mAsVtXhS0AltT32UsiXaf4qOiMi5P0h9nGW9o7ck7czAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqnmKmhhGvk2UrLKvgDC3wxx7Z4ZOJrALAZK5ICw+eU=;
 b=s4863vIFy60vmIvi3mdNtNty7x/zXIzbSjbR8+yvbtxTSQBZRYvQrKt6G6x8BdGfrZKJ9PesWbHSzNuBUaBH5aMwDVG5at+a86kSUxJ3bGLqamfun+uffZcvi97KPuCdnx6FONUh7BjFat2l7gQHkw/nMpTs44szhiaMZZQIvhTQIx91R25prDB03aoZzAfzY3o7LZpo2tbawkjrtWvYJQHxbCqmfc8gpI3/NJhoCMj2GbtyBrbNfXzPFsDTKqwkGcaQGbBBCMmsdoMROpWcw+W/+Rdt7tpvMQZ5BDnU6BGM+Xvalu0phHXe//e2FDijRSa6cUw9D0lSPD9Hf3G9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA2PR11MB4844.namprd11.prod.outlook.com (2603:10b6:806:f9::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Tue, 8 Sep 2026 07:40:46 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 07:40:45 +0000
Message-ID: <9cdc6386-5f46-408f-a515-d13984b55530@intel.com>
Date: Tue, 8 Sep 2026 15:40:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] sched/numa: Drive NUMA task tick from execution
 context
To: Hui Su <sh_def@163.com>
CC: <peterz@infradead.org>, <kprateek.nayak@amd.com>,
	<tim.c.chen@linux.intel.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <connoro@google.com>, <jstultz@google.com>,
	<linux-kernel@vger.kernel.org>, <mingo@redhat.com>, "chen.yu@linux.dev"
	<chen.yu@linux.dev>
References: <20260904085244.799276-1-sh_def@163.com>
 <20260904085244.799276-2-sh_def@163.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20260904085244.799276-2-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0033.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::14) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA2PR11MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: c3543960-45f3-4861-5eef-08df0d7c7dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|4143699003|10067099003|6133799003|11063799006|5023799004|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VslJoTT1nI0vZzZrlWx6QcXR3hpv5uJMViAw67Wp8WSrdLTrw8FnbFKYDmPEKODYbzMA5qO2Jrs+H5u+KnIPZ1oX9+V3q4El5sJ5aQ27kGf9ucUBkxFpD2UgP9K6/aq0V5OSu6tCppJJ7vbZfb7xT+aGz/S2Z2s59L9I9dJSy1rx1iwNQArv2881BVxUApHwz6hHdQU4xm8mxcQy7xzdhwN5mlpJo2qmv83+ibu+pDLXpMdTT5eBMwrBnaYuJY4tdCJ1a6VZqZ1y4mEMKS8vMVj8cHk8vhkPlxVEn1avZe/sxe2T9Voz6ugAyrWGSQT4s883qj3w7YvynaXpHd476nz9Ip5WCBKmTBi8D65nZQBWYvFp16BeCeV49WrS4JTsk+l+3q2j7pZQl7DckDoZ4Z5NZqwbkkn6lI8Axv7EWI/v6MbQq9k+q89kkBAwcReaMNmb32g41qQXnolfyq5rGStUHiXKjjn/XJw6WLtoaIF8os2NBZ/dJI+wzRcKeNwu/gH+B29VZ3vk8K3WSrVlIAfCnrYr1wl7OLs3QzTJtMtYIooNxBCs2hnPFqaLbYKvTsMybdmRy7Vsh+RaKYS006PFx8RR3ssAZnToSMykjWwG85L6ZCCKUl/mqLZB0F834DiKj9jVKwISsV4fcpsKiLuGp0TjJ3Ap8VHS4egiCQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(4143699003)(10067099003)(6133799003)(11063799006)(5023799004)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEg5N01zQkpCUzFMekpDVFc5U2ljQ09FenVKNXlEbVowMGdyUEFVMEwxRkhj?=
 =?utf-8?B?SWNQUXdUTFhDUTZ5Zjl2MEZZRU9LRnNkMHdmUkZtMklYVGg3anIvcXYwbER1?=
 =?utf-8?B?K2VUNWo5NVZBa0s5Q2IyT0ZTZU1DcXBjVE56Y1kycGFCR0ZrTWpVU1VRVWVz?=
 =?utf-8?B?cURPUlF1bGNoWUVGYU5pakZUNldRUWZQMUxrTlJKa09VOFNTK3VYWCtHcnRk?=
 =?utf-8?B?WkEvZ1p4cENFVTk3dnVnT3hqMnd1MjlpaWYyUmwvSHdQdWFucmxZZ3F4QVpO?=
 =?utf-8?B?THBkdHVsU2pxNXJwbHNtYVhaTFdPSzRuV0c1RTU0QVVmSWVtczdVQTk2Z01r?=
 =?utf-8?B?NGhQajJmait1RVF4TnJWdUdMQWRKa09PRlR4b08wWUNSblhseFFJZDhPRjhD?=
 =?utf-8?B?MWQyWkZML2dTODg1YmtibWk1WGRVbHJOOXJkT1R2WXNIcDhDdElFTUpOdWtU?=
 =?utf-8?B?WWx3T24xVVBoOXFnQ29lT24xNGdOYk5CUXhaU0psclhtaHBKMVZ2QmVGWDJI?=
 =?utf-8?B?enZKWnBteEFQZ3UzeHNVWndtazJSRGNPUFhaN2VZTXlyUFNyaVBUS2FzZWxP?=
 =?utf-8?B?RTRRbnZHeS82VGZJTExyMlVHdFcvVmFJbWphV0xXSjZ2WUVvRkF0d0Foc2p3?=
 =?utf-8?B?anB6NnE1bk04SnJjRXdXMHFHWXZDZ2xzbTArdXU1RmFobkJtV3hoM0NkVXdI?=
 =?utf-8?B?UkJXV0kwNVBWZ2hRbXJSMWdnUDhrSDk5cjVrREV6Nnk4UmRPanBZNXMwTFRW?=
 =?utf-8?B?TVRpa01IOXk2VGtBUVdXOTZaUXNiK2pNMmpIaFNRQURrTVlxOUY4MHhiTFNz?=
 =?utf-8?B?cC9nbnQwa3AxSHlla29ZejJBaUduVkFNM1ZqV0F1SHV1V3JySVMyQVhXZ1hC?=
 =?utf-8?B?R3g4ZDgvdGswS01BT0dEdHVyQUVOOG1GcTdPKzBLa3JxQlZCNjUrNHpJM3dQ?=
 =?utf-8?B?TEY0Y1owQ0RoVVJJWGROVmFYekRPTWQvanM2Ni9UZ3BwY2llVHljcmVFaFFQ?=
 =?utf-8?B?cmZKN1prbkNGa1hlWlBQaG1SNDVvUFk2WkthVGl4NGRVQXcrQ1REUGR2Snk0?=
 =?utf-8?B?SDBJTitla2NxeXNmcFRwL2xxQXVrbzFWMnEwOUZYS2ZvbXZRTjBNREIxVlZQ?=
 =?utf-8?B?YWd4YVdnS0NaZUxLV2xtUGdHNllxMU10SFRtU0IwalBSU0Rpdk0xS3ptNXRq?=
 =?utf-8?B?Y2hjdS9IV1J4TGJuc1Y1Tjc4OFBTNFc3eUoybkNHUHFjOXk4Wk9FME1Ic3I1?=
 =?utf-8?B?cHQ5MkpjMzlIV290RkJSc3VMcndtWm1nUzJGWEJaN3ZENEQ4RTY4VXlIVmZN?=
 =?utf-8?B?T3RrUmlXZmNVemxNS0p1SkFvM2ltcUpQMElSREEvZjlwSUxxRktzZUhhS04y?=
 =?utf-8?B?U0MxdHJySm1Jd2JZaGkrZk0vUFJCMFlVS3FodW52WU9nZ3VSR2FFZXhwU1h0?=
 =?utf-8?B?bVEwT1Bqa0NQWjdXTWswWkJkcDlBRC80dXVnZ09yby9tRUVnZFdQK2R2Zlhv?=
 =?utf-8?B?RFlFeFVDdlJqZlROMEFwTlc1UFdHV29SaUV2Y3RIZmZ1QjV6RnJvTVc1TjM0?=
 =?utf-8?B?ZTh6S2lXNmgyL0tnVkhaUzRZZEY3ZGQ2SHRJek5VbkQrYm41MEs3RVdyOHZv?=
 =?utf-8?B?OCttZGUvbDE4MnNrc1Z2aWliNngzYVl5NGxvc1Uwc2tBemhZdHUvVy91NWNo?=
 =?utf-8?B?MmZaQjMwNUIvQXVWVlVRUVdCQ1RrQ0xpWFQ2VnpMQzRSdVpicGNKOTZ3ZGln?=
 =?utf-8?B?d3FsL09WMHFvYmpFT0w4dEExL0lHSEJiK3BSLzh2cTJVTHBSTEtlamxkMndD?=
 =?utf-8?B?TDk2Qy9ZemxadkNWckh5dGliRWZ5b20rTThhL25CZ0tWYk93Q0Q1UVhKTmps?=
 =?utf-8?B?T1N6LzNNVTFUTFhTaWxhdDl5Vi9oQ3phOU1VcnNaQVdvaUFxdHFtQU9xcTRL?=
 =?utf-8?B?MVZKTW8xNlRjK0xaWmFOd3NOUWxFSUJaeW1Lcm5UT2lsamRnU045eit6VVNT?=
 =?utf-8?B?ZkhuT1R2aWJXcXNHVS9EM2sxY3RrRFRuTitpVlB0Q2JuOVNqcEhBbUxudjlp?=
 =?utf-8?B?NDZ0QVAveHUvUU16V3NMQnFhNm1ucW9ydFhadkwyUUc5Vi9SSXlDZ3hzM21n?=
 =?utf-8?B?cnRLaDd5UmI5RlpuRXN1VnlJYm5qc29Gc3ZrVUgyZnp1R05hZlJ2YVo4UU5i?=
 =?utf-8?B?blJjVVhpZXduSWdtVEY5SDNzSUZuazdvZWExRzkvdDg0bWlXUDVBb1lNSDk4?=
 =?utf-8?B?MUNFNnN0WmlweU12WFVFRDVCNnNNMzR4bFVFYWkwU3U5djM3S3BiZEpURkFP?=
 =?utf-8?B?T3RTMUJrblE2Z2tYSFgrQzVHbGFqTmRiMHVyVzJScDRFSDM5UjEvQT09?=
X-Exchange-RoutingPolicyChecked: P0RPSbNnAtZVW76xLMgHuOn3qwecZA7Bjq7+6GeDurZGTCoQNaGVb4hYbrwfscG3JPd4ElVWDaAGNrHzyqDRnbYxSezfqEzso29jQwb/GihmzuquO7xioLHcRkUBpdl6o70jxZPp9VIxhlnF/+K1D5H1IfQjyFVKfOm7/ep/FvCMb4hp50mwZs+YxiNWQqg0KrqfF1GLsfet+kIJgQsU47sepA14YohZ7I82fT7DAxRM8zlb/IjKrSbC4xghkd3EHcetaa6cUR+ZnrLxczYpQduikLINqXJ1g1/hXXvAjwUsGPUx77qsp4cQnw50wsZGn3SDWBTXWMCSUDokxA0X9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3543960-45f3-4861-5eef-08df0d7c7dfc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 07:40:45.5631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2Axig3Zc0SZfNnUcLj+jvStfoqY4aFIScGMQsFriO0q2ax7o6jV8tSqAeacer+hirrfx3rBU910c8BP6ciC7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4844
X-OriginatorOrg: intel.com

On 9/4/2026 4:52 PM, Hui Su wrote:
> Proxy execution separates the scheduling context in rq->donor from the
> execution context in rq->curr. sched_tick() invokes task_tick() for the
> donor's scheduling class.
> 
> task_tick_numa() operates on state associated with the task actually
> executing, including its mm and NUMA work state. With proxy execution,
> rq->donor provides the scheduling context while rq->curr identifies the
> execution context.
> 
> Task-level execution runtime is likewise accounted to rq->curr, and
> task_tick_numa() uses that runtime to drive periodic NUMA scanning.
> Keeping task_tick_numa() under task_tick_fair() also means that it is not
> invoked when a fair task executes on behalf of an RT or deadline donor.
> 
> Move NUMA tick handling into a scheduler helper for the execution
> context, and invoke it from both sched_tick() and sched_tick_remote().
> 
> Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_task()")
> Suggested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
> Signed-off-by: Hui Su <sh_def@163.com>

Per my understanding,

Reviewed-by: Chen Yu <yu.c.chen@intel.com>

thanks,
Chenyu
