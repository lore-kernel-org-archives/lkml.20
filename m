Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010043.outbound.protection.outlook.com [52.101.85.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84513A874B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935232; cv=fail; b=tbJBhP0B1XOB8v4AWtII9egHplwWbW7QB1hQAqoctd6cvRUzMm2cPvJky3ixV3/vaHFk4AvU7Nkr9ZXAl029qMV4mP4RS3RByRjz3PA+Luoc5PR2yrgTXh3bogxWEz3xf/bYSi8zw2hxL64hTwOU8uGKP5kn1p3LV8/Mphya9IE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935232; c=relaxed/simple;
	bh=3zhnr4vaVuot7X0O/ryQYPJ2LAgkJQkgX3MXoBzf/ng=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=S5UIgNEatN1O8vD33DPqCfISQGPRCy1ZnCgu/KhnrwxwPYoOjJbt4lrsrDWdWVz1ksXb9P0T7PkC+0S+Kpq3z2W8VW4KFTBoJh1Ng4tk/0kYo89In22x6j0sWeZJzVMGcBoZ/PcxzNs9aBDlSw5c0yAHyRBBvRGxUT2yKmJacAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qJ9H5ENP; arc=fail smtp.client-ip=52.101.85.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qJ9H5ENP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbhj8MGC39c3k/0CdT4dmTA4GCD0Vw+U5IWVCi11xkUXxw24qMPRnTv3SbRfBSoMokSIywQjKHGv7cO8RnwjtSO7tujkU81NvwMco0ouGzFKTI2QTv0y3eZIrsLnXRNPMounoqDLo1SoNZ0b9bTsn69Dv+fq4kzsEoonJtDdjeAtUQvDRrDOu9wDDFuPJrHCFbf9ZqqrBCaRyXEMo2PbX5KJHGFz/mpOO5iiuAOqi8NFNHVj6PF5wAG8cRWGW33EqaV0FGhyx2l6X2ST5nicYqsL1Kq4EH/IR6WVmzs7J1DCw1B3ZBpY5y5FpBSjz7XtMTcy8IjqdMYn9f/Ok8mCVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96yontb+vnZ371iMhYk2gX0QfMLv8wwnjZf0gP8YlkQ=;
 b=RrhTzRnjrunLQVWGY/yNifw1Bl+eD2ZdlQFyBXynFeX2StzmzruLeKE9ELfQYApCpiwKBnNy8B//H4y+jrGoy6F1RS7yalZYvjpN56iIlT0pw9Guqs1qWkdA8qTjaMuOUTdrCZw2iWGrOGW6KZRCbtFZC9XMKxjn01vKvkYA5Yys+nmja2BQfU1tlYHlnrehFQHdMWtaKUo8M2/AFzC3hxV9BORQoeA0VFbiClBxqbHcyNwnNP84DSJ3aQPIa9fTqeOtWLNDhppQlpRFulr8i+U/n5rp71IPgHH9GoYLk7sDZ7+gJ/P5FwnglgWgQLPq1JMrF56SJ4yyOelYVbitQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96yontb+vnZ371iMhYk2gX0QfMLv8wwnjZf0gP8YlkQ=;
 b=qJ9H5ENPvV7+d6vhHCxqE62MkMxrF5Gw/XupGt5SeHCzlNYqqMcEBtY8OKMB2UcP+vV3zv2qSC51KLLzATv8s9gNDvY29t/4Ft1H1Y/TiLvPu+Wjmp+ncxwttwmSSjicboSz2JKxorpNa673IfgjQxIzA67Z9Ljvbv8UijbuqcPmeKcUY/gwyx0ioM45oEPhdFZvOMmhwTNsM6G+rL+GBouUhQYIO4YPcNSFcd/IMwS9IRyC3+Lds4zyJYzB3UVOO61dYj/tOK+SVD9YGhRaozbW1dVsRqvXLaqPcEvXuUQ9eWzMIJZdZAA5x0S3R2jddLl0Cg5jVNpGuYnI4VWyXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SJ0PR12MB6829.namprd12.prod.outlook.com (2603:10b6:a03:47b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 06:27:03 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Wed, 9 Sep 2026
 06:27:03 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Phil Auld <pauld@redhat.com>,
	Breno Leitao <leitao@debian.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] sched: Enable preferred SMT siblings on NVIDIA Olympus
Date: Wed,  9 Sep 2026 08:26:07 +0200
Message-ID: <20260909062649.469633-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SJ0PR12MB6829:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ae36a1-3899-4527-f98f-08df0e3b5c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	/0qoHDhyq8zk2akk52fnmSgVGefTMOasVB48BetucBenXa+BmS9YBjNRkKifQsmW0079d5WjQnABUl+k2LtqmPL51odFwGTn5zdu0YcdZ88Zvt78yPpzyTxoFtOTpYrmAZOMHa8A7cuq9Nda6qnnXRnWB3qv4phPVT6fUuuR03YAz3OMRGHUVYzXxmfRO6xiXG66ibkbP3ahI5IWFZLCnhoG4hckmH4+8lsR3mQgqGTeDMGj0j19YanqaiiSZEJroeKBMMOx+NMguuHRmXD/ZhiE4G+rWTFwrBXhxiwBDZJHcYELZM6kd0znW9e1A2kAHmAhnZFp+n23hO3wGJ35mnJez5L3B0oRdhxrCw8av/huLkg0R6/XcGb2x2bIIzEeP5xrVCEEet8Ta8PXYpp1HbAWK/8/WzDkiLClx/JNoEBCpztSea8svVZqrpwoyBGlz1GZOOeqicsaITKQfmzciZdZl+RM0gyiTjj6yulBRqn+/hm+yZ1a65qKBkoCXQzuh1CeP0surJvdMo4HBHuZiu8rO+Bfx4hwKbRlHTF5DnH/jWygSB9QJKkr+ysgSsgxYGcViqRJvQw/2p2yce/JCoe6NG5LzAkSTuJo6cfx1WXi3FdZAeoC2pmcBjCbVPiaWUUN/MyEYHAHATlXZ0BrMdOgflGWKtxl/UAdI94ksco=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IheFWnep8FjXNfAD3ZYL0EHwb/qU/LBu5BCqi7V+kMuJwoWkZqgNRhFY2L09?=
 =?us-ascii?Q?aNIoVaO0h1V6K2HZ2eB/9NZHL7c0tBW5Rt0DsBYMKJUzbZCya0cM/shRq2+6?=
 =?us-ascii?Q?3TM/KTCs4gqSLu0rljlkqEpw1Vp5fsKDrU6cptSAdwM5VG47ss+QMhPkcDdS?=
 =?us-ascii?Q?jgLB1ZVtmtLgNAi/l9Rb1qAWhbxRrYMWPyJV7lgS9z5bj6y8Psu9BEJ5nfNL?=
 =?us-ascii?Q?wJG+kLyJsOefR4z3clfonPuewnvbSy8NGjmcWEZ3PjbqmdB8gdz2gxjX1uPc?=
 =?us-ascii?Q?5qxO1E41+q8lgyRfoXau+R2Lx0Wl9uMxEsby1DDmPtLZ2aUNzE9//IL14Gkj?=
 =?us-ascii?Q?ZZE10R6Z9kStMwrOJpHLo2qUMCcgvvlNAJuIPwFGG1WOX7Bu3pU8Er6KGPPj?=
 =?us-ascii?Q?BHVh+Nk30747HY+F+u65s14iWG4SDJu21dY1jT+1NZYE4rdrcHafGH13FPGF?=
 =?us-ascii?Q?1mRZQHZ7vBHGGJFP40oaaBTjQamyjqmMZrwglFsCl8+JfW1xfaCI5hZ0lNrl?=
 =?us-ascii?Q?CGDlQA9P4JZt4iTxPDhhg5N9gSwdsfyAlQo8oVJ15g1fWqR4Q4O2XlupCNI9?=
 =?us-ascii?Q?WGMQDCix7KYMZL3+QEzZUJD/cFj7fwVGGiA/lw1LPliHuPeIB7wdHJzm1PFO?=
 =?us-ascii?Q?xxnvshGZ7TXgWMYrIT5UluZhnS16ZSF4cZBY2+TWbLpCjnJPrC4fy2TbmohY?=
 =?us-ascii?Q?gezHSN6pTWN+XRYTiP+KqbnjegtTtlTDFhmj7L5RM3sHEbiPXtYGKtRpPSQ2?=
 =?us-ascii?Q?VSN0+jYxHkydW5NxElT6KAHxFCfDjsf6BbrElFAPmCtRFoTz8j7FeBJ4m/bA?=
 =?us-ascii?Q?ZwGh06naJ4/trIjxnpeXmRPBSgZEJddtMND/A6wsrsc7aOw2XAQsI9uuSO+x?=
 =?us-ascii?Q?8eGFAN08f/oKHc+l1wnR/SEu7t5NcOrRhZsHoXZC/lXPMbsMRfMpyEtKUamL?=
 =?us-ascii?Q?isqa4TWs4IwZmG2awPFq+9rQpFD2r9exK3gedDS/4HZO3gXa527plcntXvF2?=
 =?us-ascii?Q?gygjnym8ECtN9YyLrTT4fWpLtptwaN52bcpC9wrh50XHILYzXMLXGhy6wkQs?=
 =?us-ascii?Q?cuA/IjhD/Vr66TAD9QXHO8a3bBqpTm8G6mIoNek8NCnPKE6etY11rTqMdxS6?=
 =?us-ascii?Q?lj/b5cnQwv2SoPMILsbdCBiXBVn/7ciYO8cxn5Fmhg6tAML4sG2VmJQOBCpr?=
 =?us-ascii?Q?vLnYoisuI/+Wqyj4Jgc+coAkVTUp0ioVp2hJrH8sk4sD134WYQs0IgQatDCd?=
 =?us-ascii?Q?S0XITRml+dnoaJzZs7/IQbyQtEqwonRpXrvk3Pw//eoMsjFwJbgw6TZqQ9wf?=
 =?us-ascii?Q?W+V87H6vg9UdMoLp/q2WbEhGa8PvU+OJQh7ohP4gqDlslvj5evLEgpM+zlSO?=
 =?us-ascii?Q?23s2crnwIp49MQyhooSACUzdopgnuUWPefY48T5n7y99lxHJebkQZB4zL5Mo?=
 =?us-ascii?Q?EP/W004tPuPPml1181PJpYQ6nr3Gsg6mGPCRGrGmHqzMSK1NQYvzpa6Y83lx?=
 =?us-ascii?Q?6kDw3Fs2F3zAdBKK5Yw1RzO7R54tkyxQqBd8wO4WQqU5RQJD1IdyVXQS1t+c?=
 =?us-ascii?Q?oRO6J34lB4Fzel8HaBTtLc2Pn8ZGSFd4JtBqXYMt6JkRRtGf75yk919u4LhH?=
 =?us-ascii?Q?BpqYl4AsCnNX0rIG1q21aQ3KulPxcBnxuvJWjcjB7eOcf/Ki/vER6IiXQg/4?=
 =?us-ascii?Q?PLjuGv2AqnLVnaA19zn/BFpbZqU8rhOLxyEylx2l/xPMqPg5EyS7x4RuZPB6?=
 =?us-ascii?Q?V6PT88lyPw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ae36a1-3899-4527-f98f-08df0e3b5c98
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 06:27:03.1654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IejGdlDmK92NuU7LxZHnVYILyT7hZa96YVU+ODlbVwUIuT1a/Kyv8uluPqccRdL7lcAmVUR1q11+fj3NVhz4Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6829

NVIDIA Olympus implements SMT with two symmetric processing elements (PEs).
When only one PE is active, the core operates in single-thread mode and
that PE can use the full core resources. When both PEs are active, the core
operates in two-thread mode and the PEs share those resources. This
behavior is common to SMT implementations, but Olympus is particularly
sensitive to brief sibling activations because returning from two-thread
mode to single-thread mode after a sibling becomes idle is not immediate.
As described by commit 293f9611ae735 ("sched/fair: Prefer fully idle cores
for NOHZ balancing"):

  Briefly activating an otherwise idle sibling can reduce the performance
  available to the other sibling and this effect does not necessarily end
  once the activated sibling becomes idle: after the ILB finishes and its
  CPU enters WFI, full single-thread performance is restored only after the
  sibling has remained idle for a qualification interval (10 Ki cycles on
  the tested Vera system).

That change prevents the NOHZ idle load balancer from unnecessarily waking
a sibling of a busy PE. However, ordinary task placement can still select
either sibling of an idle core and repeated changes of the active PE can
keep Olympus cores in two-thread mode despite little or no useful overlap
between the siblings.

This series makes PE0 the preferred sibling of an Olympus core using
SD_ASYM_PACKING and teaches the fair scheduler's idle-selection paths to
honor asymmetric SMT priority. The scheduler first selects a candidate CPU
and core according to its existing placement and capacity rules, then
chooses the highest-priority available sibling within that core. The
generic scheduler behavior is enabled only when an architecture supplies
an SD_ASYM_PACKING SMT domain.

PE0 and PE1 have equal steady-state capacity, the preference does not
identify a faster PE. PE0 is used only as a canonical choice when both
siblings are available. Consistently selecting the same sibling avoids
alternating the active PE across wakeups, lets PE1 remain idle for longer,
and allows more cores to remain in, or return to, full-resource
single-thread mode.

The series was tested on a two-node Vera system using an 88-thread
single-precision GEMM on the 88 physical cores of NUMA node 0.

With the workload allowed to choose either sibling of every core, observed
throughput improved from approximately 9.4 TFLOP/s on the baseline kernel
to approximately 10.1 TFLOP/s with this series applied. Repeated runs also
became more predictable because the workload consistently settled on PE0
while PE1 remained quiet.

Changes in v5:
 - Remove the redundant olympus_prefer_pe0 state (K Prateek Nayak)
 - Link to v4: https://lore.kernel.org/r/20260908082345.103087-1-arighi@nvidia.com

Changes in v4:
 - Honor the SMT sibling priority in the slow path (Srikar Dronamraju)
 - Rename the consolidated helper to select_idle_smt_cpu() (Srikar Dronamraju)
 - Link to v3: https://lore.kernel.org/r/20260907163513.4172411-1-arighi@nvidia.com

Changes in v3:
 - Consolidate the SMT-priority adjustment in select_idle_sibling() after an
   idle candidate has been selected (K Prateek Nayak)
 - Fold the asym SMT checks into select_idle_smt_priority() and scan the
   scheduling-domain span directly (K Prateek Nayak)
 - Link to v2: https://lore.kernel.org/r/20260904091838.3617894-1-arighi@nvidia.com

Changes in v2:
 - Clarify that the generic scheduler change also covers POWER7 (Dietmar
   Eggemann)
 - Simplify sched_smt_asym_prefer() by inspecting the lowest scheduling
   domain directly (Dietmar Eggemann)
 - Link to v1: https://lore.kernel.org/r/20260831181800.1668646-1-arighi@nvidia.com

Andrea Righi (2):
      arm64: topology: Prefer PE0 on NVIDIA Olympus SMT cores
      sched/fair: Honor asymmetric SMT priority in idle selection

 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/smp.c           |  1 +
 arch/arm64/kernel/topology.c      | 51 +++++++++++++++++++++++
 kernel/sched/fair.c               | 85 +++++++++++++++++++++++++++++++--------
 kernel/sched/sched.h              |  6 +++
 kernel/sched/topology.c           | 36 +++++++++++++++++
 6 files changed, 163 insertions(+), 17 deletions(-)
