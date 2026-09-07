Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BC7233939
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772335; cv=fail; b=DhH7UVfNm/imLvDb5NjghHAiX/cv0+ZBnIazcJO1aoDjpbrRpVYElyBXibjnoJt3GS1A0soFgBTiQ78rbPe6cxwNIwjrazxjX3mOAtMrFKOOpgDvqQrYQB5enyr5639ZVQIITToTkGLWRF7e0jpeSeW+62rc8CwKy50zJE9/V84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772335; c=relaxed/simple;
	bh=Z8VrOmPu0cpb8/U6C87NDgL3zerGEFphgcBSbTsvOto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eYlxDxxRWgHr7OvsYKrZAORdGSf7pKMf7bf7lnKMkPZnELwa1gc0xLit/17fg+dwa8yz9E1ibLV5xLc+YoR5PXAX9WHaidhujangPLbDbamE8mLN6knLxSBEt/OX5+YPXap3Fr3N6UMsM51D+AORLAKbeHljMtgFEikEqRRYq0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QWiLRNOA; arc=fail smtp.client-ip=52.101.56.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QWiLRNOA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqWxQlFC0027UFI8ZfNX6zjDZJ2p4g/JIQuKFGH8poMoKJ+2cZaFEaaAePE8e/apwMwDXR/n5+XIoEXjOAIsgVu93XzX/h9npd0WTMMB2ozfsnWhLjOrYbUusJsw6KZ1tQIG6KdAu/xdCNNmt6YsNGbfNVY8FYxzywF62tGlWa/TFbrCCBv7Nk97Yw3chh0wb4kWHICEbkC1BZm05Ycdzam4iloCV6qZywsVT2ocC8nB9GwUG2evvh3ZFQsw/sY2cVPoOCjheo5NeCoRQxasGkD7MakwLgFoF3rnM/Ig7wI+I/KxaBBFRGClGN6XOfGAagAW6CwJym6vaUo2LLLmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoeJwAsyw9aFFEHoEro3eAxvISqujq+dyP7/dgwkCUU=;
 b=jYrkbSouhbIPoi9wXFW94/gkmgg1c8VthFfiC/AjpWCrO2iZCCqWqTX94JkhZ5TKsmklJndK16ZpNEDyXLOh5GmjChZvUHxlJHj7ubobxLq703zx/jeN6h/054TcDr12EPTomm8NTL51/Rjam/68/i/AkgJxySDv4Zs78547sRUtpQDdqsv/SSHsFxEOeuQGJ+o2jzp6UgV7Qo9hcXUOeMxcrfuV8taxwSnMffl2ZiQVsIKzLumi8qNwF/PFd6DECnyRsGggcFWf6cE7iw+V3D8Yr5pKTMsPPBVhWWOwr0RNYVo4f9xRJV+03wolNXm0FdbTqr6UiFx10cxMfbRWGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoeJwAsyw9aFFEHoEro3eAxvISqujq+dyP7/dgwkCUU=;
 b=QWiLRNOAVeLwJAclkTc8BhFdRcSdlmNWKX+g43kNfD32oQnt3cF8fU3oobyJP2fm4tGU9qzqVeiPnHO5XSxPt2znRSclkoLzuvuGm3WOvmA7b/CgoLhAqvXomtKiOCVHRWMFqsDJpQ1UdgkwqWnn8jKg6TooLL8XI1dY8rA+D9z0XwMDA90RVPQmj9UoFIi36ZhbBZFi1ixC4PgKeRd5H0AKVocWNpWi0B+lqPN9u4QmW+lCvk80QtJefB8B33xP0KqvRfpi9BIzPFf3ALyNIwX+OixA76SmhCI2d1OwYKup8CdF5bdTADy2LDrcHTBnEqxdjCnuyUslQvv0qT4FxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by MW5PR12MB5651.namprd12.prod.outlook.com (2603:10b6:303:19f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 09:12:08 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 09:12:07 +0000
Date: Mon, 7 Sep 2026 11:11:57 +0200
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
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
Message-ID: <ap5_3R2H80WsD1R5@gpd4>
References: <20260904091838.3617894-1-arighi@nvidia.com>
 <20260904091838.3617894-3-arighi@nvidia.com>
 <ff6763c9-f279-47d2-a279-58c54ab37ee6@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff6763c9-f279-47d2-a279-58c54ab37ee6@amd.com>
X-ClientProxiedBy: ZR0P278CA0192.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::16) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|MW5PR12MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9ecd69-3e0c-4ddc-f051-08df0cc0170e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OVpM+6Rafap/WG7VkvWgiZiSU0bVcWuHdtdmdNfvCg3KAtUQn1JCLpZCjv1p9Z17OO+z/WGoZS6/90k8hzXw9SHLUjG3nVVYNoXFTn2b1t8QkfdI1UUBErCN7fhfYuBby6GY3aenQuG/bGccYmRlfpt4Qs6n+/GJBqZFeHweFPFH6Jmxfp6bjKbXexKdh9DUTw3x64IJaRNSTWD7t5sVTIxgewAgumgzSwGVHeqjhTzb8A5zjsHYFcw9UFXfWe/xTBUXeNcnwsjfOhURNh/fQGOAmK4GtLTHKlnqDWHsHlDcFb7qNX+jeXKPd4Yt2x48mEghGmYmpff1Dm62GVonTAn9hA9WeucizQmTtwG7ke8mHpIZ+guBqJnVALarMoDLVFwDI4lf6iH/8PA55b8AnF9yLNDc0jSDxpe8Lv2WR6Vn9lAZSRngYFZqy5cjchwmcw/k6rHI00k9KZWe/KXLD0+dJmdS7V0lO2qeLfiv/bT+nY6CI5SC+37bm9hyEHUsjzHQfI7OCeI5iWQZ/qoxHCN/DQouwc1Hh+MowmZcKWzX/Pvww4wKsEC7gJGbg+2s1I7IRwoPnUOnFUHHjvHQY7OnSeWg7QN7al0qHwGkU65mYGFUdEB9PEm5pGRbv3WgTkwmLb5njVs8dwK5uk/YoxRfb6Le8sSZzdbaJJ11Yq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ShOgPmM4uDYDP0+D7ditIR4+A/u96QQydfTWtmt4L50pkhKrs37inYBXwhGr?=
 =?us-ascii?Q?PA9vevTeug1gkV/KXv7cZ6APUmMSHt6Zkkg1z3S7tCOr8YGHcVP6431UcPIa?=
 =?us-ascii?Q?c24ynQ3ASYhZzuwrjG6SxPkn5iiF0EQ06etUT9vB6ZXB4mMARyTLVQyWJ6F1?=
 =?us-ascii?Q?bmcODVQOhBRmtvwZtLU8dOdq1fPXHRMdUMPM574EWynoCmsCXWki7Eey9Vsv?=
 =?us-ascii?Q?F82Eek42Tbvbu9uz8Eb+L2JkJ1FOZqkpFJC6FEn3Ws42SxTXjHvPwoFho+BY?=
 =?us-ascii?Q?KFxoNlgdQhwBT9CIE1jqc1+IcTRIgsLrl5nG3vshhWw9+cBKWxAmkE0gIFz9?=
 =?us-ascii?Q?vE6egz2TgEeZ+ccmWtmoh5+h2lehZC/TGtBRvbFLQxFR2+sj4kVyZortnrnc?=
 =?us-ascii?Q?g+T3ft/AeLnDHXFen7vMgVrvR/RzhCEByLd4fQSB5nyswNYCjBhzp8EpSmqc?=
 =?us-ascii?Q?4fdA5/sCSZAnYi3FtY6W0UPz8mSUqvc2R7tsIt1YkGdzyYZZUDFMWPc3SX/n?=
 =?us-ascii?Q?b4o5bLWs/D67c3MnDu6942ymT5SMEQgBcTKJFaPfyQo90JsL3CiuNTFUBC1Q?=
 =?us-ascii?Q?odGIjSXvIMS4TNH1U0Igo08cxZ4WVUo3c20cIAJVzvgyN2cYKmdRlqrSDQ1r?=
 =?us-ascii?Q?qGjEzS9+untJOyM/4VZAga7TnrHKhGBJFqiZJGCSzvN4Yc40JXCVAKS4wuU0?=
 =?us-ascii?Q?F/Tp6TJURTdMYIghPARDcP6at0dgS5RZTh9bnbPRfqL6VThlFK1QlIUl8IcV?=
 =?us-ascii?Q?GjwIME3YQu8VJSpR+sXkE+RIyMqc3ZO6y1lsNpecaMdUeyY5oGsdDZofCxQ/?=
 =?us-ascii?Q?1CbvPCYNbn86vDDqwPdg41eZvkjAUr3w1C6vV0dzV/ajX4hksMbq3OhTa8Jy?=
 =?us-ascii?Q?/rHpT9UHBjNoanuom2AU0BoRQYrnNF46ov7zsOlvLcUFQCdzYEdBCrOus6xA?=
 =?us-ascii?Q?z69HxzPNC63LvOMZpkfFhgqKxgXZ7LsR+ooJQhjKiQAMNgCyovf6hbd9UPrQ?=
 =?us-ascii?Q?M0VRyGkI4rurEBSZv2fh6LDlqJehTuJfvv80fE7wfo1PJucNTCJe1l+7lcMx?=
 =?us-ascii?Q?LvOLTg2ZPPexb9dr+v3rygZsM6x6ZaKn9Ekvt8O/4CIx9s3mJPBnSZr9UN2R?=
 =?us-ascii?Q?bfAeIKzq4JPRA46QE6jyQzSa3uxbZ0/VZSHjct3Vk3Wnz/tpI6yDwl4/gPLj?=
 =?us-ascii?Q?095668BaF+hKYNOBrPxSdiLqdO/atyy60PUAQE8rB+RDBWuOYrdjyQrjwXSJ?=
 =?us-ascii?Q?FPpEab0R28NrOiZsA4243Igzj0GgGo8hC5gOsazy5W86WF+pVRjfl6KTPU9e?=
 =?us-ascii?Q?YCWX1PyqhE8BNyudLfrHgqYoZNs+spsI2jc6kPEFzL7r3KzeD9dNDtiEmPpy?=
 =?us-ascii?Q?1YElcxoE7SVhhP18y7aBD3YnUPR3G+kyaD7rKQF8tMq0ytQMNBiOBMTAvLvr?=
 =?us-ascii?Q?IsWL7J8bytiZyMYJlsP7mvdRI6mL7hgVHHDVYx1P+uT17TJcfn0yTNg1av35?=
 =?us-ascii?Q?5kQarY71kdTkyrppafoNnaWQv7GV+sP2MYq3QXkMixwvsqMofM9AIBT/Lveg?=
 =?us-ascii?Q?2opo3kWvCuqpLRVk327VPyA4e11BV+mA/oGF5tdNA22svdmCj5p/1aESm4Gw?=
 =?us-ascii?Q?aprFXaUyuTzX8d+qE1yf7sgNZYvpC1T+BumSlXsAIPSgevaob3kqUE4tbM8c?=
 =?us-ascii?Q?hhTOB2s8H6l3ndYMaDrDV4W1C4kDGp4kYkQoZr5+dyrkZSt3czwOXKJXrm++?=
 =?us-ascii?Q?74rWKTCLrQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9ecd69-3e0c-4ddc-f051-08df0cc0170e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 09:12:07.8257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlox12XyynjMPcxSlJWJfYNGzwV9uRqizHtHFPRl9Y4FUMij5LVRIwAHwWVwgzsFEwuOzyqhnQg34VsE2tL4hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5651

