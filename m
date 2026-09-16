Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1A83C37A5;
	Wed, 16 Sep 2026 05:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536829; cv=fail; b=rKt7Lt/wYas5nsUYQKySejq8Gz3Sk7ZnWeH0ZDgeWgfMWQKvEulwpMalUqm+BfQGWUNgagoG71e6lJJbp1fQYmUbhKCOUh8pPFptvJ6UgsqgPrL7PmSefgy+fSqkEjmxY53K1jKKZljSJB65QzdUecLXYQpkprRfI/VyU5rlDiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536829; c=relaxed/simple;
	bh=q/8SaYDwsAtC3XFHtlKHXy9pRpD/OhviZ4aCBFLHy7M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oCRYyLM8piaAUQ0mIbK/G7XX6OfesK9SCdeMGcRboBKacz2KVcytQMIPnxVrgdDGtUNVfC31yIf3uAFqbfvH1fw/LAaWhDDZ2evDGmLb9gwtCP7mlcgtiiDITnnY4T4IIFqdLbMf92VpSKJJECyEIEI2oBZ/Un+LayikGY/4QiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EN6QUgv6; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EN6QUgv6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789536828; x=1821072828;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q/8SaYDwsAtC3XFHtlKHXy9pRpD/OhviZ4aCBFLHy7M=;
  b=EN6QUgv6crDT2zH0h11hc5fVQWM25ZL/z+aIjwdd3o70abc1Jd4haO6T
   ZB3/9tQ2ZUe/OXu4vg0vttwqUNajXZmzKIro3BkP+F3wSij+7TvqCaAKU
   CoB7A4qmCBld6ha9GkkAf/BqSkllyBc7Fmu2kNUbPKipZsvyMn3i91aIQ
   fYTgQI95NC/CotGVORTFTN781WVuF1sQwnncY9xcRvf0VXn1/+aX+S7ip
   n1YcgTgVidIRYFAuRLsfRQJfNsW8GaxADd9st1n2NBe1enA+4r5CWlD6b
   TJ5tcMqQNJABA7qj27xeYFGmAQ/lDQFfwUIE/Qs98e5EGq7UQ4FRTjbJv
   A==;
X-CSE-ConnectionGUID: Zz5YZoFhQw6C8Tm1qabEEw==
X-CSE-MsgGUID: uAQ2VdkcSzabJj6E2a/VFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89847994"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89847994"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:33:47 -0700
X-CSE-ConnectionGUID: Pu6B1kYXQWOSrfTaZk0AjA==
X-CSE-MsgGUID: P2FfG5WBQ3OQTv3NrmEh7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273774122"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:33:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:33:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:33:46 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.66) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:33:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmpcMPYydZua+5IIo3iwfCLUYf5QzTupA8PFakoRc90stUe0O8d/PMnVzl0iAR0kS2r3A7sr/7c9RWxtaLBson8erEybd05kHi944U6/ZjUwr72GZ8oFyFl6NNArAUmkHgof2BBAUdwAfEBk/tOWKDEU3uj1H4AyM74X+Cqbvah1N2UkJyz3vEkmh7vGSXgIkKcmtMKt3+6MkNEWCay7dHdsVDKby9kLHWIvhQPw6RFrNfE6IYbzCCF1Iue7cqYjue4dle6JPmeQ97cHIxVBymovT/dWI10mYnRsX3BToKXS/+nrsAWrIE3P6ubGLgYp4E9mbnlWmFrnsvJV1aN04A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9kpHUiTEJkv9vioaqUVfKSGqd+W4VqH9RjjS8pGYLQ=;
 b=QtqT747bZ0/z5F9NljBdCnCEc36xuf4BSWxYKZ1NkHG/nc5CC+l25KxK5Tg7sCyupVxSY1dvtwPdhLq/9SlcH9pjTQlpPSt8PBYYv3ENZ9wBEQ/tvY8tYn+ZLzd7bUnSWMbcnE3Pvxdz+5TkcLXjiuW6ZgfeWZV9YhdarVserWu2JRGsIBTjxKGXl4t+IiA9M83BTNt+loAT8Wx2g+IBRi+ozGHiAO6TAqKibInL4w0R7sERD3c9gPRmdlLZMyZR6XoZrJm8zA974UkvloXqYjoh0Jj0X4r3lfwZfoBT5NRaro+EHcALqVHQUdN7mD33y1ajPuj4PRXYrpxEhF19TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 05:33:39 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:33:38 +0000
