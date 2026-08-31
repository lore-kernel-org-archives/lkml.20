Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010006.outbound.protection.outlook.com [40.93.198.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D1C37189C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788212641; cv=fail; b=T0IaiROlOg0XtL7MURO0TF1uNaKkcy8sKzWqnG9hhoivEk/m74CIF3p66ZnzUJhyr0FTI/jTCYBg3gQStM+CMVs47OYB/Oj3H/4k6R32yRfEIy7D1pleLzf0iCx3sikk7d5lrDh6ZIbXUXfoOp013J44Di+W5iRzjZuYtgECfUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788212641; c=relaxed/simple;
	bh=lJfnJHVzTKkP9tCals8fQczhAKvAmizm979Mp0YtQUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ol2SmT9nXKxGA4MJjYeN5YgEmPbZxnV6ALL8QFDVF3rj7b2m9hAWmMBNIjKPAGjG+ikTxroOHBfvwWqDRfkKWtkEUcU/JdtkbBcOhMtJqWRm7+NnndbxGJQykvkP+bsq7FGPUm5zEULqtESBX/VK1qatzMJD3Pp120OpiHSED70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BQX6Xr/V; arc=fail smtp.client-ip=40.93.198.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BQX6Xr/V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCeKotGPQN39++VzHtpqsKdiExbSBDZWob4MevldcrgfReoT5vmPpCP8Aw9bcwhrLPTAZZNCjcg1IcXijpBTNOEJ/brankJ30CWmEP5N8yadgyGN8AcnI3+zSzEzWQTtAAvIa4ltVomts8l567m0xOCzVPoTaXcGEiUcApRyeTMOdTATzRcXaKtac4IZDWu60OMRPY1zuTamcEqpByxah5ks1yOihSS3n9DPDt4A8MoJ2aAnFnyjUyupfSq+u/mQSEG54gEYgCb9Q/TsRhoD33uK0aG9rrCQX+X6arvWDgThEHuQa1zG0WveuqrlNG1ep2D/4hUWS1qDkv2mVlpQ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sOevd0NXgJVoo3vkTRl31qiiCQ4gC3DmE05MtMPehg=;
 b=hgGHBbI4D7y84XUY93MS+dvQnFKwLCg+Dc3ff6CzUnP7qABYcw2HLtomRJTU2l2+pvBu+aDqg6Fzb/k+ez56uzQTMFourNw0YZ8+YjE9yHxCJBTluxtZefvBrA3R3TJUKBkOVH9fdXRYnVkho9AIUTYaVrhqg7VNNXDUID9mIeQqNf3UpUrmOTzQEbYslGlbr6PJ64Zq6pFEFyEWwKVltC1F2XhuedwUyO62E5LIwthrmeL+Y+GeUgoWnBlXif556RLkZ9WEccKw6XaQH9xDvruw+aaAvR/G0B4IvES2nM0QfXSat8PhYhfxd5vDhkTHHp4xaptlyuPX8GqyfP6iVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8sOevd0NXgJVoo3vkTRl31qiiCQ4gC3DmE05MtMPehg=;
 b=BQX6Xr/VxFWbr1KtI6r9C23ZNCdKHEo2Iko1sTjtYAa0c7jSCm+czoJWJAApHHJ+Xu7b++AW77lRgLeKeMsAr1hjaxej6U5eTf630lmyWhBw4gon4pKXlitEWixuhrMjj2S4uQKil/Xh5Em1gl+X0n4o5DQ4AUOYFshHU3E7IMVNlgI1P7RlR6sZdwVteKeS2XeZ8E4/52WKVKNkvlH4NqQj0btukfIYd8JN82phcSFkB+LAVtcGUUoBh6s6OR5yJlcfOkxa96eaThMTSZw0UbZ6KMxYsD9NCVv7Jc3f/9faVPiIkY8vap0gLEXcucPJ1z2Y4almO5uU+0BFWFbmdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by DS0PR12MB999081.namprd12.prod.outlook.com (2603:10b6:8:2ff::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 21:43:54 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 21:43:53 +0000
Date: Mon, 31 Aug 2026 23:43:43 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
Message-ID: <apX1j6srdTcFLZOd@gpd4>
References: <20260831181800.1668646-1-arighi@nvidia.com>
 <20260831181800.1668646-2-arighi@nvidia.com>
 <f5d625d0-3b94-407c-8f64-793df9590f03@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5d625d0-3b94-407c-8f64-793df9590f03@arm.com>
X-ClientProxiedBy: MI1P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::12) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|DS0PR12MB999081:EE_
X-MS-Office365-Filtering-Correlation-Id: ff232d0e-c9dd-4bd3-4305-08df07a8f3bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|56012099006|10067099003|5023799004|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Pvln9wp0ySXHNekDgdjjQlNLtEITGvLfZnal+CRCsdyn4k5PlPDXUnSg1dWNR5CVloOxVxQIhpU5SipRx1tPraZX+lbr/HTtQFKWXmJhb0YYG7tirpeYgPVfXCZ1mXHDv/tOvOkO1ex7G3LkCv48tLlGSat1zb7MXKHaqohpLQF+eSMVlSEQJmpRvKCHvSaky9HRMpqwtE6qnA74e7ptDnunt4dJ4zPnexjpe0vMainqNjpUVTLyPEQlPGhTYJpGW1XFwYUBixWjq9tLPsWn46adnfAgByuQ5L7rQSyymPB3e54O6haccxUiBouEXuyd8CoQLjC4Ys6FTeZVYsFEVhzEXrYLHNtSGkWbH2qZSBNMMqhEYiAR47743QxvwhiLIT+k2Jb0En452dhfolLAVbmKelKkwg/VXoHAHGyFKnBnWUcJIEw0JrkBUCMrN3+4m3Rc5JXRQhOdh4PE2rdYIeT8r/Y5PAK/LRS0UBj8GTrP4lGM//g22tWbSW6Smy3VhKoWVPefCF7DXvHaa08qDr2QinalSWqxyd8BkKcWmsM1UBxQp9o0Ug0cxSqebrjAzzbdPda01me05Q2flc+na9euZzsFafTnWTggk10rhjHnU5yF0JCcCbf96cOaBZxUE3Kux0GC+1J3Ni0llcIw6FnlvLzQJbVFphCcWHa2MR8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CAZeKHtYsy0CQ8ldutYB2+Bvar3nC+3hWRvpGRx0LoILAK0FermgyQTJgXYu?=
 =?us-ascii?Q?DlzLIWJrVZdgQ0dxNa+EJKF3uNWBM6A2wJ7TsaBDn9vC0nj8dNQUBKAdYErq?=
 =?us-ascii?Q?dJdfonoYN1ayWalbv9aBHyqSZE1URrhkUO8kPusUG46sP6Cp2bhMr0jaWS3D?=
 =?us-ascii?Q?hOdVgsRaBU2KUWNJM0eXa45WXi/3QBUxDkJs3HMitnGUUTJTevYO5bRuoimK?=
 =?us-ascii?Q?mBI7h9yVAIFIgmGBmUpeIFYcaFiGnZdfmXEFfO12gHgNp65XANnkLymFpleG?=
 =?us-ascii?Q?5EQE5BBtZotmhqCxDhyv6YXz9HfPGxGbtU4Khw2wLAWQYGW862kwxavzVUH6?=
 =?us-ascii?Q?BiCiA61lCmgjvTMxsP29Bj6DGyiPIHjzTa8bEBHrXEZaHlNIg4wc4hzc1hPB?=
 =?us-ascii?Q?cl2d5eGcu4auXFjsSxG8xtLcekoofMtX1YsS/6YOBxgBxlx13l2cieJOp6UU?=
 =?us-ascii?Q?pHU1VE7wSmgmOZvdfwRFLcttt1ckvXvciIrc1wDI530uoqGEzsI/eDfj8nBg?=
 =?us-ascii?Q?FD5IW0eeLiGP+cdDZnWhP+969Fe0TEpzYn4SgI+Fdf9ygCf4V5vPxEI7uUwo?=
 =?us-ascii?Q?YJvD6p38KZE8eo49vbGlHQWp0a75t+fgOlnq1C74xETzu8prqTgPz7R3vsCd?=
 =?us-ascii?Q?zrdRSD8nDzOah1mF8Mmap1bPza/COMygzlRN2PrVEQ1W9IICobVDR3Ab/qbr?=
 =?us-ascii?Q?TgbLRy3ndoktftMxQYHQ1ME6g1KWZOs0HJ0JHAtL4evc9PdoMQZ+10j1RRWv?=
 =?us-ascii?Q?7LpJW7n/WHemEzW11PbSMx+N3MvkB5nAwKpjEFXKFJGkwunVRzrxqKx+k/go?=
 =?us-ascii?Q?0slH6k/w4Pgvt7ivcDKROLy95KPLK7Z5UKAsjr+B6B4S6JQo/6M8VBKB/Fpq?=
 =?us-ascii?Q?3qeQBaildIUkZuqZi/+NORHLAb5mUzMSDwhoYqs7fXC9lgnwQe8StqwZbfWP?=
 =?us-ascii?Q?c7mcNji3Hn1LDI2+Pgju8shgoTHiATCjKXM4dRtzMYqhfLYYu5n6P8Hz9Jjy?=
 =?us-ascii?Q?LGCYQcjM2+Pu1aLP3Obd3jCVvIazq3+kLAv4e5LbLNUnr16eV8q1xJz7f74+?=
 =?us-ascii?Q?FIobCE0kPPsWCZt9pILE71CC9cj46ad4gBYA/BDlRjKnpp3qonmBApCqJUbl?=
 =?us-ascii?Q?+mgrV6Hzan8Shg8eezCp6MUZmivh/lPEG3wF30sycJePLGGwhOaV+qDxIjOy?=
 =?us-ascii?Q?0j6NMhkDQJSZ1ckMa1rH+5EfZs0RSMgqmC4W7CGf67d7SiQk74abrViGAO0h?=
 =?us-ascii?Q?mx8GH0/tivKzHpiSz0D4Ds7ew/xdw0GJOP2tQc8pnZAiZQazO/XGG2PwzJDy?=
 =?us-ascii?Q?rAOC9ISAJAAs1ckWtxcIXJG1/+eqEvdHe4rAKYhLsaWhd/RK1AmDwopcfmXF?=
 =?us-ascii?Q?aZLc/KNKEx3hlWqHmQROSI6UsqItSsfZo0PaTeXDgqByI5j35f7m72Rqf5tJ?=
 =?us-ascii?Q?GfVwNy+TyOa6U74uq9cU29p+5R+vccvmKGYd90N7RSYDKzvy/DDjQmY2GYft?=
 =?us-ascii?Q?mfMoyGUhXug7Y8hRFA5yJzwOx8ml+2yEPxXcNjCzgZOe6L4egRZEg0rNEZTQ?=
 =?us-ascii?Q?Gv8sKPHDSpfwPh0mEFv4B3rUsNe0l+OjDh6myAXPOrF5BdfJBSnP3+TFGbXl?=
 =?us-ascii?Q?osgx327f2DTlCLCqNX9cvQOZiepMf5SDI8dw1oi4ngk2SMiW6m23wARK56aw?=
 =?us-ascii?Q?LWXB2gGNKhIPATve0FIc4PbpNpR0bgJuoETdD2HoonNgAzX4H7u7x5T2w1Uf?=
 =?us-ascii?Q?+SDGYAK7Lw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff232d0e-c9dd-4bd3-4305-08df07a8f3bf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 21:43:53.6911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMIpYamJ3PgeGlbvEgtDX6DWjScDOa1iPujv2X0wwnpEr62/gD3aai7O+Z9YKpyBxrPKhCuMJv/Hw4jBXiIZkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999081

Hi Christian,

On Mon, Aug 31, 2026 at 10:13:42PM +0100, Christian Loehle wrote:
> On 8/31/26 19:10, Andrea Righi wrote:
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
> > idle, avoids repeated SMT repartitioning, and restores one-thread-per-core
> > performance.
> > 
> > Describe this scheduling preference with SD_ASYM_PACKING and give PE0,
> > identified by MPIDR_EL1.Aff0, the higher arch_asym_cpu_priority(). This is
> > independent of SD_ASYM_CPUCAPACITY: SMT siblings retain equal capacity,
> > while physical cores with different maximum frequencies are handled by
> > a higher scheduling domain.
> 
> But why? This asympacking + CAS interaction is a bit hard to comprehend IMV.

The two mehcanisms describe different preferences at different scheduling domain
levels: SD_ASYM_CPUCAPACITY selects among physical cores with different max
capacities, SD_ASYM_PACKING is set only on the SMT domain and selects the
canonical PE within the core chose by the existing placement and capacity logic.

> Why can't we encode both preferences in the asym-packing priority, e.g.
> 
> priority(cpu) = is_primary(cpu) ? 2 * highest_perf(cpu)
>                                 : highest_perf(cpu)
> 
> so that all primary PEs are preferred over all sibling PEs, while still
> preserving the highest_perf ordering within each group, and do away with
> SD_ASYM_CPUCAPACITY on Vera altogether?

I can experiment with this combined priority, but I think removing
SD_ASYM_CPUCAPACITY is a separate policy change rather than an alternative
implementation of this fix.

A static asym-packing priority does not preserve the capacity-aware semantics
used for task fitting, uclamp, misfit handling and migration. The current
approach keeps those semantics when selecting a physical core, then applies the
PE preference only within that core.

Also, encoding the combined priority alone would not fix the problem addressed
by patch 2: the idle-selection paths currently do not consult asymmetric SMT
priority. They can still return an arbitrary idle sibling regardless of how
arch_asym_cpu_priority() is defined. Patch 2 adds that missing behavior and
scopes it to the shared-capacity SMT domain.

> I had suggested this a while ago, did you have a stab at that by any chance,
> too?

I tested your CPPC-based asym-packing series, but not this particular
combined-priority variant. IIUC the earlier proposal was replacing
capacity-aware scheduling for minor physical-core capacity differences, SMT
sibling ordering looks like an orthogonal problem.

And at the time, the combined SMT-aware SD_ASYM_CPUCAPACITY approach also gave
the best Vera results of the alternatives I tested, which is another reason I
kept physical-core capacity selection separate here.

> Am I missing something altogether?

Combining the priorities is a valid experiment, but I'm not sure if it
completely solves the problem by itself, I'll give it a try and share the
results.

Thanks,
-Andrea

> 
> > 
> > Firmware currently provides no interface for describing the preferred
> > SMT sibling. Detect Olympus by MIDR until such an interface is available.
> > 
> > Signed-off-by: Andrea Righi <arighi@nvidia.com>
> > ---
> >  arch/arm64/include/asm/topology.h |  1 +
> >  arch/arm64/kernel/smp.c           |  1 +
> >  arch/arm64/kernel/topology.c      | 62 +++++++++++++++++++++++++++++++
> >  3 files changed, 64 insertions(+)
> > > 
> > diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
> > index b9eaf4ad70850..edc1c59b3448d 100644
> > --- a/arch/arm64/include/asm/topology.h
> > +++ b/arch/arm64/include/asm/topology.h
> > @@ -18,6 +18,7 @@ int pcibus_to_node(struct pci_bus *bus);
> >  #include <linux/arch_topology.h>
> >  
> >  void update_freq_counters_refs(void);
> > +void arm64_init_sched_topology(void);
> >  
> >  /* Replace task scheduler's default frequency-invariant accounting */
> >  #define arch_scale_freq_tick topology_scale_freq_tick
> > diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> > index a61dc3016a117..0135ac4eea8bd 100644
> > --- a/arch/arm64/kernel/smp.c
> > +++ b/arch/arm64/kernel/smp.c
> > @@ -443,6 +443,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
> >  	hyp_mode_check();
> >  	setup_system_features();
> >  	setup_user_features();
> > +	arm64_init_sched_topology();
> >  	mark_linear_text_alias_ro();
> >  }
> >  
> > diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> > index d28438f8b83f1..0dd9eec1c4946 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -19,6 +19,8 @@
> >  #include <linux/init.h>
> >  #include <linux/percpu.h>
> >  #include <linux/sched/isolation.h>
> > +#include <linux/sched/topology.h>
> > +#include <linux/smp.h>
> >  #include <linux/xarray.h>
> >  
> >  #include <asm/cpu.h>
> > @@ -44,6 +46,66 @@
> >  static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
> >  static cpumask_var_t amu_fie_cpus;
> >  
> > +/*
> > + * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
> > + * two-thread active mode, with resources partitioned between the PEs.
> > + *
> > + * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
> > + * mode. Firmware does not currently describe this preference, so detect
> > + * Olympus by MIDR until a firmware interface is available.
> > + */
> > +static bool olympus_prefer_pe0 __ro_after_init;
> > +
> > +#ifdef CONFIG_SCHED_SMT
> > +static int arm64_smt_flags(void)
> > +{
> > +	int flags = cpu_smt_flags();
> > +
> > +	if (olympus_prefer_pe0)
> > +		flags |= SD_ASYM_PACKING;
> > +
> > +	return flags;
> > +}
> > +#endif
> > +
> > +static struct sched_domain_topology_level arm64_asym_smt_topology[] = {
> > +#ifdef CONFIG_SCHED_SMT
> > +	SDTL_INIT(tl_smt_mask, arm64_smt_flags, SMT),
> > +#endif
> > +#ifdef CONFIG_SCHED_CLUSTER
> > +	SDTL_INIT(tl_cls_mask, cpu_cluster_flags, CLS),
> > +#endif
> > +#ifdef CONFIG_SCHED_MC
> > +	SDTL_INIT(tl_mc_mask, cpu_core_flags, MC),
> > +#endif
> > +	SDTL_INIT(tl_pkg_mask, NULL, PKG),
> > +	{ NULL, },
> > +};
> > +
> > +void __init arm64_init_sched_topology(void)
> > +{
> > +	if (!IS_ENABLED(CONFIG_SCHED_SMT))
> > +		return;
> > +
> > +	if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_NVIDIA_OLYMPUS)
> > +		return;
> > +
> > +	if (!topology_core_has_smt(smp_processor_id()))
> > +		return;
> > +
> > +	olympus_prefer_pe0 = true;
> > +	set_sched_topology(arm64_asym_smt_topology);
> > +	pr_info("Enabling PE0 SMT preference for NVIDIA Olympus\n");
> > +}
> > +
> > +int arch_asym_cpu_priority(int cpu)
> > +{
> > +	if (!olympus_prefer_pe0)
> > +		return 0;
> > +
> > +	return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 0) == 0;
> > +}
> > +
> >  struct amu_cntr_sample {
> >  	u64		arch_const_cycles_prev;
> >  	u64		arch_core_cycles_prev;
> 
