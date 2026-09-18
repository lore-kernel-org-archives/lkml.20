Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DEC46984A;
	Fri, 18 Sep 2026 10:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789727894; cv=none; b=r0WQxxaaRNDXQ3x0xMl9XKmgkxuuEs1bzzukIKX77ICYTNA2n5GMPBiioQT4REM2YjiMzRKZnL/FpeYbIhHXKV9/eAGXRHDWi3NGMiEMNtrhSCFFk7gSlxPdXgvU3Fl2DBqIB+zWzsL/0sFzlHEaPsWOdUaXW6bKYvpkC4winy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789727894; c=relaxed/simple;
	bh=yBGRHFPSH3Xt5p5uM7Ch5rnoPE8jP+ejnpGkGYA9APU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=MHxO4xt7BzD39AQD+GbZ+qHNdUmR6di+XsiThyalBRslU3BEKcS1kYafLJKywVqoFQKMiDF+Bioux5Ph8ewTCHbFKfMKFg8XXoMCfIiwNNS1WKwBghiYoKnFx+9piQjGXe8pBvIIOJkl98VwW6rKp7NnHlmGhvkQ2cyGlumEzCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TeurjbdQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+eDs972z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TeurjbdQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+eDs972z"
Date: Fri, 18 Sep 2026 10:38:06 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789727888;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+IRfFhIm+CgWUbu9Faou6levM+GseTPh1rbeE6ryoXY=;
	b=TeurjbdQx0Lplm02jYWyMOlUdmMN+/rTfM64KBtUqgvDH5bQ/o8oWBmkDpywbr81gl/tgl
	5uc5m0na4AqcHXiaVuUK5Up5UIfnxHL+ydWUgwHuLuILWwP2vDihl5tbMxFNPrF5Icfcr7
	Nvh9Tc9pg4+6FNTh3HFd20dcZep0wVGPSffZT44NZ/Lf2FVKBS2KBcektHyXsv9/2Rdqog
	Fv0uOxJA5+h6S5UEfJYhlBmbaJiCBHQG/U79oha8FHcj2Vd35Ks2dsvgPKyGgBXcdx2vwA
	ef/XfkTjhMr7K2aJ3GGzk/xNBEouA9edyEtkq0jFpJHzQsWUMmqdcjkoWao62Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789727888;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+IRfFhIm+CgWUbu9Faou6levM+GseTPh1rbeE6ryoXY=;
	b=+eDs972zZl+uBzAJgHNsYRcHlgI48QPQD+p+umkNvtlAzB71+i+FnpKEQGekKsdQLqajVl
	OV2wPgDhT6VmoSBA==
From: "tip-bot2 for Matthew Schwartz" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] selftests/x86: Check signal state for rejected
 software interrupts
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260917230907.2080792-3-matthew.schwartz@linux.dev>
References: <20260917230907.2080792-3-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178972788686.1720534.10354272931129653562.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     96443a53bc3ef4b67dab0c497878fc8d56f799f3
Gitweb:        https://git.kernel.org/tip/96443a53bc3ef4b67dab0c497878fc8d56f=
799f3
Author:        Matthew Schwartz <matthew.schwartz@linux.dev>
AuthorDate:    Thu, 17 Sep 2026 16:09:07 -07:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Fri, 18 Sep 2026 12:33:18 +02:00

selftests/x86: Check signal state for rejected software interrupts

Add a test of the signal ABI for INT instructions in both 32-bit and
64-bit processes. Check the signal number, trap number, error code,
si_code, si_addr, instruction pointer and RF/TF state against legacy
IDT behavior. Include a 15-byte prefixed INT to check that IP uses the
hardware instruction length. Exercise both INT3 encodings, INT4, UD2
and HLT to cover the unchanged trap and fault paths.

Run each instruction with TF clear and set. Resume at a known NOP after
handling the signal and check that single-stepping traps after the NOP.

