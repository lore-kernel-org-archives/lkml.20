Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17038480324
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405426; cv=fail; b=E0B+lyS5XG4yetSN3dCWaW2Vw5dN8jJtqNfgEUWabgB97yWbbWASK4AuQnR/rRKShoA7uaHQXSMmcR09aTuoF0H6DZJ9tFJ/46n2EdUuRTXPtr9ipSKNfJWAsgbR9bniPM1JcZu1q10ysp7KnP67fPxyT+UkvNpcWIkdtb9odv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405426; c=relaxed/simple;
	bh=i/dA2DYMSrG/ozZQ2iDA4TB/p/OF2rR9SGQd8PSseVM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eUd4+1UF4/qPwhOCYKvyMiAZ2s0wBrF//IhkHQHTOfr4eLLHhy8QIsExTbp8fggRQ13Y6bXkI/LaNPQch0eHoieOby1k8eAdI2zcDw1W9Vv/8NiIZc8jNAAb2sHyRF+quMej6+mG8gIKgdAAw0gYFua9yBjseAYZJWVHzlEbULY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIGDIKC6; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIGDIKC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789405424; x=1820941424;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i/dA2DYMSrG/ozZQ2iDA4TB/p/OF2rR9SGQd8PSseVM=;
  b=IIGDIKC6DvAxOk7XgDVYryU73XtL4wruzCnoXADAj+cDf/T9MfX5i6Lj
   GIG0Kdj/6FpwvaQz9hPqcDBtiGZaVUZyL5viauCjcoKdD8rOMSJzQShlP
   IB5403x0TCusLZ0murHrhlziLix7lIlF/LF8YLj5U4rLjtJVvSvQvaF/w
   x2zE3dqIZORqhLVCRhlv/DZ168Rc1vmDl5bUDWFimNBedKHJ6cFMF7S9q
   EIpH4n7EXxMCHk+YXnohjzTgfcjZoQbTP41T9ZyH7XvzamHPy0VVAFfGr
   AHCCrfGQEmWg3DHaJJWagtB8i+HJgWj5tzvgV4oAf9jD3y8nZr+fPo3QO
   g==;
X-CSE-ConnectionGUID: 8eltCNCLSZmvrFi9w98IPg==
X-CSE-MsgGUID: V1URrc++Sn2zExOSpzfdgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89804334"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89804334"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 10:03:43 -0700
X-CSE-ConnectionGUID: kwetMzeXRpi2aeLQutbpUw==
X-CSE-MsgGUID: cMORaoT8T82wj8tfXFdNUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="266489882"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 10:03:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 10:03:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 10:03:42 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 10:03:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7ToG0JvwhZt1R6bVIx2jNNJ0M8prMf882gPZlHPx8FcB5ArhwiDChvwA9ar3hlE90yk6vxc850gJ8JHy/TeSkuTm5ud+UuuYdPM7kJpHrd60t5xNXDLSOOgaXQJXj5SL7s/7cpvOy/ZOgYTa/r36AlagwqvNZScUkkOsCIkXp0hRCKj76b/J2hreHkV0/WQT3pguAeNN4OxFwVyA+B4R5HY5lwYbQ8goKamZw+qkcvTTbAaFZ1XPXsF6rXSrZhOxUCjVtcd7av9hmiYqkommg3yTEYM2eJSt/Nwmdj5ITHZJeF852OtUkoq+sCCNVj52/HKZSmXg4TTocbUuVHRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GGvDwA5NCAX20u+R61yy01nloJwSJaxsZ0VzxzjAfI=;
 b=fjpFwfej7WNAwXl4MunRk7v+wcGlKNRXPra2V5yxjK0e6z8Ogpb/FJIPYdiy/tiydw5EtvJcOkg3tHKZB7hLgo9nub8khExLE1GKUwYPbXxQtzLqMdLX7F/ER0gX152sXIs+/RUPe5FZQ4HAqDr8DlPhMHqbDwFHLt33T2LUVuTH8fot2Mxu+fd2q6bKdzF+e3xJ/GwPYN9JUX16M3iU8g+Mdx089wo1sfGBLv8V3VNTkWCMjlf6FTNYvYQH09o6tljf6wE3rF+kfkGkFP1oaofYLcLuWD3SS1LBsdl9EsM+0OoG5urfeLc6T+1phgcJ+fX1dhYkrhKq2GDBEiE5jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Mon, 14 Sep 2026 17:03:32 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 17:03:31 +0000
