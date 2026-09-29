Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3613B535FD9;
	Tue, 29 Sep 2026 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790700970; cv=fail; b=DF0S6RBdN8mKcw+DwGVmEuyXGLtxu5v1hF1F5jgjQJNJdR0953I7VNEyu9V+ocka0FNpwlmxG2iPJLUdgrGUSUMeiQnkcby/3iyq2dHVnendpIuml1qcEUhRwfpcxspekcy31X4nl1VJtqNCo7HnGKkEE88KUbxyQQzcdVEDRGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790700970; c=relaxed/simple;
	bh=mzxOBUj8sWXwdLYL+tY1lNBbqOPCSWo25yfRBuvvkVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RQT2DbA8n4D3idVVREJBZf2gqCd5WJWbIvswZkrHuNClLt5xjMzwJVApLnIuiHaoRJE2KvJyhJQ1E3ZzovoaUCnpoacEs6qexofKJ/2/bi5vxLBt1iSQ3tREG+YKviKeQ0dcS2S12Y5Ivt48idU/jYBO80QOUWwDV36tJjG6K4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f2fH7p3D; arc=fail smtp.client-ip=40.107.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f2fH7p3D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtHSbHbz+q24ed+OcjBtaiR+bHWLiKQ+4e1sWuN3r2V91UIg1nunDU/pweSk7UVGcU4/SuTUzUXO6P0XH7LIOoEdy3WaSGoakAE3WOKSjeChdS2bi94SafmCN45p029rF5qMtwJ+n10nz/w+ajL/R1qK9NIcwSOkrk++NzWV1ydOPOdl8FJ1EfVnr9LcKy8K4FeHNle+OEDcmxqvqA1reR/k18ETaevt1g8S/n1sUtrjSt4sd91MJIrMpn9AZ1ypQSDn/9xTT8MSql6knQHZWTV8KdfrCfOZjBPFtQaTApVe5otWvWkvzz3PLju0wySjMDEacFJ74gmDWkV+shZTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1Xc3vhlAaEgYYWJXYc1aFYubeUDOW3ia2PbHNFaGSQ=;
 b=LPRh5wjnQH4ukvFp6UcNqyXS4jj7TUSd3pO/fF0J3PfA7hZI8mZ27DnLy6eZplY2f8Uct210Q4l5s4H2EW8Rrg7uAwldM0hFXczIVwG7FSl2XoYscKx0eBkcesZiW3h8KWOScNZawOMAkgodvBL3LzYV8Ijr+tGGgmoUkom88eUHs5MQWFX8flrMWTaKnOeGL+YeHSS6AtgfdisMYfg9M9S+7XD2dZCPcxO/fCsMqh+gMTFnKpfFDjTK3kqCJp4lUcYf0K4+LKSmyJ0G08Z6DBePjir8j+oPceeFlXLu/fnWRYtI685prJyvAuO+6Tj2gJu8aV8V9bMaUTxbSfvPhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1Xc3vhlAaEgYYWJXYc1aFYubeUDOW3ia2PbHNFaGSQ=;
 b=f2fH7p3DNfRGV/c0/Py05b+Mm8U9cmzU3FNhYWbOKO/3jULh2x5AfVmon9zhirrwCkEEJR5lVid80+XRMdhiMIIQEHWIgIWpdP4QQX/np4pFQOx8dbRrcfNfFAw1CQabp3jkpE2blAF5iZOiFjtr87WV/ZcFAona8F6jb5g/LxHATrJUDD5lPBLi9f3WqrktW3jJlsiWakJYlDfSOFfBNcIHtO/Z7Rf7vTvg1t0mn1AJ9ZSizVE1/xnZueEmearBmRuoRAy2to/e8dPwRPAKDicLpjXhQhkyU8Zb+DlAaz2xvGYlxPSg2q0wxv1J1jw5SZHEcGXT9u35qDzolpRikg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 16:56:00 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 16:56:00 +0000
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
Subject: [PATCH 1/2] sched/fair: Honor asymmetric SMT priority in idle selection
Date: Tue, 29 Sep 2026 18:54:40 +0200
Message-ID: <20260929165538.726616-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929165538.726616-1-arighi@nvidia.com>
References: <20260929165538.726616-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::12) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c401dc6-6837-4a81-ee90-08df1e4a897b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|7416014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vMpRFD/ytXAJH5o/Q4oqsigOhd+84Y2qcbxnbyvFvwCQgZzZXMyvYpMUqEo4GZHNsqrbLQkTjCLR9VpNCt/TgYmTP3MkJwMydfk+KOUWAVM13+C3Y/L4tFs34dCR7WxOH6EVVCsaXW8/UsC1YSieAmoJhef7BbPoNuO/0u+8my9zje7U6a+51Mcjca9BVULQ1W+wRFGDj5sKibQ6CZWhgtB8FpbaiYrkv29vVkVhu+sDoiXzby1kh5eAJNNY6tRhMwz5rhDY5kaZjSc41snE4jJizPRLldwMY8ajBrVEbodC60LCJkVyQO+l5cNOLKQIExlSFl4UsUWkEmWcnQMLYMdkrZV6ADSvs95Q8bSbnZjWRLFMlt1PTPgDt75QYmI6ueTquPPG7DmCkJGWH3EdSOwj5NMcMXWghpcCq4EiCobT5Ge8Y/OlecH6jTv5Xt4AlfnrTvojnGQC9XffqyBM9lqWMGWcWIQQKdXcQdymxJQdsNpkApnJ67z55Do1N0hjgZZ6fMuJ5UQrgB5qaUqWZykycavDpMPqrHX5FeOs7VyMX9O7BGB9v5e1elcN2KmZsQ8o34wXfyWJqWbf+41WlsMOFAi8LPlD4eWRpyEL2DccnSmKxrlOxIoWLPHnWhTcc1bOon3NSktZgUaDNFj+Jp3QihjbgvU4SasFet+/rnU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(7416014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Oz6kl5FAf290Q3lYq4np+NuFo35S/u9qA5CzP0BEDoompc4A86AXELRE9lGI?=
 =?us-ascii?Q?clNn5dSoemTo0OfuE7onR4N6vItp+IiF1mZpUlwyr/wI+kpMA/pPwPr0ayoM?=
 =?us-ascii?Q?5LCB198nPZ7Qjiy+dbYHe5nNiMFYvo/4sDY4KeoOgPeHZ6IowdTRUnOdw1K+?=
 =?us-ascii?Q?dfzjqd0E9nfoWUVDqEAi0xYBW3I0QGCULzA0Ne9HWLzkJV+9/1b5MeVuKvs6?=
 =?us-ascii?Q?NFH4FIQ3n8hbdW9pYMga0dObohcDjph6Isc2cRlHBcn3oDglzqjfV/LXyWJN?=
 =?us-ascii?Q?2SAI2OOww7xHpnh8f4BSc9b8xQmJ5l2iy+UTFsZ2TxloMg6RbY541Ny1Jmep?=
 =?us-ascii?Q?iAuzLrNUb8S7aBHXJCxO9czyzGbOb7DEQuJzvWP66tCFs4u17VU//nEXMKIA?=
 =?us-ascii?Q?4pwAdWxKkaFlS9yZAI4JtAv4wdu/2xSuuLwaQbQlqyAjU3xi1yEaHGWrC99Y?=
 =?us-ascii?Q?wfY5+uCRiYCTnz+dTpBL/SicJhNOlxR5TSMuaJB+6CwUguCnvmN8eCqzWuKH?=
 =?us-ascii?Q?wBthYPWvYwZ9UgUzuOMTnpqZkCSxpz+/F8QyeI90GsVEQeGANtJmkchhh7ml?=
 =?us-ascii?Q?oh2i5UNR5GeHQKRLPPJYbyKcY2rweijRUqSIssdMJSTz/tQfabtzpVGG3lpL?=
 =?us-ascii?Q?ghA5Bil+XZvnWfwncjhiZpQW1zQX8nNxJTDUSB++HORaoWVJ0DtqcMSFdWtm?=
 =?us-ascii?Q?gSyj7cbRCZzgDRDkFBUllZx5V3rbjblREQL10GehjtG+/7ORBk7oQxDg8KqX?=
 =?us-ascii?Q?SKm5inCOZNZMCCfJaR6Spc4lGobsNSohzsfpsyS2pfCd1tnA7KwCr9B/IgLH?=
 =?us-ascii?Q?Lif6uIBz9gRou0nj3ahlxf/+SSmGynnE8hcdJKyQ5p4BbBsHLmf1sJFEbtFI?=
 =?us-ascii?Q?BYbEx2WRy4sycGMqEmZpG1NnYiIZITOGiAcDbskqb3TR3fCP9MZvKanBjnxM?=
 =?us-ascii?Q?LxceKphydeSzFOYS/Msdh8PfV5DgLVkGMlWOuhYdZNCeIfSTtgRilwKX6m6V?=
 =?us-ascii?Q?aJrIFMlH8JNDNwae0mfmGc03/0m2LMMeYicuH9cF9CDTfoDO+QeWITDPpmXT?=
 =?us-ascii?Q?0QkNC1FTA9/Bd49hg1WFGQW+8W5JuqlodDGB2doVebdRBgSHe9W20zJYXbQx?=
 =?us-ascii?Q?zK2dvI0JUrWHUAycFgiQ8RyzI6PB5VBao+didJ4EEkHHDEvIaUuXf3Re0f2u?=
 =?us-ascii?Q?TLcCasEWonNJdfuRopieU6Ks6eisGapc8ezsag5C6Z9zM3qX5jV6FRqV88UR?=
 =?us-ascii?Q?Cff1OGLWZFWHLeTaU+7Ssi1HfO4CptZDBsdo3OfnhqT2OSVQ6L9xcsIwg9aK?=
 =?us-ascii?Q?lGi7MsJQf06SJmXFASEoXDpuWX6qGaUsGAukzuPcAJZ88U5tD4MbJJa6QVes?=
 =?us-ascii?Q?8Z9fouEY2Yzeh1XVbyslbAlyTN7lMEOdaPkeHienZkj5SgyCT9hCEQlkYuP9?=
 =?us-ascii?Q?aAlPYLs1otmk6RbsFSgcSDDgo1IEgjXdweZ0S2mNkXx58lPCqJNPF8SxqYxD?=
 =?us-ascii?Q?O+CQcaBVOFLyjbrkNmWM9i5dpglq2SuDHCPcsYkYq7ecDtkevhO9B9zNF1nr?=
 =?us-ascii?Q?p7ryEFmvd8dLey7U/AFvqUybo1pB++0JtTq6O1ATB16ia0b2dZAuEp7bI4CQ?=
 =?us-ascii?Q?GMHyod/BfKCrF8jrMrzZEMqzrcJFVkB4di8sDQIQ4NrF20qH3sfIkzZ006yR?=
 =?us-ascii?Q?UZe8tEYyMsaHqIht5334aE2YiW6Wgy+nLgb6+LqywTT6XSN5M0Iq65ozsfLy?=
 =?us-ascii?Q?Ru3TTfEdMg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c401dc6-6837-4a81-ee90-08df1e4a897b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:55:59.7880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7DzJ53nO4t8HzSCkgS5GW2aJeThLy0t7bcJ+b0DRH4YpixvoQaJZZ48WVbha9YJjdNMFFOZJseZLw8WWWeMDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620

POWER7 uses SD_ASYM_PACKING at the shared-capacity SMT level to order
hardware threads, and NVIDIA Olympus benefits from the same policy. Idle
CPU selection does not consult that order, so a task can wake on an
arbitrary sibling and remain there until load balancing corrects the
placement. On these systems, that initial choice can prevent the core
from entering its preferred lower-thread resource mode and cause a large
and persistent performance loss.

When idle selection finds an available CPU in an SMT core, choose the
highest-priority available sibling. On SMT2 Olympus this only changes
selection on fully idle cores. A partially idle core has only one
available CPU. On wider SMT systems such as POWER7, it also fills
available siblings in priority order while the core is partially busy.

Apply the preference to idle-core and idle-CPU scans,
asymmetric-capacity scans, target, previous, recently-used CPU fast
paths and the slow path. Inspect the lowest scheduling domain directly,
but require both CPUs to share its span because isolcpus can split
hardware siblings across scheduling domains.

Keep physical-core capacity selection independent from SMT sibling
ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
maximum capacities, then SD_ASYM_PACKING selects the preferred available
sibling inside the chosen core, whose siblings continue to share equal
capacity.

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>
Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: Kayra Cizmeci <kayracizmeci@gmail.com>
Tested-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/fair.c | 85 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 68 insertions(+), 17 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e707da7177dfe..5c98d8dfce5d8 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8799,6 +8799,35 @@ static inline bool test_idle_cores(int cpu)
 	return false;
 }
 
