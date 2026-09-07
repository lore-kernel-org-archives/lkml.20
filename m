Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011028.outbound.protection.outlook.com [52.101.52.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A602F511183
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798946; cv=fail; b=aD7xRZBz/yQKW+lavksV7oSDHF24AHaRXRqjrUDt3MQEKJ0Du7blNpzpk3qEo/sGtKz+Fr1F2bZ82SWD5UCYYLle3tjMYebx19RCHfAT1xPVUT+Co/URga+0EFyDr47zQGL2IWQT536Z0khEwX81anSNx2wbmHbkszqX7/zN4oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798946; c=relaxed/simple;
	bh=uOVCW2i+oXPXRjtxmbxlSYwfv01S6oRbWxcyQxyAOfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cTvcbrOyJhWIOWwFKBINGqwkQ6gP0+8dP9AdXHwl5671MH7rh+K431o1LELflslul0lJTek5VWeIIzv222cmP6MqDvMseO8wNAF3jWZwIVV0D7JPPOM+Ezznc5MN7ilHbSOtQTBAwzaeXT32APBg7bypbi+uxQlmX1kRVEwlizs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Voiikjaz; arc=fail smtp.client-ip=52.101.52.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Voiikjaz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3FlgbW/g4La4GcOEpYUobundDIr7eZP2Ki54HN1rFe++6AAtcX/E3N/Em1Q1q13OliwtBcfUzji2Sm2CCktKpAnk6/rLFOVC4xdSiVVzQjmScBwHdiK4R/RMMrez3xw/x5rU+TFkETGf6+SC+iEno7NRfFybTw4py0+IvujiVDWx2Hn6eBN76+RIV6CxCVCMiSYhIRM4kKe0ct0aQZL2V349gjW4m7gCAB/HJaXTKDVTywzfd+X8F74MnToFELN0QHKz6QUE1yGb4Scg3oMrKWzpWZXpAuDuVrx0pk2G4VqQsBlqdVSqaLQB9ZxGtHtGNPfmeRuUcgU7lp4s0MG1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyWyoPwmTlhxJ9ztUPw6/DBSXAfJBNDoGk+dFmx0Dpw=;
 b=iiE1sTtSdYUUKS50jWfvi0O+EItRPeFz0kfgfITYMZFsDOhyAwjZcHSbSPRp0D1JSmvQngnYY11OmVInhxtJLOwwoEMU6dPkLlSd2NZ4bb4FFyWHC2NtZ0+Bep1NxKbia1MzzeWtclfzB4W0eQ1JoK5BCYeJZb+SkaZcqhB4ROrPDyZAuCXoVgBJStX4H/d0cuMQ1TgjVRBpkmtmhkcG5JbAh/N4J5w6AGO0G06RQXeVLEeLiGxE/1OXBB7kRnz8dUocx+LEeqSka7NQoqlLCyw8vZPPS+h/Jr4jvNvq5lqbj0HLv34oTUuam8d71SmMjiDYf+4yMv9Zttv4/Jmamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyWyoPwmTlhxJ9ztUPw6/DBSXAfJBNDoGk+dFmx0Dpw=;
 b=VoiikjazTQ5E99MYj5SlFB/P6eiGBFs/K6ZxbXxqvv7F1OKpk3+1dvnul6Ff1RfQBbwCNCtNmxZNilYG6l2P04n26cSbkf96XyKKd1eEwtIwWIrSUFUlN9aVnJAHiRYdWri4thqcmvrlyZIhGa9VqELVWmGU18uBRfgUZFc7UgkDgIUwT8qV4mCStqtmBs2j0B5/PzmiGVk90tDZzLEhzCc7YeaD07eNO2I/PWcRtCCzJoBt3egg9NY74BGBQnP4tFS7Bw4HdKEik1/xvanPdC8m9yHDnZWcCsLjKnY4y1fywG//L4TMJqAk7aC12z4pKmI84kvUOdelq++0lK96kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 16:35:39 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%5]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 16:35:39 +0000
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
Subject: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle selection
Date: Mon,  7 Sep 2026 18:30:10 +0200
Message-ID: <20260907163513.4172411-3-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907163513.4172411-1-arighi@nvidia.com>
References: <20260907163513.4172411-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2PEPF00000B8A.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::409) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fec7268-43d8-460e-4b4d-08df0cfe0c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|7416014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dtrevkQO669EF2ZqB3LNgDkgQroAayIP39As+Vnp1z/MlcyNHPaHFIn7fYH/XXMou6f+fN8iARnXTiSzoaiB0r80lgjd24xna8iiYiqARMjJdNoGl/0PICCdWxISbkHl5QmDRpqMYoXPm6Ovx9mfBGmvjOG8bfQom62ZOExMUNgIVL2p9GTMIAhGZxdGRfXXb4cLwt0Oy/q4vsWAepsT71rb3N8/KK69o5WjrRztOe/PsV9bWj0KR1JRqq5zd0YbO/SyBxCfPF9aeyVBvZu5inVwqQzBusF5U+RNbdlGUpfqPWGVf9MvE9F7SgLohneEeYnF/yMoeBAJjUOBOFuPTo/oA26EmwgYrBOX6HapW0IUPynH54/TqAMJ8ckgr9spBLwlWoYhr2uB9mAoRgc9L78KnLFFqo7Wt/vMgneb7cEkpE+ricrJtK8Iym/EIoiDQUVssoUHYrJtHxf+4rB7mxFyb3LCx8kz0+y5OZon8IiOuMj8wGK/HRTHhF5K87trtkZChV7NFzjYPqigWZa0iaDSwQCgmAwSqsVJX0B2VWJyPN6SqiAEPT/jnHh9MwhaR0WX4gGvpjQv9MzCRwvoO5vzbhGbAHPJ6xUnR2MJvucLrm2KFA6h070Sf2A4wmSNnVKQMV4IAUiMQTz6NOBf8ZADrsbCd0aJ3kHc9lPtcaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(7416014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BOAGUhEqjnnQ01k2PkGSgSuXEEKLkJX9aFcZVnTq+lzFbarJ6lihCX3yQC6T?=
 =?us-ascii?Q?o1L0KlAorKXDkpU1So3uTgENtMaZgRTFpUfSeZJ32aY4uP9SARIvua86kchE?=
 =?us-ascii?Q?nttQtZU6O2mR0bRPHKRQwzVgESEC1/pIaUod25p4cK8rTSHRRua7IltYEAh7?=
 =?us-ascii?Q?6OE04Ncw+r3tG85uLAJUjzL79lKzJRUD8jDTXZvmMO9/HugBPLIJiNtxEE+d?=
 =?us-ascii?Q?z4a7dtyEueTAx4LVvYiklw0c+Xe6Qeyc3vt2b1cuWfj+0Dzvmg8k2BLotuvj?=
 =?us-ascii?Q?EuhbmCxkcmleUy+oW155yoXidciT3e8kjSV6fioGTUalNRlCnBMzikwDkTmG?=
 =?us-ascii?Q?1HqNDi+zaYiPluRQrgyfQfBzqBAXKo6xcNuxKMAIHdmTfT/4pQaYS3HOZjwZ?=
 =?us-ascii?Q?KIteeZIBiBC2ekYQiYGRif1GeaaT5+upNMjD5VBV6N4lXbram0S2kWcZcbmV?=
 =?us-ascii?Q?wVFPaK+gzJkqrZdX1mUVUHdztuVsvyNunNiN7yMlLzYjeKbyLOzy5IFzatcf?=
 =?us-ascii?Q?ZPJr6h9yzuLJo46CcTCIfcBqy8n9RSWcghnHtUAcTtFFUoaBuF9JeTHF6DRo?=
 =?us-ascii?Q?PrbGXmvhCs0DAyCsfGCdvpzN5CYlLw0qnNHx/KnpkVnCsxRLnLwufpYWm5q/?=
 =?us-ascii?Q?MkDDVpikB+S7qR+XeFBO6u7H/PdOp9gI+WcF5fonCSISTa+dS3+MyD/Y7dHE?=
 =?us-ascii?Q?HeqfE3+JSAiypa7ohUEnaWDy+DSkETVAQYUdG1jVyDVeysYqkdDMDk9BtYXr?=
 =?us-ascii?Q?3KrUu4NEqwm7HsEtsWJP7EJP6DTVPLM95AqqK9wtkmAKmP1imNXRbdQkz4/F?=
 =?us-ascii?Q?fHhEzDdYZrtKgcyDf5aWupjdaF8VxpuaKGQg3L/TKfokRppfbSI2X5Bvlyp5?=
 =?us-ascii?Q?RR3XCO3aCohCpm3bwiSQESN5skGFFs+vzH01o/TEuxmgUXYbEvBqpwvqQaMl?=
 =?us-ascii?Q?gs2/eWpteVnOsEgdDYxmakdguFUHUUY5gnZtpkgMuQIXIGRilbu42m5CsvDJ?=
 =?us-ascii?Q?U0uimCw+1e7A1EuuYIjotC8+mKolVaGM2S95lHM3zo8jFHvPQ30z7xsRjZPX?=
 =?us-ascii?Q?ch95/GLgs8krzQeJIsO2xB5tLNJVQ54uiDV2O3C6P2IrnGrhzpVV0RNsnwi3?=
 =?us-ascii?Q?vMpeeJFEwjYoqB2Cu24gQG0Sy2xuSMwCspEIikh/zO+bOlrUbP2GmWMjqfAn?=
 =?us-ascii?Q?JVBVMcHQIlSCT0tf4nmSw9vAKDpKLs565J3cG1ia2VjEB8+GQD0z8XI1c09x?=
 =?us-ascii?Q?RKwVmE96I2c/+C9tlXx7Z34+RoAeKB2CyZnX395QaPOr0VboffeZyhTvaXI/?=
 =?us-ascii?Q?J7uPz+UgxTZ36N0Z55zLtIYlzH/K7z40H+rEH0eiGn7X6tWjOIsvvzVxFop6?=
 =?us-ascii?Q?E6syefrF7Ib8Aq3cMJeIk4Mf0LwWoKi8mw/ctHM9Pj3txKfuU6m8a0MFyY7l?=
 =?us-ascii?Q?urFl1eBfyRzz0KO87letn9XCICghxm/ut2FCufYhuPXX7SHGyf3FmRjYJ1dF?=
 =?us-ascii?Q?TJZnf2/K+4nvYSBu3nxYWBH+qpS4Upfag4AQ4suY+/R/SjKbYxs2V15d9VGR?=
 =?us-ascii?Q?ocpymVurLholvZdGeRWaPFK9etQr/yclTBAaeQp8YRfWnbMlH/n9MMGXoJF0?=
 =?us-ascii?Q?IWrfk3FkqyhFacwxm3VirVpSIbxHZtPTV8DeKQBHVxufWRAS++EZARUIY59B?=
 =?us-ascii?Q?jwb4GtXLNu7Zn3ApS310LiI3b/mjPfplvhKIHMVHK5ijrwJeDci/AD0CfiSW?=
 =?us-ascii?Q?0o3KSKmK/A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fec7268-43d8-460e-4b4d-08df0cfe0c60
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 16:35:39.5554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HMXMdUzufZYhLoOqmhv39CAIQivDTfjJXwxpEz1eltHIrBoFGC6E1EyvsENJePEglrD1U2pEJvERkRrxYI+ipA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912

POWER7 and NVIDIA Olympus use SD_ASYM_PACKING at the shared-capacity SMT
level to order hardware threads. Idle CPU selection does not consult
that order, so a task can wake on an arbitrary sibling and remain there
until load balancing corrects the placement. On these systems, that
initial choice can prevent the core from entering its preferred
lower-thread resource mode and cause a large and persistent performance
loss.

When idle selection finds an available CPU in an SMT core, choose the
highest-priority available sibling. On SMT2 Olympus this only changes
selection on fully idle cores. A partially idle core has only one
available CPU. On wider SMT systems such as POWER7, it also fills
available siblings in priority order while the core is partially busy.

Apply the preference to idle-core and idle-CPU scans,
asymmetric-capacity scans, and the target, previous, and recently-used
CPU fast paths. Inspect the lowest scheduling domain directly, but
require both CPUs to share its span because isolcpus can split hardware
siblings across scheduling domains.

Keep physical-core capacity selection independent from SMT sibling
ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
maximum capacities, then SD_ASYM_PACKING selects the preferred available
sibling inside the chosen core, whose siblings continue to share equal
capacity.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/fair.c     | 79 +++++++++++++++++++++++++++++++++--------
 kernel/sched/sched.h    |  6 ++++
 kernel/sched/topology.c | 36 +++++++++++++++++++
 3 files changed, 106 insertions(+), 15 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b8bd308c2d5b1..4fa3b47a407e9 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8587,6 +8587,35 @@ static inline bool test_idle_cores(int cpu)
 	return false;
 }
 
