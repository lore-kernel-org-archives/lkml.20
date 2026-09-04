Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE263B7771
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537966; cv=fail; b=lHHjnL0pNmIwg7gxs21r5JtCrn0o1Mjy15EqW0ZfiHU2SNS/X+gfuRdkpeIw8df46PuBQOG3yiHfeyXblBdJPyvqVi5j6+KH1RK1DzUAfQOYbUV93vSQExmrMWZ0xIH3gpm0dzMp+sVTY4E1RT34UcYVHhZqUBXIIjBPZrkQGBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537966; c=relaxed/simple;
	bh=HdWHDevmIrJV9SxrXE30BjGtBNT1r5JocFz9zSfNm70=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KSRwu39a7Vksrb7A7X/d8U3lEBWrm5Z+FqbpxU7J97Ehexn28lTl2a1Rms9LeiJ6h4XTndRkBiaWgV+HicqM8nREHjqRRGq9OVs6egWOvVaGiCNu7Pw/kYTxH5FuvmLagk9RlcioxWOa9Iy3DU9vNHdXTx4v38ViUGAy7bZb1Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGtMS3XS; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGtMS3XS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788537964; x=1820073964;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=HdWHDevmIrJV9SxrXE30BjGtBNT1r5JocFz9zSfNm70=;
  b=WGtMS3XSJb1X4pgja77Gfs+UT7imvHC5I+5kH/WHk2o9rjv20dTzBG3r
   rgFBmN7Zoxvs+9c55qQwBPJY4ZtWx+HYx9+enMvLl2QV7pIFle+wG5Hcn
   8Y7Mg98LIOPsExQJ7BEqEfLaBIo3B4aaf3WmvqbPezVgMO/xHtnquE0q+
   Mzhse5HNFCpjt8K2aYdc549lT4A77D2kHDjApeDIkePDMfFF8cSxhj30a
   20N8CPZ8X3vJ4C/VPZPI+/GucnWULYU9O9y7srY7DI+KMqBRxzvVog6ok
   7FxFCdZerjV0+rytw0ttlisL5Qkqxr3V++uQ26HO4sBIORJlBQKnFbz5e
   g==;
X-CSE-ConnectionGUID: FxyblC8OT4ui+hwfjkhNAA==
X-CSE-MsgGUID: ooWNd6dnTvmBKHAYNo4b0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92861234"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="92861234"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 09:06:03 -0700
X-CSE-ConnectionGUID: oRNH2lfATjWooDKV9IY+Rg==
X-CSE-MsgGUID: 1ij20ouISLC97KgetUwQFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="294958724"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 09:06:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 09:06:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 09:06:01 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 09:06:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9pA51QoCe2mdddjyCRXpxbJe0mbk6Y7BiHjaoqpHQoxSd31/VfZubTJI7GR8xy4WUhe1eMEUTRDAXHstZWa5DOu0jQ1fshEohFJ/LpJLcGAm+frxzS2y+J+UfaE6EDZW3by8NqvOiDX2ES01dFWf7e+u4XxZEeX6ZbavyMjKBbBTEVNx4KbkJCxjf+3HGkudzCH04OkJkEawZwvGhAfCOBVpKlXLIAJwLoyWsFYp7GSP+22RLEH4n7QkUCUq48DLcKatSOoY1zGeUgQxdLBuFl0lPgIsAikYCktrHEmp2tsvFlZKSJ+Lre4c66JjUfnny5KF0KQcmrGtKso0G9e3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eh66GLNj8q03SvSq9brpYO8uzFBdaSEM5/r2/84usbY=;
 b=Zt12N+xSxA9eAIodXuF/Zb4Zxv8sCU6Z562vXt12iHPNmZl9PFUvVZnp00hoEna5ADKPS9lLIrYawGUjeE9nLJVP5aqaW4vVr7/8ZXPacWvoCzix6sls6rYqlWkj3IZNWirId4sV5YVxlLra7/rEhVe1h5Usoj3NFYd0EnpYuYUWV9le1aBdpsfvvclW/1enuMXa9JETe7JaGDuYJosrnzTz0UQJoPUKT/yLLPVNInJndDBIRHeE0uMtNfhwGJi/jsC3EifdMXlUnbrGIbHWrR+MHEnzcpB6wcvQkh3WtvldUeRF0Ge6B90ohEwesQypFj9yBhDKRi6i8LWkL0LgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA1PR11MB8255.namprd11.prod.outlook.com (2603:10b6:806:252::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 16:05:51 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 16:05:51 +0000
Date: Fri, 4 Sep 2026 23:52:22 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Hui Su <sh_def@163.com>
CC: <peterz@infradead.org>, <mingo@redhat.com>, <tim.c.chen@linux.intel.com>,
	<kprateek.nayak@amd.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <connoro@google.com>, <jstultz@google.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] sched/numa: Drive NUMA task tick from execution
 context