+/*
+ * Redirect a CPU to a higher-priority available sibling in its SMT domain,
+ * subject to task affinity.
+ */
+static inline int select_idle_smt_cpu(struct task_struct *p, int cpu)
+{
+	struct sched_domain *sd;
+	int best = cpu;
+	int sibling;
+
+	if (!sched_smt_active())
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
@@ -9183,7 +9212,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 	if (choose_idle_cpu(target, p) &&
 	    asym_fits_cpu(task_util, util_min, util_max, target))
-		return target;
+		goto select_smt_priority;
 
 	/*
 	 * If the previous CPU is cache affine and idle, don't be stupid:
@@ -9193,8 +9222,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
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
@@ -9212,7 +9243,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	    prev == smp_processor_id() &&
 	    this_rq()->nr_running <= 1 &&
 	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
-		return prev;
+		target = prev;
+		goto select_smt_priority;
 	}
 
 	/* Check a recently used CPU as a potential idle candidate: */
@@ -9226,8 +9258,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
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
@@ -9249,7 +9283,11 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
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
 
@@ -9262,14 +9300,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
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
@@ -9277,12 +9319,19 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
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
+	return select_idle_smt_cpu(p, target);
 }
 
 /**
@@ -9959,8 +10008,10 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	}
 
 	/* Slow path */
-	if (unlikely(sd))
-		return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
+	if (unlikely(sd)) {
+		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
+		return select_idle_smt_cpu(p, new_cpu);
+	}
 
 	/* Fast path */
 	if (wake_flags & WF_TTWU)
-- 
2.55.0

