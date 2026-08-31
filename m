Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4A64A0F01
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200308; cv=fail; b=MuBRJ11Myhcz/GSqoCYVItNFiB6UZZQzxi/JqWBuPGYxQpqtwwqq8J6lPgAn2Fu9nCuTGbiQ7m6kTR5L1yrkvRaXirp+Y8Hzi2s9Tb7ACnonxMu28rRBGAI5uvz5mlQvEcxq47iEOEOq3g60/fHNAbeed84PqXWYAiV563tGews=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200308; c=relaxed/simple;
	bh=4RNHLW7AxlXg/JtChgIUkiFzCqJxU8sBSmExrNL5lms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rQ2lVgixUvg41WurfHBTJ8UrkDPIgNgwMdSC5PUH7RU6kjt+Fj/JamZ/TUXul9BDzxuipL7YFuUcjjunDNCxAKRDGfO1/ALWPerQjyq1yLnsy9hu6NjeWf3cfiylelmrz2QH5e40jVeU9Ic/2/G7Ee+hmYmTirYKieND/SCswhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D7yTmsq1; arc=fail smtp.client-ip=52.101.46.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D7yTmsq1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Al8VwLgMnxVQEUaqss098inhFRJzsK6UxpG0jNgep04lir6FvJhQPFqQ+PlKsf8sILrKpQhKUCt6UAIcl3G8Scg4/DBWU/djcW4R9kZTIyuK4SqD/EtZGN4qvpmMZcBS3gjs8AvynNc3wvMC+VGksEK4fRYkG/7nAkBLMoVOSoiYC5OTCKZpTKnI0p1/FcRnAN55SpMFsEuAoE3Yzykw+/XJnjTpa66MfQNYqhNeqmWUHsZbqR88P/fMi7nwa8MaBZRpGNU+yWXbpvUhJHxqw6ecFdWcyrionixlmSi3ej01mGB1aE0fuWeD6ygTy9Vndh2/Ka/QlOjdY+IHgu9+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yWaluWTaRodsEDQ/GjAFAAsboEo28v5QKOOY42rfJ0=;
 b=qpsmyaGL5SwVzDzWPI7yjozfCFVOPN1U6SfC77O2a/pL1IapK1K+oG/VBZCR+jIP59/kGlQEjLISU2CPxO1Aj5HIswyzmAGPCjKTiLoaYUx9quGrV2Co1KvM6cx7Vv/ptcWtBaav4eucRDsz4d38q/ydrjsU5G00kyo979RvFpJIjRMijbtOyqhH6zIOY7hsqwUihc718rtUY8oXolbW4fBLML3AY9wTDxBEZG65xsp4YLxyIxH04y4O2PKEdgi70jf54vkiyMFRK7627+GyTCR73SeFkUt39rnZVhNhHN2IljFcsxEyIfCWVF8N3/9iqIKRNN68+Mu1WVo1xpA6Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yWaluWTaRodsEDQ/GjAFAAsboEo28v5QKOOY42rfJ0=;
 b=D7yTmsq1/24tqxshnlgDjSlwvu6eu98LDeHCzIzNPR8pNylM9r5gQIP6Be7yFtTutm0vpADUjWbjatwbiAYhXyNOwpAzQUUNNVrjZodr7+oXr2Zy+sVlvtMsuB+an5dLBtWagzqf6ZeBNSbaYl70RM+ZwK/rtehN5WpopFuaRObssq0bKoNJuTizBwrzN1PiJcKVXeVSl0bCXwYIBR1AbjZde5G8gSgukWoYmEHRa39F4OCkwOzFHTo9XITC4NiKVmOb5k789PCpPQTLEpY+a3zqMCuGMtGtfR5lT0Vekvjqczo/8xHZ30qQgRkbZXQIRpl7jOndGl6YUi6IMr5dGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:18:21 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 18:18:21 +0000
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
Date: Mon, 31 Aug 2026 20:10:50 +0200
Message-ID: <20260831181800.1668646-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831181800.1668646-1-arighi@nvidia.com>
References: <20260831181800.1668646-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2PEPF00000B81.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::418) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH2PR12MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: 8481f37b-a08c-4565-d086-08df078c3c58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TSJq1gB/3+DZlKGdwOmZmFLAXlbx+POelFpOlyQZFjAL7bE3PCIdBmT2/yb2Mq708o2z0BVysihsBW5wD7H0kygW8YjdjbnvCS+Q67fiyPzU0pACjagv6Lr/IwyaxNqWXFaZO38EP8gorkDxbCAuspgG/+ka3betx6mbiF7rmt1annsxW3empUT/zDvmv06IrpfACTVNqSWEPRfXFUgvJ9cGLcCskoTWViHajmHjBhr+oBEkS940GLjTt8cq7OgP9kncnB49rs23BoNEpb97lshOH6btyqdte5wfVyF6Dxz4R/95qoyNQ5GSGmqBpLPNTbUwkjhClBp6KGFQIk6Jxosx64mA/q/MORHG8isLTJXVbiIjQkiBPuoCMsb7eHlGBzKPdTYwRaM8x8hKuHwwCue8w11wc67rwh3kLMz14CQH/OIrlUucYxXIy2vi4HxTVFhig7JxPwEBBaOYrXkam0nqQpQPhRoSxBJf7lt0Qsa291BEM7hPD5/VHew+KUMp/yvf/5w9demqRLk9r7mHNfvnmViHk3TFPTTzQau5jPk71DDMifz5xgB3rNFFqTf6WmlFPD2pM7J7igIHMCqVob7h/uw43ayVl3SP8N1CgbZO+2oFfuD3I+IMO95WN+hYtTsbsUAPauaDVysnEyJE+2LhM1ZkBHq2vJ8nk37qeOY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zfXtxBTkBnru3FVemOuB4zXyLHjudD+Vz/xaOeK+cRAGHW1P1tZ4VMbiN9Ob?=
 =?us-ascii?Q?dkrwQe7/bvzBkucMcy2PqWUpyLYf11EnanLygs2LxQZCIf/2p0nNdw040KkC?=
 =?us-ascii?Q?8B3SwUKParGEpATjW2oYmbwymK6BHUTGgTVvEhvikAv0znp1MYxNRQy564x5?=
 =?us-ascii?Q?bgtwp2FfuummWTfLBOvkSaSUkssG4pOGNzIHSj7pGbrFq1YIVYwGcumT+p3Y?=
 =?us-ascii?Q?wbdkyXnLTNBB5TVW+1kBF4yDhJiFeGc9rVhm8w/mJ9P89G2aKx4Aiz4p44zd?=
 =?us-ascii?Q?2oMp/Lrph08xtH9+Uyn/1A4D7aNtb/dM7Tc5Sonm4bSuPVE0ZEbjHpl4/Luv?=
 =?us-ascii?Q?A9EUsVZPSVfdMYE8kOaDg0g73j2VR7cbLEFWlE10nkhNb2+DWex/vOpH5N8J?=
 =?us-ascii?Q?U4KmsZDZxtYFgJFOyUTKRR9fQ8Guw1XpskU4QHk13oeWSBwrjgYPXFJaKTH+?=
 =?us-ascii?Q?qJtIQTK83NmnWV/VLgkhfzPq8ugyfTUpuLXAEPSDpcvaZDdZj96fn9LuIn2s?=
 =?us-ascii?Q?Bgu8P6oKcDBnKG4B7KDz1dupPt5NX7NR7zp9735mRlhjjmIgvcBZhznEVZOb?=
 =?us-ascii?Q?zGm+lCFMpSEkpjZSvdmZQATpGW4UPTy+22Ok8zg2u8vYxRMlH+Ve9HNBmcF6?=
 =?us-ascii?Q?QaaB6KW9FziidMh8353DfTVMfa3UXI56M8K5gdf80C2zH22mWfg2ZdGAuAuT?=
 =?us-ascii?Q?MQ1IODKXk9dLtfFB8O9x6ThYr204YQZitm3hdIULUx1t0C/iqo126i/7pPU4?=
 =?us-ascii?Q?3iagJHN9hiGQBHp9OlgpNuDOCmGls+8Qagy05e4Y3hllkoRecVJLEvMS7AT1?=
 =?us-ascii?Q?RTKchYCrNuDfM7PD5GaPRyQd0jf+xhtvCiCvKdkYen3z3P48o78LjcH9ODSq?=
 =?us-ascii?Q?ENZBQbd77aVePyZPGu9yjk65xR/j/oYnv6pYV3VGSTf+v/jSjXE3KidSUqs+?=
 =?us-ascii?Q?VVQOxUlftgO6Bu3QvrmLkWFdn/uNrTrqCpTiIIF5f+/TUlH1wKIi8IL1YZ9e?=
 =?us-ascii?Q?lnEjLB3fhLNcgSUY95cdcQsND9eahvT43Z6w6xnUaqkekLFqJi2QxWKvKnts?=
 =?us-ascii?Q?onr2rlVrU4DpHCUoaF9+xtvTjdKJSZ95zb2Mq4avlTkKFKUDEO6Pcl7rJcqr?=
 =?us-ascii?Q?xDpK1YBvWmuWIDRMNpbWX+txzlJvLRtbu7LuZMAfYWOtqPG5UWKTWDVWqaNV?=
 =?us-ascii?Q?BBGTF9U1qcdSla2LTr5MwrYEFHmrdRZIShu0ssiJ3uqx8i/J2ImxNugoBvrP?=
 =?us-ascii?Q?X4vtflT5cpAaH6P6nux8VgsSdOF2wY9j6Wt1bXQA5/Z5vsFNp2iQ/a63KxpL?=
 =?us-ascii?Q?NNeaVqwJ/QMz1+e84mjqs8tjWYm4igfroWRSggULQR2L/PzKWI74Uft4bxSe?=
 =?us-ascii?Q?sddxJYX+RBH3CoWuODAbAljxKO4/1lfx/J9S581Ru240HJ9+ZuZaSZbkKBYF?=
 =?us-ascii?Q?rqKRIMxsKJCPjHR1kh8KkLaiNClkhk1jxoaV645hq/fsJnljHW1xDHWsy3pe?=
 =?us-ascii?Q?jnV8P36BDxrrg81Txmf0uj65GTHATOsgjpHNxfJZp6yfuH1sMpJvQOi3p3GC?=
 =?us-ascii?Q?wsYhGdRVH64r775HsIe4+rQwkDj+B2fmd13piRB3LMwpKVhfxdNjt0kyfJUj?=
 =?us-ascii?Q?UgAuyejh8q2v/RFnMoO9k/QUkuJFsVzRr5SlGapVa1xXo9OhoKkFo6OrC3DI?=
 =?us-ascii?Q?RhvblTkFHz8heNRSporltslNGZ1+GDpR1jeqPqYXL1c5dTptmw3mMUJ5Cyxj?=
 =?us-ascii?Q?4eXCWlD1nw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8481f37b-a08c-4565-d086-08df078c3c58
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:18:20.9386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exIwL3JC/Ph5l+szuV+wP71vmViqgj9VEoWaBUz/mc/+BX7JOHdnEg2zlrUV34dSGLO2T070k8cx94/bb74O7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4264

NVIDIA Olympus implements spatial SMT with symmetric steady-state PE
capacity but two different resource modes. One-Thread Active mode gives
one PE the full core, while waking the other PE restores Two-Thread
Active mode and partitions decode, issue, cache, TLB, and vector
resources. Returning to full-resource mode requires the sibling to
remain in WFI for 10 Ki cycles.

Measurements show that pinned workloads perform equally on either PE,
but freely migratable workloads lose substantial throughput when they
alternate between PE identities. Consistently selecting PE0 keeps PE1
idle, avoids repeated SMT repartitioning, and restores one-thread-per-core
performance.

Describe this scheduling preference with SD_ASYM_PACKING and give PE0,
identified by MPIDR_EL1.Aff0, the higher arch_asym_cpu_priority(). This is
independent of SD_ASYM_CPUCAPACITY: SMT siblings retain equal capacity,
while physical cores with different maximum frequencies are handled by
a higher scheduling domain.

Firmware currently provides no interface for describing the preferred
SMT sibling. Detect Olympus by MIDR until such an interface is available.

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

