Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA59399346
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791645586; cv=fail; b=gql5qaGXhLEy65QWRgS6d9A2B8tpGkyXSOSBMCjFJRD2iJl92XX6W3AWgqZkzqKVed+lrr261fNwjB5+wx3Py4hUhpHdJvgwpseIEhqV+PymssIpS4rNdueWFAhVGEjAT+Y3uaIaxydzLmfDkFijoEfwoq1EWb1RJA71TmPxWwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791645586; c=relaxed/simple;
	bh=vBMyBXm7DmomcqyfQ31Hd/ts9euQnJrvjizfboKiFmk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NpsJgGlasUTmxLuhunFAqG6ClJu0FwctOwYXiLXEJMy7qawAzNlzSbpG8Nx0mXh1kGffO75SP3TW0N/vOTPJAzr6AmyafxHynMng5UAyc6/ShQzTJj79YwBKyiIkDuyhvqg9EJGrgVR5T/4EXYqFc1VIGQJCCF1dzEhEeOBwlLo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7V+zXYL; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7V+zXYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791645583; x=1823181583;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vBMyBXm7DmomcqyfQ31Hd/ts9euQnJrvjizfboKiFmk=;
  b=k7V+zXYLhYkTUdDXb/IQsjn8u7G7gIftgehIP64kEPXp+YoBEIs/PwOB
   Lqqgk7UhuYH+oNhdV22fu8+ANheBgWqfg1kty8oLCMF7+zi1Wx16BGTtq
   nBP+gel5SarosO1Cysj3BvXkupvnbXqcOP0xSQPgSYSWIVPz8NTbZDupi
   vOeKF2zNGGkyR0Xg9sdjOF/UxOokQj4M6gnugiv1w1UpW2iCDyO40zc4M
   8LDI6IHhM8BbQMZyP3TkUeoIFxgZ7vQxUIFHnrb+2wkyeWkghop/KHidH
   zsual1o5X0rt/1U22hZUGK17hDQ1oLf53bYMsgNSUiuGOhRKMom0gMSDH
   g==;
X-CSE-ConnectionGUID: MM5EI/CPRCyHFqtGAsuJjQ==
X-CSE-MsgGUID: gQ6t+qRPSTiZmkRdLiQVWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="320277"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="320277"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 08:19:42 -0700
X-CSE-ConnectionGUID: vIGYzwtMTz+UhvpmIp+YVg==
X-CSE-MsgGUID: 43HlZDbERVi++qw0z2ga7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="875079"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 08:19:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 10 Oct 2026 08:19:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 10 Oct 2026 08:19:41 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 10 Oct 2026 08:19:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwwE4qCkNDSYUnh6u0GzC+2YDOaFZiUtJH7dYfV0xzDOg76xdiiNwsWU8LvWbf0FC10hgo8yYRKDS4U4/NItArfGCMo7DjwPg3i7Kg8JYrE92jsPnKGYMnKvUPaTAEm+F1tw45ui5SpctkP3AQQzY3rpKuN9iqT4+ByVBpAFDSgdg7TuR48+KwArQVey0LgiS7nTaUk+29aymx6Q6Fj7NvQW/ywezsb2nyCZUSO4DdrjWWTn1YTXNKOksqtVA7GTdgeRX6B5uhcXbkgA6AlFNBC7PGS5fwwvNHny9TckRwjuV/rwcr8CnTVIGq8/6cq0E1b2XEPbZbMIvt2/B7GtYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTN9PULEiPhmwUGASOv1mhAfpEdSaa2R4IJ8KfOLyws=;
 b=o8ig7lgoRSSBh0/2MRaX+tSOgAwzDjnrzNFi+aunEvy7+mVm8DdgPbiMvNVg3yYLghTKy8KspEHyAgQXCBTe8RYufDLsHp/ue9xZ2nTHWmWllLvoBGLmS70PqVITI/zj+f/u2tiN5nxgk0Fq3Cx7JP4s7IAtg3lnbaU2V5Wqr1piqCudjl1pPJfXFp5ss/8E/8lRlMjf/pEZv5X1NBL499TQDDnc2g2odKlMn8CBdbuqSUG1aKTyfKI3Jdk4HzJ7n11WVh7sZu0OcpXZpsN+O7PRCQx+sUjTBSjXzPuumPovvKOPxYbwfBzhIdSH0+DREiaNjIAzSuvuQEerX19Ucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH8PR11MB7992.namprd11.prod.outlook.com (2603:10b6:510:25b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Sat, 10 Oct
 2026 15:17:32 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0496.019; Sat, 10 Oct 2026
 15:17:32 +0000
Date: Sat, 10 Oct 2026 23:04:28 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	"Tim Chen" <tim.c.chen@linux.intel.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
	<chen.yu@linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] sched/cache: Remove the old cache group footprint on
 exec
