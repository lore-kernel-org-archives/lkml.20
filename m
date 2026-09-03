Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097E94503FF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449689; cv=fail; b=kRzgg60+bT3q9DGjnzoXwliOqGFuZ0vm0jFU0EawThH2Hu5vDaJ1sscZAzfNYQuX7B7lXCVGMLDcKyiO1lvcD6rTCowTymqYXLsRwHFTQtr6C4e6Y/BdP2tytTecnLlvV5TH6qQ0fMi4UmVHAENbT1BRJjaIXvwvG59imj7FqFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449689; c=relaxed/simple;
	bh=y5fg1IkCt0O+oK/3AGVWm109FLKYcio3kjQ+xsX9fLA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E2YAHypAin/ZzuGqnXLttEgB+0PZp02NkIeyhBpfzVsiUDisewXUEN4RDIB5b972z02WwoC1b89HzAuNziGAJKNLVzyNIOu6YpT13dnCPABO6cyggvRkgHWUm6WymSKnZMf48LiimRq9TdQ7SYR1p7nDnaL/UC+WP8WDSQkdwYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtXsqxr8; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtXsqxr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788449688; x=1819985688;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=y5fg1IkCt0O+oK/3AGVWm109FLKYcio3kjQ+xsX9fLA=;
  b=CtXsqxr8tBjGtCerP6IifIWK0I7etGUS79/NwGt7drNt/wrAZgbvQi0C
   q5NZmAekcNxMSNMdScyKZvqqWVqdwtjSxHLxHWB7lqmbEyV4atE5Al7L3
   u4B8YsUSZ+Qdog6VoM61lUJPlPIhtlx2w+qulNO/JxNz6fTAb5/GZXhGL
   qFuiUktJ7gk6RhyPIswc6OoFL2433g9IYryGhljyLPOf41D35JiB6sFd6
   rsObNzGtNgVZC7u5WOiwayXmWXKeozvgD2pfNLTBb05WzTCy7yG+/Llee
   4GgZczV+TpD6ltkL6nu5OsRdUrZ0sRI4rPTaX+cD+yTq72J++wVNDbwhz
   Q==;
