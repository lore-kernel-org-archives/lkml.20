Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CC54E5355
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 23:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790724390; cv=none; b=JM2FQVEzmSM/8Dfy33+YCMcjeukFpJO9HbAPnKK7aL+VI6f+NtonoslaZven8n/6Qq3wM1l0v4BVTZgkdPMdBE9yFtdQgyjv6wmga2KrdJrUFc5TNFLV0dG2ECUkESquTu6LHa1bWmgLqgTNbHHtTxXVG1bZsVvVr+wJE//vsUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790724390; c=relaxed/simple;
	bh=4njdCDD4NwPaPf9CuYxHBI9aqBH4pQUtvUFvDMuVsyY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NzAK5tIVN1G55uWR1fHeD3UN6YYwx3PtWrBWCfyzhUwjlN0DOamOKdGEEjeGEZGVn3QpCxC8TVrZadn5q7yjbys7img1R+gVtj/8A1a4SL2qUanPl+ufPRety5rz5msWvxgqkfuZXePZDN1jZQU6DUmAi57yPkjdytz1tEEFb9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WnQ28xGs; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--avagin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WnQ28xGs"
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4cb254da90eso7773759b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790724387; x=1791329187; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6V29T/AfKRUoxa9mHLMrnlHXEon8APFNzL6kd+MWds=;
        b=WnQ28xGs2X6RrfPYThyNqc1DzK3RrZnP+99oUxTBHYz1BCnos4YrAr+nJPnzE2jonN
         n0MtrN+iYPGfV5raFijhH+WEyWfH94I/Cu2oTGnaSldGjUh1EKKLi6vZ7h2Tqqd++fmR
         96w09bASEouyGGlG5Jy2Q2XmX1fop0CN6KJG+AHHa1q5vcEQ9pwNO3eU/r+pGs2yF6lZ
         ClcjYMph37QmdC7nXu6BPe/yQDLQz4/iVDqHkiTTdrOeWmmbrDSE9IQkN0JLdcsGQwro
         3O9ZfWOwDEKgPpJTdfbMeWXq0Cw74Jy8r3y3gIxz2fVZnMJgQ4VJS37g/NRpVxlkk/VG
         wnhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790724387; x=1791329187;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6V29T/AfKRUoxa9mHLMrnlHXEon8APFNzL6kd+MWds=;
        b=T7YdJz6xyOuNWRmDj87qno5SFoHROJ2g6lhaN6wpjjuBAz8wz5DZt6KQlSoReLiHzF
         NcxX0Pws7V9S0SL54M7lV9EXVyNE+ZmX9pbCCQJEnFqT3GzsJHEylSy2xUqzOIhBWYxc
         eN+iGHE+vclGvhWRPp0sQ90WlLZiCLG5yAFz7LjUDHYq02cYvpjmi5MDMcUGF/b1h6VR
         hoAtFLTFSQksrrHNaT8SkTSDQ8UeVoaxaKGxgBTAtr3N57ZulhhAVlLALnDigPosGjgc
         WXsMJP7pWJGRwxv5ufzd+XtdPRgkPKVl8NAXSK1HzugQo53LaC5ObJThSD3AB+USeMEQ
         pCZg==
X-Gm-Message-State: AFuF++nbX5EZxdmt6tnrrcGZ9yfGfRBlNtCM8V+SRZZFzXKApBVtzPqb
	vaaXorimz4qiISlDEp2/mUnDTzM7cM29MWhMtbDiiY9cM9zTxWLYmQN2kXdpFbLyDZCNPuR0tSr
	c8sH0gw==
