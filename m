Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12AA39CD0B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915142; cv=none; b=mhCXYCoQL2LlnZ7MOBlAzz8ty1Ee1BPCxuuwSsiB1N+OtDXkNw5UyfUpOEWtG7pTuUDM75gRfdpamRrBl5W1d279w05/+q1EUa3JV8f1v0vGchn4JlTitPlOzyuChuyfvQHE62ckL/Q3YoxVgE0BTNmIlX7PA8GoP8Wrw/hY124=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915142; c=relaxed/simple;
	bh=zC5Qz8CvNSnwUCO1Efe7t6JsNB0ur9ADcf2Fjx1Cvrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gnoxu4W3vnzHhwj9iHA4tyi90hfxXS7FdLIhg9ARLiT4YK7HMNVABkF885SOEkgckLbku00ftFNc9QGbwsFHAwp52dB+jQ1ETvHjGIhCB5Xr/U+72Be51c/wye+jCZG2FaQoC8W2HeM79Jb3635Ie9abR+aDZti9weyQBg2e9k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alexmoch.com; spf=pass smtp.mailfrom=alexmoch.com; dkim=pass (2048-bit key) header.d=alexmoch.com header.i=@alexmoch.com header.b=x3QzD1DN; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alexmoch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alexmoch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alexmoch.com header.i=@alexmoch.com header.b="x3QzD1DN"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hnprp0833zMlC7;
	Sun, 20 Sep 2026 16:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexmoch.com;
	s=MBO0001; t=1789915130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AuFxO4aFhssuuoGbvU5Cu3XtAgw4VLGqXufWipZ+9QY=;
	b=x3QzD1DNtk510eTIza+No0dT2lqKYLgrx1j0WgsDyPt24jYpEVXbbX6sLkPHN1NnITs9o8
	219UDSX0miiM865NZdMB+dUZfHeTn5AUCVyQtdky1bgMhHgqxFTPQ7W8bEiKLwdZR80AjM
	jZhQheaLzeUkfrChG38aYeej1tgTFFBO5m5y60/ArzHI7saYFrLP1t+iAERSAEdYPhIl12
	WFQZ/hVG2GaooEEyMJxNjczGbiJ35fv4aEA7pZMbVcg+MC+99XMeOqDyn1hf0bOjLsz3Qr
	OBc0Co2eNynrIcjM2ABsvZO17kw9kMsDrQoihBQXsueIzTLwCEONA54pN5sBRQ==
From: Alexander Moch <mail@alexmoch.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org,
	Alexander Moch <mail@alexmoch.com>
Subject: [PATCH] objtool: Use AT_MINSIGSTKSZ to size the sigaltstack
Date: Sun, 20 Sep 2026 16:38:15 +0200
Message-ID: <20260920143815.32426-1-mail@alexmoch.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_signal_handler() allocates its alternate signal stack with SIGSTKSZ.
Built against musl on x86-64 that is a compile-time 8192, whatever the CPU
it ends up running on turns out to need.

The C library refuses a stack below its own minimum, and that minimum
follows the kernel: musl's sigaltstack() rejects anything smaller than
sysconf(_SC_MINSIGSTKSZ), which it derives from AT_MINSIGSTKSZ, and the
kernel grows that figure with the xsave area.  On a machine with AMX it is
11952, so the 8192 objtool asks for is refused and objtool exits before
doing any work:

  error: objtool [signal.c:118]: init_signal_handler: sigaltstack failed: Out of memory

Ask the kernel instead of assuming.  It publishes the size a signal frame
needs as AT_MINSIGSTKSZ, and the handler still has to run in what is left
above that, so add SIGSTKSZ on top, which is what
tools/testing/selftests/x86/sigaltstack.c already does.  Where the auxv
entry is absent, before v5.14, getauxval() returns 0 and the result is
SIGSTKSZ, as today.

Fixes: 799647ddb4c0 ("objtool: Add more robust signal error handling, detect and warn about stack overflows")
Signed-off-by: Alexander Moch <mail@alexmoch.com>
---
Found on an Alpine Linux (musl) runner in the OpenZFS CI on GitHub Actions,
where configure reported CONFIG_MODULES as unset on a kernel that has it
set to y.

I have no AMX hardware, so to confirm the fix I ran a separate experiment
on GitHub Actions, one that builds no OpenZFS at all: forty runners each
fetched this tree, built objtool twice -- once unmodified, once with this
patch -- and ran both.  Four of them reported an AT_MINSIGSTKSZ of 11952,
on three Intel Xeon 6973P-C and one Platinum 8573C under Linux 6.18.35.  On
every one of those four the unmodified binary failed where the patched one
started:

Unpatched:
  error: objtool [signal.c:118]: init_signal_handler: sigaltstack failed: Out of memory

Patched:
   Usage: objtool <actions> [<options>] file.o

There the patch asks for 11952 + 8192 = 20144 bytes, and that is accepted.
The other thirty-six runners reported an AT_MINSIGSTKSZ of 1776, 3376 or
3632, each below the 8192 objtool asks for unpatched, so both binaries ran
on those.  The model name does not decide which you get: three further
Platinum 8573C runners in the same batch reported 3632, so an affected
fleet can fail a build and pass the retry.  Built with objtool's own
-Werror -Wall -Wextra.

 tools/objtool/signal.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/signal.c b/tools/objtool/signal.c
index af5c65c0fb2d..8f86c79adbfb 100644
--- a/tools/objtool/signal.c
+++ b/tools/objtool/signal.c
@@ -9,11 +9,16 @@
 #include <signal.h>
 #include <unistd.h>
 #include <sys/resource.h>
+#include <sys/auxv.h>
 #include <string.h>
 
 #include <objtool/objtool.h>
 #include <objtool/warn.h>
 
+#ifndef AT_MINSIGSTKSZ
+#define AT_MINSIGSTKSZ	51
+#endif
+
 static unsigned long stack_limit;
 
 static bool is_stack_overflow(void *fault_addr)
@@ -101,17 +106,26 @@ int init_signal_handler(void)
 {
 	int signals[] = {SIGSEGV, SIGBUS, SIGILL, SIGABRT};
 	struct sigaction sa;
+	long stack_size;
 	stack_t ss;
 
 	if (read_stack_limit())
 		return -1;
 
-	ss.ss_sp = malloc(SIGSTKSZ);
+	/*
+	 * SIGSTKSZ is a compile-time constant here and can be smaller
+	 * than the signal frame on the running CPU.  Ask the kernel how
+	 * big that frame is, and leave SIGSTKSZ on top of it for the
+	 * handler.  Before v5.14 getauxval() returns 0, leaving SIGSTKSZ.
+	 */
+	stack_size = getauxval(AT_MINSIGSTKSZ) + SIGSTKSZ;
+
+	ss.ss_sp = malloc(stack_size);
 	if (!ss.ss_sp) {
 		ERROR_GLIBC("malloc");
 		return -1;
 	}
-	ss.ss_size = SIGSTKSZ;
+	ss.ss_size = stack_size;
 	ss.ss_flags = 0;
 
 	if (sigaltstack(&ss, NULL) == -1) {

base-commit: 73ae59e975966d24e32926247ddb45a537ebe184
-- 
2.55.0

