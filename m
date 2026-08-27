Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A95927E049
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834036; cv=none; b=dDyjQEL7fRNAy3D2WXVQGbqLzth+Icy/L4jE7634X7Ax8/RJled/XisY/jOjhIbLJpv3jRAlgaz33WP3xCoGmUdTvuWvpFWr2xmkrrRmMrHPq18Om++WOzPtWUVgO8G2dWFo6KNN8qddFLdfcxGWgKrtDKbN40avPHfPdTAKZdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834036; c=relaxed/simple;
	bh=3VDDN6f2l0yYAwAWZcx18jfrHHSsY8thPL3JWr1nTlg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnbKCiR/wLbMBUEXiSUo/359m/3C27hwRmjx6ew2lMYggpPJ3rDDpU22UTB4fNSSru2Ey2sdcI1TOnANOvV43EqbsPBDxixHe8uDJeyMjlwxRi5N2/vPzZ+fhwlOqtJSriaprNlm4KR/6cMLU2KOErWcMS21wEeAryGS9VgNirY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1CD0WTMzBJb6m;
	Thu, 27 Aug 2026 20:33:28 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hW1CB26nYzBJb6h;
	Thu, 27 Aug 2026 20:33:26 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id DAF1978AD;
	Thu, 27 Aug 2026 20:33:18 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 27 Aug
 2026 20:33:24 +0800
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
	<yingzhiwei@hygon.cn>, <justin.he@arm.com>
Subject: [RFC PATCH v2 09/23] sched/cache: Account percpu sd task NUMA preference
Date: Thu, 27 Aug 2026 20:28:02 +0800
Message-ID: <20260827122816.756234-10-wujianyong@hygon.cn>
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
X-ClientProxiedBy: cncheex05.Hygon.cn (172.23.18.115) To cncheex04.Hygon.cn
 (172.23.18.114)

Account for per-NUMA task count preferences within per-CPU sched domains,
mirroring the existing implementation of LLC task preference logic.

Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 kernel/sched/fair.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 30de09ebd9f6..dc7bbdb1ab98 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1529,8 +1529,13 @@ static void account_llc_enqueue(struct rq *rq, struct task_struct *p)
 	p->pref_llc_queued = pref_llc_queued;
 
 	sd = rcu_dereference_all(rq->sd);
-	if (sd && (unsigned int)pref_llc < sd->llc_max)
+	if (sd && (unsigned int)pref_llc < sd->llc_max) {
+		int pref_numa = llc_to_node(pref_llc);
 		sd->llc_counts[pref_llc]++;
+		if (sd->numa_counts &&
+		    (unsigned int)pref_numa < nr_node_ids)
+			sd->numa_counts[pref_numa]++;
+	}
 }
 
 static void account_llc_dequeue(struct rq *rq, struct task_struct *p)
@@ -1567,8 +1572,14 @@ static void account_llc_dequeue(struct rq *rq, struct task_struct *p)
 		 * This undercount is temporary and accurate accounting
 		 * will resume once the rq has a chance to be idle.
 		 */
-		if (sd->llc_counts[pref_llc])
+		if (sd->llc_counts[pref_llc]) {
+			int pref_numa = llc_to_node(pref_llc);
 			sd->llc_counts[pref_llc]--;
+			if (sd->numa_counts &&
+			    (unsigned int)pref_numa < nr_node_ids &&
+			    sd->numa_counts[pref_numa])
+				sd->numa_counts[pref_numa]--;
+		}
 	}
 }
 
@@ -1727,11 +1738,12 @@ void account_mm_sched(struct rq *rq, struct task_struct *p, s64 delta_exec)
 	mm_sched_llc = get_pref_llc(p, mm);
 
 	/* task not on rq accounted later in account_entity_enqueue() */
-	if (task_running_on_cpu(rq->cpu, p) &&
-	    READ_ONCE(p->preferred_llc) != mm_sched_llc) {
-		account_llc_dequeue(rq, p);
-		WRITE_ONCE(p->preferred_llc, mm_sched_llc);
-		account_llc_enqueue(rq, p);
+	if (task_running_on_cpu(rq->cpu, p)) {
+		if (READ_ONCE(p->preferred_llc) != mm_sched_llc) {
+			account_llc_dequeue(rq, p);
+			WRITE_ONCE(p->preferred_llc, mm_sched_llc);
+			account_llc_enqueue(rq, p);
+		}
 	}
 }
 
-- 
2.34.1


