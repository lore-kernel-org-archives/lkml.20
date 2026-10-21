Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576275;
	b=F9P+IgDYtrxm9/fgD/tbk4DNClyqmDnnWW28T/diEeEN1tosBLlXvP5x1TTpFaEdwlv/
	 dfRTIyYhDWbzfr8IDYihVEyl3OqrOA0Jxj154exCSbBFS5ZG60a5wdwEs9tCk8D7Z2P0S
	 IHJrTJuGxhRrwmRxHgPra774fiZ7ewJYFg8wQWE+E7iTf8mURNJdHC512urpRfWe3VCl6
	 9TIL20R66g2H0VzU/shpyrhdq4ILMJA786u+4Jl2BBKjeR3G7DsNEX6GRgFy6/lSP5tBK
	 0UVM6wbl0kF/wb9Eng5Y/wEZhLo/gC+Q8SarsX2K/O/M3K49+0vBHDjgsQ/nM44Ssig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576275;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:References:
	 Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=dJ7sd0SrByne7vRnlQQWq3Cuij7RQa/ffFboOR+c+1k=;
	b=MxCv4QFfxdZjlNNtZPRUSSfFqtsyiId6Ecm/1rMOhJJ0jQ6rR1lZs0achr6aEXNxZMb9
	 +tFhamtllAig0MjyUnNNcj2ujFGRjTwIk9am3U8hEHoFy3JWsyl2yrwpmvVBCkkj8vMSX
	 ybdMyO5buq+RMoumqNc/yxdF0t2e41SFTu2IBUr3btJL0+EUq6xUAFjDNZpQ94Zld+HJE
	 Mbx+flh6fGplFE+tDLRHxBPX3N8uFAcNJjBPsjog7/4lr+0ndVXCusy1yvlk+Tqk7mhWl
	 lYnV5OHlnbr2OcrzO6R6Z0aRDf0wS/eXYVuvxJ4oFix3n8kdZC6DZVCYA9//cNJLlqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gW++o5yZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7571D606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gW++o5yZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D871F000CE;
	Wed, 21 Oct 2026 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792576274;
	bh=dJ7sd0SrByne7vRnlQQWq3Cuij7RQa/ffFboOR+c+1k=;
	h=Date:From:To:Cc:Subject:References;
	b=gW++o5yZeyacvwIfVPw+tacC0ZZDl5/4RnXxUzAjUK8ybugTPBYCnlOGvGVJlBXrb
	 8aAW8UReqF1m5fSvS3Co7AckJU3+9o88rtto8iZW6zzCN3cxNeY97ageX1Brt5kdec
	 oSbp9YG3e5KQdLlC6yFyoF3m3kcG5e7DRo0F2sjnzetxcl0C23X8PIeRTXMnnmsjcr
	 DZNc/ZkOX4f0/znDfNH+RSaAYeNsgoKceQMHVmSa8/X4+4m1in/+pjxKGXMYGMgTgT
	 rE1aloEqk9a06PedU1jytHze7A2jgMlngUZePYcizOIjD90pYQvgpRMkgbAcAqeTTJ
	 VFYz+IKlfY2Ag==
Date: Wed, 21 Oct 2026 11:51:11 +0200
From: Thomas Gleixner <tglx@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [GIT pull] timers/core for v7.4-rc1
References: <179257622431.804100.15107946105101279363.tglx@fw13>
Message-ID: <179257622796.804100.5245716298409954290.tglx@fw13>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Linus,

please pull the latest timers/core branch from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers-core-2026=
-10-20

up to:  348f54c435bf: selftests/timers: clocksource-switch: Fix unchecked ope=
n()/read()

Updates for the core timekeeping and timers subsystem:

  - Futher cleanups for the POSIX timer exit/exec related code to simplify
    the code flow and to make it more robust against future changes.

  - Prevent tearing of timekeeper::ktime_sec which can be accessed without the
    sequence count protection.

    The timekeeper is updated by memcpy() with an uneven sequence count to
    force readers into the retry path. On 64-bit machine the ktime_sec
    member can be accessed atomically without the sequence count
    protection. That is only correct when the update side memcpy()
    guarantees atomicity at the 64-bit granularity. That's not guaranteed
    due to debug options, compilers and instruction availability. If the
    memcpy() does not provide the atomicity then the unprotected readers
    can observe store tearing.

    To prevent this write the ktime_sec member before the memcpy() so that
    a non-atomic memcpy() will write the same data. A similar fix has been
    done for the xtime_sec member, but the ktime_sec equivalent was missed.

  - Prevent time64_to_tm() day truncation on 32-bit kernels

    The function receives a 64-bit seconds value but stores the quotient of
    the computation in a long, which truncates the result for large input
    values. Cure this by using div_s64_rem() which stores the quotient in
    s64 and only leaves the seconds-within-day reminder in a long, which is
    guaranteed to fit. This fix comes with a corresponding kunit test to
    prevent further mishaps.

  - Mark data-racy accesses to the hrtimer_sleeper::task member.

    The recent updates to KCSAN flagged these benign races. Annotate them
    with new helper functions, convert all existing usage sites and mark
    the task member private after that so that future users which fail to
    use the helpers can be detected automatically.

  - Address similar benign KCSAN flagged issues in the hrtimer, timer and
    timer migration code.

  - Fixes for a few selftest issues

 =20
Thanks,

	tglx

------------------>
Eva Kurchatova (2):
      selftests: timers: Count what tick is worth in the drift estimate
      selftests: timers: Measure the CPU timers on the clock they count

Karl Mehltretter (2):
      time: Prevent time64_to_tm() day truncation on 32-bit
      time/kunit: Add time64_to_tm() case beyond 32-bit day count

