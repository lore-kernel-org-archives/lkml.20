Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011018.outbound.protection.outlook.com [52.101.57.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ECD413786;
	Tue, 29 Sep 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685111; cv=fail; b=qOt5N0PAnpKP0c5MZI84d6fuG3u76OZxvdexmyUD7I8uvuHbXBVaR0jJsQkan4wt65Dp598qWyjj+opHNscwFldHc5voB5MgW2HMdYEsSxsAD4gkQW1UQUtM8H9RoruYMYd64Z1r/Aq47XVLDMRcrdpqnZO9i5z2DIDqkiCibgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685111; c=relaxed/simple;
	bh=oRxxL907XiatVXTyR8B/sG7/41wG2XHYsxx7YED8Uw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aj6ZYC/S1X7kgBTw45bs+PJ0CJ0jMHYNKF/PuaxUhoPdv1Hi+NEa97AmrRkxkEijwsxYYcDAui5ktAcK0G23hHos7HFnBeZzwxEm2zSOeUBppJsNRdyPyyG/sFIUEEU1CZw4jqvvq54jMZUkey3zb6DKlZnyBPOtDJfVoPoPK24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SdgPA2h1; arc=fail smtp.client-ip=52.101.57.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SdgPA2h1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+uHNkU4AHo8sd8mh6KebWZyuPfF6eGZFPPjul3SXIKVYxu8hdYnAQth1T2aCvD5QtmuvAARD5ZhF9VbPe/lS3gB4IWyGAke311w8RLtJTjUBPhSWin5fIIr7IDSjY0KzMnZ6yDItAKtOiV8nBYg5G8Uki7+6lkwl3zniP1+23jgknrPtKcU5OU1n013sxTDSPF1DaxHJqW9oQn3oVm7xDKf73hzG2R5GKZ41DZQfdtOZCvepVfM46schiGTRINhf2zs714noGiKqzUub/IogbOeT9qWT6AYZ0CwNiMEiDouKGx1TPaGC3EPjx+zOipKf2TbnjRLTOnIdhuOlkyVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOH4Vsp8jZXEQQ5s8O1NkUOqioGS+ov+6uLNwVGwtLM=;
 b=jItOD/U+20JbBks62mEI8WbM5g0eQ+Ak5HM6KDlH5Np5UWj0JSUw3PfJIT64XWfpDaaWzNqmpfjpBGkSyKLsetG/SiRl2Xd/N1SPmZnPfIk2da0t7Nmx4Fx/yYxMn8zkToyHy6zU4Crxz6nEG6ek0CKqT+jj2tU4IMdL3g310p8NsQXtuL5bI2MDmc40l+dBktxmOwcY57zZH/an0eq63YY8EfY/QYSlFBFsUl+tyuuOHqPQQg2tZRvGHTwE3vRQVJ4hyr12cPpjWWJ9IINH64HIIZ3HbS6f9XpReFxP24god4g5T68HOykAv42EFfpUQ9cy07Wqt83Cc6FBjx1Iqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOH4Vsp8jZXEQQ5s8O1NkUOqioGS+ov+6uLNwVGwtLM=;
 b=SdgPA2h1bxYLSPypsHOOqkBjXKermnlZUWuRyUQ0TUm6ZXDuJ/vkNvmdsXubUbaS4YsXpAAi1LejihKK53yuc4yMU7YNrynhz/k8OqEEfoTTLHYL0vmI7jy7XdH/eOaD3GwX5Ew7lbZTTwZ4opUthh5IW9yXgrWtTpgEjhP81qEMkRLu+jlVP6L8E9yHk5VEBdtjZDUDlesWacv6KFrw7n1EtOAY0xOJvTjK5FkSaRu81JyqWoZJNl6kb9E28JHPfnedkY60ZYkTRWCkPYQvYAzSiHR4Pz+uZnxgpo4hShaYeChkqTeEOvg6gOZsiY+UIqH1zqpr6/inTp48hzDoEA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SAVPR12MB999145.namprd12.prod.outlook.com (2603:10b6:806:4e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Tue, 29 Sep
 2026 12:31:41 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 12:31:40 +0000
Date: Tue, 29 Sep 2026 14:31:29 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>, Breno Leitao <leitao@debian.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lee Trager <ltrager@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/2] sched: Enable preferred SMT siblings on NVIDIA
 Olympus
Message-ID: <aruvoVH59aZ4vL1Y@gpd4>
References: <20260917140707.3807229-1-arighi@nvidia.com>
 <75f23add-e27c-4749-8495-d29388b6ca56@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75f23add-e27c-4749-8495-d29388b6ca56@arm.com>
X-ClientProxiedBy: MI2PEPF00000B88.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::406) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SAVPR12MB999145:EE_
X-MS-Office365-Filtering-Correlation-Id: 40648531-a8e8-45da-aede-08df1e259ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10067099003|5023799004|11063799006|18002099003|3023799007|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NW8y2MFUWsYJUV0S1gb3ZMOV4qzCQcY4XU7hiysD+XsCsDeKif/LBDeVjA19MzARFsShr8qtCKozhmHbkFHAx2GX+MzNlRmri8fl5OWAlKT1VbhiqkaioZg2N1fbuTLPIqUIyiLvutqTxS9qigTyszPoJxtKStkOLaEOXMDrgD/+bPvEk1BUpR6/Ncs2GUf/hrcLghnpgZ7Gm/3XUsrhZtec6v9dYZxBtUeFSgEmTJr+vQ54bmWIRGODWpvhL7YnblgJgsVsloYZZ4Z8kHXnR9KX6E4n2A7iVJkhX3KbfQ1bhF4dio/ZFzqvrbS4psE1/ks22Y8GBBXZXCx8PmFVN+g7r19OAjQPamLCn3SqgQLRNnL4DyF6e76LUhSC0fEk1R+fSmaYVQUeCMdQ+EhkD1lwiQtL/8PXGThtO83mR6HZA3ngGyaxWZ2JljiDh7i9WgpJjAeJhuQ89V2Mcg9cwKzhtdle1ZDB7i+9zBW0+KDibFXmDc4EKc6KwaIFXbcO3SU9uGZ/XPUp3+DnLyCAkFbZ890X35U+1lnuaKOO49NOIqUnIrC9uzHMrsYW+0KngqnIODKFU6sS0CxFEo3iK2Kh4HWKERcnAW/mYOoFX1Fp9bKfu8fjELAzJy+JsNR2YJjP2LZPqa/YWJXBIWeq6j84slIiK2SosNAuCQTrpIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10067099003)(5023799004)(11063799006)(18002099003)(3023799007)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zZ+MNSvHVlFNbe7F9TcTbI/uIdTOYwN/8ba+1KVzqHUu8YZ3VcverH7xceIW?=
 =?us-ascii?Q?DS13DcXdfsiCSMQiysf1Vs+xewxqQkDfRqM7OnHHzfnr18EYmduCXLbHH38w?=
 =?us-ascii?Q?hbShchwcYCPn0LTv4Mr91GFVPS6MePMH2ULtYsZucDQby3oYZNQVA+nNEUmw?=
 =?us-ascii?Q?qeT0g6oGcK2+Wi8tNLW97Gc5NBArKxYImh3ZV57kX21uv/laclY7wphvCjMH?=
 =?us-ascii?Q?di05C1jwVv73+OsouiMd6OGTt1xA1TQqLPi1TzkIPSLPAkYrOacsFGUuEWWS?=
 =?us-ascii?Q?AZnWSzRd2w6Ghg2NnkuUOchrFHC/azkOGMwrj/PgjHp9g6UeCOQJ5lvw0bJ7?=
 =?us-ascii?Q?urx0LopaaSTAqqTxbnQr5p9isklJWazCORmA7MauwXguQqlr1LFbZ6qjDNib?=
 =?us-ascii?Q?TnmJjtBhO9H8jmAS3AiDPo8YJ9vqRILpS1V46R+VEPhyFEprZZdAg8dAqVlt?=
 =?us-ascii?Q?6ysldDLwCNDQ90uE5zMq7SNH/+SHxeEniOMtJpq1q78nC1omHJNMb+JehIFj?=
 =?us-ascii?Q?KQQ5qbMfhWHRoIsBJ+E7oljZzmdDR2F27h4A/bTDabcxDOmtWmc/K47c10sB?=
 =?us-ascii?Q?IfkLloiixMoM3wC7M5hjuq8mW1uYGFkLDIDqa+OSDLA9AHF82Wwv+9/WNob/?=
 =?us-ascii?Q?d+dHttph97nTLg18VEnZOl4QTs9a/WOQ0yqHiJB1UlBZRLuDQt+rupRLdrXR?=
 =?us-ascii?Q?BGGc9MSZOqXmqqaJdzbKVeD1CBKUMEZhwaWTjNQ18z+3Z28SS0iNTA3Gpynv?=
 =?us-ascii?Q?L92LHuwysEm3XoTGkxgbaRIKuBszn930BCg5+sQI94yHpzEe8ndJmmdwz3oU?=
 =?us-ascii?Q?hZpIfvJ3CciMCVQAIOShojazCZ2iqB1O2nFZQ3vIZLAfaIS76IsYgnFidI1+?=
 =?us-ascii?Q?KGKFrpi2tBMM3jYi7qHuQd9v+dCNhzrR8D9J1DB/esfcRabdj5CtzHi54KMx?=
 =?us-ascii?Q?NXRKEh4sMnYC4nOrfCPV5/4RIDOsolO3GCt7gymbLTPjiA1SUotHof6l0vTu?=
 =?us-ascii?Q?L0GGT/AJGipu9FQF6bTrr5v6G0N1P4KxflBGYsNdc06wc8x3ek4o1G6Z4Mup?=
 =?us-ascii?Q?CuoWEOx4vtwngq0ZQbGL+fyEuCEM0MQN6xNWHdTIEuYtm8nlUdXTeIZ5sbWd?=
 =?us-ascii?Q?ojz41oXwtkOVh0Cm2NnPSt8UOYpKybJoZ50WWdgGJ6CceA1bLrvvsdY7aVKq?=
 =?us-ascii?Q?oUUQZNc6KMXF2AgjtgC9TOWKx4OYq5lDjWZ77gWoDQIF1+K1/wGVadUDmsbx?=
 =?us-ascii?Q?ssSMv9JttOlEYVz3iF5yo0w/o0x64Of0ENHGXNwodjNpjfMAh3xB1kSwxKvq?=
 =?us-ascii?Q?4u4KqIbZIQMSqIJLNledVEa7DkUJia258dYPMrJEw2HT5oNZgcJ7kPhd9yUk?=
 =?us-ascii?Q?U9+bpFXzGqf4ZwjObHnQsK9Wfb4ODkV1TqLCuRb0GvwFsNUx6eI/9dbCECfa?=
 =?us-ascii?Q?iZ27khbENn2RvsFZEw0faIGLc44qej+WfmiCdea6WTpKlOvZixwb8MYXnwaE?=
 =?us-ascii?Q?DsT88TjhePzttPPDPnq0nC4xYarogLTb4NWWQaZJSogqC4drjShJrL5qIYNh?=
 =?us-ascii?Q?cTZii4xB9Hn6iAzF5Ip4QDqYlRBETligyzlW7xPRVYITo+oBI40nG77ozLej?=
 =?us-ascii?Q?a8xAIILSPi9scvd06cUWIr/cf7MaCj1V4FC0NoL/barLxFhDjM81QLEb5K8N?=
 =?us-ascii?Q?W7dcOddFyYi5glvflRnVvaBTjNrDtAjT5c7ZH6yRmJRk54Y0yJfaLJsvJnTA?=
 =?us-ascii?Q?8RpNVI335g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40648531-a8e8-45da-aede-08df1e259ce1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 12:31:40.7331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ku0NNdj546LpwIHz71HNzN0Lp3R4el9tRqsCAwz4RCMgXijpWDHQVd0BakMa+fUY8PwfjRbKL/KoBa1huAzlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAVPR12MB999145

