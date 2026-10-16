Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3225208A9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792166838; cv=none; b=QJ++KKCvZQ/EthMBGXDwEL9Y7PoruMv8e7ysyfreAr5Olnbfg54UNPVYVyczg6EwxBk17OMc44fjEdMLSvAMRPwumOfR6PpJz2YDnLApU1hzU9sGwdn3oAGtjVlU2Q+AsKHH0g7uCmj8qicijHD/Iwq+32sMJJEiKbEdETNW1y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792166838; c=relaxed/simple;
	bh=Mua8ZBX2KzXSH95yBhDE3of9DOUBAM4dPwBlSaPK93c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J908ThGjgHsY4rcuEfMjvhI6DEX31sZWcsMps5Bu+eeWITJFLacH0ctZpx34dC0AJXnVm2FMMgd3VBoqS2ufTWRXGE/mOLZVO1107HTw8u3rGK4SeA8dQ3IhWQhF9gSsFT6DK3lBsegljetXdbQgKO7d/lbpb6Jt1nKk94MiBjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xHkSa-00FVkx-K0;
	Fri, 16 Oct 2026 12:07:08 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] riscv: signal: mark the FP state clean before restoring it from the frame
Date: Fri, 16 Oct 2026 12:07:08 -0400
Message-ID: <20261016160708.790397-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

restore_fp_state() copies the FP image of the signal frame into
current->thread.fstate with __copy_from_user() and then calls
fstate_restore(), which loads thread.fstate into the FP registers when
regs->status.FS is not Off and marks the state Clean.

regs->status is still the sstatus saved when the signal handler entered
the kernel for rt_sigreturn(); restore_sigcontext() only overwrites the
general registers. If the handler wrote any FP register, FS is Dirty.
rt_sigreturn() runs with interrupts and preemption enabled, and the copy
sleeps when the frame page is not resident. A context switch anywhere
between the first store of the copy and fstate_restore() goes through
__switch_to_fpu(), whose fstate_save() sees FS == Dirty and stores the
live FP registers, which hold the handler's values, over the image that
was just copied from the frame:

  rt_sigreturn(), FS == Dirty               scheduler
  ----------------------------------------  -----------------------------
  restore_fp_state()
    __copy_from_user(&thread.fstate, ...)
      <preempted, or sleeping on a fault>
                                            __switch_to_fpu(prev = task)
                                              fstate_save(): FS == Dirty,
                                                live f0-f31, fcsr ->
                                                thread.fstate; FS = Clean
                                            ...
                                            __switch_to_fpu(next = task)
                                              fstate_restore():
                                                thread.fstate -> live
    <copy completes>
    fstate_restore(): thread.fstate -> live registers

The interrupted user code resumes with the signal handler's FP registers
(the handler's values in the part of the image copied before the switch
and its own in the rest) instead of the ones it had when the signal
arrived.

Any program whose signal handler executes a floating-point instruction
is exposed: when the handler returns while a reschedule is pending, or
when the signal frame has been paged out in the meantime, the
interrupted code silently continues with corrupted f0-f31 and fcsr.
With tick preemption the window is the 264-byte copy, so the corruption
is rare and shows up as sporadic wrong floating-point results: a test
program that loads a pattern into f0-f31, sends itself SIGUSR1 and
compares the registers afterwards, with a busy thread on the same CPU,
saw the handler's values in 110 of 200000 sigreturns on a CONFIG_PREEMPT
kernel under QEMU. The corruption is deterministic when the copy sleeps:
the same program with the frame on a userfaultfd-registered page that
the handler drops, so that the copy faults 128 bytes into the image,
gets the handler's values back in f0-f15 on every sigreturn.

