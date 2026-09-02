Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E39388361
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 05:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788327595; cv=fail; b=YC9m6lI+VPQ0VLCiE5j1WqNP0xUxgUXaCtix+/rF1tUxaf1W7pKNb7rB2qUtJYzjtrsXwmaSAReiCiy4ZxLEbNEZrzgTWjfxyGgVdVMgHDYPdaOp8l32StUrBR+A1UNP7SP8+340dUEwHXPuXLthTzQCTDdlN0idXFWz9ukFmOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788327595; c=relaxed/simple;
	bh=R91rt7JeHWnIeN+AJfDp4SM7Qg9xOG6KuHRt3M1+6Sg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VEfUzRdr7HM1WjrJDltkN/7dAmRricHnjiyPMi5InHnVhf525QuxJsPTmwZY4gpMRE7vOwKIIV5zz/IAbFfqRxGf+0RG7H9R/fjpywM43TvnMR9tXBvPHrCEg9FKSNP/HCBuRlGRdZXjbKaTXF+HbUlsY8/Sc9YBMVk2yptXv2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mD5nXsNA; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mD5nXsNA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788327594; x=1819863594;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=R91rt7JeHWnIeN+AJfDp4SM7Qg9xOG6KuHRt3M1+6Sg=;
  b=mD5nXsNAQQ9nPJ5amX2jAmuS4sqho+gIhdh1XuG/pXffIw4lG+Op1OMV
   pCYe8YYUh8RnBynlyfIfBdb2HpZgrjjL28XzyVsRLF1qpeb6CYnYvVLs+
   AzKtwWjPIDUB5tSRk1WqibylQcO9HBfpYxxxkt/DfrfPMCzfpEFkh2a35
   KYZwEObhr1mV4pF9knTD1X+cqO3O/fmJYnBh7ZdTPRfvHEftEMypL0DSe
   H/Afcpyyk8/Yg9MmgXgeNXFLRl6VvPaYFcO66/2bkCHL5HI8cyqqVlqL2
   b9YQjlmStAgZWpc44I1gEQYlzb78yUQaF0qbSoIsGUt4fiZkmZ3Xv7XdM
   A==;
