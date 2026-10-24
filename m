Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792806932;
	b=5AwhtSF/d2FufdBiwoMxT0fku1n73HwdFm1jEMcpyRap8JiTdDDc02IXQDJaSz6diGgD
	 epPDcadDX5MTt3Vvsmge91PohWqJY655lI7vap2r01AmVIJjFkCmLjDGjw+CsPnaQy4fr
	 MUwGUc9IofrLTN65nzCc3VEdLKQ30aTaoK4BInzB5QglB/rs/fBjOOtPoNz4PYq85/W/n
	 9dFkR7aPhifzr9eJRT1nObCYiyFPgFMc+T7FLL8o/Uicznp2zVRd0eg+WPidLW3Qp9Zpp
	 tqnx91P34AQucA9T5GvnLwXSov7qQHBX2GdAtXa1YGsVY9PY65/krYv2WlFDQZTcwcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792806932;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YppIFjEuyXfo+V14+YVBV0eu26CmssT56Hs/hEGdv6s=;
	b=TuUd0qArxEg2IxYXLIgEhBYMvGp054q5/CdyzeYk5AYb+VGNxWb80qpQw2JUj9/qp430
	 6VypkjpsMZboQDIP6QftN0Xs8vyy/OeyC8iVjP9zSOy+QNWuyBYa3JyLtKSjmAp/7aLbt
	 HzOhQzxp6Atf0Yd5hr4mH4nzZFk4DrAWykf+Ce519HDwlmy/y/+1HGlu0r8wqEvzTZDm4
	 I6Iwbs6vyut4dVnYkv8iaV6stYoBY2iLAnK/kZcz5UqwJhbMBMLEUStjEV1K3Ua5tHbKi
	 HE0aQO5tIZoltd7f+F3ZqEjQuBfUsyjqSEk5jdLOcG7PWrdQHdbO24dt00KsPTFov2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8277C606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 01:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8277C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xKQyX-00Dycq-CM;
	Fri, 23 Oct 2026 21:55:13 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Christian Brauner <brauner@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Serge Hallyn <serge@hallyn.com>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] ucount: read the parent ucounts before dropping the rlimit count
Date: Fri, 23 Oct 2026 21:55:13 -0400
Message-ID: <20261024015513.830312-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
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

do_dec_rlimit_put_ucounts() drops its share of iter->rlimit[type] and
only then loads iter->ns->ucounts. If the decrement leaves the count
non-zero, a concurrent caller can take it to zero and put the last
reference, which frees the ucounts and possibly its user namespace with
kfree_rcu(). An exiting task frees its pending signals without siglock
or any RCU read-side section, so when it is preempted between the
decrement and the load for a grace period it reads freed memory and
then decrements a counter through the pointer it found there.

A pending signal holds no reference on its ucounts: the reference is
taken by whoever moves the count from 0 to 1 and dropped by whoever
moves it back to 0, so the caller's share of the count is all that
keeps iter alive, and only until it is dropped.

Load the parent first; it stays pinned by the caller's share of its
own count.