Message-ID: <34aa4824-810b-4c81-8188-f2f37e1dc277@intel.com>
Date: Tue, 15 Sep 2026 22:33:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/16] fs/resctrl: Add support for hidden resource
 group files
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>,
	<ben.horgan@arm.com>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <akpm@linux-foundation.org>,
	<rppt@kernel.org>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<jlayton@kernel.org>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <seanjc@google.com>, <peterz@infradead.org>,
	<chao.gao@intel.com>, <jmattson@google.com>, <naveen@kernel.org>,
	<ricardo.neri-calderon@linux.intel.com>, <tiala@microsoft.com>,
	<chang.seok.bae@intel.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
References: <cover.1787772750.git.babu.moger@amd.com>
 <f7bcf19ac8113a1e3d9575739c1a6400c455ce6d.1787772750.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f7bcf19ac8113a1e3d9575739c1a6400c455ce6d.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::12) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM6PR11MB4708:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e49925-9155-4eb2-3b91-08df13b40f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|10067099003|56012099006|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: X4Wt6Pa03c/zEoqMFBIb2Dz1NQkbAIwMNPnly5r2VFcYJODqqVzM5tDioL7JPxwslyc7L6AFgdWrnaBLFFWlgDPLUhjxILJ60PxR91wtxqcQhEeGBqrv/4XHbO3IaGp69O/mmilWqsIMsNblSFdv8N+4X98nZdQKvx3GA4IkLKz8So41jp1DXJAuOTQhRmszi2AzcPY7LCEJjso6k792V7fw83NZlWjgg7vOZPy4SfQGGc0LicLwyzf1mS/IFij2ka4Zt4RMrRAcsPATpFjYJCpdyWqKGAs/5YxF4XHBpvR0LDZ2iyPyUSsRgcnYYX7VANbxgw73ATilh/3O4zPPCEoTGMO33M/04r5mgPvGwXeZTm6XwOcYWQZJM9GzJEmDLJFlqZwRFvsPGeXWWfOY/WvgpFRA65be95403W0siOaZSXGvmDcQEr/lq99k2Hf+pjVY4DKkfXdKDsOniDiJJ+4E047u6safrLGEUIGu4UL+uJ5Pzi6eRWSwoX9rsxri5b55FZiEmPSpceQ5fL6nPxXUxA3/xKazV2ybgdelGDZPwuOBfCAIvbjryEI0hiGhopM890+N0J9H1nv9jUoSzy2TZGPhmTWJUWxHTIiy9r5TAL9xTRUksb0rxU2h2qMk/U0Ft7YQX2bX7IRBxyL6o0GS3S0WLgIt4uHuQYUIiGY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WC9rcVF6bmR5WnlwT3NReTdwNHh4dHpZbFhBQ21xUjBQalFZNk1JTHBrVzNp?=
 =?utf-8?B?NjRpZExCVENqelU1RUsrVEx4UXpndkFEbUxlMExGOGc2WkljeWFFOHZDY3hJ?=
 =?utf-8?B?WUduL1RseitHWm5zSjc5R1ZzYm1ib3RzTFBoVXpFblVkK0lJMUdscWxENU9K?=
 =?utf-8?B?U1lEQmNDSjhpWjNvb0lmQXova1lDOUpVTUhUTVNqaWc5TnJpUU5DOGE5SHZ5?=
 =?utf-8?B?UkJ0ZVdOMU0zTXhUdGlzbk9YWjFtdUJiMTVUVWQ1Ym1LbFI3d3V4eXN4WGo1?=
 =?utf-8?B?QW9LdmQxbS84QklRREdhcWN3VC9UNGVib2UyQ3BkcWJkay96YXQrbVVDU2Fv?=
 =?utf-8?B?Mko1NDFMaWRqckdndysrWURSSUt0MUZZbFNWSXVUMWxZaWxHVkl0RWxPaUZN?=
 =?utf-8?B?L2xxSmdHMHdVQXIvZU0zdGNrQ0JLNGFVOHFBMXhCaHl6L2FLT3VzQnFKUkhC?=
 =?utf-8?B?WklZNEduU2YxdWFLbkQrWjR2QjJtUDRTUVF1WUpzd2RVc1NWckVMVks2SStr?=
 =?utf-8?B?b1U3Q0JvMnhkT2hOb09samRBWHNZMFhvL1BGZXFiS2xvMEtDNjNsVEc4UlZY?=
 =?utf-8?B?TmNhYlNnQWJucUduaTZTTWJDN09qcDFLejhjdjZnYjZiWlg5OUI5Vld2d05R?=
 =?utf-8?B?NjRqYUFWRkpHbTRpbm1JMDhHeTNyTHVacVllV2Y4Y3ZmUElkTzJGcDcvZEdK?=
 =?utf-8?B?aE50RFB5Q0gvaENsdGU2NGpyUFAxWnRRVGwxd1QvZldqOXQySElzNEgvazJr?=
 =?utf-8?B?RklDWXVCMyt1cTdBZWJzRnhZZFgxK3NwSXZja1NOVGNNc0ZoVHBCWk1hVGRZ?=
 =?utf-8?B?SDdSZ0hUSWVmTy9MYjlJU1BiMVNMOEprMzdub3p0MVEwZmdlVWhTQVFJNUJY?=
 =?utf-8?B?YTYvcTdCNEVRdzRIT2NPeGZlaytlZTliQTVRbjdTS3JCNE5ZMitHVEdidW9t?=
 =?utf-8?B?ZDF0SzVGelkyc3NOb3k5TXMyUElDcFBWb09nazNNMjdSbFFrUW1NelBqazBM?=
 =?utf-8?B?cmhTTUdQRFgrNndWUnpvRGd2bm80WSsrZm01SzZ5NkprVVBmdWdkcitWNHRT?=
 =?utf-8?B?bTFsN0REaWd1dlRXS1RrV1c4U1YzZUl1V3ZmdGtxOWVYWHNkLzgxYTJYVC9r?=
 =?utf-8?B?WURwQ095c0E0MEJVRlFiMEg1bGZGVC91TWM4RWJ1UHVhK2dRcDl6ajRaSFpz?=
 =?utf-8?B?QzRqUjF3MFZQRitxR1hrQ0tDdDhwdTh3dXEzYWtyc0JRWVdFUmlSOVZNajVp?=
 =?utf-8?B?RldsVFMzUXlYUFBSRW5jK3B3anc1dEhxL3hwa2FrdngxaFZtQnBWMjUycUsz?=
 =?utf-8?B?dDdHWmhZeU1xN05pdE5RblVTR0E5L1F2Tld1d1VsczlBdjl3ZGdiQVNNQXdt?=
 =?utf-8?B?RE9VQlVzdDFTdGREaTBoNGh6bVRSd3FNOWJFV3IxZTZNS3dsM01XYlBsWlhN?=
 =?utf-8?B?RHJ4aWxPQlUwWWlrSHovUDZ6Mnd2RGNiYzdEdXlrQjV6ZVpUbjMycUVSWHgx?=
 =?utf-8?B?d1l0UFVaNGt5bnpoMG5YeFVTZnRPQ29PQUhsbnpuTTZ6eGhmM2E1SnBycEQw?=
 =?utf-8?B?dmpuWWpzbGk4STJjQTBGVzNHeVYvYUNJV2o1K1hXM1B3UFJ0YWRESUhvTlZh?=
 =?utf-8?B?SDdrcHlZOG5xTEh1aXdaRWFUeTFVa2Q4RGtIampBRnNBQ0RpL1dLaUcwdXQ2?=
 =?utf-8?B?c0JWdWIwbEROelNLeng1bEhHNzlwNEFLOHVmV2M2MkRjeXh1TzBJZTFZWjJa?=
 =?utf-8?B?NmxKamdrUUp0VXRQNlYwZzdkd09takYrb2w5WUF2L3FQQWhPWGtIQ1RtRGNI?=
 =?utf-8?B?RXAwQXdOdXJGTWhVNG80Q3ZMczRJTng2V3BJRWJ2SUtpS2NKa3p4MXAzTk4y?=
 =?utf-8?B?MkdJcm5Sd0NrekhxbjdpUEhxQmxjQ3prMlIwOGkzaVNkVElhOWU3TmNTSGdu?=
 =?utf-8?B?bHRJMUFrOTFUeitxU3gwY21jUk5uSXVOUnY2S0xNVTd3c0dTZnBiMG5Bbkdl?=
 =?utf-8?B?Z2tpcExhZkVlVXpEUlQ0UHZCVDFNUFdNTkJCQzJPWVU1eFlmZS9tQzVuaXoz?=
 =?utf-8?B?LzhwT0JsZm9FdU40TEJVbkpaRW9nMjhBdmhCVW0vN05BUVJRa2NLSVV6QmtY?=
 =?utf-8?B?MzFDSXdFc1R4MG15RHozNGF2TEYyQ2ZVaWJFUmRHK2tYek9kWjBObFZOazZP?=
 =?utf-8?B?aHpSZWtQazVmWnNYTFM5cDZHdjArSkw2NDlSTW90YklLZ3RtNklobXMxcTBD?=
 =?utf-8?B?Wkt0bUExZ2JCTlNNcVd6UUtsNklwbS95TXRod3RsVkhjM0o0ekkvdXpwaURY?=
 =?utf-8?B?RjZOM3l5Ylp3NGZzMzZJUnI0SHNhMzVDRXlzVm5paEJIenRUSkhRcWNpbDVX?=
 =?utf-8?Q?eafpC4WDEmNbM8Wg=3D?=
