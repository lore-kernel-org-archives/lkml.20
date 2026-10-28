Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793205450;
	b=BxayibV3w7VXxivXRFp9nT8LsjuIcj2g35Xxt0tf7ooCVaYl4fU8D1C3G7H31vMU8kdY
	 FPyg4y32SJ6wt7SwUHAZHfy1ESnZVqfmicDPNqeN5BVdCNNivyE7i3wJX4i8zo99dDE05
	 hj6nw1zkKWsPVRi/oaSxFy4t7LQOKq6gws7mUlHmhjPXQW9hXop+8GWiVsknsXRSaLcES
	 XlfCs8JWz6v/6/2XdZP/SJw/xgQN35riwU9sayJ3XnPwiTzq6vYcHYDZ5ggeuefcu8LEc
	 P0DKgog5AVSmCGl6K52vSFOA6H9X9WUn/rxowQD7TxVvOIveXkm2jWuZXGdn81H303A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793205450;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c0QuGi9vebWt/TMI1t8TdElZu+dctmkfByTpUVeybjc=;
	b=fE7TmnENX2sq9qK8DjogGjdPU0jXH8k+O3U75gULfCc6jldqJ42qlMbuzz3lG2A+rGxc
	 lq1CWc3yyqYFrjxi4rrA0oc+3YWFdlWRuP9fKQa7r8d2md9FJFbm0YGNzeHxLbE5oALUZ
	 17SDYSp9DXXEN37whS8PSw5KQBZHX6Ge5JfdrVB3LeBkqhK5KtSJj/ZpPKlRcA+qF+3+E
	 tT4HG6ijyXb8FTtoipr2/JJzksu19jplVmmlwlMs5A5uHW/rcVh1uYYn0fePKLAAnf038
	 s38IowVr/Rn/MTwOTr4IdSBbEeDERoXvpfs67fudFeTaQ3q6aQEy08hTolhzXjEzZRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gxofaJx9;
	arc=none smtp.remote-ip=91.218.175.46