X-CSE-ConnectionGUID: 44D+i+K8R0WgDzOJcuMDQA==
X-CSE-MsgGUID: igNFa0q2TNqLEV1EPMTw2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106304406"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="106304406"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:34:48 -0700
X-CSE-ConnectionGUID: WA2lF3uwQUChUh5/ORaVSg==
X-CSE-MsgGUID: c+TBN5NLR+Cint6X0KsZkg==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:34:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 08:34:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 08:34:47 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 08:34:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewGK8LFdml8TEeeEdwUfxpcVTQ8ZWM8fMJJyoCbHdWDh8TjVgX8ZYXRWxVZqhkfTrgfh7/lIy9HlbUrgQc5uXaI7MNr+YwyxHQ65C2bq0VhAqahASmWU6DtNvQ96Zuy6bdwQEwjyte7hDot9f5HF0uhrjCNkDl/DMOdFnDT/cuzCd2yX1METPmjc+OCcI0pUN4fbrzduc0WhElaYPFvut+6Z2HxNTTPe4nJiih4EHaKBmq3UADBCbdUtzTFGSpjzFPfDm/DO0AU1Rj/PHL038FERM0vOdKMbpioQ8ySWyY4p7eBmuvMvEU3DnYFa49zEHAW2azLnW6AYyQZR8tS5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ly5jYwmSkab7byTkmqvOPF2OPB5kScaHHtRgMVJqioc=;
 b=Dj4jsASEoIWZpMeRf2N2FN0qrxLCbA2Pv+Ya6UB0yKSaxXu+iPIBAgC5zUkmKa6LoT+muEcTwrVo0CU8dW+KMJ85pxS82braB2l3UYQ7TJrg+LjhvWNLZmofvXIs75UfH2ObE0QQ4Qi7Bp5XCQbbyZudHnBG/opz8GBoQJe5U3KJO38jOZPbwD0UwqvF2c+554QfjVh0Pg3Y9qc7WbPPoW+GcpXMtwJbSFjqKC4sa75OUQHVxPOK36GahNEVK0uQR9p/PKhaGPjfaareBnewYHKh/ri0kOjrNxGoQoBPXqOPCftFtUpRBjWFWObnTYU/omstHSyWq4DRCfVz/1bA+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH7PR11MB7451.namprd11.prod.outlook.com (2603:10b6:510:27b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:34:44 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0382.007; Thu, 3 Sep 2026
 15:34:44 +0000
Date: Thu, 3 Sep 2026 23:21:13 +0800
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
Message-ID: <apmQaelH5Y7czrOM@fengwei-dev>
References: <20260827135000.735138-1-zhanxusheng@xiaomi.com>
 <59e2b8265fc650266b93d8f523c366edfa912428.camel@linux.intel.com>
 <apPnJaUS5vq2f85J@three-body>
 <06ed8af87506f858176a81a4c29acf92d24b6dc7.camel@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <06ed8af87506f858176a81a4c29acf92d24b6dc7.camel@linux.intel.com>
X-ClientProxiedBy: SG2PR02CA0121.apcprd02.prod.outlook.com
 (2603:1096:4:188::21) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH7PR11MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: b59e6708-c3ff-4162-c9e0-08df09d0e0b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|4143699003|10067099003|56012099006|11063799006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5teK2kZVLjJW0CRnjqltf1F6NkImzgd/EpkMS4zjOmKQZeZQlxEKKHiUaZpE54grypIBu6P4rqXStcIi2TAUSJ6fTzheLgEnxROTYjz6v8w+VsLFpgZuj+b0qv1Y3mcg/erXc62I2M8IQ34fs0Po022007zhl2IX6nzCBbcsuEtosYMevoXp7aK3IKNRrIKAxphp9SDx36irw/1r+YnW7chhYSsFoctBWAeoFd1jbnnKn0o4+LbbMg4Wt/annr+uNxdJpcGekosKJTU0Ib0o2ftJPIxVqZ/T6lNd5dO7n3f94ZjkVQj0f5LfiWmNqN7ofLQVlcSRgwBCaHLaf580xQL4iHoPTjLG+08uc32e0t/mGY4vYnwQMxcx0o40qy8NYVr72sHHzTe0PmrdibawLHYalCaQaX9MDDMf5p4MQbnmyeulbzYBeDw9x8Xk7b8sP4PD+TVXyrjUGKINKjrrLfEUTXI19ocFaTaBwm8FSoh+eYN0f611ElWOSIqx5SZLw7hI0wwMtuudJB6Ha+1Xlm1C9NRho/1JQtEshkU2V9YpQ2BuUjrosbL4vXqmNeLQY5J7Ft0ekpIcx55gVVX0Yu9d2lOS0W1MWm0glrLNytNrKXkryX/97W+ipDHDdmnlfnrgjC3E2gzM4YaPwWWbsgGjAr3LTANI2JsQ5mbZovc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(4143699003)(10067099003)(56012099006)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qk/NKjzYf65hKUyvzcBmcwbE4f/iobbtoEab8pBjLRALoJGatShp0RACJgjl?=
 =?us-ascii?Q?cRRxJk7U4XMtD5od8QGw1jAu7RDhDgvGp6EvMj+zxf+hOt/kqZX/l2kB9wd/?=
 =?us-ascii?Q?hfHQ80RU+pY+mEmMwEkyllwt2st763dy3hpA7sI1qw9EXH8Zzix/KZ+13boJ?=
 =?us-ascii?Q?kro/vWtXLV+AS/wdOW/Hal4/3WyEgvLuB0MQfP/SM9hR5x7N+7cvojWqkNhh?=
 =?us-ascii?Q?1T2G87YRljMrxssMH39WTek0je6vKT9QpRK8xPv49hcSOienSmPyLJ0JlID3?=
 =?us-ascii?Q?2srVCayDCGUi7agPX145ZmfzdjkG7l9Hx+4V6drWecM8Wk7g38mSBiZklo/7?=
 =?us-ascii?Q?gw17wDpdVprh/FvwC1/C2XMfNy7M+Zh9CpoXMUpb18qYKmnjxMDxRihp3wX7?=
 =?us-ascii?Q?2+TxCoYoWYAo0EIo8JZ4D4V0I2r9e2PHaSEHGH04GxtaFIZUOEihU6BMbG5/?=
 =?us-ascii?Q?5ZBf4zA3vpX4DsK4ENgORVcHeGQW4ysi1lWY4ZESJ3GECpmNUn7OtD7EWjFS?=
 =?us-ascii?Q?cga5owL7+EaSvHZpJ7pEBDv8aPyw4D/vfZBktdE5En1ATu8mvFhGecoM/4RM?=
 =?us-ascii?Q?d6t6/4k19POVO8XvUjcBXgkr1DQa4AGup67BtrpxpVhPw4WiDvh4u/5FGxMN?=
 =?us-ascii?Q?DZzHTMMOQQcUuXEZmirUvLkUpYlvxIeWerhiaa35khHTwP59jMWTX5F99DgT?=
 =?us-ascii?Q?5XeSGFesGar9wWPloB8LBrlxTQstohJt0+Pm0zQ1+MNLdjuDZ84fFKzqc8WR?=
 =?us-ascii?Q?dObRnwD7BUHdhkPYuEHMSZk+liDY8FQmB+sF19kJeF4Gn37yelW5S1IBBPNt?=
 =?us-ascii?Q?KIwt5krKDmPP1MHaK7hORLha4We91Kp705S6xzt/5CvudgG4+Bxsi0O7DvMH?=
 =?us-ascii?Q?Rv5KMR6ha0PsyP+0UvccJqIs7mWmKAzyKHnpCOJNOVfzNMtcmYn1w3odBYuj?=
 =?us-ascii?Q?stdp6NCsfiuNO8L041Yre3U/6YFufqUXhZRKtesZu9iSRB5DHF6XfNiK9yTg?=
 =?us-ascii?Q?8XVzlVrRMahIAVAltM6r2ygYzazEdX9I5IoQIfN9F/qhebFSxj2DKrFfFsI/?=
 =?us-ascii?Q?lU8NP6gK0iSsk57XalYOjBAweCrjIIP+SvpeKczVaZ5tA4z12iQlPvSPVVEw?=
 =?us-ascii?Q?wk4PpD8+1iHTs5SXy1NsgXSfm1E2OrPanHvgED6SCyDirnkfdJijm4EIXsuE?=
 =?us-ascii?Q?Dx31hvIZSIq/4sz/bxZ38ydRxuo7UYZh38GVGmGYrCVXxkAvUCq56ZTFBFZz?=
 =?us-ascii?Q?oDWv1yyNT6jr3dJXhnSZtOslao+95SFkRWU7FST7rBl+9QrQj8kw58PPBuUN?=
 =?us-ascii?Q?x0JCE14CeI+Pt7WgMULJgincoCrc1u7WhPfVrepAZKOxSInWsGcrJdZe0sNt?=
 =?us-ascii?Q?c1xXLsiQK262ZgHkvjcvPyc7Et8pi7+DNGYA1Cc+Gkox9YncgOF/BpWtg0ir?=
 =?us-ascii?Q?ShuP14MBTB+yLnCDAiNZctVIr0DoV0ZNtf/LsKbo2UAbS8TWr4zNIMS2MV6v?=
 =?us-ascii?Q?TJdxxK3wBTtE2KuoXe8t4SxQlQRfvkEabwucTnXW2yCGVAR8TT5TsGPQOSqx?=
 =?us-ascii?Q?7GH9mDXLDn44Vyp/ryg/S2G+vEUWeDc8HalBBifEdP9AXmHuhJdLwZxWhJM3?=
 =?us-ascii?Q?Cth1zC94s6173EqnlbHzwlCDeiny2BUv+dzLCgi+sdN7UwxAOax42pxIQNLQ?=
 =?us-ascii?Q?vL0FotprpcOACp3UP0ulA90DP2IZ4yrRZNpHTrZUHZOO6wH+rIzJkr4VO51B?=
 =?us-ascii?Q?O4FLbAnKOQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: dO9j253KJ7sdZSEA6gtojkVzQfDP4Y2YwQ1lYLKgop8D6mrhuKWD0eC8CxxFur4XBpIOo49Or/Wn0uz1OD+cg6hCY9azqM2zFmnZmadRWlFg16JYUXRcnygqWBWrkk8gHJHclCxNmGwdrrT4gqAJOvTxJOQmOCL5EbATlg9DUJDVe+/yLC6RnhkYJi+kzhKegLUciMYvUbMrqafLy1ZDV7ZHMNmyk3VyIo98NQAdIW7Nnz8v8jwj7i4/CbVlPFEIDN/J4VfGj+Bl5ojK9pgzCRWZQINdZV98MpPmK+BChBzlZbueL8x0GfXb+a9zt+aMkOAfRuf2oO8I03PwhrxEkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b59e6708-c3ff-4162-c9e0-08df09d0e0b2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:34:43.9063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMw/eLpsC1v4AZqBKBWpIOKeMVHcrQT2kMv6Nk/IR7DzNmFbHaqOcWvLaSgbO/SPLUpMakCTlrPXG2Zc/f2K/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7451
X-OriginatorOrg: intel.com

On Tue, Sep 01, 2026 at 01:42:58PM -0700, Tim Chen wrote:
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 8dff37059faf..84c068f1deec 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -1549,7 +1549,13 @@ static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
>  
>  	pref_llc_queued = (pref_llc == task_llc(p));
>  	rq->nr_llc_running++;
> -	rq->nr_pref_llc_running += pref_llc_queued;

Since the logic in
account_llc_enqueue()/account_llc_dequeue()/
account_llc_delayed()/account_llc_requeue_delayed() are very
similar, can we introduce one helper for them:
static void account_llc_pref_running(struct rq *rq, struct task_struct *p, int delta)
{
       if (p->pref_llc_queued && !p->se.sched_delayed)
               rq->nr_pref_llc_running += delta;
}

> +	/*
> +	 * If the task is being migrated while delay dequeued, keep it out
> +	 * of the runnable-domain nr_pref_llc_running; clear_delayed() ->
> +	 * account_llc_requeue_delayed() re-adds it when it wakes.
> +	 */
> +	if (!p->se.sched_delayed)
> +		rq->nr_pref_llc_running += pref_llc_queued;
>

put after p->pref_llc_queued = pref_llc_queued;
account_llc_pref_running(rq, p, 1)

>  	/*
>  	 * Record whether p is enqueued on its preferred
> @@ -1583,7 +1589,14 @@ static void account_llc_dequeue(struct rq *rq, struct task_struct *p)
>  
>  	rq->nr_llc_running--;
>  	if (p->pref_llc_queued) {
> -		rq->nr_pref_llc_running--;
> +		/*
> +		 * If the task is being finally dequeued while still delayed,
> +		 * set_delayed() already removed it from nr_pref_llc_running;
> +		 * skip here to avoid underflow. Clearing pref_llc_queued also
> +		 * stops the subsequent clear_delayed() from re-adding it.
> +		 */
> +		if (!p->se.sched_delayed)
> +			rq->nr_pref_llc_running--;

account_llc_pref_running(rq, p, -1)

> +static void account_llc_delayed(struct rq *rq, struct task_struct *p)
> +{
> +	if (p->pref_llc_queued)
> +		rq->nr_pref_llc_running--;
> +}
> +
> +/* A delay-dequeued task becoming runnable again rejoins the count. */
> +static void account_llc_requeue_delayed(struct rq *rq, struct task_struct *p)
> +{
> +	if (p->pref_llc_queued)
> +		rq->nr_pref_llc_running++;
> +}
> +

Do not need above anymore.

>  
> +static void account_llc_delayed(struct rq *rq, struct task_struct *p) {}
> +
> +static void account_llc_requeue_delayed(struct rq *rq, struct task_struct *p) {}
> +
>  #endif /* CONFIG_SCHED_CACHE */
>  
>  /*
> @@ -6392,6 +6427,13 @@ static void set_delayed(struct sched_entity *se)
>  	if (!entity_is_task(se))
>  		return;
>  
> +	/*
> +	 * A delayed task is queued but no longer runnable. Drop it from
> +	 * nr_pref_llc_running so that counter keeps runnable semantics and
> +	 * stays comparable with h_nr_runnable in alb_break_llc().
> +	 */
> +	account_llc_delayed(rq_of(cfs_rq_of(se)), task_of(se));
> +

Added before the se->sched_delayed is set:
account_llc_pref_running(rq_of(cfs_rq_of(se)), task_of(se), -1);
se->sched_delayed = 1;

>  	for_each_sched_entity(se) {
>  		struct cfs_rq *cfs_rq = cfs_rq_of(se);
>  
> @@ -6412,6 +6454,13 @@ static void clear_delayed(struct sched_entity *se)
>  	if (!entity_is_task(se))
>  		return;
>  
> +	/*
> +	 * Re-add on wake (requeue_delayed_entity). On the final delayed
> +	 * dequeue, account_llc_dequeue() has already cleared pref_llc_queued,
> +	 * so this correctly does nothing.
> +	 */
> +	account_llc_requeue_delayed(rq_of(cfs_rq_of(se)), task_of(se));
> +

account_llc_pref_running(rq_of(cfs_rq_of(se)), task_of(se), 1);

thanks,
Chenyu
>  	for_each_sched_entity(se) {
>  		struct cfs_rq *cfs_rq = cfs_rq_of(se);
>  
> -- 
> 2.32.0
> 
> 
> 
