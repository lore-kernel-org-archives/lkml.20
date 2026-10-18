Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D635E33DEE6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792291340; cv=none; b=FF9Fr9NM2T9yf44dZND30R5NdJhxhiLhkXHyoKpjAk7LcLHPS0aetub1oSPvNTEET1Yo/3QYhqpaJUrKtAAaAFuUUnslkG6NNNnLcMk7SFF+vA7xUvD9KJ6OF//PtyzrFGML8+qYZ/tAEdTR1lHWrHaKPoCsxGSCGBB6d14zSKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792291340; c=relaxed/simple;
	bh=25cItN7Z+gyMUld5wt5bu2U7OYfpYaRb/cVCMhruypc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDgldeJxBwn4MwTo50fCEYIs5Kzruzh+HrD49auh/q+4nCgr2drdTwD7/fbY5FpN/jYvFl7nVC10OE8dSA79zJhhsHJfM9dmiwtf6oWJ/0T0UWoTD4viCO5WJEKLEdMUL9h0otm/22o9hzD73sKr2f/jyRaBPEJETomTseIqKBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xIGql-004P3N-AL;
	Sat, 17 Oct 2026 22:42:15 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Haorong Lu <ancientmodern4@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] riscv: signal: check the full syscall return value for a restart
Date: Sat, 17 Oct 2026 22:42:15 -0400
Message-ID: <20261018024215.798849-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A system call that returns a 64-bit value whose low 32 bits happen to
equal one of the -ERESTART* codes is restarted or turned into -EINTR
when a signal is pending on the way back to user space. lseek() returns
the new file offset, so lseek(fd, 0x1fffffe00, SEEK_CUR) followed by a
signal with an SA_RESTART handler runs the lseek() a second time and
leaves the offset at 0x3fffffc00; without SA_RESTART the call fails with
EINTR after it has moved the offset. With a SIGALRM interval timer of
20 us, 2337 out of 2000000 such lseek() calls moved the offset twice and
2695 out of 2000000 returned EINTR. brk() can return an arbitrary
address the same way, and a value ending in 0xfffffdfc goes through
restart_syscall() with whatever restart_block.fn the task last set.

arch_do_signal_or_restart() reads regs->a0 into an int, which drops the
upper half of the return value before it is compared with -ERESTARTSYS
and friends. The code before the restart handling was moved out of
handle_signal() switched on the unsigned long a0 and was not affected.

Keep the return value in a long. Compat tasks see only the low 32 bits
of a0, and a 32-bit tracer writes it zero-extended, so sign-extend it
from 32 bits for them as before.

Tested with the program in the notes on QEMU virt (riscv64 defconfig):
the offset is moved exactly once and no EINTR is returned with the patch.

Fixes: ce4f78f1b53d ("riscv: signal: handle syscall restart before get_signal")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Reproducer (static riscv64 binary run as /init's child on QEMU virt, -smp 2;
    riscv64-linux-gnu-gcc -O2 -static -o lseek_restart lseek_restart.c):
    
    #define _GNU_SOURCE
    #include <errno.h>
    #include <fcntl.h>
    #include <signal.h>
    #include <stdio.h>
    #include <string.h>
    #include <sys/time.h>
    #include <unistd.h>
    
    #define OFF 0x1fffffe00LL	/* low 32 bits read as -ERESTARTSYS */
    
    static volatile long nsig;
    
    static void handler(int sig)
    {
    	nsig++;
    }
    
    static void run(int fd, int flags, const char *name)
    {
    	struct sigaction sa;
    	struct itimerval it = { { 0, 20 }, { 0, 20 } };
    	long i, moved = 0, eintr = 0;
    
    	memset(&sa, 0, sizeof(sa));
    	sa.sa_handler = handler;
    	sa.sa_flags = flags;
    	nsig = 0;
    	sigaction(SIGALRM, &sa, NULL);
    	setitimer(ITIMER_REAL, &it, NULL);
    
    	for (i = 0; i < 2000000; i++) {
    		off_t r;
    
    		lseek(fd, 0, SEEK_SET);
    		r = lseek(fd, OFF, SEEK_CUR);
    		if (r == OFF)
    			continue;
    		if (r == -1 && errno == EINTR)
    			eintr++;
    		else if (r == 2 * OFF)
    			moved++;
    		else
    			printf("%s: unexpected %#llx\n", name, (long long)r);
    	}
    	memset(&it, 0, sizeof(it));
    	setitimer(ITIMER_REAL, &it, NULL);
    	printf("%s: %ld signals, %ld calls moved the offset twice, %ld returned EINTR\n",
    	       name, nsig, moved, eintr);
    }
    
    int main(void)
    {
    	int fd = open("/lseek-test", O_RDWR | O_CREAT, 0600);
    
    	if (fd < 0) {
    		perror("open");
    		return 2;
    	}
    	run(fd, SA_RESTART, "SA_RESTART");
    	run(fd, 0, "no SA_RESTART");
    	return 0;
    }
    
    Before:
    SA_RESTART: 283700 signals, 2337 calls moved the offset twice, 0 returned EINTR
    no SA_RESTART: 246693 signals, 0 calls moved the offset twice, 2695 returned EINTR
    After:
    SA_RESTART: 306854 signals, 0 calls moved the offset twice, 0 returned EINTR
    no SA_RESTART: 278090 signals, 0 calls moved the offset twice, 0 returned EINTR

 arch/riscv/kernel/signal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 59784dc117e4..b1e92b969d96 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -499,7 +499,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 void arch_do_signal_or_restart(struct pt_regs *regs)
 {
 	unsigned long continue_addr = 0, restart_addr = 0;
-	int retval = 0;
+	long retval = 0;
 	struct ksignal ksig;
 	bool syscall = (regs->cause == EXC_SYSCALL);
 
@@ -508,6 +508,8 @@ void arch_do_signal_or_restart(struct pt_regs *regs)
 		continue_addr = regs->epc;
 		restart_addr = continue_addr - 4;
 		retval = regs->a0;
+		if (is_compat_task())
+			retval = (int)retval;
 
 		/* Avoid additional syscall restarting via ret_from_exception */
 		regs->cause = -1UL;

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.53.0

