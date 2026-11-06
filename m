Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966945;
	b=qVoBGI0SH9uOjB0Btqz7ObNdP0oHFNiCXWKTPHCgKoRuo6zpyIP/iyO8UOveyLy4zwhv
	 V2xx1MvjWvVQTDwaDlHxkjDUmwNdgKenUHd47nWvgICW6Cez5z+WRquE2VpzmwP7jYU0y
	 c4LUAgAFQll+hLKDINcLRfylj3PUfksxf8857KbZsTT/b3np9ekB8oyxisuuRsS3gi4+2
	 rFbwhrDHnAVLWxzNWyMWFxYQJmB0nZnKK+lryEFcAr1Hs4575LMjl3Qy9vVaIbTCKeTqn
	 3JTIqLIbVDi4n/qrlf1ypE0UosNQNIajwOzVrGx2pHnO8xYYRo02vgeaYvikc/n0glA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=m+gQu+r4AwSHyS6gBBODt+jdhh/qECS8DRB45/qqUhU=;
	b=j+3GP2yGMFi+OrH3+S7Mo2SpQRbp2XyUZeE/HYplbaVwFN58ZVKVW2QrRYwDfzUVUhp0
	 B73kQ68A475uUp2Q0EbRtK/KFevHzQ9aT3M79fc26+G1LKs66H1k2w49zhF4DKWyGx/H6
	 L1YYDsmsX/WYCrbUvB1yRimwZqboQZQTzZcd1KkoGzTn/MEGs6VTqXMi4gxKAofMOdGhX
	 HopC4GvbVeCmKSny1ZJWTro2GjtKp7QfetraDQbDPAYaJGvWSNHzO1xD27kQ7DcmlHNTx
	 Uic0eulN0ny/xJR2RSAQDjgfvx88JQ6JWxQVKpcXZs+vIORVUrPf/a8M/hNOWQd0YWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQRJyqVL;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128BF606EE87
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 128BF606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQRJyqVL
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b244fb7fffso947684c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966944; x=1794571744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+gQu+r4AwSHyS6gBBODt+jdhh/qECS8DRB45/qqUhU=;
        b=lQRJyqVLOeq9uY+WipgI8matmx0nZh5VdQW2CA7+8O+5F+v6iwext07Ho/Zj+z272k
         qW/7M4/WrUlHc6WK+Fanr4QnhDirkSv+72mbBwMgfM+Zwo5n8vBzA2IQ/O22JKPxMeLT
         ZNgjZjvXmdFf9SdwF+ij0DmdyMDo+zZnXLPSxNHs8S5QenW0SjoVo5hpVCbd961hwQVW
         FWwoJ6W/GSdNvTYj82Xk0ZRU2H3n6HZayYnFQH9aqqiZgtyYtwd79RWt3mGy9BJW4PrK
         gWepxuMcUoOZ7qLlrS+kjtdLcS+rDwMU7pfc7fwRwfvSjBSsp2dDOO+QybhOXTo0T+Ii
         6sNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966944; x=1794571744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+gQu+r4AwSHyS6gBBODt+jdhh/qECS8DRB45/qqUhU=;
        b=dej6d5/iubQ7CuvBZ/IEDbdfytdH2M/+CQhlXJ/8Kz9KeJIOOULD6Bl7zH6CHA0K7b
         RU5754dPpJGsFWGPxs/P0qV2wsZf9yL1CmrzRZ1upHeOzVy0Gv09JFENa2gxaNw8wDvh
         hjFt23ydrI3iwkHT7RQRL/2e1TTXlTqTpz75gTpC5Nig5AaKmouaxCu6+I4L9aUjSzvf
         xFCW2dyG0PIs1XZ4Y32LnXPC0IgxSAl86s1CujBtQ+gU9i0AYrBWTr4s4FEL5ZE6NNsT
         qeXdCgI5d3xnXc8cd4gz79E7D/WwdaCepmoIs8Plh3odK9rETwjPGSooXwZcZfMbnoyt
         ovGg==
X-Gm-Message-State: APuU4Z/2ED81R5fumYBLEBbUqSYsVqCh6aE3QCarrQfM2eKHuIv7W43O
	fwv4TIDedgw9m/V5bWwA8PlmOwRKO9DbTdqWLbpkdyivXE36HYCyznH/
