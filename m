Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234E341C6A
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787883610; cv=none; b=Cms9yEQcR3dhpiPltGDKTTj5M67bZEe71Zd2E4BHV8qAAosM1027xXvDmMj79bMP4Z9W1R0igFV/H58MEXuLTtm3+veu9ZdfT9FqEYpVsiFNbKadVkrfcQKg6sb8MvMjTdwKZe67s+3U/t5uf2cByEPqpKkv8oMTdXL6iJIm3XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787883610; c=relaxed/simple;
	bh=N8YoUcYf55pKilIHZSyoynPtdBHnkZFY/8EhO1vamYM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=snUIjPI/w9v5FiCBhgYXd4kaHRnKRDFcPnf7Y9hpom5YwLjwYc8k4pco7jAfmyqbiv6Z7j8Y3y7IqxuoPyIvzDA+JUN0wdViMDGC7gMG4SXg9xEFezxJwtQViIH4hkCh4OXNcgN3UVZT1eraf+kh36mtWwSD/uplze9c6HFe3AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp2.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMXn0rTwz34Dg;
	Fri, 28 Aug 2026 10:19:53 +0800 (CST)
Received: from maildlp2.hygon.cn (unknown [172.23.18.61])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMXl32BHz34Dg;
	Fri, 28 Aug 2026 10:19:51 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp2.hygon.cn (Postfix) with ESMTPS id 36E303104800;
	Fri, 28 Aug 2026 10:16:08 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 28 Aug
 2026 10:19:50 +0800
From: Jianyong Wu <wujianyong@hygon.cn>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Chen Yu <yu.c.chen@intel.com>, Tim Chen
	<tim.c.chen@linux.intel.com>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld
	<pauld@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand <david@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <wujianyong@hygon.cn>, <jianyong.wu@outlook.com>,
	<zhongyuan@hygon.cn>, <huangsj@hygon.cn>, <wangfengyu@hygon.cn>,
	<yingzhiwei@hygon.cn>, <justin.he@arm.com>, XIAO WU <xiaowu.417@qq.com>
Subject: [RFC PATCH v2 23/23] sched/debug: Print task preferred LLC for scheduler debugging
Date: Fri, 28 Aug 2026 10:15:54 +0800
Message-ID: <20260828021554.785781-1-wujianyong@hygon.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827122816.756234-1-wujianyong@hygon.cn>
References: <20260827122816.756234-1-wujianyong@hygon.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: cncheex06.Hygon.cn (172.23.18.116) To cncheex04.Hygon.cn
 (172.23.18.114)

Expose each task's preferred LLC to aid diagnosis of cache-aware
scheduling decisions.

Suggested-by: XIAO WU <xiaowu.417@qq.com>
Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/debug.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 40584b27ea0c..d18dbc1da67c 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -9,7 +9,9 @@
 #include <linux/debugfs.h>
 #include <linux/nmi.h>
 #include <linux/log2.h>
+#include <linux/sched/clock.h>
 #include "sched.h"
+#include <linux/sched/debug.h>
 
 /*
  * This allows printing both to /sys/kernel/debug/sched/debug and
@@ -1304,7 +1306,6 @@ void print_numa_stats(struct seq_file *m, int node, unsigned long tsf,
 }
 #endif
 
-
 static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 {
 #ifdef CONFIG_NUMA_BALANCING
@@ -1320,6 +1321,30 @@ static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 #endif /* CONFIG_NUMA_BALANCING */
 }
 
+static void sched_show_cache(struct task_struct *p, struct seq_file *m)
+{
+#ifdef CONFIG_SCHED_CACHE
+	struct mm_struct *mm = NULL;
+	int sc_cpu, sc_llc, sc_node, pref_llc, pref_node;
+
+	mm = get_task_mm(p);
+
+	if (mm) {
+		sc_cpu = READ_ONCE(mm->sc_stat.cpu);
+		sc_llc  = (sc_cpu >= 0) ? per_cpu(sd_llc_id, sc_cpu) : -1;
+		sc_node = (sc_cpu >= 0) ? cpu_to_node(sc_cpu) : -1;
+		pref_llc  = READ_ONCE(p->preferred_llc);
+		pref_node = (pref_llc >= 0) ? llc_to_node(pref_llc) : -1;
+
+		SEQ_printf(m, "sc_stat_cpu=%d, sc_llc=%d, sc_node=%d\n",
+			   sc_cpu, sc_llc, sc_node);
+		SEQ_printf(m, "preferred_llc=%d, preferred_llc_node=%d\n",
+			   pref_llc, pref_node);
+		mmput(mm);
+	}
+#endif /* CONFIG_SCHED_CACHE */
+}
+
 void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 						  struct seq_file *m)
 {
@@ -1439,6 +1464,7 @@ void proc_sched_show_task(struct task_struct *p, struct pid_namespace *ns,
 	}
 
 	sched_show_numa(p, m);
+	sched_show_cache(p, m);
 }
 
 void proc_sched_set_task(struct task_struct *p)
-- 
2.34.1


