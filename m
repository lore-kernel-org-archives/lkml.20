Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012011.outbound.protection.outlook.com [52.101.53.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28A93BF694
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513540; cv=fail; b=nHuehNND6ARILA/f6Mv2mvxo51QzVYbOSKgZ17XU/GSwgoWbiYkVSPMtyI4hDjueuzQxc3cMPID/yVybA83EAuKVZcfOS/GnbVzisnhUVERHTcqFflKqJyq5ekKZaLdJ0mOFvVVWRD8FGtvAOAsGoNRRhtDf/alvqYkFAxcl4a0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513540; c=relaxed/simple;
	bh=7M2SPmFTyTR60vZUUSODFnI5AX5DLRHSjIj5jFQFY18=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Gvgk+SFYSOTHtqr2HEvdVO1cjxNACrGMVzE7LSoacH2TVMuwAGlSXoMdc8dtjVawQPvlStwOIWuE5uNi+eh5WF+XsI477wIm3TB+Ua5dCAfSqMDPAcwRtsavLwxNLH7XbL3/v9tlKsVtiqXxPMRXvy+eGn21FZ6nlxtmBlRwG0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qmNCsv46; arc=fail smtp.client-ip=52.101.53.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qmNCsv46"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKdpj5pCYBh9EUoQdwUciE9y3byOFjTcCNULR3PvoPOjW7LjgDSe+RSeHMVHACVGmMnUI+xXHJDHzoRNMkwPnmEw42sQsqdTzbwfTDf8EOGZ2L0iZ+pBbahH6Kwi0vusj5scThO7qSnN9kxelJ3QRr6BHvIvIhXMUzHX80vMjFFzOihTffn5a6xjNmsXbhIcUg5pCIgjD8trz5adwYKS0PIK0CzIyjnWGFGe7mreRmnBTMqZIge+BXCFMV3UV1DD4wyKOuxibj6hh9AtA0qOnicCmeA1A0VWgabCCs4ifKvW/psbrp4UxtAQGTK53t3OnNpO64My7qOA936sNXe6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6fU8ZlvBfkuhDekzttMvE29sfbXvw0A/O41VHiTvLY=;
 b=sXTfpAwbeN02GmPukDqrHOYeU483T0iXD45pXyA3V+PkIH0FpfLtW2EI9vHUCbcE5mKzaDxgnhL5P3kNiuBXse9i5mjFBo1NkzGNl29Ptcv9aVK73/LfEa43nBUYQjZNx6Uk7bT4SO9r/W0+Qfv10pPZlDLCsI0+RM8dYvQEfwjVyYVr82f2X07Rt9f+TclUG3Zis83uv01GY85uk6oBheZQNBqzkI6vWopPKOzOhsfkAGSU8pBfOQWaC3PCdH5Uap0UlBJTpt28l8VwThpbmVo+dmxbw2WQafz4BzTw1ad9cEetohOcIq5YdlxDMWxDSycii4lAAuGvb02MlNa91g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6fU8ZlvBfkuhDekzttMvE29sfbXvw0A/O41VHiTvLY=;
 b=qmNCsv46qvCe2WElRwYD2WnXtyqEbLAgTJaDdtmFm0xz4swtk0dYF1KeYgi54Ikka7RVss65p59/EUtDrwkw37TGk/kFjLyUuUhCT9m1SvAfV8/QnAClVuTZaVr9v8jSn26j3I4acfKZw8s4QFGvaDv2Bn6ObCMjgCwFyuTCd58wnNwqFCzs6QVRbVfkwGqrwOsyS6hjsXEMPdBs/+S0LXifohhjYPdO250jpcSfrL9N34f2ZfkgtmMsvvaqS45ac9KVGq+128cxWAEjLzKTpONmDdDOEK6vpr6YMRNoRiUqihrSh6bUSO2uldnSFW3x7KKKdq/S5Y4Vfn9eqgzqZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by MN6PR12MB8490.namprd12.prod.outlook.com (2603:10b6:208:470::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 09:18:54 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:18:53 +0000
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
Subject: [PATCH v2 0/2] sched: Enable preferred SMT siblings on NVIDIA Olympus
Date: Fri,  4 Sep 2026 11:18:03 +0200
Message-ID: <20260904091838.3617894-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI3PEPF00004E99.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::449) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|MN6PR12MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: f9225e4e-7eec-4001-0aa9-08df0a658a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|11063799006|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	v1++kCptvmcnJRVJkyyCq+mmUTWw9Mh02eEUFiLKih09Qod0a/AX3TP5APnJwBNszjQEF7Y1B+8DiosjERa8s6K5KbBY7YXhps+OHT6IxD436+LvUlpFVByvCIxZ5CNGEhRZiRZap1hUcvSDPhWxcZygN8QVSttcF4hoYhDvojH0LT/rpOlOBqr9MpU2VrdMUFECEYS4fvyWziUMXy1wdmzzv0GGnIOZU7+9ODBMNc51WHULoJKpT23cBso0zhpBtD1OhVO414X6m/YtCk/JnR+JdhdoDntIj/ctqvWznF635rr+zLpl6PAbvWIH/jfiYbpWOGo/BeD5lR4LsVFdYg6MfAkDs1ljV3O/83KWl0aqO8rR2wRic1CgwQAG2XmSFroOG2JEQ1MY64wMj1ET3TVBofXaJDZO1/ASS45OIp76uRt2urUwK5P7TyiMLrE5+dBIgQlIh3CiZ5L/0QzYzwv3BpVFNZAJMVFrbGB6+wuxLci8Bbq63294sDA+OfLCl6Je7Ct+EVKl1eN7SPT3djNkogrhcNt/8F00xtdZCviltnKRbvZsZFAkhlonbmgFcAaPrIj3uSwu3+PHFyww6s5rBHEYVxHIe8VBpNi3gv5LMI4aTAqIWH5OQbnzMA9UlIIqKY9etfNBsmWoQ6QwBFWgW9952VoGg6pHVNrhD0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(11063799006)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7RK+DkVB6wsjtoHNJRPtjcfQo4T0mqa4k+39Es80ooe449YP35rH1I2aJPqV?=
 =?us-ascii?Q?81zBTMfYULoqM2b5JgAwXWFRXuuZ+5r4Yoi39iQliAv73AmhC5D3CmVQLRr/?=
 =?us-ascii?Q?+SUUv7fRqXB7brlmvnICoh4BLXEn5rHKGewSB+DyXk5Mdw1uqjVYelOZwA8X?=
 =?us-ascii?Q?+WV6N806JYVqGVGO8KnNZVMCzgJPL8JVx/nlqZ0y88qeqHj+MY8o59MCMPCQ?=
 =?us-ascii?Q?3VDMJS4BY4vI/S3vH84b8AiXjEK3o6g0nMg/T1xju+oon2l8QiwNvM8YaINn?=
 =?us-ascii?Q?X16sQwAYFuVDHu4T+1S03ZfAbXKu+R1yx4SuwYXrJYZKZwPZcQdjusjR5eHC?=
 =?us-ascii?Q?p12MRqFpo0xPxHfMTZ6eVJSh58QiUJat02rqo4lxb+qtia/wGSoG6oTbMrH1?=
 =?us-ascii?Q?NGCpNcJcBQk717Q0iy45lJkLD1mrdhXLdo+/3ne+MidiswXbO4GQZS32MEG9?=
 =?us-ascii?Q?dDmjleOOJysuo+mZPaxJr84PIEe2e0JGJnK2xPEy7ug2/gBCHR/bO/X06FfU?=
 =?us-ascii?Q?X0eJnLxxUVs/Jb6yQYjAwnJrEqDdbjG1U6ngBEjV2Rd8uk9DEHnsrqOiEvnf?=
 =?us-ascii?Q?PJg2sah7L47UU5om1E3hL9BsMUWnEjFfMi8igFbqVnF09tO3V+6AT369YD8b?=
 =?us-ascii?Q?eZM4+RT+e8Ul3s0lPrZ70r9Twficfybg7jf9M6w2+9v9gbAiPhW6UW8nbD+4?=
 =?us-ascii?Q?A2zu0lwh6z/IwxgN+g7xQV5Tr4llqeuarJIUk2+uz6412GqYDmrRHG3rK6LB?=
 =?us-ascii?Q?xz9RLJCfPEccaSfv6h2XZmpdsBvo/R8eC+YKyq9JryKKtWQW3vXLDreevBJU?=
 =?us-ascii?Q?JSc473QqRta31rMnYxewK90+BaaG3nfzX12qqXUTYlUnEz0MHI7PDs4voX+A?=
 =?us-ascii?Q?Mil4a7sMs3kBG+3HbxcmnKci2KTOuU8ruIZdb7/lEtu7JioCOzKciDWtBbbV?=
 =?us-ascii?Q?Xgw0IKY4jrKwh4Y2yLUeO2CfDNcApx/L6hvUsY977BgwXtV/9F5KhmNT/GUd?=
 =?us-ascii?Q?gNyB62n7GV3+x/k7yXSVFUBXssueif59EIxTXegrr8GHi9UA5kmjx9zTib5I?=
 =?us-ascii?Q?6JQMOpy2ufMIavhxRZuz15I7y1wGu6ZKSuvle16eOYNvwnMH/4SzTrULbiDE?=
 =?us-ascii?Q?5BH0mGtdl+FDHyvfAEY7DXj49H0L086x64VdD8ZJuqzH0FA5SAIqHktpwX1e?=
 =?us-ascii?Q?yk2FZoEHyzpuFi+W6lnYqxgiZq1IuHLJU1721cDCAr122pVmhns0Gxgu0xdn?=
 =?us-ascii?Q?/1PBDsPrC+/7QAl6/Vzy3BjHesLv1LCjp5760xidx9vv+dsz8KrGgAGvJuSe?=
 =?us-ascii?Q?n0wlHuJacGm87DMSFD7KQ1ocFDiD7qXP9sKaHj8wDBC5PISXadUhHoG5c/yq?=
 =?us-ascii?Q?UVgRWHQGJ4wuU/JxnOYRPYMRK4UENyh6DKysCoTSEoDwaUHvVkIqsFXALP15?=
 =?us-ascii?Q?JuRkQUrUVQ7LF/o3cEiZ0S1bxhr1YbZKjdsAaW1shbdplzj2HBoR8/v8A603?=
 =?us-ascii?Q?cEfvyFU4yOAFkLvY8bJ0I/fd5e5vkj4nK5DtBouy1QzI1dQ4xPLCatJePvnA?=
 =?us-ascii?Q?IZGFlTdcY222AEqOrH72jpHI+qE+/divPriTrEKBpvKnHnekVL02IdAtwrNz?=
 =?us-ascii?Q?micv++Uo7zTnsVqo0kuiOxpYfOENyfE9RmSp3GJZGoLGrTI/Iqw2clAqB73y?=
 =?us-ascii?Q?43lNBL+U14puW7GdUDUlYX0sRyXcRt70HluhzNJcjqrGZX+U3iCrHREfm1xv?=
 =?us-ascii?Q?5B4F8NXyrQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9225e4e-7eec-4001-0aa9-08df0a658a25
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:18:53.7523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9oIliLnJFr7shkRnZ9ezMkMZwgeeJC4yNA7avwiTYRDrMLWCNLgb0uUDsoYd9+Ha8X+H0x0Di6gqbbbgN8bjoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8490

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
honor asymmetric SMT priority. The scheduler first selects an idle core
according to its existing placement and capacity rules, then chooses the
highest-priority available sibling within that core. The generic scheduler
behavior is enabled only when an architecture supplies an SD_ASYM_PACKING
SMT domain.

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
 arch/arm64/kernel/topology.c      | 62 ++++++++++++++++++++++++++++++
 kernel/sched/fair.c               | 79 ++++++++++++++++++++++++++++++++++-----
 kernel/sched/sched.h              |  6 +++
 kernel/sched/topology.c           | 36 ++++++++++++++++++
 6 files changed, 176 insertions(+), 9 deletions(-)
