Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010031.outbound.protection.outlook.com [40.93.198.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948D158E2C9;
	Thu, 17 Sep 2026 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654095; cv=fail; b=rGfqRaTaBW/Fe27SLa/+8vNYoQe/BkJ5qjYspa8W2P4lMweEcLcw208bpg9Bm53jz7yicGhJWP9b4PphcxsxccV1a8E6kRj1m5dYXwTqNvqzUzlzmZjDVwj+WOUrQPD72Ep0ZHnXh9+bU5UQHl4OPYermdbB9kThPCZw/Ef5Hxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654095; c=relaxed/simple;
	bh=lqYtPVFA9uUnfCWzti/FBh4ughZxNrnX/75C0WBspxs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FFCondj1UhxxKaZ3M0ZvOVNg8CXFHLJX6WSQYItT8qkBF4bJPovS/8SXtkUputctmkbERbMyvgmgGK10NoXe3WmCXLqTQ6TohxvNfJU/GkrlYeGs4olc4GvKk51oHKdR6d2iV02l1I4CLB8hXPzoDBI3niH8dbig2jmtQwNrOSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kKhFI88y; arc=fail smtp.client-ip=40.93.198.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kKhFI88y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=br4q2A96uWsIO/iI2sB2p7yff7/VVNg9xr3DAZTQERfvNcm699tWeBYTmGrdk5aucxw9Qg6JhBt8C608gf5k2yBnaW1v4+99n3lyzGW3p6stIUNULBAeWFvujZyaA4ZpPmf4C8UGDGd+1ZK5+UxMMxhlo+hIgBry4qDAGDH2ZnC2C+/w5emiOYXzy6d8xPBX4r+jFvXiyH31eQ2P39z8uzZEbpMLl8t7a69jM7yalIScLeAZxSXiBQV7cT1JA4aDNrjp/GU90jp16CCemlPrIdJUh/krngj+pJiuTrx6hB9CEw+JeQfdfmZ6MHQq/8E1G5wprvyfk/4legGMiTsikg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ef3Rsg6KllNMujc709kRPAKRNLQ40j5nKnWzpnIgqHA=;
 b=uwGV5Diml6xMnxZWShR+f+Nikj9vvX6xxYhfnnDSEsi+R/n/YDCXvQXAWzk/JHKBofDXL04fc0dd77qnbfxFvDltJlKA9LiYeuKh+HmiX1q1zdXt/AWfhibe5XNXDKiPhrj9UpwBwuIM7aOMxrAoVmkxvFrbAM4SlyLWwsidKH1MUuvfR7TFWRtlhfb4NA7d62Z4ToOjO5sVzL5PiEclosgguRKDtwBfCodeMIur+35A+wWkQ2KaZVPSMD9PoZrt6a5oM5z7MaAKfBBURgCFgGlF6MZGvBxpiR22lkE0gT51ww01qTSoAVPZ499PasXMHJC+fPO6FYMs50bvPpFn4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef3Rsg6KllNMujc709kRPAKRNLQ40j5nKnWzpnIgqHA=;
 b=kKhFI88yAPgEfIASK1I9+5SoB/imvUaJcE+pTAeQ0ddWJ1CUamtm5yMz1Ppx/Ak9tiYG1+j6kGUB0s3Wbg+6cIKWPyaVr/OYci4zIg7f4GOqMY64M5YkKmv7/uSlrEo3nH1pVHrT+iTrw4qe5+Q0NiPmWJ/020Uu+py1ISkus7E5jmMY+OLERnTqzypHPDZD92sMuJVRfGklqwVEczG9xAaWsGmOL7KRMMlilU/dZEb+/1MuT0AG+Bu5uUPnxUesVRaQfOrSlx0ENrORzZry2A/2jQwVE4utIk8Bk7W6y06mIZ3r+JWbAH8A9BlRi8FXSGIqzBpcZnZkg9DjcrGz6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH3PR12MB9219.namprd12.prod.outlook.com (2603:10b6:610:197::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 14:07:19 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%7]) with mapi id 15.21.0428.008; Thu, 17 Sep 2026
 14:07:18 +0000
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
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] sched: Enable preferred SMT siblings on NVIDIA Olympus
Date: Thu, 17 Sep 2026 16:05:19 +0200
Message-ID: <20260917140707.3807229-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::17) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH3PR12MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0f731b-2b72-4a5d-13f0-08df14c4fbad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|11063799006|10067099003|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	CCLAYBSaq4m3/9PXmbtGKqydDgWd1SnH0Pl2YC5JGNneTRpRVnmSCpNJ3E0C//n1HXWFoYaJ1S/FmlSwPyQpgvfT1Ur3hN17KHYEMFvaHquOqFUjbGwmPweo0yKngwnUCH43FbPb6DWbMPsL3DPblmOIhH6jRhJxYJJFqomKaR1JADIP0GnUt3T95HgBUJKJ5/FdiN7dqFGTo4vK53mUdC0cklHH4UEVUdV9WLJDxwLBtBwPV6V0fJ+Y5V0Oke86vwatWBz+81kQiJa2zKz575AnCZUfm3fZrKyGjUFKo9BjwYylHv9XE0z2x9/kySpU4G1gv2NRQDLH/QxmP4Z6DSb1ziJG8Gaa52ZFVVX6mhORfpGAfK+sj0LQl27q8/Zzml8qGiscvlXm8LdPd/VdxuHJIGQnDwjup7kCfid71CsLzP9DkeLGAAOzvmM5nltDegnYVOVJ3GKQV5CXGdMls8vbgLbZ4jOvoGri+3hXnHn0EQw2udmtyd0nprCkWwINVV/jaP2+n09jr72luaSgiPYSfh/RDbQSHbvRQN5xBrZ7NBbJqbJeNDr8/dTgpb58g9jJICKCGK2xkl2n1Kaex/P5S+bIwjwgfNvOlm2nysUWwe3i3nch0tE/pqJypuKfniNCDP8I+pwULndIeiG5RtAIcsEkL1nBiMi0EAXzaUo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(11063799006)(10067099003)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3PcQYisVXk/sYQOvrAHmCStTrAYVnHBe1l75ijApTait9SfFPGhC5kdUBaxy?=
 =?us-ascii?Q?LUp0GTHJh0K3y42nW/aqeUuyw0QVdZEnmKKdrYGN4ioRu9YNPu3cutuKMkKJ?=
 =?us-ascii?Q?O96V+nRctMjT06XfjrvyWvYERIiEOV+NTD8ymt+0YP9BBizkXCXnuhb52A57?=
 =?us-ascii?Q?PQ15WzP8oX39d3zGPBJXTIEzdCKNv1WFMlP53No87kMLUaCW+cC5eQ9fmC/A?=
 =?us-ascii?Q?XZVaBNJ3CNk9/PCQjhQ8PRZgX6115f/J63mkQOLvjXkFywqThlx3VfQAaOng?=
 =?us-ascii?Q?RMXhTQT+As/2O7XPoYbMfP8ww1xb9aiv8YfDA2/vyyEH7GiNcRImp5z59JPy?=
 =?us-ascii?Q?4LvaA+7VQVbOVwZiTpQ8lGTnZVDM+bnURwk8opiUQfPF484TNtcN5GBWewLm?=
 =?us-ascii?Q?IvvMvCk3Ftu2hFMWmwDz2q4TOerRLS1IqQUUjJ0e3v+rBbB20/QWLJuxH/Zt?=
 =?us-ascii?Q?kTbhwDGw+BVz0uXjLLlhBzOi+uCoaGevzMsPBa1Y8SbGuz4VHLZ6a6tb+jdy?=
 =?us-ascii?Q?HejSTLspXDibop4XzR6ttpJ9YxKOYjH730aKj8tSZdVNBx14m8TxuvQceiVl?=
 =?us-ascii?Q?5mUQ03GfhE49DchX8tHlU3UjwrEotIT7aUv4+nfpVhWWWKp80h9NH8vxFx0T?=
 =?us-ascii?Q?hba1EBRKy+BrvfdeIBooTyCbx3APLlw7VuQ+sFR6BP1QFP4noYvbRO8dvHrc?=
 =?us-ascii?Q?G9ZWLt3NTrAvBymJ3D8pZ2uxhWCvzz7OIQ3rR0M8rJoCzF4DWl2QndRxozy8?=
 =?us-ascii?Q?VUpyQqNQzzJc3IBW05bD/rpHwrikb2j8cJQNByAVQRPkPfHLFE+5LHW2XutF?=
 =?us-ascii?Q?G1WevoqWMTKjzKbwiSeIQqrgOBlp79F7b00pkhizN6SYtxzHhTFic0cle3ef?=
 =?us-ascii?Q?lq+k/kgahn23XMoo4xrjeYL1ThX2Sy9Pfcj7e8IOtaaHXSNzsTMPCWiDFqer?=
 =?us-ascii?Q?ipvOpfkFIPYbMdSFh7r28Ezo8dFEVSHDbC4+6WY8U+TKkPPZB1YSQUvDbQu9?=
 =?us-ascii?Q?u3CRtmPNVJHAbpjjB81XNCu0UP7kHBZQILGvxSkGBXu5G96Or4n91G9Wfhv1?=
 =?us-ascii?Q?4VdlAX7jgkbcFAVkPE87rS2qnWQe6Np4DacubBxUeX5X4KQVYBV2sFcETFbw?=
 =?us-ascii?Q?BzWSAJWZyGVngquRFQug1T+hK+dNGj+UlmxWFUAcc8Q5iz3kGWXpq94I4/nR?=
 =?us-ascii?Q?BKfzbFxWR5yz/uStBfdmviFTbFXRVaDhfbq5yLQDXKu3D7Se39C4tRmoGP98?=
 =?us-ascii?Q?IxXXi2WbekScCOIeqy8FCo4+dc5ng5+bBGkOlMI3sdkdAuDNxKnsMGe2ftQY?=
 =?us-ascii?Q?ui4GCQL2FkfanXpe5mzdaw3yQ8fJAQ78dpoeBJPKkSTQ6yU/7MxQNe0+02f0?=
 =?us-ascii?Q?htLa7OEmHhl0vGGj1ihy2hOw6QpZjD9ESu6GEeP6P2qEG0o4iBlknUqxbWU6?=
 =?us-ascii?Q?90aKTfl0S94VxWCFshUlfs/F1GX1+LNSEpkfNc8x6Vv6NPOpAiz+3b318Gu2?=
 =?us-ascii?Q?T/CKnol8XN1r5CVrXErFYDQxpxAwC1OQ25/Cnn9v7Z7otOUNqUdRPHxbAt5y?=
 =?us-ascii?Q?CDrqmC/Fnkq50IvJSnqbnK6veufPQYZEkzZWv6otdGGFlOUJaiCWYBurBPuT?=
 =?us-ascii?Q?3lXiLxdbjLygOriErsqplwK9AC2GNuKUL9FnndVxjH2IhzL83tz5Uwo4FP+N?=
 =?us-ascii?Q?p4cMV+HBSvo/r1HfczhLT/AOLbJC0TlpYArmLBclTDv0YW9TGyH40T2W8nrg?=
 =?us-ascii?Q?JHwKsPkZ6A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0f731b-2b72-4a5d-13f0-08df14c4fbad
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 14:07:18.0100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BSwhlztU2wOIUj3gGpaAZ9n6aa4B2mw7Kov7nRcNj4/P/BmVa1Vuw04YUpgSCZGth9N4QdXfR4TV8V3EJeotjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9219