+/*
+ * Redirect a CPU to a higher-priority available sibling in its SMT domain,
+ * subject to task affinity.
+ */
+static inline int select_idle_smt_priority(struct task_struct *p, int cpu)
+{
+	struct sched_domain *sd;
+	int best = cpu;
+	int sibling;
+
+	if (!sched_smt_asym_active())
+		return cpu;
+
+	sd = rcu_dereference_all(cpu_rq(cpu)->sd);
+	if (!sd || !(sd->flags & SD_SHARE_CPUCAPACITY) ||
+	    !(sd->flags & SD_ASYM_PACKING))
+		return cpu;
+
+	for_each_cpu_and(sibling, sched_domain_span(sd), p->cpus_ptr) {
+		if (sibling == best || !choose_idle_cpu(sibling, p))
+			continue;
+
+		if (sched_asym_prefer(sibling, best))
+			best = sibling;
+	}
+
+	return best;
+}
+
 /*
  * Scans the local SMT mask to see if the entire core is idle, and records this
  * information in sd_balance_shared->has_idle_cores.
@@ -8971,7 +9000,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 	if (choose_idle_cpu(target, p) &&
 	    asym_fits_cpu(task_util, util_min, util_max, target))
-		return target;
+		goto select_smt_priority;
 
 	/*
 	 * If the previous CPU is cache affine and idle, don't be stupid:
@@ -8981,8 +9010,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
 
 		if (!static_branch_unlikely(&sched_cluster_active) ||
-		    cpus_share_resources(prev, target))
-			return prev;
+		    cpus_share_resources(prev, target)) {
+			target = prev;
+			goto select_smt_priority;
+		}
 
 		prev_aff = prev;
 	}
@@ -9000,7 +9031,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	    prev == smp_processor_id() &&
 	    this_rq()->nr_running <= 1 &&
 	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
-		return prev;
+		target = prev;
+		goto select_smt_priority;
 	}
 
 	/* Check a recently used CPU as a potential idle candidate: */
