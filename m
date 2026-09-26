Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DF7262D0B;
	Sat, 26 Sep 2026 01:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790385163; cv=none; b=omu7bredAOE9BsWEXNrRBKSNMb6Dsspg00kj2K9IxtckKmTxSdR1D4LzorBeW3VwENJF1p0NZ6qFwCoYGxrB6pbAVwVk7EDCSLW0ZGV0P8qdMesHpII4SV8LsyO7le1T+dfzDAVM6T6mhw1tS/XQKXnv2ei5yqA7908liYYFHTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790385163; c=relaxed/simple;
	bh=FSETBYNc/zDy0+keM/XObyiUbgq1FZAFnm+2irOb4LU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=RRW9YQhWXlTZXaDn8Vut6WwR+6ukjtv3pe5F3OfcE4X6MZS4/JmV/bkXeZClRB77Ay9y0OBwVRH0nF0pvsB5Pm36dOkOiA2fkZMtYpVv9zb7ykvtgk+A2Tm2qSD6xH2rn3hnDz2TJGJgmrXBKR7F9jno1WBQK5IDGXAIHduIQDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JWIvg641; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CDv3JW9r; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JWIvg641";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CDv3JW9r"
Date: Sat, 26 Sep 2026 01:12:37 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790385159;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/u5yhGk1XfcSX5WHWFJo+pDHLDtlVTqhfwXTKGnIqaw=;
	b=JWIvg641xzSCXLcLNAvEe8UeumfMKBw9nLcKqmg8qZS2IMNRB4HkSNJfR8Pe+Af00inKnk
	TbTYLatGVvwkGgr9A/rJfaEuGQofxEhE6m1lfDJKPZx1Thfu/ll4H+AhfB5AJw92oZ5mdw
	5hkVsQRt6cXTQzsJGMKBCJTxERBd4w/b57oiUM+c43/MVxBSMyXJAFxl4AsDzBFbV4exV3
	EXfu2xZUHLQZuKBIFDwzgEAL16CBuAoPQj4jrYdGftt/F2WHnkHl3S5qbabLVg59DJZm63
	vQpurIHFSrBDBCtXfUVYhqrD/An7sI/lrnfggjsgynCIrUmF2sYiVxdzHnTxmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790385159;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/u5yhGk1XfcSX5WHWFJo+pDHLDtlVTqhfwXTKGnIqaw=;
	b=CDv3JW9r+Y4F91PwsB+cbARj3S2dgFgVH83oE8NRmFKMEQbZpfihiz16Yu5+ZCp3Grgwyw
	wA7eNaw6sU8x/OBg==
From: "tip-bot2 for Andrei Vagin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: x86/fpu] selftests/x86: Add tests for signal frame FPU portability
Cc: Andrei Vagin <avagin@google.com>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Alexander Mikhalitsyn <alexander@mihalicyn.com>,
 "Chang S. Bae" <chang.seok.bae@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925162454.1403405-8-avagin@google.com>
References: <20260925162454.1403405-8-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179038515711.3910103.15332227196955654581.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     391cac638eddae8f4a0a8dc8168a260f939eb3eb
Gitweb:        https://git.kernel.org/tip/391cac638eddae8f4a0a8dc8168a260f939=
eb3eb
Author:        Andrei Vagin <avagin@google.com>
AuthorDate:    Fri, 25 Sep 2026 16:24:53=20
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 25 Sep 2026 12:43:41 -07:00

selftests/x86: Add tests for signal frame FPU portability

Add a new selftest tools/testing/selftests/x86/sigframe_fpu_portability.c
to verify signal frame portability and consistency when the xstate size
is shrunk:

- test_valid_shrunk_xstate_size: Verifies that the kernel correctly
  restores the xstate context from a signal frame where xstate_size has
  been manually shrunk to only cover active features, as long as the
  FP_XSTATE_MAGIC2 marker is correctly placed. This simulates migrating
  a process created on a host with fewer xstate features to a host with
  more features.

- test_invalid_shrunk_xstate_size: Verifies that the kernel rejects
  (via SIGSEGV) a signal frame where xstate_size is smaller than required
  by the enabled features in the xfeatures mask.

Signed-off-by: Andrei Vagin <avagin@google.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
Link: https://patch.msgid.link/20260925162454.1403405-8-avagin@google.com
---
 tools/testing/selftests/x86/Makefile                   |   5 +-
 tools/testing/selftests/x86/sigframe_fpu_portability.c | 235 ++++++++-
 tools/testing/selftests/x86/xstate.c                   |  12 +-
 tools/testing/selftests/x86/xstate.h                   |  20 +-
 4 files changed, 259 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/x86/sigframe_fpu_portability.c

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x=
86/Makefile
index 4340652..72071de 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -19,7 +19,8 @@ TARGETS_C_32BIT_ONLY :=3D entry_from_vm86 test_syscall_vdso=
 unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
 			vdso_restorer
 TARGETS_C_64BIT_ONLY :=3D fsgsbase sysret_rip syscall_numbering \
