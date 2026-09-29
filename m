Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6108A5335B6;
	Tue, 29 Sep 2026 16:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700969; cv=fail; b=ZElDoe2eem9Jpn6wXig53RpPa517kltjxjiEqB645cHM4/ScPCsrAZonDJqf/r3eDeSU6REZlgpD5zvQe28UWZGPTgsU04ae5zEJ9vR1ltp+mPPv0YOHW7XjbP4qZiVu1istHhD9XwyjX9L1BlFlaednLOHHJLEb0HMdu5sl1pM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700969; c=relaxed/simple;
	bh=EYn/sblrgVsJCpTxSHV6WpDaxQkDutdn6B0MNfKEvd8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DDgUJBzuWET8ETx2yEvu8lky7B1ZjsgI0djMW6lxeesMz/4yeocwLPITx3yBvv5v9flM7IVknV+kE1Z+ZfOqIwfGqaHhPGNKY819irlbEF/70iRP/dSBT+8/0Jqe05/VDJ3AaK+SVosYJk3AY8X0o+oA+1m0MTFXGx1lUvAUcWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Dsg3vaje; arc=fail smtp.client-ip=40.107.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dsg3vaje"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OM3TAJOCnoN+IvaYfngiED+2SH7ewsbcWSbLH3hxH4JO6rIPB6OfSBefM7Ua6mwd00nWp2N9RDuh7OFrlU562/28z9s4rjYErevXcP+JnJAuxI+Bg9336//bUA9EcWQUPchQrHEDO8YRSwBOfBE4rDMN+9+ZS11GXa9Yph8xY9+5nVKIAQ25IdTa0J+P+45hwjrgC75C1VaoACcN53cHKIPxoT5GaZ1IvLFvy3ODQeuk7cjO8XUUeQKDZzr3jjeE+R4d5qMQhtmdtlBmL1jUvE+8plNbTqZmF2v6FiKl+U+kXXiAQcJEEstAiVV7aLUjY7RFItrToY88wYXKIZR2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yw5dBZiIhMGVAshb5BcPSWAJr5m4wEy/7OX5W03D5C4=;
 b=r6e0ONDdZpB9FIrobukEAd5ktL3V6kS2q1T0beeDatRx8eYk3GR5rAxZBlgNpIR5TnSZpl9YCEFjVM0yie+ABTWKw9tdpSpf14/kxFOzy+vJSCXkeroFuOGwhmFAZXJkpBPRoAlxJj4VLupTHrHjf/nXZwQqIWQOpSX+fdzXkDyGqwAwxa1X3OCkbHElSY5OMlJ4zKJTFJ2WHyG1Vrczjn//iPQIoSefO/pHoxT20rE52eOqzr3RHs6/R/JCFZ1Sy+Uo+tgVDVYwhgzrT4MJQ0vsilb8r/ao9DtODm62AO6ojgykWNYjOZA1OrNYRsnaBmTD5t7zhv6rgPnwE4gV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yw5dBZiIhMGVAshb5BcPSWAJr5m4wEy/7OX5W03D5C4=;
 b=Dsg3vaje7lwM830UVqsDQ+hjo2BiD/oLO1xTpgF/+A1HOSrI9peAI6kurCuOeqwXfzuN11i5R6FYNAmnDeNNZ7tEgW/nnAYvqXzMj9IwDXEQK2ruqKtrZkh8m3jTZxI1QL9Ve4nmZpLTI3jOBGgHf6Lq8LSBmG6mC1f2lD0odT/ekwqLCl7gA9e/VWhBv02sTyP3+5Hvs2sCP0o+PphKdVxr7DdLSmyAmZnqe1C8FChb35FGW5SHUl87buyX2ibYYd2spgtGtF3+TbjJLLVNLXN6IkmvIPl597h0pcfTsxvunHqd0eVAQemNGAneNb3scQ4c2nCyj9H1izyBDneDjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 16:55:55 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 16:55:55 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lee Trager <ltrager@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>,
	Kayra Cizmeci <kayracizmeci@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] sched: Enable preferred SMT siblings on NVIDIA Olympus
