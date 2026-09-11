Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910AF46D570
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117752; cv=none; b=Hs4lvf4PXHbxfasMyKLixc9a8UGTOjyW5IURu1Fvd3hHsQZUb7/W7X5dSKaLDwXN82HzQ+6lstkwOVM3jy1Ayy7KxEoBRLnCM7tq0mc4+EUHqI388NFEi2OqAWqtvy7GNPg9Au13uy46B6FfTPZH4CI97911yckJZqiWj6/rLUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117752; c=relaxed/simple;
	bh=oQQ0wd/khSFeXakHBqvVt5xNvLncNbN9tGdiy85Pxsk=;
	h=Date:Message-ID:From:To:Cc:Subject; b=CU1w2UJp33YQ3dfhEmbABXDrNJ+JC6cm6n7cHiQfAEJyId6HRRBnPSv65BFXxSJdDUmuceCHMIxJodTWgT8f+rGhNGbmwTl5vUcRhLCWmSjp+ytz+X1NSGWM6hTlyflACJb0batZaCGMXvX2sswBY0eIHC2ugvbnEdUBWULAeWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/Hku76S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/Hku76S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAA71F000FF;
	Fri, 11 Sep 2026 09:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789117751;
	bh=8Rjv9I7Z/aDDn5nImhQg2uoxZPF6VfsqdELl88y5KEw=;
	h=Date:From:To:Cc:Subject;
	b=U/Hku76S4AeEJBmF6U3NOcb6cW4ZqqWx9PKVxpaL1fAwJjX16LD5V1AEJbZ2maaLW
	 a4XVddXs0x3n0rv/bROTo6/xr/sn1fS97g7xxTSCPVtugxYgONC8lULgykS4TLrdUM
	 rTd8IKwbcftKKveAXVG9cyrv3nLG7X8rTi1EjbmcuaMmBJZUbO4Uqloa+f1s9bahsL
	 Fsn5NOdx/9ZOVXGbajz0yKqCOppqyqCyD9D5XLHXpqFfTXLkkwkJAlixXnvZdkyG0h
	 pSP5j4TPJx30viNdFOsuaxWiooKAPRgYZM9S0swjPTpZLP3FqD6tSZRMrWPtyTi8Ck
	 nfzjrYLp6GehA==
Date: Fri, 11 Sep 2026 11:09:07 +0200
Message-ID: <20260911090341.949101445@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Christian Brauner <brauner@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 John Stultz <jstultz@google.com>,
 Ingo Molnar <mingo@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Alan Stern <stern@rowland.harvard.edu>
Subject: [patch V3 0/8] exec/exit: POSIX timer related bugfixes and related
 cleanups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

This is a follow up to V2 which can be found here:

  https://lore.kernel.org/20260905181551.738186850@kernel.org

Recent findings from Hyunwoo unearthed two bugs in handling POSIX timers on
exec().

The relevant patches, reports and discussions can be found here:

   https://patch.msgid.link/aok1rdkBgZsynHZB@v4bel
   https://patch.msgid.link/ao7Q8miiuLAPVnWv@v4bel

TLDR:

Both problems are related to non-leader exec(). POSIX CPU timers which are
targeted at tasks hold a pid reference of the target task, which is used to
look up the task in the related POSIX timer operations.

The non-leader exec() switches the TID of the old and the new leader, which
obviously invalidates these references for pid_task(PIDTYPE_PID) lookups.

This causes UAFs due to the resulting list corruptions or premature freeing
without removing the underlying POSIX CPU timers from the involved tasks.

The first issue which corrupts the signal pending list is solved by:

    - Preventing the queueing of per task signals on a task which has
      PF_EXITING set.

    - Protecting the unlocked setting of PF_EXITING in exit_signals() with
      sighand lock.

    - Flushing all per task signals right in exit_signals()

The second issue which keeps the POSIX CPU timers queued on the new leader
is solved by:

    - Moving the exec related POSIX timer cleanup right after de_thread()
      which ensures that the timers queued in new_leader::posix_cputimers
      are removed before the underlying POSIX timers are deleted.

After looking deeper at the exit() handling it turned out that the POSIX
timer cleanups can be done early in do_exit() instead of delaying them
until release_task().

The reason for this late cleanup is that POSIX CPU timers can be created,
rearmed and deleted as long as a task is visible, i.e. the pid is hashed
and sighand is not NULL. This allows to retrieve information from the timer
up to the point where the task is gone for real and that can't be changed
easily as that'd be a user visible change.

But once PF_EXITING is set on a task the task does not longer expire POSIX
CPU timers. So it makes no sense that the timers stay queued in
task::posix_cputimers after that point.

The only thing which needs to be prevented is that timers are requeued on
task::posix_cputimers once PF_EXITING is set or requeued on
signal::posix_cputimers when PF_EXITING is set and signal::live is zero,
which indicates that the thread group is dead.

With that solved the timers can be dequeued from task::posix_cputimer
pending when a task exits and from signal::posix_cputimer pending once the
threadgroup reaches the dead state, i.e. signal::live goes to zero in
do_exit().

The changes vs. V2:

    - Document in the change log that the non-leader exec() case is
      properly ordered against the lockless pending list flush. - Frederic,
      Peter, Alan
    
    - Add a comment to document when a lockless flush is safe

    - Cancel pending POSIX CPU timer work only for exit(), not for exec() -
      Oleg

    - Pick up Reviewed-by tags where appropriate

The delta patch against V2 is below.

The series applies on 7.3-rc1 and is avalaible from git:

    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git posix-timers

Thanks,

	tglx
---
diff --git a/kernel/signal.c b/kernel/signal.c
index f93d8f77ec1a..7081819eddd1 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -457,6 +457,20 @@ static void __sigqueue_free(struct sigqueue *q)
        kmem_cache_free(sigqueue_cachep, q);
 }
 
+/*
+ * flush_sigqueue_list() can only be invoked without holding sighand::siglock in
+ * the following cases:
+ *
+ *  1) When flushing task::pending _after_ setting task::flags PF_EXITING
+ *
+ *     All functions which try to send a signal to @task will observe PF_EXITING
+ *     and drop the signal.
+ *
+ *  2) When flushing task::signal::shared_pending _after_ the last task in a
+ *     thread group was unhashed and task::sighand is NULL.
+ *
+ *     Nothing can queue a signal anymore because sighand is NULL.
+ */
 static void flush_sigqueue_list(struct list_head *head)
 {
        struct sigqueue *q, *tmp;
diff --git a/kernel/time/posix-cpu-timers.c b/kernel/time/posix-cpu-timers.c
index 53e47c1b56c2..9f90500894dc 100644
--- a/kernel/time/posix-cpu-timers.c
+++ b/kernel/time/posix-cpu-timers.c
@@ -1270,6 +1270,9 @@ static void posix_cpu_timers_work(struct callback_head *work)
 
 static inline void posix_cpu_timers_exit_work(void)
 {
+       /* Canceling the work is only valid for exit() but not for exec() */
+       if (!(current->flags & PF_EXITING))
+               return;
        /*
         * current->flags has PF_EXITING set so this can be done lockless and
         * with interrupts enabled as PF_EXITING prevents the interrupt from
