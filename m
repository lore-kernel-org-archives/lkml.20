Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466768;
	b=H5utw3pk5qVWq36MEovXenu7OFlE9Xf8VpcQ5IZqdNqkt6t4RbLSbv/H1rkFMUq2WJ0/
	 KiTBoCqetl4BAksuDbj6vvaQJmbupamkHguUylJ9riEn4BrpdXYsZ6e0TMPOFDDieXam3
	 l32ncFX79Agghi+edECt3+SiV4eDcocbLOx2OBmiQI6asmRAUCTxsqhGzN+Y20ygmPrlC
	 xyIKI+0BWJdjnqv9H8yiN+oDASLe+4s6ETYGs9PVPnpBoZeD3I7JJ4v27hexpz8vlhuIO
	 skO5fe53ZBQddaAn8PdKBMFy5uKkq93HpNKtz1nUmotKWPPIyjEFisEMKT9K1iP/gJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466768;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy;
	bh=rFmoSTnSMtkYYDADZBNmxpX8TOGs3H7nLIjSIgwjVeQ=;
	b=KMzBNpRktXslZtLcPa7IqaU3RXsetOxi4l/GDFUjIuza+HXv03MiTfnHVbDPSPCNy+C4
	 XjKYp5XPqE2rwosS+qDBPBIY7KVXV6ErDfJS7Q32m7JV6swj8TKhAMwRdFg7za0NPtqB4
	 U0UxOCHT9ClSKTd/mKDdTextbcayTQ7uler37nkX80H8lTblT+Xv9sNXnP7S3IzoP+lJG
	 mQ5/B+Zw4rKsoQ2AZrxQpz68HdqB2HUCkWaE3mH6igZxnulFI33BnJXlTpwlOr2pfu5qQ
	 aTIeUyorYpZQJ64B4bHi3m41kDwDJKSkQv5oDKAXnp7eVCNTNXqB96bzgeYgVWfVgfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E933E606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E933E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jQB832dHXzg1cV;
	Thu, 12 Nov 2026 14:59:15 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jQB805K3Pzg1cV;
	Thu, 12 Nov 2026 14:59:12 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 4C7FC3008F62;
	Thu, 12 Nov 2026 14:58:24 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 12 Nov
 2026 14:59:11 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: <mingo@redhat.com>, <peterz@infradead.org>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <yu.c.chen@intel.com>,
	<tim.c.chen@linux.intel.com>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>, <wujianyong@hygon.cn>,
	<jianyong.wu@outlook.com>, <liuyibin@hygon.cn>, <zhongyuan@hygon.cn>
Subject: [PATCH v2] sched/cache: Enable LLC aggregation above the first NUMA level
Date: Thu, 12 Nov 2026 14:54:45 +0800
Message-ID: <20261112065445.592968-1-wujianyong@hygon.cn>
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

sched_balance_find_src_group() only considers group_llc_balance when
sds.prefer_sibling is set:

	if (sds.prefer_sibling && local->group_type == group_has_spare &&
	    (busiest->group_type == group_llc_balance ||
	     sibling_imbalance(env, &sds, busiest, local) > 1))
		goto force_balance;

sds.prefer_sibling mirrors SD_PREFER_SIBLING of the busiest group's
child sched domain, and sd_init() clears that flag on every SD_NUMA
domain. So on any domain whose child is itself a NUMA domain, i.e. on
systems with more than one NUMA level such as multiple nodes per
socket, groups tagged with group_llc_balance by llc_balance() can
never take the force_balance path.

Such a group falls into the !group_overloaded branch below and in the
common case ends up in out_balanced, so a task that was placed beyond
the first NUMA level is never pulled into its preferred LLC.

Only require sds.prefer_sibling for the sibling_imbalance() case,
which is what it was originally introduced for.

Split the condition into two explicit tests and gate the llc_balance
one on sched_cache_enabled(), so that the non cache aware case never
reads the group type, and the test disappears at compile time when
CONFIG_SCHED_CACHE is off.

Reported-by: Yibin Liu <liuyibin@hygon.cn>
Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
v1 -> v2:
- Split the condition into two tests and gate the llc_balance one on
  sched_cache_enabled() via busiest_llc_balance() (Tim Chen).
- Add schbench/hackbench results with NUMA balancing enabled and
  disabled (Chen Yu).
- Reword the subject and drop the Fixes tag: this enables aggregation
  above the first NUMA level rather than fixing a bug (Chen Yu).

v1: https://lore.kernel.org/all/20261104141313.185433-1-wujianyong@hygon.cn/

[Testing]

The baseline kernel is fb7bd3a2aad7. The baseline and patched kernels
used the same boot command line.

