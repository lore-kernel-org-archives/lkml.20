Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1528151C063
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 17:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791911571; cv=none; b=kRBDCbV+ez7xUjEsZdam0BCOMpH4pwRTHIepF9xbvfmS5uwi1ravpPR//etmmhrgqu76/tJz6YpR1uMX5T9DPuaEfyppsPLVgJmDaGqUhG6OA2FKqnDqGtkljiQzxejjf5779kPqL24k4JF2csioI+5ZLTh7y40YZ6lqKixOH9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791911571; c=relaxed/simple;
	bh=M6cdWJ60Sm8BnvauBEdNsrKxkmtwQF50iKS+h9A11V4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qXbO5AUxWPO1c2CIFISkxUsaRNRVSBcWSzLniyzcjuFw3uQibCxba9xzFy4vGbAXw5wgipVT/gVgld69a3+PlMbxDikH6wlARvat8B2xc7sVTdG3nsV8ktzzlCzdrigl1KoRyyjJrEoeXEkgQzhSXK+ZZ8yQfMBFYIyKectjsFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xGg3K-002Afn-7F;
	Tue, 13 Oct 2026 13:12:38 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Yury Norov <yury.norov@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] riscv: Fix lost icache flush requests in set_icache_stale_mask()
Date: Tue, 13 Oct 2026 13:12:37 -0400
Message-ID: <20261013171238.777119-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_icache_stale_mask() marks every other hart's icache as stale for the
current mm by reading the current hart's bit, storing an all-ones mask and
then writing the current hart's bit back as it was read:

	stale_cpu = cpumask_test_cpu(cpu, mask);
	cpumask_setall(mask);
	__assign_cpu(cpu, mask, stale_cpu);

mm->context.icache_stale_mask is shared by all harts running the mm and
is updated concurrently without a lock: flush_icache_mm() sets every bit
with cpumask_setall() (a plain store) whenever a thread flushes the
icache, prepare_sync_core_cmd() does the same for
membarrier(MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE), and
flush_icache_deferred() clears the current hart's bit with an atomic
test-and-clear from switch_mm(). Those are safe with each other because
each of them either only sets bits or atomically clears its own hart's
bit, and a bit set one time too many only costs a redundant fence.i.
set_icache_stale_mask() is the one writer that stores a value it read
earlier: the current hart's bit as returned by cpumask_test_cpu(). If
another hart sets that bit between the read and the write-back, the
write-back erases it. The erased bit is a pending deferred icache flush
for the current hart.

Consider a process with two threads on different harts:

  - Thread T1, on hart C, writes new instructions and calls
    riscv_flush_icache(start, end, SYS_RISCV_FLUSH_ICACHE_LOCAL).
    flush_icache_mm(mm, true) flushes hart C and only sets the other
    harts' stale bits, without IPIs: hart A is to flush its icache the
    next time it switches to this mm.

  - Thread T2, on hart A, calls prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX,
    PR_RISCV_CTX_SW_FENCEI_OFF, PR_RISCV_SCOPE_PER_THREAD) at the same
    time. set_icache_stale_mask() reads hart A's bit as clear, T1's
    cpumask_setall() sets it, and __assign_cpu() clears it again.

Hart A then runs another process, and T1 migrates to hart A. switch_mm()
finds hart A's bit clear and does not flush, so T1 executes the old
instructions still in hart A's icache. For a JIT this is a wrong result
or a crash on a mix of old and new code. The guarantee of
membarrier(SYNC_CORE), which relies on the same bits, is lost the same
way. The window is the handful of instructions between the load and the
store, but a thread that calls the prctl while another thread of the
process flushes its icache hits it often, see the numbers below.

