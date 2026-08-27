Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8193E0C46
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787873495; cv=none; b=V806FEWlUkVoSaRYnbik6D056qqV5dgOQ+4rdJaEb0bkvC5NaiY8S5elP77Dk+b1t4bPEpPc7zL2fxLZsizp5V8uGDD8bLCgm81Ss5iFLJ5iTCy40nTJKV5AaNagFiw+8qdcIGLx+zAlhWV+e5z9TKwsFS3uM2ox8Ek/kc1Zpts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787873495; c=relaxed/simple;
	bh=MoqQQPGu0W+jsTlyJM/eR16SFJKPR4Ev04RS0g2Ytf4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AXMUrh7L7nHtUIg53QMGwCmMRjScQ/xlJ3XoDBZn99iA9huF3Uz9yKSeiuhzmk1xFqCWX0hC4inSy5pecCnfG53cQr3J5xAEBUDEpnfPXCfRXaAjVCQlD+AXrBbVg8SpNRlLqwdkSVuKFHutkTFmA/Z59AA3MKjdcQm7NdM3gAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stevensd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J2Qi3xaM; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stevensd.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J2Qi3xaM"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so469075a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873493; x=1788478293; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PgniuiCLGc5SclSuhaFn4pRhiopbh+4BL9/R1MdVpyI=;
        b=J2Qi3xaMrqUHswR9RIMndRRIZIitSIMzHJus76+bcNC9pzNVXjIfrHzFKAad55Aeyz
         wkPPDAiVjg/isFcaScrm477z4d0KgvAqK0PucADQtf0fhOC1/duP2wKNHRUf7o9mgG05
         vQwieir1hBCY/xi/Lojh7LoEboBO7CfbuYY1t5YPuYkj1rqXu5mV1uVFsBScbgupRA7c
         607ZCSWebE7qDuzczjg5cSeNc+VSr94PST3IuVbgdoU/j0SUD/WmnzXOzim4zUkKqDVk
         EsjZmb+GX5JSngnPmu2pYYVCHRBQ4bRZBNBGS81XQGkXP7h/xCiFwb4noiECWDa+EI2P
         9HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873493; x=1788478293;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PgniuiCLGc5SclSuhaFn4pRhiopbh+4BL9/R1MdVpyI=;
        b=q7qCCpfnLh9j0VpocopQ6rGFqE1r3mSFby1uyJc4wd1uLpeb9E4mqcy6g414cxRHIy
         5XZ4T0ZpHVCG/BVJW0T9Rcvc6wxI2VkhcgZe+ka+9uyrcem+YG9s/bosAc6+w2U8UDmT
         QQD40xcGZ5ZQGs20Gd8fdUY3Q2NTcxr8Ak2FOA8HGLWCJMmN3jYb3aSRbrTGnSPntLRx
         eBvW8SYNgwW7xwrttilngeW3Quwfdv97XnIwocvm4mcn06vsQeRdbiF2bnewzJsUhbTP
         T/Yp7laAx6lhqbcEDBZYuTum+VWwZ5SiDazDqUcj5Kaq80dJlqf36waKL+Lau3vw3T4D
         O3Gw==
X-Gm-Message-State: AFuF++lq8jrNKHICGnqyGonoG7xMr4FTXiOpTuwq43D221dVOzNKEnBb
	aQwZTEGS2CB7C79IMcoiBvndrnao+9Gr/ozVHazuYLpwAl7Ql5TazgGogLnBE43ydSvL/NQVvdN
	0zPj95YWbeRzY3w==
X-Received: from dlbdm24.prod.google.com ([2002:a05:7022:6b98:b0:141:4a59:5b22])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:380a:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-396d0daf810mr4980324a91.5.1787873492204;
 Thu, 27 Aug 2026 16:31:32 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:46 -0700
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-9-stevensd@google.com>
Subject: [RFC 08/10] Set PF_RECLAIMABLE_STACK in various places
From: David Stevens <stevensd@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"

Annotate various blocking locations with the PF_RECLAIMABLE_STACK.

Signed-off-by: David Stevens <stevensd@google.com>
---
 drivers/android/binder/thread.rs | 14 +++++++++++++
 fs/eventpoll.c                   |  3 +++
 fs/pipe.c                        | 28 ++++++++++++++++---------
 fs/select.c                      |  3 +++
 kernel/futex/waitwake.c          |  3 +++
 kernel/signal.c                  | 36 +++++++++++++++++++-------------
 kernel/time/hrtimer.c            |  3 +++
 rust/kernel/task.rs              | 16 ++++++++++++++
 8 files changed, 82 insertions(+), 24 deletions(-)

diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
index bc0ef8927905..be62f7fd43ca 100644
--- a/drivers/android/binder/thread.rs
+++ b/drivers/android/binder/thread.rs
@@ -538,13 +538,21 @@ fn get_work_local(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn Deliv
 
         // Loop waiting only on the local queue (i.e., not registering with the process queue).
         let mut inner = self.inner.lock();
+        // SAFETY: Only accessed locally in this function
+        let current = unsafe { Task::current() };
         loop {
             if let Some(work) = inner.pop_work() {
                 return Ok(Some(work));
             }
 
             inner.looper_flags |= LOOPER_WAITING;
+
+            current.set_flag_bits(bindings::PF_RECLAIMABLE_STACK);
+
             let signal_pending = self.work_condvar.wait_interruptible_freezable(&mut inner);
+
+            current.clear_flag_bits(bindings::PF_RECLAIMABLE_STACK);
+
             inner.looper_flags &= !LOOPER_WAITING;
 
             if signal_pending {
@@ -592,15 +600,21 @@ fn get_work(self: &Arc<Self>, wait: bool) -> Result<Option<DLArc<dyn DeliverToRe
         };
 
         let mut inner = self.inner.lock();
+        // SAFETY: Only accessed locally in this function
+        let current = unsafe { Task::current() };
         loop {
             if let Some(work) = inner.pop_work() {
                 return Ok(Some(work));
             }
 
+            current.set_flag_bits(bindings::PF_RECLAIMABLE_STACK);
+
             inner.looper_flags |= LOOPER_WAITING | LOOPER_WAITING_PROC;
             let signal_pending = self.work_condvar.wait_interruptible_freezable(&mut inner);
             inner.looper_flags &= !(LOOPER_WAITING | LOOPER_WAITING_PROC);
 
+            current.clear_flag_bits(bindings::PF_RECLAIMABLE_STACK);
+
             if signal_pending || inner.looper_need_return {
                 // We need to return now. We need to pull the thread off the list of ready threads
                 // (by dropping `reg`), then check the state again after it's off the list to
diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index eed8cecd94e3..4e9c09446b48 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -9,6 +9,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/sched/signal.h>
+#include <linux/sched/task_stack.h>
 #include <linux/fs.h>
 #include <linux/file.h>
 #include <linux/signal.h>
@@ -2302,6 +2303,8 @@ static int ep_poll(struct eventpoll *ep, struct epoll_event __user *events,
 		if (signal_pending(current))
 			return -EINTR;
 
+		guard(allow_stack_reclaim)();
+
 		/*
 		 * Internally init_wait() uses autoremove_wake_function(),
 		 * thus wait entry is removed from the wait queue on each
diff --git a/fs/pipe.c b/fs/pipe.c
index 429b0714ec57..15503b12fe8f 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -27,6 +27,7 @@
 #include <linux/watch_queue.h>
 #include <linux/sysctl.h>
 #include <linux/sort.h>
+#include <linux/sched/task_stack.h>
 
 #include <linux/uaccess.h>
 #include <asm/ioctls.h>
@@ -469,16 +470,23 @@ anon_pipe_read(struct kiocb *iocb, struct iov_iter *to)
 			break;
 		}
 		mutex_unlock(&pipe->mutex);
-		/*
-		 * We only get here if we didn't actually read anything.
-		 *
-		 * But because we didn't read anything, at this point we can
-		 * just return directly with -ERESTARTSYS if we're interrupted,
-		 * since we've done any required wakeups and there's no need
-		 * to mark anything accessed. And we've dropped the lock.
-		 */
-		if (wait_event_interruptible_exclusive(pipe->rd_wait, pipe_readable(pipe)) < 0)
-			return -ERESTARTSYS;
+
+		{
+			guard(allow_stack_reclaim)();
+			/*
+			 * We only get here if we didn't actually read
+			 * anything.
+			 *
+			 * But because we didn't read anything, at this point
+			 * we can just return directly with -ERESTARTSYS if
+			 * we're interrupted, since we've done any required
+			 * wakeups and there's no need to mark anything
+			 * accessed. And we've dropped the lock.
+			 */
+			if (wait_event_interruptible_exclusive(pipe->rd_wait,
+							       pipe_readable(pipe)) < 0)
+				return -ERESTARTSYS;
+		}
 
 		wake_next_reader = true;
 		mutex_lock(&pipe->mutex);
diff --git a/fs/select.c b/fs/select.c
index 95d76531015a..3af1bf4d74a9 100644
--- a/fs/select.c
+++ b/fs/select.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/sched/signal.h>
 #include <linux/sched/rt.h>
+#include <linux/sched/task_stack.h>
 #include <linux/syscalls.h>
 #include <linux/export.h>
 #include <linux/slab.h>
@@ -236,6 +237,8 @@ static int poll_schedule_timeout(struct poll_wqueues *pwq, int state,
 {
 	int rc = -EINTR;
 
+	guard(allow_stack_reclaim)();
+
 	set_current_state(state);
 	if (!READ_ONCE(pwq->triggered))
 		rc = schedule_hrtimeout_range(expires, slack, HRTIMER_MODE_ABS);
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index d4483d15d30a..0fbf7bfcd904 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -2,6 +2,7 @@
 
 #include <linux/plist.h>
 #include <linux/sched/task.h>
+#include <linux/sched/task_stack.h>
 #include <linux/sched/signal.h>
 #include <linux/freezer.h>
 
@@ -378,6 +379,7 @@ void futex_do_wait(struct futex_q *q, struct hrtimer_sleeper *timeout)
 	 * has tried to wake us, and we can skip the call to schedule().
 	 */
 	if (likely(!plist_node_empty(&q->list))) {
+		guard(allow_stack_reclaim)();
 		/*
 		 * If the timer has already expired, current will already be
 		 * flagged for rescheduling. Only call schedule if there
@@ -547,6 +549,7 @@ static void futex_sleep_multiple(struct futex_vector *vs, unsigned int count,
 			return;
 	}
 
+	guard(allow_stack_reclaim)();
 	schedule();
 }
 
diff --git a/kernel/signal.c b/kernel/signal.c
index bbc0fd4cc4d7..ca0d79ee013f 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -2718,17 +2718,21 @@ static void do_freezer_trap(void)
 		return;
 	}
 
-	/*
-	 * Now we're sure that there is no pending fatal signal and no
-	 * pending traps. Clear TIF_SIGPENDING to not get out of schedule()
-	 * immediately (if there is a non-fatal signal pending), and
-	 * put the task into sleep.
-	 */
-	__set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
-	clear_thread_flag(TIF_SIGPENDING);
-	spin_unlock_irq(&current->sighand->siglock);
-	cgroup_enter_frozen();
-	schedule();
+	{
+		guard(allow_stack_reclaim)();
+
+		/*
+		 * Now we're sure that there is no pending fatal signal and no
+		 * pending traps. Clear TIF_SIGPENDING to not get out of schedule()
+		 * immediately (if there is a non-fatal signal pending), and
+		 * put the task into sleep.
+		 */
+		__set_current_state(TASK_INTERRUPTIBLE | TASK_FREEZABLE);
+		clear_thread_flag(TIF_SIGPENDING);
+		spin_unlock_irq(&current->sighand->siglock);
+		cgroup_enter_frozen();
+		schedule();
+	}
 
 	/*
 	 * We could've been woken by task_work, run it to clear
@@ -3788,9 +3792,13 @@ static int do_sigtimedwait(const sigset_t *which, kernel_siginfo_t *info,
 		recalc_sigpending();
 		spin_unlock_irq(&tsk->sighand->siglock);
 
-		__set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
-		ret = schedule_hrtimeout_range(to, tsk->timer_slack_ns,
-					       HRTIMER_MODE_REL);
+		{
+			guard(allow_stack_reclaim)();
+			__set_current_state(TASK_INTERRUPTIBLE | TASK_FREEZABLE);
+			ret = schedule_hrtimeout_range(to, tsk->timer_slack_ns,
+						       HRTIMER_MODE_REL);
+		}
+
 		spin_lock_irq(&tsk->sighand->siglock);
 		__set_task_blocked(tsk, &tsk->real_blocked);
 		sigemptyset(&tsk->real_blocked);
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 313dcea127fe..30c85482dfd5 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -39,6 +39,7 @@
 #include <linux/sched/nohz.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/isolation.h>
+#include <linux/sched/task_stack.h>
 #include <linux/timer.h>
 #include <linux/freezer.h>
 #include <linux/compat.h>
@@ -2392,6 +2393,8 @@ static int __sched do_nanosleep(struct hrtimer_sleeper *t, enum hrtimer_mode mod
 	struct restart_block *restart;
 
 	do {
+		guard(allow_stack_reclaim)();
+
 		set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
 		hrtimer_sleeper_start_expires(t, mode);
 
diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 38273f4eedb5..6168f058343a 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -344,6 +344,22 @@ pub fn group_leader(&self) -> &Task {
         // only be used while `current` is still valid, thus still running.
         unsafe { &*ptr.cast() }
     }
+
+    /// Sets the given task flag bits on the current task.
+    #[inline]
+    pub fn set_flag_bits(&self, set: u32) {
+            // SAFETY: The `flags` field of `current` is not modified from other threads, so
+	    // the non-atomic update isn't a race.
+	    unsafe { (*self.as_ptr()).flags |= set }
+    }
+
+    /// Clears the given task flag bits on the current task.
+    #[inline]
+    pub fn clear_flag_bits(&self, clear: u32) {
+            // SAFETY: The `flags` field of `current` is not modified from other threads, so
+	    // the non-atomic update isn't a race.
+	    unsafe { (*self.as_ptr()).flags &= !clear }
+    }
 }
 
 // SAFETY: The type invariants guarantee that `Task` is always refcounted.
-- 
2.55.0.897.gb25b4bd76c-goog

