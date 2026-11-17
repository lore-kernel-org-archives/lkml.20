Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921855;
	b=eKCq8jlqgim4PP7R7Mx/TFd0DZXPCZEGKP2jlhb19CDQlxlIhSlLVWRw9IvE22FcEH5a
	 GcrZMBgBTsxnH9bYhM32RupUL0Tbwu58HROr2qz3yO92lCmFY9k9vKiTETQLavySoseIp
	 sYoI5TiG0XaWjT0VuE1nMOmMiR9VzUyAWsj+s3MfazjLvc45kDQMvE0OdW7BtiXHPDfmi
	 uNdNjSDJzKoO5HNRg6j5Yk9JabIKRyD3/hnOgUOko8Z5QAflMk106fx+CGNFNfl9bXle8
	 uwLLBUQ+f5Suw4ClIvLfzIQD31n6ELMFRKCagwABT3B46NWs4KRZ0ea5hIQuwkURYOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921855;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy;
	bh=WgHIUGWl/QxLO6GUBLCNn2+1xcczHU88aoHvaa5zjk4=;
	b=aL18qNSFh1UYNHyXGbyvV2ng8oPCBGd4lFUQO2Nf1u8if3LeQXovxYeM8X+TTX06sY0o
	 2nY7uBtg1U2Om2nkXEk8qEMQm8/jYxO+ro2QJqK54fgyMOfK/zlVe8aqadM3SDSOjX3oL
	 tQDSsRCiaiQtqbwWMwDthtQ2AzR6ibHIQ8ZXNNQ9wcpyZd3yimhMzvIBaJdYcdQ7EiB4K
	 VrfXVGtu8CY5mnd3q201K+qzuWmCboS8L70++cm876OfVdG0ZN5WQg1RT7TySBknF3Nt7
	 TxAYYojz04h4F0Jdyx0ip+uTDgfm8cmH9dBjgXMaAnXL7C7anaxXTppvw6cHiwc6kIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D74606A31C;
	Tue, 17 Nov 2026 13:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jTQRV5FGnzVcBC;
	Tue, 17 Nov 2026 21:23:50 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jTQRS1PTSzVcB7;
	Tue, 17 Nov 2026 21:23:48 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 608BB3237CF8;
	Tue, 17 Nov 2026 21:22:49 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 17 Nov
 2026 21:23:45 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Tim Chen <tim.c.chen@linux.intel.com>, Chen Yu
	<yu.c.chen@intel.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<wujianyong@hygon.cn>, <jianyong.wu@outlook.com>, <wangfengyu@hygon.cn>,
	<zhongyuan@hygon.cn>, <huangsj@hygon.cn>
Subject: [PATCH] sched/topology: Add new kernel parameter to tune NUMA domain flags
Date: Tue, 17 Nov 2026 21:18:54 +0800
Message-ID: <20261117131854.924760-1-wujianyong@hygon.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: cncheex06.Hygon.cn (172.23.18.116) To cncheex04.Hygon.cn
 (172.23.18.114)

Sched domain flags can largely affect performance on systems with
multiple NUMA levels, especially SD_BALANCE_FORK, SD_BALANCE_EXEC,
SD_WAKE_AFFINE and SD_BALANCE_NEWIDLE.

SD_BALANCE_FORK and SD_BALANCE_EXEC decide how far the slow path of
select_task_rq_fair() searches. Stripping them from the high NUMA levels
reduces the number of CPUs to traverse and speeds up fork/exec.
SD_WAKE_AFFINE decides the wakeup scope: if the waker and the wakee are
farther apart than the highest level carrying it, the wakee cannot be
pulled next to the waker on wakeup, which may hurt performance. However,
these three flags are all controlled by a single static threshold,
node_reclaim_distance, which can neither tell them apart nor be changed.
Different workloads on the same system favour different settings, so no
single static value fits them all.

The same applies to SD_BALANCE_NEWIDLE, which is set on every NUMA level
and cannot be stripped. Newidle balance on a high NUMA level can take a
long time, even when there is no task in the system to pull.

Introduce a new kernel parameter, sched_numa_flag_distance, to let users
tune the flags above separately on the NUMA levels. A group is stripped
from the levels whose node distance is greater than the given value;
once set, this overrides the default for that group:

  sched_numa_flag_distance=forkexec:<d>,newidle:<d>,wakeaffine:<d>

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---