Message-ID: <aprpNg3a6fAm8Wdc@fengwei-dev>
References: <20260904085244.799276-1-sh_def@163.com>
 <20260904085244.799276-2-sh_def@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260904085244.799276-2-sh_def@163.com>
X-ClientProxiedBy: KU0P306CA0077.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:2b::6) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA1PR11MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: cde8fd18-4ce9-4721-0fc0-08df0a9e6436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|6133799003|56012099006|10067099003|5023799004|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: yWFgd6XRhGNxgY1NVDLikdS1qKDE6n4+Ci0z+JDXpxkVyUwoe0SUaieFTWsTJmBiFa+OdymNTBWnWJw9vJ2s929DIhLW2bHcozss+MGRrz7ePm2jrlzvHI9dv3lR1/vB4B7C6RYiJvcKqGIKJMe0jAmqsVHDYyovHIBxs9LQycx9WvBOTl5Y7dFq1lHiKnXV3Qmf6RaTjhZlydgE+uKUtc6fCmwYx55jFR7MX9PwTZxwF2aFQ7GIfqVvYbKN9rARSjlwt+WfdXATmDhdQiT3c+ChNt30Yp6E4lotwLMWi1/2yO86ewKRRPK8s0Oz6Ur95yF0k2Oo4jbvvO/KUbK7e6xatM5OLbo5VZgkeuYc8wkoojqvfaiByvWdEY0+KYNvsqDhVXDj6+7k9y5ujoeff1weGbU9CRcX5XT0AgNMxT74mAPT6bEfjwuwSlj8xE/FZraySS57aHYVWALSFCZRKuYpDUhz1Cox5RKe1XfVY9c2AuBYQjHmGayURPqZIRk9GjvFzIGG+x98mA3t3ZvXw3RzfFebFcjQXWLRwMHwktEg8uI8kg5ntAAuBGzrHs6wToerivawhPTTzorrtXHBaE3tM+eV6kt2ShSbly6YGjNTtsLm+PJLVY3e1zrhPWRGfwjAoHarqU9Ss8ZHEn1XxRG4Q+5HEMtlS/9SpeJD5As=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(6133799003)(56012099006)(10067099003)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d8x38h0P9gJQjOP/O5uG2TY4Zb46dQL7bKBE2ih+ggQVNqsXZD32N/jWmRsR?=
 =?us-ascii?Q?kIgADNk7JM8x2u6jbfB8/YAoUwpBPjjXnkSViD8HYaumyQt039+y4XFdxiUw?=
 =?us-ascii?Q?t/LJjkpJNE+voM9nnxFX5zhF9olyX/cXxTOeieDELDMDKGWmlqZutaIAKL3M?=
 =?us-ascii?Q?nnK+PnZh6T1D1JY+SPctqO4RpmDorwC7lxFxqPbJeQYXdzEE54kv1rEv4Sz4?=
 =?us-ascii?Q?pyyN5i5JtJtuPyef0y4/zo9GkJINC/IIHuncBldOMHDrqRfFcVJmPFrXAZq6?=
 =?us-ascii?Q?H0FPPp2WOWnt/zPO8+B615RJY4JhiW0gyn9YGXM8Wd7+xCMH/5C4YfW6BWes?=
 =?us-ascii?Q?vwnJypoI0GoA6h5h708ozVCmxeIPSSEDY2qvJbS5Gl8Ts0gHOgvhkmYBCVmt?=
 =?us-ascii?Q?a9TBDEV8vzvtnZwVkTpj6PtHnNLTAOSc/5grwszNezTpKNR6DAMu0H2Zw3Qp?=
 =?us-ascii?Q?KsCDv+Duk5KvQLR67ODrHuuIWVC24Qgr5gyROxPzoBlhJQqXUFOTXqQjmAQE?=
 =?us-ascii?Q?wFXIS5pwmJtQ/03L+gq3REDdNGciK2Qlj4yDNynoKSmSIfKXxzZs8PdhLMDG?=
 =?us-ascii?Q?blDb313+fAkGeS1DzELL7jVxVktlYXPdp8IEJyirU2X5dzt1KKXxMmY0tBSH?=
 =?us-ascii?Q?1+e90xuOS6d/YKB/gBmYrNohnCuop9U7LBRmNdCZvAjwUvlBXTFKKJtL/PY3?=
 =?us-ascii?Q?EkKYrPDXdJ54ryWJNm7i5g7+lofmOAYDbaRDw0khiJMyoQXjC9oLUfeJXNxE?=
 =?us-ascii?Q?45UGRwv/2LLh+CQGz++s/yVr9bJGc34UToPyCP5b1qdGqfaLk3lrzN2owrG9?=
 =?us-ascii?Q?WHM5QqV0FLAPA0+IrlhHwJqhufO0vL7zHWKtko9ZVktR0GizxLCajR2wUw3a?=
 =?us-ascii?Q?5juS9kUpG0f7mkOxqGNeZ5lNxVP+Wf3U1egObcYvqLddg8Xt+iFNgvuwkRXC?=
 =?us-ascii?Q?vP9K8h8VXVF75kAdoJaQ1PsEe0p4XXAkNvdYM/lo23k/bNA4YOE6tFjIaLNB?=
 =?us-ascii?Q?duYx/wNOpfKydeTV9HAHleFV+S7yQ186PmSC+vcO4jI4DUBKwIx6EfCtx8So?=
 =?us-ascii?Q?Rs0BtqX+mlal4+KAeHpGDe48Ewh9NOTvwajX3+fAWMfxZVqKf2CRamPHJ2V1?=
 =?us-ascii?Q?JPvCdr3Ssj5z8shiv0gpmuqZVfV/tb6nWnEC10/hwwFbIXWDzdtWL5TWsNhl?=
 =?us-ascii?Q?UhskWxWcyOypSGd1Z6JbqnyW0W/mB49WSG9uVsv3d2s7ozhcIbXZv6Pcbr7R?=
 =?us-ascii?Q?SMzYwEQhIGF7snjrZv62Edoa8bjUXUL2cpdn+t+n7KBoV3XY1fiMk4sbWbha?=
 =?us-ascii?Q?/y5YFrS7rQHc9MFrxeeIHVt/woOS+3fJCWeMB2is4ZY+8icDNwzj/qggWQd2?=
 =?us-ascii?Q?7iIfAw0FFX6hlPG4/KTuP926fOf4rx0IjRpiVuFnBa7mE42I5M62zVM+u+PQ?=
 =?us-ascii?Q?Z78qmL4lnMsCl6ji/bIjLHMPjR0PflDllO/b+tbBd6f7om3Qb7gZQQ/eo+dx?=
 =?us-ascii?Q?BKKL7eF5rPj8fDXaIKspMRQy0OTIus5UhSlTY124XPJJ6thWoGP5swa9KN9D?=
 =?us-ascii?Q?luJY7BQBgTkFUo0/OeAJxm+ZdKVQYA4R1Ra3oLT45Ji4oFKQof1GTaD61s84?=
 =?us-ascii?Q?Azu2Z1KubTh7uIoZLKhNrZEEkpWzv3wpuChhpydmk5CyhUK9XWNXCSLIepSi?=
 =?us-ascii?Q?jRqAwCyyAzGbLylw0kCmIXPUILVOgsxsGlZpLEiiy/y+O17XOlOPiGoA9hwV?=
 =?us-ascii?Q?TSgdbgZhVg=3D=3D?=
