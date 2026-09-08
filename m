Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011000.outbound.protection.outlook.com [52.101.57.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6113039CD01
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900603; cv=fail; b=I8v0ZwMAlOByZhkl8zdc0LxAuQlxUwPyWBkBEhfIzUI2/4V8OxSbYuhOZ7KyYUhwp83Tyie7xrVX1XB/onaVQtcy3o2yWV0dTZcAznrpmJKzRfgcnrsGFkQBN7Bj65GMTPoEyye1HEC6DfHMVyYBmirKnYZr8yBXChgsYK5VKu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900603; c=relaxed/simple;
	bh=PvsLhPdtg3zfGp2oNnAX55zD0d8O3IfyRj79N+P7V4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oouCNBCx5lPMrV50M5E5SPan05nv7RxsNW1wmlA4rfkkX4wrF/Xm4BH+MarM67O7dADJ3xPgTqu1+Mu09824ceVXBwjlBTiSSFGHgBqK22wiaIRc6yen7Gk4vStiG+Ck7MioqjXPcVpChlNjA0c2p2GFZuGrhOegoVvRCiOMImw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Glz7NZaS; arc=fail smtp.client-ip=52.101.57.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Glz7NZaS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cayC780zjuhDX/ONMC/VP5B6EjfjoBd3wen/1TMFfBuThVXhv2b0VbTaRAoHEZFYdrPAQ+pofqOX1ccHO0GubT2bPooFDqjFGTJC1E1MmjS/DSFcIck0TfTl7akQMyBWTK8TXj6ybB345iZmpTeKdPCkq4TlQz0JlFQvRaPWgqKn7+g3MNZlLsuIeKAaRPIynXkj4RFvL9vwEcdjtfelQMnhv5K377VRU3QSqG7amuQEFBntKQvBcRuHUAcmkMOHTUmwDUf3l++rUiv7WgaLSL3bNE7kU47uNyXiCaqFymGjqpSpAM3wpOeY0/J6aJY5mbhh0bzdQr+peL+lQrTzDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph49vtA2cjDAN2p47HkW8fBWdB2WAknpNAZ9XWnsUe4=;
 b=l7CF2pP1l/wzrtEcgXgwStPv4ik93NdnPh1tfWv7VPMOcfO6To2+3N7LfuqynCO2oaJ2xVRIxX9zOedeNGg0DBSyXpmKNLyBlFmBGE+QndWU6ZhSRX9MzHRDBUbUG8X6bdBpqV+A3CfX767B1pn1YS8Zcwax9U/K8RzgkS6XauR9uYPp8zOh1kTxRVQbAFGKw7ouicUHM8sgP1fjU4+L+7knlQb42xDy8fTbNrpyQaHGjlr9UYvBnE8HnWTF5xDvpkTz88DNERM5XxFMSkwCjenjs1kPQV+Wj++sUbNTXR8NMLpNsdkqv2qCUxg7nGHpO+hQd+dTrd4NG42pk1Akvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ph49vtA2cjDAN2p47HkW8fBWdB2WAknpNAZ9XWnsUe4=;
 b=Glz7NZaSiavlFyWkEudXFoVBhKYivAPtAZF4NQm3kD3pO72cHtNK6fgU3STtrzEJK94s9PrjTk5o4w2dXrZwXQ5l+vYI7mdbxo3XdBybXZ3Rvdgup3m/imOUfdk5Z+gGK3sr95ju/bj4/20Es83DL+jobOSo8KDA5nXKcOGZx5XZIRAN3j/1OJSSu/Dj6XpuVMNQ8CGS4ipG6xmN8J7luUnW9H4LZLkt53Jqyso37nO/kNcc5BBEums4DCKWoeIZ2aQpnmGtWAg7gXgTnih6kIKux26v6CV0pYy9p/mTMWNnJX/Iff53pEUz8m9LXFZsmkG2evO3TWmaY/naSVwxAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 20:49:53 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 20:49:53 +0000
Date: Tue, 8 Sep 2026 22:49:41 +0200
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
Message-ID: <aqB05WpYBcZfIZYQ@gpd4>
References: <20260908082345.103087-1-arighi@nvidia.com>
 <20260908082345.103087-3-arighi@nvidia.com>
 <ce287aa0-0079-4cfd-b330-6b7617f49e8a@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce287aa0-0079-4cfd-b330-6b7617f49e8a@amd.com>
X-ClientProxiedBy: MI1P293CA0026.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::10) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|MN0PR12MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: 3866582b-d826-41ac-52a6-08df0deabb9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uDaI9lKaqMToa7ozvXsx95uxwCO1zRWPh2JBRUu67DlOZz4SuNeUb4c5OmJ6ZKBqtescIX4HXdOmVNh9V6kcoaWMo6MI5KbgC/hZf/OGVq4dCPU4xcsDraa3uhF8HmIqqbRN0HK+zLxCsgxUb9v73valwwtqXDOYaFVcHf9e3+aZgCHXq4fIDJsf7/EbkrTDBmFibSvZ4LN0GX1/DtFub2+iHG4AbyZnH8nH24iJL8DIDMu752Wk6F0qqPgO9VsO2DYKLtD1dMwUZ1HOEwubrwkkCK02E8LPsSPz2mg3ChzBwpOP8ihaUoilloar0i/bRBtiEonBjzHGeqz6KSxU7QmzB4a5DtZlBZ5rrCtUinYufu4Fyqs6iqCB4Ro6pTaUZhYYsqTyrBOtBAtn+cktX4qSWPP6xcXk4nkIEWNMguMxfpnNlEMLmX9kzkG6qsyXHqSwVCcZ/5tVVImmlVjdKgPYph0g95rWZLwjrp6yPaKkQ7rQ/6Lou3zS1w7xgbTqbM/hhMZtxMUict196Y0nj8QLHcUxsGMSVCeOma3yowd8LQslwVZWEuRxsOG19Mz+RF07n2ANW/IkG44vc3MqPf7oBxaUbUgVnO2MD3v2xNOR1ufhm2iYZHOcmSuVvqEn3XpbFkNJsQQTYUSKM3sisnuOkn5+OaLdID3+xQ/Zpjc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K1NEWuHcLbc82FkqM6ySyEVDkRoaOo3FOiqV2wfoJfdoZaewnijNg4AYmQDf?=
 =?us-ascii?Q?oW+YeUtHB/Rds6RNQxE9C/Yfwa/+QyNQYjUhkbC22b9IM4uJJgsbDkJaIlEb?=
 =?us-ascii?Q?gOj3IqmwjyFNK+dmAxXMrsI98pSfRYSEtKOKqD5+9dDrIX0wSDF5s6ZPsgym?=
 =?us-ascii?Q?AgGlY30MjSsGuqYV7jdtyxkF9mVG6wZlBIlcrTTeNnfpDlNd5GPQBQG4eD3h?=
 =?us-ascii?Q?zrxmbLTSmOLMoWQSlYbb532bMzAwXWDpYXzgjwxOqODAGWjwUO6zPTop4NhY?=
 =?us-ascii?Q?st+Kosv2Y4rBUEi5bYKtx2pAcmibVcHkP1b4BcAX5nJL1Q9WJNWhCCV6aCC8?=
 =?us-ascii?Q?RArOg6LQ9OArip5IftB6xVw3sMs1qrRbn5dIQGsjjzh9a4GrP13VQXw92nuy?=
 =?us-ascii?Q?dXj9FzUFFcrmuu3jxJ8uHm3y50jRkXnLuNcSz46Y4Zm6Yjb4w5i34+TqCaVk?=
 =?us-ascii?Q?1SRVURepLXES8HCi9Ivu+BaQrSiWuLewAj+O04tegfvPJMFpl08Qa+FHsFo3?=
 =?us-ascii?Q?UBwKLA+lWv8h6Bm5OD44pdh71GnOKuWaOegDxF16qOy9KBVEhPsttUeTujPk?=
 =?us-ascii?Q?O/Alb4XNZzTpIOI/tm4x9BHBBlQGjb3D2X1CzgB5Vp6fBg8A27QKZ9wx577o?=
 =?us-ascii?Q?wHsRH+82JyV8ScW50e3AbQjS5cDj9JNuadXvk3DIlk8SOmAq/LFang0eocFv?=
 =?us-ascii?Q?XBJcl+mN8to0XsBx3eokkqrTfwL5ZtZo/44y3l7/6Hlr7QOPG4TCIfrEskJQ?=
 =?us-ascii?Q?8BZTaO5gMcvXwG7/iHutNornkF6VpB5eE1w9/u/uuopm3RmNhYmHfmbUtv4d?=
 =?us-ascii?Q?eZVn3M7S+QbwXjgzV4MUxqgMhnfimbGHuDYA2uHeSMbsoIOYmUT64+1j0neO?=
 =?us-ascii?Q?7V1sRdRQeLjAD4hf3Hr1hW+hg5a27Xv3pNnhRKTo71DmzlsLXHNpwDVSI1YI?=
 =?us-ascii?Q?uWyysa1K/w9Ur2rDbxxPfHKdsyDgy6NgApOQ1vsNTmyBeuUXqIlHpBON/6o7?=
 =?us-ascii?Q?qiXTa9VHF/t1FmCICAFQndtBk2mc7Qv+bajHdfTyLmGD+e2Ag4ONBaknAk/2?=
 =?us-ascii?Q?UeRD3i7Mdb9VUvdBp99/ybiTxkCQLak+tH58sRRa+BdPS+QjI5mCyYurkAZo?=
 =?us-ascii?Q?EqdtLo0PjDSxUx88oXZYZj6uW0mvRwohjFe99VuGQPfRVuJTr11JTqw2EXht?=
 =?us-ascii?Q?kiNK04HSJP0aKu51UJifvAROOP4uiB/+uDJiUsiG2VYkWoVBWMLfQzqVIwWj?=
 =?us-ascii?Q?f2fwSYbix4TLTcEXWxtfqUgQwX2+sj1wAQOFJycXlvPjYFoCdC3zUHtiJhTG?=
 =?us-ascii?Q?F+6vF1Es9FpdW+3c0aujbVId4D78yFq4NA93ZHL3lJ6pw70jOS8lAiz238BF?=
 =?us-ascii?Q?Arqbd1TC5zR1forS25tqA4pI8SHHm6BYFWx1pGlgX0TAlmPfrYOcthH689sR?=
 =?us-ascii?Q?oO/G4QAvX7dPXRpk6ZGbRUaLcPRawdJeCsyWWxhslQG+jzvMymjYSs0Yzapy?=
 =?us-ascii?Q?RYrmjOzH7uJPffUcUc+mdcDfAd3EQ/QLFcIiPrxiSJO4gbwyvgrCbCGHdhue?=
 =?us-ascii?Q?u+bnhvnyZmMAYDujjYdySBPThEvVaZrNJ0NjVn225DksrJ8ueqEf03xABI8z?=
 =?us-ascii?Q?mAov0Zltjz8oyJ0J7kupzw5697+deWDQeTx5UowzJbTKEGxXqT7BW6ryxaxu?=
 =?us-ascii?Q?lJhZr3ZSu621cPLHAQ2wsvye7f6UebxG8g6WP5suEJuYZgtH9yteTqIvttRH?=
 =?us-ascii?Q?tFCTZBkNvQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3866582b-d826-41ac-52a6-08df0deabb9d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 20:49:53.2575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86WIE2EIogRnX4qzYCL+i8s5iIQjWJDD9Lx+XUyY1GCnT7knSQqYhgaDU3+O8WJkVg8/NLtDhAKBv6Ja94NU8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320