NVIDIA Olympus implements SMT with two symmetric processing elements (PEs).
When only one PE is active, the core operates in single-thread mode and that PE
can use the full core resources. When both PEs are active, the core operates in
two-thread mode and the PEs share those resources. This behavior is common to
SMT implementations, but Olympus is particularly sensitive to brief sibling
activations because returning from two-thread mode to single-thread mode after a
sibling becomes idle is not immediate.  As described by commit 293f9611ae735
("sched/fair: Prefer fully idle cores for NOHZ balancing"):

  Briefly activating an otherwise idle sibling can reduce the
  performance available to the other sibling and this effect does not
  necessarily end once the activated sibling becomes idle: after the ILB
  finishes and its CPU enters WFI, full single-thread performance is
  restored only after the sibling has remained idle for a qualification
  interval (10 Ki cycles on the tested Vera system).

That change prevents the NOHZ idle load balancer from unnecessarily waking a
sibling of a busy PE. However, ordinary task placement can still select either
sibling of an idle core. Repeatedly changing the active PE can therefore keep
Olympus cores in two-thread mode despite little or no useful overlap between the
siblings.

The first patch teaches the fair scheduler's idle-selection paths to honor
SD_ASYM_PACKING at the shared-capacity SMT level. The scheduler first selects a
candidate CPU and core according to its existing placement and capacity rules,
then chooses the highest-priority available sibling within that core. This also
completes the existing POWER7 SD_ASYM_PACKING behavior by applying its
hardware-thread ordering during idle selection.

