Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792932437;
	b=cUYTM+MsUjLdRJwbEnwS7ygdfRWa0FcFiNoX82SHOANfn2WJadGQuC417IqS+j/Hyj0U
	 9haqKPlM/QDikCkCMLxLi3Ozk675ZyNGl4t8DJFNodcFKjKkMP/X1HHL1YF2uZQjnxbav
	 YshCzip/7HnJ/m/fiwkOgqsl3BRgZXknxcqCsWyATnFCRWUMc+lTDgQYu0TMgGrLF2xWL
	 5EtcyPhyrpiZ/Sv7YENhLszliu9uihne1pkMhBVhzN4za2rn5PuQrxNri1IIfJJBcipXB
	 clI/CatNFZ2xrPdWBfQbQLaWEXRDWjvEraasaQdu2p9HdeL+B5+z5Y8rcjf8Eq3/2wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792932437;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=12D3HJWRuaQEfnNVUmCU5YbEjp0jnC7YRqPnX+RFlf8=;
	b=VgFULSe6wowHvHb7sh+yjLUqGOn1kFEKkjF2jf5LckIErSuQh/hsvdUPV2XF5FUbC5GL
	 7J2bltAg6zziBnwq82Jxo1WJrjQ8zG+x77M3WRPWSqO2E8yQCnk52wbiy9kJw7vrtorut
	 PCdrF5miKxPQ6O+IyXB0jsnZnPD7l6XCO1mkpz5VVn0u4NeoFAf3f1tSmQ0Vgeefhmim9
	 yucM3PQs1Bcylb70w6dZ2DWZdkHa0owFawSgDubYzv88Wde1onUMNGBCPUo8hnVNVJ4HD
	 47SlzIt0T9bVb4Qv84DNSzNCNd+7hYGckESxQrxO1SxAf2YhW8hRO4g0jUlAhpRZYSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B18D606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B18D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xKxcn-002wZj-HZ;
	Sun, 25 Oct 2026 08:46:57 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] sched/deadline: Fix this_bw on class change of a dying task
Date: Sun, 25 Oct 2026 08:46:57 -0400
Message-ID: <20261025124657.836229-1-nickolai@csail.mit.edu>
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

Moving a SCHED_DEADLINE task out of the class with sched_setscheduler(2)
after it stored TASK_DEAD in do_task_dead(), but before __schedule()
dequeued it, subtracts its bandwidth from the runqueue's this_bw twice.
this_bw then stays short until reboot: __sub_rq_bw() warns about the
underflow or about running_bw > this_bw, and GRUB reclaim for
SCHED_FLAG_RECLAIM tasks on that CPU is miscomputed.

The class change dequeues the still queued task with DEQUEUE_SAVE, which
removes its bandwidth from running_bw and this_bw. switched_from_dl()
then calls task_non_contending(), which, if the 0-lag time has passed,
removes it from this_bw again because the task is TASK_DEAD. That
removal is meant for the dying task's own DEQUEUE_SLEEP dequeue, which
has removed nothing before it.

Do the TASK_DEAD removal only on that dequeue path.

Reproduced under QEMU on x86_64 and riscv64 by moving exiting deadline
tasks to SCHED_OTHER in a loop; with this patch there is no warning.