@@ -9014,8 +9046,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	    asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
 
 		if (!static_branch_unlikely(&sched_cluster_active) ||
-		    cpus_share_resources(recent_used_cpu, target))
-			return recent_used_cpu;
+		    cpus_share_resources(recent_used_cpu, target)) {
+			target = recent_used_cpu;
+			goto select_smt_priority;
+		}
 
 	} else {
 		recent_used_cpu = -1;
@@ -9037,7 +9071,11 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 		 */
 		if (sd) {
 			i = select_idle_capacity(p, sd, target);
-			return ((unsigned)i < nr_cpumask_bits) ? i : target;
+			if ((unsigned int)i < nr_cpumask_bits) {
+				target = i;
+				goto select_smt_priority;
+			}
+			return target;
 		}
 	}
 
@@ -9050,14 +9088,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 		if (!has_idle_core && cpus_share_cache(prev, target)) {
 			i = select_idle_smt(p, sd, prev);
-			if ((unsigned int)i < nr_cpumask_bits)
-				return i;
+			if ((unsigned int)i < nr_cpumask_bits) {
+				target = i;
+				goto select_smt_priority;
+			}
 		}
 	}
 
 	i = select_idle_cpu(p, sd, has_idle_core, target);
-	if ((unsigned)i < nr_cpumask_bits)
-		return i;
+	if ((unsigned int)i < nr_cpumask_bits) {
+		target = i;
+		goto select_smt_priority;
+	}
 
 	/*
 	 * For cluster machines which have lower sharing cache like L2 or
@@ -9065,12 +9107,19 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	 * first. But prev_cpu or recent_used_cpu may also be a good candidate,
 	 * use them if possible when no idle CPU found in select_idle_cpu().
 	 */