Hi Prateek,

On Mon, Sep 07, 2026 at 09:27:22AM +0530, K Prateek Nayak wrote:
> Hello Andrea,
> 
> On 9/4/2026 2:48 PM, Andrea Righi wrote:
> > +/*
> > + * Return true when @cpu has a higher asymmetric-packing priority than
> > + * @other in their shared SMT scheduling domain.
> > + */
> > +static bool sched_smt_asym_prefer(int cpu, int other)
> > +{
> > +	struct sched_domain *sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> > +
> > +	if (!sd)
> > +		return false;
> > +
> > +	if (!(sd->flags & SD_SHARE_CPUCAPACITY) ||
> > +	    !(sd->flags & SD_ASYM_PACKING))
> > +		return false;
> > +
> > +	if (!cpumask_test_cpu(other, sched_domain_span(sd)))
> > +		return false;
> > +
> > +	return sched_asym_prefer(cpu, other);
> > +}
> > +
> > +/*
> > + * Return the highest-priority available CPU in @cpu's SMT core that is also in @cpus.
> > + */
> > +static int __select_idle_smt_cpu(struct task_struct *p, int cpu, const struct cpumask *cpus)
> > +{
> > +	int best = cpu;
> > +	int sibling;
> > +
> > +	for_each_cpu_and(sibling, cpu_smt_mask(cpu), cpus) {
> > +		if (sibling == best || !choose_idle_cpu(sibling, p))
> > +			continue;
> > +
> > +		if (sched_smt_asym_prefer(sibling, best))
> > +			best = sibling;
> 
> nit. Since sched_smt_asym_prefer() is only used here, and we know rq->sd
> is the one that can have SD_SHARE_CPUCAPACITY | SD_ASYM_PACKING, perhaps
> you can inline the check here do a:
> 
>     sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> 
>     if (!sd)
>          return cpu;
> 
>    if (!(sd->flags & SD_SHARE_CPUCAPACITY) || !(sd->flags & SD_ASYM_PACKING))
>        return cpu;
> 
>    for_each_cpu_and (sibling, sched_domain_span(sd), cpus) {
>        ...
>    }
> 
>   ...
> 
> 
> That way, you don't need to dereference cpu_rq(cpu)->sd every time in
> sched_smt_asym_prefer() and check cpumask_test_cpu(). Both, domain
> span and task affinity will be covered at once.
> 
> Thoughts?

Yes, agreed. I like this way more.

> 
> > +	}
> > +
> > +	return best;
> > +}
> > +
> > +static inline int
> > +select_idle_smt_cpu(struct task_struct *p, int cpu, const struct cpumask *cpus)
> > +{
> > +	if (!sched_smt_asym_active())
> > +		return cpu;
> > +
> > +	return __select_idle_smt_cpu(p, cpu, cpus);
> > +}
> > +
> > +/*
> > + * Redirect an available SMT CPU to a higher-priority available sibling allowed by task affinity.
> > + */
> > +static inline int select_idle_smt_priority(struct task_struct *p, int cpu)
> > +{
> > +	return select_idle_smt_cpu(p, cpu, p->cpus_ptr);
> > +}
> > +
> >  /*
> >   * Scans the local SMT mask to see if the entire core is idle, and records this
> >   * information in sd_balance_shared->has_idle_cores.
> > @@ -8645,7 +8702,7 @@ static int select_idle_core(struct task_struct *p, int core, struct cpumask *cpu
> >  	}
> >  
> >  	if (idle)
> > -		return core;
> > +		return select_idle_smt_cpu(p, core, cpus);
> >  
> >  	cpumask_andnot(cpus, cpus, cpu_smt_mask(core));
> >  	return -1;
> > @@ -8668,7 +8725,7 @@ static int select_idle_smt(struct task_struct *p, struct sched_domain *sd, int t
> >  		if (!cpumask_test_cpu(cpu, sched_domain_span(sd)))
> >  			continue;
> >  		if (choose_idle_cpu(cpu, p))
> > -			return cpu;
> > +			return select_idle_smt_priority(p, cpu);
> >  	}
> >  
> >  	return -1;
> > @@ -8720,7 +8777,7 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
> >  						return -1;
> >  					idle_cpu = __select_idle_cpu(cpu, p);
> >  					if ((unsigned int)idle_cpu < nr_cpumask_bits)
> > -						return idle_cpu;
> > +						return select_idle_smt_priority(p, idle_cpu);
> 
> Question for Shrikanth: On larger SMT (SMT-4, SMT-8), does the ranking
> make that big of a difference if the core is already busy?
> 
> Does the overehead of additional search get offset by the benefit of
> being placed on a better ranked thread? If not, maybe the paths for
> !has_idle_core can stay as is?

On Olympus it'd be fine either way, since it's an SMT2. For wider SMT systems I
also defer the question to Shrikanth, I don't have any of them to test. :)

> 
> >  				}
> >  			}
> >  			cpumask_andnot(cpus, cpus, sched_group_span(sg));
> > @@ -8745,7 +8802,8 @@ static int select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool
> >  	if (has_idle_core)
> >  		set_idle_cores(target, false);
> >  
> > -	return idle_cpu;
> > +	return (unsigned int)idle_cpu < nr_cpumask_bits ?
> > +		select_idle_smt_priority(p, idle_cpu) : idle_cpu;
> 
> Since every path does a select_idle_smt_priority() - be it coming from
> select_idle_core(), the early-return from the cluster scan, or just an
> idle CPU from the LLc scan, can't we simply just do it once in
> select_idle_sibling()?
> 
> Something like:

Yes, consolidating it in select_idle_sibling() looks cleaner. One comment below.

> 
>   (Only build tested)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index f79fcba4afec..7c97585141dd 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8964,7 +8964,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>  
>  	if (choose_idle_cpu(target, p) &&
>  	    asym_fits_cpu(task_util, util_min, util_max, target))
> -		return target;
> +		goto out;
>  
>  	/*
>  	 * If the previous CPU is cache affine and idle, don't be stupid:
> @@ -8974,8 +8974,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>  	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
>  
>  		if (!static_branch_unlikely(&sched_cluster_active) ||
> -		    cpus_share_resources(prev, target))
> -			return prev;
> +		    cpus_share_resources(prev, target)) {
> +			target = prev;
> +			goto out;
> +		}
>  
>  		prev_aff = prev;
>  	}
> @@ -8993,7 +8995,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>  	    prev == smp_processor_id() &&
>  	    this_rq()->nr_running <= 1 &&
>  	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
> -		return prev;
> +		target = prev;
> +		goto out;
>  	}
>  
>  	/* Check a recently used CPU as a potential idle candidate: */
> @@ -9007,8 +9010,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>  	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
>  
>  		if (!static_branch_unlikely(&sched_cluster_active) ||
> -		    cpus_share_resources(recent_used_cpu, target))
> -			return recent_used_cpu;
> +		    cpus_share_resources(recent_used_cpu, target)) {
> +			target = recent_used_cpu;
> +			goto out;
> +		}
>  
>  	} else {
>  		recent_used_cpu = -1;
> @@ -9030,7 +9035,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>  		 */
>  		if (sd) {
>  			i = select_idle_capacity(p, sd, target);
> -			return ((unsigned)i < nr_cpumask_bits) ? i : target;
> +			target = ((unsigned)i < nr_cpumask_bits) ? i : target;
> +			goto out;
>  		}
>  	}
>  
> @@ -9043,27 +9049,31 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>  
>  		if (!has_idle_core && cpus_share_cache(prev, target)) {
>  			i = select_idle_smt(p, sd, prev);
> -			if ((unsigned int)i < nr_cpumask_bits)
> -				return i;
> +			if ((unsigned int)i < nr_cpumask_bits) {
> +				target = i;
> +				goto out;
> +			}
>  		}
>  	}
>  
>  	i = select_idle_cpu(p, sd, has_idle_core, target);
>  	if ((unsigned)i < nr_cpumask_bits)
> -		return i;
> -
> +		target = i;