-			corrupt_xstate_header amx lam test_shadow_stack avx apx
+			corrupt_xstate_header amx lam test_shadow_stack avx apx \
+			sigframe_fpu_portability
 # Some selftests require 32bit support enabled also on 64bit systems
 TARGETS_C_32BIT_NEEDED :=3D ldt_gdt ptrace_syscall
=20
@@ -138,3 +139,5 @@ $(OUTPUT)/avx_64: CFLAGS +=3D -mno-avx -mno-avx512f
 $(OUTPUT)/amx_64: EXTRA_FILES +=3D xstate.c
 $(OUTPUT)/avx_64: EXTRA_FILES +=3D xstate.c
 $(OUTPUT)/apx_64: EXTRA_FILES +=3D xstate.c
+
+$(OUTPUT)/sigframe_fpu_portability_64: CFLAGS +=3D -mno-avx -mno-avx512f
diff --git a/tools/testing/selftests/x86/sigframe_fpu_portability.c b/tools/t=
esting/selftests/x86/sigframe_fpu_portability.c
new file mode 100644
index 0000000..8377de0
--- /dev/null
+++ b/tools/testing/selftests/x86/sigframe_fpu_portability.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <signal.h>
+#include <string.h>
+#include <sys/ucontext.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <stdbool.h>
+#include <cpuid.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+#include <stddef.h>
+#include <setjmp.h>
+
+#include "helpers.h"
+#include "xstate.h"
+
+#ifndef FP_XSTATE_MAGIC2_SIZE
+#define FP_XSTATE_MAGIC2_SIZE	sizeof(FP_XSTATE_MAGIC2)
+#endif
+
+/*
+ * This test verifies the FPU portability and consistency of the signal fram=
e.
+ *
+ * - test_valid_shrunk_xstate_size:
+ *   Verifies that the kernel restores state from a frame with xstate_size
+ *   shrunk to only include active features.
+ *
+ * - test_invalid_shrunk_xstate_size:
+ *   Verifies that the kernel rejects a frame if xstate_size is too small for
+ *   the features enabled in xfeatures.
+ */
+
+#define SIGFRAME_XSTATE_HDR_OFFSET	512
+#define XSTATE_SSE_ONLY_SIZE	(SIGFRAME_XSTATE_HDR_OFFSET + XSAVE_HDR_SIZE)
+#define XFEATURE_MASK_FPSSE	((1 << XFEATURE_FP) | (1 << XFEATURE_SSE))
+
+static uint32_t ymm_offset;
+static uint32_t xstate_size_ymm;
+static pid_t self_pid;
+
+/*
+ * Load %ymm0 from @v, invoke SYS_kill to deliver @sig, and store the
+ * restored %ymm0 state back into @v within a single inline assembly
+ * block so the compiler cannot clobber %xmm0/%ymm0 between steps.
+ */
+__attribute__((target("avx")))
+static void raise_with_ymm0(int sig, uint64_t *v)
+{
+	register long rax asm("rax") =3D SYS_kill;
+	register long rdi asm("rdi") =3D self_pid;
+	register long rsi asm("rsi") =3D sig;
+
+	asm volatile ("vmovdqu %0, %%ymm0\n\t"
+		      "syscall\n\t"
+		      "vmovdqu %%ymm0, %0"
+		      : "+m" (*(char (*)[32])v), "+r" (rax)
+		      : "r" (rdi), "r" (rsi)
+		      : "rcx", "r11", "ymm0", "memory");
+}
+
+/*
+ * Avoid using printf() in signal handlers as it is not
+ * async-signal-safe.
+ */
+#define SIGNAL_BUF_LEN 1024
+static char sig_err_buf[SIGNAL_BUF_LEN];
+
+static void sig_print(const char *msg)
+{
+	int left =3D SIGNAL_BUF_LEN - strlen(sig_err_buf) - 1;
+
+	strncat(sig_err_buf, msg, left);
+}
+
+static void check_avx_support(void)
+{
+	uint32_t eax, ebx, ecx, edx;
+	struct xstate_info xstate;
+
+	/* Check CPUID.01H:ECX.OSXSAVE[bit 27] before calling xgetbv to avoid #UD */
+	__cpuid(1, eax, ebx, ecx, edx);
+	if (!(ecx & (1 << 27)))
+		ksft_exit_skip("OSXSAVE not enabled by OS\n");
+
+	/* Check XCR0[2] (YMM) is enabled by OS */
+	if (!(xgetbv(0) & (1 << XFEATURE_YMM)))
+		ksft_exit_skip("AVX (YMM) not enabled in XCR0\n");
+
+	xstate =3D get_xstate_info(XFEATURE_YMM);
+	if (!xstate.size)
+		ksft_exit_skip("AVX not supported by hardware\n");
+
+	ymm_offset =3D xstate.xbuf_offset;
+	xstate_size_ymm =3D xstate.xbuf_offset + xstate.size;
+}
+
+#define TEST_YMMH_VAL (0x5656565656565656UL)
+
+static void __handle_shrunk_xstate_size(int sig, siginfo_t *si, void *ucp, b=
ool valid_size)
+{
+	uint64_t xfeatures, *ymmh_p;
+	struct xsave_buffer *xbuf;
+	struct _fpx_sw_bytes *sw;
+	ucontext_t *uc =3D ucp;
+	void *fp;
+
+	fp =3D uc->uc_mcontext.fpregs;
+	if (!fp) {
+		sig_print("fpregs is NULL\n");
+		return;
+	}
+
+	sw =3D get_fpx_sw_bytes(fp);
+	if (sw->magic1 !=3D FP_XSTATE_MAGIC1) {
+		sig_print("magic1 is not valid\n");
+		return;
+	}
+
+	xbuf =3D (struct xsave_buffer *)fp;
+
+	/*
+	 * Both test cases shrink the frame to contain only AVX (FP + SSE + YMM).
+	 * If valid_size is true, set xstate_size to match the enabled features.
+	 * If valid_size is false, set xstate_size too small (SSE only), which
+	 * the kernel must reject.
+	 */
+	if (valid_size)
+		sw->xstate_size =3D xstate_size_ymm;
+	else
+		sw->xstate_size =3D XSTATE_SSE_ONLY_SIZE;
+
+	xfeatures =3D get_xstatebv(xbuf);
+	xfeatures &=3D XFEATURE_MASK_FPSSE | (1 << XFEATURE_YMM);
+	set_xstatebv(xbuf, xfeatures);
+	set_fpx_sw_bytes_features(fp, xfeatures);
+
+	*(uint32_t *)(fp + sw->xstate_size) =3D FP_XSTATE_MAGIC2;
+
+	if (valid_size) {
+		ymmh_p =3D (uint64_t *)(fp + ymm_offset);
+		ymmh_p[0] =3D TEST_YMMH_VAL;
+		ymmh_p[1] =3D TEST_YMMH_VAL + 1;
+	}
+
+	/* clear everything after MAGIC2. */
+	if (sw->xstate_size + FP_XSTATE_MAGIC2_SIZE < sw->extended_size)
+		memset(fp + sw->xstate_size + FP_XSTATE_MAGIC2_SIZE, 0,
+		       sw->extended_size - sw->xstate_size - FP_XSTATE_MAGIC2_SIZE);
+}
+
+static void handle_valid_shrunk_xstate_size(int sig, siginfo_t *si, void *uc=
p)
+{
+	__handle_shrunk_xstate_size(sig, si, ucp, true);
+}
+
+static void handle_invalid_shrunk_xstate_size(int sig, siginfo_t *si, void *=
ucp)
+{
+	__handle_shrunk_xstate_size(sig, si, ucp, false);
+}
+
+static void test_valid_shrunk_xstate_size(void)
+{
+	uint64_t v[4];
+
+	sig_err_buf[0] =3D 0;
+	sethandler(SIGUSR1, handle_valid_shrunk_xstate_size, 0);
+
+	v[0] =3D 0x1111111111111111ULL;
+	v[1] =3D 0x2222222222222222ULL;
+	v[2] =3D 0x3333333333333333ULL;
+	v[3] =3D 0x4444444444444444ULL;
+	raise_with_ymm0(SIGUSR1, v);
+
+	if (sig_err_buf[0])
+		ksft_test_result_fail("%s\n", sig_err_buf);
+	else if (v[2] =3D=3D TEST_YMMH_VAL && v[3] =3D=3D (TEST_YMMH_VAL + 1))
+		ksft_test_result_pass("YMM state restored correctly from shrunk frame\n");
+	else
+		ksft_test_result_fail(
+				"Got upper bits: 0x%lx 0x%lx (expected %lx %lx)\n",
+			       v[2], v[3], TEST_YMMH_VAL, TEST_YMMH_VAL + 1);
+
+	clearhandler(SIGUSR1);
+}
+
+static sigjmp_buf segv_jmpbuf;
+
+static void handle_segv(int sig, siginfo_t *si, void *ucp)
+{
+	siglongjmp(segv_jmpbuf, 1);
+}
+
+static void test_invalid_shrunk_xstate_size(void)
+{
+	uint64_t v[4];
+
+	sig_err_buf[0] =3D 0;
+	sethandler(SIGUSR1, handle_invalid_shrunk_xstate_size, 0);
+	sethandler(SIGSEGV, handle_segv, 0);
+
+	if (sigsetjmp(segv_jmpbuf, 1) =3D=3D 0) {
+		v[0] =3D 0x1111111111111111ULL;
+		v[1] =3D 0x2222222222222222ULL;
+		v[2] =3D 0x3333333333333333ULL;
+		v[3] =3D 0x4444444444444444ULL;
+		raise_with_ymm0(SIGUSR1, v);
+		sig_print("Inconsistent size was NOT rejected\n");
+	}
+
+	clearhandler(SIGUSR1);
+	clearhandler(SIGSEGV);
+
+	if (sig_err_buf[0])
+		ksft_test_result_fail("%s\n", sig_err_buf);
+	else
+		ksft_test_result_pass("Inconsistent size correctly rejected\n");
+}
+
+int main(void)
+{
+	ksft_print_header();
+	ksft_set_plan(2);
+
+	self_pid =3D getpid();
+
+	check_avx_support();
+
+	test_valid_shrunk_xstate_size();
+	test_invalid_shrunk_xstate_size();
+
+	ksft_finished();
+	return 0;
+}
diff --git a/tools/testing/selftests/x86/xstate.c b/tools/testing/selftests/x=
86/xstate.c
index 97fe4bd..0ab5771 100644
--- a/tools/testing/selftests/x86/xstate.c
+++ b/tools/testing/selftests/x86/xstate.c
@@ -34,18 +34,6 @@
 	 (1 << XFEATURE_XTILEDATA) |	\
 	 (1 << XFEATURE_APX))
