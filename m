Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EE95427ED
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954872; cv=fail; b=Pb7Z5fTHPnTbOqg4u45ZsPR4UVtR+S0HVdLEIcf1euoJ4doXJXztwe4qsiqotv4LW/l7jRY1Nc3+FmIBkDSPAGtGbj+B/Xv2KyoVr8S4KqfVAPrscV8r4OMxCwH0KSCVZsvUNy9d4LBH4p3j2M6OFS3IfZolyk5/QLQ7t+boB98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954872; c=relaxed/simple;
	bh=7sIC9OS8qEbzOomws89r9rzXjhGBvUEq+IaXIzbc3w8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BlirR2TDgk6P69mi0uvxvm5M3NnvtSWCjN/XGVuccRVgov77VY946YLE4b/0/9BUEb3XVZk8ooFC+Q4lpvKEVmn6hWc0vHugegFiiVM4qS+AWizsIO76/nuqI1TzJO46fZy35+DWpoXqxDqRk1yZqYdf4CfOqsI3AgQQeCazUvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXjCDQ+f; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXjCDQ+f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788954871; x=1820490871;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7sIC9OS8qEbzOomws89r9rzXjhGBvUEq+IaXIzbc3w8=;
  b=JXjCDQ+fVIlSxWM8WKBsSCObtX+r8xpXqHhl0igF1OH92NMZJlybh7yX
   Ogo60T76ifRvR6OTZuaENRW6d9qgH60AE7SR2eJG6loxZWkb8M+1OD6x2
   TugvOrkwaYGGtOk1ZFfJQwoX6iXbN0FnI5RMSjSeiJ6jn1yhuqRojGMwK
   zABYwMmIhOG2pTwiKm142rIxmrpgNKzmMHxg3QH51Q6QHr6qWQUnqJk14
   O4DAKEVISrjBiy5M/DCB0D9ot6fhQae9BLLwbSCsh0rMbBH/uCGF+CMOS
   NOvQ6Dj/E/V1IyyG2+PoVWSE7T8q2t0Hon/XKRaYvUdkDKHfYdFPucCwi
   A==;
X-CSE-ConnectionGUID: W+Z4BnJ6RWamGdCpITXGTg==
X-CSE-MsgGUID: cQkXGZCvSeeEP1qaZ2A2Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100897854"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="100897854"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 04:54:30 -0700
X-CSE-ConnectionGUID: ZQaJ/Cw5SVeuBvDhcvONBA==
X-CSE-MsgGUID: wtcA2XUoTuKZoHYpZ6Q55w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="268048521"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 04:54:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 04:54:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 04:54:29 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 04:54:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/XtEEe9gIxHkbcS+iN6kqQDYyvSDed2QtjYe1HAgltDXcJk2VyJRTGx4nEeeWo3W6d3iF+fKTTrDJYaK1LZgkxLMymXRcsOOurSjSjIpDbOP5z+bdvQxdwo1P1tQekCkJaDk1L9Df90FAdlEKiuFd9HViIs06YVsWvTNOHtQm2ISlh1MP7667calawjaD2TvMldTi4neo5oeT2gLP6mLr78V3W7iysuWox3tUjxTr21TDM2qQoY5DV1a8Jq6SDfucMLXB2mZcWwHhnru1vmSbGVRK1uRxGF0rfMBueNpAzwO73M70qQ6agc13oaW8HCHYzXrXTVwbSSw2vxPP82rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ljdlo/8zHcsVQqrr3WRVwfsw37TyHQZIdatCOm/odc=;
 b=YePQvLiTsSYtNPJoAjh292PO67AXR/jPrjT5jqlC7wIxjQtsrYcRT/Hvf6FrgDmq8jHjVhDN2c28tybwfntThBYgZZX7BiNArFWTIcukT7/1EFE5aGLywCZ1U1eTFg7iwpRTuxibYK09titBr3Ysy1qAudenC2RxbK1J0uTHccqXbDcmS7uEN0u4vjy3X3Z15l1QC4nyQzVluhOh5MtmulwJw0O0PF5kylm8eeqHagKatADlXOa1T/UJxB8KlliweDtdy21h0YHQx5C9KQVvb02WFiHmCgnhgXrbnU8ULR71yXwHY7N6pArksVOTGPscNxhg4i1NR675xQPlYkC3zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6005.namprd11.prod.outlook.com (2603:10b6:510:1e0::19)
 by DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 11:54:09 +0000