Olympus firmware does not currently provide an interface to describe the
preferred SMT sibling. Adding such a firmware or ACPI interface will take time
and will not help systems with existing firmware. At the same time, inferring
this policy from MIDR would encode a platform-specific decision in the kernel
and make it harder to replace with a proper firmware ABI.

The second patch therefore adds the sched_smt_asym_packing= boot option. Using
sched_smt_asym_packing=on explicitly opts the SMT scheduling domain into
SD_ASYM_PACKING without requiring architecture-specific detection. Priority
remains defined by arch_asym_cpu_priority(). The weak default orders siblings by
-cpu, consistently selecting the lowest-numbered available logical CPU.
Architecture overrides remain authoritative, so siblings assigned equal
priorities remain unordered. The default auto mode preserves
architecture-provided topology policy, including the existing powerpc behavior,
while off provides an explicit override to disable SMT asymmetric packing.

On Olympus, PE0 and PE1 have equal steady-state capacity; this preference does
not identify a faster PE. The lower-numbered logical CPU is used only as a
canonical choice when both siblings are available. Consistently selecting the
same sibling avoids alternating the active PE across wakeups, lets the other
sibling remain idle for longer, and allows more cores to remain in, or return
to, full-resource single-thread mode.

The v6 series was tested on a two-node Vera system using 88-thread
single-precision GEMM workloads on the 88 physical cores of NUMA node 0, with
sched_smt_asym_packing=on and the workloads allowed to choose either sibling of
every core. Each result covers five runs.

