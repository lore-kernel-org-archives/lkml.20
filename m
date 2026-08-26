Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFBC3C2BA4
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744508; cv=none; b=iaDhvqKrwzr6PD/nUiaHYsvMXCgvZ1i/3cX9kG8EfughUvU77IaIvx+Be3d2f8EE7Ca7g3p3eayN2DoFo8JzgzfBrXU8wbCD4IylpxK9FkwxvciB8Su0Fm2SXvo4SpMAZTMxflLoy6EiY40reBqK8EMz9GPUtbpAN1K4qInCTdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744508; c=relaxed/simple;
	bh=MM4ibdkKS76QI8mQpvyYGaMvTdvjU4sySpgEFr8mqOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eXGx8Mz/FIWlxWV5qftQWCxTnUcgFSSMvnKkuhMJRivsThgZVp4+gkDGU+Ez62xUY2VooAet4Isq1Vw8UIrCI/fqW035Hr+yBdiK6dWuRfhiV/Ia05bu3SE9iUC9r4A+Hn9tc6YsiMXZ+/uXp0cy7lgOt3TxWYgwjBUtu5qyYjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqIx0O8l; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqIx0O8l"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caed617615so9414435ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787744506; x=1788349306; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fHRm/8l8Lx1n15ZBXu5Lns0HIeJPog3QvH466YrJxBs=;
        b=fqIx0O8lKB5feS7S3zfdK84Kh6VWVf0LBbMDoV2PPWUpdUvPA+/XZqZ+WLKKT7pbrI
         cF2eNp3CpzvfCvpyCukGw65FTpJHLhaF64AliGJs0L7GBHpBL2lIHjLXveJrxO320ksf
         3JSr44QseWcayyI/j18HyA3dOfccwnF4E0MjWmIXKT1aMbGcZqzmJbReBb0SeODmhzUU
         JQ/24aai9MyO1OCjm0U1sG6VT/F38i9/iX0g55q1pUTRWkuX9Q3CfIDNOLpmH39/AmXR
         3KxPusHJWjUbQnDuezkPgrJqtsWD/dxvBr0szVpCR7hXkX06qtB5YDB2Y5uGNXB5YaPP
         sSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744506; x=1788349306;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHRm/8l8Lx1n15ZBXu5Lns0HIeJPog3QvH466YrJxBs=;
        b=UDZkjITLWq5VfpTngs/T895WCO8Yn1cu8PlSWNILi4uS/cTev9S9h7um+yi96Jx8DU
         iDiXO/7EK+RHAn4TyAxBMraPOtGTIoBMh3dSwGBIxTZe7/ypnPyGKB+peIXoQ0TbYRc/
         7lIkkkmkWaVh5yjN3tzLqvTNxpkzv59hOPhdUZe13gOe0n7lUu6gHiKCvDm3f9xBCvE4
         pbB+Otgh/w99+oze0T1XVC+abz6zIqAsExWNcZUYbNnXrqkakvIv3tNSaEJgzoYIresg
         byuxFHHs1ekQL4UXeM3DT6ZcHrEEMPHAASe9g9+YhwWObu3LhbpBzCMKqp1O8jV+p+VE
         qt+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoBCcCBpzMZRKmZvMjMmBKKuM+h/u+Rqi8fHo1iaSYsU5LYRPAy0nOTXPAZcw1lk5mlE3bKU2KkbZ01Nks=@vger.kernel.org
X-Gm-Message-State: AFuF++k0wLYqWwtizHnOz1rYV9AGhbHh6sa24CwEbRMuAhEoyUNcRpu/
	9ZSZO/CW/GWCk6lTVgYlhSJovneuBV9xrPrXqwV5UsdyRKsTqKRMhZhn
X-Gm-Gg: AR+sD119mjSz+BWtXWsGThgBqZ+FmQQLxmWQYAhzYPOQLDl2YprX/jXW5icor0Go+Xp
	xlCGhkqXWQ6vtRxdt9IAkIU08UWaHoUSR/+eYoG3Yo9UMJjrZUo+OSLRCIhEFei8cLoMs/qRsA1
	WO7sy+NOvw9MDClNxC7sHPVg4StTg4w0FL1WBzvulPY2+aFA1bb8bZN/bEzZJjwk+PqJfoyKsEJ
	ZBtQhwpQIjfHmG857M3c7PDaq50jrJMIkUa8LP75qcGLsDfS+13FJSkTEqk/aOOZSfHqrih3aTp
	WRGwib6i1lRDmp+t0ZR10bcUlwhh8lUajcarDxCfjGF/Ss6cKJCUGGtoivpACUMN7HKAbefzoYv
	yXJSBQhyHotJUeHcgTOLClEAsdmhbuZUs8sVRNSCVfQc2H3Si3h/X7PNSCH/wH3XIXWdu7Rd45t
	8MPL0GgcMUfE9z1hlr2fOzG7oEkCVbDhQWNGyNdICghSgXMkHN8YtEuhk4zS1lviSNRiA9rzsHO
	HQDxSQ=
X-Received: by 2002:a17:902:f789:b0:2d6:5beb:8692 with SMTP id d9443c01a7336-2d707a89d51mr110948915ad.6.1787744504064;
        Wed, 26 Aug 2026 04:41:44 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7147b6d64sm3349365ad.80.2026.08.26.04.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:41:43 -0700 (PDT)
