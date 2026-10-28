Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202300;
	b=qnHGd2K5WTAuGg05yHYKRSRWYiCUKZBmlYqdhkUg7pZ++oSEDhhMUfdDGbLusUwk9vZ8
	 4RaRjFOUbZWxPPRmXeTgVNqGUEt+hQP3u6IFx7qTcEbdGRKorA/UFFV8h0S/z5gejCB3b
	 vOYFTc/roqB6zNYOEfGF0zKdWuOLVpCqPRfRlO78hrcgfaolJZMA9oIj8+rDu94pD7jqM
	 05e+UMiGr4788cBlbdpph7ZZmrI+ZHy5RsEyNFmPvhr+PkdywL23ZgtqG4BkUHQWDshq5
	 wmHXAKY22Ze3MIQ9b9Kgv5WNYjW8vHVne9xgyn/oBXiCaCteIpF0OULSFu41vdFb3hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=mY4KZSmblzicF17NIegUjErpV+VQHRUnKGe9o1onwtc=;
	b=OvgSslaTascPlm7VwtpvsSjoAeXpmRNereiSf2++BWNxJtuilPDbiQTGCv8o+ZAhTNrW
	 TD8Rwksi9Zy0RAYswdgemdfH6nT0MQvtCvyp9JYYuPLE66QCS0JZhRGDVwetRKjK0XuI+
	 xQ9Amq6wUxausA3Ube9NUnLeMxJCmJ6XEUgHSytgifBsGYhf7tHkYUfsutlob9ysvyhuC
	 wGP+MpUSXQ+SjliNg97Hi1uWNhrkKcBMr9F3TGFfrw7egrd6CU/cYW3jzK23J2W9FH2Yb
	 g1WhqWMzhau+J0WKCrLlf0/Gv23tYS82jwwjVlwf1iWFPctPnH7uMX4T5AR0ZSlz8JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZRcdtu59;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96417606C078
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96417606C078
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZRcdtu59
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e47347279so884027f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202298; x=1793807098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mY4KZSmblzicF17NIegUjErpV+VQHRUnKGe9o1onwtc=;
        b=ZRcdtu59HjAyZttD0dfQ+boz+P3ANtLiA/jKiJ+9cKvstNmWeUvCemmK3pZhyRW/gM
         8dHrYePUvLZDxfFJVOFNuQCsz8857Jn1/SRKGyYYRlFLh+RNzmRqfGlZuDjQyN3z+4DH
         zbxAJUQS1mx7JUYoxXiudinjjm1Mb9dM4Nv9PRrOynjrpI772FwX1EYB94gzlHr1vnCr
         O4mq8vz2cQID4GdJysnxu6mo/sVCjHvMyOt29csC7ppypU3+kXnYnd6ML21oSFjUiBu6
         RFoXJz5i7fEBggoA7l22uHIJXakWqYoZRoTyK8G/DoJZEtVOrs6UIAEu2O6hxGfqOFgd
         jnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202298; x=1793807098;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY4KZSmblzicF17NIegUjErpV+VQHRUnKGe9o1onwtc=;
        b=fQ2j0G3rxISqsyHwz0m17aYkNWRKhPb7RuzJBtCEuEmbVGs06bRsZ7RkJ+IOdzZwQe
         IJkcvNp4V+15BJhV9H4sFayEBygrKQ+zQ+DiuEaXi5KSc0cAiqoyI3+We6bIOe+yBd9w
         ynuLxVIgYkFjbediiYCpvvRIF7rMJPmL3iTsqrw1T3Ly3koGCXUxyS3JusCBuMTPws98
         7Ss9Z/7zhtjqC3RHqGHS+f0VsqzIORtF2Fh7NqfbLy14CTbH4bqMjbntVeXMVvg7wfR5
         j6/k26PZkXvQ/RjRkClYD4cwxWyZcO+rFaUjL3iuzkQJAlqhOfe7CvY6r/rVLEar4DfA
         LlRQ==
X-Gm-Message-State: AFq9FYIJmmvqIZv0aupNzLYGd+gDCZQ4CD9Fg2DkiiYHg3qhFecJK04I
	Lr5z0CeX1cn4T63XYCUwnztOuws05IEa5xjK4RFFCwOHc7h6P8qjyGhR
