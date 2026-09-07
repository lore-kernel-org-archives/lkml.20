Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011056.outbound.protection.outlook.com [40.93.194.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5714F51C350
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798936; cv=fail; b=LonTA+ldAmT2ype0sten71sZBU5g2UIzhmy2lADBCkNDdRPlYx6d3/TCRl+A2wlRqGFyOnsJxIFoA0UHRMfa1tjH0I92ltECMdanQJ1Gx8mA412KW1cSyMgqwb1m+RpNibTqtgnMsIlHHA3dm3lUzovnvFABKa1A1tcyUrGMZRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798936; c=relaxed/simple;
	bh=gcTlgReVlUVoLwE6bsl3hGxK0jRdkL0Ewl2o+60uS2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s+QHjS4Vc66sX9L1QV4HpSfyeh08Hl7ntCGthlTsncl3K1nUp3ylQawBqsdYeZ+U/zdOSw+pcprEtc7U2rPaqLLUmbtMkBGFyH2AU3dgfg9X0C03rO24kXvrJIJG3KnfAx0OmPG7xbFweWuda+/hStOjECrBGlcCUGInmIsOXxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HHFaiY2b; arc=fail smtp.client-ip=40.93.194.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HHFaiY2b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbNTF0OUnGOl4an3tBIU58wKI80jcE4Vxc38+MvaKI6MEqugFC2pAwWkV1mtvBhZ8qsWbcHYxs1vgax2wKuqSy1TUuBCD/0mlZPBWyCp0PjFIbqw1kPkeFx7cpCR6WIq/UNq53IIQV1YdLODP5uU/wCHh28227iyYvwL0AICiJfem4jn4SwOipLaMI3/QX8fKiVlPdhFkNbx729jhFgG76RnAIJrBGuwsyY7VdHwbgPmqQKY3C2FA8WdLN2Q5pgKOiSmNk/kpPXsXPzKBG2M49vBQKudq5r6ZJdalNVdHjS+SDGwGgvuW7upw1XiqXemB2o0Vez1T00TkjQgt6xNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcARQxxzlgWdN2EwT2mTaAh+xf0GiJ9EdSKMCW8BnrY=;
 b=WUW2/MrIyyMdWIukwpoAQDJ4ItwOzTG9szoCYfM+LHL3sXVKs+oJBM28CJnNyR7CrDX6dwQClBXZxVNlwTZFug3Y/fgs2s5k1IeHNNlwmV4y8bdL9EBkZFS6sNx/Pea4ehCh1W/uClL5wxbGyYRuwB+WgU2SDhRtjl6F8kYeqk8P71jjSvQfm4TGd4Kfe1G3+O305UQ8eNOBAFOHedbwhWOuTTP8e0LB7dcPhOVrT1YKER8VecTycBA5SD9sZFfa17zgd19EeEqrAhdViuEDfumdJ7wbJ03CpPdyZiQLjYpUyj45Y+9jJcQzaaBlIxwTT4VZ4PPMCdDlutXLWbWlfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CcARQxxzlgWdN2EwT2mTaAh+xf0GiJ9EdSKMCW8BnrY=;
 b=HHFaiY2b8UQxzyoaj3xZahdOADWjr7pf0Kyit0hLE5r8IqnDFoNObHxaFomLayTRRmqw5zk9cgQtCpW1KJVQDpxiKWPv4hTR6Xhw2yXA79O4pHakHNtbL+y3driCThTDEGtZM6ICT/rly+MD77CBnceeotASpM9yMDVKLw1XyPE2LV+6HCMa5R6/OCpxYFLctWX3TDW3fG1JGhfckcfP45mG7oGDGEtUAUZFXMnGI/kBmfBDvQee5Tp6AoM7jRRogk9VADYTyCn7IDQAvuv5sX0ayZdR0Ryx6sE5UQztBh/JeSw78jVaGYoskAl343rpPuAWJiwpb3MH5VwG3OF28A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 16:35:29 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 16:35:29 +0000
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
Subject: [PATCH 1/2] arm64: topology: Prefer PE0 on NVIDIA Olympus SMT cores
Date: Mon,  7 Sep 2026 18:30:09 +0200
Message-ID: <20260907163513.4172411-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907163513.4172411-1-arighi@nvidia.com>
References: <20260907163513.4172411-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: c32d8a18-e266-429e-b638-08df0cfe0759
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|7416014|11063799006|5023799004|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BuB0BlbLnarYx5OU54aRMlkkzB1KaxOwuByYMkOhI3IZ3ODEh2vX1OK59BXOjdGrmIZMSia89BVZ09JeWHNKNI/KFCgZ0EBBg4plg2QK16nD3MAC72QlIxVtwfaqWARBNxy/dSiyeuF5UD82qJo26Rwcv/07Yo02iWgpFUnVXNE69Y5vaBEuR5p6lgqjuy61//rnFaAqUZpwIf3H6T2jH4ZohqJNHMgHDyGVJR+T8qY7Iwgm5zMistezT689qiEnfUa+se8eH/20waPBeGmGmkI6FptPYurHZWc/G0vrgmvS5RET1gMKVDd7ZxdYdlriSODLt5m41wK1uh1IKnIrvOmuer2DyRnMzsO+jgVN3+3/DXAcgLaKKMFN5qhJ1kcw5WxV3Nt+fhk7+TN+btXSmTjJJYQGKjB3d2SisR349jJD17urtZ+oTB95Xxxmf6jBvhQycLottHBNX9APj/DHarvN41EiTWq5Zhz58cbUDKvsJKf5uHpx08KXqd/2QHVydnCwSLKN+xrbGEjptz5duVk5lJV8TpwdTR7AZZd1PHhuKQsb0PIdWnBWpS57B68+lxUDyOJLM0GY3wEB9Fp/kpAarW4zMIckRTBmD9zXqmpTCzp52GjFQJFgrbxfsZEpxNfq6x1rrav8DCJU0M89X/B2nDSHTyKXvhCmOyLSNOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(7416014)(11063799006)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?atuVpKjtgmqkDGXqUIbiIeZuvcnh+YmqCp5bRqNS87HR4+8qxo2cwkkenoky?=
 =?us-ascii?Q?axKBGZCjJYjcWjQnAIkn9iLHtNvU9oPoZLZtb0rytb1150i5tpkcZiukXsXs?=
 =?us-ascii?Q?ogks38tjszgZNZZ+I01xS87SqzgZ3CLgmWekSUu6115vVBhy93bRIEvBznKW?=
 =?us-ascii?Q?1w9nPgsIA3Q1Pto166uptm1yLX1kk3117HUMm2P7vInICZJqf2476ixQK5g6?=
 =?us-ascii?Q?oZnpYj5Co0JuLXStmfy5w5anq1WYGpQw9iQGwtSHu8wN0l1l/35/0pRBflQj?=
 =?us-ascii?Q?S6nEhzLqgyXLjQgEdRGmmCVN+cI6AY8qfQp3d52e6ZgmyjImWr9pyA8W7vAk?=
 =?us-ascii?Q?8vj78MJvqILafQzWrye6OWC/3WqXxKrqGhvUrC7H+diNrA2YkkOO5WU25h6r?=
 =?us-ascii?Q?bSwWumsihdIo4sY6K3IQeu8xYDJXPpnfaR96wI9kQYnHnKfg8h71Q4bfDVlj?=
 =?us-ascii?Q?amMjmfoAp+SI9HAgbEO5YhWukYp+6LlRPx0z6sgTXqLu3ICjx/YgAPY3mGiV?=
 =?us-ascii?Q?AJCUyBZ0izZfaYmOvpxCnDxQBBdhNx/IbbjE7wlGhjGVjh9w078FuKh5n9Pv?=
 =?us-ascii?Q?mzWHhOaBAW+8GGZsFkF2mazcxOr/McKkQ+U039zsmbBePe55vbN3EQZP7sb3?=
 =?us-ascii?Q?d22lgXqvwQi50jfEmvsnGBF/h08XDm99f9ZXnyHuQEmyq1wjd2xdwBAQKomj?=
 =?us-ascii?Q?89X6LIT6gkHUue0Z5gLZUKsvO0/sCiIDmHZrJAAbs4ESwEEeU7t5UsdN9anL?=
 =?us-ascii?Q?BLNaa+jrD7EAOqwpI8vIFO0fsGjlgfBzjGFD1ZcQkHX13DDOGtAUicWP8NIB?=
 =?us-ascii?Q?uIGFM+Omc4Qd5HlkETXMdmGtnYiHCJU/R4B7RML7x8ZbKgcYYUi+8u0erLyC?=
 =?us-ascii?Q?J1tOJghNTKO0OX8OIds9jCQm9nU9isv+BGGnoPs8RJpRXIjz1HNRyaxKhRbe?=
 =?us-ascii?Q?29Avb/dx4RL0wzBWD0FJgD9gpJ/FhwsEqgZpFSjWKFeyhC3DhEMPftSrCc+Q?=
 =?us-ascii?Q?3U6DVEJ7GvfkeqyPWS5c6+NcyU0KU4PyM44+T/A4jsipw+RYMDR6xYYseL17?=
 =?us-ascii?Q?9UH04LmVeZQSiiAogSql/lOJX2/ViBehzPV+2ZKbHToOq0kJEfj64GrMwYP0?=
 =?us-ascii?Q?iG32Nz5c2FVCK/0UCdx4WRlQ/zTSR8RLQW1X7LB/ROECL2RYapHfpEW8+sNQ?=
 =?us-ascii?Q?mFj56IGmkFmfNJliAprKU6aWPVGiecZIquBRrDO3gGRPLhq2yK9OTOeRAQ25?=
 =?us-ascii?Q?EvtacYjHcsgN4vQ0QhyUrtnyKdO15CAxn3rc1sKfIa8TcxHnPj6WP5MJfqEw?=
 =?us-ascii?Q?qL+kW6LTZGh49Jv25rwRyhIZNRs4o3coerU7jA+fx9XFh8nW1eLwFN8vTYPy?=
 =?us-ascii?Q?EFIw1cTf066CtPVNCueBtC0h20tqZDuFqU3mEYqqmFAVenrKhrgBY7ano2rO?=
 =?us-ascii?Q?HOelGVZLej8bVc2tYFkqeGz3sLEMOz7hZbiyPz5dFevDKUfskwqCaU8YVA5+?=
 =?us-ascii?Q?KDFKjXMHVcHL6WoQS4EUW28UpKRcdPFTyMLkjlxeq6Q6hCWcVPx9dtKhcPdB?=
 =?us-ascii?Q?wMgMUUUXaYN3ntaiqSJoOzp8lwOVvQkC623+RLDPo/PloB1EaoxcXRK8JSRL?=
 =?us-ascii?Q?oYxV8g/zVgNFHzxfIobcVeGUfz4z/3aUGRfuo46gnFdo/ZmaN+Is27+uYtUT?=
 =?us-ascii?Q?H8O3RwK6pp+Ib9hb37IZLNeFm8cP946Bsu9LsELxb+w86iDpshHjqpNH8f10?=
 =?us-ascii?Q?9bd7HNt5yQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32d8a18-e266-429e-b638-08df0cfe0759
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 16:35:29.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNvNcPcaKS2/sS8fJ0uJ7DYnvOna8GU/sqY66nydfESXScCaSb0jFihfScqdMlLUT10TsjdMsV6Ya/vqLnjRcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912

NVIDIA Olympus implements spatial SMT with symmetric steady-state PE
capacity but two different resource modes. One-Thread Active mode gives
one PE the full core, while waking the other PE restores Two-Thread
Active mode and partitions decode, issue, cache, TLB, and vector
resources. Returning to full-resource mode requires the sibling to
remain in WFI for 10 Ki cycles.

Measurements show that pinned workloads perform equally on either PE,
but freely migratable workloads lose substantial throughput when they
alternate between PE identities. Consistently selecting PE0 keeps PE1
idle, avoids repeated SMT repartitioning, and restores
one-thread-per-core performance.

Describe this scheduling preference with SD_ASYM_PACKING and give PE0,
identified by MPIDR_EL1.Aff0, the higher arch_asym_cpu_priority(). This
is independent of SD_ASYM_CPUCAPACITY: SMT siblings retain equal
capacity, while physical cores with different maximum frequencies are
handled by a higher scheduling domain.

Firmware currently provides no interface for describing the preferred
SMT sibling. Detect Olympus by MIDR until such an interface is
available.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/smp.c           |  1 +
 arch/arm64/kernel/topology.c      | 62 +++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index b9eaf4ad70850..edc1c59b3448d 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -18,6 +18,7 @@ int pcibus_to_node(struct pci_bus *bus);
 #include <linux/arch_topology.h>
 
 void update_freq_counters_refs(void);
+void arm64_init_sched_topology(void);
 
 /* Replace task scheduler's default frequency-invariant accounting */
 #define arch_scale_freq_tick topology_scale_freq_tick
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a117..0135ac4eea8bd 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -443,6 +443,7 @@ void __init smp_cpus_done(unsigned int max_cpus)
 	hyp_mode_check();
 	setup_system_features();
 	setup_user_features();
+	arm64_init_sched_topology();
 	mark_linear_text_alias_ro();
 }
 
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f1..0dd9eec1c4946 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -19,6 +19,8 @@
 #include <linux/init.h>
 #include <linux/percpu.h>
 #include <linux/sched/isolation.h>
