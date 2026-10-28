Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210091;
	b=mGls/EEPaF63/vGxRyTA/wuQSkeOXz1OcFlHbPhfR+0YBl/8lsihzl1yF8qJqfpg0cHd
	 S1pbaw0szEANdXSVNd5Z3ZHHZwHT6eGDjC1kUiamgSpmWRYwsblLmut9QvsE1YLhdJ7Sn
	 c3soeKmTSJiM3x90kN5YKjDkfLlGl4cFxzpc8TTZJ4Getgbsh+e1K2ah0ZUKf5kp9Wvri
	 XN4Y+AHsdGcCqEM98bQ7FrPdYDP+qOhQmz8s2RJsbhH+G36z5amOrWBl0hSqwIuFrFMsv
	 590UQOjj9QSDP9f+fRKOSrC7LYMg+jQrOKdl7B0mU/kVX/phocaQQmTF+il1FjLvkqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210091;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HVlPGl3fWdf/kFwiOc5TRZOI4ROtZBasgQKhZvOwBv8=;
	b=J4DMoIZ7q/aJbMJ7ZGshFo9CG7cnFaEuW1YnsfRQSS4APg1qlod1IGBE3q2otXx4eDog
	 u03+iFfWV871xNaetLyetdh/URNLMsC2rTUP71Kp8qQpf4Hg7z+qdqdgNuG57jLa2QEgH
	 s1dipDdKjUr7oBiDqW609EEXeBbLcRFx1Ke9f2WsqYg4xLr4Vz0R8xZaMWH9PwWASCilv
	 Edq5m7on0XQRMUWtrrG60pgJRtMhomACcmpJ8CWizGuWbcaRSk0TRVqjcDtVGAiNekWBM
	 V9C0PJjuabR+kJWm7tl6kSRR7mcxF3Ma8Q5HKzni9TIfpW/gVjyHVhrp1VXu0o5sjkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=Ndy+cLxv;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4466606A321
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4466606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=Ndy+cLxv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HVlPGl3fWdf/kFwiOc5TRZOI4ROtZBasgQKhZvOwBv8=; t=1793210090; x=1794074090; 
	b=Ndy+cLxvSyj4j/SQdt5QBtFBwIJJFag1S9ApFT6ZnXKahJgS6GmGUHVsMUPHLfMj20PUTJQp9Cs
	vxKj69rnF49chxgC1HRrGHNqop0gR8r0T/JPUUdifrHKDTAcCryoQNmD7W+r5Qf+PFL+l+NZnSIq8
	AieJm8d24w6eqYUOYq1hPMb5L8saGCszkFm+gDtmR2XmuSP+9b//XTXosDGPSThBSDGYc+3TAWtDA
	XzVE6+J/7RA4jrqP8hGAlRDuGkj8NC+5Sn7OFT9pYq5MEUTGtUlMo/WmDD0j4M+dmP2wUF3je5MaF
	jxN9WiaQANL66Oz1cE9wiX+W3UUAo+WZ8nsA==;
Received: from mail-dy1-f179.google.com ([74.125.82.179])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xM7rN-00HXI4-L9
	for linux-kernel@vger.kernel.org;
	Wed, 28 Oct 2026 13:54:49 -0400
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35829219da8so2930417eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:54:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZQJ1eI4Mzx2PM9Ldfxj8FEUyXgcEdAdgnwNaLNpw2bEdPbVQSfCQAU4XG3HIj9Wqr3OtQwJI010M87mI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNMxUKbFb6q7cjBdSi8V2shzwcyLQQURarUrnPDdYJNzqpJdnG
	7WqWa4INrI1zbt9tpd88FTe8jTxTAQNCspOstfN9ayLQETWplhoczdblEer0nfVk2VcBqcnjU8/
	hVLJXAq/H6gUDfMTjCAiyEuRzmsm4fBg=