Two BLAS implementations were tested: OpenBLAS, an open-source BLAS library that
provides a publicly reproducible benchmark, and NVIDIA Performance Libraries
(NVPL), NVIDIA's optimized BLAS implementation.

OpenBLAS was evaluated using benchmark/sgemm.goto with an M=N=K=16384
single-precision GEMM. NVPL was evaluated using benchblas with the same matrix
dimensions, non-transposed inputs, alpha=1 and beta=0. The numbers below are the
mean and standard deviation from five runs.

OpenBLAS throughput increased from 7.11876 +/- 0.06734 TFLOP/s on the baseline
kernel to 7.34669 +/- 0.01936 TFLOP/s with this series (+3.20%). NVPL throughput
increased from 9.64742 +/- 0.17311 TFLOP/s to 10.29695 +/- 0.01786 TFLOP/s
(+6.73%).

The lower standard deviation also shows that the results became more
predictable. With the series applied, the workloads consistently settled on the
lower-numbered sibling, allowing the other sibling to remain idle.

Changes in v6:
 - Drop the arm64 MIDR-based enablement and arch_asym_cpu_priority()
   override (Will Deacon)
 - Add the generic sched_smt_asym_packing={auto,on,off} boot option
 - Use the default -cpu priority ordering instead of interpreting MPIDR
 - Drop the SMT-specific asymmetric-packing static key and use
   sched_smt_active() (Vincent Guittot)
 - Link to v5: https://lore.kernel.org/r/20260909062649.469633-1-arighi@nvidia.com

Changes in v5:
 - Remove the redundant olympus_prefer_pe0 state (K Prateek Nayak)
 - Link to v4: https://lore.kernel.org/r/20260908082345.103087-1-arighi@nvidia.com

Changes in v4:
 - Honor the SMT sibling priority in the slow path (Srikar Dronamraju)
 - Rename the consolidated helper to select_idle_smt_cpu()
   (Srikar Dronamraju)
 - Link to v3: https://lore.kernel.org/r/20260907163513.4172411-1-arighi@nvidia.com

Changes in v3:
 - Consolidate the SMT-priority adjustment in select_idle_sibling()
   after an idle candidate has been selected (K Prateek Nayak)
 - Fold the asym SMT checks into select_idle_smt_priority() and scan the
   scheduling-domain span directly (K Prateek Nayak)
 - Link to v2: https://lore.kernel.org/r/20260904091838.3617894-1-arighi@nvidia.com

Changes in v2:
 - Clarify that the generic scheduler change also covers POWER7
   (Dietmar Eggemann)
 - Simplify sched_smt_asym_prefer() by inspecting the lowest scheduling
   domain directly (Dietmar Eggemann)
 - Link to v1: https://lore.kernel.org/r/20260831181800.1668646-1-arighi@nvidia.com

Andrea Righi (2):
      sched/fair: Honor asymmetric SMT priority in idle selection
      sched/topology: Add asymmetric SMT packing override

 Documentation/admin-guide/kernel-parameters.txt | 11 ++++
 kernel/sched/fair.c                             | 85 ++++++++++++++++++++-----
 kernel/sched/topology.c                         | 49 ++++++++++++++
 3 files changed, 128 insertions(+), 17 deletions(-)
