Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFA14E1C8D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601010; cv=none; b=bUGgtesWZh3FSaPw5zPFKjcoz/pfgNjgDZVNPG0JY+8zIJjuW4r/dVApChYs/HGmHt2zM61q0Yknw1n9KXWELbuJ3Zf2Nc8E8cnCnMdRmm4ocqlwvGrzvoSGsvuonPOBCB7UsuC//AzjXFWOeR4pRYD0ccIqkByUs8jRUUEWjME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601010; c=relaxed/simple;
	bh=VSDinFDuW0eGkOtmmVpaEPcgXQAROORcx5l5xBaUTJs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oYnwVOSKwZXp90HXJQBOSYoSAkNF68cfa2h553/4WsiMpneNPfqCTmgE0NVuoYllmGCHiNlxr8vJtQ4kc8M9TV68yUuypZCF3APN0KaP7QQMGwIllRWpLifvdCrR2IaWzU2HkbRAtEqUMQyZV5w+7oJV59r19XY3ymnvK7KkMM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ubY1ZMJc; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ubY1ZMJc"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b38ea4c6acso277589b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789601007; x=1790205807; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kiv1h3ez+21DDmFIeKd0/A5hdj5Vl12D1mvYw4I116Q=;
        b=ubY1ZMJcDtBJ6+V0Q5cc0BQIDGBCvWH/GkfDmJuMKRUU418nxoentdPt7snkxLU1bl
         UFGIFj5RdQvBsxbQ/vWD4Le4rwQ/Ab3XzB6hje0gWMhzW9IWnZxeCL2VELZ1V7jWBj7M
         i/JSP8q7fyX2ls4NMnB1wA6sAjwNhLgr6OVHcr6Ngb/opFaLjNrllPpuJtPkfGcXVIlF
         mkM+NFwTjGNmRpWElygh+wuRm+Rh0xHkdRSp+0sjs9DxuXQowNRcQDSgFSl2+0WReR66
         NCiQCVcVsjfZ4/gwx/g3OEIjaDFODZiijKKBGc99G8DuSV4FNwgNJKuppkC36XIFnsxx
         xRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789601007; x=1790205807;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kiv1h3ez+21DDmFIeKd0/A5hdj5Vl12D1mvYw4I116Q=;
        b=BPM44Iuk5xtfoGzmTlkOOrIJr1gc+rBUn0qU6iQU5Y6ZsPk5sVG69uN62U0YKZAL1d
         ZQTu/TkM1L62yIfAwX8LMRLA93dfWGmCCF4uYxb+p/f5Ska0xDQMnVHIMRJ+uzlvNTGt
         JCk5uQpfqoCxpABQseh9WW35wP/vuGmWFZASSKEFyI8f2/1z690e0uPSizirJArPz8RW
         chNlpogyoMBrSrxYncofqQAaiFz/LGNOIK+LefJh9RQzUkdmibDS1zZrQ5wGSqEtdS2i
         IKubxUTqkbxuQTBFQ1IJlHZ6ns4Y8sj73RKZWZNw0HOhEgMYBZ7Pc/D+kIP0g7cb/3Cc
         Kw4g==
X-Gm-Message-State: AFuF++nJ4JzrckX7k4cyKIi+rbEu0wRo3J98Apnui5ZfYnT0eEWAadEg
	deIRVZYsxWF0c6/wwQNICtVY4nNu5eGaGusUnyCq2IqJVixk502Gc9XQwcGH2ycke/6QIApznp2
	lpiBGKw==
X-Received: from ilow14.prod.google.com ([2002:a92:c88e:0:b0:509:30f8:6591])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:4f67:b0:4c3:e93e:e331
 with SMTP id 5614622812f47-4ca4c49ad67mr5407174b6e.30.1789601006782; Wed, 16
 Sep 2026 16:23:26 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:23:10 +0000
In-Reply-To: <20260916232310.490786-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260916232310.490786-1-avagin@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260916232310.490786-8-avagin@google.com>
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
 .../selftests/x86/sigframe_fpu_portability.c  | 245 ++++++++++++++++++
 tools/testing/selftests/x86/xstate.c          |  12 -
 tools/testing/selftests/x86/xstate.h          |  20 ++
 4 files changed, 269 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/x86/sigframe_fpu_portability.c

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 434065215d12..72071deda978 100644
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
index 000000000000..ec14f3c30093
--- /dev/null
+++ b/tools/testing/selftests/x86/sigframe_fpu_portability.c
@@ -0,0 +1,245 @@
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
+	struct xstate_info xstate;
+	uint32_t eax, ebx, ecx, edx;
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
+	ucontext_t *uc = ucp;
+	void *fp = uc->uc_mcontext.fpregs;
+	struct _fpx_sw_bytes *sw;
+	struct xsave_buffer *xbuf;
+	uint64_t xfeatures, *ymmh_p;
+
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
2.55.0.1082.g2b9226bbc0-goog