Received: from mta0.migadu.com (out-46.mta0.migadu.com [91.218.175.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11B060A3829
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F11B060A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gxofaJx9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UV9Dwqu1DdDd296qahuFF7A+j1SKw/YhONwnecnFrcA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793205447; v=1; x=1793810247;
 b=gxofaJx9tQaIlEqxXQb1Dxri0iTEW0tagi8mrUUOPz67a8f9ed9TpSOVAeWrygkFYGAMZAxQ
 d1G2TvxrUJ4PUaxdZQ061VVm3+j8cmlDUAdEHs8tvspLBiynDVhYjmHmMHrXsTThVUccbo265ju
 H2SXBEFS+6PaUqdcH6vFz2so=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 4c812e0bccd7e663;
	Wed, 28 Oct 2026 16:37:27 +0000
X-Mizu-Trace-ID: 4c812e0bccd7e663
X-Migadu-Flow: FLOW_OUT
From: wen.yang@linux.dev
To: Joel Granados <joel.granados@kernel.org>
Cc: Wen Yang <wen.yang@linux.dev>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 20/39] sysctl: refresh dynamic scheduler and PID bounds per call
Date: Thu, 29 Oct 2026 00:34:59 +0800
Message-Id: <380ffe2d74c23b66e419511af4f25d5268a46ed4.1793204511.git.wen.yang@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1793204511.git.wen.yang@linux.dev>
References: <cover.1793204511.git.wen.yang@linux.dev>
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

From: Wen Yang <wen.yang@linux.dev>

Read current scheduler and PID limits into local tables before validation.

Suggested-by: Joel Granados <joel.granados@kernel.org>
Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 kernel/fork.c           |  8 ++++----
 kernel/pid.c            | 16 +++++++++++++---
 kernel/pid_namespace.c  |  6 +++---
 kernel/pid_sysctl.h     |  6 +++---
 kernel/sched/deadline.c | 29 +++++++++++++++++++++++++----
 kernel/sched/rt.c       | 13 ++++++++-----
 6 files changed, 56 insertions(+), 22 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 18b6dd851642..44947ef38cb4 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -3364,13 +3364,11 @@ static int sysctl_max_threads(const struct ctl_table *table, int write,
 	struct ctl_table t;
 	int ret;
 	int threads = max_threads;
-	int min = 1;
-	int max = MAX_THREADS;
 
 	t = *table;
 	t.data = &threads;
-	t.extra1 = &min;
-	t.extra2 = &max;
+	t.min = 1;
+	t.max = MAX_THREADS;
 
 	ret = proc_dointvec_minmax(&t, write, buffer, lenp, ppos);
 	if (ret || !write)
@@ -3388,6 +3386,8 @@ static const struct ctl_table fork_sysctl_table[] = {
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= sysctl_max_threads,
+		.min		= 1,
+		.max		= MAX_THREADS,
 	},
 };
 
diff --git a/kernel/pid.c b/kernel/pid.c
index adf721606768..21ffdc3d4ea7 100644
--- a/kernel/pid.c
+++ b/kernel/pid.c
@@ -766,15 +766,25 @@ static struct ctl_table_root pid_table_root = {
 	.set_ownership	= pid_table_root_set_ownership,
 };
 
+static int pid_max_handler(const struct ctl_table *table, int write,
+			   void *buffer, size_t *lenp, loff_t *ppos)
+{
+	struct ctl_table tmp = *table;
+
+	tmp.min = (unsigned long)READ_ONCE(pid_max_min);
+	tmp.max = (unsigned long)READ_ONCE(pid_max_max);
+	return proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
+}
+
 static const struct ctl_table pid_table[] = {
 	{
 		.procname	= "pid_max",
 		.data		= &init_pid_ns.pid_max,
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
-		.proc_handler	= proc_dointvec_minmax,
-		.extra1		= &pid_max_min,
-		.extra2		= &pid_max_max,
+		.proc_handler	= pid_max_handler,
+		.min		= (unsigned long)INT_MIN,
+		.max		= INT_MAX,
 	},
 };
 #endif
diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
index 127a5fd23e70..fe173ec63cb2 100644
--- a/kernel/pid_namespace.c
+++ b/kernel/pid_namespace.c
@@ -297,7 +297,7 @@ static int pid_ns_ctl_handler(const struct ctl_table *table, int write,
 	next = idr_get_cursor(&pid_ns->idr) - 1;
 
 	tmp.data = &next;
-	tmp.extra2 = &pid_ns->pid_max;
+	tmp.max = READ_ONCE(pid_ns->pid_max);
 	ret = proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
 	if (!ret && write)
 		idr_set_cursor(&pid_ns->idr, next + 1);
@@ -311,8 +311,8 @@ static const struct ctl_table pid_ns_ctl_table[] = {
 		.maxlen = sizeof(int),
 		.mode = 0666, /* permissions are checked in the handler */
 		.proc_handler = pid_ns_ctl_handler,
-		.extra1 = SYSCTL_ZERO,
-		.extra2 = &init_pid_ns.pid_max,
+		.min = 0,
+		.max = INT_MAX,
 	},
 };
 #endif	/* CONFIG_CHECKPOINT_RESTORE */
diff --git a/kernel/pid_sysctl.h b/kernel/pid_sysctl.h
index 5d8f981de7c5..a7b90380285d 100644
--- a/kernel/pid_sysctl.h
+++ b/kernel/pid_sysctl.h
@@ -23,7 +23,7 @@ static int pid_mfd_noexec_dointvec_minmax(const struct ctl_table *table,
 	scope = max(READ_ONCE(ns->memfd_noexec_scope), parent_scope);
 
 	table_copy.data = &scope;
-	table_copy.extra1 = &parent_scope;
+	table_copy.min = (unsigned long)parent_scope;
 
 	err = proc_dointvec_minmax(&table_copy, write, buf, lenp, ppos);
 	if (!err && write)
@@ -38,8 +38,8 @@ static const struct ctl_table pid_ns_ctl_table_vm[] = {
 		.maxlen		= sizeof(init_pid_ns.memfd_noexec_scope),
 		.mode		= 0644,
 		.proc_handler	= pid_mfd_noexec_dointvec_minmax,
-		.extra1		= SYSCTL_ZERO,
-		.extra2		= SYSCTL_TWO,
+		.min		= 0,
+		.max		= 2,
 	},
 };
 static inline void register_pid_ns_sysctl_table_vm(void)
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5..bf27abdd5c33 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -19,6 +19,7 @@
 #include <linux/cpuset.h>
 #include <linux/sched/clock.h>
 #include <linux/sched/deadline.h>
+#include <linux/sched/isolation.h>
 #include <uapi/linux/sched/types.h>
 #include "sched.h"
 #include "pelt.h"
@@ -31,22 +32,42 @@
 static unsigned int sysctl_sched_dl_period_max = 1 << 22; /* ~4 seconds */
 static unsigned int sysctl_sched_dl_period_min = 100;     /* 100 us */
 #ifdef CONFIG_SYSCTL
+static int sched_dl_period_max_handler(const struct ctl_table *table, int write,
+				       void *buffer, size_t *lenp, loff_t *ppos)
+{
+	struct ctl_table tmp = *table;
+
+	tmp.min = READ_ONCE(sysctl_sched_dl_period_min);
+	return proc_douintvec_minmax(&tmp, write, buffer, lenp, ppos);
+}
+
+static int sched_dl_period_min_handler(const struct ctl_table *table, int write,
+				       void *buffer, size_t *lenp, loff_t *ppos)
+{
+	struct ctl_table tmp = *table;
+
+	tmp.max = READ_ONCE(sysctl_sched_dl_period_max);
+	return proc_douintvec_minmax(&tmp, write, buffer, lenp, ppos);
+}
+
 static const struct ctl_table sched_dl_sysctls[] = {
 	{
 		.procname       = "sched_deadline_period_max_us",
 		.data           = &sysctl_sched_dl_period_max,
 		.maxlen         = sizeof(unsigned int),
 		.mode           = 0644,
-		.proc_handler   = proc_douintvec_minmax,
-		.extra1         = (void *)&sysctl_sched_dl_period_min,
+		.proc_handler   = sched_dl_period_max_handler,
+		.min		= 0,
+		.max		= UINT_MAX,
 	},
 	{
 		.procname       = "sched_deadline_period_min_us",
 		.data           = &sysctl_sched_dl_period_min,
 		.maxlen         = sizeof(unsigned int),
 		.mode           = 0644,
-		.proc_handler   = proc_douintvec_minmax,
-		.extra2         = (void *)&sysctl_sched_dl_period_max,
+		.proc_handler   = sched_dl_period_min_handler,
+		.min		= 0,
+		.max		= UINT_MAX,
 	},
 };
 
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 1535046a23ff..26e9b2ac8838 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -36,8 +36,8 @@ static const struct ctl_table sched_rt_sysctls[] = {
 		.maxlen         = sizeof(int),
 		.mode           = 0644,
 		.proc_handler   = sched_rt_handler,
-		.extra1         = SYSCTL_ONE,
-		.extra2         = SYSCTL_INT_MAX,
+		.min		= 1,
+		.max		= INT_MAX,
 	},
 	{
 		.procname       = "sched_rt_runtime_us",
@@ -45,8 +45,8 @@ static const struct ctl_table sched_rt_sysctls[] = {
 		.maxlen         = sizeof(int),
 		.mode           = 0644,
 		.proc_handler   = sched_rt_handler,
-		.extra1         = SYSCTL_NEG_ONE,
-		.extra2         = (void *)&sysctl_sched_rt_period,
+		.min		= (unsigned long)-1,
+		.max		= INT_MAX,
 	},
 	{
 		.procname       = "sched_rr_timeslice_ms",
@@ -2872,6 +2872,7 @@ static int sched_rt_global_validate(void)
 static int sched_rt_handler(const struct ctl_table *table, int write, void *buffer,
 		size_t *lenp, loff_t *ppos)
 {
+	struct ctl_table tmp = *table;
 	int old_period, old_runtime;
 	static DEFINE_MUTEX(mutex);
 	int ret;
@@ -2881,7 +2882,9 @@ static int sched_rt_handler(const struct ctl_table *table, int write, void *buff
 	old_period = sysctl_sched_rt_period;
 	old_runtime = sysctl_sched_rt_runtime;
 
-	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
+	if (table->data == &sysctl_sched_rt_runtime)
+		tmp.max = READ_ONCE(sysctl_sched_rt_period);
+	ret = proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
 
 	if (!ret && write) {
 		ret = sched_rt_global_validate();
-- 
2.25.1