Not sure about this final fallback. Is it worth doing an additional
select_idle_smt_priority() after idle scan failed or stopped because the
SIS_UTIL scan budget was exhausted?

It seems better to jump to out only when one of these paths has actually
selected a candidate:

	i = select_idle_cpu(p, sd, has_idle_core, target);
	if ((unsigned int)i < nr_cpumask_bits) {
		target = i;
		goto out;
	}

The prev_aff and recent_used_cpu fallbacks can jump to "out" as well, since they
were already verified as suitable candidates. If none of those paths succeeds, I
think the existing final "return target" should remain unchanged.

Does that make sense?

Thanks for looking at this!
-Andrea

>  	/*
>  	 * For cluster machines which have lower sharing cache like L2 or
>  	 * LLC Tag, we tend to find an idle CPU in the target's cluster
>  	 * first. But prev_cpu or recent_used_cpu may also be a good candidate,
>  	 * use them if possible when no idle CPU found in select_idle_cpu().
>  	 */
> -	if ((unsigned int)prev_aff < nr_cpumask_bits)
> -		return prev_aff;
> -	if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
> -		return recent_used_cpu;
> +	else if ((unsigned int)prev_aff < nr_cpumask_bits)
> +		target = prev_aff;
> +	else if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
> +		target = recent_used_cpu;
> +out:
> +	if (!sched_smt_asym_active())
> +		return target;
>  
> -	return target;
> +	return select_idle_smt_priority(p, target);
>  }
>  
>  /**
> ---
> 
> That way, it lives in a single place, and we don't have to pepper
> select_idle_smt_priority() everywhere. Thoughts?
> 
> -- 
> Thanks and Regards,
> Prateek
> 