Message-ID: <aspT_A1vl-RwKmoP@chenyu-dev>
References: <20261010111612.31345-1-jemmywong512@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261010111612.31345-1-jemmywong512@gmail.com>
X-ClientProxiedBy: TP0P295CA0021.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::12) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH8PR11MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 708b1c48-a58e-4192-d92a-08df26e19b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|56012099006|5023799004|11063799006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JJIlfTJ3wIoiyIxU3I6mdOZlzNqarkVBvxbazNIaJVjTuSIaqJ56jdnsg4B8My8/yChAO6m2qBIKJ9tmBsytovzhND6ySBF1IcD9gvJjbNBBJavOJ5OUJgQCeGJkZaARdVCHBLpqUcDRE8R075U36HGRUtDVdEAR1Zz8m87t+uuvb4ARjXMwm1D9jZ3BiHw+5xpM5SfpcYVxq3qDfm59iTtbwKsd/EJpKQNgjTJ3EdC4whZYVFt7pIdCPoBRvjBK8q0pWvRh+IdSzQcxfZ3AL5+d0UNIqtINWKDLmj8/vgtavO95Ps+sZgrRorHhbhVVvg3JomgUg9c5IGZlftbepivgK2nrJMltMSP+yhdEwI4RcFGX7WFo1BvyqUzP5ZdYrtagCUtxDVT0cUU7ILzUHvjwGuwQ1kng2C587ZkGk0t+VdzNi9g+Rst8OrH2+ngjDbTJ0v+rJPrNvn3tq13uWUl7x9n1n3gQz21ieUZZrRBuR+fWqSZ0qhxxXz1KLIZvkUNy/a6PUpYDw3nWsrkUr7bnXU9xISfdcyUIS2XnpWfFWWBPjDJKLiFC5R46p7O/cm26b7QOFop8eIgDO0d1nqMid/t+H8zmmTHDgWvBPZrdro2rReYllGe1CYlNBnSoISt0LK4DvlrKwh6g+xGAcmhx1MrXismn1sNVztu9Idw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(56012099006)(5023799004)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eOoJZjn7RmVMznLuKZ1epH7p+3BG7Idl5GGhZ/mUbdhhO9t3Bfls+SwSjJpS?=
 =?us-ascii?Q?wd0wnyWyxAWXkxyr/8VfikBQtCF54CfHJbdoaDEqd0fK8IaHiuPSXZ5px5yD?=
 =?us-ascii?Q?SJTZ6Oknj7vWG/qSXFJCw7gF+OHT0RtOAhcTrAHgS+cLjPRdmaNpJniwF1xk?=
 =?us-ascii?Q?kC6TFDbwV437igDpM7gk7AqN98FbrDqu5gu0c3rGVHwVc3fUibYMBv1Qo8Ku?=
 =?us-ascii?Q?r1TmLNKaYYYGr5ML4YCf8vZpmrnAr0mJQsDBf4muZKrYULdyNPqmFlLQCs70?=
 =?us-ascii?Q?4o6PsMIeOSvPHnG2zMETXMo0ZIQcyGIBouFaU2o7A7LRPIZTotwIrA6JGamA?=
 =?us-ascii?Q?LYBXj8ZE6mo6iLNUp4Ix2Q/9h/sC3S4+8lR/J2nPgQ2Ul0mxGxW/k/W5w7Q6?=
 =?us-ascii?Q?RXk7XIpy+k1uTyjqFb0gGguTPJ47Qt2LLEmjjahDo68r6lnOGNBjNxAtCEBV?=
 =?us-ascii?Q?QGs4g0mNyHsyrkEZTMfy685khNB+Regyaj8WMZzd6WF2yXCPJQ7sNLDiZTXK?=
 =?us-ascii?Q?sAMNJmhNrrrsUOgHIa+lk+X+g2AdrkF3fdENTonHUqTd/y4AOdHhh9j0PFWI?=
 =?us-ascii?Q?kiAA7UxpqSVswoDe67r71YnD01vzNrw4M+or8tlp2a9ZGZj2X2//RLG9KyPP?=
 =?us-ascii?Q?CUvcg0GAnpEJ7/VnnV9QAd40cw76er1bXDFw9wsJRPBK6jsi+RgtNDQWNNHL?=
 =?us-ascii?Q?RNJNwVAz8vqVcecX3wO8hxmLHaEjvPYrp/UNTyIAkig90y0KYhxJpoSF8IZs?=
 =?us-ascii?Q?DylsAFtJmbT9K2VZKrzJQh/7C0grg09Kc+QLKDpB3iKu1Xvvk3iqvnVcOBFR?=
 =?us-ascii?Q?Y4dGHPoIbNGNNYjOhQRzeTaXBmtvxZggrip3N7epvbA99guLUR7d3NUBJFk7?=
 =?us-ascii?Q?vwxCQw8MwAZG/ec7qVzDqPFfUxg7OaOn3c0mZNS/2fvQUwUbohN+GdrvbGD/?=
 =?us-ascii?Q?sNkxuSM1FPqfxCyW3rhiFbC3h4zWfFiBg4RJdUXQgFVwtYbYOA4DdUPHThjK?=
 =?us-ascii?Q?QLI3ixxYX004J7xwpuUFEs5Q7KdHjbwrZkL8tFVz/uaYbVk0NmPnjNFTgK2u?=
 =?us-ascii?Q?B+vLX6e/VXzcYjHwHof3E+7yKrc372ZtDEe+fTnmOF4FotEGxmj5Qu0H69Nj?=
 =?us-ascii?Q?Z5HsYgJmWJHB89F2DIoi1AJk/TRsJMFTUw+quQP9wltJzF8rO802i2TZE+yo?=
 =?us-ascii?Q?X7CuGx5k7RmgU7sLqAN9pw06eRbdj7s3Yq98It9a81q/lrqRmAS4mDWAf7Nn?=
 =?us-ascii?Q?S12B4NGjPS2+72fDTq+PFXpigf36hyf7jPBI0H6MvqZQDrd2wsAlUJOJJRsn?=
 =?us-ascii?Q?xkDPa1NA6qry2yk8ud4g0xCD6x7R9LMoPhiuRVBm7ygkgq4vOQ08YydvXea1?=
 =?us-ascii?Q?tV6XiFGtl3bNWmY64dfb9WTmclWC70XyvQ7yRExNkuOScZkh/8SxTQh+lJxg?=
 =?us-ascii?Q?D4Jzfu78EhA4tRBayqNQfXGyIVwBfQCHqjD3dV9iVGTa+JPRgNfu1M1H0Wsi?=
 =?us-ascii?Q?6YGq72KELIt5OvRuYlAVCNqsXaDKnDdahAAlol9aBVuPgpS4SJqZDy4aKlFA?=
 =?us-ascii?Q?TFGCCPxhuTa6u+bCsEYtI5zmEWjQtuuFe7Shbvf9llCGlOlIQZ8c1FgBXY4K?=
 =?us-ascii?Q?XFaQUWDtrP/3D4P5IGUpFGy4RWA/WLY51ppOiNdT2sSaPPx84ZiUXuhUtAxh?=
 =?us-ascii?Q?vAMyQlBKbNu7jOsduNVTdQ00zLVJ9aJ9URZuKoUoOb5gdriLSLWGJXAYlRuA?=
 =?us-ascii?Q?+robZBo47g=3D=3D?=