The copy-then-restore order dates from the initial port, commit
e2c0cdfba7f6 ("RISC-V: User-facing API"), so every kernel since v4.15
is affected. The vector state had the same problem in __restore_v_state()
and commit c27fa53b858b ("riscv: Fix vector state restore in
rt_sigreturn()") fixed it by marking the live vector state clean before
the copy.

Do the same for the FP state: mark it Clean before the copy when it is
not Off. The live registers belong to the handler and are discarded by
sigreturn anyway; fstate_save() then skips them on a context switch, and
fstate_restore() still loads the image, both when the task is switched
back in and at the end of restore_fp_state(). With the change the test
program sees the correct registers in 20 of 20 userfaultfd runs and in
200000 of 200000 preemption runs.

Found while formally verifying rt_sigreturn() against the kernel binary.

Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    The pending "riscv: signal: protect regs->status RMW from concurrent
    preemption" (Guobin Zhang, 2026-08-07, with follow-ups on 2026-09-25 and
    2026-10-08) addresses a different problem in the same functions: a lost
    update on regs->status when the read-modify-write in __fstate_clean() is
    preempted and the scheduler writes the VS bits in between. It keeps the
    copy-then-restore order in restore_fp_state(), so it does not cover this
    bug. The two patches touch different hunks and apply in either order; the
    preempt_disable() it puts around __fstate_clean() would cover the new call
    as well.
    
    The guard mirrors fstate_restore(): with FS == Off nothing is restored
    today and the patch keeps that. A context switch before the first store
    of the copy is harmless with or without the patch, because fstate_save()
    then runs before the image is written; the riscv scalar usercopy stores
    in 64-byte strides, which is why the deterministic reproducer puts the
    page boundary 128 bytes into the image.
    
    The deterministic reproducer, as run (exit 1 before the patch with f0-f7 and
    f10-f15 reported, exit 0 after):
    
    // Reproducer: riscv64 rt_sigreturn() loses the FP state it restores when the copy of the
    // FP image sleeps (here: a userfaultfd page fault) while the handler left sstatus.FS dirty.
    // Build: riscv64-linux-gnu-gcc -static -O2 -pthread -o fpstate_sigreturn fpstate_sigreturn.c
    // Run as root (userfaultfd) on a preemptible kernel with CONFIG_FPU and CONFIG_USERFAULTFD.
    // Exit 1: FP registers corrupted after the signal; 0: clean; 2: could not set up.
    #define _GNU_SOURCE
    #include <fcntl.h>
    #include <pthread.h>
    #include <signal.h>
    #include <stdint.h>
    #include <stdio.h>
    #include <string.h>
    #include <sys/ioctl.h>
    #include <sys/mman.h>
    #include <sys/syscall.h>
    #include <ucontext.h>
    #include <unistd.h>
    #include <linux/userfaultfd.h>
    
    #define PAGE	4096UL
    #define SPLIT	128	/* page boundary this far into the 264-byte FP image */
    #define F(op, i, r) #op " f" #i ", " #i "*8(%[" #r "])\n"
    #define ALL(op, r) F(op, 0, r) F(op, 1, r) F(op, 2, r) F(op, 3, r) F(op, 4, r) F(op, 5, r) \
    	F(op, 6, r) F(op, 7, r) F(op, 8, r) F(op, 9, r) F(op, 10, r) F(op, 11, r) \
    	F(op, 12, r) F(op, 13, r) F(op, 14, r) F(op, 15, r)
    #define CLOBBERS "memory", "ft0", "ft1", "ft2", "ft3", "ft4", "ft5", "ft6", "ft7", \
    	"fs0", "fs1", "fa0", "fa1", "fa2", "fa3", "fa4", "fa5"
    
    static uint64_t pat[16], hpat[16], out[16];
    static unsigned char saved[PAGE] __attribute__((aligned(PAGE)));
    static volatile int placed;
    
    static void handler(int sig, siginfo_t *si, void *ctx)
    {
    	unsigned long hi = (unsigned long)&((ucontext_t *)ctx)->uc_mcontext.__fpregs + SPLIT;
    
    	placed = !(hi & (PAGE - 1));
    	if (placed) {	/* drop the page holding bytes SPLIT.. of the FP image */
    		memcpy(saved, (void *)hi, PAGE);
    		if (madvise((void *)hi, PAGE, MADV_DONTNEED))
    			_exit(2);
    	}
    	/* leave FS dirty, with the handler's values in the registers */
    	asm volatile(ALL(fld, h) "csrw fcsr, zero\n" : : [h]"r"(hpat) : CLOBBERS);
    }
    
    static void *serve(void *arg)	/* repopulate the dropped page when rt_sigreturn faults on it */
    {
    	struct uffdio_copy cp = { .src = (unsigned long)saved, .len = PAGE };
    	struct uffd_msg msg;
    	int fd = (int)(long)arg;
    
    	while (read(fd, &msg, sizeof(msg)) == sizeof(msg)) {
    		cp.dst = msg.arg.pagefault.address & ~(PAGE - 1);
    		cp.copy = 0;
    		ioctl(fd, UFFDIO_COPY, &cp);
    	}
    	return NULL;
    }
    
    int main(void)
    {
    	struct sigaction sa = { .sa_sigaction = handler, .sa_flags = SA_SIGINFO | SA_ONSTACK };
    	struct uffdio_api api = { .api = UFFD_API };
    	struct uffdio_register reg = { .mode = UFFDIO_REGISTER_MODE_MISSING };
    	stack_t ss = { .ss_size = 65536 };
    	long pid = getpid(), tid = syscall(__NR_gettid);
    	unsigned long fcsr = 0, shift;
    	pthread_t th;
    	int fd, i, bad = 0;
    
    	for (i = 0; i < 16; i++) {
    		pat[i] = 0x4010000000000000ULL + i;
    		hpat[i] = 0xbff0000000000000ULL + i;
    	}
    	ss.ss_sp = mmap(NULL, ss.ss_size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    	memset(ss.ss_sp, 0, ss.ss_size);	/* populate: only the dropped page will fault */
    	reg.range.start = (unsigned long)ss.ss_sp;
    	reg.range.len = ss.ss_size;
    	fd = syscall(__NR_userfaultfd, O_CLOEXEC);
    	if (fd < 0 || ioctl(fd, UFFDIO_API, &api) || ioctl(fd, UFFDIO_REGISTER, &reg)) {
    		perror("userfaultfd");
    		return 2;
    	}
    	pthread_create(&th, NULL, serve, (void *)(long)fd);
    	sigaction(SIGUSR1, &sa, NULL);
    
    	/* move the frame down 16 bytes at a time until the FP image crosses a page at SPLIT */
    	for (shift = 0; shift < PAGE && !placed; shift += 16) {
    		ss.ss_size = 65536 - shift;
    		sigaltstack(&ss, NULL);
    		register long a0 asm("a0") = pid, a1 asm("a1") = tid;
    		register long a2 asm("a2") = SIGUSR1, a7 asm("a7") = __NR_tgkill;
    		fcsr = 0x1f;
    		/* load the pattern, send ourselves SIGUSR1, store what the sigreturn left behind */
    		asm volatile(ALL(fld, in) "csrw fcsr, %[fc]\n ecall\n csrr %[fc], fcsr\n" ALL(fsd, o)
    			     : "+r"(a0), [fc]"+r"(fcsr)
    			     : "r"(a1), "r"(a2), "r"(a7), [in]"r"(pat), [o]"r"(out) : CLOBBERS);
    	}
    	if (!placed)
    		return 2;
    	for (i = 0; i < 16; i++) {	/* f8/f9 are callee-saved: the handler's epilogue reloads them */
    		if (i == 8 || i == 9 || out[i] == pat[i])
    			continue;
    		printf("f%d = %016lx, expected %016lx\n", i, out[i], pat[i]);
    		bad++;
    	}
    	if (fcsr != 0x1f) {
    		printf("fcsr = %lx, expected 1f\n", fcsr);
    		bad++;
    	}
    	printf("%s\n", bad ? "FAIL: FP state corrupted across rt_sigreturn" : "PASS");
    	return bad ? 1 : 0;
    }

 arch/riscv/kernel/signal.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 59784dc117e4..3058c89470e8 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -47,6 +47,13 @@ static long restore_fp_state(struct pt_regs *regs,
 	long err;
 	struct __riscv_d_ext_state __user *state = &sc_fpregs->d;
 
+	/*
+	 * Mark the live FP state clean before the copy, so a context switch
+	 * does not save the handler's registers over the restored image.
+	 */
+	if ((regs->status & SR_FS) != SR_FS_OFF)
+		__fstate_clean(regs);
+
 	err = __copy_from_user(&current->thread.fstate, state, sizeof(*state));
 	if (unlikely(err))
 		return err;

base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
-- 
2.53.0

