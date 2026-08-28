Received: from mailgw1.hygon.cn (unknown [101.204.27.37])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C67914A8B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.204.27.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787883115; cv=none; b=rEonyGeJ1Ckqtao07U+T20kbBY2qQZ0/9XBOIskvFc1J+Mfnr3Fn0rtyMNNuNMCu08AaUywR+rm+OVDpvHtvfDvtiVEEu+x8AK9sx9P/aj4lxlucD0sDifu+DEA7HXVY54YBGWj+JVvwBDpA0CXF0UYZ6IGAYmoLFbGPYwvKDVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787883115; c=relaxed/simple;
	bh=p2Ps4vqKHuAyN2lDsXtRKLmkI1q/c+ujvfBM9Iyq/L0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iNAwiWzogzgYHTM8JyykcQe35VgpqwSO5XIxLuIybwEt6+uNVcRgJK/XfDO3SyBhFMAuvcjC8QPJqoBmQx5seXVYqYSsj3ONrpajtvj9xQPuifVGfaOhBFAbBX4y0chNlzjNXoWA++8kAzqFXEXbs4nltZArdU2ByayvIcfyxyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn; spf=pass smtp.mailfrom=hygon.cn; arc=none smtp.client-ip=101.204.27.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hygon.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hygon.cn
Received: from maildlp1.hygon.cn (unknown [127.0.0.1])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMMC0bBFz34Dg;
	Fri, 28 Aug 2026 10:11:35 +0800 (CST)
Received: from maildlp1.hygon.cn (unknown [172.23.18.60])
	by mailgw1.hygon.cn (Postfix) with ESMTP id 4hWMM90gBVz34Dg;
	Fri, 28 Aug 2026 10:11:33 +0800 (CST)
Received: from cncheex04.Hygon.cn (unknown [172.23.18.114])
	by maildlp1.hygon.cn (Postfix) with ESMTPS id D257178AD;
	Fri, 28 Aug 2026 10:11:24 +0800 (CST)
