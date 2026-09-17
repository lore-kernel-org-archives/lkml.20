Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010031.outbound.protection.outlook.com [40.93.198.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C911558E2AB;
	Thu, 17 Sep 2026 14:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654111; cv=fail; b=H4KT+TJYAR8TpNgzkJ+4WDlD7+qCcWae4KcHqoG3VbhdeFZKRGcbQeXbfDmRJlZ1WVKQHvRXVZ9994upr2p+KmARQsHAckPIhDAeA+N+EUijqZ+52LsIA7OSn0eXs/LtDVBmlFhdB32DEGTWiSd+NoUhSBAYHCrUYS/Xnin9QxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654111; c=relaxed/simple;
	bh=8IwXRxlIIjd8E5Lb5ezjF38l+Y7t0oxG/KZBl/GDzGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SOGtH9qxFC2TEyqhHruMdyfbEiE/qY4mCd615qvrcJYWlLEgWlDZfTjkh3Ra92XJqAfNsElKrdcYY6hzNSc+cgASybpuvnFd1YA6kBEHsEogWyuAu3aULAq4nsdibITrGLNXoOeE/Ueyvka/aeEs1BHekI8wqVhNvto3x1A770g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qyVM4gVf; arc=fail smtp.client-ip=40.93.198.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qyVM4gVf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3qzKu9TeyI+kkozhPPxgGSb0D+lxfknRAaEmVtKuo4k3K1FUOnH+FROQ3R862Ykgz35YhEDSWZrNYwkjrTcwCDRaN9lUSEpCaM8QPs/XyV5Dq6bY6bVoXJEM4E1vVNIpMrNPQexmZ7zTgRfrmo7kNbx9mJEzx0Vc0A694JSshxiRhL2w4YE45OhMVYLkVc2pCpg7slb6BFoPpnnkqFwR6CRuRld05CCQm8nm1Xf0V+E3yha3dNu9lDRDjJcRNJaECtA1mah4ce91CXC7TamECcTAVjkRYPoWn3+Lz9RMLHuzc8BcR+WDvnJL2xl0Ve8ytEfZ0ARKaU+lx9mFZ1q5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DG2UxAzUT5chIucYuNWTbGx4t/FLWSot4kyllLqhBg0=;
 b=bEJ9/1DRcIGA4QGuCaPNxJ+JD9Nq/HSdPfed4gqcJHSyDyJ4iNiP3mehndduiUVqhh1SPdDymOyzUjHtYsxbjQ45Iz75ezSDBv1GWpMgxF5zzxDUvuktS6yzgQkq6EGaGybnVXOV4Km5AVVituyO9ZGKgCAHxCQLSSfBv2o1CTEqF4nAe9Pzk+wl2Y1v0VfW26dzLs/zo5VBVXEGgvYCL0PyyE9bHM/n76eIqJjoxiHEqtrYVpo46yS6/bWf8IQi+D/+INM2azaeHUPFZQS+p5v1QPf9KKm+bUENbcvseZWynEnzWEWcGs6lDER9m1SncqvVUaYnswyWxomgEjdB3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DG2UxAzUT5chIucYuNWTbGx4t/FLWSot4kyllLqhBg0=;
 b=qyVM4gVft1v/JkSJJoQvAnKAY3xiwE+/WerCNc/64OPUTGt4n+8GZzBid5ZfcpKVu+2hDoZZ647hVbvBhBoUaFt/MpP9YuchnjN2Dn03MABR4wMq/EagVHiEPHUV4hRCsa8+LnVAWPwt1IUxUEZdneq83vQn3Vf60GyA62R6TwzKoLCi62zSzv0Q5bSIqty/iPeWUj+qkmKgR2UYLjM0XO9prABSXAGUDQAdgi/C8YETC+d0WyvHxmcYhS3IR/Ck5A5WUbOWzoHqu2sOGoyBx4DBC6Q/OTfwFPe4McJ/tfzpKIIcNJ1qWEPOuYMbXRrIiijTJCDxPBh1MG5KWCSVYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by CH3PR12MB9219.namprd12.prod.outlook.com (2603:10b6:610:197::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 14:07:28 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%7]) with mapi id 15.21.0428.008; Thu, 17 Sep 2026
 14:07:26 +0000
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
Subject: [PATCH 1/2] sched/fair: Honor asymmetric SMT priority in idle selection
Date: Thu, 17 Sep 2026 16:05:20 +0200
Message-ID: <20260917140707.3807229-2-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917140707.3807229-1-arighi@nvidia.com>
References: <20260917140707.3807229-1-arighi@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::16) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|CH3PR12MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: 2746440c-9581-461d-3adb-08df14c500d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|11063799006|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Qa63fbjZDf6wiQrWRvIxjTs71iXp6jcgiZYMFbmBzC/U2IpjJvI/C5w4Fx3nflgwcvwVIoDMtdd9CvfYKbR4qFCzj75P+JdpWpP91XA/WgZfYYJeazr9X9fK102Gq7gBvuWcmSzruKMRvwS2FKcEvj+eT1FfNgjBvHbM7Z6g9uNXqofrdZr5ZvbgxIBr1lcGJYJZc3cpVFA3HOd84xD7xlphAQXnnwoLu19jVTm3UGrgLmNtl96jUVog6cCLQa6Rb12ysDj0w9lNwdEcnO9xCu5Uid9TfHt7kZKeQiSJ4CWBizFo7Z8NCylfetdFPlc6835ob/93MLXiZvtAbyJm4zpuSVRXFYCEgDP8CUOWFd3LvyNWXsYusrCm6OXg7DxEyEdtoD5vcyEu/kkhcyES6p4mqdKtVINDZJS2sh3ePvth3w3ZZ2655ODL16f+n66u6BEAv4CXPWoN8MNOlyBV0UnIeZz6VpZdP3PGi665qk9nmQ+RsdvtJHqv7EnmG5euNjNqesHoHtpqhueTAAqe4q/tLTNqdhpbCD932On7jhQ44dzDfflyhfpYjLaedtzqRxg/iG4INeAPg2zyQW2EiXttX/KN0/Qa32S92bmberGuvc69gXLWq6f5CpZRp4Fn1/IHthPOqAnjcnpQ4jb6BYr31ysfIFOR8ZtCXz9Ahgg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(11063799006)(10067099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VQXt8eUbpsn9u982pwKgysqDhD7RUsIX9sB5xZsCdl8OJpe3na79V5VYk+rV?=
 =?us-ascii?Q?nBqQAj16S9Lee4vBhY70G+C+gw6rjbE49w5TdupQZOtpDky5cCIbbTKDeSAe?=
 =?us-ascii?Q?UuGDBdvvQIb5eWAueY3/tSYLcqZG0o+hywYm0pcVUYzzA2GugS8VAggX+3jl?=
 =?us-ascii?Q?Ipq07c1IDKtLkNRrvNJsB8AYht1ZzODls2cZsb6ZjHrVtJxcBAEy4/ddc5AH?=
 =?us-ascii?Q?igBDABM0SVZ2IEVnKPb28Sq7gqpbwhZKUjdBW46SE2oWImzWKRpB2PtYEyYJ?=
 =?us-ascii?Q?/Wyapc8Vs4p6KV2QIOXf06BO406+yRdb5lcLqj0QzolG8H7eEqvqhK2RIiXS?=
 =?us-ascii?Q?HWlKJRjGAN8s/tzqykOcO/8Kuf8AaZ3y2w3jN88UqOVD3kFEc5CgPy8btQot?=
 =?us-ascii?Q?nTCZ0fvxiOz2C0pKmWzjCAuMNPEdsNAIncdixFAGdZ3L78PNBdIbnKo3cAbE?=
 =?us-ascii?Q?wiIdMu3Q95E6ZcmNM672WBfQLNt5PoQTlOSY9A6hngBERhmxHMxq4NHtcbXQ?=
 =?us-ascii?Q?OViCC2Q9FFZZAsWrWDgi9vJe20h7CJTwlBiClBfRLS5HBdiG2yLYJ/Riyq9n?=
 =?us-ascii?Q?mHkXgXhH926VDcXxhztu/TfxZTKJ+ZK/x0StLkrKzcBTeiMgbiBYNeG63Egu?=
 =?us-ascii?Q?PfVclknBpfxp/d9P9sgFXiT7/3EhHts9qykQlMK/yYKbQhPPAKCYiYCfjb0v?=
 =?us-ascii?Q?q8/VEKj8j2MUBoLSB61s80flMTtobovj7R5V525ocQ2BwyXRNNHLo/T55dwz?=
 =?us-ascii?Q?XUjPwGf7AfpkKiERDgN7V4jDng0lLHIalCduBecspZ6cVnrXq75cOzIVcRZz?=
 =?us-ascii?Q?5SNCXNgh/q7oWM3O0SRGd6B61VrSvC+PMZBQM9TjLBBxSuOCxRLqe9g1SC25?=
 =?us-ascii?Q?JdbwCSD+OROc2pgHGq6oHO1H1nbHMag3UiCHcP8S9SAeaLSQiD/lkYNe0TqC?=
 =?us-ascii?Q?aq9kT9EH+a+QJP06sFytVOqOkjK400LyD9htdHbtMArEpPWFtsZyeKUtpYMb?=
 =?us-ascii?Q?h5Cyb+sSefoL/ONugexO7MFa9kXACWaIHaWEo8ipcGAVEfdwhm9XE9brLEHh?=
 =?us-ascii?Q?2cFy1L+sqJD4YYfQH4x4kxBlSKn1dx/FMZ+PbU70y9Mzsj7zlfM8Nt6DxP42?=
 =?us-ascii?Q?37DMLknS+zhhm9KjpKaro9GLy4byrPTtIA/oE/pcMLVGm43IiMgaXCR1mLWf?=
 =?us-ascii?Q?EcXARZ6ZMJJlcRKX7F2rJvbvwMX0n+gIdwT2D9RSifZYUyQVM3BZDN/LhZo1?=
 =?us-ascii?Q?wYQmxB/NFWgOgGlLK4oZwX65ErglePfp6WGuJgDI6J9V4uQipq+dtF5q+2Im?=
 =?us-ascii?Q?X4lu1kD0Bztm6G8yKa4Zm4P0NyCbo+xYCPaEKhkIZ8SpApYhDP+fLJAGT4in?=
 =?us-ascii?Q?9x7U9MV2z29ZXd/vutvn3GZ6fNyoTr0QxXt+Zgu9/6FkwnkGI7brMDb+mwr9?=
 =?us-ascii?Q?FXecm7AID2ueROYQGAHEJgCU0Z3DkTCvqQ90j6Jm5kJDJ4n2WL7Xg1nxB/SN?=
 =?us-ascii?Q?JjJrxovioRlCFE73bKCgqnYsHj2gT7Cbow0YE2kUzMhH5ZWbsgYFcHHsf8Nc?=
 =?us-ascii?Q?diNFUedyszdH1S0RgeLPQqpKu/nXpqIGd3DcKgNfPcTKy9+Q0dKYiX2b3E70?=
 =?us-ascii?Q?xtG4jkUIqDN0b1W4s8fFHJpVcJVyr+Uxw2jGnUuV77HtusbAdLcn9s0ZFfhW?=
 =?us-ascii?Q?kWvVOdZgixxczEiJM6YTjpCVQDONrp/+iamt3YZNzakSTcGhtLmw9zBpQcrV?=
 =?us-ascii?Q?qhB5Cv+vbA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2746440c-9581-461d-3adb-08df14c500d6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 14:07:26.6690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9f/huj2a8ydgx7alFTDyaZvVO7YvpMozmJ3AKSGNF5+KWEski2Ttm4OgQoU8fTUJR+Rfa2IMswTXtWQibt8dlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9219

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
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/fair.c | 85 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 68 insertions(+), 17 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 4d0b94465d19e..8e6dc3a657cca 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8598,6 +8598,35 @@ static inline bool test_idle_cores(int cpu)
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
@@ -8982,7 +9011,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
 	if (choose_idle_cpu(target, p) &&
 	    asym_fits_cpu(task_util, util_min, util_max, target))
-		return target;
+		goto select_smt_priority;
 
 	/*
 	 * If the previous CPU is cache affine and idle, don't be stupid:
@@ -8992,8 +9021,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
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
@@ -9011,7 +9042,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 	    prev == smp_processor_id() &&
 	    this_rq()->nr_running <= 1 &&
 	    asym_fits_cpu(task_util, util_min, util_max, prev)) {
-		return prev;
+		target = prev;
+		goto select_smt_priority;
 	}
 
 	/* Check a recently used CPU as a potential idle candidate: */
@@ -9025,8 +9057,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
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
@@ -9048,7 +9082,11 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
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
 
@@ -9061,14 +9099,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
 
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
@@ -9076,12 +9118,19 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
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
@@ -9758,8 +9807,10 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
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