X-Gm-Gg: AYBFou0C5y9yDnNFLDU3mv7G+9NkuNvpNR0CjwZTCEgsINONTHOGMfhBeik4pnN4owP
	FjwCRtDPHXxEPWmhECSdX/Hmk8qCbGiMMsPydHGBjjUIrOiOkaGiBAaU4K/BLbKvkjxVvBLcfYK
	g9hN4M4Dyg+pr51hY4OPHqoqMgYAhvnMlchJzsDQCeX1qsymljezBUR5Sz2YAlKTUmKg5VYJ1ez
	hqwZAoB0WHc9v5nR71Q1aSHBECebXChYidBUnTNISJTTSyJ1QbKTH2CYJH1Mf4/CWw/XgId6EfQ
	DxjHK8ZEcAei9kKlbtCgtc1ciuhsm2xlKGC+c0T+4BVTHc0osONalWm9N0g1pkJjr47o1IieD48
	EviNnPjXdlD/htLtdmesvW4ndxc2uUT6qsJxQ8rTGndSd2j5P6xrE4CpAJPQKvgENS/lhw41A4d
	t8SpTFRkbs0q1CwihOQvz2UfBZUNgEGzup2PSgxdOW43fv/JQM93Pp0uUOCzHcOExf5X/90cNtC
	YMXq9aO1a5f5EixsVb3pZQlD7lWRIN3GfTfsws9wrqrW/NxWNC7J6oK3Hbre9cUHWorjpKn4/wo
	LWvMwybQB5u2jcdsf8RE6wjEzf02hBzVRpAZgnjTqr6gc0nw8R3YX4RJTRg0lAyydw==
X-Received: by 2002:a05:6000:1446:b0:487:91e:d8ed with SMTP id ffacd0b85a97d-48e5d58d47emr7093332f8f.2.1793202297940;
        Wed, 28 Oct 2026 08:44:57 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:55 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v3 4/4] selftests/riscv: shadow stack must not leak on a failed clone3
Date: Wed, 28 Oct 2026 12:43:15 -0300
Message-ID: <20261028154315.1272705-5-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Same clone3 bad-pidfd check as the arm64 GCS selftest.

Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 tools/testing/selftests/riscv/cfi/Makefile    |   5 +-
 .../selftests/riscv/cfi/shstk-clone-pidfd.c   | 173 ++++++++++++++++++
 2 files changed, 177 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c

diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
index 418b4b5325a5..dbecb1fd3b82 100644
--- a/tools/testing/selftests/riscv/cfi/Makefile
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -13,10 +13,13 @@ endif
 
 
 ifeq ($(shell $(CC) $(CFLAGS) -nostdlib -xc /dev/null -o /dev/null > /dev/null 2>&1; echo $$?),0)
-TEST_GEN_PROGS := cfitests
+TEST_GEN_PROGS := cfitests shstk-clone-pidfd
 
 $(OUTPUT)/cfitests: cfitests.c shadowstack.c
 	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/shstk-clone-pidfd: shstk-clone-pidfd.c
+	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $^
 else
 
 $(shell echo "Toolchain doesn't support CFI, skipping CFI kselftest." >&2)
