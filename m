Received: from va-1-114.ptr.blmpb.com (va-1-114.ptr.blmpb.com [209.127.230.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7BC3C1983
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791439357; cv=none; b=N5K8ZP8ESKOhloAnWb3VKTmvYKUgLM0Qbwnd6RI3LKIW0cIo7OFljh6vbAGA8zHI7XS7xXEIBWUQkGI2mihyigDySMYwXNJgwaNqRR5ilXm8GSjPMuUiKNxM8d+CqS2a+yEO35Fbtebw2XZ61bLkAhxIxyBupl8wvEc9EBK/4/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791439357; c=relaxed/simple;
	bh=/7W+p5q8W7ELfsDQRoOn9L3ahbX+2yLO+RzpZxdqYD4=;
	h=To:Message-Id:Mime-Version:From:Subject:References:Content-Type:
	 Cc:Date:In-Reply-To; b=rbeSJOA+szN0NhQbD+nP9RatWFudd5etoR1poVlxpS2rirJCUF/PZYwQFM4dwRqnA6Sg1OS2DTr/9ZcoVRwxQmy3mbMh931InaKYFtANmYDbGQrUUbRVBrcAxRaBKbZAPkP/WQmKNUyZNPE4fh3uEB22twK/RInUelAtCX09QAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WASNs8ZQ; arc=none smtp.client-ip=209.127.230.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WASNs8ZQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791439343; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=9lOUfmTQUxCK7uaJg5PjGqEKKx8509Dflb3S9NiI/Lo=;
 b=WASNs8ZQoerroY7ytwHrxc823OwA4Bsdx2IybO5BYqaA10pMT48yCeWySfQeu4p1BhuXtk
 Iew2UhoV+u0H/xHrxNT2tEPPTp9NW2Ye+voZ+BKOc4m4p70B94i6JcJl4a+NsL2WDwEjag
 0U6spR4FL+gWj5wvQ9yuEyC0l46LSPLfLeKBCyj+WvaoQ9JXkW46pfBbzBvm5AMJS+CKvJ
 mm5LjVicAsELMMZoYHi9VaUFunZAIlgtH2b0pBXWwuZGg2aBLiNFo/OXJjA7g1mElmg775
 +kfS6DuIl8avbFlHPRQuKFHd1ekuK8zB0tK1PJfjNT9OxHP5pKW8vOjT0HLUGg==
To: <x86@kernel.org>
Message-Id: <11ea12962bda75b3e8ef845084546647f79eca38.1791428412.git.weiguixiong@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: "Guixiong Wei" <weiguixiong@bytedance.com>
Subject: [PATCH v2 2/2] selftests/x86/amx: Test dynamic fpstate cleanup across exec()
Content-Transfer-Encoding: 7bit
X-Mailer: git-send-email 2.55.0
X-Lms-Return-Path: <lba+26ac731ed+e7a13a+vger.kernel.org+weiguixiong@bytedance.com>
X-Original-From: Guixiong Wei <weiguixiong@bytedance.com>
References: <cover.1791428412.git.weiguixiong@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: "Guixiong Wei" <weiguixiong@bytedance.com>, 
	"Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>, 
	"Borislav Petkov" <bp@alien8.de>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"H . Peter Anvin" <hpa@zytor.com>, 
	"Chang S . Bae" <chang.seok.bae@intel.com>, 
	"Shuah Khan" <shuah@kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-kselftest@vger.kernel.org>
Date: Thu,  8 Oct 2026 13:59:36 +0800
In-Reply-To: <cover.1791428412.git.weiguixiong@bytedance.com>

An AMX task gets a dynamically allocated fpstate after requesting
XTILEDATA permission and first loading tile data. Test that exec()
releases this allocation instead of making it unreachable.

Run ten request, XRSTOR and self-exec cycles in the same task. Count the
matching allocations in /proc/vmallocinfo before the test, while the
first allocation is live and after the task exits. Skip the test when
/proc/vmallocinfo is unavailable or when concurrent global vmalloc
changes prevent an isolated measurement.

The test observed 10 leaked allocations on an unfixed kernel and zero
with the fix applied.

Signed-off-by: Guixiong Wei <weiguixiong@bytedance.com>
---
 tools/testing/selftests/x86/amx.c | 144 +++++++++++++++++++++++++++++-
 1 file changed, 143 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/amx.c b/tools/testing/selftests/x86/amx.c
index 40769c16de1bb..cf098dfbe50c0 100644
--- a/tools/testing/selftests/x86/amx.c
+++ b/tools/testing/selftests/x86/amx.c
@@ -3,8 +3,10 @@
 #define _GNU_SOURCE
 #include <err.h>
 #include <errno.h>
+#include <limits.h>
 #include <setjmp.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 #include <stdbool.h>
 #include <unistd.h>
@@ -30,6 +32,9 @@
 #define XFEATURE_MASK_XTILEDATA	(1 << XFEATURE_XTILEDATA)
 #define XFEATURE_MASK_XTILE	(XFEATURE_MASK_XTILECFG | XFEATURE_MASK_XTILEDATA)
 
+#define EXEC_TEST_ARG		"--exec-test"
+#define EXEC_TEST_ITERS		10
+
 struct xstate_info xtiledata;
 
 /* The helpers for managing XSAVE buffer and tile states: */
@@ -478,11 +483,144 @@ static void test_fork(void)
 	_exit(0);
 }
 
-int main(void)
+static int count_dynamic_fpstates(void)
+{
+	char *line = NULL;
+	size_t line_size = 0;
+	FILE *fp;
+	int count = 0;
+
+	fp = fopen("/proc/vmallocinfo", "r");
+	if (!fp)
+		return -errno;
+
+	while (getline(&line, &line_size, fp) >= 0) {
+		if (strstr(line, "__xfd_enable_feature") ||
+		    strstr(line, "fpstate_realloc"))
+			count++;
+	}
+
+	if (ferror(fp))
+		count = -EIO;
+
+	free(line);
+	fclose(fp);
+	return count;
+}
+
+static int parse_exec_arg(const char *arg)
+{
+	char *end;
+	long value;
+
+	errno = 0;
+	value = strtol(arg, &end, 10);
+	if (errno || *end || value < 0 || value > INT_MAX)
+		fatal_error("invalid exec test argument: %s", arg);
+
+	return value;
+}
+
+static int run_exec_test(int iterations, int baseline)
+{
+	char iterations_arg[16];
+	char baseline_arg[16];
+	int allocated;
+
+	if (!iterations)
+		return 0;
+
+	req_xtiledata_perm();
+	if (!load_rand_tiledata(stashed_xsave))
+		fatal_error("failed to load tiledata before exec()");
+
+	if (iterations == EXEC_TEST_ITERS) {
+		allocated = count_dynamic_fpstates();
+		if (allocated != baseline + 1)
+			return KSFT_SKIP;
+	}
+
+	snprintf(iterations_arg, sizeof(iterations_arg), "%d", iterations - 1);
+	snprintf(baseline_arg, sizeof(baseline_arg), "%d", baseline);
+	execl("/proc/self/exe", "amx", EXEC_TEST_ARG, iterations_arg,
+	      baseline_arg, NULL);
+	fatal_error("exec");
+}
+
+static void test_exec(void)
+{
+	char iterations_arg[16];
+	char baseline_arg[16];
+	int before, after, delta;
+	pid_t child;
+	int status;
+
+	printf("[RUN]\tCheck dynamic fpstate cleanup across exec().\n");
+
+	before = count_dynamic_fpstates();
+	if (before < 0) {
+		printf("[SKIP]\tCannot read /proc/vmallocinfo: %s\n",
+		       strerror(-before));
+		return;
+	}
+
+	child = fork();
+	if (child < 0)
+		fatal_error("fork");
+	if (!child) {
+		snprintf(iterations_arg, sizeof(iterations_arg), "%d",
+			 EXEC_TEST_ITERS);
+		snprintf(baseline_arg, sizeof(baseline_arg), "%d", before);
+		execl("/proc/self/exe", "amx", EXEC_TEST_ARG, iterations_arg,
+		      baseline_arg, NULL);
+		fatal_error("exec");
+	}
+
+	if (waitpid(child, &status, 0) != child)
+		fatal_error("waitpid");
+	if (WIFEXITED(status) && WEXITSTATUS(status) == KSFT_SKIP) {
+		printf("[SKIP]\tDynamic fpstate allocation was not isolated.\n");
+		return;
+	}
+	if (!WIFEXITED(status) || WEXITSTATUS(status))
+		fatal_error("exec test child");
+
+	after = count_dynamic_fpstates();
+	if (after < 0) {
+		printf("[SKIP]\tCannot read /proc/vmallocinfo after exec(): %s\n",
+		       strerror(-after));
+		return;
+	}
+
+	delta = after - before;
+	if (!delta) {
+		printf("[OK]\tDynamic fpstate allocations were freed across exec().\n");
+		return;
+	}
+
+	if (delta == EXEC_TEST_ITERS)
+		errx(1, "[FAIL]\texec() leaked %d dynamic fpstate allocations",
+		     delta);
+
+	printf("[SKIP]\tDynamic fpstate vmalloc usage changed concurrently.\n");
+}
+
+int main(int argc, char **argv)
 {
 	unsigned long features;
+	int iterations = 0;
+	int baseline = 0;
+	bool exec_test;
 	long rc;
 
+	exec_test = argc == 4 && !strcmp(argv[1], EXEC_TEST_ARG);
+	if (exec_test) {
+		iterations = parse_exec_arg(argv[2]);
+		baseline = parse_exec_arg(argv[3]);
+		if (!iterations)
+			return 0;
+	}
+
 	rc = syscall(SYS_arch_prctl, ARCH_GET_XCOMP_SUPP, &features);
 	if (rc || (features & XFEATURE_MASK_XTILE) != XFEATURE_MASK_XTILE) {
 		ksft_print_msg("no AMX support\n");
@@ -498,6 +636,10 @@ int main(void)
 	init_stashed_xsave();
 	sethandler(SIGILL, handle_noperm, 0);
 
+	if (exec_test)
+		return run_exec_test(iterations, baseline);
+
+	test_exec();
 	test_dynamic_state();
 
 	/* Request permission for the following tests */
-- 
2.50.1 (Apple Git-155)