+#include <linux/sched/topology.h>
+#include <linux/smp.h>
 #include <linux/xarray.h>
 
 #include <asm/cpu.h>
@@ -44,6 +46,66 @@
 static DEFINE_PER_CPU_READ_MOSTLY(unsigned long, arch_max_freq_scale) =  1UL << (2 * SCHED_CAPACITY_SHIFT);
 static cpumask_var_t amu_fie_cpus;
 
+/*
+ * Switching the active PE on an NVIDIA Olympus SMT core can keep the core in
+ * two-thread active mode, with resources partitioned between the PEs.
+ *
+ * Prefer PE0 so PE1 can remain idle and the core can stay in full-resource
+ * mode. Firmware does not currently describe this preference, so detect
+ * Olympus by MIDR until a firmware interface is available.
+ */
+static bool olympus_prefer_pe0 __ro_after_init;
+
+#ifdef CONFIG_SCHED_SMT
+static int arm64_smt_flags(void)
+{
+	int flags = cpu_smt_flags();
+
+	if (olympus_prefer_pe0)
+		flags |= SD_ASYM_PACKING;
+
+	return flags;
+}
+#endif
+
+static struct sched_domain_topology_level arm64_asym_smt_topology[] = {
+#ifdef CONFIG_SCHED_SMT
+	SDTL_INIT(tl_smt_mask, arm64_smt_flags, SMT),
+#endif
+#ifdef CONFIG_SCHED_CLUSTER
+	SDTL_INIT(tl_cls_mask, cpu_cluster_flags, CLS),
+#endif
+#ifdef CONFIG_SCHED_MC
+	SDTL_INIT(tl_mc_mask, cpu_core_flags, MC),
+#endif
+	SDTL_INIT(tl_pkg_mask, NULL, PKG),
+	{ NULL, },
+};
+
+void __init arm64_init_sched_topology(void)
+{
+	if (!IS_ENABLED(CONFIG_SCHED_SMT))
+		return;
+
+	if ((read_cpuid_id() & MIDR_CPU_MODEL_MASK) != MIDR_NVIDIA_OLYMPUS)
+		return;
+
+	if (!topology_core_has_smt(smp_processor_id()))
+		return;
+
+	olympus_prefer_pe0 = true;
+	set_sched_topology(arm64_asym_smt_topology);
+	pr_info("Enabling PE0 SMT preference for NVIDIA Olympus\n");
+}
+
+int arch_asym_cpu_priority(int cpu)
+{
+	if (!olympus_prefer_pe0)
+		return 0;
+
+	return MPIDR_AFFINITY_LEVEL(cpu_logical_map(cpu), 0) == 0;
+}
+
 struct amu_cntr_sample {
 	u64		arch_const_cycles_prev;
 	u64		arch_core_cycles_prev;
-- 
2.55.0