Paul E. McKenney (14):
      hrtimer: Mark data-racy accesses to hrtimer_sleeper ->task field
      aio: Use accessor for hrtimer_sleeper ->task field
      wait: Use accessor for hrtimer_sleeper ->task field
      io-uring/rw: Use accessor for hrtimer_sleeper ->task field
      futex: Use accessor for hrtimer_sleeper ->task field in waitwake.c
      timers: Use accessor for hrtimer_sleeper ->task field in sleep_timeout.c
      net: pktgen: Use accessor for hrtimer_sleeper ->task field
      rtmutex: Use accessor for hrtimer_sleeper ->task field
      futex: Use accessor for hrtimer_sleeper ->task field in requeue
      hrtimer: Update hrtimer_resolution only if value changes
      hrtimer: Mark the hrtimer_sleeper structure's ->task field __private
      hrtimer: Apply READ_ONCE() to lockless base->running loads
      timers: Mark racy updates to hlist_node::pprev field
      timers/migration: Mark racy updates to tmigr_event::ignore field

Qingshuang Fu (1):
      selftests/timers: clocksource-switch: Fix unchecked open()/read()

Thomas Gleixner (6):
      posix-timers: Move posixtimer_exec_cleanup() out of exec.c
      posix-timers: Move POSIX timer group exit related code out of do_exit()
      posix-cpu-timers: Move inlines out of public header
      posix-cpu-timers: Use PF_EXITING to indicate exit
      posix-cpu-timers: Prevent enqueueing when PF_EXITING is set
      posix-timers: Handle exit in do_exit() completely

Thomas Wei=C3=9Fschuh (1):
      timekeeping: Use READ_ONCE/WRITE_ONCE() for ktime_sec to prevent tearing


 fs/aio.c                                           |   2 +-
 fs/exec.c                                          |  13 +--
 include/linux/hrtimer.h                            |  10 +-
 include/linux/list.h                               |   6 +-
 include/linux/posix-timers.h                       |  39 +-------
 include/linux/sched/task.h                         |   1 -
 include/linux/wait.h                               |   2 +-
 io_uring/rw.c                                      |   2 +-
 kernel/exit.c                                      |  13 +--
 kernel/futex/requeue.c                             |   2 +-
 kernel/futex/waitwake.c                            |   8 +-
 kernel/locking/rtmutex.c                           |   2 +-
 kernel/time/hrtimer.c                              |  23 ++---
 kernel/time/posix-cpu-timers.c                     | 103 +++++++++++++++++++=
--
 kernel/time/posix-timers.c                         |  26 ++++--
 kernel/time/posix-timers.h                         |   3 +
 kernel/time/sleep_timeout.c                        |   4 +-
 kernel/time/time_test.c                            |  16 ++++
 kernel/time/timeconv.c                             |   6 +-
 kernel/time/timekeeping.c                          |   4 +-
 kernel/time/timer.c                                |   2 +-
 kernel/time/timer_migration.c                      |   6 +-
 net/core/pktgen.c                                  |   4 +-
 .../testing/selftests/timers/clocksource-switch.c  |  23 ++++-
 tools/testing/selftests/timers/posix_timers.c      |   7 +-
 tools/testing/selftests/timers/raw_skew.c          |  12 +++
 26 files changed, 227 insertions(+), 112 deletions(-)

diff --git a/fs/aio.c b/fs/aio.c
index d78acc69f487..8130d9e637ea 100644
--- a/fs/aio.c
+++ b/fs/aio.c
@@ -1402,7 +1402,7 @@ static long read_events(struct kioctx *ctx, long min_nr=
, long nr,
 		w.min_nr =3D min_nr - ret;
=20
 		ret2 =3D prepare_to_wait_event(&ctx->wait, &w.w, TASK_INTERRUPTIBLE);
-		if (!ret2 && !t.task)
+		if (!ret2 && !hrtimer_sleeper_task_get(&t))
 			ret2 =3D -ETIME;
=20
 		if (aio_read_events(ctx, min_nr, nr, event, &ret) || ret2)
diff --git a/fs/exec.c b/fs/exec.c
index 819643408e6d..1fc567155f34 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1115,17 +1115,6 @@ static struct file *bprm_identity_file(const struct li=
nux_binprm *bprm)
 	return bprm->file;
 }
=20
-static void posixtimer_exec(struct task_struct *me)
-{
-#ifdef CONFIG_POSIX_TIMERS
-	spin_lock_irq(&me->sighand->siglock);
-	posix_cpu_timers_exit(me);
-	spin_unlock_irq(&me->sighand->siglock);
-	exit_itimers(me);
-	flush_itimer_signals();
-#endif
-}
-
 /*
  * Calling this is the point of no return. None of the failures will be
  * seen by userspace since either the process is already taking a fatal
@@ -1171,7 +1160,7 @@ int begin_new_exec(struct linux_binprm * bprm)
 	 * timer would not remove an enqueued timer because the TID lookup
 	 * of the old TID fails.
 	 */
-	posixtimer_exec(me);
+	posixtimer_exec();
=20
 	/* see the comment in check_unsafe_exec() */
 	current->fs->in_exec =3D 0;
diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 29072d89e5cb..cad8482337cb 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -72,7 +72,7 @@ enum hrtimer_mode {
  */
 struct hrtimer_sleeper {
 	struct hrtimer timer;
-	struct task_struct *task;
+	struct task_struct *__private task;
 };
=20
 static inline void hrtimer_set_expires(struct hrtimer *timer, ktime_t time)
@@ -320,6 +320,14 @@ extern int schedule_hrtimeout_range_clock(ktime_t *expir=
es,
 					  const enum hrtimer_mode mode,
 					  clockid_t clock_id);
 extern int schedule_hrtimeout(ktime_t *expires, const enum hrtimer_mode mode=
);
+static inline struct task_struct *hrtimer_sleeper_task_get(struct hrtimer_sl=
eeper *sl)
+{
+	return READ_ONCE(ACCESS_PRIVATE(sl, task));
+}
+static inline void hrtimer_sleeper_task_set(struct hrtimer_sleeper *sl, stru=
ct task_struct *t)
+{
+	WRITE_ONCE(ACCESS_PRIVATE(sl, task), t);
+}
=20
 /* Soft interrupt function to run the hrtimer queues: */
 extern void hrtimer_run_queues(void);
diff --git a/include/linux/list.h b/include/linux/list.h
index 77fb62f79928..e3753695e76c 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -1172,7 +1172,7 @@ static inline void hlist_move_list(struct hlist_head *o=
ld,
 {
 	new->first =3D old->first;
 	if (new->first)
-		new->first->pprev =3D &new->first;
+		WRITE_ONCE(new->first->pprev, &new->first);
 	old->first =3D NULL;
 }
=20
@@ -1189,10 +1189,10 @@ static inline void hlist_splice_init(struct hlist_hea=
d *from,
 				     struct hlist_head *to)
 {
 	if (to->first)
-		to->first->pprev =3D &last->next;
+		WRITE_ONCE(to->first->pprev, &last->next);
 	last->next =3D to->first;
 	to->first =3D from->first;
-	from->first->pprev =3D &to->first;
+	WRITE_ONCE(from->first->pprev, &to->first);
 	from->first =3D NULL;
 }
=20
diff --git a/include/linux/posix-timers.h b/include/linux/posix-timers.h
index 9a1a0c61361c..00767acbc111 100644
--- a/include/linux/posix-timers.h
+++ b/include/linux/posix-timers.h
@@ -66,38 +66,6 @@ struct cpu_timer {
 	struct task_struct __rcu	*handling;
 };
=20
-static inline bool cpu_timer_enqueue(struct timerqueue_head *head,
-				     struct cpu_timer *ctmr)
-{
-	ctmr->head =3D head;
-	return timerqueue_add(head, &ctmr->node);
-}
-
-static inline bool cpu_timer_queued(struct cpu_timer *ctmr)
-{
-	return !!ctmr->head;
-}
-
-static inline bool cpu_timer_dequeue(struct cpu_timer *ctmr)
-{
-	if (cpu_timer_queued(ctmr)) {
-		timerqueue_del(ctmr->head, &ctmr->node);
-		ctmr->head =3D NULL;
-		return true;
-	}
-	return false;
-}
-
-static inline u64 cpu_timer_getexpires(struct cpu_timer *ctmr)
-{
-	return ctmr->node.expires;
-}
-
-static inline void cpu_timer_setexpires(struct cpu_timer *ctmr, u64 exp)
-{
-	ctmr->node.expires =3D exp;
-}
-
 static inline void posix_cputimers_init(struct posix_cputimers *pct)
 {
 	memset(pct, 0, sizeof(*pct));
@@ -224,14 +192,15 @@ struct k_itimer {
 } ____cacheline_aligned_in_smp;
=20
 void run_posix_cpu_timers(void);
-void posix_cpu_timers_exit(struct task_struct *task);
-void posix_cpu_timers_exit_group(struct task_struct *task);
 void set_process_cpu_timer(struct task_struct *task, unsigned int clock_idx,
 			   u64 *newval, u64 *oldval);
=20
 int update_rlimit_cpu(struct task_struct *task, unsigned long rlim_new);
=20
 #ifdef CONFIG_POSIX_TIMERS
+void posixtimer_exec(void);
+void posixtimer_exit(bool group_dead);
+
 static inline void posixtimer_putref(struct k_itimer *tmr)
 {
 	if (rcuref_put(&tmr->rcuref))
@@ -259,6 +228,8 @@ static inline bool posixtimer_valid(const struct k_itimer=
 *timer)
 	return !(val & 0x1UL);
 }
 #else  /* CONFIG_POSIX_TIMERS */
+static inline void posixtimer_exec(void) { }
+static inline void posixtimer_exit(bool group_dead) { }
 static inline void posixtimer_sigqueue_getref(struct sigqueue *q) { }
 static inline void posixtimer_sigqueue_putref(struct sigqueue *q) { }
 #endif /* !CONFIG_POSIX_TIMERS */
diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index e0c1ca8c6a18..90ed5bc3c7af 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -94,7 +94,6 @@ static inline void exit_thread(struct task_struct *tsk)
 extern __noreturn void do_group_exit(int);
=20
 extern void exit_files(struct task_struct *);
-extern void exit_itimers(struct task_struct *);
=20
 extern pid_t kernel_clone(struct kernel_clone_args *kargs);
 struct task_struct *copy_process(struct pid *pid, int trace, int node,
diff --git a/include/linux/wait.h b/include/linux/wait.h
index 7e215330199c..c2af98b0074d 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -556,7 +556,7 @@ do {										\
 	}									\
 										\
 	__ret =3D ___wait_event(wq_head, condition, state, 0, 0,			\
-		if (!__t.task) {						\
+		if (!hrtimer_sleeper_task_get(&__t)) {				\
 			__ret =3D -ETIME;						\
 			break;							\
 		}								\
diff --git a/io_uring/rw.c b/io_uring/rw.c
index 432820f86251..d9b1e096f07b 100644
--- a/io_uring/rw.c
+++ b/io_uring/rw.c
@@ -1295,7 +1295,7 @@ static u64 io_hybrid_iopoll_delay(struct io_ring_ctx *c=
tx, struct io_kiocb *req)
 	set_current_state(TASK_INTERRUPTIBLE);
 	hrtimer_sleeper_start_expires(&timer, mode);
=20
-	if (timer.task)
+	if (hrtimer_sleeper_task_get(&timer))
 		io_schedule();
=20
 	hrtimer_cancel(&timer.timer);
diff --git a/kernel/exit.c b/kernel/exit.c
index 424c44a42a4d..06a1eb1fdfcd 100644
--- a/kernel/exit.c
+++ b/kernel/exit.c
@@ -167,12 +167,6 @@ static void __exit_signal(struct release_task_post *post=
, struct task_struct *ts
 					lockdep_tasklist_lock_is_held());
 	spin_lock(&sighand->siglock);
=20
-#ifdef CONFIG_POSIX_TIMERS
-	posix_cpu_timers_exit(tsk);
-	if (group_dead)
-		posix_cpu_timers_exit_group(tsk);
-#endif
-
 	if (group_dead) {
 		tty =3D sig->tty;
 		sig->tty =3D NULL;
@@ -966,13 +960,12 @@ void __noreturn do_exit(long code)
 			panic("Attempted to kill init! exitcode=3D0x%08x\n",
 				tsk->signal->group_exit_code ?: (int)code);
=20
-#ifdef CONFIG_POSIX_TIMERS
-		hrtimer_cancel(&tsk->signal->real_timer);
-		exit_itimers(tsk);
-#endif
 		if (tsk->mm)
 			setmax_mm_hiwater_rss(&tsk->signal->maxrss, tsk->mm);
 	}
+
+	posixtimer_exit(group_dead);
+
 	acct_collect(code, group_dead);
 	if (group_dead)
 		tty_audit_exit();
diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index b3f4a4bccb12..842d852302dd 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -744,7 +744,7 @@ int handle_early_requeue_pi_wakeup(struct futex_hash_buck=
et *hb,
=20
 	/* Handle spurious wakeups gracefully */
 	ret =3D -EWOULDBLOCK;
-	if (timeout && !timeout->task)
+	if (timeout && !hrtimer_sleeper_task_get(timeout))
 		ret =3D -ETIMEDOUT;
 	else if (signal_pending(current))
 		ret =3D -ERESTARTNOINTR;
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index d4483d15d30a..cf18309e5770 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -383,7 +383,7 @@ void futex_do_wait(struct futex_q *q, struct hrtimer_slee=
per *timeout)
 		 * flagged for rescheduling. Only call schedule if there
 		 * is no timeout, or if it has yet to expire.
 		 */
-		if (!timeout || timeout->task)
+		if (!timeout || hrtimer_sleeper_task_get(timeout))
 			schedule();
 	}
 	__set_current_state(TASK_RUNNING);
@@ -539,7 +539,7 @@ int futex_wait_multiple_setup(struct futex_vector *vs, in=
t count, int *woken)
 static void futex_sleep_multiple(struct futex_vector *vs, unsigned int count,
 				 struct hrtimer_sleeper *to)
 {
-	if (to && !to->task)
+	if (to && !hrtimer_sleeper_task_get(to))
 		return;
=20
 	for (; count; count--, vs++) {
@@ -590,7 +590,7 @@ int futex_wait_multiple(struct futex_vector *vs, unsigned=
 int count,
 		if (ret >=3D 0)
 			return ret;
=20
-		if (to && !to->task)
+		if (to && !hrtimer_sleeper_task_get(to))
 			return -ETIMEDOUT;
 		else if (signal_pending(current))
 			return -ERESTARTSYS;
@@ -725,7 +725,7 @@ int __futex_wait(u32 __user *uaddr, unsigned int flags, u=
32 val,
 	if (!futex_unqueue(&q))
 		return 0;
=20
-	if (to && !to->task)
+	if (to && !hrtimer_sleeper_task_get(to))
 		return -ETIMEDOUT;
=20
 	/*
diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 4728631ae719..5a9534c715b8 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -1644,7 +1644,7 @@ static int __sched rt_mutex_slowlock_block(struct rt_mu=
tex_base *lock,
 			break;
 		}
=20
-		if (timeout && !timeout->task) {
+		if (timeout && !hrtimer_sleeper_task_get(timeout)) {
 			ret =3D -ETIMEDOUT;
 			break;
 		}
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index cbf1693c86b3..17dd38a6cee7 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -780,7 +780,8 @@ static void hrtimer_switch_to_hres(void)
 		return;
 	}
 	base->hres_active =3D true;
-	hrtimer_resolution =3D HIGH_RES_NSEC;
+	if (hrtimer_resolution !=3D HIGH_RES_NSEC)
+		hrtimer_resolution =3D HIGH_RES_NSEC;
=20
 	tick_setup_sched_timer(true);
 	/* "Retrigger" the interrupt to get things going */
@@ -2003,7 +2004,7 @@ bool hrtimer_active(const struct hrtimer *timer)
 		base =3D READ_ONCE(timer->base);
 		seq =3D raw_read_seqcount_begin(&base->seq);
=20
-		if (timer->is_queued || base->running =3D=3D timer)
+		if (timer->is_queued || READ_ONCE(base->running) =3D=3D timer)
 			return true;
=20
 	} while (read_seqcount_retry(&base->seq, seq) || base !=3D READ_ONCE(timer-=
>base));
@@ -2040,7 +2041,7 @@ static void __run_hrtimer(struct hrtimer_cpu_base *cpu_=
base, struct hrtimer_cloc
 	lockdep_assert_held(&cpu_base->lock);
=20
 	debug_hrtimer_deactivate(timer);
-	base->running =3D timer;
+	WRITE_ONCE(base->running, timer);
=20
 	/*
 	 * Separate the ->running assignment from the ->is_queued assignment.
@@ -2099,7 +2100,7 @@ static void __run_hrtimer(struct hrtimer_cpu_base *cpu_=
base, struct hrtimer_cloc
 	raw_write_seqcount_barrier(&base->seq);
=20
 	WARN_ON_ONCE(base->running !=3D timer);
-	base->running =3D NULL;
+	WRITE_ONCE(base->running, NULL);
 }
=20
 static void __hrtimer_run_queues(struct hrtimer_cpu_base *cpu_base, ktime_t =
now,
@@ -2323,9 +2324,9 @@ void hrtimer_run_queues(void)
 static enum hrtimer_restart hrtimer_wakeup(struct hrtimer *timer)
 {
 	struct hrtimer_sleeper *t =3D container_of(timer, struct hrtimer_sleeper, t=
imer);
-	struct task_struct *task =3D t->task;
+	struct task_struct *task =3D hrtimer_sleeper_task_get(t);
=20
-	t->task =3D NULL;
+	hrtimer_sleeper_task_set(t, NULL);
 	if (task)
 		wake_up_process(task);
=20
@@ -2354,7 +2355,7 @@ void hrtimer_sleeper_start_expires(struct hrtimer_sleep=
er *sl, enum hrtimer_mode
=20
 	/* If already expired, clear the task pointer and set current state to runn=
ing */
 	if (!hrtimer_start_expires_user(&sl->timer, mode)) {
-		sl->task =3D NULL;
+		hrtimer_sleeper_task_set(sl, NULL);
 		__set_current_state(TASK_RUNNING);
 	}
 }
@@ -2388,7 +2389,7 @@ static void __hrtimer_setup_sleeper(struct hrtimer_slee=
per *sl, clockid_t clock_
 	}
=20
 	__hrtimer_setup(&sl->timer, hrtimer_wakeup, clock_id, mode);
-	sl->task =3D current;
+	hrtimer_sleeper_task_set(sl, current);
 }
=20
 /**
@@ -2432,17 +2433,17 @@ static int __sched do_nanosleep(struct hrtimer_sleepe=
r *t, enum hrtimer_mode mod
 		set_current_state(TASK_INTERRUPTIBLE|TASK_FREEZABLE);
 		hrtimer_sleeper_start_expires(t, mode);
=20
-		if (likely(t->task))
+		if (likely(hrtimer_sleeper_task_get(t)))
 			schedule();
=20
 		hrtimer_cancel(&t->timer);
 		mode =3D HRTIMER_MODE_ABS;
=20
-	} while (t->task && !signal_pending(current));
+	} while (hrtimer_sleeper_task_get(t) && !signal_pending(current));
=20
 	__set_current_state(TASK_RUNNING);
=20
-	if (!t->task)
+	if (!hrtimer_sleeper_task_get(t))
 		return 0;
=20
 	restart =3D &current->restart_block;
diff --git a/kernel/time/posix-cpu-timers.c b/kernel/time/posix-cpu-timers.c
index d73d31c7994f..9f90500894dc 100644
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -438,6 +438,38 @@ static void trigger_base_recalc_expires(struct k_itimer =
*timer,
 	base->nextevt =3D 0;
 }
=20
+static inline bool cpu_timer_enqueue(struct timerqueue_head *head,
+				     struct cpu_timer *ctmr)
+{
+	ctmr->head =3D head;
+	return timerqueue_add(head, &ctmr->node);
+}
+
+static inline bool cpu_timer_queued(struct cpu_timer *ctmr)
+{
+	return !!ctmr->head;
+}
+
+static inline bool cpu_timer_dequeue(struct cpu_timer *ctmr)
+{
+	if (cpu_timer_queued(ctmr)) {
+		timerqueue_del(ctmr->head, &ctmr->node);
+		ctmr->head =3D NULL;
+		return true;
+	}
+	return false;
+}
+
+static inline u64 cpu_timer_getexpires(struct cpu_timer *ctmr)
+{
+	return ctmr->node.expires;
+}
+
+static inline void cpu_timer_setexpires(struct cpu_timer *ctmr, u64 exp)
+{
+	ctmr->node.expires =3D exp;
+}
+
 /*
  * Dequeue the timer and reset the base if it was its earliest expiration.
  * It makes sure the next tick recalculates the base next expiration so we
@@ -596,6 +628,7 @@ static int posix_cpu_timer_del(struct k_itimer *timer)
 	}
=20
 	if (!ret) {
+		WARN_ON_ONCE(cpu_timer_queued(&timer->it.cpu));
 		put_pid(timer->it.cpu.pid);
 		timer->it_status =3D POSIX_TIMER_DISARMED;
 	}
@@ -628,18 +661,50 @@ static void cleanup_timers(struct posix_cputimers *pct)
 	cleanup_timerqueue(&pct->bases[CPUCLOCK_SCHED].tqhead);
 }
=20
+static inline void posix_cpu_timers_exit_work(void);
+
 /*
- * These are both called with the siglock held, when the current thread
- * is being reaped.  When the final (leader) thread in the group is reaped,
- * posix_cpu_timers_exit_group will be called after posix_cpu_timers_exit.
+ * Invoked from posixtimer_exit_task() after PF_EXITING was set in tsk::flag=
s or
+ * from posixtimer_exec_cleanup().
  */
-void posix_cpu_timers_exit(struct task_struct *tsk)
+void posix_cpu_timers_exit_task(void)
 {
-	cleanup_timers(&tsk->posix_cputimers);
+	posix_cpu_timers_exit_work();
+
+	guard(spinlock_irq)(&current->sighand->siglock);
+	cleanup_timers(&current->posix_cputimers);
 }
-void posix_cpu_timers_exit_group(struct task_struct *tsk)
+
+/*
+ * Invoked from posixtimer_exit_group() after PF_EXITING was set in tsk::fla=
gs.
+ */
+void posix_cpu_timers_exit_group(void)
 {
-	cleanup_timers(&tsk->signal->posix_cputimers);
+	posix_cpu_timers_exit_task();
+
+	guard(spinlock_irq)(&current->sighand->siglock);
+	cleanup_timers(&current->signal->posix_cputimers);
+}
+
+/*
+ * This function validates that POSIX CPU timers can be safely enqueued on t=
he
+ * target task.
+ *
+ * Enqueue is allowed when PF_EXITING is not set. If set then it is only all=
owed
+ * for process shared timers (type =3D PIDTYPE_TGID) as long as tsk::signal:=
:flags
+ * does not have SIGNAL_GROUP_EXIT set. PIDTYPE_PID targets are not allowed =
at
+ * all when the task has PF_EXITING set.
+ *
+ * This guarantees that after the POSIX timer cleanup in posixtimer_exit() no
+ * POSIX CPU timers are queued on the task or in case of a group exit on the
+ * process.
+ */
+static inline bool task_can_enqueue_timer(struct task_struct *tsk, enum pid_=
type type)
+{
+	if (likely(!(tsk->flags & PF_EXITING)))
+		return true;
+
+	return type =3D=3D PIDTYPE_TGID && !(tsk->signal->flags & SIGNAL_GROUP_EXIT=
);
 }
=20
 /*
@@ -652,7 +717,13 @@ static void arm_timer(struct k_itimer *timer, struct tas=
k_struct *p)
 	struct cpu_timer *ctmr =3D &timer->it.cpu;
 	u64 newexp =3D cpu_timer_getexpires(ctmr);
=20
+	lockdep_assert_held(&p->sighand->siglock);
+
 	timer->it_status =3D POSIX_TIMER_ARMED;
+
+	if (unlikely(!task_can_enqueue_timer(p, clock_pid_type(timer->it_clock))))
+		return;
+
 	if (!cpu_timer_enqueue(&base->tqhead, ctmr))
 		return;
=20
@@ -1197,6 +1268,20 @@ static void posix_cpu_timers_work(struct callback_head=
 *work)
 	mutex_unlock(&cw->mutex);
 }
=20
+static inline void posix_cpu_timers_exit_work(void)
+{
+	/* Canceling the work is only valid for exit() but not for exec() */
+	if (!(current->flags & PF_EXITING))
+		return;
+	/*
+	 * current->flags has PF_EXITING set so this can be done lockless and
+	 * with interrupts enabled as PF_EXITING prevents the interrupt from
+	 * scheduling the work.
+	 */
+	if (current->posix_cputimers_work.scheduled)
+		task_work_cancel(current, &current->posix_cputimers_work.work);
+}
+
 /*
  * Invoked from the posix-timer core when a cancel operation failed because
  * the timer is marked firing. The caller holds rcu_read_lock(), which
@@ -1327,6 +1412,8 @@ static inline void __run_posix_cpu_timers(struct task_s=
truct *tsk)
 	lockdep_posixtimer_exit();
 }
=20
+static inline void posix_cpu_timers_exit_work(void) { }
+
 static void posix_cpu_timer_wait_running(struct k_itimer *timr)
 {
 	cpu_relax();
@@ -1473,7 +1560,7 @@ void run_posix_cpu_timers(void)
 	 * posix_cpu_timer_del() may fail to lock_task_sighand(tsk) and
 	 * miss timer->it.cpu.firing !=3D 0.
 	 */
-	if (tsk->exit_state)
+	if (tsk->flags & PF_EXITING)
 		return;
=20
 	/*
diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 436ba794cc0b..188dbedbffca 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -1077,13 +1077,9 @@ SYSCALL_DEFINE1(timer_delete, timer_t, timer_id)
 	return 0;
 }
=20
-/*
- * Invoked from do_exit() when the last thread of a thread group exits.
- * At that point no other task can access the timers of the dying
- * task anymore.
- */
-void exit_itimers(struct task_struct *tsk)
+static void posixtimer_delete_timers(void)
 {
+	struct task_struct *tsk =3D current;
 	struct hlist_head timers;
 	struct hlist_node *next;
 	struct k_itimer *timer;
@@ -1120,6 +1116,24 @@ void exit_itimers(struct task_struct *tsk)
 	}
 }
=20
+void posixtimer_exit(bool group_dead)
+{
+	if (group_dead) {
+		hrtimer_cancel(&current->signal->real_timer);
+		posix_cpu_timers_exit_group();
+		posixtimer_delete_timers();
+	} else {
+		posix_cpu_timers_exit_task();
+	}
+}
+
+void posixtimer_exec(void)
+{
+	posix_cpu_timers_exit_task();
+	posixtimer_delete_timers();
+	flush_itimer_signals();
+}
+
 SYSCALL_DEFINE2(clock_settime, const clockid_t, which_clock,
 		const struct __kernel_timespec __user *, tp)
 {
diff --git a/kernel/time/posix-timers.h b/kernel/time/posix-timers.h
index 4ea9611dd716..79fd7ea71046 100644
--- a/kernel/time/posix-timers.h
+++ b/kernel/time/posix-timers.h
@@ -51,3 +51,6 @@ int common_timer_set(struct k_itimer *timr, int flags,
 		     struct itimerspec64 *old_setting);
 void posix_timer_set_common(struct k_itimer *timer, struct itimerspec64 *new=
_setting);
 int common_timer_del(struct k_itimer *timer);
+
+void posix_cpu_timers_exit_task(void);
+void posix_cpu_timers_exit_group(void);
diff --git a/kernel/time/sleep_timeout.c b/kernel/time/sleep_timeout.c
index 3c90574bd904..ad8c415851ae 100644
--- a/kernel/time/sleep_timeout.c
+++ b/kernel/time/sleep_timeout.c
@@ -212,7 +212,7 @@ int __sched schedule_hrtimeout_range_clock(ktime_t *expir=
es, u64 delta,
 	hrtimer_set_expires_range_ns(&t.timer, *expires, delta);
 	hrtimer_sleeper_start_expires(&t, mode);
=20
-	if (likely(t.task))
+	if (likely(hrtimer_sleeper_task_get(&t)))
 		schedule();
=20
 	hrtimer_cancel(&t.timer);
@@ -220,7 +220,7 @@ int __sched schedule_hrtimeout_range_clock(ktime_t *expir=
es, u64 delta,
=20
 	__set_current_state(TASK_RUNNING);
=20
-	return !t.task ? 0 : -EINTR;
+	return !hrtimer_sleeper_task_get(&t) ? 0 : -EINTR;
 }
 EXPORT_SYMBOL_GPL(schedule_hrtimeout_range_clock);
=20
diff --git a/kernel/time/time_test.c b/kernel/time/time_test.c
index 1b99180da288..8b718767b3ba 100644
--- a/kernel/time/time_test.c
+++ b/kernel/time/time_test.c
@@ -87,8 +87,24 @@ static void time64_to_tm_test_date_range(struct kunit *tes=
t)
 	}
 }
=20
+static void time64_to_tm_test_wide_day_count(struct kunit *test)
+{
+	/* 2^31 days: the first count that does not fit in a 32-bit long. */
+	time64_t timestamp =3D (1LL << 31) * 86400;
+	struct tm result;
+
+	time64_to_tm(timestamp, 0, &result);
+
+	KUNIT_EXPECT_EQ(test, result.tm_year, 5879680);
+	KUNIT_EXPECT_EQ(test, result.tm_mon, 6);
+	KUNIT_EXPECT_EQ(test, result.tm_mday, 12);
+	KUNIT_EXPECT_EQ(test, result.tm_yday, 193);
+	KUNIT_EXPECT_EQ(test, result.tm_wday, 6);
+}
+
 static struct kunit_case time_test_cases[] =3D {
 	KUNIT_CASE_SLOW(time64_to_tm_test_date_range),
+	KUNIT_CASE(time64_to_tm_test_wide_day_count),
 	{}
 };
=20
diff --git a/kernel/time/timeconv.c b/kernel/time/timeconv.c
index 59b922c826e7..aed3af950fa0 100644
--- a/kernel/time/timeconv.c
+++ b/kernel/time/timeconv.c
@@ -49,8 +49,9 @@ void time64_to_tm(time64_t totalsecs, int offset, struct tm=
 *result)
 	u32 u32tmp, day_of_century, year_of_century, day_of_year, month, day;
 	u64 u64tmp, udays, century, year;
 	bool is_Jan_or_Feb, is_leap_year;
-	long days, rem;
 	int remainder;
+	long rem;
+	s64 days;
=20
 	days =3D div_s64_rem(totalsecs, SECS_PER_DAY, &remainder);
 	rem =3D remainder;
@@ -70,7 +71,8 @@ void time64_to_tm(time64_t totalsecs, int offset, struct tm=
 *result)
 	result->tm_sec =3D rem % 60;
=20
 	/* January 1, 1970 was a Thursday. */
-	result->tm_wday =3D (4 + days) % 7;
+	div_s64_rem(days + 4, 7, &remainder);
+	result->tm_wday =3D remainder;
 	if (result->tm_wday < 0)
 		result->tm_wday +=3D 7;
=20
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index ea2e6e55f37b..d54c4d303db6 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -861,8 +861,10 @@ static void timekeeping_update_from_shadow(struct tk_dat=
a *tkd, unsigned int act
 	 *
 	 * Write xtime_sec first so that even if the memcpy() tears the store
 	 * data integrity is provided for ktime_get_real_seconds().
+	 * The same goes for ktime_sec and ktime_get_seconds().
 	 */
 	WRITE_ONCE(tkd->timekeeper.xtime_sec, tk->xtime_sec);
+	WRITE_ONCE(tkd->timekeeper.ktime_sec, tk->ktime_sec);
 	memcpy(&tkd->timekeeper, tk, sizeof(*tk));
 	write_seqcount_end(&tkd->seq);
 }
@@ -1169,7 +1171,7 @@ time64_t ktime_get_seconds(void)
 	struct timekeeper *tk =3D &tk_core.timekeeper;
=20
 	WARN_ON(timekeeping_suspended);
-	return tk->ktime_sec;
+	return READ_ONCE(tk->ktime_sec);
 }
 EXPORT_SYMBOL_GPL(ktime_get_seconds);
=20
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index ae9abf14688e..42afdcb229d8 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -890,7 +890,7 @@ static inline void detach_timer(struct timer_list *timer,=
 bool clear_pending)
=20
 	__hlist_del(entry);
 	if (clear_pending)
-		entry->pprev =3D NULL;
+		WRITE_ONCE(entry->pprev, NULL);
 	entry->next =3D LIST_POISON2;
 }
=20
diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 059d43355e65..f920e73fff51 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -715,7 +715,7 @@ static void __tmigr_cpu_activate(struct tmigr_cpu *tmc)
=20
 	trace_tmigr_cpu_active(tmc);
=20
-	tmc->cpuevt.ignore =3D true;
+	WRITE_ONCE(tmc->cpuevt.ignore, true);
 	WRITE_ONCE(tmc->wakeup, KTIME_MAX);
=20
 	walk_groups(&tmigr_active_up, &data, tmc);
@@ -1258,7 +1258,7 @@ u64 tmigr_cpu_new_timer(u64 nextexp)
 	ret =3D READ_ONCE(tmc->wakeup);
 	if (nextexp !=3D KTIME_MAX) {
 		if (nextexp !=3D tmc->cpuevt.nextevt.expires ||
-		    tmc->cpuevt.ignore) {
+		    READ_ONCE(tmc->cpuevt.ignore)) {
 			ret =3D tmigr_new_timer(tmc, nextexp);
 			/*
 			 * Make sure the reevaluation of timers in idle path
@@ -1362,7 +1362,7 @@ static u64 __tmigr_cpu_deactivate(struct tmigr_cpu *tmc=
, u64 nextexp)
 	 * or CPU goes offline.
 	 */
 	if (nextexp !=3D KTIME_MAX)
-		tmc->cpuevt.ignore =3D false;
+		WRITE_ONCE(tmc->cpuevt.ignore, false);
=20
 	walk_groups(&tmigr_inactive_up, &data, tmc);
 	return data.firstexp;
diff --git a/net/core/pktgen.c b/net/core/pktgen.c
index 7f81aed46672..784d8398fb7a 100644
--- a/net/core/pktgen.c
+++ b/net/core/pktgen.c
@@ -2346,11 +2346,11 @@ static void spin(struct pktgen_dev *pkt_dev, ktime_t =
spin_until)
 			set_current_state(TASK_INTERRUPTIBLE);
 			hrtimer_sleeper_start_expires(&t, HRTIMER_MODE_ABS);
=20
-			if (likely(t.task))
+			if (likely(hrtimer_sleeper_task_get(&t)))
 				schedule();
=20
 			hrtimer_cancel(&t.timer);
-		} while (t.task && pkt_dev->running && !signal_pending(current));
+		} while (hrtimer_sleeper_task_get(&t) && pkt_dev->running && !signal_pendi=
ng(current));
 		__set_current_state(TASK_RUNNING);
 		end_time =3D ktime_get();
 	}
diff --git a/tools/testing/selftests/timers/clocksource-switch.c b/tools/test=
ing/selftests/timers/clocksource-switch.c
index db62a764c29e..2e86f56d953e 100644
--- a/tools/testing/selftests/timers/clocksource-switch.c
+++ b/tools/testing/selftests/timers/clocksource-switch.c
@@ -40,16 +40,23 @@
 int get_clocksources(char list[][30])
 {
 	int fd, i;
-	size_t size;
+	ssize_t size;
 	char buf[512];
 	char *head, *tmp;
=20
 	fd =3D open("/sys/devices/system/clocksource/clocksource0/available_clockso=
urce", O_RDONLY);
+	if (fd < 0)
+		return 0;
=20
-	size =3D read(fd, buf, 512);
+	size =3D read(fd, buf, sizeof(buf) - 1);
=20
 	close(fd);
=20
+	if (size <=3D 0)
+		return 0;
+
+	buf[size] =3D '\0';
+
 	for (i =3D 0; i < 10; i++)
 		list[i][0] =3D '\0';
=20
@@ -74,11 +81,21 @@ int get_clocksources(char list[][30])
=20
 int get_cur_clocksource(char *buf, size_t size)
 {
+	ssize_t len;
 	int fd;
=20
 	fd =3D open("/sys/devices/system/clocksource/clocksource0/current_clocksour=
ce", O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	len =3D read(fd, buf, size - 1);
+
+	close(fd);
+
+	if (len <=3D 0)
+		return -1;
=20
-	size =3D read(fd, buf, size);
+	buf[len] =3D '\0';
=20
 	return 0;
 }
diff --git a/tools/testing/selftests/timers/posix_timers.c b/tools/testing/se=
lftests/timers/posix_timers.c
index a92d4b957747..52b7289e1450 100644
--- a/tools/testing/selftests/timers/posix_timers.c
+++ b/tools/testing/selftests/timers/posix_timers.c
@@ -113,9 +113,10 @@ static void check_itimer(int which, const char *name)
=20
 	done =3D 0;
=20
-	if (which =3D=3D ITIMER_VIRTUAL)
+	if (which =3D=3D ITIMER_VIRTUAL) {
+		clock_id =3D CLOCK_THREAD_CPUTIME_ID;
 		signal(SIGVTALRM, sig_handler);
-	else if (which =3D=3D ITIMER_PROF) {
+	} else if (which =3D=3D ITIMER_PROF) {
 		clock_id =3D CLOCK_THREAD_CPUTIME_ID;
 		signal(SIGPROF, sig_handler);
 	}
@@ -148,7 +149,7 @@ static void check_timer_create(int which)
 	struct itimerspec val =3D {
 		.it_value.tv_sec =3D DELAY,
 	};
-	int clock_id =3D CLOCK_REALTIME;
+	int clock_id =3D which;
 	timer_t id;
=20
 	done =3D 0;
diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selfte=
sts/timers/raw_skew.c
index 0c87a8fb0d7f..dfca3e2d50d2 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -91,6 +91,7 @@ int main(int argc, char **argv)
 {
 	struct timespec mon, raw, start, end;
 	long long delta1, delta2, interval, eppm, ppm;
+	long tick_nom;
 	struct timex tx1, tx2;
=20
 	setbuf(stdout, NULL);
@@ -129,6 +130,17 @@ int main(int argc, char **argv)
 	/* Avg the two actual freq samples adjtimex gave us */
 	ppm =3D (long long)(tx1.freq + tx2.freq) * 1000 / 2;
 	ppm =3D shift_right(ppm, 16);
+
+	/*
+	 * The tick value holds the coarse part of the adjustment, a
+	 * microsecond of the tick length per unit, and time sync daemons
+	 * do put part of their correction there. What it is worth has to
+	 * be counted in as well, or a clock disciplined through it looks
+	 * off by a hundred ppm a unit against what the two clocks show.
+	 */
+	tick_nom =3D USEC_PER_SEC / sysconf(_SC_CLK_TCK);
+	ppm +=3D (long long)(tx1.tick + tx2.tick - 2 * tick_nom) *
+	       (USEC_PER_SEC / tick_nom) * 1000 / 2;
 	printf(" %lld.%i(act)", ppm/1000, abs((int)(ppm%1000)));
=20
 	if (llabs(eppm - ppm) > 1000) {

