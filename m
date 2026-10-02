Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BF34968F0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945152; cv=none; b=OjcKgWeuDVxNMAFM7mPqrcJ13o40AvCot7t7XqArcaYluvkSKZfVDeCuMfj1YgYqU/aP+F0up3aWEgClaDBeSbyzPWpjKBrkIH0FgY4UGzLiISYlSjjKpRwwgC93Gubu71131an/dnF85cDr9kfDH6LcNWZ0u4WBxB71GlBDM10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945152; c=relaxed/simple;
	bh=eACLHThZNRTT/bJKV+e0u5PadLOj8pRcKs63oyq/bGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpRu993Q6MhpZdbdoW07LJjrV1+MDwckT5pDDk6dvRiEpnBOE9k8s127HsOmniMFyuEcKCXs4Ls5K2HnAjRCIxgd4anmxAX9B01XEstTeq4fddiehzlmurT6CGcWBTm4bug20bz/QxAnRGRhEKtBwSSOrqYBtTJ0WtH3zA3tPUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kV58cHTA; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kV58cHTA"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hx7mp0k5mz8vFf;
	Fri, 02 Oct 2026 14:45:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790945146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WoQqOjLK8fATVY6MiWXGiBtGhGfaP10eLWjBUowZBYU=;
	b=kV58cHTAQOtgm14L3VQTWXN6MxBIrfkarzB7Oq9E3XDDFvTpsfDRJpSMjy2XA++0ug6Yye
	NscWq62TKFixlE0kouqukJpkAL9cIxPcU0eShgFU3jKzJkmHLXWuRgdVgRC7/PEstgVDog
	IL6qnGnazq0wLTalkU8Y89w/6wxA0YVHHZ+nmFnqsP9z/if68whJg/zTWIEDFnLv++W8u2
	k2ypA2Gb3DWIAU0lCthNZ2vbnnqFqPCopfz56Oayxf13gbi1nVkgnG3dxWCm8fyPVl3/sn
	aFoQiALYW6yly78f32estdPEOG/6EMm4RlLdxPWnOf2TnpUWMMjekScmO486fA==
From: Tor Vic <torvic9@mailbox.org>
To: peterz@infradead.org,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Tor Vic <torvic9@mailbox.org>
Subject: [RFC PATCH 1/2] sched/fair: Remove the 'none' and 'linear' scaling of tunables
Date: Fri,  2 Oct 2026 14:45:37 +0200
Message-ID: <20261002124538.79658-2-torvic9@mailbox.org>
In-Reply-To: <20261002124538.79658-1-torvic9@mailbox.org>
References: <20261002124538.79658-1-torvic9@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0cc3a43fa825aba1626
X-MBO-RS-META: 49k5re96d4wbupbuuitskzu1rssne6tu

Get rid of the tunable scalings 'none' and 'linear' as these do not
appear to be very useful.

Only keep the 'log' scaling, which is already the default.

Signed-off-by: Tor Vic <torvic9@mailbox.org>
---
 include/linux/sched/sysctl.h |  7 -----
 kernel/sched/debug.c         | 52 ------------------------------------
 kernel/sched/fair.c          | 28 +------------------
 kernel/sched/sched.h         |  2 --
 4 files changed, 1 insertion(+), 88 deletions(-)

diff --git a/include/linux/sched/sysctl.h b/include/linux/sched/sysctl.h
index 5a64582b086b..0b923cc771e0 100644
--- a/include/linux/sched/sysctl.h
+++ b/include/linux/sched/sysctl.h
@@ -12,13 +12,6 @@ extern unsigned long sysctl_hung_task_timeout_secs;
 enum { sysctl_hung_task_timeout_secs = 0 };
 #endif
 
-enum sched_tunable_scaling {
-	SCHED_TUNABLESCALING_NONE,
-	SCHED_TUNABLESCALING_LOG,
-	SCHED_TUNABLESCALING_LINEAR,
-	SCHED_TUNABLESCALING_END,
-};
-
 #define NUMA_BALANCING_DISABLED		0x0
 #define NUMA_BALANCING_NORMAL		0x1
 #define NUMA_BALANCING_MEMORY_TIERING	0x2
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 72236db67983..b159d7a1cfa2 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -170,46 +170,6 @@ static const struct file_operations sched_feat_fops = {
 	.release	= single_release,
 };
 