Date: Tue, 29 Sep 2026 18:54:39 +0200
Message-ID: <20260929165538.726616-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2P293CA0003.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::16) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e69a6b-b05b-41a1-c844-08df1e4a86ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|10067099003|56012099006|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	nAman7UqTwAzi1PfL7d9cnL6JjIrTM/GPjqGfJ17/IdjgXqBB4tgQ8nRwgwuY5r2/Xgq4xgEtFonpzi4KuE32DJevPcikRsxiRAy91ssQ3i5lnYAwVZVimU3p9/gxn7ek2RRiPrORmrGxvc98xbWGEW2pb2ymfGOAP9IMq3MTuUzqz498lXLZaKiczyySz70FmZj8XtXUpjmQk7S7ZcZTWrKzjL5D55ex2meEot32D+GGxJPuPI0QuTfNphtal5QQ7L2rHz7zgHQzKiUWjOg0PHCqLktWEeC4qMhlHIEUD0QdkdBcdCl+VxZDgWzmc55YUxlRCRMtY9tYPxOXRT6UqO7AtxtgTjFrLPd4tkaUgpXyCMcuteNRvpKhaQ889afWxvfSYztQnIeYU1JovPJCLmV0xjYvYmicyoTpDe31oIiTmq3kELa4Mzhs66J88HtJFNUUmLRQQNRq7mBIGkFyYn3B5oEH4t3WDKc4CBxdNnty81t3Xftt9IIJ0SyvIom0F3EVQGVXbOsQPFz2hcqzlJhD4eptw+2fmfWdklLqGEQA1RDNrzkCRjrjD8wjOffKdUi2BHwnSrWnYHPYXW1Rl1XMeSfs6uQDHq4BzznSnQukTPc32LeAe1lhrTPEguMPw7I9vaJKkfWzy1c0f9cXXmIpjw5g4HQyG1IwJKT6L0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fVU4UyNN4zMmxUwi1VkWlTn2ZYq54NEA2WjijNUC6zlaD+fBfqQC7yZBZSPf?=
 =?us-ascii?Q?mRhiboI/P0t7tjC+mtZAy7UlyCURX5GEEW9O+3nOHeRRDxVVCMfeT+qIX7qJ?=
 =?us-ascii?Q?wytGie6yRE5MIBnHZgcCf2AdtD88k8VjSJ7N3KKrTekOJGdn2uqWeAZAw70M?=
 =?us-ascii?Q?D6ukw5ukz+QVdUynlV0IUWiqu6uY02ICparSpvduI3vWs3nuO4SsJJqPGV9W?=
 =?us-ascii?Q?DuZ33fnwT4Xm4+ku7yIPF58lM7qiQJaQM4pam6Aj3kq8r9IJ+yEg6q/7/Ds3?=
 =?us-ascii?Q?fQi+Vp4N68Tz4/23RRX8m5ldRAdK2GucpnHe9wZPeFIbox+s6BXKD7sXRoHH?=
 =?us-ascii?Q?9CI3A1S+kWbfAUz1zCbUmrI2cADtn3E4V84yBZok6BUVvv1UbaOH0cKduJnz?=
 =?us-ascii?Q?LbwtUqdshKagGYMYt4+uu17PdvD3bLCxkHu2KJGtJqknYcEnqjN5BxLmm4Mo?=
 =?us-ascii?Q?zkbAJZo+U1vXVbtUWlugRum8RkCyJ18IjbTERyBkxcqYkAGckW0uVy/965Cj?=
 =?us-ascii?Q?5fTVp4bgrnXJ8LSgLDB0IO6TPJnXnElGbVmtyEB33c9g3tyvI7jXnve6F/md?=
 =?us-ascii?Q?DfDZtwc1f5KBnIA262xWMVKryvxJdZ9aA3kJDWkIDQttJ5gy2rSWmylV2WU7?=
 =?us-ascii?Q?pCvleuAtKI/qC5pSE+sXelZY0lXNBno8hMWIkrqDvXSkTRY/fF6vAWjR4XTa?=
 =?us-ascii?Q?9fZDwlECRw1QJLUslh1UcwgBSZspC1vhZPiSCBW9Fcq3JyOtjOH6Ot/q78vq?=
 =?us-ascii?Q?queJhrdfw1HUyAloSJNCXOkaOdNc/w6y2DnaOLQnL1Nf/lQ1TrNH5pHWY54y?=
 =?us-ascii?Q?428LBBSpfRvud+zcj2UNFDKtp5/q6BaRdtFuy2QRmKzjIXBm6r3lXr0AYCF4?=
 =?us-ascii?Q?CElYIMG5QZaZ5dVq/9lSU3xThWC3H/GVkQCDyRduyPlNIXgy9Uz18PekynEu?=
 =?us-ascii?Q?sHePh3E7z+3AxpafW4WnQ33ZTP6vGKP1KPPUUZJtHZ4WUI5hza6HTN90bKqw?=
 =?us-ascii?Q?IX/Y59BItHHTj3eXTFZLKYF1E11wBesXePol7r1Vb1U8/gYr4fNEmrvuHd1Y?=
 =?us-ascii?Q?rjPq+U/9b2uwqL25EaNrVzYqJUXRqVvcauHKIRqd1N+C60cwgufsMydENubL?=
 =?us-ascii?Q?XldCBSKJhhS4sG13hic8M45GGt2iz+6H15PqQ8brscXC0xb/wtRRgQMpcxZw?=
 =?us-ascii?Q?7UmDTChqX8HnKeEAkO180yzREf8KjjoBKtJI4lUx0W1yO8OxIrJ3VQG9xr+h?=
 =?us-ascii?Q?YrMI/g7fUSvITVuq8VXNcBUw5kGJWTAwQdF0Nfolc7ned2RoIZjlxrmWb24I?=
 =?us-ascii?Q?AlGtLvPppTD7WNzdv8bRJ+U4/liZ2TNAqX6CydaqTv6/1SPxn6r61/lcszir?=
 =?us-ascii?Q?XLGOT+s0XLEEAV5Z+GNkarcVSWBUhJu7zcgt3ZVuswDaI2vgneWmvmD03pz1?=
 =?us-ascii?Q?gwCdjluzQRigeoZW4pwvCWIqgPw/FhlHgih6R/wftU7QLe1MMZsKMNGKttrR?=
 =?us-ascii?Q?9XsZMGJoDuwGBhSswCwa/fwU+s3qJt048VZ07LZtYpN+Z2eNv0972A8sX/8H?=
 =?us-ascii?Q?U9vDljla8W2KBn9/bBrQIfaLONK1xNRxYs7l1w/zD2pZNoamAKhchTCtNGZ2?=
 =?us-ascii?Q?gT25lLUIZdTHJ7Mn8DET5L0HB61K+BnjEp6xp78STamxws0aB1XLsLmgYxus?=
 =?us-ascii?Q?JgzbVbqCa5YJE7+yPPZsQa/oUqS5p/BcKjxDnUEfY7u8j9gwrIVLdjgPPkQI?=
 =?us-ascii?Q?8hZM3c5Jiw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e69a6b-b05b-41a1-c844-08df1e4a86ea
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:55:55.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzmk5XdaNUq+HEp+UhPlDXLi+4QB09xfScDkyVtWxN237BYGmEjd3gZXSWYHUOXrO30OnCGxGqNSItw5OjC9pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620

