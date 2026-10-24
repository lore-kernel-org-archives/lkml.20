Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792841459;
	b=i3AXE6kkkNYF2av+47VoQVRFaxPgPjBmvndaowfcAHQmgORqrdl3ij8MpmGNP3WySiUN
	 4PkCy5OjdlLwAfCHkJ2m3KGme0hT2dTp+4lQgHlPbmTTK/ZPfsWIlRA8tCegFSlSc6w7u
	 Rt19HSaOrx2ERDKvqKuLkDMdQOWi868L4Cx3tj09mTRyC7N1DcNJ9l0hB5BMmwISXwSxu
	 AU7350MYb8rY/Xc1XSSr4kOajOlwFw2wIFTJi8u5Q9vXar3HZ2p0RoNvpRn9izTWs3Hni
	 bDrlyBLagPsHgVmtkDxDqM2EJmTGv3/bk/KjqWiIje/fYSWzP/VKdgNkkjZCPVnBB/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841459;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xXhIPic0MO5SI+U7HrzMI2e5v0dRikGcCvY8Vqzi3rU=;
	b=C6qs4LX7j3ITyHbe0XO5BiusxnzXUtB3YkOhK6dB8YLcIs88D2hs7rS28qj3fTwxCGlJ
	 rGbL6E0xM75mMUgK6C9zoGAI2DCCPlD9vV8mRyNI1HOzL13+KP0K1l2UuVqzKSEY0TssS
	 tIovvJuJIZb40gSZWqoX1gkpX5u40JDoiQAbAWfz8kVxG40dIRAEy+HN6XZ9vAGyUUfIw
	 8TWql+sAZC2NAjFPbTSnVk0r1n9d0dVDjDyrEM6kT7s1slM8kIRetPp6QlTqw5NFwCzuz
	 FzaQMWROlbBpRs+VYqNKHf2TLR0+UDihfu6xddC6C/EhHhf72JRZjhoIcDuo4gjV0xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=XaSOfuF3;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=Zf+ZmpFQ;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE26606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADE26606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=XaSOfuF3;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=Zf+ZmpFQ
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792841407; bh=xXhIPic0MO5SI+U7HrzMI2e
	5v0dRikGcCvY8Vqzi3rU=; b=XaSOfuF3qfV09y5nY25e+mdFWZAp7ZVVHZs7M/cxIpkWhQHQZB
	OdJtyf9HrkoDMba2V2YWoqq/0o6HXkAqoTosIuCLBOXgd5dYILjs5T7CnT+MhOZ5L/9cS9RgBjx
	XkxSbplY+KA/P77j7I3p2JO4hz61MlLuImiQxkALEk5aAsrcWjufA82WOCYNbrwubuXoenwD4/9
	RZoFnyu1htR5xhJeeCvabqXzHClD5J+IdvIga+XrSulOqH3TRBtjkVDaVbKsYDZcRcxbMQNObtP
	rkCe1m+t8Gxm/Y7h+BZ1O4cW2tdooJFJd/+xy36OMu3xrBSgmKn4dRoJ7cJTwA6lA+A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792841407; bh=xXhIPic0MO5SI+U7HrzMI2e
	5v0dRikGcCvY8Vqzi3rU=; b=Zf+ZmpFQLt+8V00+nn1+Yz0+q7mh0+OmA2MkGqqPkxiXhcNjcI
	EUG/NkohYc8LEmGSsSuySqtm1iLiQZSnfTDA==;
Date: Sat, 24 Oct 2026 12:30:08 +0100
From: Bradley Morgan <brads@mainlining.org>
To: nickolai@csail.mit.edu
CC: akpm@linux-foundation.org, brauner@kernel.org, ebiederm@xmission.com,
 kees@kernel.org, legion@kernel.org, linux-kernel@vger.kernel.org,
 serge@hallyn.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1=5D_ucount=3A_read_the_parent_?=
 =?US-ASCII?Q?ucounts_before_dropping_the_rlimit_count?=
In-Reply-To: <20261024015513.830312-1-nickolai@csail.mit.edu>
Message-ID: <C9223CAC-365E-4F10-AEA8-CF8326EF0217@mainlining.org>
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

On 24 October 2026 02:55:13 BST, Nickolai Zeldovich
<nickolai@csail.mit.edu> wrote:
>do_dec_rlimit_put_ucounts() drops its share of iter->rlimit[type] and
>only then loads iter->ns->ucounts. If the decrement leaves the count
>non-zero, a concurrent caller can take it to zero and put the last
>reference, which frees the ucounts and possibly its user namespace with
>kfree_rcu(). An exiting task frees its pending signals without siglock
>or any RCU read-side section, so when it is preempted between the
>decrement and the load for a grace period it reads freed memory and
>then decrements a counter through the pointer it found there.
>
>A pending signal holds no reference on its ucounts: the reference is
>taken by whoever moves the count from 0 to 1 and dropped by whoever
>moves it back to 0, so the caller's share of the count is all that
>keeps iter alive, and only until it is dropped.
>
>Load the parent first; it stays pinned by the caller's share of its
>own count.
>
>Fixes: 15bc01effefe ("ucounts: Fix signal ucount refcounting")

Ok.

>Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
>---
>
>Notes:
>    Callers that run the loop outside any RCU read-side section on master:
>    exit_signals() (flush_sigqueue_list() after dropping siglock),
>    release_task() (flush_sigqueue() of shared_pending) and
>    posixtimer_free_timer() (timer_delete(), posixtimer_delete_timers()).
>    The callers that hold siglock run with interrupts off, and since
>    put_ucounts() and free_user_ns() free with kfree_rcu() the objects
>    outlive them. Before commit 5f01a22c5b23 ("ucount: use RCU for ucounts
>    lookups") put_ucounts() used kfree(), so the window was open for every
>    caller.
>    
>    The interleaving, on a ucounts whose SIGPENDING count is 2 and which no
>    cred references any more:
>    
>      CPU0 (exiting task)              CPU1
>      dec = sub_return(1) -> 1
>      <preempted>
>                                       dec = sub_return(1) -> 0
>                                       put_ucounts(iter): last reference,
>                                         kfree_rcu(iter)
>                                       <grace period ends>
>      next = iter->ns->ucounts  (freed)
>    
>    Loading first is enough: until the decrement, the caller's share
>    keeps the count at 1 or more, so the reference taken on the 0 -> 1
>    transition is still held; iter->ns is pinned by iter, ns->ucounts
>    by ns, and next by the caller's undecremented share at its level.
>    atomic_long_sub_return() is fully ordered, so the loads complete
>    before the decrement is visible. rcu_read_lock() around the loop
>    would also do on master, but only because both objects are freed
>    with kfree_rcu().
>    
>    Reproduced on x86_64 under QEMU with the program below on a KASAN kernel
>    (CONFIG_KASAN=y, CONFIG_USER_NS=y) with a test-only delay injected in the
>    window between the decrement and the load in do_dec_rlimit_put_ucounts()
>    and a kvfree_rcu_barrier() added after put_ucounts() so the freed node is
>    reclaimed inside the window; the unpatched kernel reports
>    
>      BUG: KASAN: slab-use-after-free in do_dec_rlimit_put_ucounts
>      Read of size 8 ... by task ucdprace
>       do_dec_rlimit_put_ucounts
>       __sigqueue_free
>       exit_signals
>       do_exit
>      Allocated by task ...: alloc_ucounts <- set_cred_ucounts <- __sys_setresuid
>      Freed by task 0: __kasan_slab_free <- rcu ... (kfree_rcu callback)
>    
>    and the patched kernel, with the same delay moved to just after the load,
>    reports nothing.
>    
>    Reproducer (needs CAP_SETUID; an unprivileged user reaches it in a user
>    namespace that maps more than one uid; cc -O2 -static -o race race.c):
>    
>      #define _GNU_SOURCE
>      #include <sys/prctl.h>
>      #include <sys/syscall.h>
>      #include <sys/wait.h>
>      #include <signal.h>
>      #include <unistd.h>
>      #define U 4000
>      static void worker(int rfd)
>      {
>      	sigset_t set;
>      	siginfo_t info = { .si_signo = SIGRTMIN, .si_code = SI_QUEUE };
>      	char go;
>      	prctl(PR_SET_NAME, "ucdprace", 0, 0, 0);
>      	sigemptyset(&set);
>      	sigaddset(&set, SIGRTMIN);
>      	sigprocmask(SIG_BLOCK, &set, 0);
>      	setresuid(U, U, 0);
>      	syscall(SYS_rt_tgsigqueueinfo, getpid(), syscall(SYS_gettid),
>      		SIGRTMIN, &info);
>      	setresuid(0, 0, 0);
>      	read(rfd, &go, 1);
>      	_exit(0);
>      }
>      static pid_t spawn(int *go)
>      {
>      	int p[2];
>      	pid_t pid;
>      	pipe(p);
>      	if ((pid = fork()) == 0) { close(p[1]); worker(p[0]); }
>      	close(p[0]);
>      	*go = p[1];
>      	return pid;
>      }
>      int main(void)
>      {
>      	int ga, gb;
>      	pid_t a = spawn(&ga), b = spawn(&gb);
>      	usleep(200000);
>      	write(ga, "x", 1);
>      	usleep(100000);
>      	write(gb, "x", 1);
>      	waitpid(a, 0, 0);
>      	waitpid(b, 0, 0);
>      	return 0;
>      }
>    
>    This patch was written with the assistance of an LLM.
>    
> kernel/ucount.c | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/kernel/ucount.c b/kernel/ucount.c
>index ec8b1445e2877..c91840cab8b85 100644
>--- a/kernel/ucount.c
>+++ b/kernel/ucount.c
>@@ -285,9 +285,12 @@ static void do_dec_rlimit_put_ucounts(struct ucounts *ucounts,
> {
> 	struct ucounts *iter, *next;
> 	for (iter = ucounts; iter != last; iter = next) {
>-		long dec = atomic_long_sub_return(1, &iter->rlimit[type]);
>-		WARN_ON_ONCE(dec < 0);
>+		long dec;
>+
>+		/* Our count pins @iter; once it is dropped @iter may be freed. */
> 		next = iter->ns->ucounts;
>+		dec = atomic_long_sub_return(1, &iter->rlimit[type]);
>+		WARN_ON_ONCE(dec < 0);

Again, makes sense, cheers for the patch.

Reviewed-by: Bradley Morgan <brads@mainlining.org>


> 		if (dec == 0)
> 			put_ucounts(iter);
> 	}
>
>base-commit: 26344c0dd32af8790d8474d233619db825441138
>

--- Thanks!
