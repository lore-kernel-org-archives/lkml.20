Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485513;
	b=yKk8qcC5z3CROMMKtOdQx/KDp3ldmfcUfSqeHm8z0sdzjH8/AE2UJqBWD6r9rC7++tQ1
	 zHV5FuZG3LlGDaQkHmyiT4eMnniHYfurCnFP/ys9X3LUIQSOKKYWVAaRTQHFVJQO7rZwK
	 VI5NCdMCp2U/QhBT1QtPXEDYV28GmDvxFm0qYRZaTjKgoFo89mAm4x2Mi1kzxOSgWz/is
	 waYgtCEYq6jUok2sMt1aCKTOyDAO/r5/qhHso3rxb5Q2T1sMrC6BotA31AUaXEbsHTBLl
	 bRjH7TC30zo8+xMkIMalpDNLL52crdy2oCY5r/H76RoJHldYvj9i7+wWi+ILYqkVqbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485513;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Gnl24MaLuJqp+e8R1thtVcYM+P99rf6MgdLSn+uGhXE=;
	b=sVnG0u/R2571WllgXYrjdPXycKC15Dg82Wm4Kk3Bz/pJ5NBsDG/pXbveBo4ZZ41NqaH4
	 EuJQpIRiD9sHWIW6YaOhkXe/DE679qY8V5v/q6dBIBDLLmfUCeA70A3tc4xrL+eczLYwG
	 Rhu4VF6K5CwIK7O2OFC2hPxB4h+B+pK4EyTITlD/GFDgQs1GlniByu3cQRQQwBGMfIDT8
	 DU+BULFX3emp22Ce4rSP7u4FvHnJiFASQXgF0h2k3mqR/h/WArc8XkR7xltIsiLfPBQY0
	 OtYLWDcUeZZ/pMSTkrM8YX14Da8wpxe/ptaDX+3Hb4wCZUfjcmCTJOnOyAfZWrnOLCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.1