NVIDIA Olympus implements SMT with two symmetric processing elements (PEs).
When only one PE is active, the core operates in single-thread mode and that
PE can use the full core resources. When both PEs are active, the core
operates in two-thread mode and the PEs share those resources. Olympus is
particularly sensitive to brief sibling activations because returning to
single-thread mode after a sibling becomes idle is not immediate. As
described by commit 293f9611ae735 ("sched/fair: Prefer fully idle cores
for NOHZ balancing"):

  Briefly activating an otherwise idle sibling can reduce the
  performance available to the other sibling and this effect does not
  necessarily end once the activated sibling becomes idle: after the ILB
  finishes and its CPU enters WFI, full single-thread performance is
  restored only after the sibling has remained idle for a qualification
  interval (10 Ki cycles on the tested Vera system).

That change prevents the NOHZ idle load balancer from unnecessarily waking
a sibling of a busy PE. However, ordinary task placement can still select
either sibling of an idle core. Repeatedly changing the active PE can keep
Olympus cores in two-thread mode despite little useful overlap between the
siblings.

The first patch teaches the fair scheduler's idle-selection paths to honor
SD_ASYM_PACKING at the shared-capacity SMT level. The scheduler first
selects a candidate CPU and core according to its existing placement and
capacity rules, then chooses the highest-priority available sibling within
that core. POWER7 already enables SD_ASYM_PACKING on its SMT domain through
the PowerPC CPU_FTR_ASYM_SMT feature selected for that processor. The first
patch also applies POWER7's existing hardware-thread order during idle
selection.

Olympus firmware does not currently provide an interface to describe the
preferred SMT sibling. Adding such a firmware or ACPI interface will take
time and will not help systems with existing firmware. Inferring the policy
from MIDR would encode a platform-specific decision in the kernel and make
it harder to replace with a firmware ABI.

The second patch adds sched_smt_asym_packing=on as an explicit fallback for
systems that need SMT asymmetric packing but cannot describe the preference
through firmware. The option adds SD_ASYM_PACKING to the SMT scheduling
domain; omitting it preserves the topology supplied by the architecture or
firmware. Priority remains defined by arch_asym_cpu_priority(). The weak
default prefers lower-numbered logical CPUs, while architecture overrides
remain authoritative and equal-priority siblings remain unordered.

On the tested Olympus system, the lower-numbered logical CPU of each core
is PE0. The preference does not identify a faster PE: PE0 and PE1 have
equal steady-state capacity. Consistently selecting the same sibling avoids
alternating the active PE across wakeups, gives the other sibling more time
idle, and allows more cores to remain in, or return to, full-resource
single-thread mode.

The sched_smt_asym_packing=on path, unchanged from v6, was tested on a
two-node Vera system using 88-thread single-precision GEMM workloads on
the 88 physical cores of NUMA node 0, with both siblings of each core
eligible. Each result below covers five runs. OpenBLAS was evaluated with
its public benchmark/sgemm.goto single-GEMM benchmark. NVIDIA Performance
Libraries (NVPL) was evaluated with a timed benchblas GEMM run. Both used
M=N=K=16384; NVPL used non-transposed inputs, alpha=1, and beta=0.

OpenBLAS throughput increased from 7.11876 +/- 0.06734 TFLOP/s on the
baseline kernel to 7.34669 +/- 0.01936 TFLOP/s with this series (+3.20%).
NVPL throughput increased from 9.64742 +/- 0.17311 TFLOP/s to
10.29695 +/- 0.01786 TFLOP/s (+6.73%). The lower standard deviation also
shows that the results became more predictable. With the series applied,
the workloads consistently settled on the lower-numbered sibling.

Changes in v7:
 - Accept only sched_smt_asym_packing=on, drop the redundant auto and off
   modes (Vincent Guittot, Shrikanth Hegde).
 - Link to v6: https://lore.kernel.org/r/20260917140707.3807229-1-arighi@nvidia.com

Changes in v6:
 - Drop the arm64 MIDR-based enablement and arch_asym_cpu_priority()
   override (Will Deacon).
 - Add the generic sched_smt_asym_packing={auto,on,off} boot option.
 - Use the default -cpu priority ordering instead of interpreting MPIDR.
 - Drop the SMT-specific asymmetric-packing static key and use
   sched_smt_active() (Vincent Guittot).
 - Link to v5: https://lore.kernel.org/r/20260909062649.469633-1-arighi@nvidia.com

Changes in v5:
 - Remove the redundant olympus_prefer_pe0 state (K Prateek Nayak).
 - Link to v4: https://lore.kernel.org/r/20260908082345.103087-1-arighi@nvidia.com

Changes in v4:
 - Honor the SMT sibling priority in the slow path (Srikar Dronamraju).
 - Rename the consolidated helper to select_idle_smt_cpu()
   (Srikar Dronamraju).
 - Link to v3: https://lore.kernel.org/r/20260907163513.4172411-1-arighi@nvidia.com

Changes in v3:
 - Consolidate the SMT-priority adjustment in select_idle_sibling()
   after an idle candidate has been selected (K Prateek Nayak).
 - Fold the asym SMT checks into select_idle_smt_priority() and scan the
   scheduling-domain span directly (K Prateek Nayak).
 - Link to v2: https://lore.kernel.org/r/20260904091838.3617894-1-arighi@nvidia.com

Changes in v2:
 - Clarify that the generic scheduler change also covers POWER7
   (Dietmar Eggemann).
 - Simplify sched_smt_asym_prefer() by inspecting the lowest scheduling
   domain directly (Dietmar Eggemann).
 - Link to v1: https://lore.kernel.org/r/20260831181800.1668646-1-arighi@nvidia.com

Andrea Righi (2):
      sched/fair: Honor asymmetric SMT priority in idle selection
      sched/topology: Add asymmetric SMT packing override

 Documentation/admin-guide/kernel-parameters.txt | 12 ++++
 kernel/sched/fair.c                             | 85 ++++++++++++++++++++-----
 kernel/sched/topology.c                         | 18 ++++++
 3 files changed, 98 insertions(+), 17 deletions(-)