Hi Dietmar,

On Mon, Sep 21, 2026 at 11:04:42AM +0200, Dietmar Eggemann wrote:
> On 17.09.26 16:05, Andrea Righi wrote:
> 
> [...]
> 
> > The first patch teaches the fair scheduler's idle-selection paths to honor
> > SD_ASYM_PACKING at the shared-capacity SMT level. The scheduler first selects a
> > candidate CPU and core according to its existing placement and capacity rules,
> > then chooses the highest-priority available sibling within that core. This also
> > completes the existing POWER7 SD_ASYM_PACKING behavior by applying its
> > hardware-thread ordering during idle selection.
> > 
> > Olympus firmware does not currently provide an interface to describe the
> > preferred SMT sibling. Adding such a firmware or ACPI interface will take time
> > and will not help systems with existing firmware. At the same time, inferring
> > this policy from MIDR would encode a platform-specific decision in the kernel
> > and make it harder to replace with a proper firmware ABI.
> > 
> > The second patch therefore adds the sched_smt_asym_packing= boot option. Using
> > sched_smt_asym_packing=on explicitly opts the SMT scheduling domain into
> > SD_ASYM_PACKING without requiring architecture-specific detection. Priority
> > remains defined by arch_asym_cpu_priority(). The weak default orders siblings by
> > -cpu, consistently selecting the lowest-numbered available logical CPU.
> > Architecture overrides remain authoritative, so siblings assigned equal
> > priorities remain unordered. The default auto mode preserves
> > architecture-provided topology policy, including the existing powerpc behavior,
> > while off provides an explicit override to disable SMT asymmetric packing.
> > 
> > On Olympus, PE0 and PE1 have equal steady-state capacity; this preference does
> > not identify a faster PE. The lower-numbered logical CPU is used only as a
> > canonical choice when both siblings are available. Consistently selecting the
> > same sibling avoids alternating the active PE across wakeups, lets the other
> > sibling remain idle for longer, and allows more cores to remain in, or return
> > to, full-resource single-thread mode.
> 
> So I think that Power7 and other SMT machines won't ever turn
> 'sched_smt_asym_packing' on then.