Notes:
    Test results
    
    All results are normalized to the default (no parameter) = 1.00.
    UnixBench: higher is better; latency and time: lower is better.
    kernel.numa_balancing=0 for all tests.
    
    Machine A: Hygon, 2 sockets, 256 CPUs, 8 nodes. All NUMA levels (15,
    25, 27) are below node_reclaim_distance, so by default every NUMA level
    has fork/exec, newidle and wake_affine.
    
      node   0   1   2   3   4   5   6   7
        0:  10  15  15  15  25  27  27  27
        1:  15  10  15  15  27  25  27  27
        2:  15  15  10  15  27  27  25  27
        3:  15  15  15  10  27  27  27  25
        4:  25  27  27  27  10  15  15  15
        5:  27  25  27  27  15  10  15  15
        6:  27  27  25  27  15  15  10  15
        7:  27  27  27  25  15  15  15  10
    
    Each setting was tested in its own boot of the same kernel:
    forkexec:10 drops fork/exec balancing on every NUMA level, newidle:20
    drops newidle balancing at distance 25 and 27. The default column is
    the average of two boots without the parameter.
    
    forkexec:10, tested with C2 disabled on all CPUs
    (echo 1 > /sys/devices/system/cpu/cpu*/cpuidle/state2/disable). The
    two default boots differ by at most 2.9%.
    
    UnixBench (byte-unixbench), 1 copy, average of 3 rounds:
    
      ./Run -c 1 -i 3 execl spawn shell1 shell8
    
                                    default  forkexec:10
      Execl Throughput                 1.00      1.27
      Process Creation                 1.00      1.29
      Shell Scripts (1 concurrent)     1.00      1.35
      Shell Scripts (8 concurrent)     1.00      2.07
    
    Time spent in select_task_rq_fair() (function_graph) while one task
    forks and reaps 10000 children, then forks 5000 children that exec
    /bin/true, 3 times:
    
                                    default  forkexec:10
      fork                             1.00      0.05
      exec                             1.00      0.05
    
    newidle:20, tested with all C-states enabled. The two default boots
    differ by at most 1%.
    
    schbench (git.kernel.org/pub/scm/linux/kernel/git/mason/schbench.git),
    8 message threads with 32 workers each, i.e. 256 worker threads, 30s
    run after a 5s warmup, average of 3 runs:
    
      schbench -m 8 -t 32 -r 30 -w 5
    
                                    default  newidle:20
      p99 wakeup latency               1.00      0.56
      requests per second              1.00      1.00
    
    Machine B: Hygon, 2 sockets, 384 CPUs, 12 nodes. The NUMA levels at 32,
    35 and 38 are beyond node_reclaim_distance, so by default they have no
    fork/exec and no wake_affine.
    
      node   0   1   2   3   4   5   6   7   8   9  10  11
        0:  10  19  15  12  15  12  32  35  32  29  38  35
        1:  19  10  12  15  12  15  35  32  35  38  29  32
        2:  15  12  10  12  15  12  32  35  38  35  32  35
        3:  12  15  12  10  19  15  29  38  35  32  35  32
        4:  15  12  15  19  10  12  38  29  32  35  32  35
        5:  12  15  12  15  12  10  35  32  35  32  35  38
        6:  32  35  32  29  38  35  10  19  15  12  15  12
        7:  35  32  35  38  29  32  19  10  12  15  12  15
        8:  32  35  38  35  32  35  15  12  10  12  15  12
        9:  29  38  35  32  35  32  12  15  12  10  19  15
       10:  38  29  32  35  32  35  15  12  15  19  10  12
       11:  35  32  35  32  35  38  12  15  12  15  12  10
    
    Booted with sched_numa_flag_distance=wakeaffine:255, i.e. wake_affine
    on every NUMA level.
    
    hackbench from rt-tests (v2.20), pipes, each group being 20 senders and
    20 receivers (40 tasks), 3 rounds of 3 runs:
    
      hackbench -p -g 4 -l 5000          (processes, 160 tasks)
      hackbench -p -g 16 -l 1500         (processes, 640 tasks)
      hackbench -p -T -g 4 -l 5000       (threads, 160 tasks)
      hackbench -p -T -g 16 -l 1500      (threads, 640 tasks)
    
      time                          default  wakeaffine:255
      processes, 4 groups              1.00      0.80
      processes, 16 groups             1.00      0.69
      threads, 4 groups                1.00      0.77
      threads, 16 groups               1.00      0.69
    
    Open question
    
    This version only adds a boot parameter. Since the best setting follows
    the workload, a runtime knob would be more useful. Would one be
    acceptable, and if so, where: sysfs, or debugfs next to the other
    scheduler tunables? Changing it at runtime would rebuild the sched
    domains.

 .../admin-guide/kernel-parameters.txt         | 15 +++
 kernel/sched/topology.c                       | 92 ++++++++++++++++++-
 2 files changed, 102 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6169787d3805..e4d504992cce 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6798,6 +6798,21 @@ Kernel parameters
 			cost of significant additional memory use for tables.
 
 