X-CSE-ConnectionGUID: VMMCIM2lQBGnOdIAGpolcg==
X-CSE-MsgGUID: wIIP887nR2O8l9aiX306wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88802849"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88802849"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 22:39:53 -0700
X-CSE-ConnectionGUID: GpjljHnbQROC+masik6YZg==
X-CSE-MsgGUID: SSqVZYqaTEysnGT5FJhdCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="266064369"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 22:39:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 22:39:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 22:39:52 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 22:39:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDS8nj+RtzRJVXm5QmLuzwUBnwuZ3Ggm0p597H1fkyvySrQ3+SiEp0FQ1265dO+Jgu+ftAYm1zSTd3meeDhJjFfMzOId9/D1BxpW0UZijvInfEOMK8EXImvN/swaocoUBxgkrmISWMvnvm2JyHQGstNkH9a0kSCwwH17JBaCy1nLez3ue2jbLeBB+gNA7DNcNtuZOrfTMyA9rhu+3QzzL+ouXNLv6nlhfjRSB4RtoO4UN33FRXziSmRlhbh7o/sJHjGPM69hzWNkkMIDut8KsWMINpNrCONhSCXwUClDULwzc5tzNX5kSwopZ8H96ZwhYYQQq37+cfBJVP2FfkYzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRSWMaXKzo7JdFN3AN3zVY+O4oAWkniuQvNe/p+u2FQ=;
 b=QbMTun0SOzQqAecAx3iX7AZiL4BFTgOszibWTsoqJ1g3BXnwj7AVXy9cc1dKOmzWnwPpGbV6Ib1sYpPnbaoX9IDio5OzdE65R/p2d1bPdrA/gwh3/OSPcX7hTaOrhqwnPA8QJk06ytAjR1JYxuc5s3yFHYZyRyy0LL5pUM+TRATf/XVPa8fdPNaMgvz4YI/8IEbngpMWIKmO7QXFgrIclOcetLomY8tgyrxHzwaUmeOsjrdV83GaHxvc/04wrdl3oUeZeEaZdagm1EQ8Fzo7hPRPxUyc4RvePl3xlKGEqv67XHPIWCi8rTCLW1+W5i+uA82r/39KTfcG8yCBwuez5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 CHAPR11MB9632.namprd11.prod.outlook.com (2603:10b6:610:301::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 05:39:43 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 05:39:41 +0000
Date: Wed, 2 Sep 2026 13:26:10 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <mingo@kernel.org>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<tj@kernel.org>, <linux-kernel@vger.kernel.org>, <chen.yu@linux.dev>,
	<tim.c.chen@linux.intel.com>
Subject: Re: [PATCH 4/4] sched/fair: Rework/fix task_h_load()
Message-ID: <apezcsScwu5hdNrr@fengwei-dev>
References: <20260828074059.232353141@infradead.org>
 <20260828075558.660152190@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260828075558.660152190@infradead.org>
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|CHAPR11MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: 17de1995-353b-4f05-719c-08df08b495fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|6133799003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gax8QNFxZWvQ1jwCnHF6qB5LxmqcYjLk4RWTP6qjPOAPEIC79N06yvl4/rdx/cs/sLNeGGAjkKRtCL7wHdqRTYtx7MGh2dVCf8YsH6xuqXKk5YuUNmFpQwlaeMxdh0EsLwg2bsJskLn4QKRPFgtEjE02XkiO1jdbXQfnyxQgWQVj6Co68DpmXUosnPI+OLCNSX5ka1jRjmUoGNFF5yTEBbZyht7zdkfq6Tk9ePuhcLodCU4l1eOv650UFwuzYCqx+9HGVTYFWLCfML9liltCN3lvBvhOz+ie7o1LRVTqHFDmrsA8dmaVciwMD7t76uQM8ZEfbg9yDZsCLiT9Mnz8kbbu6bz9izJaYQ2WfMdqHYTBvLojRdVYPN4hisEic95c7UNUztJJHnnXXqPqiQmHiPwnGRkvhN0ZIEFAmEo6N4mjZ3I6SrIlY0rOf87uGnlMyGhMMVhx6K+VHASLMrTmD2FvFkMxWygwQ5dD2xH9E6QzIiyYajgAn/Q94G/Yz65HoqaztoamiVCwcmBPD0R0hB+69PS+qnjPk2Bai00O63ROcak5+TOBV8N//7DptH+75ylrUfwMo00SDwKZy4W1D1EB4LWZ4rQ+SUhKyvj6CV0Kc7WavY7qaMArDcHawHEEUVG/aKN827wm3dqtaPury5IYLAgpk8EZMgnVfXW8780=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GaGX2Tk0hX1UYv7ZiEzew6Ou0X1xqY7N/+nTccFmuZxSl8fZEwR6SxsBlk4H?=
 =?us-ascii?Q?tYFE+sraH9W2DDIoBl0Cmuog331g3Md5Kn6hOX0C5qc2ahWILoGhTsy8q3wZ?=
 =?us-ascii?Q?bqEyes0bO1g0RLT1Trn+iqcs1fY9kEcFaNiNJQ4LJvT4XoJFNAMLgtTtmLSl?=
 =?us-ascii?Q?wNdgx0ymnSe5CyVX32jQ5y1rOlLaZt45aXIwyP48AH8wTGI5OlHAgJlgdvxW?=
 =?us-ascii?Q?/6Ow9tpV58hLt3zBuZHcjfWIHk3DAABTVVB91cqNoKo10rP4lIAMEXZ/aMEe?=
 =?us-ascii?Q?xgmbEr+BxzllZMIO1ewpaj70rcabf87zz8zv2zy9GeePp8o5vkYS3XV9TdzL?=
 =?us-ascii?Q?YWE4Gz7eka0XqdkQCLEqJf4wMP7wGbrb7jIklMc5L5x8krKNuDq1JnEFWwoZ?=
 =?us-ascii?Q?W95bMwkifW+OgMNMTHVdRqqbIvE1hxaenrv0pB/4zjAPYC0qvsMteS4oUfAj?=
 =?us-ascii?Q?waY9FBhM6lBFiRls44/TWj10YQ0CBq30B6EnZMflZGJ2INDIgZbHjC24Z1kO?=
 =?us-ascii?Q?X7Wu/3/0WpJJisp/Yf2KVFcD1sFB3oDcix+jFWLMNqUYLK38uUgUuCJpr1fc?=
 =?us-ascii?Q?0C3HjKtn3uH6bKOrYhWtzbsUDLVjvqVbKHI3OmXZPArhT8+Zeswfl0vRusn8?=
 =?us-ascii?Q?d2769ROFhrVTNdaW+vJIVOehyfowQ5EkCgzY23PRtun0YWArdANBCHA48dc8?=
 =?us-ascii?Q?cKiua0sZADqXgPdSU50MYjED4ef3OCbmzOBTOATjpIcm/1jOt9XCrheaBzyM?=
 =?us-ascii?Q?ztiWSYFOkjpqMPUYZv/cbUtlEEyQoBRNA4pU47ZP5dqglhEnDHAaXJaQ4scP?=
 =?us-ascii?Q?fW7vEJkkdTgfkRejskhhEYgHIH6xYLAEUJgkWRaGcrVm7r+dns3ImVKNLOul?=
 =?us-ascii?Q?vYSV7CLn337TtQHh80oxelJE4prnA+DaEYr2iMz+HwIZOH7Aq0hJbSyOj6MM?=
 =?us-ascii?Q?JU6EdR5XhROsUZWDjLJTgZEVakFHEO70HbmNEPVBeZyaupZTXqE9XF9nEtWm?=
 =?us-ascii?Q?YTjffbiP+lnqXz2P/MWuco/3+nbBHPYdZiyPQ39xvdI6pdB1Ml/yyQb493kl?=
 =?us-ascii?Q?x9MNCPXgZw0URtpwGLp8T72n3C1Vpvw/19Z77Kpq+1Wi9eryCMPUGPqkEX1T?=
 =?us-ascii?Q?YLbj1KHmhmt5Pz5UDsIakgJDPB/mFkx3L3JKQbopxcfZ7Hbh/jSdItdMmFyx?=
 =?us-ascii?Q?eiffuusrOBVaqxdUaBDnJpTndmboeGWhTyoHiTvRKU+4H/ujtCgTHO+ClLEh?=
 =?us-ascii?Q?XOsC1qYEGmFmIop6rYN6QR6jC4w4MYaTOop6zIBTvNqa481EgMI9HoYfBZvK?=
 =?us-ascii?Q?SQiySBzOHat9858qnhL2q2UcWvYEXEUTVzxldOfBRMbzQ+DJciIGW3RDViCw?=
 =?us-ascii?Q?cMk8Hu7Dzn0AAkzLtK1KFd2HS+LTZYGv7ccU6FvBicGqdyZqnZNdKvqkskuH?=
 =?us-ascii?Q?f1rlJcrYoBBO80kzYFFHyeU1uafE7vNB0JQjbMVfJzaFcvgpaPsL8AD2FBUK?=
 =?us-ascii?Q?df0StJoa8QW0t5eaGulQh9OqY3ItlMTfjdCidjKyGeDBlFN3Bf7bY8mTv8o2?=
 =?us-ascii?Q?no4C6VkVeeI1LZIFRwLmTOhg94XIxPykKrK0Ur1auKunesOAnvEvF5JqCSoJ?=
 =?us-ascii?Q?mW6BOtyLHN0I2C01C7L9YwDE5Vr8T2rRLddwo4aayiLZ/CJtkOteQTCPFc4C?=
 =?us-ascii?Q?49MHpFKB0UUA7oUsy4fp5sf5mQynBal9nrOoYNDyneBw6Hqju5dzmE+vcrPI?=
 =?us-ascii?Q?FvHZGnSUEA=3D=3D?=
X-Exchange-RoutingPolicyChecked: W7zAywtPTP96GRyXblC9ZMMeyodnJdROxvf3l/DWn8ShgxpI73I3HI2FxIH8wDF6mdTqn+2Fy3jr8C6M58FGNAs/eCwhC/bCsaWsr9luclc7whSFG13jgI6FVD44z1bVambpQiB6v0hqExZQlIyrz/Qh854bGolLyxysKmug+tFIrWh0AA5mviJaFeTEclER0OFk0r5mHKScxFTm6vSVYwEW677Fb0Y3iag/B0toREGowiZ/5R0x3T74dcNaO9k8iQCSoUbehoUKIuWBd3nOuqTV81HfCeZ0N4/8/UzRMau8N58l73alHSLRY7SlxRG1nScAYuLB5vDxkZOMwI24VQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 17de1995-353b-4f05-719c-08df08b495fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 05:39:41.4855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FdqNwCgtggVRJeKuodl4gMI11iMb4mK66SQLqBfFI0iJ6QkyMSvCYG5Twnk1Q1hr6Fo6/XaRPJ5tDpk8sjCjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR11MB9632
X-OriginatorOrg: intel.com

On Fri, Aug 28, 2026 at 09:41:03AM +0200, Peter Zijlstra wrote:

[ ... ]

> @@ -15230,6 +15255,9 @@ static void set_next_task_fair(struct rq
>  			weight = __calc_prop_weight(cfs_rq, se, weight);
>  	}
>  
> +	for_each_sched_entity_bl(se, cfs_rq)
> +		update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> +

It panics during bootup on a 192 Cores system,
[    9.445362][ T1687] Oops: general protection fault, kernel NULL pointer dereference 0x69: 0000 [#1] SMP NOPTI
[   18.987940][ T1687] CPU: 58 UID: 0 PID: 1687 Comm: systemd-udevd Not tainted 7.3.0-rc1-flat-hload+ #9 PREEMPTLAZY 
[   19.022374][ T1687] RIP: 0010:pick_task_fair+0x43/0xd0
[   19.175316][ T1687]  <TASK>
[   19.181239][ T1687]  __pick_next_task+0x49/0x1b0
[   19.189229][ T1687]  __schedule+0x14b/0x6b0
[   19.196711][ T1687]  preempt_schedule+0x3a/0x60
[   19.204543][ T1687]  preempt_schedule_thunk+0x16/0x40
[   19.212931][ T1687]  _raw_spin_unlock_irqrestore+0x2b/0x30
[   19.221833][ T1687]  autogroup_move_group+0xc5/0x160
[   19.230124][ T1687]  sched_autogroup_create_attach+0xa7/0x180
[   19.239280][ T1687]  ksys_setsid+0x12c/0x170
[   19.246753][ T1687]  __do_sys_setsid+0xe/0x20
[   19.254292][ T1687]  do_syscall_64+0xbc/0x470
[   19.307858][ T1687]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   19.316405][ T1687] RIP: 0033:0x7f347bfbcb9b

It seems that the crash is a read of se->sched_delayed on a NULL se inside
pick_next_entity(), so pick_eevdf() return NULL

After the following top->down backlink traverse,
for_each_sched_entity_bl(se, cfs_rq)
    update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);

cfs_rq is not the root->cfs_rq anymore, but a middle cfs_rq(autogroup
in above example). Meanwhile rq->cfs.curr remains NULL because the
rq->cfs.curr has been dequeued if the task is runnable and queued:
if (on_rq)
	__dequeue_entity(cfs_rq, se)

se = &p->se;
cfs_rq->curr = se; /*wrong cfs_rq*/

Then later _raw_spin_unlock_irqrestore triggers the scheduling
it picks from rq->cfs_rq.curr with a NULL tree.

Maybe we need to restore the rq->cfs_rq after the
for_each_sched_entity_bl()?
se = &p->se;
cfs_rq = &rq->cfs; <--
cfs_rq->curr = se;

thanks,
Chenyu