Also drive INT 0x2d under ptrace, which resumes through the fault frame
rather than sigreturn and so exposes a stale FRED software event flag.
Start from an INT3 stop, whose FRED frame has no software event flag,
instead of the syscall frame of raise(SIGSTOP). Single-step into the INT
and check that the fault reports its address. Then suppress SIGSEGV and
resume at the NOP, once with PTRACE_SINGLESTEP and once with PTRACE_CONT
and TF set. Section 6.2.3 of the Intel FRED specification [1] specifies
the immediate single-step trap caused by returning with both that flag
and TF set. Check that each trap occurs after the NOP, rather than at
its address.

Report whether the CPU supports FRED, since a pass looks the same on
either entry path. INT 0x80 with IA32 emulation disabled and a 64-bit
tracer of a 32-bit tracee are not covered.

Both variants pass all 29 checks on a non-FRED AMD host and on Panther
Lake with FRED enabled and the fix applied. With the same binaries on
unpatched Panther Lake, 16 signal-context checks fail and the first
ptrace check reports the IP after the INT. The two dependent ptrace
resume checks are not reached.

[1] Intel Flexible Return and Event Delivery (FRED) Specification,
revision 9.0 (346446-009US), section 6.2.3.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://cdrdv2.intel.com/v1/dl/getContent/678938 # [1]
Link: https://patch.msgid.link/20260917230907.2080792-3-matthew.schwartz@linu=
x.dev
---
 tools/testing/selftests/x86/Makefile     |   2 +-
 tools/testing/selftests/x86/int_signal.c | 311 ++++++++++++++++++++++-
 2 files changed, 312 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/x86/int_signal.c

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x=
86/Makefile
index 4340652..d478b13 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -13,7 +13,7 @@ CAN_BUILD_WITH_NOPIE :=3D $(shell ./check_cc.sh "$(CC)" tri=
vial_program.c -no-pie)
 TARGETS_C_BOTHBITS :=3D single_step_syscall sysret_ss_attrs syscall_nt test_=
mremap_vdso \
 			check_initial_reg_state sigreturn iopl ioperm \
 			test_vsyscall mov_ss_trap sigtrap_loop \
-			syscall_arg_fault fsgsbase_restore sigaltstack
+			syscall_arg_fault fsgsbase_restore sigaltstack int_signal
 TARGETS_C_BOTHBITS +=3D nx_stack
 TARGETS_C_32BIT_ONLY :=3D entry_from_vm86 test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