Received: from out28-1.mail.aliyun.com (out28-1.mail.aliyun.com [115.124.28.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268DB60A261D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 268DB60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436277|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.0373498-0.00136688-0.961283;FP=13139067504299873530|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037034138;MF=likunyu@open-hieco.net;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.jlWubXJ_1792485505;
Received: from localhost.localdomain(mailfrom:likunyu@open-hieco.net fp:SMTPD_---.jlWubXJ_1792485505 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 20 Oct 2026 16:38:27 +0800
From: Li kunyu <likunyu@open-hieco.net>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com
Cc: linux-kernel@vger.kernel.org,
	Li kunyu <likunyu@open-hieco.net>,
	"Li Wang (Hieco)" <li.wang@linux.dev>
Subject: [RFC PATCH 5/6] sched/fair: Add task burst threshold for large-scale bursts
Date: Tue, 20 Oct 2026 16:37:45 +0800
Message-ID: <20261020083746.37068-6-likunyu@open-hieco.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020083746.37068-1-likunyu@open-hieco.net>
References: <20261020083746.37068-1-likunyu@open-hieco.net>
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

In practice, bursty tasks can lead to uneven task distribution. For
example, some CPUs may have kernel-mode utilization above 50%, while
more than 10% of CPUs in the system remain idle. To address this, a task
burst threshold is introduced:

1. When a task is woken up, the scheduler first follows the original
wake-up logic (e.g., wake-up on the current CPU or affinity wake-up)
to select a CPU. If no CPU is selected, the task burst threshold of
new_cpu is then checked.

2. For newly created child processes or threads, only the task burst
threshold needs to be checked.

Benefits:

1. The performance degradation observed in the hackbench scenario is
resolved, allowing tasks to be distributed quickly.

2. On a Hygon 7447v CPU (Model 7) server with 384 logical CPUs, UnixBench
shows approximately 3% to 5% performance improvement for this patch, with
a cumulative improvement of 8% to 10% across the patch series.

Tested-by: Li Wang (Hieco) <li.wang@linux.dev>
Signed-off-by: Li kunyu <likunyu@open-hieco.net>
---
 kernel/sched/fair.c | 62 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index f2bf4b53d8a9..0cd0c5a5f158 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -145,6 +145,15 @@ static unsigned int sysctl_smt_buddy_imbalance_pct = 125;
 static unsigned int sysctl_smt_buddy_imbalance_pct_min = 105;
 static unsigned int sysctl_smt_buddy_imbalance_pct_max = 200;
 
+/*
+ * In certain scenarios, the task burst threshold helps distribute tasks to
+ * idle CPUs quickly.
+ *
+ * (default: 4)
+ */
+static unsigned int sysctl_smt_buddy_balance_task = 4;
+static unsigned int sysctl_smt_buddy_balance_task_min = 2;
+
 #ifdef CONFIG_SYSCTL
 static const struct ctl_table sched_fair_sysctls[] = {
 #ifdef CONFIG_CFS_BANDWIDTH
@@ -176,6 +185,14 @@ static const struct ctl_table sched_fair_sysctls[] = {
 		.extra1		= &sysctl_smt_buddy_imbalance_pct_min,
 		.extra2		= &sysctl_smt_buddy_imbalance_pct_max,
 	},
+	{
+		.procname       = "smt_buddy_balance_task",
+		.data           = &sysctl_smt_buddy_balance_task,
+		.maxlen         = sizeof(unsigned int),
+		.mode           = 0644,
+		.proc_handler   = proc_dointvec_minmax,
+		.extra1         = &sysctl_smt_buddy_balance_task_min,
+	},
 };
 
 static int __init sched_fair_sysctl_init(void)
@@ -9937,7 +9954,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	int sync = (wake_flags & WF_SYNC) && !(current->flags & PF_EXITING);
 	struct sched_domain *tmp, *sd = NULL;
 	int cpu = smp_processor_id();
-	int new_cpu = prev_cpu;
+	int new_cpu = prev_cpu, nohz_idle_cpu = 0;
 	int want_affine = 0;
 	/* SD_flags and WF_flags share the first nibble */
 	int sd_flag = wake_flags & 0xF;
@@ -9990,11 +10007,46 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 
 	/* Slow path */
 	if (unlikely(sd))
-		return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
-
+		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
 	/* Fast path */
-	if (wake_flags & WF_TTWU)
-		return select_idle_sibling(p, prev_cpu, new_cpu);
+	else if (wake_flags & WF_TTWU)
+		new_cpu = select_idle_sibling(p, prev_cpu, new_cpu);
+
+#ifdef CONFIG_NO_HZ_COMMON
+	/*
+	 * In practice, bursty tasks can lead to uneven task distribution.
+	 * For example, some CPUs may have kernel-mode utilization above 50%,
+	 * while more than 10% of CPUs in the system remain idle.
+	 * Therefore, we define a task burst threshold:
+	 *
+	 * 1. For a task to be woken up, the scheduler first follows the
+	 * original wake-up logic (such as wake-up on the current CPU or
+	 * affinity wake-up) to return a CPU. If no CPU is returned, it
+	 * then checks the task burst threshold of new_cpu.
+	 * 2. Newly created child processes or threads have fewer
+	 * considerations; only the task burst threshold needs to be checked.
+	 */
+	if (sched_feat(SMT_BUDDY_ASSIST) && cpu_rq(new_cpu)->nr_running >=
+			sysctl_smt_buddy_balance_task)
+		for_each_cpu_wrap(nohz_idle_cpu,  nohz.idle_cpus_mask, new_cpu + 1) {
+			if (!idle_cpu(nohz_idle_cpu))
+				continue;
+
+			/*
+			 * In general-purpose scenarios, the CPU can
+			 * typically meet task requirements.
+			 */
+			if (!cpumask_test_cpu(nohz_idle_cpu, p->cpus_ptr))
+				continue;
+
+		/*
+		 * Simply returning nohz_idle_cpu is sufficient, since the
+		 * subsequent NOHZ kick will clear the corresponding bit in
+		 * nohz.idle_cpus_mask.
+		 */
+		return nohz_idle_cpu;
+	}
+#endif
 
 	return new_cpu;
 }
-- 
2.47.3

