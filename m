Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011055.outbound.protection.outlook.com [40.93.194.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C50F3E121A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788901039; cv=fail; b=K7p8d5i6fKjdbwHFXUr8Id3Q9slcAnJvdSH2D7oMfrM1X2SI3c1BPit7yvcIyAzcEQVPj1XbXrUuywPlGIYRuXGtZT+r4jd0UP9y1tTpLbcLI7Wqzd9jvXiG7SPPpszIkyNtprqwQAOXTrPUJcWWFi+FR5wW5PVuTCBkwapO674=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788901039; c=relaxed/simple;
	bh=xLvk58oya2EaxmcG7IEcAfapjCofw7wrmqGsFw7UI3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UYncm1fOCvh4qhJJOL/6HACNhrIamwTyuy8bfJAEyyAp23Lf75aG1HkSKaTDzFXfLmie5T3tnsWNsXeTB6FyA2Dpk4Z16yzb5m95yzHZIP8f1SW5uB5+TrEXjkBo28pbcVVHALryDaRY/Ix/h7vsQhZwDJKpArxEW2hDwyFBtos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K31DZd/t; arc=fail smtp.client-ip=40.93.194.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K31DZd/t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0fiRieJyKScCvObd915wy+IdASGaTLoTssbOpLZBz+fzv7QhAOyes39VyVjjDkK4Zam7CImBKehpcsEQc4p1608+B5j2VnXgh/7hke3MeEN5ZOa7VPtnR57M9cAPO5bBmWG+MKbmc/zvM3KQ/DbDXCWZlsGMqv0hqMp97mKS8CN2KqvF4wF5EQVKeSJEhTr4XpGr91XK785TjZTYKZXfX4dHf9Ytg7RUGOH86weq2RKX0iKZRphBiaC6+fXpuGyc06OycHTq/fjRdr4S75syyZ2Fzrs/TdaZCHke12FSS6Be38rU+DObmh3Ko1Y1zzVEi+F/RZpY7lEAw5rz9EltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKTGBe8We4aCnYd7f9vEi7DijQXZ63HOLIWdsGWsgMQ=;
 b=nABJhQJ8Tj2W3pdzNrc6VxWGUQ6KxemUIazcM0yLLKADXrbLUe1ywCxYWN61uQVAKGhmJIs2Ittf24/iGjNnN9iWdVz95ob8T6laOeB6I0AsNJBePxQ2P6As3/fYsIpBoNJa9FRFgnv9jDHJJC1zHaGUFGpOzkdHwalTq9Cd5wUU6zBFd7rsElOCtVcQki1Q8VOe6j2FygLg6E/2qRm8iYjEiv11k89k5M/YP+5Q/QjeJtnFE4nQEMEETS9V/WDOOnrxoBHW57U1j4NLWlkwmdko1ZRZL7dOKl+SJYmRCj4HDIDEXzJ0ZjgCisTRe6eBF7vpsNHkh4vDGYOfdJIALA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKTGBe8We4aCnYd7f9vEi7DijQXZ63HOLIWdsGWsgMQ=;
 b=K31DZd/twtFswfUr9MpLSdeCODP/RdjFkEcofgSsZa6xKJ/wFQvMq30ewPkMVU5bv7Z4qXlEkmR0OgnUhOogM7P4xDdgMO9m+zoURRkUyNMScTXVHUxsnJyZ7psHEde0Xd6QhoG1IkZpXA7Ei+8KZTvfoGSSB0Zmw5n5pY0eVfe+pFbftH7ircyRZrEL2uRDjXiyNI0qvdBU0n4SEr1d9TjIY38NeouK00jSaSWcMu8mzfmiw5g4Qka4IR919hLYnzPxl2gFxuD8Fim9uJ3/Ann4TpFhJ+U2Uq/QTQTmVD/hfcnrKo8ln7qbyeYWTpn+wjxfyaCl7tCGmqC0zFSCBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 20:57:13 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 20:57:13 +0000
Date: Tue, 8 Sep 2026 22:57:05 +0200
From: Andrea Righi <arighi@nvidia.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
Message-ID: <aqB2oYSzp5xDhfIK@gpd4>
References: <20260908082345.103087-1-arighi@nvidia.com>
 <20260908082345.103087-2-arighi@nvidia.com>
 <ef19ea63-a4bc-407a-bca2-40a2818a3671@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef19ea63-a4bc-407a-bca2-40a2818a3671@amd.com>
X-ClientProxiedBy: MI3PEPF0000753B.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::4cd) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|MN0PR12MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d0ae0fb-7fa7-4f0d-371c-08df0debc22a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|4143699003|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nDrI26ZSY6igk2w8WxSotDeOgOQ4li3UzXcwVd4OaGmxNu2JlnWoFYTUNa3l5GuNPBmR4K0Ix8gI+nY48c1iTl0CpTbzks7xIV0sJlA3yfDQrr5YufA1i1IU6sVRoJHjGjz7rgujiYSDm6R50opwXXsSccjtHcjTYKI9oVu17FyiulAlzXeofA9l/SWGYP27RLGYysILH9STJQg5igHmrDSVvexKiD6P6z6488k8zKXEzvTcnQuRlfP0BTBKDawiQrdutuvSZmtjIPHy8/xv7had4U7IIwYFPpZ8QlZct3mdbUnlt5dIqcA9/r1UUyCpQQaTdneD6Eo9h6DuzfJH+vHRPzjQhmH72Qn79jdSVM1/zMoHyR/luZ87lJskC6ipQPmmxcyl432k/86QUUpeL7ELoZh/OdFZDd5LbzIWKH0L8ZX6IDIrCyg6AbnonKCTWInphEv1r7AY2mzwDOiKrYnuKnoCOzxij2p+4tW883bGHHlAXgV8mOVKM0lPnZoIw0eq/q2H/4B4tX2DsDgr75VA4kBGm81Eyn7YTcA6g9lHaFP0xNTU4TqMUq2pMep70WkdihTD1kdD26LqDBHtzx1ArlsF30mGwpQW0XOXDzUCySmRg7wKZOOM2o+slyakUt1aqQuEJ03IHONR5evS6c63bWnr0Ely22BBHzBDFvU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(4143699003)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hq0JjXdxjUvN3VCaIqREq0h3fBp7VDE/xE4FHQ4byOgkVg8Ywpvs/nQPnUVm?=
 =?us-ascii?Q?AzrcbkKarG1gqj10LA21UQe+dfZHC2/7c+2WBjpf6UUpYHTeik+Pttb8zQzC?=
 =?us-ascii?Q?yPhaiB7ALm+TFGTxk8z+aXmr7xxXGy2+3z+HbMkEZ7zcYc1kVrR1eAqw2auj?=
 =?us-ascii?Q?ZhiomT6FczpJTcflBnGlUNo6MhnhdFY1ArGNpiWySCfpqLtzMqeEnqEcPc1Q?=
 =?us-ascii?Q?P3kxWcXVBP8XRDS/omh5wQWaCb8XOnly+k2LhaAExQx6Cnn6+8woK4cDloXM?=
 =?us-ascii?Q?3fvwNT6RcZgY8Rr5DgXRyJz46eU314SdFtFm9iK3Dbcu7s2jc961tsnqHTfC?=
 =?us-ascii?Q?OLkLpU86PHd3i+87Sh2G1yHVqJWJMhCR0cj9u01PYm6OtlpIobSJ401KZU/6?=
 =?us-ascii?Q?zy+Q/rev9ZoFQbQnVu0FuHvseR8XT92f/ZElI6AXkM/OFjrbtLhSjFoUUgDR?=
 =?us-ascii?Q?ZGepMtbzIljKQe4Gyz1e+8mJqSfenoMw/yL2ZG5wtM44ESrd23K1AysN+/1m?=
 =?us-ascii?Q?kaSvCFb//TkAUzvzVpoH6rmcuMb6YP06MXGl4xS6NBS2kUM85/I+vI31/bZp?=
 =?us-ascii?Q?AknSUkVOeDUBDzgShPPUBG5PK7ue5S252LdRPzJsTCT3ahE0cnxYNYdD9Eh7?=
 =?us-ascii?Q?Y+yjGSfmDJSh11+lalhma3KIF1hAZSoyl376bcYAwbt7L+77VPVewSpWfgYM?=
 =?us-ascii?Q?w+zE2nGfPJ1ihJblsSDmGKMwviDdAx+1yXDGd8Ja+nc1SrJDzMfbyNN+rkAp?=
 =?us-ascii?Q?JtXdB6G/zcvS/AREHh8bqo3panr+Ut9S0PztUyrosDS3hCB02yrKmOrEzTRJ?=
 =?us-ascii?Q?gjc/3+Dhe3ULy+b/GyekNKu4UBdJfza2lQc7X7NV6gfO4SSXCjZEEAKA3+3h?=
 =?us-ascii?Q?fduy1RQx81312bvmPmswjjr4oxUk0y/hYZtCz3fdCl5eyMrkpbIcxPC+A+Eb?=
 =?us-ascii?Q?Tj3w4b7oTF+OiBerYiSr2x6mVjYjfPClErNWpGup+1552Fa9vi7b8beb7ibx?=
 =?us-ascii?Q?QszdWNp4BZeRm1k5xVTLyklP7j53iKiO8ReMEhtAb/BwxwPIQ6VwGtPJ1mCO?=
 =?us-ascii?Q?N2ZJWOJGbcp0auSKvT/BS4tCBn+U2KM3jBwpSt2bPrFRhW/78wiCGMEMpdMx?=
 =?us-ascii?Q?ZU2AlSeCgRqa4vW+bGgP7ukKJQRQHuefD5Xol2MnOUvaOAXnJfnbsoJKMyjB?=
 =?us-ascii?Q?RD+lmgUVeYfqaGxY+DZfsb2k+iKMGOsRLkrK9U0jLkw/WdPk2NbJxBUJVjYz?=
 =?us-ascii?Q?Itc5TDDiD1zFv3UCOXsCpqog+I/VpGBLe1FTQJ06IKvVMTCmN9LtZnxXbduk?=
 =?us-ascii?Q?/sg2aYItPZ3xp8UGgHH9LlyZZjpmsfDF81bgZGJjG7x5S4jg1KYeX4bZVoJI?=
 =?us-ascii?Q?Z4nHgw0gtDP4CfItLL7pGij/iP7tbOK2317H82RB61Jg9oiAYDDji+MPRZNr?=
 =?us-ascii?Q?QWjkdWISEQo1lFStkE7bwnuf+38hrmLq2Gpde5S012W0qq37bZ1nMW9n8EEQ?=
 =?us-ascii?Q?yhFpAU0COqtHEkH3XRlsOB+3sB402g2UpRWKSGxPfogT1drJNGQRgsGpYjX1?=
 =?us-ascii?Q?EIouNGQfJnp3XXkhJPXq9bo/FwHYA4OFVT/DftV4HMAPojVKUKPua2OERcnT?=
 =?us-ascii?Q?v3x1LWXIoRou5fFd0f6ZObesLdFnLUnE049NgdrXYbYZ0RjT4y6B7TCPvYSb?=
 =?us-ascii?Q?7xO+qj13EBnJUu9WDOji1yRbWVgdxjbPVyJ/7VRAyHwhhPTPyUTGMmOSrFg5?=
 =?us-ascii?Q?tfUXQYdEYQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0ae0fb-7fa7-4f0d-371c-08df0debc22a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 20:57:13.7136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7137/Lu8az7mTVqhnLYJgm7nJX3KSGx4hR8+NvTyk349st7PsMSUXSF1XzxqeStB95oqRUd74wc70LZgjzQfKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320