Right, POWER7 already sets SD_ASYM_PACKING on its SMT domain (recognized through
processor version register), so it doesn't need the boot option.

The boot option is only for systems such as Olympus whose firmware doesn't
currently describe a sibling preference.

> As we have seen in https://lore.kernel.org/r/aqSEB2N_NQbBVab6@gpd4 this
> code will only benefit NVIDIAs Spatial SMT, i.e. dynamically
> partitioning a physical core, rather than conventional SMT where two
> threads opportunistically compete for most of the same machinery.

Right, on conventional SMT systems with symmetric siblings and no
architecture-defined priority, I don't expect any performance benefit enabling
this option.

> 
> IIUC on Spatial SMT, placing the workload on PE0 is beneficial because
> even if interrupts and other per-CPU housekeeping activities have to be
> handled by PE0 next to the benchmark tasks, the main thing is that PE0
> stays in full-resource single-thread mode (PE1 stays idle).

Correct. On Olympus the lower-numbered logical sibling is PE0, prioritizing it
consistently reduces the activations of both PEs, so PE0 stays in full-resource
mode.

> > 
> > The v6 series was tested on a two-node Vera system using 88-thread
> > single-precision GEMM workloads on the 88 physical cores of NUMA node 0, with
> > sched_smt_asym_packing=on and the workloads allowed to choose either sibling of
> > every core. Each result covers five runs.
> > 
> > Two BLAS implementations were tested: OpenBLAS, an open-source BLAS library that
> > provides a publicly reproducible benchmark, and NVIDIA Performance Libraries
> > (NVPL), NVIDIA's optimized BLAS implementation.
> > 
> > OpenBLAS was evaluated using benchmark/sgemm.goto with an M=N=K=16384
> > single-precision GEMM. NVPL was evaluated using benchblas with the same matrix
> > dimensions, non-transposed inputs, alpha=1 and beta=0. The numbers below are the
> > mean and standard deviation from five runs.
> 
> So I assume that you have 88 consistently running benchmark threads and
> in case your new code let them run more likely on PE0 instead PE1 you
> see this throughput increase.

Yes, both benchmarks used 88 threads across 88 physical cores, with both
siblings eligible. I captured per-thread scheduler traces and perf counters,
with PE prioritization, placement favored PE0 and single-thread/two-thread mode
transitions fell consistently. In the earlier five-run comparison the ST/SMT
transitions fell by about ~80%.

> 
> > OpenBLAS throughput increased from 7.11876 +/- 0.06734 TFLOP/s on the baseline
> > kernel to 7.34669 +/- 0.01936 TFLOP/s with this series (+3.20%). NVPL throughput
> > increased from 9.64742 +/- 0.17311 TFLOP/s to 10.29695 +/- 0.01786 TFLOP/s
> > (+6.73%).
> 
> I assume further that NVPL has the same benchmark task model, maybe with
> a couple of sleep/wakeups in between?

Correct, I just checked the sleep/wakeup pattern: across 88 threads, the NVPL
run shows ~2.6K interruptible sleeps/wakeups and ~3K futex waits. The GEMM
OpenBLAS run shows only ~250 sleeps/wakeups and futex waits. All those repeated
wakeups give the scheduler more opportunities to choose a sibling and are likely
the reason of NVPL's bigger improvement.

Thanks,
-Andrea