=20
-static inline uint64_t xgetbv(uint32_t index)
-{
-	uint32_t eax, edx;
-
-	asm volatile("xgetbv" : "=3Da" (eax), "=3Dd" (edx) : "c" (index));
-	return eax + ((uint64_t)edx << 32);
-}
-
-static inline uint64_t get_xstatebv(struct xsave_buffer *xbuf)
-{
-	return *(uint64_t *)(&xbuf->header);
-}
=20
 static struct xstate_info xstate;
=20
diff --git a/tools/testing/selftests/x86/xstate.h b/tools/testing/selftests/x=
86/xstate.h
index 6ee816e..eedf0ca 100644
--- a/tools/testing/selftests/x86/xstate.h
+++ b/tools/testing/selftests/x86/xstate.h
@@ -3,6 +3,8 @@
 #define __SELFTESTS_X86_XSTATE_H
=20
 #include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
=20
 #include "kselftest.h"
=20
@@ -94,6 +96,14 @@ static inline void xrstor(struct xsave_buffer *xbuf, uint6=
4_t rfbm)
 		     : : "D" (xbuf), "a" (rfbm_lo), "d" (rfbm_hi));
 }
=20
+static inline uint64_t xgetbv(uint32_t index)
+{
+	uint32_t eax, edx;
+
+	asm volatile("xgetbv" : "=3Da" (eax), "=3Dd" (edx) : "c" (index));
+	return eax + ((uint64_t)edx << 32);
+}
+
 #define CPUID_LEAF_XSTATE		0xd
 #define CPUID_SUBLEAF_XSTATE_USER	0x0
=20
@@ -160,6 +170,11 @@ static inline void set_xstatebv(struct xsave_buffer *xbu=
f, uint64_t bv)
 	*(uint64_t *)(&xbuf->header) =3D bv;
 }
=20
+static inline uint64_t get_xstatebv(struct xsave_buffer *xbuf)
+{
+	return *(uint64_t *)(&xbuf->header);
+}
+
 /* See 'struct _fpx_sw_bytes' at sigcontext.h */
 #define SW_BYTES_OFFSET		464
 /* N.B. The struct's field name varies so read from the offset. */
@@ -175,6 +190,11 @@ static inline uint64_t get_fpx_sw_bytes_features(void *b=
uffer)
 	return *(uint64_t *)(buffer + SW_BYTES_BV_OFFSET);
 }
=20
+static inline void set_fpx_sw_bytes_features(void *buffer, uint64_t features)
+{
+	*(uint64_t *)(buffer + SW_BYTES_BV_OFFSET) =3D features;
+}
+
 static inline void set_rand_data(struct xstate_info *xstate, struct xsave_bu=
ffer *xbuf)
 {
 	int *ptr =3D (int *)&xbuf->bytes[xstate->xbuf_offset];