Set the other harts' bits one at a time with cpumask_set_cpu(), which
only ever sets a bit, and leave the current hart's bit alone: it already
holds the value the old code tried to preserve. Commit 6b9391b581fd
("riscv: Include riscv_set_icache_flush_ctx prctl") kept the current
hart's bit to cope with concurrent callers of this function; that is
preserved. Commit e5bf9a4b68fa ("riscv: switch set_icache_stale_mask()
to using non-atomic assign_cpu()") noted that the sequence is not atomic
as a whole; it does not need to be, it only must never clear a bit.

Reproduced on a StarFive JH7110 (VisionFive 2, non-coherent icache) with
a test program that runs the sequence above in a loop: T1 executes the
code on hart A to fill its icache, moves to hart C, rewrites the code and
flushes with SYS_RISCV_FLUSH_ICACHE_LOCAL while T2 hammers the prctl on
hart A, lets another process run on hart A, moves back to hart A and
executes the code again. A result computed from the old code is a stale
fetch. Each line is 50000 iterations on a pair of harts (A, C):

  v7.3-rc7 unpatched:               13177 and 14362 stale
  v7.3-rc7 + 100 us delay in the
    read-modify-write window:       49993 and 47675 stale
  v7.3-rc7 + this patch:                0 and     0 stale
  v7.3-rc7 + this patch + delay:        0 and     0 stale

Control runs with T2 idle never read stale code on any kernel, so the
deferred flush itself works; only its request gets lost.

Found while formally verifying set_icache_stale_mask() against the
kernel binary.

Fixes: 6b9391b581fd ("riscv: Include riscv_set_icache_flush_ctx prctl")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    The reproducer used for the numbers in the commit message is below (nolibc,
    build with "make headers_install" done:
    clang --target=riscv64-linux-gnu -Os -static -nostdlib -nostdinc
      -I tools/include/nolibc -I usr/include -include nolibc.h
      -o icache_stale_mask icache_stale_mask.c
    and run as "icache_stale_mask <hartA> <hartC> 50000" for the race and with a
    fifth argument for the control run). It needs hardware with a non-coherent
    icache; QEMU TCG keeps translated code coherent and never shows the symptom.
    
    Build checks: riscv defconfig Image with clang, W=1 on cacheflush.o, and
    allnoconfig (CONFIG_SMP=n, the function is not compiled), all clean.
    checkpatch --strict reports only the missing Signed-off-by.
    
    /*
     * icache_stale_mask.c: a thread's deferred icache flush is lost when
     * prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_OFF, ...) on
     * one hart races with riscv_flush_icache(SYS_RISCV_FLUSH_ICACHE_LOCAL) on
     * another hart of the same process.
     *
     * Build with the kernel's nolibc (after "make headers_install"):
     *   clang --target=riscv64-linux-gnu -Os -static -nostdlib -nostdinc \
     *     -I tools/include/nolibc -I usr/include -include nolibc.h \
     *     -o icache_stale_mask icache_stale_mask.c
     * Usage: icache_stale_mask <hartA> <hartC> [iterations] [control]
     *
     * Three actors:
     *   T1 (the main thread): writes new code at P from hart C and calls
     *      riscv_flush_icache(P, P + 4096, SYS_RISCV_FLUSH_ICACHE_LOCAL), which
     *      flushes hart C and marks every other hart's icache stale for this mm.
     *   T2 (a thread of the same process, pinned to hart A): calls the prctl in
     *      a loop while T1 flushes.  Its set_icache_stale_mask() reads hart A's
     *      stale bit (clear), then stores the whole mask back with the bit as
     *      read, erasing the bit T1 set in between.
     *   Q  (another process, pinned to hart A): runs on hart A after T2 blocks,
     *      so that T1's arrival on hart A is a switch_mm() into the process,
     *      the point where the kernel performs the deferred flush iff the bit
     *      is set.
     * Each iteration: T1 runs the old code on hart A (hart A's icache now holds
     * it), moves to hart C, writes new code, flushes LOCAL while T2 hammers the
     * prctl, lets Q run on hart A, moves back to hart A and runs the code.  A
     * result computed from the old code is a stale fetch.  With "control" T2
     * never runs: every iteration must then read the new code.
     */
    #define N 1000	/* li a0,0; N x addi a0,a0,v; ret: returns N*v */
    #define PAGE 4096
    
    #ifndef SYS_RISCV_FLUSH_ICACHE_LOCAL
    #define SYS_RISCV_FLUSH_ICACHE_LOCAL 1
    #endif
    #ifndef __NR_riscv_flush_icache
    #define __NR_riscv_flush_icache 259
    #endif
    #ifndef PR_RISCV_SET_ICACHE_FLUSH_CTX
    #define PR_RISCV_SET_ICACHE_FLUSH_CTX 71
    #define PR_RISCV_CTX_SW_FENCEI_ON 0
    #define PR_RISCV_CTX_SW_FENCEI_OFF 1
    #define PR_RISCV_SCOPE_PER_PROCESS 0
    #define PR_RISCV_SCOPE_PER_THREAD 1
    #endif
    
    static unsigned int *rw;	/* the code page, writable mapping */
    static unsigned int *rx;	/* the same page, executable mapping */
    static volatile int go;		/* T2 hammers the prctl while set */
    static int t1_to_t2[2], t2_to_t1[2], t1_to_q[2], q_to_t1[2];
    static int hart_a, hart_c;
    static char t2_stack[65536] __attribute__((aligned(16)));
    
    /* clone a thread (shared mm) running fn(arg) on the given stack */
    long __clone_thread(long flags, void *stack_top, int (*fn)(void *), void *arg);
    asm(".text\n"
        ".globl __clone_thread\n"
        "__clone_thread:\n"
        "	addi	a1, a1, -16\n"
        "	sd	a2, 0(a1)\n"		/* fn  */
        "	sd	a3, 8(a1)\n"		/* arg */
        "	li	a2, 0\n"
        "	li	a3, 0\n"
        "	li	a4, 0\n"
        "	li	a7, 220\n"		/* __NR_clone */
        "	ecall\n"
        "	bnez	a0, 1f\n"
        "	ld	a2, 0(sp)\n"
        "	ld	a0, 8(sp)\n"
        "	jalr	a2\n"
        "	li	a7, 93\n"		/* __NR_exit */
        "	ecall\n"
        "1:	ret\n");
    
    static void pin(int cpu)
    {
    	unsigned long mask = 1UL << cpu;
    
    	if (syscall(__NR_sched_setaffinity, 0, sizeof(mask), &mask))
    		printf("sched_setaffinity(%d) failed\n", cpu);
    }
    
    static void write_text(unsigned int v)
    {
    	int i;
    
    	rw[0] = 0x00000513;
    	for (i = 1; i <= N; i++)
    		rw[i] = 0x00050513 | (v << 20);
    	rw[N + 1] = 0x00008067;
    }
    
    static long run_text(void)
    {
    	return ((long (*)(void))rx)();
    }
    
    static int t2_main(void *arg)
    {
    	char c;
    	long r;
    
    	pin(hart_a);
    	while (read(t1_to_t2[0], &c, 1) == 1) {
    		write(t2_to_t1[1], "", 1);	/* about to hammer the prctl */
    		while (go) {
    			r = syscall(__NR_prctl, PR_RISCV_SET_ICACHE_FLUSH_CTX,
    				    PR_RISCV_CTX_SW_FENCEI_OFF,
    				    PR_RISCV_SCOPE_PER_THREAD, 0, 0);
    			if (r) {
    				printf("prctl failed: %ld\n", r);
    				break;
    			}
    		}
    		write(t2_to_t1[1], "", 1);
    	}
    	return 0;
    }
    
    int main(int argc, char **argv)
    {
    	int iters = argc > 3 ? atoi(argv[3]) : 1000;
    	int control = argc > 4;
    	int i, fd, stale = 0, old_only = 0, bad = 0;
    	long got;
    	char c;
    
    	if (argc < 3) {
    		printf("usage: %s <hartA> <hartC> [iterations] [control]\n", argv[0]);
    		return 2;
    	}
    	hart_a = atoi(argv[1]);
    	hart_c = atoi(argv[2]);
    
    	fd = memfd_create("text", 0);
    	ftruncate(fd, PAGE);
    	rw = mmap(NULL, PAGE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    	rx = mmap(NULL, PAGE, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0);
    	pipe(t1_to_t2);
    	pipe(t2_to_t1);
    	pipe(t1_to_q);
    	pipe(q_to_t1);
    
    	if (!fork()) {			/* Q: another mm, pinned to hart A */
    		close(t1_to_q[1]);
    		close(t1_to_t2[1]);
    		pin(hart_a);
    		while (read(t1_to_q[0], &c, 1) == 1)
    			write(q_to_t1[1], "", 1);
    		_exit(0);
    	}
    	__clone_thread(CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND |
    		       CLONE_THREAD | CLONE_SYSVSEM,
    		       t2_stack + sizeof(t2_stack), t2_main, NULL);
    
    	for (i = 0; i < iters; i++) {
    		unsigned int old = 1 + (i & 1), new = 2 - (i & 1);
    
    		pin(hart_a);
    		write_text(old);
    		syscall(__NR_riscv_flush_icache, 0, 0, 0);	/* all harts */
    		got = run_text();		/* hart A caches the old code */
    		if (got != (long)N * old) {
    			bad++;
    			continue;
    		}
    
    		pin(hart_c);
    		if (!control) {
    			go = 1;
    			write(t1_to_t2[1], "", 1);	/* T2 hammers the prctl on A */
    			read(t2_to_t1[0], &c, 1);	/* ... from now on */
    		}
    		write_text(new);
    		/* flush hart C now, mark hart A's icache stale for this mm */
    		syscall(__NR_riscv_flush_icache, rx, (char *)rx + PAGE,
    			SYS_RISCV_FLUSH_ICACHE_LOCAL);
    		if (!control) {
    			go = 0;
    			read(t2_to_t1[0], &c, 1);	/* T2 stops and blocks */
    		}
    		write(t1_to_q[1], "", 1);	/* Q runs on hart A: A leaves our mm */
    		read(q_to_t1[0], &c, 1);
    
    		pin(hart_a);			/* switch_mm into our mm on hart A */
    		got = run_text();
    		if (got != (long)N * new) {
    			stale++;
    			if (got == (long)N * old)
    				old_only++;
    		}
    	}
    	close(t1_to_t2[1]);
    	close(t1_to_q[1]);
    	wait(NULL);
    	printf("harts A=%d C=%d %s: %d of %d iterations ran stale code (%d entirely old, %d warm-up failures)\n",
    	       hart_a, hart_c, control ? "control" : "race", stale, iters,
    	       old_only, bad);
    	return !!stale;
    }

 arch/riscv/mm/cacheflush.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index f8ead7cb7c7d6..22d6520a05417 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -180,20 +180,19 @@ void __init riscv_init_cbo_blocksizes(void)
 static void set_icache_stale_mask(void)
 {
 	int cpu = get_cpu();
+	unsigned int other;
 	cpumask_t *mask;
-	bool stale_cpu;
 
 	/*
-	 * Mark every other hart's icache as needing a flush for
-	 * this MM. Maintain the previous value of the current
-	 * cpu to handle the case when this function is called
-	 * concurrently on different harts.
+	 * Mark every other hart's icache as needing a flush for this MM.
+	 * Set the bits one at a time: flush_icache_mm() and
+	 * flush_icache_deferred() update this mask concurrently, and a
+	 * read-modify-write of the whole mask would discard their updates.
 	 */
 	mask = &current->mm->context.icache_stale_mask;
-	stale_cpu = cpumask_test_cpu(cpu, mask);
-
-	cpumask_setall(mask);
-	__assign_cpu(cpu, mask, stale_cpu);
+	for_each_possible_cpu(other)
+		if (other != cpu)
+			cpumask_set_cpu(other, mask);
 	put_cpu();
 }
 #endif

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.56.0