X-Exchange-RoutingPolicyChecked: h6Fwk8bJpPZlOSsjLJFd9GnBGifldQZWMfN/8jTg8yaX2fhxlwimD6IaFcMdKQq8Ej4Y4a0yvrowqaXL+4kQDa9UVNoXrUk4QkDx9erUi4NCToPCwhHzSEfmpHhR2nTDfEA8zm5JFTsn48Qkb1xlZDo/pfXohXPsLdBpjVdUEqUtpr/77pe44BdXpLrYAJjX9GL3ta3hfZuKtia6hAUrs1huC2TnmJfm8sgXBaUQuzijcZUCSt8T3Yp6TmnGRGl3t1l1x4LdAsB2CFtkImHitM2UJRIXUzYTfc2atzFrLTzk6teG8yEW2GNhRpqDb/kjFeHDSa3Q/1EmF6QlZP4dhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 708b1c48-a58e-4192-d92a-08df26e19b3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 15:17:32.6337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1289RAKFM0m9hnOk4rv1+QdZbxQmcQhzTKvVDYJoo3Lka/A1sKgvRjRz9/6zLLkcx204qYjvsuszPO51RPQZoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7992
X-OriginatorOrg: intel.com

On Sat, Oct 10, 2026 at 07:16:12PM +0800, Jemmy Wong wrote:

[ ... ]