Hi Prateek,

On Wed, Sep 09, 2026 at 01:10:48AM +0530, K Prateek Nayak wrote:
> Hello Andrea,
> 
> On 9/8/2026 1:53 PM, Andrea Righi wrote:
> > @@ -9747,8 +9796,10 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
> >  	}
> >  
> >  	/* Slow path */
> > -	if (unlikely(sd))
> > -		return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> > +	if (unlikely(sd)) {
> > +		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> > +		return select_idle_smt_cpu(p, new_cpu);
> 
> nit. I personally feel this can be better integrated into the
> sched_balance_find_dst_cpu(). Something like the following:
> 
>   (Only build tested)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index b8bd308c2d5b..1012dfb33f08 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12353,6 +12353,17 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
>  
>  	}
>  
> +	/*
> +	 * If we are on a SD_SHARE_CPUCAPACITY | SD_ASYM_PACKING
> +	 * domain, use the group_asym_packing classification to
> +	 * decide placement based on rankings of idle siblings.
> +	 */
> +	if (unlikely(sched_smt_asym_active() &&
> +		     (sd->flags & SD_SHARE_CPUCAPACITY) &&
> +		     (sd->flags & SD_ASYM_PACKING) &&
> +		     sgs->idle_cpus))
> +		sgs->group_asym_packing = 1;