Hygon machine with the following topology:
* 2 sockets
* 4 NUMA nodes per socket
* 4 LLCs per NUMA node
* 4 cores per LLC domain
* 2 SMT threads per core

With the default aggr_tolerance (1), a process is only aggregated when
its average number of running threads is below 3.2 on this machine
(8 CPUs per LLC, SMT-2). aggr_tolerance was set to 2 so that up to 6.4
running threads can be aggregated. schbench with 3 and 4 worker threads
(4 and 5 running threads including the message thread) shows the main
difference. C2 was disabled on all CPUs for this test to reduce the jitter
from C2 exit latency, which makes the difference between the baseline and
patched kernels easier to see.

schbench -m 1 -t $threads -r 30 -i 100, 30 runs per configuration.
p99 wakeup latency, mean of all runs (lower is better, normalized to
baseline):

NUMA balancing enabled:

threads   baseline          patched           improve
========================================================
3         1.000             0.781             21.9%
4         1.000             0.742             25.8%

NUMA balancing disabled:

threads   baseline          patched           improve
========================================================
3         1.000             0.845             15.5%
4         1.000             0.733             26.7%

The fraction of runs in which all threads stayed in one LLC was also
recorded. Thread placement was checked every 3s, and a run counts as
aggregated only if all threads were in one LLC at every check:

NUMA balancing   threads   baseline     patched
================================================
enabled          3         80%          97%
enabled          4         60%          97%
disabled         3         80%          100%
disabled         4         53%          100%

Runs with all threads in one LLC had lower p99 than runs in which the
threads were spread over more than one LLC, so the higher aggregation
rate with this patch accounts for the improvement.

The other tests below were run with aggr_tolerance at its default (1)
and C2 enabled; all other settings were unchanged, and only NUMA
balancing was toggled. They show no obvious regression.

hackbench:
(lower is better, normalized to baseline; the figure in parentheses
is the standard deviation, as a percentage of the mean)
test cmd: hackbench -T -p -f $f -g $g -l 100000

schbench:
p99 wakeup latency (lower is better, normalized to baseline; the figure
in parentheses is the standard deviation, as a percentage of the mean)
test cmd: schbench -m 1 -t $threads -r 30 -w 5 -i 100

Each configuration was run 10 times; configurations with large
run-to-run variation were re-run 20-40 times.

NUMA balancing disabled:

fds    groups  baseline          patched           improve
=============================================================
2      1       1.000 (6.33%)     0.963 (2.48%)     3.69%
2      2       1.000 (46.47%)    0.925 (19.65%)    7.53%
3      1       1.000 (36.07%)    0.860 (25.27%)    13.99%
4      1       1.000 (34.52%)    0.992 (39.02%)    0.79%
4      2       1.000 (28.45%)    0.925 (31.71%)    7.48%
8      1       1.000 (19.00%)    1.010 (12.27%)    -0.99%
8      2       1.000 (8.94%)     0.962 (10.80%)    3.80%
12     1       1.000 (11.83%)    0.991 (13.08%)    0.89%
12     2       1.000 (7.16%)     1.009 (6.25%)     -0.88%
16     1       1.000 (12.56%)    1.030 (11.36%)    -2.96%
16     2       1.000 (9.49%)     0.997 (7.10%)     0.33%
20     1       1.000 (4.76%)     0.999 (4.51%)     0.06%
20     2       1.000 (3.12%)     0.971 (5.26%)     2.87%
24     1       1.000 (8.05%)     1.017 (3.84%)     -1.66%
24     2       1.000 (5.93%)     1.038 (5.13%)     -3.75%
32     1       1.000 (3.77%)     0.986 (3.89%)     1.40%
32     2       1.000 (2.76%)     1.028 (3.48%)     -2.83%
48     1       1.000 (0.56%)     1.012 (2.06%)     -1.21%
48     2       1.000 (2.41%)     0.989 (1.89%)     1.14%

threads   baseline          patched           improve
========================================================
2         1.000 (7.50%)     1.046 (18.54%)    -4.56%
6         1.000 (14.54%)    1.028 (13.17%)    -2.80%
8         1.000 (11.12%)    0.939 (20.46%)    6.10%
12        1.000 (14.66%)    0.996 (13.49%)    0.38%
16        1.000 (14.12%)    1.004 (13.08%)    -0.36%
32        1.000 (14.16%)    1.030 (12.74%)    -2.98%
48        1.000 (23.37%)    0.932 (11.64%)    6.85%
64        1.000 (71.38%)    0.883 (80.19%)    11.72%
96        1.000 (2.32%)     1.025 (3.42%)     -2.46%
128       1.000 (10.06%)    1.009 (10.12%)    -0.87%