diff --git a/tools/testing/selftests/x86/int_signal.c b/tools/testing/selftes=
ts/x86/int_signal.c
new file mode 100644
index 0000000..22676da
--- /dev/null
+++ b/tools/testing/selftests/x86/int_signal.c
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Check the signal context for INT instructions with IDT and FRED entry. */
+#define _GNU_SOURCE
+
+#include <cpuid.h>
+#include <errno.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <sys/ptrace.h>
+#include <sys/user.h>
+#include <sys/wait.h>
+#include <unistd.h>
+#include <ucontext.h>
+
+#include "helpers.h"
+
+#ifdef __x86_64__
+#define REG_IP REG_RIP
+#define USER_IP rip
+#define STACK_PTR "%rsp"
+#else
+#define REG_IP REG_EIP
+#define USER_IP eip
+#define STACK_PTR "%esp"
+#endif
+
+/*
+ * Each instruction has normal and single-step entry points. Resume at the
+ * NOP after handling its signal, then expect a trace trap after that NOP
+ * when TF is set. Explicit labels avoid assuming the kernel's saved IP.
+ */
+#define PROBE(name, insn) \
+	extern void name(void); \
+	extern void name##_tf(void); \
+	extern const char name##_end[], name##_step[]; \
+	asm(".pushsection .text\n" \
+	    ".globl " #name "_tf\n" \
+	    ".type " #name "_tf, @function\n" \
+	    #name "_tf:\n" \
+	    "pushf\n" \
+	    "orl $0x100, (" STACK_PTR ")\n" \
+	    "popf\n" \
+	    ".globl " #name "\n" \
+	    ".type " #name ", @function\n" \
+	    #name ":\n" insn "\n" \
+	    ".globl " #name "_end\n" \
+	    #name "_end:\nnop\n" \
+	    ".globl " #name "_step\n" \
+	    #name "_step:\nret\n" \
+	    ".size " #name ", .-" #name "\n" \
+	    ".size " #name "_tf, .-" #name "_tf\n" \
+	    ".popsection\n")
+
+PROBE(int1, ".byte 0xcd, 0x01");
+PROBE(int29, ".byte 0xcd, 0x29");
+PROBE(int2c, ".byte 0xcd, 0x2c");
+PROBE(int2d, ".byte 0xcd, 0x2d");
+PROBE(prefixed_int2d, ".byte 0x66, 0xcd, 0x2d");
+PROBE(long_int2d, ".fill 13, 1, 0x2e\n.byte 0xcd, 0x2d");
+PROBE(int81, ".byte 0xcd, 0x81");
+PROBE(intff, ".byte 0xcd, 0xff");
+PROBE(short_int3, ".byte 0xcc");
+PROBE(long_int3, ".byte 0xcd, 0x03");
+PROBE(int4, ".byte 0xcd, 0x04");
+PROBE(ud2, ".byte 0x0f, 0x0b");
+PROBE(hlt, ".byte 0xf4");
+
+struct test {
+	const char *name;
+	void (*run)(void);
+	void (*run_tf)(void);
+	const char *end, *step;
+	int signo, trap, error, ip_offset, flags, code;
+};
+
+#define TEST(name, sig, trap, error, offset, flags, code) \
+	{ #name, name, name##_tf, name##_end, name##_step, \
+	  sig, trap, error, offset, flags, code }
+
+#define GP(name, error) \
+	TEST(name, SIGSEGV, 13, error, 0, X86_EFLAGS_RF, SI_KERNEL)
+
+static const struct test tests[] =3D {
+	GP(int1, 0x00a),
+	GP(int29, 0x14a),
+	GP(int2c, 0x162),
+	GP(int2d, 0x16a),
+	GP(prefixed_int2d, 0x16a),
+	GP(long_int2d, 0x16a),
+	GP(int81, 0x40a),
+	GP(intff, 0x7fa),
+	GP(hlt, 0),
+	TEST(short_int3, SIGTRAP, 3, 0, 1, 0, SI_KERNEL),
+	TEST(long_int3, SIGTRAP, 3, 0, 2, 0, SI_KERNEL),
+	TEST(int4, SIGSEGV, 4, 0, 2, 0, SI_KERNEL),
+	TEST(ud2, SIGILL, 6, 0, 0, X86_EFLAGS_RF, ILL_ILLOPN),
+};
+
+static const struct test *active;
+static volatile sig_atomic_t seen, signo, trap, error, ip_offset, flags;
+static volatile sig_atomic_t code, addr_ok, single_step, stepped, step_ok;
+
+static void handler(int sig, siginfo_t *info, void *context)
+{
+	ucontext_t *uc =3D context;
+	uintptr_t ip =3D uc->uc_mcontext.gregs[REG_IP];
+	uintptr_t start =3D (uintptr_t)active->run;
+	uintptr_t end =3D (uintptr_t)active->end;
+
+	if (seen && single_step && sig =3D=3D SIGTRAP) {
+		if (stepped++) {
+			ksft_print_msg("%s: second trace trap at %#lx\n",
+				       active->name, (unsigned long)ip);
+			_exit(KSFT_FAIL);
+		}
+		step_ok =3D ip =3D=3D (uintptr_t)active->step &&
+			uc->uc_mcontext.gregs[REG_TRAPNO] =3D=3D 1 &&
+			info->si_code =3D=3D TRAP_TRACE;
+		uc->uc_mcontext.gregs[REG_EFL] &=3D ~X86_EFLAGS_TF;
+		return;
+	}
+
+	if (seen || ip < start || ip > end) {
+		ksft_print_msg("%s: unexpected signal %d at %#lx\n",
+			       active->name, sig, (unsigned long)ip);
+		_exit(KSFT_FAIL);
+	}
+
+	signo =3D sig;
+	trap =3D uc->uc_mcontext.gregs[REG_TRAPNO];
+	error =3D uc->uc_mcontext.gregs[REG_ERR];
+	ip_offset =3D ip - start;
+	flags =3D uc->uc_mcontext.gregs[REG_EFL] & (X86_EFLAGS_RF | X86_EFLAGS_TF);
+	code =3D info->si_code;
+	/* force_sig() reports no address, force_sig_fault() reports the IP. */
+	addr_ok =3D info->si_addr =3D=3D (code =3D=3D SI_KERNEL ? NULL : (void *)ip=
);
+	seen =3D 1;
+	uc->uc_mcontext.gregs[REG_IP] =3D end;
+}
+
+static void wait_for_child(pid_t child, int *status)
+{
+	pid_t ret;
+
+	do {
+		ret =3D waitpid(child, status, 0);
+	} while (ret < 0 && errno =3D=3D EINTR);
+	if (ret !=3D child)
+		ksft_exit_fail_perror("waitpid");
+}
+
+/* Resume the tracee and check where the next stop lands. */
+static bool resume_to(pid_t child, int *status, int request, int sig,
+		      const void *ip, const char *what)
+{
+	struct user_regs_struct regs;
+
+	if (ptrace(request, child, 0, 0))
+		return false;
+	wait_for_child(child, status);
+	if (!WIFSTOPPED(*status)) {
+		ksft_print_msg("%s: tracee did not stop\n", what);
+		return false;
+	}
+	if (WSTOPSIG(*status) !=3D sig) {
+		ksft_print_msg("%s: stopped with signal %d, expected %d\n",
+			       what, WSTOPSIG(*status), sig);
+		return false;
+	}
+	if (ptrace(PTRACE_GETREGS, child, 0, &regs))
+		return false;
+	if ((unsigned long)regs.USER_IP !=3D (unsigned long)ip) {
+		ksft_print_msg("%s: stopped at %#lx, expected %#lx\n", what,
+			       (unsigned long)regs.USER_IP, (unsigned long)ip);
+		return false;
+	}
+	return true;
+}
+
+static bool set_ip(pid_t child, const void *ip, bool tf)
+{
+	struct user_regs_struct regs;
+
+	if (ptrace(PTRACE_GETREGS, child, 0, &regs))
+		return false;
+	regs.USER_IP =3D (unsigned long)ip;
+	if (tf)
+		regs.eflags |=3D X86_EFLAGS_TF;
+	return !ptrace(PTRACE_SETREGS, child, 0, &regs);
+}
+
+/*
+ * Exercise the tracer paths that resume through the fault frame rather than
+ * sigreturn. A stale FRED software event flag on that frame traps before the
+ * NOP executes instead of after it.
+ */
+static void test_ptrace(void)
+{
+	bool into =3D false, step =3D false, cont =3D false;
+	pid_t child;
+	int status;
+
+	child =3D fork();
+	if (child < 0)
+		ksft_exit_fail_perror("fork");
+	if (!child) {
+		if (ptrace(PTRACE_TRACEME, 0, 0, 0))
+			_exit(KSFT_FAIL);
+		/* Start from a breakpoint frame, not the syscall frame of raise(). */
+		asm volatile("int3");
+		_exit(KSFT_FAIL);
+	}
+
+	wait_for_child(child, &status);
+	if (!WIFSTOPPED(status) || WSTOPSIG(status) !=3D SIGTRAP)
+		goto out;
+	if (ptrace(PTRACE_SETOPTIONS, child, 0, PTRACE_O_EXITKILL))
+		goto out;
+
+	/* Single-step into the INT. The fault must report the INT's address. */
+	if (!set_ip(child, int2d, false))
+		goto out;
+	into =3D resume_to(child, &status, PTRACE_SINGLESTEP, SIGSEGV, int2d,
+			 "single-step into INT");
+	if (!into)
+		goto out;
+
+	/* Suppress SIGSEGV and single-step the NOP. */
+	if (!set_ip(child, int2d_end, false))
+		goto out;
+	step =3D resume_to(child, &status, PTRACE_SINGLESTEP, SIGTRAP, int2d_step,
+			 "single-step after INT");
+	if (!step)
+		goto out;
+
+	/* Fault again, then suppress SIGSEGV and continue with TF set. */
+	if (!set_ip(child, int2d, false))
+		goto out;
+	if (!resume_to(child, &status, PTRACE_CONT, SIGSEGV, int2d,
+		       "continue to INT"))
+		goto out;
+	if (!set_ip(child, int2d_end, true))
+		goto out;
+	cont =3D resume_to(child, &status, PTRACE_CONT, SIGTRAP, int2d_step,
+			 "continue with TF after INT");
+out:
+	if (WIFSTOPPED(status)) {
+		kill(child, SIGKILL);
+		wait_for_child(child, &status);
+	}
+	ksft_test_result(into, "ptrace single-step into INT faults at the INT\n");
+	ksft_test_result(step, "ptrace single-step after suppressing SIGSEGV\n");
+	ksft_test_result(cont, "ptrace continue with TF after suppressing SIGSEGV\n=
");
+}
+
+static bool cpu_has_fred(void)
+{
+	unsigned int eax, ebx, ecx, edx;
+
+	if (__get_cpuid_max(0, NULL) < 7)
+		return false;
+	__cpuid_count(7, 1, eax, ebx, ecx, edx);
+	return eax & (1 << 17);
+}
+
+int main(void)
+{
+	unsigned int i, tf;
+	int expected_flags, ok;
+
+	ksft_print_header();
+	ksft_set_plan(2 * ARRAY_SIZE(tests) + 3);
+	ksft_print_msg("CPU %s FRED\n", cpu_has_fred() ? "supports" : "lacks");
+	sethandler(SIGSEGV, handler, 0);
+	sethandler(SIGTRAP, handler, 0);
+	sethandler(SIGILL, handler, 0);
+
+	for (tf =3D 0; tf < 2; tf++) {
+		for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
+			active =3D &tests[i];
+			single_step =3D tf;
+			seen =3D signo =3D trap =3D error =3D ip_offset =3D flags =3D 0;
+			code =3D addr_ok =3D stepped =3D step_ok =3D 0;
+			expected_flags =3D active->flags | (tf ? X86_EFLAGS_TF : 0);
+			if (tf)
+				active->run_tf();
+			else
+				active->run();
+
+			ok =3D seen && signo =3D=3D active->signo && trap =3D=3D active->trap &&
+				error =3D=3D active->error && ip_offset =3D=3D active->ip_offset &&
+				flags =3D=3D expected_flags && code =3D=3D active->code && addr_ok &&
+				(!tf || (stepped && step_ok));
+			ksft_test_result(ok, "%s%s\n", active->name, tf ? " with TF" : "");
+			if (!ok) {
+				ksft_print_msg("got signal=3D%d trap=3D%d error=3D%#x ip=3D%d\n",
+					       signo, trap, error, ip_offset);
+				ksft_print_msg("got flags=3D%#x code=3D%d addr_ok=3D%d step_ok=3D%d\n",
+					       flags, code, addr_ok, step_ok);
+				ksft_print_msg("expected signal=3D%d trap=3D%d error=3D%#x ip=3D%d\n",
+					       active->signo, active->trap, active->error,
+					       active->ip_offset);
+				ksft_print_msg("expected flags=3D%#x code=3D%d\n",
+					       expected_flags, active->code);
+			}
+		}
+	}
+	test_ptrace();
+	ksft_finished();
+}
