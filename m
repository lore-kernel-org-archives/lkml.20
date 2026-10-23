Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792719400;
	b=QZgHlzLxOS5ih3VKyQDWBceN44WVXM1lvbGil6NQcRBUaNdmEo5lzS6KDOhcBqzj8rmw
	 3KO492kgqcIMaINfIzIwjjF9R0L6K46GC4m3hPAmHypBQlbIFtkRAiKoQsqX3+0yeIZD2
	 96UyDv9H3evoJ7O46VKRTswLeVNSbxIwxXJHtSPjjl8BeamSSH39U5Zx3OHxZDOShl7Rn
	 sH2i/gVOddAc96R93v3r2Mv36DtiSqyo98zxdAVqG4iinjC9Z6d5cRnElyc1mYZoVTka/
	 MOM81C/zhrWWCdJWqEutruONF2W3X4lvbVDutsyXk4p4RqNkIaKjlklKKPcl3UNTocw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792719400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+caKoJ5ewCmDfw6YJLvCZQbtkEfaVq/pCFrwOztaY2o=;
	b=eKKoFiBGnWTdyk+MzxQql6eZ//DvQckevcLnxWm16vBwec8OIwWNhOQWadVaqDxFFq+/
	 SuN7OU6xHDnSIBb8JwSnyIy66lAeP5u0YPWQVvDVIxIgPFS5tYO+r6vg9V/walPUw5jXS
	 y52C6KHdCPweu83BFtKwKo5DpXbCjvMTRzDWWRSw+EyM5VQ6IZoO4LqBKsbK6pfQkm/yb
	 1hMzBa5OweOBqnqbkujByAM2+rUVEIVmxZY6GpVoKgn0Ax5LVdOWMH28L5bWNYZ3SAM2K
	 fFTnVZ3Wovx0ow68msoY/jayJUXzA5tjt7BQzGTpOLlNbMMXLKW6tOsI/XvQ7pEt1WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZqVaa9KM;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6FB606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6FB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZqVaa9KM
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a06b436dffso177363b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792719399; x=1793324199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+caKoJ5ewCmDfw6YJLvCZQbtkEfaVq/pCFrwOztaY2o=;
        b=ZqVaa9KM8kg7qW3KXwRF3cbNjY+wHY540MPU7eiuRoGA5PpOO6lDqjHUSSeCP2oMKC
         Fd2pgM8TGjRtX0k5w5twdfxrJ3Kd2nFN68iTgU5HqhVapLlEutFf4ye3R8YCDO0IucrM
         3dvOdzPSHzpUEn93k+GuKhjbfKOs5YfY70osLq8FaLPG42oCNR88XrmFF11OSQkSsms/
         5hhUzQXuFX/xcpA4kk+9fkauZJ++750IVAANBWCBwAE6OUC2SHg+P0uqBkNnninX8A3p
         pa2HgeMwH678ZJmDWER1bAjhSdcFAGkLeN9Fz+ubFBrtQs9hQBn+aWRYmZ7ksUw1CxFN
         +vzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792719399; x=1793324199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+caKoJ5ewCmDfw6YJLvCZQbtkEfaVq/pCFrwOztaY2o=;
        b=ORrWMIDwHmHyedkhJPeUt4bGhnUOE1kXDS8Deb7e3BnpxKHpKOac5luoWw+Coo/Y+3
         sTu88dHJPIk/5kFbHu6bWh3k6xD2IiuwwNZqajSCcyu5Fe99Rge1xm8ZqoK2bE/EgC/y
         OwNzmzoXhKDufHUSPHmkwjxunlo04wfqiUvuYuiYQHFZSHwNkZjQhqmvE8SVLXsk/Hm5
         0LtzgDes1z6bSz/YuwUJH77fjYt1eOTAqHgK4mvu2JSVDw+NqI5GtEEl3yC6i2yHqQt5
         ni+jxGKpIBF4BddPZZcI+Ol+f5k66BqzF6c8OYUwqceQVH0KQmIVtOCSRc+df2pCOLP9
         +uhw==
X-Forwarded-Encrypted: i=1; AKwUvBwHJ3DXkdm6OuCjiFcO+gqTn5ajDVbnxvX9lwJ65wuKCyCwjc1/tHUfU6XcAHe+xd+LmWv6v4361NPl56s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLJnOk5tXTM2qZS6O+FelmluyMxPDiRJt/DrKi79rtgDPm5d7Y
	EzakRkPHX4fyS5UNwbXA9wJJgV0Ddz079GSx1P9ilPZZVkVkR8YGBgkP