Message-ID: <2abe67d3-05d9-4c68-b379-53445df7e7a1@intel.com>
Date: Mon, 14 Sep 2026 10:03:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] selftests/x86: Add tests for signal frame FPU
 portability
To: Andrei Vagin <avagin@google.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>, <criu@lists.linux.dev>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Alexander Mikhalitsyn
	<alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
References: <20260908043427.1842515-1-avagin@google.com>
 <20260908043427.1842515-8-avagin@google.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20260908043427.1842515-8-avagin@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH2PEPF0000385C.namprd17.prod.outlook.com
 (2603:10b6:518:1::6a) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|DM4PR11MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 811abaa4-726a-48a0-5f61-08df12821a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 1L6xt3x3AVJlewi1ex/KHkvr3od0QHbfUWod4ZF9ZgYBXC4bXm+rwhnRNroOkHRbQAdch+QGXzVcBT17+SYgqw0/gy4fFfxSkhQJmuz9i3ljbTuBmd1Z/L9Vfdh8rg6X1cQFM5izZlzIfuqxYw6MbJQBkBghtEuzLLoOfyHIvbXWngwMlSQwxtJTvbW3a1JtNzNqZf/b+89M0a787pJfyY1IoddvpGyr+zt0GTNt8gZojXeWVHyQq5EcX2YdrCH7/wmWq4iD7tMB9GA7dvcmxNVGiY3uvdfDxo9nAs/8U3zfQclEbtSQv8YU2N26cvz8g3FPTmwF1KrrLqUeAte7DJ8CKNUTIefyH/EJcwOGQhSWLl0Dx9LegiIBw9NqLPidpc37/m84Bqt35+WjRrBbs0jWxmVM2ZrHIM5VimSGvwlBQc/uPGfKVwuvsr6AcAbBkcZrMI589XFuI8FBiCj0UegIp/7Q8xl+58Pbx04zl015BioP65Q9XbSNoZVDe0MhPHLHGpLC/L9l5iyNZfnO25jWurC/SIxtXxIZqk/C+IrKshPURT96q6rA+n9QH0Iya1DTZs/O0pCzXGR+IqiVKFNHtp7eL2hQpfgFOyC3Lg4bkqTqN4WmyTcBX9Lz2bMpo2XXMPXflkfwUiawKaRVqDoqim9dcShpK8FLN9HKd38=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEVOK3VxbUdsYjExWmFRTzBHTytTYzBNMllNb1ppM002NE1Da20xc1M5Sjgz?=
 =?utf-8?B?Qkt3cC9sSzlBNTNJOGRYTk9RN0ZjaVc1RkRPeTcvVEpvTFJUdzNSMW9LamIr?=
 =?utf-8?B?RHhBN3VzcWJOSzVnWWtkQ1RiS1BQT2Q5OUxUamQ3bFY3R1ZBOUVpMmZCM3F0?=
 =?utf-8?B?cVphZEZvOW12VFM0SWNUb0dvODJNUmhVOFhPb0lkNndtR3JsY21JV3BZVHFY?=
 =?utf-8?B?ejZoMjFEMWpPL2pMS0pSOStRYUlUU3JqTk9GcnRYRkkvSE9UWTZ2YXlaNWhm?=
 =?utf-8?B?cEI5NWU1VVkrUFFTV0RxSlZHU0ZUWDlyeVNSM2dsNERNTlNUWmR2Zm9PQTRM?=
 =?utf-8?B?SmJYSVk2NU96bkREM0hsZjYzYjJIV0xOWXRaNjMyNVF1b1B5WWVaclpRM25Z?=
 =?utf-8?B?MmRCQkR3SXBnQ1IvMmd1aVpMcXpCbGJlSkJXWXNDV0t3d1JHR2NnRXdrY1lu?=
 =?utf-8?B?Y3RJVHVOVVpPUlhFS0F1aWtHeVB2a1BnK1VEZnhtWnJvY2ZSYkcwTjRqL3lU?=
 =?utf-8?B?MW5PVzNoaUNST3d3RHdUZzZ6cEJ1eER3cXBvdXZWb3l3SitHa01IVWNNV1Nw?=
 =?utf-8?B?RS9EWnhzYk1OcUJKb3FoNzZCalNZQnNpb3NRMmVZNU5yUXZSQTBVa2p6eGhp?=
 =?utf-8?B?SWZmNEpqdnFId2RhdEpUaEd0NnBDQVZhQ2VlN3JTRTdiM3VIcVFGc3ZlTnR4?=
 =?utf-8?B?QytDRnpnUXBjMjQ1VEVYYjlZMGwvWkxOd3dMQXJNK3NxM3MrWTdBZityYWRO?=
 =?utf-8?B?enhmV2FoeGJIbFVCYjRlWHpnK0pDa3hQVm5qM3phZ1E4eG12QzhRWkRPZE8x?=
 =?utf-8?B?Tjh1ZFdxK2VSUUV1ZHBNM0tZeXEwQ1ZYS0ZyZ1dUYlJHOHV3MENIaGFrSjZS?=
 =?utf-8?B?V2RuQ2plYXZYamcwNnRiRHYwb00xd3lwaHA1ajROejBuSUxMRFU3S1J3UUFm?=
 =?utf-8?B?VjVCTkEzSkpJaG43QU5JblM0dmpLZWJBazJDcHB3Yk1laUFHcGxYMW1mT29z?=
 =?utf-8?B?Q1VFUGlWOWFQWlladE91Z3BRVWNNR1VRZGNqUUtqM2U3ZU85OXZwSS9BVDZS?=
 =?utf-8?B?VzFMZUNjV2ptejJCMDBZa3U3Q3hqNjZ3alQrZ3ZXY1BJTHRaN1hiVVlmaTNE?=
 =?utf-8?B?dndoR09SVTc5REJmOWc2YlRtTFozbW5jV25SMnZxUEVOeHcrUUlMVjlZMUFw?=
 =?utf-8?B?U3A0d1hlb2VTL2M1QUFVcDJJWVVZRExaY0UwS2ZlOTdwOTFUYkpHeFlTYkVP?=
 =?utf-8?B?ZURScEZDOFdTc0RDVVNnUHFWVkNHWS9GZWxPZml2K2tML3RLZ1Y1YkUxblFS?=
 =?utf-8?B?YnRLeTZ0TTMwNFJjZ2JEUGgzUStYMzVuK1BGUnBTYmRML2EzYlhFSnpwUjNr?=
 =?utf-8?B?c0lKY0NXRjN2ZGZuREkrU3ZjamN1Q3U3TjEyQ0E5cTYyMEgwZ081NEQzREps?=
 =?utf-8?B?TEtNaGUybzJYUzFMZkZVaHgzOHdJRkpVZFRzQWdYcnQzZ2JHWUxMK3JwZVg2?=
 =?utf-8?B?d0orY3J4eHZaT2dNSlJMWGRFYnVWNmFqNWloRjN6QnEzWTRONjFjZHNadW9L?=
 =?utf-8?B?QWxxVjNvMStzTmVOVWw2ZVEyTnc0Ym55UTdTc1g1QzFxdjgwQ0FZandCWm1h?=
 =?utf-8?B?WHRnREd6ZmZxNWoxOGtZV0VVODRleWcrcXI1VkUrOUd6MVVGSTFlUEg4OWlV?=
 =?utf-8?B?V0RVZXhZZjNITitVOFNKZ2huQjUzbmtxdC91U2w4SkVRRG5LZTU4UnZyRENl?=
 =?utf-8?B?Lytmd0xpZVd5cEdaTkdra1dQeSsyVXpFMzlKN3UrOUhZR0pmOENNVm1CSUxr?=
 =?utf-8?B?QVlmd2dDQUJlRlltVHFneVFEdVg2cEM3RDhCOXEzUVRQd2lXY1REWGhIV3F6?=
 =?utf-8?B?VEh4dlJWUWxqSjRXVVFManFmbm81UW1sSzdwMm9XRHQrZUFHZ200NEJqN054?=
 =?utf-8?B?bWZpYk8weXlDOG9IT2tVTks0aVRwbVpGcHhXcHU2eWVPV2tTYkJ4SGlnMmxL?=
 =?utf-8?B?b01NYXh0aHYrOURncjhETFlGS09rZGZVK0h4LzZlb1VWb3hkeDQ5RkowSGdM?=
 =?utf-8?B?NmVTY09tcU8vL2Y1T2tFZEtvWFR3ZjJ6c2R1TVdmYXJhczQ1Um1YMDJkMERp?=
 =?utf-8?B?QVdDc0lINnBSUFR2WXhxUVpMRllUbkFsZFBhYll0YTFHQzdTN01WOXdTZGVE?=
 =?utf-8?B?a004MzFydE10TUJaak1EMkZ0dlJYMVlnQVpOL3h2TXFHNE51dVNPQzBIQkNi?=
 =?utf-8?B?Q0VZVjczSVJ1K3lDZFhXcGFLNys2Ky9GMjMwR2F4NktpS2pzb1oveUdRM0VY?=
 =?utf-8?B?dHZPZWhXRUhPUFEwcDAyU25pQldsY2E0WTBxWHFQcWtYQkpMOWNlQT09?=