Date: Wed, 26 Aug 2026 20:41:38 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Kees Cook <kees@kernel.org>, Christian Brauner <brauner@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>,
	John Stultz <jstultz@google.com>, Ingo Molnar <mingo@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, Hyunwoo Kim <imv4bel@gmail.com>
Subject: [PATCH v2] posix-cpu-timers: Dequeue per-thread timers before
 exchange_tids()
Message-ID: <ao7Q8miiuLAPVnWv@v4bel>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

A per-thread CPU timer holds a reference to the PID of the thread it is
attached to and, while it is armed, its node is queued in that thread's
posix_cputimers. The task is looked up by that PID.

When a non-leader thread exec()s, de_thread() changes which task owns
that PID. pid_task(timer->it.cpu.pid, PIDTYPE_PID) then returns NULL,
but the node is still queued on tsk, which is alive. timer_lock_sighand()
takes a failed lookup to mean that the node is already dequeued, so it
has nothing to undo.

begin_new_exec() calls posix_cpu_timers_exit(me) right after
exec_task_namespaces() and that removes the leftover node, so the state
normally stays invisible. But bprm->point_of_no_return is set before
de_thread(), so if unshare_files(), set_mm_exe_file(), exec_mmap() or
exec_task_namespaces() fails, the task dies before it gets there.
exit_itimers() then frees the k_itimer while its node is still queued,
and reaping tsk later erases that freed node from the rbtree.

In short:

      the non-leader thread B           the parent

  timer_create(CLOCK_THREAD_CPUTIME_ID)
  timer_settime()
    arm_timer()            // the node is queued on B
  execve()
    de_thread(B)
      exchange_tids(B, leader)  // B's PID now belongs to the leader
      release_task(leader)
        __exit_signal(leader)
          posix_cpu_timers_exit(leader)  // cleans leader's queue, not B's
          __unhash_process(leader)  // that PID has no task anymore
    exec_mmap()
      mmap_read_lock_killable(old_mm)
                                kill(B, SIGKILL)
      // -EINTR
  get_signal()
    do_exit()
      exit_itimers()
        posix_timer_delete()
          posix_cpu_timer_del()
        posix_timer_unhash_and_free()  // freed while still queued
                                wait4()
                                  release_task(B)
                                    posix_cpu_timers_exit(B)
                                      cleanup_timerqueue()
                                        timerqueue_del()  // use-after-free

KASAN log:

  BUG: KASAN: slab-use-after-free in timerqueue_del+0x59/0x80
  Write of size 8 at addr ffff88801090e7e0 by task poc/99
  ...
  Call Trace:
   <TASK>
   timerqueue_del+0x59/0x80
   posix_cpu_timers_exit+0xa8/0xe0
   release_task+0x1c6/0xa40
   wait_consider_task+0x922/0x15f0
   __do_wait+0x3bc/0x3d0
   do_wait+0xba/0x1d0
   kernel_wait4+0xfe/0x1d0
   __do_sys_wait4+0x10b/0x120
   do_syscall_64+0xf9/0x540
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
  ...
  Allocated by task 114:
   kmem_cache_alloc_noprof+0x143/0x3d0
   do_timer_create+0x156/0x890
   __x64_sys_timer_create+0x113/0x130
  ...
  Freed by task 104:
   __kasan_slab_free+0x43/0x70
   __rcu_free_sheaf_prepare+0x5c/0x260
   rcu_free_sheaf+0x1a/0xc0
   rcu_core+0x3d1/0xdf0
   handle_softirqs+0x133/0x400
  ...
  The buggy address belongs to the object at ffff88801090e700
   which belongs to the cache posix_timers_cache of size 384
  The buggy address is located 224 bytes inside of
   freed 384-byte region [ffff88801090e700, ffff88801090e880)

Dequeue the per-thread CPU timers of tsk before the PID changes hands, so
that a failed lookup again implies a dequeued node. Process-wide timers
are looked up with PIDTYPE_TGID and transfer_pid() moves that link to
tsk, so they are left alone.

Fixes: 55e8c8eb2c7b ("posix-cpu-timers: Store a reference to a pid not a task")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
Changes in v2:
- Add the trigger sequence and the KASAN log to the commit message.
- v1: https://lore.kernel.org/all/anfgrsPlUdwBhdrp@v4bel/
---
 fs/exec.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/exec.c b/fs/exec.c
index 745f6eb5279e6..9b2d140bd9f2a 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1003,6 +1003,18 @@ static int de_thread(struct task_struct *tsk)
 		 * the former thread group leader:
 		 */
 
+#ifdef CONFIG_POSIX_TIMERS
+		/*
+		 * exchange_tids() hands this thread's PID to the old leader,
+		 * which is reaped right after. The PID lookup in
+		 * timer_lock_sighand() then fails while the per thread CPU
+		 * timers are still queued here, so dequeue them first.
+		 */
+		spin_lock(lock);
+		posix_cpu_timers_exit(tsk);
+		spin_unlock(lock);
+#endif
+
 		/* Become a process group leader with the old leader's pid.
 		 * The old leader becomes a thread of the this thread group.
 		 */
-- 
2.43.0