Received: from jianyong.hygon.cn (172.19.20.52) by cncheex04.Hygon.cn
 (172.23.18.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 28 Aug
 2026 10:11:31 +0800
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
Subject: [RFC PATCH v2 17/23] sched/fair: Fine-granularity NUMA balancing
Date: Fri, 28 Aug 2026 10:07:31 +0800
Message-ID: <20260828020731.785556-1-wujianyong@hygon.cn>
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

NUMA balancing currently consists of two coupled components:
task migration and page migration. These two mechanisms work in tandem.
However, task migration may conflict with other subsystems such as CAS,
which aggregates tasks solely via task migration. Conflicts arise when
both CAS and NUMA balancing are enabled simultaneously.

This patch addresses the problem by introducing a fine-grained NUMA
balancing mechanism, allowing task migration and page migration to
be enabled or disabled independently.

Suggested-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Jianyong Wu <wujianyong@hygon.cn>
---
 include/linux/sched/sysctl.h | 12 +++++
 kernel/sched/core.c          | 87 ++++++++++++++++++++++++++++++++++++
 kernel/sched/fair.c          |  3 ++
 mm/memory.c                  |  3 ++
 4 files changed, 105 insertions(+)

diff --git a/include/linux/sched/sysctl.h b/include/linux/sched/sysctl.h
index 5a64582b086b..3434f044087e 100644
--- a/include/linux/sched/sysctl.h
+++ b/include/linux/sched/sysctl.h
@@ -23,10 +23,22 @@ enum sched_tunable_scaling {
 #define NUMA_BALANCING_NORMAL		0x1
 #define NUMA_BALANCING_MEMORY_TIERING	0x2
 
+/*
+ * Fine-grained control of the NUMA balancing sub-features. These are
+ * independent of the master NUMA_BALANCING_NORMAL switch and let the page
+ * migration and task migration paths be disabled separately.
+ */
+#define NUMA_BALANCING_PAGE_MIGRATION	0x1
+#define NUMA_BALANCING_TASK_MIGRATION	0x2
+#define NUMA_BALANCING_MIGRATE_DEFAULT	(NUMA_BALANCING_PAGE_MIGRATION | \
+					 NUMA_BALANCING_TASK_MIGRATION)
+
 #ifdef CONFIG_NUMA_BALANCING
 extern int sysctl_numa_balancing_mode;
+extern unsigned int numa_balancing_migrate_mode;
 #else
 #define sysctl_numa_balancing_mode	0
+#define numa_balancing_migrate_mode	NUMA_BALANCING_MIGRATE_DEFAULT
 #endif
 
 #endif /* _LINUX_SCHED_SYSCTL_H */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 96226707c2f6..8b6f2c4373ea 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4621,6 +4621,9 @@ DEFINE_STATIC_KEY_FALSE(sched_numa_balancing);
 
 int sysctl_numa_balancing_mode;
 
+unsigned int numa_balancing_migrate_mode __read_mostly =
+	NUMA_BALANCING_MIGRATE_DEFAULT;
+
 static void __set_numabalancing_state(bool enabled)
 {
 	if (enabled)
@@ -4674,6 +4677,83 @@ static int sysctl_numa_balancing(const struct ctl_table *table, int write,
 	}
 	return err;
 }
+
+static void numa_balancing_mode_show(char *buf, size_t size)
+{
+	unsigned int mode = numa_balancing_migrate_mode;
+
+	switch (mode & NUMA_BALANCING_MIGRATE_DEFAULT) {
+	case NUMA_BALANCING_MIGRATE_DEFAULT:
+		strscpy(buf, "page_mig task_mig", size);
+		break;
+	case NUMA_BALANCING_PAGE_MIGRATION:
+		strscpy(buf, "page_mig", size);
+		break;
+	case NUMA_BALANCING_TASK_MIGRATION:
+		strscpy(buf, "task_mig", size);
+		break;
+	default:
+		strscpy(buf, "none", size);
+	}
+}
+
+static int numa_balancing_mode_parse(char *buf)
+{
+	unsigned int mode = numa_balancing_migrate_mode;
+	char *tok;
+
+	while ((tok = strsep(&buf, " \t\n,")) != NULL) {
+		if (!*tok)
+			continue;
+
+		if (!strcmp(tok, "default") || !strcmp(tok, "enable") ||
+		    !strcmp(tok, "all")) {
+			mode = NUMA_BALANCING_MIGRATE_DEFAULT;
+		} else if (!strcmp(tok, "disable") || !strcmp(tok, "none") ||
+			   !strcmp(tok, "off")) {
+			mode = 0;
+		} else if (!strcmp(tok, "no_page_mig")) {
+			mode &= ~NUMA_BALANCING_PAGE_MIGRATION;
+		} else if (!strcmp(tok, "no_task_mig")) {
+			mode &= ~NUMA_BALANCING_TASK_MIGRATION;
+		} else if (!strcmp(tok, "page_mig")) {
+			mode |= NUMA_BALANCING_PAGE_MIGRATION;
+		} else if (!strcmp(tok, "task_mig")) {
+			mode |= NUMA_BALANCING_TASK_MIGRATION;
+		} else {
+			return -EINVAL;
+		}
+	}
+
+	numa_balancing_migrate_mode = mode;
+	return 0;
+}
+
+static int proc_numa_balancing_mode(const struct ctl_table *table, int write,
+				      void *buffer, size_t *lenp, loff_t *ppos)
+{
+	struct ctl_table t;
+	char buf[32];
+	int err;
+
+	if (write && !capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	t = *table;
+	t.data = buf;
+	t.maxlen = sizeof(buf);
+
+	if (write) {
+		buf[0] = '\0';
+		err = proc_dostring(&t, write, buffer, lenp, ppos);
+		if (err)
+			return err;
+		return numa_balancing_mode_parse(buf);
+	}
+
+	numa_balancing_mode_show(buf, sizeof(buf));
+	return proc_dostring(&t, write, buffer, lenp, ppos);
+}
 #endif /* CONFIG_PROC_SYSCTL */
 #endif /* CONFIG_NUMA_BALANCING */
 
@@ -4787,6 +4867,13 @@ static const struct ctl_table sched_core_sysctls[] = {
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_FOUR,
 	},
+	{
+		.procname	= "numa_balancing_mode",
+		.data		= NULL, /* filled in by handler */
+		.maxlen		= 32,
+		.mode		= 0644,
+		.proc_handler	= proc_numa_balancing_mode,
+	},
 #endif /* CONFIG_NUMA_BALANCING */
 };
 static int __init sched_core_sysctl_init(void)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 42ab6347e667..00f49e767583 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3312,6 +3312,9 @@ static int task_numa_migrate(struct task_struct *p)
 	struct rq *best_rq;
 	int nid, ret, dist;
 
+	if (!(numa_balancing_migrate_mode & NUMA_BALANCING_TASK_MIGRATION))
+		return -EAGAIN;
+
 	/*
 	 * Pick the lowest SD_NUMA domain, as that would have the smallest
 	 * imbalance and would be the first to start moving tasks about.
diff --git a/mm/memory.c b/mm/memory.c
index 6b8280cfc1db..47c9614dd54c 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6049,6 +6049,9 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
 		*flags |= TNF_FAULT_LOCAL;
 	}
 
+	if (!(numa_balancing_migrate_mode & NUMA_BALANCING_PAGE_MIGRATION))
+		return NUMA_NO_NODE;
+
 	return mpol_misplaced(folio, vmf, addr);
 }
 
-- 
2.34.1