X-Exchange-RoutingPolicyChecked: lPZpFcZhVCAsFBB4Blx70JxIO3FcqNdaodSToiwvqDcpHAmyy/tsOSPcb82FnKEq7ygoUv8GHUsmYvelkd8RQ+pPBEWYX06EcLABMZsZzlaDo0bNDdv7igqfr0jHTjdhs9vP73DhF6sOWSVVwmD1Z1aatYksT7p0cEfvZotecT7QeqbaFxA4HVz9iKNYpFHsZhHoBMUZzrtZ55QJTJ2nKcDF8rg5l1w9YGz68d98ebXKf1RQCwIxj6v3CPEM+GmKDgKT9pyWsNsR6aHAke6yO6+qIG4XkRvS3wsiVmLK9I6/E6bU6ofXulNK3gSSoYsnWcJMoxYfuBsklXlsP4097w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 811abaa4-726a-48a0-5f61-08df12821a43
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 17:03:31.0769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIIPc5pbnKXcp5ngkhqdOb49s6RHSJdB7qMGSMGU6P3BgcJ+NycJYCoP3oQzB2mAOK2ZKRodnOhzSrSMDaQqkDFg31a5Eab9zqj+SZRPlY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
X-OriginatorOrg: intel.com

On 9/7/2026 9:34 PM, Andrei Vagin wrote:
> Add a new selftest tools/testing/selftests/x86/sigframe_fpu_portability.c
> to verify signal frame portability and consistency when the xstate size
> is shrunk:
> 
> - test_valid_shrunk_xstate_size: Verifies that the kernel correctly
>    restores the xstate context from a signal frame where xstate_size has
>    been manually shrunk to only cover active features, as long as the
>    FP_XSTATE_MAGIC2 marker is correctly placed. This simulates migrating
>    a process created on a host with fewer xstate features to a host with
>    more features.
> 
> - test_invalid_shrunk_xstate_size: Verifies that the kernel rejects
>    (via SIGSEGV) a signal frame where xstate_size is smaller than required
>    by the enabled features in the xfeatures mask.
> 
> Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
> Signed-off-by: Andrei Vagin <avagin@google.com>