X-Gm-Gg: AYBFou2h9zeReHltEb1C96RJw+0nyp7PzQ3ibEPHH+1ZBvZAMJJxwCWqr8faUccUHwZ
	WYHCo/Q4/axPxRtta3EuCmBYPRVs+M7a1J8nCJY0dmocrr3cvWdVlWSLxoEZptZTLMY44ULhmrv
	Mpsru98jdnrgMttP3If8QALVk7BPTQgRkWfk0pjcIxQV5kkl0SXQZHL/ss/JlAEUfUnFkjNfOrb
	obodR4m434PkEpX9sPS0gNQ1dVNAGYP3tQnTJP1hq/QlbJvPa+bgDFsC8nBvYBI5kR7DYFsTcgg
	E5KWsJxg/xMO4LoHByQc1S2QbbZqZHxpl5Rlwu49TErT8KzEo2T77DZN3vWkxhB2Vgo60DAcxua
	vDyy5JEB4IqiT0hTln5L2t603O4z1tgdALuW5jXWgs2Im8GeS0Rn47kmigKQB0V9obXdcATRfxg
	/tlP/IELfXtgEgGDuMUmH3bZxwDXZdK/2uacBGmdQ30fiDD7AuO6S9mWWn5MD58GsBpsNsHcdqj
	cArD04OfMALQjY4GeiNvaBu8If7GT2nXhVBzI2QbdaiQrphMe/sRhnJV86VBeeyEjzqRN0HjCDC
	mvPIc2bMx1Qki7mTSFsniXVXyYYj1msNIxU6JG1o+15thIQy2ArmN7FihLJRhWQhhFm4hvWvd6K
	IfA==
X-Received: by 2002:a05:701b:4251:10b0:1ac:75b9:f82c with SMTP id a92af1059eb24-1b25d387600mr2939021c88.34.1793966943879;
        Fri, 06 Nov 2026 04:09:03 -0800 (PST)
Received: from Terra.tail0ac356.ts.net ([198.176.50.208])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm5289505c88.7.2026.11.06.04.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:09:03 -0800 (PST)
From: Weiming Shi <bestswngs@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH] sched/mmcid: Defer affinity updates until schedule-in
Date: Fri,  6 Nov 2026 04:08:46 -0800
Message-ID: <20261106120846.2405936-1-bestswngs@gmail.com>
X-Mailer: git-send-email 2.56.0
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

set_cpus_allowed_common() passes a remote task's p->mm to
mm_update_cpus_allowed(), but the scheduler locks do not stabilize that
pointer. A same-owner sched_setaffinity() can race the target replacing and
freeing its old mm during exec. Current kernels are only incidentally
serialized by futex_exec_done() taking p->pi_lock when CONFIG_FUTEX=y;
valid CONFIG_FUTEX=n builds remain vulnerable.

  BUG: KASAN: slab-use-after-free in set_cpus_allowed_common (kernel/sched/core.c:10835 kernel/sched/core.c:2829)
  Read of size 4 at addr ffff88810991b04c by task poc/5127
  Call Trace:
   set_cpus_allowed_common (kernel/sched/core.c:10835 kernel/sched/core.c:2829)
   set_cpus_allowed_fair (kernel/sched/fair.c:10046)
   __set_cpus_allowed_ptr_locked (kernel/sched/core.c:2842 kernel/sched/core.c:3224)
   __set_cpus_allowed_ptr (kernel/sched/core.c:3258)
   __sched_setaffinity (kernel/sched/syscalls.c:1161)
   sched_setaffinity (kernel/sched/syscalls.c:1239)
   __x64_sys_sched_setaffinity (kernel/sched/syscalls.c:1275)
   do_syscall_64 (arch/x86/entry/syscall_64.c:84)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

  Freed by task 5128:
   kmem_cache_free (mm/slub.c:6757)
   __mmput (kernel/fork.c:1204)
   mmput (kernel/fork.c:1215)
   setup_new_exec (fs/exec.c:1395)
   load_elf_binary (fs/binfmt_elf.c:1024)
   bprm_execve (fs/exec.c:1865)
   do_execveat_common.isra.0 (fs/exec.c:1963)
   __x64_sys_execve (fs/exec.c:2036)
   do_syscall_64 (arch/x86/entry/syscall_64.c:84)
   entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)

  The buggy address belongs to the cache mm_struct of size 2776
  The buggy address is located 588 bytes inside of a freed object
  Kernel panic - not syncing: KASAN: panic_on_warn set ...

Defer the MM-CID allowed-mask update to the task's next schedule-in, where
its current mm is stable. Synchronize a forked task's shared mm before its
first run so a pending affinity expansion inherited from its parent is not
lost. Protect the fork-time mask snapshot with the task's runqueue lock
because the task is already published before sched_post_fork() runs.

This change was developed with assistance from an LLM.

Fixes: 7e019dcc470f ("sched: Improve cache locality of RSEQ concurrency IDs for intermittent workloads")
Cc: stable@vger.kernel.org
Reported-by: <co+cab19e2ebe4d535a@bugs.sh>
Signed-off-by: Weiming Shi <bestswngs@gmail.com>
---
 include/linux/rseq_types.h |  3 +++
 kernel/fork.c              |  1 +
 kernel/sched/core.c        |  9 ++++-----
 kernel/sched/sched.h       | 12 ++++++++++++
 4 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/include/linux/rseq_types.h b/include/linux/rseq_types.h