-	if ((unsigned int)prev_aff < nr_cpumask_bits)
-		return prev_aff;
-	if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
-		return recent_used_cpu;
+	if ((unsigned int)prev_aff < nr_cpumask_bits) {
+		target = prev_aff;
+		goto select_smt_priority;
+	}
+	if ((unsigned int)recent_used_cpu < nr_cpumask_bits) {
+		target = recent_used_cpu;
+		goto select_smt_priority;
+	}
 
 	return target;
+
+select_smt_priority:
+	return select_idle_smt_priority(p, target);
 }
 
 /**
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c3ad70e58b8e..568cb1ed2dd6b 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2240,6 +2240,7 @@ DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
 DECLARE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
 
 extern struct static_key_false sched_asym_cpucapacity;
+extern struct static_key_false sched_smt_asym_packing;
 extern struct static_key_false sched_cluster_active;
 
 static __always_inline bool sched_asym_cpucap_active(void)
@@ -2247,6 +2248,11 @@ static __always_inline bool sched_asym_cpucap_active(void)
 	return static_branch_unlikely(&sched_asym_cpucapacity);
 }
 
+static __always_inline bool sched_smt_asym_active(void)
+{
+	return static_branch_unlikely(&sched_smt_asym_packing);
+}
+
 struct sched_group_capacity {
 	atomic_t		ref;
 	/*
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227d983a7..06c40eb5932af 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -683,8 +683,24 @@ DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_packing);
 DEFINE_PER_CPU(struct sched_domain __rcu *, sd_asym_cpucapacity);
 
 DEFINE_STATIC_KEY_FALSE(sched_asym_cpucapacity);
+DEFINE_STATIC_KEY_FALSE(sched_smt_asym_packing);
 DEFINE_STATIC_KEY_FALSE(sched_cluster_active);
 
+static bool has_asym_smt_domain(int cpu)
+{
+	struct sched_domain *sd;
+
+	for_each_domain(cpu, sd) {
+		if (!(sd->flags & SD_SHARE_CPUCAPACITY))
+			break;
+
+		if (sd->flags & SD_ASYM_PACKING)
+			return true;
+	}
+
+	return false;
+}
+
 static void update_top_cache_domain(int cpu)
 {
 	struct sched_domain_shared *sds = NULL;
@@ -3084,6 +3100,7 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 	struct rq *rq = NULL;
 	int i, ret = -ENOMEM;
 	bool has_asym = false;
+	bool has_asym_smt = false;
 	bool has_cluster = false;
 
 	if (WARN_ON(cpumask_empty(cpu_map)))
@@ -3202,6 +3219,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 
 		cpu_attach_domain(sd, d.rd, i);
 
+		if (has_asym_smt_domain(i))
+			has_asym_smt = true;
+
 		if (lowest_flag_domain(i, SD_CLUSTER))
 			has_cluster = true;
 	}
@@ -3210,6 +3230,9 @@ build_sched_domains(const struct cpumask *cpu_map, struct sched_domain_attr *att
 	if (has_asym)
 		static_branch_inc_cpuslocked(&sched_asym_cpucapacity);
 
+	if (has_asym_smt)
+		static_branch_inc_cpuslocked(&sched_smt_asym_packing);
+
 	if (has_cluster)
 		static_branch_inc_cpuslocked(&sched_cluster_active);
 
@@ -3310,11 +3333,24 @@ int __init sched_init_domains(const struct cpumask *cpu_map)
 static void detach_destroy_domains(const struct cpumask *cpu_map)
 {
 	unsigned int cpu = cpumask_any(cpu_map);
+	bool has_asym_smt = false;
 	int i;
 
+	rcu_read_lock();
+	for_each_cpu(i, cpu_map) {
+		if (has_asym_smt_domain(i)) {
+			has_asym_smt = true;
+			break;
+		}
+	}
+	rcu_read_unlock();
+
 	if (rcu_access_pointer(per_cpu(sd_asym_cpucapacity, cpu)))
 		static_branch_dec_cpuslocked(&sched_asym_cpucapacity);
 
+	if (has_asym_smt)
+		static_branch_dec_cpuslocked(&sched_smt_asym_packing);
+
 	if (static_branch_unlikely(&sched_cluster_active))
 		static_branch_dec_cpuslocked(&sched_cluster_active);
 
-- 
2.55.0