X-Received: from jacz22.prod.google.com ([2002:a05:6638:ad96:b0:5f9:53f0:85d6])
 (user=avagin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:2f0b:b0:4b9:e6ab:d07c
 with SMTP id 5614622812f47-4f074fcf2e9mr931206b6e.28.1790724387045; Tue, 29
 Sep 2026 16:26:27 -0700 (PDT)
Date: Tue, 29 Sep 2026 23:26:21 +0000
In-Reply-To: <20260929232621.3745312-1-avagin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260929232621.3745312-1-avagin@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260929232621.3745312-3-avagin@google.com>
Subject: [PATCH 2/2] selftests/x86: Check restoring FPU state with larger xstate_size
From: Andrei Vagin <avagin@google.com>
To: Borislav Petkov <bp@alien8.de>, "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, criu@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Andrei Vagin <avagin@google.com>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"

Extend sigframe_fpu_portability.c with two test cases for signal frames
whose xstate_size exceeds the current task's fpstate->user_size:

- test_valid_larger_xstate_size(): Verifies that the kernel restores FPU
  state from a signal frame with a larger xstate_size and an unsupported
  feature bit in _fpx_sw_bytes.xfeatures when the XSAVE header
  (XSTATE_BV) only contains supported features. This emulates migrating
  a process from a newer CPU to an older CPU when the process has not
  used any unsupported features.

- test_invalid_larger_xstate_size(): Verifies that the kernel rejects
  (via SIGSEGV) a signal frame with a larger xstate_size when the XSAVE
  header (XSTATE_BV) marks an unsupported feature as active.

Signed-off-by: Andrei Vagin <avagin@google.com>
---
 .../selftests/x86/sigframe_fpu_portability.c  | 118 ++++++++++++++++--
 1 file changed, 110 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/x86/sigframe_fpu_portability.c b/tools/testing/selftests/x86/sigframe_fpu_portability.c
index 8377de052032..afa9e6eab9b9 100644
--- a/tools/testing/selftests/x86/sigframe_fpu_portability.c
+++ b/tools/testing/selftests/x86/sigframe_fpu_portability.c
@@ -30,6 +30,14 @@
  * - test_invalid_shrunk_xstate_size:
  *   Verifies that the kernel rejects a frame if xstate_size is too small for
  *   the features enabled in xfeatures.
+ *
+ * - test_valid_larger_xstate_size:
+ *   Verifies that the kernel restores state from a frame with xstate_size
+ *   larger than the current task's size, if no unsupported features are active.
+ *
+ * - test_invalid_larger_xstate_size:
+ *   Verifies that the kernel rejects a frame with a larger xstate_size if it
+ *   contains unsupported features in the xsave header.
  */
 
 #define SIGFRAME_XSTATE_HDR_OFFSET	512
@@ -160,12 +168,13 @@ static void handle_invalid_shrunk_xstate_size(int sig, siginfo_t *si, void *ucp)
 	__handle_shrunk_xstate_size(sig, si, ucp, false);
 }
 
