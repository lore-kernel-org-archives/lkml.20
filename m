Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010031.outbound.protection.outlook.com [52.101.193.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2661A1DA62E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967113; cv=fail; b=iswlKAaN1euy1iTSFXOqRobFMPgQzPFDmTJjBRx6fQoFQOc8K70pFOOdr3U9EFCdHT/iZqXh7oUpwze1kycmFmbhjvP7nIlqmaut97m6nlKxp3kIzWlGmFFVRU/anoSN5ShJOyvJJAT4GtXVdmtpwjR+Cx8NP/Xg3Lo03J5cUxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967113; c=relaxed/simple;
	bh=KRAT58V2Bm1YiUjfjXsmeNpAWTj5Uy0bEaFPgeN5++8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jpEiY17Uw89VgrpW10fTt0BRgDs2ykHdB3aQMCvKLYjg8cv3zD41rHz7EQBcoG+3D4Roi5RsvNziw6VwJqpLC7cevHG+rzMaflAw1u2ll2FpTtirgNuVbm7XFoneDNxEbEvrFf42jzxYTJTuRAC2PHifZ3TRwKgZnjeVj4UxTZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rY1LcoHs; arc=fail smtp.client-ip=52.101.193.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rY1LcoHs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGYHk5ft9qw4Sw+JsLqHQ/A20U2s99KK4kQoeQp7pHOEO9BanilclUmEyjScBHHQumknAoW2TI0wNfWA5gCERQOBTJQrnlfUr4Rbmkwx2a66U4bm+BHTO4txnrIRm22kJVG81MzO3bRtVFeLU1/o+e5FQgFl6YccDVSdJge7xy5PWdQrt5AqwlwY0mFFUlt1JYPMq99p/XO+VIEivfA+uqp4gqMpIgMEVUe64gbOL+z6q84F4QED6fCohssBog6rP6XHrzneYZoXScSGJYfZnSt4UmgF0KJuHDStBBL1z1pwVNrakOXAPzxT15+TJJZA84O2W0kpIIGmxdUCZSJhVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xz/qfuBQwnXagC8dmsMobwxOhB4IALWgWAYZ5rBUB3M=;
 b=FI8JrbSvHCfcOpS+/gYK4Y3TdDfAycpDZunmc8FL81FsRFYCCb9STSQIcvpMpiYor9wIPlqd2Ekjl/FM1LBSzUjT8A1wH+LfX8ZiotxfSbyI4zVzola8//+TjS03G3DAShR8JYZURaySybx7DVlkihh9z0KU4JUCgCDhpFqzfLhMTO/adyNh/G6iKqnDpSvKSXQlCtfTpilsjAWTfBMhG5S7cBrQ0S8yIBhIBs1YE2Wudz5Dz4jFQ+o2OaPkXl6gsIJvRdYNUVt1/CU4A3TcSzmofMaztylxQ7NL5vdezOh1Yfp+3+4sRexjJ6PT2InaD0fDZPqwEHpwzPfd/T04Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz/qfuBQwnXagC8dmsMobwxOhB4IALWgWAYZ5rBUB3M=;
 b=rY1LcoHss1GNwQPVlH7rlKdTrTyKgw926ITx9/o1Z2sMxCf67C37JhrTpbU3z3dLdI0lrpgIgYfmozvZi/K7jw7YFkZ0PBa6u7j6FLiAk6X0u84YP0rqP8E6PAf0Bv4FrkjP8NQgEgVtv4DvunvAOnrpFKdCDvxLosxtLv9W5ZJwG3GnEC1yvQqWgrEDvXNvrWeV02c9hMPexmGsfP70TEB3PjVT03VLcw7lw2T2+GC4Dvlk6csXxke4Qw55E3jn6GFDALL51lp5p2CdtxGo/Y2gUrqwXeMOisNEvQOd0S890NvwmXafN9AF4Z91jE6uCODbb8wFexNWHD5rhUp3QQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by PH0PR12MB5677.namprd12.prod.outlook.com (2603:10b6:510:14d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 9 Sep
 2026 15:18:20 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 15:18:20 +0000
Date: Wed, 9 Sep 2026 17:18:10 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
Message-ID: <aqF4sqhjpYjIPgQF@gpd4>
References: <20260908082345.103087-1-arighi@nvidia.com>
 <20260908082345.103087-3-arighi@nvidia.com>
 <CAKfTPtAQh6ZndkHC+njYvX0hoDafaC+PX2EBfafDumTHvvgFcg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtAQh6ZndkHC+njYvX0hoDafaC+PX2EBfafDumTHvvgFcg@mail.gmail.com>
X-ClientProxiedBy: MI1P293CA0028.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::20) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|PH0PR12MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: f9bb1e12-2705-47ad-653a-08df0e8594ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LnF6BoUb4+36J5q5vFd0JCFe+0a9Wn66T8tP8CS6bSWORfjiPdOgdBxiHKthJZGd8fZQm00+lyCoX50ODL05qqZuy2wgrrVnr4tlEnHO0xdVQYin9kzV/SnuBT38K7vSmG4SO0qzE9BuY+m1BmoPOiTLnWCWDxHeGvTyShlL9Em3x/tyT84ga6PrQPAb+30UeSCsRWEUg1sCtG7gE279C+7O0AX7VvjoweQxXYD9cws5RQPHeX80ZzpzM/Z44HbGNUM6mDxabdZMFlooK3m2tWgaN/r5oePPvePCJPbIA3vmDYxjkZPtWRi4nMqA5O1FlktziXYlj7Edh32Bq7SiHL6JVwxlGiU2utLszQEsPffMpN2p1SXQSi7FDAT6UPakaMCYqSy6Yu4MssIGsTcVTg79pcNMLh7LqtcqPtNirppjsujyfTWM8dVMcZx4U05MTlOWKmuLFBJDpPkyYNCdY7bDNUj6d+6YUtp3vqeppvTQlTPnjiBwXqqA+60XIPUkQ4JcfulXSHJkh0bxucPNjTzuz2I8/JBdFkpI6b1ZXyrX2Rlcbg3jXYtJWTQ7u5GDWxpVv5ktMAuRugtMQlEcFzNFPRmw2Xwit0R+st8QxlfhxjV4/0jQ2pupS/cjulBjzZF3o6G42hQ8ZME50RD5ZqnGEpghkJ8bafByYKG2xfY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GzgEkLolHEyc8qc9uMzthn4cY54Hutr18T6kNrzQWBx3mucaTTJsA05klRge?=
 =?us-ascii?Q?RSmsEmVJPQJe4UTrrwrOSe/rrziJtuv0s7WIU9baVuVS0jbdIpK265ynE3bH?=
 =?us-ascii?Q?XciVQF2NpEx7G00NZPnLeS/KkU6Uar7MYvRgSa3ldarUAv8mqj2NiXDASAPA?=
 =?us-ascii?Q?hvHxJIvi1WtmXyWeauIjYcxCMK8UhEQl8qnun0Z2pWLNY3UlJUaWfVuiwTJy?=
 =?us-ascii?Q?iK7DbEcLCao+9TJfCBugsy7Kghtg9hXNTgWDm96a+aNcba8v71dOn7m71BNF?=
 =?us-ascii?Q?e4qwnpmT2CHdKUQpFkIOaAHy7W8OfOQEiuh9C5PGofcqXK1216BVWV5Vbyl+?=
 =?us-ascii?Q?sli+lR/QZV4bDhq/gkY60pESvPnTznJ9ySprDDTuWLMjUdxUIbbyCd6KHE9A?=
 =?us-ascii?Q?iO1IWOghtSYKgqgLSysB5hk3I0BRZGysBZt/3E3x958NUPtN9ERZo8JceHxC?=
 =?us-ascii?Q?Wb5ILq3nvGA3jt8mXuah0RV20LuhkGM8SZ06sviNDWqf/aXsNqLySz4Q3HYu?=
 =?us-ascii?Q?2LQaCIP1joW+lqP7L3r06fbSptyFuhVLnQJ/IwS7AhXhD0GzfC70hpeL5Fm1?=
 =?us-ascii?Q?/uBMqtHAeiNjiTOyI+ma3x2nKdn6dU8zs62GohRN5QmIpULI/wGQnMl7VJh+?=
 =?us-ascii?Q?+9Iq3ZV+NIq5gHrGk2ixj70aYy975eyEAvWx+AC0lX3Qno0R+GZaw55fLEGL?=
 =?us-ascii?Q?Vypcz+6SajhNFjvtJiGAsmhnzYspzrx/Efut70mq9AvtM1S7al7SjV+ml819?=
 =?us-ascii?Q?1CcELECn8VEt8yQLyGeqmZLzdge1C0kQ2lbzno6K/+L27pzdkcIOWWYY7tkx?=
 =?us-ascii?Q?LvH9wm1EQSp87egA7V7rfdDia3uXLloqpAgqRa1ikIyuPXnt3fZXHX6bXOil?=
 =?us-ascii?Q?JvrjkDT0EKLS3qsXWyBBed9besjNQxBZTOuhYqOnFjStxdCc3eKlW5QCb/ov?=
 =?us-ascii?Q?XpCBUsalLn1aTF3C3b37E/KrgxbyadVLwgYZfvrJvaD06w5GaSnxsRd0lDnK?=
 =?us-ascii?Q?93b1RFYRI6/2XTxBFsFWOJQu/SY7mIPNJ/4w70EDTI/2zkNp/PiQ3lE0Y2h4?=
 =?us-ascii?Q?ZDiHXOVAKFKOiA/S30BLIzf/KjWlOAaQfVsro+/5gbQe3666WUtDii7C7OKz?=
 =?us-ascii?Q?xRbLyUtzHTF6SJzpr89ZG2oHQIHt0YNucMEzy+BaPbUWnc0QegdMR2lHpasd?=
 =?us-ascii?Q?Yvrz750TIN6PGaXizEtwFL4DlzuLUElonJ5ead3BltH1q1ydc3Qef2i9KQYM?=
 =?us-ascii?Q?i6y5p5mKclWLHJLMOdpnIP8NqYDYwRpqIkNvpvrYhzvnnv7dsM/ahSvTsWRl?=
 =?us-ascii?Q?7RMDqh78c2GTagzUZcLNwms3kFZOWwy8Qdh5/LCAeTkoSz5X5H9HgNPb+ggk?=
 =?us-ascii?Q?Ci51+55vvKw1uheqbC+Ml1W3flfBi5JWffQ6KhLYdJEPkWtl2OQoVKwB+UO/?=
 =?us-ascii?Q?qXh3P+ZGfpgXec/GozIqDVpWzKbg9Qc3IADTqXsDjZFneX5PWeuBTkpE3rje?=
 =?us-ascii?Q?mudUz4Bw51GNerYcVH1QE7Hze7qoNB7sjQTsMD+6yp6ixQizY7HlQvinab2N?=
 =?us-ascii?Q?pHlRGqL6/aVvrVao2dg2yp9ivqY3DYqu4WmrH4tq+W/BK/s0ggCSJT+3xOcq?=
 =?us-ascii?Q?C2UTMCEI7BBoMKWiPwUne6lUhoOWHeAobIPBmHUaJMt28zjMF8CoLibGEBOt?=
 =?us-ascii?Q?mINtWaljC128mWDlvKzn8a+oXNR+MqFoi05muhKaiJ58mwdLYmxQMKwpTohy?=
 =?us-ascii?Q?dXH7JMWzbQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bb1e12-2705-47ad-653a-08df0e8594ac
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 15:18:20.0679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gG7v/JEB0bAPlYndlnT+OscDDKZKBJPITOBvM90nuAJgBIilN5Fxo8OU1qhwOZlsf1ncjgCotwDQXUcZAZOU+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5677

Hi Vincent,

On Wed, Sep 09, 2026 at 04:42:44PM +0200, Vincent Guittot wrote:
> On Tue, 8 Sept 2026 at 10:24, Andrea Righi <arighi@nvidia.com> wrote:
> >
> > POWER7 and NVIDIA Olympus use SD_ASYM_PACKING at the shared-capacity SMT
> > level to order hardware threads. Idle CPU selection does not consult
> > that order, so a task can wake on an arbitrary sibling and remain there
> > until load balancing corrects the placement. On these systems, that
> > initial choice can prevent the core from entering its preferred
> > lower-thread resource mode and cause a large and persistent performance
> > loss.
> >
> > When idle selection finds an available CPU in an SMT core, choose the
> > highest-priority available sibling. On SMT2 Olympus this only changes
> > selection on fully idle cores. A partially idle core has only one
> > available CPU. On wider SMT systems such as POWER7, it also fills
> > available siblings in priority order while the core is partially busy.
> >
> > Apply the preference to idle-core and idle-CPU scans,
> > asymmetric-capacity scans, target, previous, recently-used CPU fast
> > paths and the slow path. Inspect the lowest scheduling domain directly,
> > but require both CPUs to share its span because isolcpus can split
> > hardware siblings across scheduling domains.
> >
> > Keep physical-core capacity selection independent from SMT sibling
> > ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
> > maximum capacities, then SD_ASYM_PACKING selects the preferred available
> > sibling inside the chosen core, whose siblings continue to share equal
> > capacity.
> >
> > Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > ---
> >  kernel/sched/fair.c     | 85 ++++++++++++++++++++++++++++++++---------
> >  kernel/sched/sched.h    |  6 +++
> >  kernel/sched/topology.c | 36 +++++++++++++++++
> >  3 files changed, 110 insertions(+), 17 deletions(-)
> >
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index b8bd308c2d5b1..37837c36288a0 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -8587,6 +8587,35 @@ static inline bool test_idle_cores(int cpu)
> >         return false;
> >  }
> >
> > +/*
> > + * Redirect a CPU to a higher-priority available sibling in its SMT domain,
> > + * subject to task affinity.
> > + */
> > +static inline int select_idle_smt_cpu(struct task_struct *p, int cpu)
> > +{
> > +       struct sched_domain *sd;
> > +       int best = cpu;
> > +       int sibling;
> > +
> > +       if (!sched_smt_asym_active())
> 
> I wonder if it's worth creating a new static key. All other pieces
> related to asym packing use sched_smt_active() to opt out the related
> code

The intent was to keep the additional sd dereference and flag checks out of the
wakeup path for the more common symmetric SMT systems; sched_smt_active()
remains enabled on those systems, the new key lets them return immediately.

Without it, the additional cost should be small when everything is cache-hot
(roughly a couple of dependent loads, flag tests and branches), but this is a
hot path and a cache miss could make it more noticeable. I haven't measured
whether the saving is significant, though. If the extra key and its topology
accounting are not considered worth the potential saving, we can remove it and
use sched_smt_active() instead.

Thanks for looking at this!
-Andrea

> 
> Other than that looks good to me
> 
> > +               return cpu;
> > +
> > +       sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> > +       if (!sd || !(sd->flags & SD_SHARE_CPUCAPACITY) ||
> > +           !(sd->flags & SD_ASYM_PACKING))
> > +               return cpu;
> > +
> > +       for_each_cpu_and(sibling, sched_domain_span(sd), p->cpus_ptr) {
> > +               if (sibling == best || !choose_idle_cpu(sibling, p))
> > +                       continue;
> > +
> > +               if (sched_asym_prefer(sibling, best))
> > +                       best = sibling;
> > +       }
> > +
> > +       return best;
> > +}
> > +
> >  /*
> >   * Scans the local SMT mask to see if the entire core is idle, and records this
> >   * information in sd_balance_shared->has_idle_cores.
> > @@ -8971,7 +9000,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> >
> >         if (choose_idle_cpu(target, p) &&
> >             asym_fits_cpu(task_util, util_min, util_max, target))
> > -               return target;
> > +               goto select_smt_priority;
> >
> >         /*
> >          * If the previous CPU is cache affine and idle, don't be stupid:
> > @@ -8981,8 +9010,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> >             asym_fits_cpu(task_util, util_min, util_max, prev)) {
> >
> >                 if (!static_branch_unlikely(&sched_cluster_active) ||
> > -                   cpus_share_resources(prev, target))
> > -                       return prev;
> > +                   cpus_share_resources(prev, target)) {
> > +                       target = prev;
> > +                       goto select_smt_priority;
> > +               }
> >
> >                 prev_aff = prev;
> >         }
> > @@ -9000,7 +9031,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> >             prev == smp_processor_id() &&
> >             this_rq()->nr_running <= 1 &&
> >             asym_fits_cpu(task_util, util_min, util_max, prev)) {
> > -               return prev;
> > +               target = prev;
> > +               goto select_smt_priority;
> >         }
> >
> >         /* Check a recently used CPU as a potential idle candidate: */
> > @@ -9014,8 +9046,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> >             asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
> >
> >                 if (!static_branch_unlikely(&sched_cluster_active) ||
> > -                   cpus_share_resources(recent_used_cpu, target))
> > -                       return recent_used_cpu;
> > +                   cpus_share_resources(recent_used_cpu, target)) {
> > +                       target = recent_used_cpu;
> > +                       goto select_smt_priority;
> > +               }
> >
> >         } else {
> >                 recent_used_cpu = -1;
> > @@ -9037,7 +9071,11 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> >                  */
> >                 if (sd) {
> >                         i = select_idle_capacity(p, sd, target);
> > -                       return ((unsigned)i < nr_cpumask_bits) ? i : target;
> > +                       if ((unsigned int)i < nr_cpumask_bits) {
> > +                               target = i;
> > +                               goto select_smt_priority;
> > +                       }
> > +                       return target;
> >                 }
> >         }
> >
> > @@ -9050,14 +9088,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> >
> >                 if (!has_idle_core && cpus_share_cache(prev, target)) {
> >                         i = select_idle_smt(p, sd, prev);
> > -                       if ((unsigned int)i < nr_cpumask_bits)
> > -                               return i;
> > +                       if ((unsigned int)i < nr_cpumask_bits) {
> > +                               target = i;
> > +                               goto select_smt_priority;
> > +                       }
> >                 }
> >         }
> >
> >         i = select_idle_cpu(p, sd, has_idle_core, target);
> > -       if ((unsigned)i < nr_cpumask_bits)
> > -               return i;
> > +       if ((unsigned int)i < nr_cpumask_bits) {
> > +               target = i;
> > +               goto select_smt_priority;
> > +       }
> >
> >         /*
> >          * For cluster machines which have lower sharing cache like L2 or
> > @@ -9065,12 +9107,19 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> >          * first. But prev_cpu or recent_used_cpu may also be a good candidate,
> >          * use them if possible when no idle CPU found in select_idle_cpu().
> >          */
> > -       if ((unsigned int)prev_aff < nr_cpumask_bits)
> > -               return prev_aff;
> > -       if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
> > -               return recent_used_cpu;
> > +       if ((unsigned int)prev_aff < nr_cpumask_bits) {
> > +               target = prev_aff;
> > +               goto select_smt_priority;
> > +       }
> > +       if ((unsigned int)recent_used_cpu < nr_cpumask_bits) {
> > +               target = recent_used_cpu;
> > +               goto select_smt_priority;
> > +       }
> >
> >         return target;
> > +
> > +select_smt_priority:
> > +       return select_idle_smt_cpu(p, target);
> >  }
> >
> >  /**
> > @@ -9747,8 +9796,10 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> >         }
> >
> >         /* Slow path */
> > -       if (unlikely(sd))
> > -               return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> > +       if (unlikely(sd)) {
> > +               new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> > +               return select_idle_smt_cpu(p, new_cpu);
> > +       }
> >
> >         /* Fast path */
> >         if (wake_flags & WF_TTWU)
> > diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> > index 6c3ad70e58b8e..568cb1ed2dd6b 100644
> > --- a/kernel/sched/sched.h
> > +++ b/kernel/sched/sched.h
> > @@ -2240,6 +2240,7 @@ DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
> >  DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
> >
> >  extern struct static_key_false sched_asym_cpucapacity;
> > +extern struct static_key_false sched_smt_asym_packing;
> >  extern struct static_key_false sched_cluster_active;
> >
> >  static __always_inline bool sched_asym_cpucap_active(void)
> > @@ -2247,6 +2248,11 @@ static __always_inline bool sched_asym_cpucap_active(void)
> >         return static_branch_unlikely(&sched_asym_cpucapacity);
> >  }
> >
> > +static __always_inline bool sched_smt_asym_active(void)
> > +{
> > +       return static_branch_unlikely(&sched_smt_asym_packing);
> > +}
> > +
> >  struct sched_group_capacity {
> >         atomic_t                ref;
> >         /*
> > diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> > index 0248227d983a7..06c40eb5932af 100644
> > --- a/kernel/sched/topology.c
> > +++ b/kernel/sched/topology.c
> > @@ -683,8 +683,24 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
> >  DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
> >
> >  DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
> > +DEFINE_STATIC_KEY_FALSE(sched_smt_asym_packing);
> >  DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
> >
> > +static bool has_asym_smt_domain(int cpu)
> > +{
> > +       struct sched_domain *sd;
> > +
> > +       for_each_domain(cpu, sd) {
> > +               if (!(sd->flags & SD_SHARE_CPUCAPACITY))
> > +                       break;
> > +
> > +               if (sd->flags & SD_ASYM_PACKING)
> > +                       return true;
> > +       }
> > +
> > +       return false;
> > +}
> > +
> >  static void update_top_cache_domain(int cpu)
> >  {
> >         struct sched_domain_shared *sds = NULL;
> > @@ -3084,6 +3100,7 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
> >         struct rq *rq = NULL;
> >         int i, ret = -ENOMEM;
> >         bool has_asym = false;
> > +       bool has_asym_smt = false;
> >         bool has_cluster = false;
> >
> >         if (WARN_ON(cpumask_empty(cpu_map)))
> > @@ -3202,6 +3219,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
> >
> >                 cpu_attach_domain(sd, d.rd, i);
> >
> > +               if (has_asym_smt_domain(i))
> > +                       has_asym_smt = true;
> > +
> >                 if (lowest_flag_domain(i, SD_CLUSTER))
> >                         has_cluster = true;
> >         }
> > @@ -3210,6 +3230,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
> >         if (has_asym)
> >                 static_branch_inc_cpuslocked(&sched_asym_cpucapacity);
> >
> > +       if (has_asym_smt)
> > +               static_branch_inc_cpuslocked(&sched_smt_asym_packing);
> > +
> >         if (has_cluster)
> >                 static_branch_inc_cpuslocked(&sched_cluster_active);
> >
> > @@ -3310,11 +3333,24 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
> >  static void detach_destroy_domains(const struct cpumask *cpu_map)
> >  {
> >         unsigned int cpu = cpumask_any(cpu_map);
> > +       bool has_asym_smt = false;
> >         int i;
> >
> > +       rcu_read_lock();
> > +       for_each_cpu(i, cpu_map) {
> > +               if (has_asym_smt_domain(i)) {
> > +                       has_asym_smt = true;
> > +                       break;
> > +               }
> > +       }
> > +       rcu_read_unlock();
> > +
> >         if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
> >                 static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
> >
> > +       if (has_asym_smt)
> > +               static_branch_dec_cpuslocked(&sched_smt_asym_packing);
> > +
> >         if (static_branch_unlikely(&sched_cluster_active))
> >                 static_branch_dec_cpuslocked(&sched_cluster_active);
> >
> > --
> > 2.55.0
> >
