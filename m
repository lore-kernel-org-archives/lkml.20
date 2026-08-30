Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B2C3845A4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788075012; cv=none; b=fhW1w+yuZ8f3rLZ/VNHrNCDBg8zKReQg8LbKLVGHIZHnUNwallKal1x2+JWlow9GzhnDMko7iHdskAgTDeNZyPjH6G/jzS4Qjfcz8kgWGCBShh0YgPw7yTWy7ljgjDvEYb8C5c6xYLXX2VjcDegJSfvEq3uYnpWnVTXx4Q57wF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788075012; c=relaxed/simple;
	bh=eDtcAq1uMez53Yd0CUPip3ayVDJBoFo6ZnPJrlzyHqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GCskoq6sdOEEm5KvdjH3yxOsyl4iULWVKF9twxXdNtn7gW0UGtUa0FEWuNEkJ3s1uq82TM9UMb5BLQLtwKqGR3EWlHR/H5qsUvsQJwXmoSaP//yIFyyA3U7WZcoXlkK2NNP4yOuPYZxcvmt41z9LCv3b199wKWWYBaQwYwW4G/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4xC76O9; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4xC76O9"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398b3d66515so862615a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788075008; x=1788679808; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XnUZn6wf9UUIpF2RonxD+yTbLf5BGIQEYs8B6KvVijM=;
        b=A4xC76O9pQCD3PrsCag2qBBtefLa4jlo1YzNAVPrLRdFiTEgWcrtlZnXQZtL7TQXa1
         RRGtosO+JRPBWFoQ7QgWJCX0ZSAKAuZfMQ5dmDNm5a9/NIx3aijSBdqaWPjcNkh6AIwO
         QiNtVhTLcn89WxIzawEjmcCTWEy82Nj+0ipnMV9bl29Tnnv/c8VZKXWWVLW0AKPkF1Ug
         SyiJmWkxHTS6a36d8qc3DG20+3GJ9ZEgQGV6Ba4sCW3budILRESFRJkWhPinYYd5kbts
         RMjIWaqbCgbJPd6ttvjGuBLvFgK67HrGPZlYN7k6WcLm1LYVGuaYyRJ51Bg+1A6K5qkQ
         mBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788075008; x=1788679808;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XnUZn6wf9UUIpF2RonxD+yTbLf5BGIQEYs8B6KvVijM=;
        b=WEYfkoW6xggjLKQZGpEUndMxZW09CfvL4ZI6kIGNhD19/thb85VPE448hWWr8rRy6U
         vSJzgZ7ykRRXaQqxN8hVMU03PiAmy/uW+qHiP1/bPuU6CM2AxdgdeMPFXbM6D90lhWqt
         Cv7LgrgkI6vPJ1p2h6CesiTD1pYEqR0axCkmS6AjOzTKhHWa5JE8VMaj22/kVcD5SU65
         OnEYsyCNuHMFSKkMnxZkbQxhpTHpjyKmCA9lJUAcml+tgZvvZklp2TgeT8f1M1iJKqf5
         4gU5AwQ7Piqji8XzHXDu8PWoAuFd/VU93yELuvTLUzUmcSfTrGMnMI5hC/2/cKaW/5pR
         LBCg==
X-Forwarded-Encrypted: i=1; AKwUvBwx8jSvod0YzSOIj+uIYB2BSNrrIyVpGkZjtnn7m59rEP/q3Ht150SQhy48S0MVbJ0dwgxNSv7LzhC9VWU=@vger.kernel.org
X-Gm-Message-State: AFuF++m5NSgpYsY0NyirqarrqNDbegf0RrDIOa09gx2WDHuJi79SDvWv
	FiKqa2txVt+cSwv3yYtlyqNTEVkNVsyNDHHpZsHAdG9yH4AKH3xNABQm