>  void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
>  {
>  	struct sched_cache_group *old;
> @@ -1778,8 +1797,13 @@ void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
>  	/*
>  	 * Acquire the new reference before publishing the pointer, then drop
>  	 * the old one. @p is current and the only writer of its own pointer.
> +	 *
> +	 * Footprint subtraction must stay ahead of task_numa_free() in
> +	 * bprm_execve(), which clears p->total_numa_faults. Nothing here
> +	 * enforces that order.
>  	 */
>  	old = sched_cache_replace_grp(p, sched_cache_group_get(mm->sched_cache_grp));
> +	sched_cache_footprint_sub(old, p);


Yes, it fixes the stale footprint issue for a vfork(). While looking at this fix I
realize that maybe even with this patch applied, we might still can not fix the losing
footprint, due to an existing race condition:

  CPU0: execve()                    CPU1: CLONE_VM task
  ------------------------------    -------------------------------
                                    task_numa_placement()
                                      read footprint
  sched_cache_exec_mmap()
    read footprint
    write footprint - own faults    <-- the fix
                                      write footprint + own diff
                                      <-- overwrites the subtraction

So the footprint might still be lost because CPU1 overwrites it, and
there seems to be no lock protected against the race(I did not find one).

An enhanced way is to turn the raw footprint write into cmpxchg.
It reduces the race, and since numa balancing scan interval 
numa_scan_period is not small, the overhead of using
atomic write is low, I'm thinking of something below(only compile tested):

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..4123f0535cd9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1771,6 +1771,11 @@ void sched_cache_fork_cleanup(struct task_struct *p)
 	RCU_INIT_POINTER(p->sched_cache_grp, NULL);
 }
 
+#ifdef CONFIG_NUMA_BALANCING
+static void sched_cache_footprint_update(struct sched_cache_group *grp,
+					 unsigned long delta, bool add);
+#endif
+
 void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
 {
 	struct sched_cache_group *old;
@@ -1780,9 +1785,28 @@ void sched_cache_exec_mmap(struct task_struct *p, struct mm_struct *mm)
 	 * the old one. @p is current and the only writer of its own pointer.
 	 */
 	old = sched_cache_replace_grp(p, sched_cache_group_get(mm->sched_cache_grp));
+#ifdef CONFIG_NUMA_BALANCING
+	if (old && p->total_numa_faults)
+		sched_cache_footprint_update(old, p->total_numa_faults, false);
+#endif
 	sched_cache_group_put(old);
 }
 
+#ifdef CONFIG_NUMA_BALANCING
+static void sched_cache_footprint_update(struct sched_cache_group *grp,
+					 unsigned long delta, bool add)
+{
+	unsigned long old = READ_ONCE(grp->footprint), new;
+
+	do {
+		if (add)
+			new = old + delta;
+		else
+			new = old - min(old, delta);
+	} while (!try_cmpxchg(&grp->footprint, &old, new));
+}
+#endif
+
 void sched_cache_exit_mm(struct task_struct *p)
 {
 	struct sched_cache_group *grp = sched_cache_replace_grp(p, NULL);
@@ -1793,12 +1817,8 @@ void sched_cache_exit_mm(struct task_struct *p)
 	 * reference, so the group footprint converges as its threads exit.
 	 * Unlocked for performance; clamp to avoid underflow.
 	 */
-	if (grp && p->total_numa_faults) {
-		unsigned long fp = READ_ONCE(grp->footprint);
-		unsigned long sub = min(fp, p->total_numa_faults);
-
-		WRITE_ONCE(grp->footprint, fp - sub);
-	}
+	if (grp && p->total_numa_faults)
+		sched_cache_footprint_update(grp, p->total_numa_faults, false);
 #endif
 	sched_cache_group_put(grp);
 }
@@ -3890,7 +3910,7 @@ static void task_numa_placement(struct task_struct *p)
 	unsigned long total_faults;
 	u64 runtime, period;
 	spinlock_t *group_lock = NULL;
-	long __maybe_unused new_fp;
+	long __maybe_unused fp_diff = 0;
 	struct numa_group *ng;
 
 	/*
@@ -3986,14 +4006,8 @@ static void task_numa_placement(struct task_struct *p)
 			 * go negative. Clamp to zero to prevent the
 			 * unsigned footprint from wrapping.
 			 */
-			scoped_guard(rcu) {
-				grp = rcu_dereference(p->sched_cache_grp);
-
-				if (grp) {
-					new_fp = (long)READ_ONCE(grp->footprint) + diff;
-					WRITE_ONCE(grp->footprint, max(new_fp, 0L));
-				}
-			}
+			/* Update grp->footprint once, to limit the c2c cost. */
+			fp_diff += diff;
 #endif
 		}
 
@@ -4008,6 +4022,18 @@ static void task_numa_placement(struct task_struct *p)
 		}
 	}
 
+#ifdef CONFIG_SCHED_CACHE
+	if (fp_diff) {
+		scoped_guard(rcu) {
+			grp = rcu_dereference(p->sched_cache_grp);
+
+			if (grp)
+				sched_cache_footprint_update(grp, abs(fp_diff),
+							     fp_diff > 0);
+		}
+	}
+#endif
+
 	/* Cannot migrate task to CPU-less node */
 	max_nid = numa_nearest_node(max_nid, N_CPU);
 
-- 
2.25.1