X-Exchange-RoutingPolicyChecked: G4Af10yeiX5pqsPO11966Ik7QxFV/1er99XuanVs3CvNPYkP9ndvJUxY9+nfEZL6IkWAxTiep/b2/ylX8xv9GqYXQgjNxs2F07rVZWU1FFWaqFgIXupyHItth+yFse2t86UV2HoqJlMslrOmrcoCMLWBYECUVbWWjdKtKjXmPGBne5wdFhfGXkSl4NGzQ7DIUgLQtuDWSQ5Lv5nyqSCXNiXiojUZF3zbMJMGUljDQBFhu9Us8flmu76CanidQvC8PmpYUYD6GXZRci/An1LM+D3iYSyLwydCZ+XeIucNOV7GRwItBVa7urAWD+OKeJYF8uKkelpxO/zdXkHrO4eB4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: cde8fd18-4ce9-4721-0fc0-08df0a9e6436
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 16:05:51.4987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfiWug4LL+slVRZIIhr9yAKI2QFa5TNbQ2yRP8kukqWzU8kkM6qIrCupqMy0gVgqITV5I0PhDdGwbnSU0vS6VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8255
X-OriginatorOrg: intel.com

On Fri, Sep 04, 2026 at 04:52:43PM +0800, Hui Su wrote:
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

Both patches look good to me, let me launch a test and verify it works
as expected and report back later.

thanks,
Chenyu