X-Exchange-RoutingPolicyChecked: AKzucXYWGwA0LtAMK37dh1vXakBxB8k9k6JzkA7UYwIXms4OaDjPAYKFLrW71kjHCmyGCFHljYhX0BdMyllkpSJWDciZ1W909YSyeYMIIruT1hF3fubZSwG8t1rEJ0mwrPX3AU7QpflRxJ9MfoqCJoBZ/7HXMaq9nKTb+WWQKU4onrfSd3QKiHsBptKzKVNty95DSJLODWby4IFCahHqKEq2xGQveltkgfEe+8PlAcWiyegtnk65frdEaS1utGw6E8Sr28BPYy4h2my1VBDXIHrT/d2n6fIMzNKh68yJ2MXOAiLSdfbJmqwH63sw3fGshNYMPfWaf9EEozF7MmZBcA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e49925-9155-4eb2-3b91-08df13b40f85
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:33:38.8003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9qV+1c8dkhiaEQhVlPhmie05GNhuhhIhC3Rrq8Yx7Ubf+OFL0DPvJUw+3dR1yNmFVbBrpGShaQPBTy+Nmshc3Xt3IYihXlD00/E7uPYcR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:
> @@ -2377,6 +2380,33 @@ static int rdtgroup_add_files(struct kernfs_node *kn, unsigned long fflags)
>  	return ret;
>  }
>  
> +/*
> + * resctrl_hidden_files_set_visible() - Show or hide files marked hidden
> + * @kn: resource group kernfs_node
> + * @show: whether to show or hide
> + *
> + * Iterate res_common_files entries marked hidden and show or hide the
> + * corresponding file under @kn.

As a generic helper this is not appropriate since it just blindly makes *all*
hidden files belonging to a resource group visible or invisible. This pretends to
be a generic function but then assumes that only kernel mode related files
are ever created with the hidden flag set because as the kernel mode changes
all hidden files belonging to the named parent changes visibility.

Reinette