X-Gm-Gg: AYBFou0eo6EmCFZf5ZawBmTN0PCMK+uHl1qodI71/9f50p43XlS55FSRs6pxF4dg8mG
	MoUPcpLWbR1PAnJSoSkuUzboaPi4Jbh9nLEIPUzuTlfJrsEfa4aBa0BFXBFope5xJaehfLt/HZI
	StGWogE1R7sDYnRWA3FJNj+WxryTjzrEVcTePX+R3eMOzCBLxv7HF13O7mjefhbpnNy4pzG7DJz
	wHyWvwWCtKl8mvWkDihwP5pn1y95su+QrnJI6sX1/iVB17fM28Vhs/IcIY6edrEY2UZNjzKCSOD
	zQdD2seGN1dV8fa+8Vp55+AW3ms8FeRdRDH2HiB0Fy4ikBT7AC7xrPjcIkePzQvlZKY4Z0hJZTA
	WQQCH4D7yDi2IlYqRih45bjYkaaNHDXwmjU9I3D7Qpbf2YyCalqkmTfvlNNJsAfgA1gcnHSGHi9
	gKnt124Z9Kkr6ZojPnhpM0KXhVo59v8Wwr/km3DjsvoY1XiUO2weirC/F3Y5S7RBuVbUoLu2iFO
	yYQDRSgnffsRIteQg==
X-Received: by 2002:a17:90b:3c44:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-398dcefc24amr634359a91.19.1788075007671;
        Sun, 30 Aug 2026 00:30:07 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1992e05sm15110527a91.15.2026.08.30.00.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 00:30:06 -0700 (PDT)
Date: Sun, 30 Aug 2026 16:30:00 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>
Cc: Chen Yu <yu.c.chen@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Qais Yousef <qyousef@layalina.io>,
	Aaron Lu <ziqianlu@bytedance.com>,
	Srikar Dronamraju <srikar@linux.ibm.com>,
	Vineeth Remanan Pillai <vineethr@linux.ibm.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, imv4bel@gmail.com
Subject: [PATCH] sched/cache: Fix use-after-free of the mm replaced by exec
Message-ID: <apPb-Dr4nPYuHQOK@v4bel>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When the waker cannot use the wakelist, ttwu_queue() takes the target rq
lock and goes down into update_curr(). If the target rq belongs to another
CPU, the task handed to account_mm_sched() is the one running on that CPU,
not the task being woken.

account_mm_sched() reads p->mm and updates mm->sc_stat. Nothing keeps that
mm alive. The rq lock and rq->cpu_epoch_lock it holds have nothing to do
with the lifetime of the mm.

If that task happens to be in execve(), exec_mmap() points tsk->mm and
tsk->active_mm at the new mm, and exec_mm_put_old() from setup_new_exec()
drops the old one. free_bprm() does the same when exec fails. On the way
from mmput() down to __mmdrop(), mm_destroy_sched() calls free_percpu() on
sc_stat.pcpu_sched and free_mm() returns the mm_struct.

Whoever already read the old pointer keeps using it. It adds to runtime in
the freed per-cpu area and reads sc_stat in the freed mm_struct. Depending
on the condition it also writes sc_stat.cpu. That is a use-after-free.

Commit 9f23469401b0 ("sched/cache: Fix potential NULL mm pointer access")
changed the remaining p->mm dereference to the local variable, and said the
active_mm reference keeps the structure allocated. That holds for the other
paths that detach an mm, since they take an mmgrab_lazy_tlb() reference.
exec reassigns active_mm to the new mm as well, so that reference is gone.
What is left is the mm_users reference in bprm->old_mm, and dropping it is
the free.

             CPU0                                CPU1

                                      write(pipe)
                                      try_to_wake_up()
                                        ttwu_queue()      // takes rq0 lock
                                          enqueue_task_fair()
                                            update_curr()
                                              update_se()
                                                account_mm_sched()
                                                  mm = rq0->curr->mm
                                                        // old mm
  execve()
    exec_mmap()                       // tsk->mm = new mm
    setup_new_exec()
      exec_mm_put_old()
        mmput() -> ... -> __mmdrop()
          mm_destroy_sched()          // free_percpu()
          free_mm()
                                                  read mm->sc_stat.epoch
                                                        // use-after-free

