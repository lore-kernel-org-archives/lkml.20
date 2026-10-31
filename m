Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793460240;
	b=mG9rtVBF7RDzohHCZxdG7wypZUTZAOcy8awqgJHbtAMPCuMoUgRt70xVaBOr013CRG5E
	 hNLyomARVRj5DlQD0erZ1/SoTCJPeO0NK26TbC6Jl19+2vCImB4iD1nIXZNF7XVZxYxbW
	 uJxPdAR3ZsJjLXaCiJJ7ls4xFDWabdHk5nU9aMmf0MQkFqu8ea6VzM10egr2UbKtffK3D
	 PQmberriyGr2tVz1FlxphyxMRJLHtrcNOrDm05fWdPXSm1IT+FAhKgClMbLsWzr8xJHJ3
	 g7VNBEjKcP0/8EioDFeKgyQcu1CRwSyVGmRxm01LmFWzqJ3Aafw4PYNUSR+VHQ2KlsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460240;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Uq8PJDRJ/C5cL0960ITr2//lgvF42yVoERTTOANvsoA=;
	b=FNGXUKnKINdA0hOujiUVWFBwBDyijhANQ6bfE2vRNps7MmCGS5nG4iJ4zMvc0xfAv66Y
	 on3Zyi/hggEY2WrpKI0TbuATejFs+TWMyhuS6sJmnMmj9R7Q4o9H8tsLcDrU7s9hqFK+8
	 TWA+MausxJ/drxF3dzybnIxvi02oOJSXTu0kCtbGk3AEY+0OWW/Fh20U+bogShWFr+AHW
	 mT3TknF4P4jKYgrhktt0rDsqhoGeiFJfguQW29utA2ZRJ/j4epTvr6o0AQ/7PAfhsUc99
	 wNkm/dU/VxTfQsLvsSL71K6c0paLeE6z7I2OoeTFw0WFOp2PWop/jWNSqV8UdN52LbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=NkbqjSKZ;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=7qelJyxn;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D212606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D212606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=NkbqjSKZ;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=7qelJyxn
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793460231; bh=Uq8PJDRJ/C5cL0960ITr2//
	lgvF42yVoERTTOANvsoA=; b=NkbqjSKZdPuYjhmBJCxjU2qFX1Yiwgw3/8UEeiNwg9+N4nYZtC
	e36JSo5nW0MaIBp6zwuOUELjAuQ4iPfdbaQjzoDJAOyhlvf1SOwcDUOpvNdtivg7j43sjvHANPF
	WHbI6ATCGv+sSB50AQqFLQUC20jyoHSRC0Yz9j1PgFe/vmtHlw8zq3xaAh+Bb4oS5mlgpOqfktt
	u0IyI2I8nqUFWp7ncJNOF1Ne3fWOWjmND1YzNhWqusmPZvWQe1b5zoYgVBxFw/4VgJgtcNxX5d4
	4W+fCtlyodVPACLuiGNEhDvvYpNW5iQl6ees2nXnKdpkNjjwfbcmCHrBIE960nK5pIA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793460231; bh=Uq8PJDRJ/C5cL0960ITr2//
	lgvF42yVoERTTOANvsoA=; b=7qelJyxnz9o3ve6Ed0Tae/h+xtyFgOootFo/W2kEik85ecAcJT
	JJ++CHcLhJywXk8o3DlDuOvtXMTwG7GtjeDg==;
Date: Sat, 31 Oct 2026 15:23:51 +0000
From: Bradley Morgan <brads@mainlining.org>
To: pocj8ur4in@gmail.com
CC: akpm@linux-foundation.org, bsingharora@gmail.com,
 linux-kernel@vger.kernel.org, oleg@redhat.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_taskstats=3A_Avoid_counting_?=
 =?US-ASCII?Q?an_exiting_thread_twice_in_TGID_queries?=
In-Reply-To: <20261031052451.78846-1-pocj8ur4in@gmail.com>
Message-ID: <A3366857-133B-49AE-9164-711C18EAC814@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 31 October 2026 05:24:51 GMT, "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
wrote:
>fill_tgid_exit() adds a thread's contribution to signal->stats before
>exit_notify() sets exit_state. A TGID query in that interval copies the
>cached contribution, then scans the same thread because exit_state is
>still clear. The thread's contribution is counted twice.
>
>Mark a task when its contribution reaches the cache, under the same
>siglock used by the TGID query. Exclude marked tasks from the live scan.
>Leave a task eligible for the scan if no cache exists, and clear the
>marker when a new task is copied during fork.

