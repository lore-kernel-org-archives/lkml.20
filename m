Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E000411A07
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223382; cv=none; b=qE52WI0X1cHHCtZWed3xlr4WzOnO4iIoOXbHeUze1S/hWI1SxMptHTfFj8skSLV7V/7e+BSYr3HwbSHhoR+AjhoUtauFAw8gm40aKSJ4Hq4dH+YsN1aiPcr2BlppCH4SS4FdE0gdjfe2KRaoznIP84P5Hx50jiCyWh2MuaB0Q6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223382; c=relaxed/simple;
	bh=8mdhDtcp+ktkBhsOXw21LIPphcxOMhbdoB2hbCly+IA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ak2GDxAS6THApkrOJNL/V8rGLKEA8nmBaYYqF8XbwQlpQURGNYTw0DeghtpbaJREufDDRe7+qQh0iFPhZ2l0bWkFfHKcBuOC5yGY0dtSL92WgV5sEDig3hVgz3a6ERvcH/EtAIHjW84KkTyLxrO3NRpPNZyd1MClWzUODhKFdWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AtdMNr2M; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AtdMNr2M"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cbf700ddccso1631042b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790223373; x=1790828173; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7omE5mskqIzejwV4pi0nJZ66+RS5YowQWq8HiVWV1Cs=;
        b=AtdMNr2M51agOsyVM1izKqfCTO0L+ePTSScHhXPPCTf8MASK8feAqlQwsPrihVmSRW
         ONeU/Y7Y3puqF0zxjyOE4U+j6Cr/B7JaTv5i3x39TGhJiVjWVnPCLADhKnA1xQ22DYnP
         fbIpg6EqKUZ3K6jsZbXPxwhuYe/Z0y6swW7D83bUJ3STDj3PzebB/TK61G3MFGnqJCCM
         h66eNy4j8Oml1qMHtAxhnh3ZAaS0usOtu63NjUtO7z/31sIvX6rucxZb1N621ikQoDNb
         iXq2VYsUjLWvWMgZI2FXc1HuG9+N6WVhcjeOEw/dXjfFcqHwI5dkRWHCias6t4feBHxp
         tM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790223373; x=1790828173;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7omE5mskqIzejwV4pi0nJZ66+RS5YowQWq8HiVWV1Cs=;
        b=laD8Sq/v8YNlibfmEZscIehYE9mtIwKiKEEusVa4spNIZnVspgK2WMjh5cGv2H6bdK
         Z6zEGRpmzFXm5zuBjvuRZ9PVceGTZcQtgEtE6hjTBOiF4SK6+As0le8jSgBfhe63zMMY
         HiEl1ZU5+8AlHFC/E+0xc7FUEq619oLa971ZsnxkTjrUu0RYSAOs4R80lsA4uz9ilBpa
         nDZDf55g4+YAa4HBDuHgDbjjd2Lv6lhLdGcN9SaTX5WwzPApG3B34iHHMttEQM+ksAR6
         OgL39V+qm7rED3qkjHLanZPLJtPmVeVQzv6IlAAuWrcH0T2spWUyrlpjXKtrifQeHW4H
         9Azg==
X-Gm-Message-State: AFuF++nYG8JJQGzHOwxOp/ropk4Kcyfwis3gzK9h9xtE8Nd2J9meoQPQ
	aCIF9uAd/8zFp6posWJFl7mYQvHUyLLuhRvsB/ucFE5JoryG3iJ1rxcmx0Tb5TH3kPpILbEVdSi
	hkpxUOA==
X-Received: from ilsb15.prod.google.com ([2002:a05:6e02:48f:b0:50d:9814:cccb])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:5395:b0:4b9:e5fa:8a11
 with SMTP id 5614622812f47-4d728f2aabbmr1350299b6e.22.1790223373129; Wed, 23
 Sep 2026 21:16:13 -0700 (PDT)
Date: Thu, 24 Sep 2026 04:16:03 +0000
In-Reply-To: <20260924041604.3209659-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924041604.3209659-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924041604.3209659-8-avagin@google.com>
Subject: [PATCH 7/7] selftests/x86: Add tests for signal frame FPU portability
From: Andrei Vagin <avagin@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Andrei Vagin <avagin@google.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

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

Reviewed-by: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Reviewed-by: Chang S. Bae <chang.seok.bae@intel.com>
Signed-off-by: Andrei Vagin <avagin@google.com>
---
 tools/testing/selftests/x86/Makefile          |   5 +-
 .../selftests/x86/sigframe_fpu_portability.c  | 246 ++++++++++++++++++
 tools/testing/selftests/x86/xstate.c          |  12 -
 tools/testing/selftests/x86/xstate.h          |  20 ++
 4 files changed, 270 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/x86/sigframe_fpu_portability.c

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index d478b13cc8d5..7565d2cf6a3c 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -19,7 +19,8 @@ TARGETS_C_32BIT_ONLY := entry_from_vm86 test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
 			vdso_restorer
 TARGETS_C_64BIT_ONLY := fsgsbase sysret_rip syscall_numbering \