-static ssize_t sched_scaling_write(struct file *filp, const char __user *ubuf,
-				   size_t cnt, loff_t *ppos)
-{
-	unsigned int scaling;
-	int ret;
-
-	ret = kstrtouint_from_user(ubuf, cnt, 10, &scaling);
-	if (ret)
-		return ret;
-
-	if (scaling >= SCHED_TUNABLESCALING_END)
-		return -EINVAL;
-
-	sysctl_sched_tunable_scaling = scaling;
-	if (sched_update_scaling())
-		return -EINVAL;
-
-	*ppos += cnt;
-	return cnt;
-}
-
-static int sched_scaling_show(struct seq_file *m, void *v)
-{
-	seq_printf(m, "%d\n", sysctl_sched_tunable_scaling);
-	return 0;
-}
-
-static int sched_scaling_open(struct inode *inode, struct file *filp)
-{
-	return single_open(filp, sched_scaling_show, NULL);
-}
-
-static const struct file_operations sched_scaling_fops = {
-	.open		= sched_scaling_open,
-	.write		= sched_scaling_write,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
-
 #ifdef CONFIG_SCHED_CACHE
 static ssize_t
 sched_cache_enable_write(struct file *filp, const char __user *ubuf,
@@ -726,7 +686,6 @@ static __init int sched_init_debug(void)
 	debugfs_create_u32("latency_warn_ms", 0644, debugfs_sched, &sysctl_resched_latency_warn_ms);
 	debugfs_create_u32("latency_warn_once", 0644, debugfs_sched, &sysctl_resched_latency_warn_once);
 
-	debugfs_create_file("tunable_scaling", 0644, debugfs_sched, NULL, &sched_scaling_fops);
 	debugfs_create_u32("migration_cost_ns", 0644, debugfs_sched, &sysctl_sched_migration_cost);
 	debugfs_create_u32("nr_migrate", 0644, debugfs_sched, &sysctl_sched_nr_migrate);
 
@@ -1238,12 +1197,6 @@ do {									\
 	SEQ_printf(m, "\n");
 }
 
-static const char *sched_tunable_scaling_names[] = {
-	"none",
-	"logarithmic",
-	"linear"
-};
-
 static void sched_debug_header(struct seq_file *m)
 {
 	u64 ktime, sched_clk, cpu_clk;
@@ -1286,11 +1239,6 @@ static void sched_debug_header(struct seq_file *m)
 #undef PN
 #undef P
 
-	SEQ_printf(m, "  .%-40s: %d (%s)\n",
-		"sysctl_sched_tunable_scaling",
-		sysctl_sched_tunable_scaling,
-		sched_tunable_scaling_names[sysctl_sched_tunable_scaling]);
-	SEQ_printf(m, "\n");
 }
 
 static int sched_debug_show(struct seq_file *m, void *v)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..2f9b7d2fe813 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -61,19 +61,6 @@
 #include "stats.h"
 #include "autogroup.h"
 
-/*
- * The initial- and re-scaling of tunables is configurable
- *
- * Options are:
- *
- *   SCHED_TUNABLESCALING_NONE - unscaled, always *1
- *   SCHED_TUNABLESCALING_LOG - scaled logarithmically, *1+ilog(ncpus)
- *   SCHED_TUNABLESCALING_LINEAR - scaled linear, *ncpus
- *
- * (default SCHED_TUNABLESCALING_LOG = *(1+ilog(ncpus))
- */
-unsigned int sysctl_sched_tunable_scaling = SCHED_TUNABLESCALING_LOG;
-
 /*
  * Default base time slice (request size r_i) for SCHED_NORMAL/SCHED_BATCH:
  *
@@ -198,20 +185,7 @@ static inline void update_load_set(struct load_weight *lw, unsigned long w)
 static unsigned int get_update_sysctl_factor(void)
 {
 	unsigned int cpus = min_t(unsigned int, num_online_cpus(), 8);
-	unsigned int factor;
-
-	switch (sysctl_sched_tunable_scaling) {
-	case SCHED_TUNABLESCALING_NONE:
-		factor = 1;
-		break;
-	case SCHED_TUNABLESCALING_LINEAR:
-		factor = cpus;
-		break;
-	case SCHED_TUNABLESCALING_LOG:
-	default:
-		factor = 1 + ilog2(cpus);
-		break;
-	}
+	unsigned int factor = 1 + ilog2(cpus);
 
 	return factor;
 }
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf8..7a36b3210757 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3153,8 +3153,6 @@ extern unsigned int sysctl_sched_base_slice;
 extern int sysctl_resched_latency_warn_ms;
 extern int sysctl_resched_latency_warn_once;
 
-extern unsigned int sysctl_sched_tunable_scaling;
-
 extern unsigned int sysctl_numa_balancing_scan_delay;
 extern unsigned int sysctl_numa_balancing_scan_period_min;
 extern unsigned int sysctl_numa_balancing_scan_period_max;
-- 
2.55.0