KASAN log:

  BUG: KASAN: slab-use-after-free in update_se+0xe6e/0xf70
  Read of size 8 at addr ffff8880093cad10 by task sc-direct-set/80
  ...
  Call Trace:
   update_se+0xe6e/0xf70
   update_curr.isra.0+0x28/0x380
   enqueue_task_fair+0xb58/0x3560
   enqueue_task+0x70/0x170
   ttwu_do_activate+0xeb/0x590
   try_to_wake_up+0x79b/0x14f0
   autoremove_wake_function+0x16/0x150
   __wake_up_common+0xed/0x160
   __wake_up_sync_key+0x36/0x50
   anon_pipe_write+0xa62/0x1830
   vfs_write+0xa4f/0xcf0
   ksys_write+0x17c/0x1c0
   do_syscall_64+0xdd/0x4a0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
  ...
  Freed by task 1:
   kmem_cache_free+0xba/0x3b0
   setup_new_exec+0x2c4/0x3d0
   load_elf_binary+0x435/0x4740
   bprm_execve+0x6d2/0x1290
   do_execveat_common.isra.0+0x3a3/0x580
   __x64_sys_execve+0x8e/0xc0
  ...
  The buggy address belongs to the object at ffff8880093cab80
   which belongs to the cache mm_struct of size 1688
  The buggy address is located 400 bytes inside of
   freed 1688-byte region [ffff8880093cab80, ffff8880093cb218)

Take and release the exec'ing task's own rq lock once before the old mm is
dropped. The task account_mm_sched() looks at is that rq's curr, so it is
the same lock a reader holding the old pointer is on. If the task migrated
to another CPU in between, leaving that rq required the same lock, so a
reader there has already finished.

That reader only uses the mm inside the rq lock and never hands the
pointer out. Getting the lock means it is done, and whoever takes the lock
after that sees the new tsk->mm.

Fixes: df0d98475954 ("sched/cache: Introduce infrastructure for cache-aware load balancing")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 fs/exec.c             |  1 +
 include/linux/sched.h |  4 ++++
 kernel/events/core.c  |  2 ++
 kernel/sched/fair.c   | 16 ++++++++++++++++
 4 files changed, 23 insertions(+)

diff --git a/fs/exec.c b/fs/exec.c
index 745f6eb5279e6..6194c38807980 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -916,6 +916,7 @@ static void exec_mm_put_old(struct mm_struct *old_mm)
 {
 	setmax_mm_hiwater_rss(&current->signal->maxrss, old_mm);
 	mm_update_next_owner(old_mm);
+	sched_cache_exec_done();
 	mmput(old_mm);
 }
 
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8b3d47a325cca..6ae31bffe049e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2415,10 +2415,14 @@ struct sched_cache_stat {
 	int cpu;
 } ____cacheline_aligned_in_smp;
 
+void sched_cache_exec_done(void);
+
 #else
 
 struct sched_cache_stat { };
 
+static inline void sched_cache_exec_done(void) { }
+
 #endif
 
 #ifndef MODULE
diff --git a/kernel/events/core.c b/kernel/events/core.c
index a6c8e38a31104..2f29cbccf03f1 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5427,6 +5427,8 @@ attach_task_ctx_data(struct task_struct *task, struct kmem_cache *ctx_cache,
 	if (!cd)
 		return -ENOMEM;
 
+	/* @old, loaded by the try_cmpxchg() below, is only stable under RCU. */
+	guard(rcu)();
 	for (;;) {
 		if (try_cmpxchg(&task->perf_ctx_data, &old, cd)) {
 			if (old)
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6d881e530f891..fc63bfcbccc5b 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1989,6 +1989,22 @@ void init_sched_mm(struct task_struct *p)
 	p->preferred_llc = -1;
 }
 
+/* exec() has switched to the new mm and is about to drop the old one. */
+void sched_cache_exec_done(void)
+{
+	struct rq_flags rf;
+	struct rq *rq;
+
+	/*
+	 * account_mm_sched() dereferences rq->curr->mm under this rq's lock,
+	 * so a remote CPU can still be using the old mm. The lock cycle waits
+	 * for it, and the store to tsk->mm cannot be reordered past the
+	 * release, so later acquirers see the new mm.
+	 */
+	rq = this_rq_lock_irq(&rf);
+	rq_unlock_irq(rq, &rf);
+}
+
 #else /* CONFIG_SCHED_CACHE */
 
 static inline void account_mm_sched(struct rq *rq, struct task_struct *p,
-- 
2.43.0