-			corrupt_xstate_header amx lam test_shadow_stack avx apx
+			corrupt_xstate_header amx lam test_shadow_stack avx apx \
+			sigframe_fpu_portability
 # Some selftests require 32bit support enabled also on 64bit systems
 TARGETS_C_32BIT_NEEDED := ldt_gdt ptrace_syscall
 
@@ -138,3 +139,5 @@ $(OUTPUT)/avx_64: CFLAGS += -mno-avx -mno-avx512f
 $(OUTPUT)/amx_64: EXTRA_FILES += xstate.c
 $(OUTPUT)/avx_64: EXTRA_FILES += xstate.c
 $(OUTPUT)/apx_64: EXTRA_FILES += xstate.c
+
+$(OUTPUT)/sigframe_fpu_portability_64: CFLAGS += -mno-avx -mno-avx512f
diff --git a/tools/testing/selftests/x86/sigframe_fpu_portability.c b/tools/testing/selftests/x86/sigframe_fpu_portability.c
new file mode 100644
index 000000000000..cbf022fea800
--- /dev/null
+++ b/tools/testing/selftests/x86/sigframe_fpu_portability.c
@@ -0,0 +1,246 @@
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
+ * This test verifies the FPU portability and consistency of the signal frame.
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
+/* Use a raw syscall instead of raise() to avoid clobbering FPU registers. */
+static inline void raw_raise(int sig)
+{
+	register long rax asm("rax") = SYS_kill;
+	register long rdi asm("rdi") = self_pid;
+	register long rsi asm("rsi") = sig;
+
+	asm volatile ("syscall"
+		      : "+r" (rax)
+		      : "r" (rdi), "r" (rsi)
+		      : "rcx", "r11", "memory");
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
+	int left = SIGNAL_BUF_LEN - strlen(sig_err_buf) - 1;
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
+	xstate = get_xstate_info(XFEATURE_YMM);
+	if (!xstate.size)
+		ksft_exit_skip("AVX not supported by hardware\n");
+
+	ymm_offset = xstate.xbuf_offset;
+	xstate_size_ymm = xstate.xbuf_offset + xstate.size;
+}
+
+#define TEST_YMMH_VAL (0x5656565656565656UL)
+
+__attribute__((target("avx")))
+static void read_ymm0(uint64_t *v)
+{
+	asm volatile ("vmovdqu %%ymm0, %0" : "=m"  (*(char (*)[32])v));
+}
+
+__attribute__((target("avx")))
+static void write_ymm0(uint64_t *v)
+{
+	asm volatile ("vmovdqu %0, %%ymm0" : : "m"  (*(char (*)[32])v));
+}
+
+static void __handle_shrunk_xstate_size(int sig, siginfo_t *si, void *ucp, bool valid_size)
+{
+	uint64_t xfeatures, *ymmh_p;
+	struct xsave_buffer *xbuf;
+	struct _fpx_sw_bytes *sw;
+	ucontext_t *uc = ucp;
+	void *fp;
+
+	fp = uc->uc_mcontext.fpregs;
+	if (!fp) {
+		sig_print("fpregs is NULL\n");
+		return;
+	}
+
+	sw = get_fpx_sw_bytes(fp);
+	if (sw->magic1 != FP_XSTATE_MAGIC1) {
+		sig_print("magic1 is not valid\n");
+		return;
+	}
+
+	xbuf = (struct xsave_buffer *)fp;
+
+	/*
+	 * Both test cases shrink the frame to contain only AVX (FP + SSE + YMM).
+	 * If valid_size is true, set xstate_size to match the enabled features.
+	 * If valid_size is false, set xstate_size too small (SSE only), which
+	 * the kernel must reject.
+	 */
+	if (valid_size)
+		sw->xstate_size = xstate_size_ymm;
+	else
+		sw->xstate_size = XSTATE_SSE_ONLY_SIZE;
+
+	xfeatures = get_xstatebv(xbuf);
+	xfeatures &= XFEATURE_MASK_FPSSE | (1 << XFEATURE_YMM);
+	set_xstatebv(xbuf, xfeatures);
+	set_fpx_sw_bytes_features(fp, xfeatures);
+
+	*(uint32_t *)(fp + sw->xstate_size) = FP_XSTATE_MAGIC2;
+
+	if (valid_size) {
+		ymmh_p = (uint64_t *)(fp + ymm_offset);
+		ymmh_p[0] = TEST_YMMH_VAL;
+		ymmh_p[1] = TEST_YMMH_VAL + 1;
+	}
+
+	/* clear everything after MAGIC2. */
+	if (sw->xstate_size + FP_XSTATE_MAGIC2_SIZE < sw->extended_size)
+		memset(fp + sw->xstate_size + FP_XSTATE_MAGIC2_SIZE, 0,
+		       sw->extended_size - sw->xstate_size - FP_XSTATE_MAGIC2_SIZE);
+}
+
+static void handle_valid_shrunk_xstate_size(int sig, siginfo_t *si, void *ucp)
+{
+	__handle_shrunk_xstate_size(sig, si, ucp, true);
+}
+
+static void handle_invalid_shrunk_xstate_size(int sig, siginfo_t *si, void *ucp)
+{
+	__handle_shrunk_xstate_size(sig, si, ucp, false);
+}
+
+static void test_valid_shrunk_xstate_size(void)
+{
+	uint64_t v[4] = {0, 0, 0, 0};
+
+	sig_err_buf[0] = 0;
+	sethandler(SIGUSR1, handle_valid_shrunk_xstate_size, 0);
+
+	v[0] = 0x1111111111111111ULL;
+	v[1] = 0x2222222222222222ULL;
+	v[2] = 0x3333333333333333ULL;
+	v[3] = 0x4444444444444444ULL;
+	write_ymm0(v);
+
+	raw_raise(SIGUSR1);
+	v[0] = v[1] = v[2] = v[3] = 0;
+	read_ymm0(v);
+
+	if (sig_err_buf[0])
+		ksft_test_result_fail("%s\n", sig_err_buf);
+	else if (v[2] == TEST_YMMH_VAL && v[3] == (TEST_YMMH_VAL + 1))
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
+	uint64_t v[4] = {0, 0, 0, 0};
+
+	sig_err_buf[0] = 0;
+	sethandler(SIGUSR1, handle_invalid_shrunk_xstate_size, 0);
+	sethandler(SIGSEGV, handle_segv, 0);
+
+	if (sigsetjmp(segv_jmpbuf, 1) == 0) {
+		v[0] = 0x1111111111111111ULL;
+		v[1] = 0x2222222222222222ULL;
+		v[2] = 0x3333333333333333ULL;
+		v[3] = 0x4444444444444444ULL;
+		write_ymm0(v);
+
+		raw_raise(SIGUSR1);
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
+	self_pid = getpid();
+
+	check_avx_support();
+
+	test_valid_shrunk_xstate_size();
+	test_invalid_shrunk_xstate_size();
+
+	ksft_finished();
+	return 0;
+}
diff --git a/tools/testing/selftests/x86/xstate.c b/tools/testing/selftests/x86/xstate.c
index 97fe4bd8bc77..0ab577157cd7 100644
--- a/tools/testing/selftests/x86/xstate.c
+++ b/tools/testing/selftests/x86/xstate.c
@@ -34,18 +34,6 @@
 	 (1 << XFEATURE_XTILEDATA) |	\
 	 (1 << XFEATURE_APX))
 