This part of the changelog would need to go, see below.

>
>Fixes: ad4ecbcba728 ("[PATCH] delay accounting taskstats interface send tgid once")

Thx, Oleg already suggested this kinda thing

Link: https://lore.kernel.org/all/asaKCo5lwB3nzWNM@redhat.com/ would be good. Or closes?

>Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
>---
>In an arm64 QEMU guest, holding the interval after cache accounting but
>before exit_state changed made a 100 ms worker appear twice in a TGID CPU
>query. The baseline reported 208000 us for 8000 us of the querying thread
>plus 100000 us of the worker; the change reported 112000 us for 12000 us
>plus 100000 us. Natural race frequency and other architectures were not
>measured; KASAN and KCSAN were not enabled.
>
> include/linux/sched.h | 5 +++++
> kernel/fork.c         | 3 +++
> kernel/taskstats.c    | 7 ++++---
> 3 files changed, 12 insertions(+), 3 deletions(-)
>
>diff --git a/include/linux/sched.h b/include/linux/sched.h
>index d35ae49a991f..359ee982323c 100644
>--- a/include/linux/sched.h
>+++ b/include/linux/sched.h
>@@ -1457,6 +1457,11 @@ struct task_struct {
> 	struct task_delay_info		*delays;
> #endif
> 
>+#ifdef CONFIG_TASKSTATS
>+	/* Protected by sighand->siglock. */
>+	bool				taskstats_tgid_accounted;
>+#endif
>+
> #ifdef CONFIG_FAULT_INJECTION
> 	int				make_it_fail;
> 	unsigned int			fail_nth;
>diff --git a/kernel/fork.c b/kernel/fork.c
>index 33760ece3bb3..76d9abcc5ca8 100644
>--- a/kernel/fork.c
>+++ b/kernel/fork.c
>@@ -2202,6 +2202,9 @@ __latent_entropy struct task_struct *copy_process(
> 		goto bad_fork_cleanup_count;
> 
> 	delayacct_tsk_init(p);	/* Must remain after dup_task_struct() */
>+#ifdef CONFIG_TASKSTATS
>+	p->taskstats_tgid_accounted = false;
>+#endif

Id like to pray that this is dead, and I'm not just being a idiot.

The flag is set in fill_tgid_exit() and the task that already is past
taskstats_exit() in do_exit, it can't call fork() again, dup_task_struct()
copies from current, so I'd reckon that this is useless.

> 	p->flags &= ~(PF_SUPERPRIV | PF_WQ_WORKER | PF_IDLE | PF_NO_SETAFFINITY);
> 	p->flags |= PF_FORKNOEXEC;
> 	INIT_LIST_HEAD(&p->children);
>diff --git a/kernel/taskstats.c b/kernel/taskstats.c
>index f31df72f0e9d..dd9054de761f 100644
>--- a/kernel/taskstats.c
>+++ b/kernel/taskstats.c
>@@ -245,8 +245,8 @@ static int fill_stats_for_tgid(pid_t tgid, struct taskstats *stats)
> 	u64 now_ns;
> 
> 	/*
>-	 * Add additional stats from live tasks except zombie thread group
>-	 * leaders who are already counted with the dead tasks
>+	 * Add stats from tasks not yet included in the dead-task cache.
>+	 * Accounting can finish before exit_state is set.
> 	 */
> 	rcu_read_lock();
> 	first = find_task_by_vpid(tgid);
>@@ -261,7 +261,7 @@ static int fill_stats_for_tgid(pid_t tgid, struct taskstats *stats)
> 
> 	now_ns = ktime_get_ns();
> 	for_each_thread(first, tsk) {
>-		if (tsk->exit_state)
>+		if (tsk->exit_state || tsk->taskstats_tgid_accounted)
> 			continue;
> 
> 		tgid_stats_add_task(stats, tsk, now_ns);
>@@ -291,6 +291,7 @@ static void fill_tgid_exit(struct task_struct *tsk)
> 
> 	now_ns = ktime_get_ns();
> 	tgid_stats_add_task(tsk->signal->stats, tsk, now_ns);
>+	tsk->taskstats_tgid_accounted = true;
> ret:
> 	spin_unlock_irqrestore(&tsk->sighand->siglock, flags);
> 	return;
>


Btw: you've sent 8 patches today, please stop spamming please.

--- Thanks!