NUMA balancing enabled:

fds    groups  baseline          patched           improve
=============================================================
2      1       1.000 (69.72%)    0.781 (39.69%)    21.88%
2      2       1.000 (44.86%)    0.829 (22.25%)    17.08%
3      1       1.000 (34.37%)    0.933 (32.66%)    6.75%
4      1       1.000 (35.28%)    0.816 (39.43%)    18.38%
4      2       1.000 (7.18%)     0.877 (28.44%)    12.35%
8      1       1.000 (7.66%)     0.950 (8.68%)     5.05%
8      2       1.000 (5.47%)     0.909 (12.19%)    9.08%
12     1       1.000 (6.94%)     0.999 (8.91%)     0.15%
12     2       1.000 (11.10%)    1.025 (8.17%)     -2.55%
16     1       1.000 (6.95%)     0.955 (9.78%)     4.49%
16     2       1.000 (4.78%)     1.017 (6.14%)     -1.70%
20     1       1.000 (11.78%)    1.041 (7.17%)     -4.08%
20     2       1.000 (2.93%)     0.957 (5.59%)     4.27%
24     1       1.000 (3.71%)     0.982 (4.90%)     1.77%
24     2       1.000 (3.12%)     1.018 (2.72%)     -1.80%
32     1       1.000 (3.09%)     0.997 (2.54%)     0.33%
32     2       1.000 (1.91%)     1.003 (2.58%)     -0.26%
48     1       1.000 (2.76%)     1.016 (1.23%)     -1.61%
48     2       1.000 (2.57%)     0.965 (2.14%)     3.50%

threads   baseline          patched           improve
========================================================
2         1.000 (24.63%)    0.901 (5.05%)     9.94%
6         1.000 (11.89%)    0.998 (6.94%)     0.19%
8         1.000 (13.61%)    0.979 (14.44%)    2.10%
12        1.000 (13.42%)    0.958 (16.61%)    4.18%
16        1.000 (21.23%)    0.934 (16.92%)    6.60%
32        1.000 (19.45%)    0.985 (12.27%)    1.48%
48        1.000 (8.24%)     1.003 (13.56%)    -0.34%
64        1.000 (71.56%)    1.020 (75.36%)    -1.96%
96        1.000 (4.27%)     0.981 (2.15%)     1.90%
128       1.000 (9.69%)     0.963 (7.86%)     3.70%

 kernel/sched/fair.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index cfc982205b98..01b9f7885574 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12192,6 +12192,16 @@ static bool update_llc_busiest(struct lb_env *env,
 	 */
 	return sgs->nr_pref_dst_llc > busiest->nr_pref_dst_llc;
 }
+
+/*
+ * The busiest group has tasks that prefer the destination LLC and
+ * cache aware scheduling is enabled.
+ */
+static inline bool busiest_llc_balance(struct sg_lb_stats *busiest)
+{
+	return sched_cache_enabled() &&
+	       busiest->group_type == group_llc_balance;
+}
 #else
 static inline void record_sg_llc_stats(struct lb_env *env, struct sg_lb_stats *sgs,
 				       struct sched_group *group)
@@ -12210,6 +12220,11 @@ static bool update_llc_busiest(struct lb_env *env,
 {
 	return false;
 }
+
+static inline bool busiest_llc_balance(struct sg_lb_stats *busiest)
+{
+	return false;
+}
 #endif
 
 /**
@@ -13303,14 +13318,18 @@ static struct sched_group *sched_balance_find_src_group(struct lb_env *env)
 			goto out_balanced;
 	}
 
-	/*
-	 * Try to move all excess tasks to a sibling domain of the busiest
-	 * group's child domain.
-	 */
-	if (sds.prefer_sibling && local->group_type == group_has_spare &&
-	    (busiest->group_type == group_llc_balance ||
-	    sibling_imbalance(env, &sds, busiest, local) > 1))
-		goto force_balance;
+	if (local->group_type == group_has_spare) {
+		if (busiest_llc_balance(busiest))
+			goto force_balance;
+
+		/*
+		 * Try to move all excess tasks to a sibling domain of the
+		 * busiest group's child domain.
+		 */
+		if (sds.prefer_sibling &&
+		    sibling_imbalance(env, &sds, busiest, local) > 1)
+			goto force_balance;
+	}
 
 	if (busiest->group_type != group_overloaded) {
 		if (!env->idle) {

base-commit: fb7bd3a2aad70a76232a7168a505386d0a1396af
-- 
2.34.1