+	sched_numa_flag_distance= [KNL,NUMA]
+			Format: <group>:<distance>[,<group>:<distance>...]
+			Strip a group of scheduler balance flags from the
+			NUMA sched domain levels whose node distance is
+			greater than <distance>. <group> is one of:
+			forkexec   - SD_BALANCE_FORK and SD_BALANCE_EXEC,
+				     default: node_reclaim_distance
+			newidle    - SD_BALANCE_NEWIDLE, default: never
+			wakeaffine - SD_WAKE_AFFINE,
+				     default: node_reclaim_distance
+			node_reclaim_distance is 30 (RECLAIM_DISTANCE), or
+			32 on AMD Zen. A distance of 255 keeps the group on
+			every NUMA level.
+			Example: sched_numa_flag_distance=forkexec:10,newidle:20
+
 	sched_proxy_exec= [KNL]
 			Enables or disables "proxy execution" style
 			solution to mutex-based priority inversion.
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 919d0fb00bd9..3bcf0db0800a 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1947,6 +1947,92 @@ static struct cpumask		***sched_domains_numa_masks;
 	 SD_NUMA		|	\
 	 SD_ASYM_PACKING)
 
+#ifdef CONFIG_NUMA
+/*
+ * sched_numa_flag_distance=<group>:<distance>[,...]
+ *
+ * Strip a group of balance flags from the NUMA sched domain levels whose
+ * node distance is greater than <distance>. Groups left unset keep the
+ * default: fork/exec and wake_affine are stripped beyond
+ * node_reclaim_distance, newidle is never stripped.
+ *
+ * Node distances grow with the level, so a group is stripped from a level
+ * and every level above it, as the SDF_SHARED_CHILD flags require.
+ */
+enum {
+	SD_DIST_FORKEXEC,
+	SD_DIST_NEWIDLE,
+	SD_DIST_WAKEAFFINE,
+	SD_DIST_NR,
+};
+
+static const struct {
+	const char	*name;
+	unsigned int	flags;
+} sd_dist_groups[SD_DIST_NR] = {
+	[SD_DIST_FORKEXEC]	= { "forkexec",	  SD_BALANCE_FORK | SD_BALANCE_EXEC },
+	[SD_DIST_NEWIDLE]	= { "newidle",	  SD_BALANCE_NEWIDLE },
+	[SD_DIST_WAKEAFFINE]	= { "wakeaffine", SD_WAKE_AFFINE },
+};
+
+/* -1: not set on the command line. */
+static int sd_dist[SD_DIST_NR] __ro_after_init = { -1, -1, -1 };
+
+static int __init setup_sched_numa_flag_distance(char *str)
+{
+	int dist[SD_DIST_NR] = { -1, -1, -1 };
+	char *tok;
+	int i;
+
+	while ((tok = strsep(&str, ",")) != NULL) {
+		char *val = strchr(tok, ':');
+		int d;
+
+		if (!val)
+			goto invalid;
+		*val++ = '\0';
+
+		for (i = 0; i < SD_DIST_NR; i++) {
+			if (!strcmp(tok, sd_dist_groups[i].name))
+				break;
+		}
+		if (i == SD_DIST_NR || kstrtoint(val, 10, &d) || d < 0)
+			goto invalid;
+
+		dist[i] = d;
+	}
+
+	memcpy(sd_dist, dist, sizeof(sd_dist));
+	return 1;
+
+invalid:
+	pr_warn("sched_numa_flag_distance=: invalid entry \"%s\", ignored\n", tok);
+	return 1;
+}
+__setup("sched_numa_flag_distance=", setup_sched_numa_flag_distance);
+
+/* Balance flags to strip from a NUMA level of node distance @distance. */
+static unsigned int sd_numa_strip_flags(int distance)
+{
+	unsigned int flags = 0;
+	int i;
+
+	for (i = 0; i < SD_DIST_NR; i++) {
+		int d = sd_dist[i];
+
+		if (d < 0) {
+			if (i == SD_DIST_NEWIDLE)
+				continue;
+			d = node_reclaim_distance;
+		}
+		if (distance > d)
+			flags |= sd_dist_groups[i].flags;
+	}
+
+	return flags;
+}
+#endif /* CONFIG_NUMA */
+
 static struct sched_domain *
 sd_init(struct sched_domain_topology_level *tl,
 	const struct cpumask *cpu_map,
@@ -2030,11 +2116,7 @@ sd_init(struct sched_domain_topology_level *tl,
 
 		sd->flags &= ~SD_PREFER_SIBLING;
 		sd->flags |= SD_SERIALIZE;
-		if (sched_domains_numa_distance[tl->numa_level] > node_reclaim_distance) {
-			sd->flags &= ~(SD_BALANCE_EXEC |
-				       SD_BALANCE_FORK |
-				       SD_WAKE_AFFINE);
-		}
+		sd->flags &= ~sd_numa_strip_flags(sched_domains_numa_distance[tl->numa_level]);
 
 #endif /* CONFIG_NUMA */
 	} else {
-- 
2.34.1