Integrating the preference in the slow-path selection sounds appealing, but I
don't think group_asym_packing can be used as a destination classificaiton here.

The intended policy is to prefer PE0 over PE1 when both siblings of the selected
SMT core are idle. And if PE0 is busy, PE1 should remain a valid destination. It
shouldn't make a busy PE0 preferable to an idle PE1.

IIUC group_type is ordered for busiest-group selection, group_asym_packing
describes a source group whole load should be moved to a "more preferred" CPU.
Marking an idle SMT group as group_asym_packing could make it rank worse than a
fully busy group.

Example: a fork on SMT2 can have the busy local PE0 classified as
group_has_spare or group_fully_busy, while the idle PE1 is forced to
group_asym_packing, sched_balance_find_dst_group() can then consider the busy
local group the better destination and stack the new task on PE0. That may
preserve one-thread mode for a short task, but it can also reduce throughput for
sustained work.

> +
>  	sgs->group_capacity = group->sgc->capacity;
>  
>  	sgs->group_weight = group->group_weight;
> @@ -12393,9 +12404,15 @@ static bool update_pick_idlest(struct sched_group *idlest,
>  			return false;
>  		break;
>  
> +	case group_asym_packing:
> +		/*
> +		 * Only possible for sched_smt_asym_active().
> +		 * Select the idle SMT that is more preferred.
> +		 */
> +		return sched_asym_prefer(idlest->asym_prefer_cpu,
> +					 group->asym_prefer_cpu);

update_pick_idlest() returns true when @group should replace @idlest, so I think
the operands would need to be reversed.

But even with that, the local-versus-idlest comparison still returns NULL when
both sides are group_asym_packing. Therefore, if the slow path initially lands
on an idle PE1 while PE0 is also idle, it would not switch to PE0.

>  	case group_llc_balance:
>  	case group_imbalanced:
> -	case group_asym_packing:
>  	case group_smt_balance:
>  		/* Those types are not used in the slow wakeup path */
>  		return false;
> ---
> 
> It leads to slightly more branches but they are super predictable when
> iterating at a particular sched_domain level so the overhead should be
> negligible.
> 
> I don't have any strong feelings either ways. Thoughts?

A deeper integration could preserve the normal group_has_spare classification
and use SMT priority only as a tie-breaker between otherwise equivalent
available siblings. It'd also need to handle the local-versus-idlest comparison
and preserve choose_idle_cpu() semantics I think.

For now, applying select_idle_smt_cpu() after the existing slow-path selection
seems simpler. It lets the existing load and capacity logic choose the core
first, then applies the preference only among available siblings within that
core.

Thanks,
-Andrea