diff --git a/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c b/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c
new file mode 100644
index 000000000000..1f16d9c513e6
--- /dev/null
+++ b/tools/testing/selftests/riscv/cfi/shstk-clone-pidfd.c
@@ -0,0 +1,173 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clone3(CLONE_VM|CLONE_PIDFD) with an unwritable pidfd pointer must
+ * not leak a shadow-stack VMA. copy_thread() maps one, then put_user()
+ * fails and copy_process() calls exit_thread(). Without HAVE_EXIT_THREAD
+ * that free is a no-op and the VMA stays in the parent's mm.
+ *
+ * After enabling the shadow stack, do not return from main(): libc
+ * frames above that point have no shadow-stack entries.
+ */
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <linux/prctl.h>
+#include <linux/sched.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/syscall.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "../../kselftest.h"
+#include "cfi_rv_test.h"
+
+#ifndef __NR_clone3
+#define __NR_clone3 435
+#endif
+
+#ifndef PR_GET_SHADOW_STACK_STATUS
+#define PR_GET_SHADOW_STACK_STATUS	74
+#endif
+#ifndef PR_SET_SHADOW_STACK_STATUS
+#define PR_SET_SHADOW_STACK_STATUS	75
+#endif
+#ifndef PR_SHADOW_STACK_ENABLE
+#define PR_SHADOW_STACK_ENABLE		(1UL << 0)
+#endif
+
+#define NCLONE			16
+#define STACK_SIZE		(64 * 1024)
+
+static int count_ss_vmas(void)
+{
+	FILE *f;
+	char line[256];
+	int vmas = 0;
+
+	f = fopen("/proc/self/smaps", "r");
+	if (!f)
+		ksft_exit_fail_msg("fopen /proc/self/smaps: %s\n",
+				   strerror(errno));
+
+	while (fgets(line, sizeof(line), f)) {
+		if (!strncmp(line, "VmFlags:", 8) && strstr(line, " ss"))
+			vmas++;
+	}
+	fclose(f);
+	return vmas;
+}
+
+/*
+ * Raw ecall: the child resumes on an empty shadow stack, so a libc
+ * return after clone3 would fault.
+ */
+static long clone_pidfd(void *stack, size_t stack_size, int *pidfd_ptr)
+{
+	struct clone_args args = {
+		.flags = CLONE_VM | CLONE_PIDFD,
+		.pidfd = (uint64_t)(uintptr_t)pidfd_ptr,
+		.exit_signal = SIGCHLD,
+		.stack = (uint64_t)(uintptr_t)stack,
+		.stack_size = stack_size,
+	};
+	register long num __asm__("a7") = __NR_clone3;
+	register long ret __asm__("a0") = (long)&args;
+	register long sz __asm__("a1") = sizeof(args);
+	int st;
+
+	asm volatile("ecall"
+		     : "+r"(ret)
+		     : "r"(num), "r"(sz)
+		     : "memory", "cc");
+	if (ret == 0) {
+		register long n __asm__("a7") = __NR_exit;
+		register long e __asm__("a0") = 0;
+
+		asm volatile("ecall" : : "r"(n), "r"(e) : "memory");
+		__builtin_unreachable();
+	}
+	if (ret < 0)
+		return ret;
+	if (waitpid((pid_t)ret, &st, 0) < 0)
+		return -errno;
+	if (!WIFEXITED(st) || WEXITSTATUS(st) != 0)
+		return 1;
+	return 0;
+}
+
+int main(void)
+{
+	void *stack;
+	void *bad_pidfd;
+	unsigned long ss_mode = 0;
+	long rc;
+	int pidfd = -1;
+	int vmas0, vmas1;
+	int i, n_efault = 0;
+
+	ksft_print_header();
+
+	stack = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+		     MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
+	if (stack == MAP_FAILED)
+		ksft_exit_fail_msg("mmap stack: %s\n", strerror(errno));
+
+	bad_pidfd = mmap(NULL, 4096, PROT_NONE,
+			 MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+	if (bad_pidfd == MAP_FAILED)
+		ksft_exit_fail_msg("mmap pidfd page: %s\n", strerror(errno));
+
+	rc = my_syscall5(__NR_prctl, PR_GET_SHADOW_STACK_STATUS, &ss_mode,
+			 0, 0, 0);
+	if (rc == -ENOSYS || rc == -EINVAL || rc == -EOPNOTSUPP)
+		ksft_exit_skip("shadow stack not available: %ld\n", rc);
+	if (rc)
+		ksft_exit_fail_msg("PR_GET_SHADOW_STACK_STATUS: %ld\n", rc);
+
+	if (!(ss_mode & PR_SHADOW_STACK_ENABLE)) {
+		rc = my_syscall5(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
+				 PR_SHADOW_STACK_ENABLE, 0, 0, 0);
+		if (rc == -EOPNOTSUPP || rc == -EINVAL || rc == -EBUSY)
+			ksft_exit_skip("cannot enable shadow stack: %ld\n",
+				       rc);
+		if (rc)
+			ksft_exit_fail_msg("PR_SET_SHADOW_STACK_STATUS: %ld\n",
+					   rc);
+	}
+
+	rc = clone_pidfd(stack, STACK_SIZE, &pidfd);
+	if (rc == -ENOSYS || rc == -EINVAL || rc == -EPERM)
+		ksft_exit_skip("clone3 valid pidfd unavailable: %s\n",
+			       strerror(-rc));
+
+	ksft_set_plan(3);
+
+	ksft_test_result(rc == 0 && pidfd >= 0,
+			 "clone3 valid pidfd (rc=%ld pidfd=%d)\n",
+			 rc, pidfd);
+	if (pidfd >= 0)
+		close(pidfd);
+
+	vmas0 = count_ss_vmas();
+
+	for (i = 0; i < NCLONE; i++) {
+		rc = clone_pidfd(stack, STACK_SIZE, bad_pidfd);
+		if (rc == -EFAULT)
+			n_efault++;
+	}
+	ksft_test_result(n_efault == NCLONE,
+			 "clone3 bad pidfd returns -EFAULT x%d\n", NCLONE);
+
+	vmas1 = count_ss_vmas();
+	ksft_test_result(vmas1 == vmas0,
+			 "no shadow-stack VMA leak (%d -> %d)\n",
+			 vmas0, vmas1);
+
+	ksft_finished();
+}
-- 
2.43.0

