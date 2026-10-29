Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.204.27.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793243088;
	b=llrXR1N7a3EJ4CWau2RJj56z1pJA9TgkB8jcxtfrEnYkytl83lcOm19Zr00mcYyhld9L
	 w+RCzqZjkW6+IX9BuwIqfp2Ao8RXR2o5U3QOAdgMRgP9VeZfEVzU+TS2nYJ9/qdslQt/e
	 lI6SoXVAr3n6k9Q/+MuV1S2luNTF94afGjq52hhW4Y1ZHRbbFdZAtXz2ofpE5pipns7e9
	 IK/pq85EWrYN0zemPyX1560DU0Sxp/aRks5CHQSXlQs7Bt2D1KC92XqIDBG4vFHVEOj9R
	 4lnHYasINnx+qWWVsiHjD2xw0dHygu2bi4gPUmrFACfhdh0BHhThQ5o7R0xqcCHw1/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793243088;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=vv+IYR9dud8EsrFaA0dR51P4en2GrhP5pTZk8r56EFQ=;
	b=KWs1SmgLWeaVQfsxJ6/4iZRr6CTiUcGRceWYtVNECG6Y0+zV3B5k3KCUhPnqIZB5NXuY
	 gwzDEcg/WS6nViv1XSbDJYgliA4Qgu5f+RdOqC1cn7g89Up5vQQvE93syOpHiuTi84rfX
	 Grpj/s+CXBLmdA8q8XqRYWfzXVNI+BRmTLp/XLrh7VH/PNyAHPrbUaXWIJzMlXx0riycp
	 2Llv3n0HIy6yk1H/C6OPjrrl8b/dmmzn8fnBYL/MFp56vFr/P7Fp+Js/rH1c305Q1kJye
	 QM6+Bs1bwYK5hitl78vP87R7qTL2a4v50JwQES09Ai5UWNPA8+VTfcj6pQD7HIQDNag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hygon.cn;
	spf=pass smtp.mailfrom=hygon.cn;
	arc=none smtp.remote-ip=101.204.27.37
Received: from spam01.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AB3606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03AB3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFTbj1Q1Cz171YY;
	Thu, 29 Oct 2026 11:04:33 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by spam01.hygon.cn (Postfix) with ESMTP id 4jFTbf6Gr6z171YY;
	Thu, 29 Oct 2026 11:04:30 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id 027055943;
	Thu, 29 Oct 2026 11:04:24 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 29 Oct
 2026 11:04:24 +0800
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
 Hildenbrand <david@kernel.org>, <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, <ljs@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <wujianyong@hygon.cn>, <jianyong.wu@outlook.com>,
	<zhongyuan@hygon.cn>, <huangsj@hygon.cn>, <wangfengyu@hygon.cn>,
	<yingzhiwei@hygon.cn>, XIAO WU <xiaowu.417@qq.com>
Subject: [RFC PATCH v3 17/17] sched/debug: Show cache placement and preferred LLC in /proc/<pid>/sched
Date: Thu, 29 Oct 2026 10:59:40 +0800
Message-ID: <20261029025940.4005235-1-wujianyong@hygon.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029022036.4002331-1-wujianyong@hygon.cn>
References: <20261029022036.4002331-1-wujianyong@hygon.cn>
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
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

Print the mm's selected CPU and its LLC and NUMA node, alongside the
task's preferred LLC and its NUMA node. This helps diagnose cache-aware
scheduling and task placement decisions.

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


