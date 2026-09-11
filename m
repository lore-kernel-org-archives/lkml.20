Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012051.outbound.protection.outlook.com [52.101.53.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5716346D548
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117886; cv=fail; b=bzCyMyi5ikYqGh9ItFcJh+fQMN3sjnBpVyaZHbs387PT5tjY69qToBBp1PIaD7/tv+K/pvfNqPknYInO1byqcBNhiIhFSf5O2/sZwusjK4YKk6p8ylxRg5FpehzaMWssI/bA5891oHAbRbR7oU4sRMxQYI9y6uMwT5A6F4gTGFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117886; c=relaxed/simple;
	bh=tGVZozFIn2rMApTkySAmw2+WpqfWvxZLPDDiYEQCTRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eFuUwLct+sLx/9X71EnGatNHLPnHYPhs4MbVJ5ir4PK2aPofvvw0cUMpip3o7x8CmCwWExTtleTFQBRY7sa1idpQdYsMWvJDOgEe/dFJqwKyhFym6l27zvcx5CW7OuaJOYqn6SgX58nDR3jemtzaI/vQJRPf0R1ib+TxpNXzQ0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MvmbZt3x; arc=fail smtp.client-ip=52.101.53.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MvmbZt3x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5NQb1guXagVllRooLwDCyjyV/msURwZuRqksPyVS8VBrD3FNVwpCck4H9DTHOziaoLjueLBPupGIXL4AMUjiPFyCkWKaPATkTjm2gwH6+BCfCNcH+29ZxOlzgFh7A1hH3UT7o2DF0e43ghVtSnaPooEfB8MU6jmvUXcbXr6QvmMHckHkleW4Cu3tXdpRUal6qIuf2lD7p9j6ip+iO7VpvbFwNe9PaD+FAMtkXaeMPIwNtlf7syBzSvsiYNtXEcRk6U6X1GiFDkgkAaWN4mtLG96n+0m1cb/ryLQHtb/ZbRpaCRNUFhspHTmUeK8MIaakICVt14VYceHfLNkBj6dEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W25+wRpoT5FmrPKRz7FlvVkM5WlWhH4E1k/AYUHT/yU=;
 b=J9xMO1Udu5nFwWoAacVO4I+t0oXTf59KAC4JmBvGSOe6d5RqVWMsbeAPKFA2jW1Sg4PA9w2dfNm1+lPqd9ZZkyw7WZY9tbOr1T8zeToXdJfL3c/hdqTWGFh/DdK6hO2MnB7xkZVSXIMwgjQMOigZ9PI+z2m4X5N63T65wsVJI47O48tvkiKjpgAm0QvigqYJX+PAi1t08SOWxU36b5T31AaLXRKHvJNcqqCfU064KWylIVTSdBhiSAwr2p6gOmVCMqonosnwsEhfiwe7vPRsEDbdJ3Ie7z0mx0go4df9Ih0RgD4v4IRS7mWuIetQKoS+i8aP6TWx+xuW4WwcAa1yFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W25+wRpoT5FmrPKRz7FlvVkM5WlWhH4E1k/AYUHT/yU=;
 b=MvmbZt3xcHuQ8lwRDnkRaAcxdcc68qMII6h60ZrS3SuifH3w5WdO4lEjhYhQ9d13We+B0988UkL7AWHpUG3dSaxptOhuXI9GT6NfqXpLNSoa+ufbrRJ+ShV1GghBd8jCtSx7IZRrge+fsG2VaryS+4TKuzuZkAPsBv27V4ZLowByHnq4FpCtDFrp0lH6MIGIqb4AkfxOpKvsy1hbeK8eAu2M7/tcvhjiE9lpWrJDXDUVKB4Dt13lGhOk8VMdC1uOikcxfGeDw5te+SLL1O6NpPGxRFCRxaodTZzJlHUJdgfWrjKS7mYpPKxgWI8UdgTX8djkxv5hRpHeo+kjX9FVcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by DS2PR12MB425616.namprd12.prod.outlook.com (2603:10b6:8:401::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 09:11:12 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:11:11 +0000
Date: Fri, 11 Sep 2026 11:11:01 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT
 cores
Message-ID: <aqPFpUw9Y4Ui8ia-@gpd4>
References: <20260909062649.469633-1-arighi@nvidia.com>
 <20260909062649.469633-2-arighi@nvidia.com>
 <89694e14-4be8-4c9e-9d7b-2808f87dd95f@arm.com>
 <aqGGlNce4TRLS1cW@gpd4>
 <1528999e-eb59-416f-b18f-2a7667e61a90@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528999e-eb59-416f-b18f-2a7667e61a90@arm.com>
X-ClientProxiedBy: MI3PEPF0000753E.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::4da) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|DS2PR12MB425616:EE_
X-MS-Office365-Filtering-Correlation-Id: 565ca042-366f-4a4d-0884-08df0fe49fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|3023799007|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	W6RiSzKuCal3su+JkY9UJ9Wq7zoOLwx2rtoYgPujiVT7FJDrKTGjPWeCHN4zvpsORRoXj3TWlouQ2JMWbJSrTllTGadbFdgOm/J8JTtPsOBCJD29aGgg7aiG0BSztjOykbL5fF3IjwugHOQ8XdYTzlRCzxYvLL3QeGE18113ItVPzlmznN7XofKlMaUD6oWnE8YSnFbruzTXxMrGdLCBg7mCu8VP/q5JIr0scbUFOWfyZVmgArMMx9Mj5zXjRx8EB66DaMS//TtOo6RK9AAxIM7lHMMF7nYPa/jv/9HTj16Xz3r7phy1tPWcSO6jd9YyoBRg+T5aUj6v6i9cAaPhpx8yUI182XT3S/pMbwK5eqppZOESULmRvtCb+D8AyKsHLzYmOr5jnNX9s0qHsfpAiy8SBwb0ENipOjtWlKTUQt0oLgaOc11rO8g0++cHnWL8gE6wWKyyS3zErVuCO/Pm0Sab7GDvwHwt6LEh8s5YtUk3PlI67PR2WL3k+VmNv5orhaBrwsr+HpztBraESmGm/FiFTP+H6F0JQPo0Qu4fR5M1oc9RWRJ9hVgeotCxN/Ay8vxKzSllajPWsEV0cmwM7th/pfuGMH+WLCYq5Lgdl5CqLFTa0/pdOcYE+jv8FoANHQRn4Qm7pqfOHjphz8B/qEa17L6/+1Ib1b4Bd2Y2g3c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(3023799007)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gzGV4haMmds1pC7NoOiJVTw1VbLCtyN+moal+B2U4KLBQVqx33C9HBC0D3Yf?=
 =?us-ascii?Q?F/AK9G5d0GfS25J3SYxj9Nua551lypLDWoxx4AOuGaMlf74H+Bpqnuo4P7Zj?=
 =?us-ascii?Q?xL1fPZqI/qjUz1VUZ+hsWqVYvZFJUf9AulTKR0W1fkCTi/qM0ksm/ggicRgP?=
 =?us-ascii?Q?B9xdI5CbOq1m8lahCjPJHAuddSSL2jsGCjMH6+7r5j55sPcDvCGBXhsapmGP?=
 =?us-ascii?Q?oyEadFnUBnRtPmjL0z8ecD8jeZwKsQx8x3d9AQbsZW33ZgMsMOuoA9WOJpV5?=
 =?us-ascii?Q?z2Fj7IZwkD07/F7kRCAe9gugAXR+e+YIvCODamR+2f5QHDO9+7X8gQaZ9zZb?=
 =?us-ascii?Q?7QuKYAsIsRQtit6OtJbLxofD7fW/vzzl13xU4eqHpRFNY1WD5BhS9l6oz0T4?=
 =?us-ascii?Q?LL5gX+vFLy4EY2K2Au1evRRa95uO5xYaRRtGdMCM/bHi+rjWiATFtuutkZkU?=
 =?us-ascii?Q?v+xOP5dvgzy6Dsq9eSsXYsP7GIlCE+SX5XpHvhEqC2zolboW1hloqT3yBc53?=
 =?us-ascii?Q?R+NQSquXpZq9iNC3kpcErVdsfK2e9MnC4aHNMm9hKm+7p3cPp28Rtw5NrNOu?=
 =?us-ascii?Q?pPUSfPJz1B9hmsc2Tx+gAv11nMC19+/UFTMZxpTeJ+WQDak5fCnpoF06KA2n?=
 =?us-ascii?Q?XbwEnDQe8vpX4kUXVqHRscJX0sHoxujAofj0lwPkFhuJygk0TwDWNDdpxNkk?=
 =?us-ascii?Q?1Ugx/jpmyrHZB1GWU0szwVGhzMAEHrabfFnj9Qmy0KmVvF9G9eqTiXJwaSSt?=
 =?us-ascii?Q?NYGePZdqHH5H4mFrnX80qEv7thnC6VnfxZgVMVA00PXHBbOIjPWAliciy+Gc?=
 =?us-ascii?Q?xgBGhG+lohHFxkS3mz91GGVEOgU8H27plWZ2OMDRp3X0E/l0HObTPgkZO9cE?=
 =?us-ascii?Q?ByT93cWjUt7h7Za7p9lx+wvkU9UlUm1IXJu5uEeAaTHumJfkUU8IwFkMHkMi?=
 =?us-ascii?Q?iDk9+SNXyU+CZ6ZFUvcN9j0L609LwvVpN6YJ1VrjijloMtOHOrFNuWZHGNt7?=
 =?us-ascii?Q?CBWD+jZLfOTIaXnKZOGda6UfbbSHUqrGz7wTzdqJiDc1VtLlfSVpLpGQnjQC?=
 =?us-ascii?Q?dZPjj/iYVWJRFebaQzpQpNRTnzaTE8xalnhxKFm2M7icsdjhm33Y6q7vCDtr?=
 =?us-ascii?Q?pqBBMQlbKDadDmyj0r3UX6DpYbo+XwLmZu/AXyUOKLLpbJcYy8wfy0jGtqD+?=
 =?us-ascii?Q?Ii0AQkwK1p4Lg/RNiXOApJj2rLhyLbNqAAX6EQeeGMSTjVnN8gETa6+pw/4a?=
 =?us-ascii?Q?LsNMdK90Xk2NZwvA1MaTgsWKcE6JGVE3noqigtwri7ZmeRmqXUxE20JM3qMi?=
 =?us-ascii?Q?ND2L07wGvqMO6P6IgKVRh/ttbKsCVdGatM8TyIVffbEzQa2KSqkd3c/fWwhm?=
 =?us-ascii?Q?h5rJLba5cB1X1FVo2yDc8FuUFdAWmPg+A2fF8M3I+bn9r3BY2IrRMGjBT4D6?=
 =?us-ascii?Q?wRWbutNrrX8oFxQBiO/8jzfPQ/9t0HCyOpDD/VG1lPLfdromjPhdWpVrlD8w?=
 =?us-ascii?Q?MxL32+tgQjF5oEodJa65Aezv8OgrNrDmDag5Zl3O5mwTgcVWn5lOUTCnuAPd?=
 =?us-ascii?Q?0Y2XPrvFiAMcXyURacB7+eKh/n9a11IFNftX3qSO5zlSmQI4BEjOEY6Rv5JM?=
 =?us-ascii?Q?R1AERa+nGZh4fKRcNUH7ciONOapl3N7GOhkOPGi4wP4Y0mFwAKkPQ2fvORA5?=
 =?us-ascii?Q?X6f1/BjzHMUO44jqv/1cwzARpxUVB69vfIvQSoRmL/1Zb9V3AiXqG3fsAdQV?=
 =?us-ascii?Q?BTFn2lwflA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 565ca042-366f-4a4d-0884-08df0fe49fa1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:11:11.7376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dL2hMPO+NAVpKVxoVvHq7KRSKkdvXzl3+xC8VDtxsnkD5HM1OWcdAAGmBYN53zIoU3rof+PisdY+z+9648YSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB425616

Hi Dietmar,

On Thu, Sep 10, 2026 at 12:11:06PM +0200, Dietmar Eggemann wrote:
> On 09.09.26 18:17, Andrea Righi wrote:
> > On Wed, Sep 09, 2026 at 05:19:08PM +0200, Dietmar Eggemann wrote:
> >> On 09.09.26 08:26, Andrea Righi wrote:
> >>
> >> [...]
> >>
> >>> +void __init arm64_init_sched_topology(void)
> >>> +{
> >>> +	if (!IS_ENABLED(CONFIG_SCHED_SMT))
> >>> +		return;
> >>> +
> >>> +	if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_NVIDIA_OLYMPUS)
> >>> +		return;
> >>> +
> >>> +	if (!topology_core_has_smt(smp_processor_id()))
> >>> +		return;
> >>> +
> >>> +	set_sched_topology(arm64_asym_smt_topology);
> >>> +	pr_info("Enabling PE0 SMT preference for NVIDIA Olympus\n");
> >>
> >> I'm not really a big fan of using this arm64 setup for NVIDIA Olympus
> >> alone here.
> >>
> >>> +}
> >>> +
> >>> +int arch_asym_cpu_priority(int cpu)
> >>> +{
> >>> +	return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 0) == 0;
> >>> +}
> >>> +
> >>
> >> This is done since it will only be called for NVIDIA Olympus since it's
> >> the only CPU model enabling this. I think it will work but it's still
> >> ugly :-)
> >>
> >> [...]
> >>
> > 
> > Agreed on both points. As mentioned in the other email, I'll coordinate with the
> > firmware team on a proper ABI for describing the PE0 preference. For the systems
> > with the current firmware, I don't have many ideas on how to enable this... a
> > special scheduler facility enabled via kernel boot option? Other ideas?
> With the explicit kernel boot time option discussed in the other thread,
> how do you want to code arch_asym_cpu_priority()?