X-Gm-Gg: AYBFou1CTJR53M9DBlROfysae2pviS1HIsdMrUYcMVAZ/xIZmukhXP6v7gvp2bvUzqY
	PqUzJRjw6DR2moKG/Y7R6KnNneLnft0fFh9xDDkg5fXwplwQIWc4ttXoaj1XgXNNyaWrbOCVt9F
	9XFZT8UNz3Y6oPcWNwvlIp6sxPtojJiSfHtOiPnrhKEihgcMhJRzEqsPnMytq5wWr62FTGtzyal
	avu+I9XmKQYfvPEMVnPdpu0f/oqR0AD5zNtWpI1mxnz9fabx3LgYFfg7TDaL20V5ulKc6z8yqWR
	lFZX75t7rp7XmxFuNryxG7Lah3DYw0tOHbFfrVmTf0VHZjuox8yMfkAWiq9VJ+cSVcI0yE6t3aJ
	8Esj+6g5eQZhF0+n7QN52IiOloE5Exn81LKbYrSCosOtGd1XU2sXRJjjucsMkYzcLRuoyaGmrIk
	bBDBiXjEF9OwH5iP9giiWSitwhbyeLhWc4omnQY4CWzNMBk8HAOsaUpuptE+Gxk6nv5A+7OJ9jo
	3EanzBLhmQNiYYrhEo7xR1PQoNMq24Ceu+tzX3HdUF3MYfoZ7JzGI6/Z+PxPClxpoA+
X-Received: by 2002:a05:6a00:929c:b0:8a0:7dc4:95c0 with SMTP id d2e1a72fcca58-8a2c5e36c70mr786369b3a.15.1792719399389;
        Thu, 22 Oct 2026 18:36:39 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c8dcab76sm182997b3a.25.2026.10.22.18.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 18:36:37 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/autogroup: Fix task_group UAF during thread creation
Date: Fri, 23 Oct 2026 10:36:31 +0900
Message-ID: <20261023013631.881730-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

sched_cgroup_fork() assigns a CLONE_THREAD child in the root CPU cgroup to
p->signal->autogroup->tg before the child is visible on the thread list.
Autogroup ownership is per signal_struct: CLONE_THREAD reuses the existing
signal_struct and does not acquire an autogroup reference for the child.

ksys_setsid() releases tasklist_lock before calling
sched_autogroup_create_attach(), so tasklist_lock does not serialize the
autogroup move against this unpublished part of copy_process():

  clone(CLONE_THREAD) caller      sibling setsid() caller
  -------------------------       -----------------------
  sched_cgroup_fork()
                                  sched_autogroup_create_attach()
                                    autogroup_move_group()
                                      lock(siglock)
                                      signal->autogroup = new
                                      for_each_thread()
                                      unlock(siglock)
                                      autogroup_kref_put(old)
  lock(siglock)
  list_add_tail_rcu(thread_node)
  unlock(siglock)
  wake_up_new_task()

The iteration cannot see the unpublished child. The final put can therefore
drop the signal's last reference to the old autogroup. Two RCU callbacks
then free its per-CPU cfs_rq and task_group while p->sched_task_group,
p->se.cfs_rq, and p->se.parent still point into them.

At the last failure-free point in copy_process(), revalidate the child's
scheduler group while holding the shared siglock and keep the lock held
through thread-list publication. An autogroup move then either completes
before revalidation, or blocks until publication and includes the child.

If the group changed, update p->sched_task_group under p->pi_lock, clear
p->se.cfs_rq so set_task_rq_fair() cannot inspect the freed old runqueue,
and call set_task_rq() to rebuild the fair and RT group links. The TASK_NEW
child has no attached load to migrate.

An unprivileged clone()/setsid() reproducer running as uid/gid 65534 with
all capability sets empty triggered a KASAN task_group slab use-after-free
in wake_up_new_task() on an unmodified Linux v7.3 kernel. The allocation
came from sched_create_group(), and the free ran from
sched_free_group_rcu().
The fix completed 1,024 iterations of both the original race sweep and a
delayed-setsid stress schedule without a KASAN, lockdep, oops, or panic
report.

An AI coding assistant helped identify and validate the race, construct
the reproducer, and draft and test this fix.