Received: from PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae]) by PH7PR11MB6005.namprd11.prod.outlook.com
 ([fe80::4f64:b0b5:4ed2:39ae%4]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 11:54:09 +0000
Date: Wed, 9 Sep 2026 19:40:43 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Tim Chen <tim.c.chen@linux.intel.com>
CC: Chen Yu <chen.yu@linux.dev>, Zhan Xusheng <zhanxusheng1024@gmail.com>,
	<peterz@infradead.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>, <zhanxusheng@xiaomi.com>
Subject: Re: sched/fair: which tasks should nr_pref_llc_running be compared
 against?
Message-ID: <aqFFu1Xo52cQV3iy@fengwei-dev>
References: <20260827135000.735138-1-zhanxusheng@xiaomi.com>
 <59e2b8265fc650266b93d8f523c366edfa912428.camel@linux.intel.com>
 <apPnJaUS5vq2f85J@three-body>
 <06ed8af87506f858176a81a4c29acf92d24b6dc7.camel@linux.intel.com>
 <apmQaelH5Y7czrOM@fengwei-dev>
 <2b0a35122ee615c6fa51076e5d79330e633755ac.camel@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2b0a35122ee615c6fa51076e5d79330e633755ac.camel@linux.intel.com>
X-ClientProxiedBy: TPYP295CA0048.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::14) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6005:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6e14f4-6754-4cd2-1efe-08df0e690d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|6133799003|10067099003|11063799006|5023799004|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dxnS8ZyNKuJ09WyypwVI1Mxi5m9gmLd+iI86dL4XmMmhvLw+TnyyJV+hNiSsezFYAuTkY5vhh4Pi14CMg80QLIEhY5RYGzcOiaMpkKeOFQVG1dq2dWoiPsAM29/snMU+fC+ReuLqKSqyYuPyyAaZnQCq4wjsQd1BSi/gg54tHiUH+yOATLM/8yQzADIP/AtT3iEo8uVxxtXndI2YcFzptc19u+NlF7arKeKIR7uB9GSqAak5W9Tn2PV6OPbJFf8asb26oKehWesTAGKXGWVRZ553xLh+yIfP+vQIJ3aX+G5Pq2bl47tIXMHzTFofSxq1yGjyvp2Bdxez5/7+YPn74zPmfdbnt3u4buFWISyuec277BGhG8cTj7rbo4lnvl82s4WFNazcmazsh/1pS/hdJ3FI7P0bDjPN2kDr0tiOg/C5yBtxTYWHT6fr6lQcFPb07mYUJAwV76V1zu/RAuEi5Q4//DTlHDKYCRxjZZTMMdH+R59RRuhR8YcTTf3aqGmRB7+MHkuWP2G0ehtNc1/awd+ZIKMbxTTrHH4/SQNtRtGhlX5PfZKH6klZmTTWNmbKlvncL/j4nPVLCdGXmLjxFDdmduco9nCFru0NqGPHh5+xJNxRM7G8fa4LMhGU0fjgQkoDYjHx93JL9M0wiEHyYMd/iZowUTnJrZYLqyEgQvQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6005.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Doy0oEhwkOMswnxJljcimvHIMz6aLc9i61j6XcZMPJ9vf2C2EtyGGlmiTb+o?=
 =?us-ascii?Q?Li5AYIDgPksSTxUsmw2XK6T+GDP0rNtlhn/509enjl7EkPNS8SWVUL+swWDQ?=
 =?us-ascii?Q?C27C+CNgyTRtbx+v0CcgkbdOACCQAb8XEIrjbV8vXFBaUWa7Y8i6VWaby9x0?=
 =?us-ascii?Q?F0wAqfxqo/BYJ0Sire2V+ytyxIGKus1n2cs+YIoC+p8rXsAuaYVEvXbd923W?=
 =?us-ascii?Q?ELXUCZu7BP48SmgdNyGz0rSDzoA2UWX/QG9PxzYzjeeTw6nSK7ynv0ZE0/4N?=
 =?us-ascii?Q?4KYaW13Ke3mixtUdPKS1fsTdImn4XGxq8Bgz1mwVBus+rOBFpho/Hj3r9tjm?=
 =?us-ascii?Q?Pt+cAx6ApRCY4LaYB2igE1WB+CezR0XBf4hHyYHN9l0gnf4Q7ZMiJ3vveknI?=
 =?us-ascii?Q?LgEtqAq+c56h0uk1VnGE6CY8Uz8vKlzP1cGm/0tpVxjiEL37o8RKbNGRjhJ8?=
 =?us-ascii?Q?W3lJhwJTRaPB6N6rw1dxYLJBOD27x/rgIOWxj6Xe2naZFu+o21Z1ByzKHwSO?=
 =?us-ascii?Q?fu/0xsfMGEGTxfk3jN1tV+8Y3hftL+Qzp15KhfkWXL8Iqzu0cTT7YYRSeQLw?=
 =?us-ascii?Q?R0rOLb/TERH/p8zBY85xlRFeDtq9c3speVTifS/L2TW+2fWWoYNRKxpJCYuu?=
 =?us-ascii?Q?gFH+uAv2OBQQe2qp+bYcbwDr8xq5+7GMQ34Q7mq/INIKTzfn+vkrTmy3gGly?=
 =?us-ascii?Q?iDKG4TYPMMyMzMuB2WE0naUiay5U9eAAs/qaKJQTCxFZLWfylX6lcVYBSlrT?=
 =?us-ascii?Q?7BaxjDznrGAd+QfTrbP1M5JY0P1mlcdgYSh2JkIlYnOyrvo+Ln/ICkI6Fd7z?=
 =?us-ascii?Q?qqN3qDamyNeyYnwN5RbEwC+OtGi4oVeU3WR2e057ZICCO7SE2gfGa+kc7bC+?=
 =?us-ascii?Q?6fq7qIo1X7iMf1RK/TIWRMKcwwpCtEDViFqHCnZdOpyRjVxk9yY7Au4cTQx8?=
 =?us-ascii?Q?QgLQmUHc3wUWHxoet0qvj5h2PM/6UCuySmOI8Gl+XzDoPx1QFa32/RjEBbmK?=
 =?us-ascii?Q?OegJY2GcvHsnlhhdEG+MXKLtoY43huDQmV8DIja8GMoCJVi+2DdKDN3B/A6I?=
 =?us-ascii?Q?p6sXAhjsqEt5XC6Zd3J87dMBJu/XfbXW58ZAI9ALPoKcUtJ2PX3FzuaN1Q3h?=
 =?us-ascii?Q?UNhZQCqSvB8Y+cBbpIfBofM21fN3D0w4mkcnFa69a9c+9WM4pfRm16YZdVNL?=
 =?us-ascii?Q?A9Hpa16LaKOLCsfIG0LmJoBerNM07wGbr9erzhzY9GShCr/qKLiJc40q0hSO?=
 =?us-ascii?Q?mCE69fiVRSahu674XrNZ4yGFbGP4p09L5LbEEF2HFqE9xcfFuO24CjLxb72+?=
 =?us-ascii?Q?YY7fCHkwlvxGuRi2Ip0ZsOcfQTMhpGmtpaWo3wKP8wyKpaGF4bIfy11nY0/0?=
 =?us-ascii?Q?blKqi0kWrGSiRSg54/tl/Su1wGlLkuy7grqJNfgKqVkJrSQNeMczTPy5+TGx?=
 =?us-ascii?Q?62lYZHKqwzcoYjZRjfZm1hC4c6Vs38IypjQw2tFSk3cb6DH67VS3ThZAmGjf?=
 =?us-ascii?Q?iq0heNB1Xcbdw9CHevLg5zmuLof1pZ9Zz90ji/7CTazK55L78ar1Qn6/17Ux?=
 =?us-ascii?Q?w0Z0s/GqqTsTs33sKUmSqELsxBUUEnB2ubLhIPaXFLSh5Lks54Ajf365N5zC?=
 =?us-ascii?Q?x4+UahdVcaGyUZ/iSJdcL5wAVAEOGoYNUinqtoDIvzQzG0TrT2U9a6Vph2GA?=
 =?us-ascii?Q?2z1MzlEC4XjwwUcbSu4uYQ4myvtrYhk5X7Y0/b9DUU91ITruaJer2/B1mGUu?=
 =?us-ascii?Q?5PuaZ8rpYQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: JgrXf5M0hWpBekee/OlR384aWH53PjPxxiLzjyFTQ7OemV2UmmgbTMJp7laa7pF2hoh701eY2fgWNhGDfp7u/KeMfcgTWb949lZ+Z5/PD0hr/96gnwuw6qFkpjMHoKx0/KwtzrB/YQ5KXJo/la2jv6N7FlZ59yn911cuevwRsiYun8UwXH38jtGYQsUnxCyErYBpijOQ3dfcbHm2d+OhmDFda8dUVDvI5vahy7583lcQOAa3hpn0kJbwS9Xsoe2nh3ymp6YsJKIDEw0X/QA+Q5hJjucTYK+R1roIsbMgYirUX71GQGCkMUU9Taa/Ltkt69u5gmk5sjg4bx7/oeQgiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6e14f4-6754-4cd2-1efe-08df0e690d58
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 11:54:09.2118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSZHzIy1W45SeoAngKbPbjW07Txhe62HcZ/WbgpQR5yTj7n2af3AxuraSI9XmYCf1u3OQqnmEmMJbgSbzDG/sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 01:53:10PM -0700, Tim Chen wrote:
> Good idea - the four sites really are one operation ("if the task is
> queued on its preferred LLC and runnable, move the counter"), and
> folding the two conditions into one place is what keeps them from
> drifting apart later. I've adopted it in v3; account_llc_delayed() and
> account_llc_requeue_delayed() are gone.
> 
> I split it slightly differently: a membership predicate
> 
>         static bool task_pref_llc_runnable(struct task_struct *p)
>         {
>                 return p->pref_llc_queued && !p->se.sched_delayed;
>         }
> 
> with pref_llc_running_inc()/pref_llc_running_dec() wrappers over it, so
> the call sites read as inc/dec rather than passing a +1/-1 delta.
> 
> Two things to note:
> 
> 1) I kept the call site comments of pref_llc_running_inc/dec().
>    The helper name says *what* happens,
>    but not *why* it is safe across the delay-dequeue transition - that
>    set_delayed() already did the decrement, so account_llc_dequeue()
>    must skip it, and that clearing pref_llc_queued there is what
>    neutralizes the following clear_delayed(). 
> 
> 2) The pref_llc_running_dec() placement in set_delayed()
>    is subtle. It has to be before se->sched_delayed = 1 or
>    decrement would not happen. That deserves a comment so no
>    one would move sched_delayed = 1 before the decrement.
>
> 
> alb_break_llc() decides whether to break LLC preference during active
> load balance. It does so by testing that every runnable fair task on the
> source rq prefers its LLC:
> 
> 	env->src_rq->nr_pref_llc_running == env->src_rq->cfs.h_nr_runnable
> 
> But the two counters cover different sets. nr_pref_llc_running is updated
> in account_llc_enqueue()/account_llc_dequeue(), next to cfs_rq->nr_queued,
> so it follows queued tasks. h_nr_runnable is updated in set_delayed()/
> clear_delayed() and drops delay-dequeued tasks.
> 
> So under DELAY_DEQUEUE, a preferring task that goes to sleep stays counted
> in nr_pref_llc_running while h_nr_runnable falls. The equality then breaks,
> alb_break_llc() returns false, and active balance is free to pull a task
> off its preferred LLC. Active balance only moves runnable tasks, and this
> is the only LLC check it consults: once the stopper runs, LBF_ACTIVE_LB
> skips the per-task test in can_migrate_task(). The runnable set is the one
> we want.
> 
> Fix it on the counter side. A task should be counted in
> nr_pref_llc_running exactly while it is both queued on its preferred LLC
> (pref_llc_queued) and runnable (!sched_delayed). Define that membership
> once in task_pref_llc_runnable(), and adjust the counter only through
> pref_llc_running_inc()/pref_llc_running_dec() from the four sites that
> change either input: account_llc_enqueue(), account_llc_dequeue(),
> set_delayed() and clear_delayed(). Gating every update on the same
> predicate keeps the delay, wake and dequeue paths from double-counting
> or underflowing; see the comments at those sites for the ordering.
> 
> nr_llc_running and sd->llc_counts are not touched and stay on queued
> semantics.
> 
> Reported-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> Closes: https://lore.kernel.org/lkml/20260827135000.735138-1-zhanxusheng@xiaomi.com/
> Suggested-by: Chen Yu <yu.c.chen@intel.com>
> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
> ---
> Based on v7.3-rc1.
> 
> Changes in v3:
> - Route every nr_pref_llc_running adjustment through a single membership
>   predicate task_pref_llc_runnable(), with pref_llc_running_inc()/
>   pref_llc_running_dec() wrappers, instead of four open-coded sites
>   (Chen Yu). Keep the per-site comments that explain the delay-dequeue
>   interaction, and note that set_delayed() must adjust the counter
>   before setting se->sched_delayed.
> 
> Changes in v2:
> - Prevent a delay-dequeued task from being counted as running in the
>   enqueue path (Chen Yu).
> 
>  kernel/sched/fair.c | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 8dff37059faf..72aae7a50b8b 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1538,6 +1538,28 @@ static bool invalid_llc_nr(struct mm_struct *mm, struct task_struct *p,
>  			(scale * per_cpu(sd_llc_size, cpu)));
>  }
>  
> +/*
> + * A task counts in nr_pref_llc_running while it is queued on its preferred
> + * LLC (pref_llc_queued) and runnable (!sched_delayed), keeping the counter in
> + * the runnable domain so alb_break_llc() can compare it with h_nr_runnable.
> + */
> +static bool task_pref_llc_runnable(struct task_struct *p)
> +{
> +	return p->pref_llc_queued && !p->se.sched_delayed;
> +}
> +
> +static void pref_llc_running_inc(struct rq *rq, struct task_struct *p)
> +{
> +	if (task_pref_llc_runnable(p))
> +		rq->nr_pref_llc_running++;
> +}
> +
> +static void pref_llc_running_dec(struct rq *rq, struct task_struct *p)
> +{
> +	if (task_pref_llc_runnable(p))
> +		rq->nr_pref_llc_running--;
> +}
> +
>  static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
>  {
>  	int pref_llc, pref_llc_queued;
> @@ -1549,7 +1571,6 @@ static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
>  
>  	pref_llc_queued = (pref_llc == task_llc(p));
>  	rq->nr_llc_running++;
> -	rq->nr_pref_llc_running += pref_llc_queued;
>  
>  	/*
>  	 * Record whether p is enqueued on its preferred
> @@ -1567,6 +1588,9 @@ static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
>  	 */
>  	p->pref_llc_queued = pref_llc_queued;
>  
> +	/* Skipped while delayed; clear_delayed() adds it back on wake. */
> +	pref_llc_running_inc(rq, p);
> +
>  	sd = rcu_dereference_all(rq->sd);
>  	if (sd && (unsigned int)pref_llc < sd->llc_max)
>  		sd->llc_counts[pref_llc]++;
> @@ -1583,7 +1607,12 @@ static void account_llc_dequeue(struct rq *rq, struct task_struct *p)
>  
>  	rq->nr_llc_running--;
>  	if (p->pref_llc_queued) {
> -		rq->nr_pref_llc_running--;
> +		/*
> +		 * Skipped if still delayed (set_delayed() already removed it);
> +		 * clearing pref_llc_queued below also stops clear_delayed()
> +		 * from re-adding it.
> +		 */
> +		pref_llc_running_dec(rq, p);
>  		/*
>  		 * Update the status in case
>  		 * other logic might query
> @@ -2008,6 +2037,10 @@ static void account_llc_enqueue(struct rq *rq, struct task_struct *p) {}
>  
>  static void account_llc_dequeue(struct rq *rq, struct task_struct *p) {}
>  
> +static void pref_llc_running_inc(struct rq *rq, struct task_struct *p) {}
> +
> +static void pref_llc_running_dec(struct rq *rq, struct task_struct *p) {}
> +
>  #endif /* CONFIG_SCHED_CACHE */
>  
>  /*
> @@ -6382,6 +6415,14 @@ static __always_inline void return_cfs_rq_runtime(struct cfs_rq *cfs_rq);
>  
>  static void set_delayed(struct sched_entity *se)
>  {
> +	/*
> +	 * Drop a task leaving the runnable set. Must run before sched_delayed
> +	 * is set, or task_pref_llc_runnable() would already exclude it;
> +	 * clear_delayed() mirrors this after clearing the flag.
> +	 */
> +	if (entity_is_task(se))
> +		pref_llc_running_dec(rq_of(cfs_rq_of(se)), task_of(se));
> +
>  	se->sched_delayed = 1;
>  
>  	/*
> @@ -6412,6 +6453,13 @@ static void clear_delayed(struct sched_entity *se)
>  	if (!entity_is_task(se))
>  		return;
>  
> +	/*
> +	 * Re-add on wake, after sched_delayed is cleared. On a final delayed
> +	 * dequeue account_llc_dequeue() already cleared pref_llc_queued, so
> +	 * this does nothing.
> +	 */
> +	pref_llc_running_inc(rq_of(cfs_rq_of(se)), task_of(se));
> +
>  	for_each_sched_entity(se) {
>  		struct cfs_rq *cfs_rq = cfs_rq_of(se);
>  
> -- 
> 2.32.0
> 
> 
>

Yes, I think this version looks good now. While looking back at Xusheng's proposal,
I noticed there is another option:
if (env->src_rq->nr_pref_llc_running == env->src_rq->cfs.h_nr_queued) {
	...
}
May I know why we did not choose this approach, is it because of the following
scenario?
Suppose there are 3 queued tasks: p1 and p2 prefer the src_rq, while p3 is a delayed
task that also prefers src_rq. In the current implementation, nr_pref_llc_running is 3
and h_nr_runnable is 2, so alb_break_llc() might return false. As a result, active load
balance would be triggered, and p1 or p2 might be migrated away, which is undesirable.
However, would this still be a problem after Lu Wang's active load balance guard patch
has been applied?
https://lore.kernel.org/lkml/20260903020656.3793626-1-wanglu.priv@gmail.com/

thanks,
Chenyu