X-Received: by 2002:a05:7022:120e:b0:15c:a04c:cd4f with SMTP id
 a92af1059eb24-1a93c2f7080mr279394c88.0.1793210088135; Wed, 28 Oct 2026
 10:54:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013171238.777119-1-nickolai@csail.mit.edu> <auIYKkk_J0lskudq@yury>
In-Reply-To: <auIYKkk_J0lskudq@yury>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Wed, 28 Oct 2026 13:54:36 -0400
X-Gmail-Original-Message-ID: <CADGQE7HnCzMiGADiBFKLVNbnyX8oB8beX_Pbk7_ouS06mwNtzQ@mail.gmail.com>
X-Gm-Features: AclHuK8aqH7Walq4AlayOc_-Z2ilwYJ7_YhvZmL7hn3ttN_qMsr35JbIEPi-gO4
Message-ID: <CADGQE7HnCzMiGADiBFKLVNbnyX8oB8beX_Pbk7_ouS06mwNtzQ@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: Fix lost icache flush requests in set_icache_stale_mask()
To: Yury Norov <ynorov@nvidia.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Charlie Jenkins <charlie@rivosinc.com>, Yury Norov <yury.norov@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 11:43=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wro=
te:
>
> On Tue, Oct 13, 2026 at 01:12:37PM -0400, Nickolai Zeldovich wrote:
> > set_icache_stale_mask() marks every other hart's icache as stale for th=
e
> > current mm by reading the current hart's bit, storing an all-ones mask =
and
> > then writing the current hart's bit back as it was read:
> >
> >       stale_cpu =3D cpumask_test_cpu(cpu, mask);
> >       cpumask_setall(mask);
> >       __assign_cpu(cpu, mask, stale_cpu);
> >
> > mm->context.icache_stale_mask is shared by all harts running the mm and
> > is updated concurrently without a lock: flush_icache_mm() sets every bi=
t
> > with cpumask_setall() (a plain store) whenever a thread flushes the
> > icache, prepare_sync_core_cmd() does the same for
> > membarrier(MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE), and
> > flush_icache_deferred() clears the current hart's bit with an atomic
> > test-and-clear from switch_mm(). Those are safe with each other because
> > each of them either only sets bits or atomically clears its own hart's
> > bit, and a bit set one time too many only costs a redundant fence.i.
> > set_icache_stale_mask() is the one writer that stores a value it read
> > earlier: the current hart's bit as returned by cpumask_test_cpu(). If
> > another hart sets that bit between the read and the write-back, the
> > write-back erases it. The erased bit is a pending deferred icache flush
> > for the current hart.
> >
> > Consider a process with two threads on different harts:
> >
> >   - Thread T1, on hart C, writes new instructions and calls
> >     riscv_flush_icache(start, end, SYS_RISCV_FLUSH_ICACHE_LOCAL).
> >     flush_icache_mm(mm, true) flushes hart C and only sets the other
> >     harts' stale bits, without IPIs: hart A is to flush its icache the
> >     next time it switches to this mm.
> >
> >   - Thread T2, on hart A, calls prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX,
> >     PR_RISCV_CTX_SW_FENCEI_OFF, PR_RISCV_SCOPE_PER_THREAD) at the same
> >     time. set_icache_stale_mask() reads hart A's bit as clear, T1's
> >     cpumask_setall() sets it, and __assign_cpu() clears it again.
> >
> > Hart A then runs another process, and T1 migrates to hart A. switch_mm(=
)
> > finds hart A's bit clear and does not flush, so T1 executes the old
> > instructions still in hart A's icache. For a JIT this is a wrong result
> > or a crash on a mix of old and new code. The guarantee of
> > membarrier(SYNC_CORE), which relies on the same bits, is lost the same
> > way. The window is the handful of instructions between the load and the
> > store, but a thread that calls the prctl while another thread of the
> > process flushes its icache hits it often, see the numbers below.
> >
> > Set the other harts' bits one at a time with cpumask_set_cpu(), which
> > only ever sets a bit, and leave the current hart's bit alone: it alread=
y
> > holds the value the old code tried to preserve. Commit 6b9391b581fd
> > ("riscv: Include riscv_set_icache_flush_ctx prctl") kept the current
> > hart's bit to cope with concurrent callers of this function; that is
> > preserved. Commit e5bf9a4b68fa ("riscv: switch set_icache_stale_mask()
> > to using non-atomic assign_cpu()") noted that the sequence is not atomi=
c
> > as a whole; it does not need to be, it only must never clear a bit.
> >
> > Reproduced on a StarFive JH7110 (VisionFive 2, non-coherent icache) wit=
h
> > a test program that runs the sequence above in a loop: T1 executes the
> > code on hart A to fill its icache, moves to hart C, rewrites the code a=
nd
> > flushes with SYS_RISCV_FLUSH_ICACHE_LOCAL while T2 hammers the prctl on
> > hart A, lets another process run on hart A, moves back to hart A and
> > executes the code again. A result computed from the old code is a stale
> > fetch. Each line is 50000 iterations on a pair of harts (A, C):
> >
> >   v7.3-rc7 unpatched:               13177 and 14362 stale
> >   v7.3-rc7 + 100 us delay in the
> >     read-modify-write window:       49993 and 47675 stale
> >   v7.3-rc7 + this patch:                0 and     0 stale
> >   v7.3-rc7 + this patch + delay:        0 and     0 stale
> >
> > Control runs with T2 idle never read stale code on any kernel, so the
> > deferred flush itself works; only its request gets lost.
> >
> > Found while formally verifying set_icache_stale_mask() against the
> > kernel binary.
> >
> > Fixes: 6b9391b581fd ("riscv: Include riscv_set_icache_flush_ctx prctl")
> > Assisted-by: LLM
> > Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> > ---
> >
> > Notes:
> >     The reproducer used for the numbers in the commit message is below =
(nolibc,
> >     build with "make headers_install" done:
> >     clang --target=3Driscv64-linux-gnu -Os -static -nostdlib -nostdinc
> >       -I tools/include/nolibc -I usr/include -include nolibc.h
> >       -o icache_stale_mask icache_stale_mask.c
> >     and run as "icache_stale_mask <hartA> <hartC> 50000" for the race a=
nd with a
> >     fifth argument for the control run). It needs hardware with a non-c=
oherent
> >     icache; QEMU TCG keeps translated code coherent and never shows the=
 symptom.
> >
> >     Build checks: riscv defconfig Image with clang, W=3D1 on cacheflush=
.o, and
> >     allnoconfig (CONFIG_SMP=3Dn, the function is not compiled), all cle=
an.
> >     checkpatch --strict reports only the missing Signed-off-by.
> >
> >     /*
> >      * icache_stale_mask.c: a thread's deferred icache flush is lost wh=
en
> >      * prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX, PR_RISCV_CTX_SW_FENCEI_OFF,=
 ...) on
> >      * one hart races with riscv_flush_icache(SYS_RISCV_FLUSH_ICACHE_LO=
CAL) on
> >      * another hart of the same process.
> >      *
> >      * Build with the kernel's nolibc (after "make headers_install"):
> >      *   clang --target=3Driscv64-linux-gnu -Os -static -nostdlib -nost=
dinc \
> >      *     -I tools/include/nolibc -I usr/include -include nolibc.h \
> >      *     -o icache_stale_mask icache_stale_mask.c
> >      * Usage: icache_stale_mask <hartA> <hartC> [iterations] [control]
> >      *
> >      * Three actors:
> >      *   T1 (the main thread): writes new code at P from hart C and cal=
ls
> >      *      riscv_flush_icache(P, P + 4096, SYS_RISCV_FLUSH_ICACHE_LOCA=
L), which
> >      *      flushes hart C and marks every other hart's icache stale fo=
r this mm.
> >      *   T2 (a thread of the same process, pinned to hart A): calls the=
 prctl in
> >      *      a loop while T1 flushes.  Its set_icache_stale_mask() reads=
 hart A's
> >      *      stale bit (clear), then stores the whole mask back with the=
 bit as
> >      *      read, erasing the bit T1 set in between.
> >      *   Q  (another process, pinned to hart A): runs on hart A after T=
2 blocks,
> >      *      so that T1's arrival on hart A is a switch_mm() into the pr=
ocess,
> >      *      the point where the kernel performs the deferred flush iff =
the bit
> >      *      is set.
> >      * Each iteration: T1 runs the old code on hart A (hart A's icache =
now holds
> >      * it), moves to hart C, writes new code, flushes LOCAL while T2 ha=
mmers the
> >      * prctl, lets Q run on hart A, moves back to hart A and runs the c=
ode.  A
> >      * result computed from the old code is a stale fetch.  With "contr=
ol" T2
> >      * never runs: every iteration must then read the new code.
> >      */
> >     #define N 1000    /* li a0,0; N x addi a0,a0,v; ret: returns N*v */
> >     #define PAGE 4096
> >
> >     #ifndef SYS_RISCV_FLUSH_ICACHE_LOCAL
> >     #define SYS_RISCV_FLUSH_ICACHE_LOCAL 1
> >     #endif
> >     #ifndef __NR_riscv_flush_icache
> >     #define __NR_riscv_flush_icache 259
> >     #endif
> >     #ifndef PR_RISCV_SET_ICACHE_FLUSH_CTX
> >     #define PR_RISCV_SET_ICACHE_FLUSH_CTX 71
> >     #define PR_RISCV_CTX_SW_FENCEI_ON 0
> >     #define PR_RISCV_CTX_SW_FENCEI_OFF 1
> >     #define PR_RISCV_SCOPE_PER_PROCESS 0
> >     #define PR_RISCV_SCOPE_PER_THREAD 1
> >     #endif
> >
> >     static unsigned int *rw;  /* the code page, writable mapping */
> >     static unsigned int *rx;  /* the same page, executable mapping */
> >     static volatile int go;           /* T2 hammers the prctl while set=
 */
> >     static int t1_to_t2[2], t2_to_t1[2], t1_to_q[2], q_to_t1[2];
> >     static int hart_a, hart_c;
> >     static char t2_stack[65536] __attribute__((aligned(16)));
> >
> >     /* clone a thread (shared mm) running fn(arg) on the given stack */
> >     long __clone_thread(long flags, void *stack_top, int (*fn)(void *),=
 void *arg);
> >     asm(".text\n"
> >         ".globl __clone_thread\n"
> >         "__clone_thread:\n"
> >         "     addi    a1, a1, -16\n"
> >         "     sd      a2, 0(a1)\n"            /* fn  */
> >         "     sd      a3, 8(a1)\n"            /* arg */
> >         "     li      a2, 0\n"
> >         "     li      a3, 0\n"
> >         "     li      a4, 0\n"
> >         "     li      a7, 220\n"              /* __NR_clone */
> >         "     ecall\n"
> >         "     bnez    a0, 1f\n"
> >         "     ld      a2, 0(sp)\n"
> >         "     ld      a0, 8(sp)\n"
> >         "     jalr    a2\n"
> >         "     li      a7, 93\n"               /* __NR_exit */
> >         "     ecall\n"
> >         "1:   ret\n");
> >
> >     static void pin(int cpu)
> >     {
> >       unsigned long mask =3D 1UL << cpu;
> >
> >       if (syscall(__NR_sched_setaffinity, 0, sizeof(mask), &mask))
> >               printf("sched_setaffinity(%d) failed\n", cpu);
> >     }
> >
> >     static void write_text(unsigned int v)
> >     {
> >       int i;
> >
> >       rw[0] =3D 0x00000513;
> >       for (i =3D 1; i <=3D N; i++)
> >               rw[i] =3D 0x00050513 | (v << 20);
> >       rw[N + 1] =3D 0x00008067;
> >     }
> >
> >     static long run_text(void)
> >     {
> >       return ((long (*)(void))rx)();
> >     }
> >
> >     static int t2_main(void *arg)
> >     {
> >       char c;
> >       long r;
> >
> >       pin(hart_a);
> >       while (read(t1_to_t2[0], &c, 1) =3D=3D 1) {
> >               write(t2_to_t1[1], "", 1);      /* about to hammer the pr=
ctl */
> >               while (go) {
> >                       r =3D syscall(__NR_prctl, PR_RISCV_SET_ICACHE_FLU=
SH_CTX,
> >                                   PR_RISCV_CTX_SW_FENCEI_OFF,
> >                                   PR_RISCV_SCOPE_PER_THREAD, 0, 0);
> >                       if (r) {
> >                               printf("prctl failed: %ld\n", r);
> >                               break;
> >                       }
> >               }
> >               write(t2_to_t1[1], "", 1);
> >       }
> >       return 0;
> >     }
> >
> >     int main(int argc, char **argv)
> >     {
> >       int iters =3D argc > 3 ? atoi(argv[3]) : 1000;
> >       int control =3D argc > 4;
> >       int i, fd, stale =3D 0, old_only =3D 0, bad =3D 0;
> >       long got;
> >       char c;
> >
> >       if (argc < 3) {
> >               printf("usage: %s <hartA> <hartC> [iterations] [control]\=
n", argv[0]);
> >               return 2;
> >       }
> >       hart_a =3D atoi(argv[1]);
> >       hart_c =3D atoi(argv[2]);
> >
> >       fd =3D memfd_create("text", 0);
> >       ftruncate(fd, PAGE);
> >       rw =3D mmap(NULL, PAGE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0=
);
> >       rx =3D mmap(NULL, PAGE, PROT_READ | PROT_EXEC, MAP_SHARED, fd, 0)=
;
> >       pipe(t1_to_t2);
> >       pipe(t2_to_t1);
> >       pipe(t1_to_q);
> >       pipe(q_to_t1);
> >
> >       if (!fork()) {                  /* Q: another mm, pinned to hart =
A */
> >               close(t1_to_q[1]);
> >               close(t1_to_t2[1]);
> >               pin(hart_a);
> >               while (read(t1_to_q[0], &c, 1) =3D=3D 1)
> >                       write(q_to_t1[1], "", 1);
> >               _exit(0);
> >       }
> >       __clone_thread(CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND =
|
> >                      CLONE_THREAD | CLONE_SYSVSEM,
> >                      t2_stack + sizeof(t2_stack), t2_main, NULL);
> >
> >       for (i =3D 0; i < iters; i++) {
> >               unsigned int old =3D 1 + (i & 1), new =3D 2 - (i & 1);
> >
> >               pin(hart_a);
> >               write_text(old);
> >               syscall(__NR_riscv_flush_icache, 0, 0, 0);      /* all ha=
rts */
> >               got =3D run_text();               /* hart A caches the ol=
d code */
> >               if (got !=3D (long)N * old) {
> >                       bad++;
> >                       continue;
> >               }
> >
> >               pin(hart_c);
> >               if (!control) {
> >                       go =3D 1;
> >                       write(t1_to_t2[1], "", 1);      /* T2 hammers the=
 prctl on A */
> >                       read(t2_to_t1[0], &c, 1);       /* ... from now o=
n */
> >               }
> >               write_text(new);
> >               /* flush hart C now, mark hart A's icache stale for this =
mm */
> >               syscall(__NR_riscv_flush_icache, rx, (char *)rx + PAGE,
> >                       SYS_RISCV_FLUSH_ICACHE_LOCAL);
> >               if (!control) {
> >                       go =3D 0;
> >                       read(t2_to_t1[0], &c, 1);       /* T2 stops and b=
locks */
> >               }
> >               write(t1_to_q[1], "", 1);       /* Q runs on hart A: A le=
aves our mm */
> >               read(q_to_t1[0], &c, 1);
> >
> >               pin(hart_a);                    /* switch_mm into our mm =
on hart A */
> >               got =3D run_text();
> >               if (got !=3D (long)N * new) {
> >                       stale++;
> >                       if (got =3D=3D (long)N * old)
> >                               old_only++;
> >               }
> >       }
> >       close(t1_to_t2[1]);
> >       close(t1_to_q[1]);
> >       wait(NULL);
> >       printf("harts A=3D%d C=3D%d %s: %d of %d iterations ran stale cod=
e (%d entirely old, %d warm-up failures)\n",
> >              hart_a, hart_c, control ? "control" : "race", stale, iters=
,
> >              old_only, bad);
> >       return !!stale;
> >     }
> >
> >  arch/riscv/mm/cacheflush.c | 17 ++++++++---------
> >  1 file changed, 8 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > index f8ead7cb7c7d6..22d6520a05417 100644
> > --- a/arch/riscv/mm/cacheflush.c
> > +++ b/arch/riscv/mm/cacheflush.c
> > @@ -180,20 +180,19 @@ void __init riscv_init_cbo_blocksizes(void)
> >  static void set_icache_stale_mask(void)
> >  {
> >       int cpu =3D get_cpu();
> > +     unsigned int other;
> >       cpumask_t *mask;
> > -     bool stale_cpu;
> >
> >       /*
> > -      * Mark every other hart's icache as needing a flush for
> > -      * this MM. Maintain the previous value of the current
> > -      * cpu to handle the case when this function is called
> > -      * concurrently on different harts.
> > +      * Mark every other hart's icache as needing a flush for this MM.
> > +      * Set the bits one at a time: flush_icache_mm() and
> > +      * flush_icache_deferred() update this mask concurrently, and a
> > +      * read-modify-write of the whole mask would discard their update=
s.
> >        */
> >       mask =3D &current->mm->context.icache_stale_mask;
> > -     stale_cpu =3D cpumask_test_cpu(cpu, mask);
> > -
> > -     cpumask_setall(mask);
> > -     __assign_cpu(cpu, mask, stale_cpu);
> > +     for_each_possible_cpu(other)
> > +             if (other !=3D cpu)
> > +                     cpumask_set_cpu(other, mask);
>
> Not judging the motivation, but the implementation should avoid the
> for-loop:
>
>
>         cpumask_setall(mask);
>         __cpumask_clear_cpu(cpu);
>
> Or I misunderstood your intention?

That clears this hart's bit unconditionally, and the bit can be a
flush request another hart has just set: flush_icache_mm(), the
membarrier SYNC_CORE path (cpumask_setall() in
prepare_sync_core_cmd()) or set_icache_stale_mask() itself on another
hart running the same mm.  A request cleared here is lost:
flush_icache_deferred() finds the bit clear and switch_mm() skips the
fence.i, so this hart can later run the mm with stale instructions.

flush_icache_mm() can set all bits and clear its own because it
flushes this hart's icache right after.  set_icache_stale_mask() does
not flush locally, so it has to leave its own bit alone, and since
cpumask has no atomic "set all but one", the patch sets the other bits
one at a time with cpumask_set_cpu().

One alternative is to do what flush_icache_mm() does:

  cpumask_setall(mask);
  cpumask_clear_cpu(cpu, mask);
  smp_mb();
  local_flush_icache_all();

which adds a local fence.i to prctl(PR_RISCV_SET_ICACHE_FLUSH_CTX,
PR_RISCV_CTX_SW_FENCEI_OFF).

Another alternative could be to cpumask_setall(mask) with no clear,
even for the current hart, so it does one redundant fence.i at its
next switch_mm() into this mm.

I haven't tested these alternatives yet; if they sound promising, I'll
run them on my physical RISC-V machines to confirm.

Nickolai.
