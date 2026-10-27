Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069460;
	b=ld8LNnVyV4MQPVpEdLTdnzmh0Uz4LMo5gfgh12HfEtmikfQ9TILd8zZTMACdKwCMZmyV
	 HDfHlmHvcLkyQ6RqAqCGAfztKj2AL5tj00gnhwG29ijLrHt9ZdG9xXsTROMf05FknfqvD
	 HnMtL60Edd1vHpVsepXa9n9f58LYYmj1PVNN1krQ7Ih6VtV/4Zu2Ktv7P5WvoqhctVe2S
	 sjzBHcdCBTDi33kDypqO8BXPMYuoPkmWEoqM+2gsAd+pX0QYS6aPe7My5C2q/oRRzhX2F
	 d22xb84aN6oshE/7RNAfP+SKVLybABBMp/g0iPyRdS6SKgopaY5tSXY+9XCKG1Olm9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069460;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+TcDXDlnoDava9FFuXgOmrKSrhfuqvnagelOLV8ciTI=;
	b=Szse7evKkMy/tNlqIwoJyWgdAwTEBls6h+8Ns34dEt5k6OcZ5acHd5gLibKDYe5eWLcA
	 TQEXb0MBfbkbIyAdkrQcKUHLysyDBucYKLriEFb7h0CI2uCg680wB5xCbNtgd+Cmwt8/R
	 Izwg/SEVTmNEo+worx0n1CMn+3BhWLx556ZW/BVtLf2nvlC8s2WfSOitQ8Cvn/r1JetBK
	 Z+4N/cGnnpYm+/GoIIFVaJxV+4IWMVARtWWBZcZAXse0gA2PDrjzSg9hDSaN3Quv3EveH
	 fZZp/wj/qJLMcGDtFMNmy3MGDRMnqU8GvQFtlLvAwgp8xSQoUWRSXdeaZR6HqLhjZ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99337606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99337606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xLXH5-009a3h-BN;
	Mon, 26 Oct 2026 22:50:55 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Oleg Nesterov <oleg@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] signal: fix endless loop in complete_signal() during a non-leader exec
Date: Mon, 26 Oct 2026 22:50:55 -0400
Message-ID: <20261027025055.842038-1-nickolai@csail.mit.edu>
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

kill(2) of a process while a non-leader thread of it is in execve() can
lock up the machine: complete_signal() loops forever with siglock held
and interrupts off, and de_thread() then spins on siglock in
release_task() with tasklist_lock held.

The curr_target walk uses next_thread(), which wraps from the last
thread to ->group_leader on the assumption that the leader is first on
signal->thread_head. de_thread() makes the exec'ing thread, the last
one, the leader before release_task() unlinks the old leader, so a walk
that starts at the old leader stays on the new one if that thread
blocks the signal, and never gets back to curr_target.

Wrap to the first entry of signal->thread_head instead; siglock keeps
the list stable.

Reproduced on riscv64 and x86_64 under QEMU: the unpatched kernel locks
up within seconds, the patched one ran for 5 minutes without a hang.

Fixes: d639cf4abb4d ("change next_thread() to use __next_thread() ?: group_leader")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    This patch was prepared with the help of an AI tool.
    
    The sender's pid_task() lookup must see the old leader, that is, run
    before de_thread()'s exchange_tids(); after the swap kill() finds the
    new leader and thread_group_empty() returns early.
    
    Reproducer (SMP, no privileges; apart from the RCU stall report the hang
    is silent):
    
      gcc -O2 -pthread -o exec-kill exec-kill.c && ./exec-kill
    
    Before (mainline d135ab453a74, defconfig, QEMU -smp 6, booted with
    rcupdate.rcu_cpu_stall_timeout=10): no "rounds" line, and on x86_64,
    16 s after boot:
    
      rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
      NMI backtrace for cpu 5
      RIP: 0010:complete_signal+0xe0/0x2c0
       __send_signal_locked
       do_send_sig_info
       kill_pid_info_type
      NMI backtrace for cpu 4
      RIP: 0010:queued_spin_lock_slowpath+0x17/0x270
       release_task
       begin_new_exec
    
    riscv64 stalls the same way 13 s after boot, with one CPU in
    complete_signal() and three in the spinlock slow path.
    After: "1000 rounds" up to "33000 rounds" in 300 s on x86_64 ("7000
    rounds" on riscv64), no report.
    
      /* kill(2) a process while its second thread calls execve(2); a hang is the bug. */
      #define _GNU_SOURCE
      #include <pthread.h>
      #include <signal.h>
      #include <stdio.h>
      #include <sys/wait.h>
      #include <unistd.h>
    
      static volatile pid_t target;
    
      static void *sender(void *arg)
      {
      	for (;;) {
      		pid_t pid = target;
    
      		if (pid)
      			kill(pid, SIGRTMIN);
      	}
      	return arg;
      }
    
      static void *execer(void *arg)
      {
      	execl("/proc/self/exe", "exec-kill", "exit", (char *)NULL);
      	return arg;
      }
    
      int main(int argc, char **argv)
      {
      	pthread_t t;
      	sigset_t set;
      	siginfo_t si;
    
      	if (argc > 1)
      		return 0;	/* the image the second thread execs */
      	sigemptyset(&set);
      	sigaddset(&set, SIGRTMIN);
      	sigprocmask(SIG_BLOCK, &set, NULL);	/* every thread blocks it */
      	for (int i = 0; i < 3; i++)
      		pthread_create(&t, NULL, sender, NULL);
      	for (long n = 1;; n++) {
      		pid_t pid = fork();
    
      		if (pid == 0) {
      			pthread_create(&t, NULL, execer, NULL);
      			for (;;)
      				pause();
      		}
      		target = pid;
      		waitid(P_PID, pid, &si, WEXITED | WNOWAIT);
      		target = 0;
      		usleep(1000);
      		waitpid(pid, NULL, 0);
      		if (n % 1000 == 0)
      			printf("%ld rounds\n", n);
      	}
      }

 kernel/signal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index cb6ec7054eee7..c0637ca7bdcfa 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -990,7 +990,10 @@ static void complete_signal(int sig, struct task_struct *p, enum pid_type type)
 		 */
 		t = signal->curr_target;
 		while (!wants_signal(sig, t)) {
-			t = next_thread(t);
+			/* during de_thread() the leader may not be first */
+			t = __next_thread(t) ?:
+			    list_first_entry(&signal->thread_head,
+					     struct task_struct, thread_node);
 			if (t == signal->curr_target)
 				/*
 				 * No thread needs to be woken.

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0