Fixes: 15bc01effefe ("ucounts: Fix signal ucount refcounting")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Callers that run the loop outside any RCU read-side section on master:
    exit_signals() (flush_sigqueue_list() after dropping siglock),
    release_task() (flush_sigqueue() of shared_pending) and
    posixtimer_free_timer() (timer_delete(), posixtimer_delete_timers()).
    The callers that hold siglock run with interrupts off, and since
    put_ucounts() and free_user_ns() free with kfree_rcu() the objects
    outlive them. Before commit 5f01a22c5b23 ("ucount: use RCU for ucounts
    lookups") put_ucounts() used kfree(), so the window was open for every
    caller.
    
    The interleaving, on a ucounts whose SIGPENDING count is 2 and which no
    cred references any more:
    
      CPU0 (exiting task)              CPU1
      dec = sub_return(1) -> 1
      <preempted>
                                       dec = sub_return(1) -> 0
                                       put_ucounts(iter): last reference,
                                         kfree_rcu(iter)
                                       <grace period ends>
      next = iter->ns->ucounts  (freed)
    
    Loading first is enough: until the decrement, the caller's share
    keeps the count at 1 or more, so the reference taken on the 0 -> 1
    transition is still held; iter->ns is pinned by iter, ns->ucounts
    by ns, and next by the caller's undecremented share at its level.
    atomic_long_sub_return() is fully ordered, so the loads complete
    before the decrement is visible. rcu_read_lock() around the loop
    would also do on master, but only because both objects are freed
    with kfree_rcu().
    
    Reproduced on x86_64 under QEMU with the program below on a KASAN kernel
    (CONFIG_KASAN=y, CONFIG_USER_NS=y) with a test-only delay injected in the
    window between the decrement and the load in do_dec_rlimit_put_ucounts()
    and a kvfree_rcu_barrier() added after put_ucounts() so the freed node is
    reclaimed inside the window; the unpatched kernel reports
    
      BUG: KASAN: slab-use-after-free in do_dec_rlimit_put_ucounts
      Read of size 8 ... by task ucdprace
       do_dec_rlimit_put_ucounts
       __sigqueue_free
       exit_signals
       do_exit
      Allocated by task ...: alloc_ucounts <- set_cred_ucounts <- __sys_setresuid
      Freed by task 0: __kasan_slab_free <- rcu ... (kfree_rcu callback)
    
    and the patched kernel, with the same delay moved to just after the load,
    reports nothing.
    
    Reproducer (needs CAP_SETUID; an unprivileged user reaches it in a user
    namespace that maps more than one uid; cc -O2 -static -o race race.c):
    
      #define _GNU_SOURCE
      #include <sys/prctl.h>
      #include <sys/syscall.h>
      #include <sys/wait.h>
      #include <signal.h>
      #include <unistd.h>
      #define U 4000
      static void worker(int rfd)
      {
      	sigset_t set;
      	siginfo_t info = { .si_signo = SIGRTMIN, .si_code = SI_QUEUE };
      	char go;
      	prctl(PR_SET_NAME, "ucdprace", 0, 0, 0);
      	sigemptyset(&set);
      	sigaddset(&set, SIGRTMIN);
      	sigprocmask(SIG_BLOCK, &set, 0);
      	setresuid(U, U, 0);
      	syscall(SYS_rt_tgsigqueueinfo, getpid(), syscall(SYS_gettid),
      		SIGRTMIN, &info);
      	setresuid(0, 0, 0);
      	read(rfd, &go, 1);
      	_exit(0);
      }
      static pid_t spawn(int *go)
      {
      	int p[2];
      	pid_t pid;
      	pipe(p);
      	if ((pid = fork()) == 0) { close(p[1]); worker(p[0]); }
      	close(p[0]);
      	*go = p[1];
      	return pid;
      }
      int main(void)
      {
      	int ga, gb;
      	pid_t a = spawn(&ga), b = spawn(&gb);
      	usleep(200000);
      	write(ga, "x", 1);
      	usleep(100000);
      	write(gb, "x", 1);
      	waitpid(a, 0, 0);
      	waitpid(b, 0, 0);
      	return 0;
      }
    
    This patch was written with the assistance of an LLM.
    
 kernel/ucount.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/ucount.c b/kernel/ucount.c
index ec8b1445e2877..c91840cab8b85 100644
--- a/kernel/ucount.c
+++ b/kernel/ucount.c
@@ -285,9 +285,12 @@ static void do_dec_rlimit_put_ucounts(struct ucounts *ucounts,
 {
 	struct ucounts *iter, *next;
 	for (iter = ucounts; iter != last; iter = next) {
-		long dec = atomic_long_sub_return(1, &iter->rlimit[type]);
-		WARN_ON_ONCE(dec < 0);
+		long dec;
+
+		/* Our count pins @iter; once it is dropped @iter may be freed. */
 		next = iter->ns->ucounts;
+		dec = atomic_long_sub_return(1, &iter->rlimit[type]);
+		WARN_ON_ONCE(dec < 0);
 		if (dec == 0)
 			put_ucounts(iter);
 	}

base-commit: 26344c0dd32af8790d8474d233619db825441138
-- 
2.53.0