Hi Prateek,

On Wed, Sep 09, 2026 at 01:39:07AM +0530, K Prateek Nayak wrote:
> Hello Andrea,
> 
> On 9/8/2026 1:53 PM, Andrea Righi wrote:
> > NVIDIA Olympus implements spatial SMT with symmetric steady-state PE
> > capacity but two different resource modes. One-Thread Active mode gives
> > one PE the full core, while waking the other PE restores Two-Thread
> > Active mode and partitions decode, issue, cache, TLB, and vector
> > resources. Returning to full-resource mode requires the sibling to
> > remain in WFI for 10 Ki cycles.
> > 
> > Measurements show that pinned workloads perform equally on either PE,
> > but freely migratable workloads lose substantial throughput when they
> > alternate between PE identities. Consistently selecting PE0 keeps PE1
> > idle, avoids repeated SMT repartitioning, and restores
> > one-thread-per-core performance.
> > 
> > Describe this scheduling preference with SD_ASYM_PACKING and give PE0,
> > identified by MPIDR_EL1.Aff0, the higher arch_asym_cpu_priority(). This
> > is independent of SD_ASYM_CPUCAPACITY: SMT siblings retain equal
> > capacity, while physical cores with different maximum frequencies are
> > handled by a higher scheduling domain.
> > 
> > Firmware currently provides no interface for describing the preferred
> > SMT sibling. Detect Olympus by MIDR until such an interface is
> > available.
> > 
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> 
> Feel free to include:
> 
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> 
> Just one nit below ...
> > +/*
> > + * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
> > + * two-thread active mode, with resources partitioned between the PEs.
> > + *
> > + * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
> > + * mode. Firmware does not currently describe this preference, so detect
> > + * Olympus by MIDR until a firmware interface is available.
> > + */
> > +static bool olympus_prefer_pe0 __ro_after_init;
> 
> nit. What is the purpose of "olympus_prefer_pe0"?
> 
> > +
> > +#ifdef CONFIG_SCHED_SMT
> > +static int arm64_smt_flags(void)
> > +{
> > +	int flags = cpu_smt_flags();
> > +
> > +	if (olympus_prefer_pe0)
> > +		flags |= SD_ASYM_PACKING;
> 
> If this flag function is being used, olympus_prefer_pe0 is always true,
> and the scheduler will never call into arch_asym_cpu_priority() without
> SD_ASYM_PACKING being set so olympus_prefer_pe0 is always true there
> too.
> 
> Seems redundant unless you were planning to do set_sched_topology()
> unconditionally for whole of arm64.

Right, there's no plan to install this topology unconditionally.

Since arm64_asym_smt_topology is installed only after detecting an Olympus
system with SMT, the boolean doesn't provide any additional state and can be
removed. I'll do that in the next version.

Thanks!
-Andrea