...


> +static void sig_print(const char *msg)
> +{
> +	int left = SIGNAL_BUF_LEN - strlen(sig_err_buf) - 1;
> +
> +	strncat(sig_err_buf, msg, left);
> +}
> +
> +

Nit: extra empty line


> +static void __handle_shrunk_xstate_size(int sig, siginfo_t *si, void *ucp, bool valid_size)
> +{
> +	ucontext_t *uc = ucp;
> +	void *fp = uc->uc_mcontext.fpregs;
> +	struct _fpx_sw_bytes *sw;
> +	struct xsave_buffer *xbuf;
> +	uint64_t xfeatures, *ymmh_p;
> +
> +	if (!fp) {
> +		sig_print("fpregs is NULL\n");
> +		return;
> +	}
> +
> +	sw = get_fpx_sw_bytes(fp);
> +	if (sw->magic1 != FP_XSTATE_MAGIC1) {
> +		sig_print("magic1 is not valid\n");
> +		return;
> +	}
> +
> +	xbuf = (struct xsave_buffer *)fp;
> +
> +	/*
> +	 * Both test cases shrink the frame to contain only AVX (FP + SSE + YMM).
> +	 * If valid_size is true, set xstate_size to match the enabled features.
> +	 * If valid_size is false, set xstate_size too small (SSE only), which
> +	 * the kernel must reject.
> +	 */
> +	if (valid_size)
> +		sw->xstate_size = xstate_size_ymm;
> +	else
> +		sw->xstate_size = XSTATE_SSE_ONLY_SIZE;
Yeah, I think this note explains the distinction between the two test 
cases and the point of testing:

   Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>

Thanks,
Chang