Fixes: 8fd27231c330 ("sched/deadline: Track the "total rq utilization" too")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Reproducer (root or CAP_SYS_NICE, two or more CPUs; the warnings are
    WARN_ON_ONCE, so boot afresh for each run):
    
      gcc -O2 -o dl-dead-short dl-dead-short.c && ./dl-dead-short
      dmesg | grep 'WARNING:.*deadline'
    
    Before (x86_64 under QEMU TCG, -smp 2; the first hit after about one
    second, on riscv64 after about a minute):
    
      WARNING: kernel/sched/deadline.c:257 at task_non_contending+0x3e9/0x430, CPU#0: dl-dead-short/68
      Call Trace:
       switched_from_dl+0x2d/0x1d0
       sched_change_begin+0x1f2/0x240
       __sched_setscheduler+0x5c6/0x820
      WARNING: kernel/sched/deadline.c:260 at task_non_contending+0x41a/0x430, CPU#0: dl-dead-short/68
      WARNING: kernel/sched/deadline.c:221 at enqueue_dl_entity+0x597/0x720, CPU#1: dl-dead-short/953
      WARNING: kernel/sched/deadline.c:260 at switched_from_dl+0x1a5/0x1d0, CPU#0: dl-dead-short/68
      WARNING: kernel/sched/deadline.c:260 at dequeue_dl_entity+0x276/0x2b0, CPU#0: dl-dead-short/68
    
    After: no warning in the 50000 iterations, x86_64 and riscv64.
    
      #define _GNU_SOURCE
      #include <sched.h>
      #include <stdint.h>
      #include <stdio.h>
      #include <stdlib.h>
      #include <unistd.h>
      #include <sys/syscall.h>
      #include <sys/wait.h>
    
      #ifndef SCHED_DEADLINE
      #define SCHED_DEADLINE 6
      #endif
      #define MS 1000000ULL
    
      struct attr {
      	uint32_t size, policy;
      	uint64_t flags;
      	int32_t nice;
      	uint32_t prio;
      	uint64_t runtime, deadline, period;
      };
    
      static void pin(int cpu)
      {
      	cpu_set_t s;
    
      	CPU_ZERO(&s);
      	for (int c = 0; c < CPU_SETSIZE; c++)
      		if (cpu < 0 || c == cpu)
      			CPU_SET(c, &s);
      	sched_setaffinity(0, sizeof(s), &s);
      }
    
      int main(void)
      {
      	struct attr a = { sizeof(a), SCHED_DEADLINE, 0, 0, 0,
      			  100 * MS, 200 * MS, 1000 * MS };
      	struct sched_param sp = { 0 };
    
      	for (int i = 0; i < 50000; i++) {
      		siginfo_t si;
      		int go[2];
      		pid_t pid;
      		char c = 0;
    
      		if (pipe(go))
      			return 1;
      		pin(1);
      		pid = fork();
      		if (pid == 0) {
      			if (read(go[0], &c, 1) != 1)	/* parent is on CPU 0 */
      				_exit(1);
      			pin(-1);
      			_exit(syscall(SYS_sched_setattr, 0, &a, 0) ? 1 : 0);
      		}
      		pin(0);
      		if (write(go[1], &c, 1) != 1)
      			return 1;
      		close(go[0]);
      		close(go[1]);
      		do {	/* wait for the zombie, then race its last schedule() */
      			si.si_pid = 0;
      			waitid(P_PID, pid, &si, WEXITED | WNOHANG | WNOWAIT);
      		} while (!si.si_pid);
      		for (volatile int k = rand() % 2000; k; k--)
      			;
      		sched_setscheduler(pid, SCHED_OTHER, &sp);
      		waitpid(pid, NULL, 0);
      		if (si.si_status) {
      			fprintf(stderr, "sched_setattr failed\n");
      			return 1;
      		}
      	}
      	return 0;
      }
    
    This patch was written with the assistance of an AI agent.

 kernel/sched/deadline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcde5fe5d..dfae08625342e 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -444,7 +444,7 @@ static void task_non_contending(struct sched_dl_entity *dl_se, bool dl_task)
 			if (!dl_task || READ_ONCE(p->__state) == TASK_DEAD) {
 				struct dl_bw *dl_b = dl_bw_of(task_cpu(p));
 
-				if (READ_ONCE(p->__state) == TASK_DEAD)
+				if (dl_task && READ_ONCE(p->__state) == TASK_DEAD)
 					sub_rq_bw(dl_se, &rq->dl);
 				raw_spin_lock(&dl_b->lock);
 				__dl_sub(dl_b, dl_se->dl_bw, dl_bw_cpus(task_cpu(p)));

base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
-- 
2.53.0