Good point.

I think we can avoid an arm64 override entirely and rely on the default
implementation:

int __weak arch_asym_cpu_priority(int cpu)
{
	return -cpu;
}

The boot option would only add SD_ASYM_PACKING to the SMT domain. A rough
prototype could look like this in kernel/sched/topology.c:

static bool sched_smt_asym_packing __read_mostly;

static int __init setup_sched_smt_asym_packing(char *str)
{
	sched_smt_asym_packing = true;
	return 1;
}
__setup("sched_smt_asym_packing", setup_sched_smt_asym_packing);

int cpu_smt_flags(void)
{
	int flags = SD_SHARE_CPUCAPACITY | SD_SHARE_LLC;

	if (sched_smt_asym_packing)
		flags |= SD_ASYM_PACKING;

	return flags;
}

This would make the option generic rather than specific to arm64 or Olympus.

> 
> AFAIK, Arm architecture does not require the first/primary HW thread of
> an SMT core to have MPIDR_EL1.Aff0 == 0.

Agreed. Using the default -cpu ordering avoids making any assumptions about
MPIDR and consistently prefers the lowest-numbered logical CPU in each SMT
domain.

> 
> The closest I came to you setup in Arm64 is a ThunderX2 SMT-4 machine on
> which I can run 'OpenBLAS benchmark/sgemm.goto'. This machine has
> symmetric CPU capacity though like Power7.
> It has MPIDR_EL1.Aff0 == {0,1,2,3} for HW threads but '== 0' wouldn't
> work here.
> 
> [...]

Right, -cpu provides a total ordering for all threads, so this should provide
the expected sibling ordering on the ThunderX2 machine as well. If you're
willing to test the next version there, that would be very useful!

Thanks,
-Andrea