Fixes: b1e8206582f9 ("sched: Fix yet more sched_fork() races")
Cc: stable@vger.kernel.org
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 include/linux/sched/autogroup.h |  5 +++++
 kernel/fork.c                   |  9 +++++++++
 kernel/sched/autogroup.c        | 30 ++++++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/include/linux/sched/autogroup.h b/include/linux/sched/autogroup.h
index 704391cc1d206e..d61e4a83b12bac 100644
--- a/include/linux/sched/autogroup.h
+++ b/include/linux/sched/autogroup.h
@@ -6,11 +6,14 @@ struct signal_struct;
 struct task_struct;
 struct task_group;
 struct seq_file;
+struct kernel_clone_args;
 
 #ifdef CONFIG_SCHED_AUTOGROUP
 extern void sched_autogroup_create_attach(struct task_struct *p);
 extern void sched_autogroup_detach(struct task_struct *p);
 extern void sched_autogroup_fork(struct signal_struct *sig);
+void sched_autogroup_fork_finalize(struct task_struct *p,
+				   struct kernel_clone_args *kargs);
 extern void sched_autogroup_exit(struct signal_struct *sig);
 extern void sched_autogroup_exit_task(struct task_struct *p);
 #ifdef CONFIG_PROC_FS
@@ -21,6 +24,8 @@ extern int proc_sched_autogroup_set_nice(struct task_struct *p, int nice);
 static inline void sched_autogroup_create_attach(struct task_struct *p) { }
 static inline void sched_autogroup_detach(struct task_struct *p) { }
 static inline void sched_autogroup_fork(struct signal_struct *sig) { }
+static inline void sched_autogroup_fork_finalize(struct task_struct *p,
+						 struct kernel_clone_args *kargs) { }
 static inline void sched_autogroup_exit(struct signal_struct *sig) { }
 static inline void sched_autogroup_exit_task(struct task_struct *p) { }
 #endif
diff --git a/kernel/fork.c b/kernel/fork.c
index 10f2d05d816a5f..6df4ff21d1b780 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2500,6 +2500,15 @@ __latent_entropy struct task_struct *copy_process(
 
 	/* No more failure paths after this point. */
 
+	/*
+	 * A concurrent autogroup move can replace signal->autogroup after
+	 * sched_cgroup_fork() but before this task is on the thread list.
+	 * Recheck while holding siglock so the move either precedes this check or
+	 * observes the new thread after publication below.
+	 */
+	if (clone_flags & CLONE_THREAD)
+		sched_autogroup_fork_finalize(p, args);
+
 	/*
 	 * Copy seccomp details explicitly here, in case they were changed
 	 * before holding sighand lock.
diff --git a/kernel/sched/autogroup.c b/kernel/sched/autogroup.c
index e380cf9372bbd2..50ad43e7648fc5 100644
--- a/kernel/sched/autogroup.c
+++ b/kernel/sched/autogroup.c
@@ -215,6 +215,36 @@ void sched_autogroup_fork(struct signal_struct *sig)
 	sig->autogroup = autogroup_task_get(current);
 }
 
+/**
+ * sched_autogroup_fork_finalize - recheck a new thread's scheduler group
+ * @p: new task
+ * @kargs: clone arguments holding the pinned cgroup set
+ *
+ * The caller must hold the shared sighand lock and keep it held through
+ * thread-list publication.  The task is still TASK_NEW and has no attached
+ * scheduler load.
+ */
+void sched_autogroup_fork_finalize(struct task_struct *p,
+				   struct kernel_clone_args *kargs)
+{
+	struct task_group *tg;
+	unsigned long flags;
+
+	lockdep_assert_held(&p->sighand->siglock);
+
+	raw_spin_lock_irqsave(&p->pi_lock, flags);
+	tg = container_of(kargs->cset->subsys[cpu_cgrp_id],
+			  struct task_group, css);
+	tg = autogroup_task_group(p, tg);
+	if (tg != p->sched_task_group) {
+		p->sched_task_group = tg;
+		/* Do not let set_task_rq_fair() inspect the possibly freed cfs_rq. */
+		p->se.cfs_rq = NULL;
+		set_task_rq(p, task_cpu(p));
+	}
+	raw_spin_unlock_irqrestore(&p->pi_lock, flags);
+}
+
 void sched_autogroup_exit(struct signal_struct *sig)
 {
 	autogroup_kref_put(sig->autogroup);
-- 
2.55.0