-static void test_valid_shrunk_xstate_size(void)
+static void run_valid_sigframe_test(void (*handler)(int, siginfo_t *, void *),
+				    const char *desc)
 {
 	uint64_t v[4];
 
 	sig_err_buf[0] = 0;
-	sethandler(SIGUSR1, handle_valid_shrunk_xstate_size, 0);
+	sethandler(SIGUSR1, handler, 0);
 
 	v[0] = 0x1111111111111111ULL;
 	v[1] = 0x2222222222222222ULL;
@@ -176,7 +185,7 @@ static void test_valid_shrunk_xstate_size(void)
 	if (sig_err_buf[0])
 		ksft_test_result_fail("%s\n", sig_err_buf);
 	else if (v[2] == TEST_YMMH_VAL && v[3] == (TEST_YMMH_VAL + 1))
-		ksft_test_result_pass("YMM state restored correctly from shrunk frame\n");
+		ksft_test_result_pass("%s\n", desc);
 	else
 		ksft_test_result_fail(
 				"Got upper bits: 0x%lx 0x%lx (expected %lx %lx)\n",
@@ -192,12 +201,13 @@ static void handle_segv(int sig, siginfo_t *si, void *ucp)
 	siglongjmp(segv_jmpbuf, 1);
 }
 
-static void test_invalid_shrunk_xstate_size(void)
+static void run_invalid_sigframe_test(void (*handler)(int, siginfo_t *, void *),
+				      const char *desc)
 {
 	uint64_t v[4];
 
 	sig_err_buf[0] = 0;
-	sethandler(SIGUSR1, handle_invalid_shrunk_xstate_size, 0);
+	sethandler(SIGUSR1, handler, 0);
 	sethandler(SIGSEGV, handle_segv, 0);
 
 	if (sigsetjmp(segv_jmpbuf, 1) == 0) {
@@ -206,7 +216,7 @@ static void test_invalid_shrunk_xstate_size(void)
 		v[2] = 0x3333333333333333ULL;
 		v[3] = 0x4444444444444444ULL;
 		raise_with_ymm0(SIGUSR1, v);
-		sig_print("Inconsistent size was NOT rejected\n");
+		sig_print("Invalid frame was NOT rejected\n");
 	}
 
 	clearhandler(SIGUSR1);
@@ -215,13 +225,103 @@ static void test_invalid_shrunk_xstate_size(void)
 	if (sig_err_buf[0])
 		ksft_test_result_fail("%s\n", sig_err_buf);
 	else
-		ksft_test_result_pass("Inconsistent size correctly rejected\n");
+		ksft_test_result_pass("%s\n", desc);
+}
+
+static void test_valid_shrunk_xstate_size(void)
+{
+	run_valid_sigframe_test(handle_valid_shrunk_xstate_size,
+				"YMM state restored correctly from shrunk frame");
+}
+
+static void test_invalid_shrunk_xstate_size(void)
+{
+	run_invalid_sigframe_test(handle_invalid_shrunk_xstate_size,
+				  "Inconsistent shrunk xstate_size correctly rejected");
+}
+
+static char fpu_buffer[8192] __attribute__((aligned(64)));
+#define UNSUPPORTED_XFEATURE (1ULL << 62)
+
+static void __handle_larger_xstate_size(int sig, siginfo_t *si, void *ucp, bool valid_xfeatures)
+{
+	uint64_t *ymmh_p, xfeatures;
+	struct xsave_buffer *xbuf;
+	struct _fpx_sw_bytes *sw;
+	ucontext_t *uc = ucp;
+	size_t copy_size;
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
+	copy_size = sw->xstate_size;
+	if (copy_size + 64 + FP_XSTATE_MAGIC2_SIZE > sizeof(fpu_buffer)) {
+		sig_print("fpu_buffer is too small\n");
+		return;
+	}
+
+	memset(fpu_buffer, 0, sizeof(fpu_buffer));
+	memcpy(fpu_buffer, fp, copy_size);
+
+	xbuf = (struct xsave_buffer *)fpu_buffer;
+	sw = get_fpx_sw_bytes(fpu_buffer);
+
+	sw->xstate_size += 64;
+	sw->extended_size += 64;
+	xfeatures = get_fpx_sw_bytes_features(fpu_buffer);
+	set_fpx_sw_bytes_features(fpu_buffer, xfeatures | UNSUPPORTED_XFEATURE);
+
+	*(uint32_t *)(fpu_buffer + sw->xstate_size) = FP_XSTATE_MAGIC2;
+
+	if (!valid_xfeatures) {
+		xfeatures = get_xstatebv(xbuf);
+		set_xstatebv(xbuf, xfeatures | UNSUPPORTED_XFEATURE);
+	}
+
+	ymmh_p = (uint64_t *)(fpu_buffer + ymm_offset);
+	ymmh_p[0] = TEST_YMMH_VAL;
+	ymmh_p[1] = TEST_YMMH_VAL + 1;
+
+	/* Update fpregs to point to the new buffer */
+	uc->uc_mcontext.fpregs = (fpregset_t)fpu_buffer;
+}
+
+static void handle_valid_larger_xstate_size(int sig, siginfo_t *si, void *ucp)
+{
+	__handle_larger_xstate_size(sig, si, ucp, true);
+}
+
+static void handle_invalid_larger_xstate_size(int sig, siginfo_t *si, void *ucp)
+{
+	__handle_larger_xstate_size(sig, si, ucp, false);
+}
+
+static void test_valid_larger_xstate_size(void)
+{
+	run_valid_sigframe_test(handle_valid_larger_xstate_size,
+				"YMM state restored correctly from larger frame");
+}
+
+static void test_invalid_larger_xstate_size(void)
+{
+	run_invalid_sigframe_test(handle_invalid_larger_xstate_size,
+				  "Unsupported feature in larger frame correctly rejected");
 }
 
 int main(void)
 {
 	ksft_print_header();
-	ksft_set_plan(2);
+	ksft_set_plan(4);
 
 	self_pid = getpid();
 
@@ -229,6 +329,8 @@ int main(void)
 
 	test_valid_shrunk_xstate_size();
 	test_invalid_shrunk_xstate_size();
+	test_valid_larger_xstate_size();
+	test_invalid_larger_xstate_size();
 
 	ksft_finished();
 	return 0;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