index 85739a63e85e..1479ed807add 100644
--- a/include/linux/rseq_types.h
+++ b/include/linux/rseq_types.h
@@ -140,12 +140,15 @@ struct rseq_data { };
 /**
  * struct sched_mm_cid - Storage for per task MM CID data
  * @active:	MM CID is active for the task
+ * @cpus_allowed_changed: Task affinity change needs propagation to the MM;
+ *			 protected by the task's runqueue lock
  * @cid:	The CID associated to the task either permanently or
  *		borrowed from the CPU
  * @node:	Queued in the per MM MMCID list
  */
 struct sched_mm_cid {
 	unsigned int		active;
+	bool			cpus_allowed_changed;
 	unsigned int		cid;
 	struct hlist_node	node;
 };
diff --git a/kernel/fork.c b/kernel/fork.c
index 8b108ed37152..ed5947ae10fd 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1013,6 +1013,7 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
 #ifdef CONFIG_SCHED_MM_CID
 	tsk->mm_cid.cid = MM_CID_UNSET;
 	tsk->mm_cid.active = 0;
+	tsk->mm_cid.cpus_allowed_changed = false;
 	INIT_HLIST_NODE(&tsk->mm_cid.node);
 #endif
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 04b62c16fa8c..935c7efd349e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2811,8 +2811,6 @@ int push_cpu_stop(void *arg)
 	return 0;
 }
 
-static inline void mm_update_cpus_allowed(struct mm_struct *mm, const cpumask_t *affmask);
-
 /*
  * sched_class::set_cpus_allowed must do the below, but is not required to
  * actually call this function.
@@ -2826,7 +2824,7 @@ void set_cpus_allowed_common(struct task_struct *p, struct affinity_context *ctx
 
 	cpumask_copy(&p->cpus_mask, ctx->new_mask);
 	p->nr_cpus_allowed = cpumask_weight(ctx->new_mask);
-	mm_update_cpus_allowed(p->mm, ctx->new_mask);
+	mm_cid_notify_affinity_change(p);
 
 	/*
 	 * Swap in a new user_cpus_ptr if SCA_USER flag set
@@ -10826,7 +10824,7 @@ static bool mm_update_max_cids(struct mm_struct *mm)
 	return true;
 }
 
-static inline void mm_update_cpus_allowed(struct mm_struct *mm, const struct cpumask *affmsk)
+void mm_update_cpus_allowed(struct mm_struct *mm, const struct cpumask *affmsk)
 {
 	struct cpumask *mm_allowed;
 	struct mm_mm_cid *mc;
@@ -10986,6 +10984,8 @@ static void sched_mm_cid_fork(struct task_struct *t)
 
 	if (!mm)
 		return;
+	scoped_guard(task_rq_lock, t)
+		mm_update_cpus_allowed(mm, &t->cpus_mask);
 
 	WARN_ON_ONCE(t->mm_cid.cid != MM_CID_UNSET);
 
@@ -11180,7 +11180,6 @@ void mm_init_cid(struct mm_struct *mm, struct task_struct *p)
 	bitmap_zero(mm_cidmask(mm), num_possible_cpus());
 }
 #else /* CONFIG_SCHED_MM_CID */
-static inline void mm_update_cpus_allowed(struct mm_struct *mm, const struct cpumask *affmsk) { }
 static inline void sched_mm_cid_fork(struct task_struct *t) { }
 #endif /* !CONFIG_SCHED_MM_CID */
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 6c7c5633524a..6be52141068b 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -3964,6 +3964,13 @@ extern const char *preempt_modes[];
 
 #ifdef CONFIG_SCHED_MM_CID
 
+void mm_update_cpus_allowed(struct mm_struct *mm, const struct cpumask *affmsk);
+
+static inline void mm_cid_notify_affinity_change(struct task_struct *p)
+{
+	p->mm_cid.cpus_allowed_changed = true;
+}
+
 static __always_inline bool cid_on_cpu(unsigned int cid)
 {
 	return cid & MM_CID_ONCPU;
@@ -4152,6 +4159,10 @@ static __always_inline void mm_cid_schedin(struct task_struct *next)
 
 	if (!next->mm_cid.active)
 		return;
+	if (unlikely(next->mm_cid.cpus_allowed_changed)) {
+		mm_update_cpus_allowed(mm, &next->cpus_mask);
+		next->mm_cid.cpus_allowed_changed = false;
+	}
 
 	cpu_cid = __this_cpu_read(mm->mm_cid.pcpu->cid);
 	mode = READ_ONCE(mm->mm_cid.mode);
@@ -4197,6 +4208,7 @@ static inline void mm_cid_switch_to(struct task_struct *prev, struct task_struct
 }
 
 #else /* !CONFIG_SCHED_MM_CID: */
+static inline void mm_cid_notify_affinity_change(struct task_struct *p) { }
 static inline void mm_cid_switch_to(struct task_struct *prev, struct task_struct *next) { }
 #endif /* !CONFIG_SCHED_MM_CID */
 
-- 
2.56.0