-static inline uint64_t xgetbv(uint32_t index)
-{
-	uint32_t eax, edx;
-
-	asm volatile("xgetbv" : "=a" (eax), "=d" (edx) : "c" (index));
-	return eax + ((uint64_t)edx << 32);
-}
-
-static inline uint64_t get_xstatebv(struct xsave_buffer *xbuf)
-{
-	return *(uint64_t *)(&xbuf->header);
-}
 
 static struct xstate_info xstate;
 
diff --git a/tools/testing/selftests/x86/xstate.h b/tools/testing/selftests/x86/xstate.h
index 6ee816e7625a..eedf0cab7ccb 100644
--- a/tools/testing/selftests/x86/xstate.h
+++ b/tools/testing/selftests/x86/xstate.h
@@ -3,6 +3,8 @@
 #define __SELFTESTS_X86_XSTATE_H
 
 #include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
 
 #include "kselftest.h"
 
@@ -94,6 +96,14 @@ static inline void xrstor(struct xsave_buffer *xbuf, uint64_t rfbm)
 		     : : "D" (xbuf), "a" (rfbm_lo), "d" (rfbm_hi));
 }
 
+static inline uint64_t xgetbv(uint32_t index)
+{
+	uint32_t eax, edx;
+
+	asm volatile("xgetbv" : "=a" (eax), "=d" (edx) : "c" (index));
+	return eax + ((uint64_t)edx << 32);
+}
+
 #define CPUID_LEAF_XSTATE		0xd
 #define CPUID_SUBLEAF_XSTATE_USER	0x0
 
@@ -160,6 +170,11 @@ static inline void set_xstatebv(struct xsave_buffer *xbuf, uint64_t bv)
 	*(uint64_t *)(&xbuf->header) = bv;
 }
 
+static inline uint64_t get_xstatebv(struct xsave_buffer *xbuf)
+{
+	return *(uint64_t *)(&xbuf->header);
+}
+
 /* See 'struct _fpx_sw_bytes' at sigcontext.h */
 #define SW_BYTES_OFFSET		464
 /* N.B. The struct's field name varies so read from the offset. */
@@ -175,6 +190,11 @@ static inline uint64_t get_fpx_sw_bytes_features(void *buffer)
 	return *(uint64_t *)(buffer + SW_BYTES_BV_OFFSET);
 }
 
+static inline void set_fpx_sw_bytes_features(void *buffer, uint64_t features)
+{
+	*(uint64_t *)(buffer + SW_BYTES_BV_OFFSET) = features;
+}
+
 static inline void set_rand_data(struct xstate_info *xstate, struct xsave_buffer *xbuf)
 {
 	int *ptr = (int *)&xbuf->bytes[xstate->xbuf_offset];
-- 
2.56.0.rc1.310.g51773c2048-goog

