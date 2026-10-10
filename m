Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D360449892C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638846; cv=none; b=buNpxQDQ6pfcJjYK9y3ejNkr8GSnkEc5OgT1/UN3likuvTwXMut9vDdoeoHpN9WlZfSaA5jrLbr5nuGR87DWdNLRpNDuCTHVOUKRtMbAqqa1i7m0P6+AETOYlnsA+BjucfUEoK23AaWF+QqaDu3hhK8vGdSQIHXynwkZWPL6kfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638846; c=relaxed/simple;
	bh=n/pCxSDOn2qS/NpKHP6UGNhMIq87C3dUtShRfICorgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YHF0N3wsiAoLBO1bZw3j48kIVcwQJQtGnAOs/8OI1cd7fYpX5reXgMtkJ9KqKjYEJp4Xs2XpWwkjNEkq1scbjPjogfRTCNxMgxMxbhBtx1+0CfZ3hB9DXGZpt3rOtBSzdOYAzmVEE4FYK8yU4ZG8xPSwWZu5zPOKPjbr266fxpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UmNL/gxW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UmNL/gxW"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so4879545e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 06:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791638843; x=1792243643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Go18brKNkouX7jNlWtPlkQMMHplwnR2FFa56h0dzp9I=;
        b=UmNL/gxWPYv2yOqUKL4BZI2gLV19OPzXz/vmc4hEpvJQS9lAKifL6gv5xDJYx2o1Eu
         9j3QZj7Lmiw1a9j+DLTfhRwiBPnsK32STiSoUaWWiVfkHvc8B71vTFcICsAeNIaCA0el
         qoL5cOx6a/uEDvQ8vZkjzvtJ1GiIh1w9lgOQNASo22mWHp6/iqxOGzDpjAcp1ttXUHSw
         9XYOfEwkiuHii790m/6M+YUFR57ZrH5WdWE3/yjXj2ZPXZj+7s5Ut1J6WF3ddBA9/xZM
         QDk4EG7HOx7emaDqIaquyXap/DQQs2xK9KwnSoXN2Xp7FclMS9vl7GcWKAuKl3Ks1p4s
         rPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791638843; x=1792243643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Go18brKNkouX7jNlWtPlkQMMHplwnR2FFa56h0dzp9I=;
        b=s30810AcBpWYkaoGJCjXpByzAqWQsommHdD1ERanHcnAKog6+DcH0OW79iOKwXg6d7
         ga4gWWtkwW0nJNMmU7ij5rWY95opxpJl/rXT2TRw9K7B0fzDn+XX00vbiXpX7uZHL41h
         rzzwAkvFs0M3Ixet1eLwqzD7c2iE2UraeBs3dKB7MVBvYoSM4WuICXoHGKs7tKnSJcYz
         DzoPZecy5hOd4yYgsDp5GnZzPmzafOqONxUM/WgTuyRWGUxsCXQEZacVvtiGM7MsAbCg
         ytRxCusj62r/eWOppgeIRIK3UuvueLX0x6gtWR2Wo8PMEb3vLz3wlg1X205dd/NDyoPc
         AMpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAGJqoA9MBrTPPGsS4GxKRMfVlqJGrUnX5iHWSk89xV6zw0rS2MGVjA8P2jwkMK8CXmZJF0s0K4plFD4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFTyBCiJr5fHW4rrqeU2ZHWGQfiTRatdPT+nnD0s2DiTppgyCR
	kphIi9vIh3BAd2h3/txSHSt8f8PXPEnd+X8P2gcTfnTZpIcan9CgLEld
X-Gm-Gg: AYBFou24QNqbMA7+oa6HA12Yw8t6NYUV3sWuxTc96kGqZDZxh0owQLwy2cgqk/cMbe5
	6W/4J5kfFJnYqPgW6IZrU6jwDjVfiNrJ3RhQ2RDMzt8NB6Rr9cvuNCXxGLsVQh2bdtQmLLA39MB
	97uO6tR8HLRI3IXK9OixZkfatyvTGSX6/XNAlA9lWJsWBaRTFIC/lGXQPFKdRHneKFpKUj0ILUy
	0++XmiYirM7Tr+EwtPDas4DMZzQV/9CEmmmJJtml8h3KKZIx8OuGEAyjs1bdeXr4Y7LFFCekuV+
	jFdGUwFGbCs5+XesUmZpS6O888TIb5fM7LCEGfoH4bQEiFVGP27X9zeYci5P6f7//GYUV9zIq2r
	bXVsBaL6XCt1QaC6xZqWw3fxJrpRPCVJnaml4NcrdIMJq359SvmFdyPjFU1emNNY3ad/2cSVoDv
	/aYITqx9R33Oox9qHOM5O91KYctJIyPDLLaoB4SFXP7TK/I4IfQ7pvi8rM/h0aO5OZSfFXI6peB
	JVngaYohAZqGE8yCnMasGYv5uG+djnyC3Jvf43g5G2pfn2RkDDqj9wnWUQ+m3SiOmOM1o8mi2rI
	aDMc2KDHR/BoItSDsBcALpnvDcSONhbrc8D3i4d8tQJN5LpdszJC8ZKeCUqs94hFQuBmQFCVbvw
	=
X-Received: by 2002:a05:600c:46c5:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4a18e4d6b28mr90315085e9.33.1791638842905;
        Sat, 10 Oct 2026 06:27:22 -0700 (PDT)
Received: from imx93-evk.localdomain (dynamic-2a02-3100-9d3f-0d01-48c7-5d76-0ec6-9dac.310.pool.telefonica.de. [2a02:3100:9d3f:d01:48c7:5d76:ec6:9dac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm215410405e9.8.2026.10.10.06.27.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 06:27:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Changbin Du <changbin.du@intel.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH 2/2] riscv: Add KUnit test for stack trace start frames
Date: Sat, 10 Oct 2026 15:27:12 +0200
Message-Id: <20261010132712.46931-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261010132712.46931-1-kmehltretter@gmail.com>
References: <20261010132712.46931-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stack_trace_save() and return_address() depend on the first frame reported
by arch_stack_walk(), but no test checks their frame numbering.

Add a test that calls both through a chain of three noinline functions
and compares the symbol of the result with the function expected for
each skip count or level.

Require FRAME_POINTER because the stack-scanning walker cannot provide an
exact start frame.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/riscv/kernel/tests/Kconfig.debug     |  12 ++
 arch/riscv/kernel/tests/Makefile          |   1 +
 arch/riscv/kernel/tests/stacktrace_test.c | 142 ++++++++++++++++++++++
 3 files changed, 155 insertions(+)

diff --git a/arch/riscv/kernel/tests/Kconfig.debug b/arch/riscv/kernel/tests/Kconfig.debug
index 40f8dafffa0a..eb79df5b2c5a 100644
--- a/arch/riscv/kernel/tests/Kconfig.debug
+++ b/arch/riscv/kernel/tests/Kconfig.debug
@@ -42,6 +42,18 @@ config RISCV_KPROBES_KUNIT
 
          If unsure, say N.
 
+config RISCV_STACKTRACE_KUNIT_TEST
+	bool "KUnit tests for RISC-V stack trace start frames"
+	depends on KUNIT && STACKTRACE && FRAME_POINTER && KALLSYMS
+	help
+	  Check that stack_trace_save() starts at its caller and skips exactly
+	  the requested number of frames through a known call chain, and that
+	  ftrace_return_address(), which CALLER_ADDR1 and up are built on,
+	  returns the caller it was asked for. This catches a stack walker
+	  that exposes its own implementation frames to its users.
+
+	  If unsure, say N.
+
 endif # RUNTIME_TESTING_MENU
 
 endmenu # "arch/riscv/kernel runtime Testing"
diff --git a/arch/riscv/kernel/tests/Makefile b/arch/riscv/kernel/tests/Makefile
index 407e7e6c28dc..9ca4135bffb5 100644
--- a/arch/riscv/kernel/tests/Makefile
+++ b/arch/riscv/kernel/tests/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_RISCV_MODULE_LINKING_KUNIT)	+= module_test/
 obj-$(CONFIG_RISCV_KPROBES_KUNIT)		+= kprobes/
+obj-$(CONFIG_RISCV_STACKTRACE_KUNIT_TEST)	+= stacktrace_test.o
diff --git a/arch/riscv/kernel/tests/stacktrace_test.c b/arch/riscv/kernel/tests/stacktrace_test.c
new file mode 100644
index 000000000000..bb299a106773
--- /dev/null
+++ b/arch/riscv/kernel/tests/stacktrace_test.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Check where stack_trace_save() and ftrace_return_address() start. */
+#include <kunit/test.h>
+#include <linux/ftrace.h>
+#include <linux/kallsyms.h>
+#include <linux/module.h>
+#include <linux/stacktrace.h>
+
+#define RISCV_STACKTRACE_DEPTH 16
+
+static noinline unsigned int
+riscv_stacktrace_leaf(unsigned long *entries, unsigned int skip)
+{
+	unsigned int count = stack_trace_save(entries, RISCV_STACKTRACE_DEPTH, skip);
+
+	barrier();
+	return count;
+}
+
+static noinline unsigned int
+riscv_stacktrace_middle(unsigned long *entries, unsigned int skip)
+{
+	unsigned int count = riscv_stacktrace_leaf(entries, skip);
+
+	barrier();
+	return count;
+}
+
+static noinline unsigned int
+riscv_stacktrace_outer(unsigned long *entries, unsigned int skip)
+{
+	unsigned int count = riscv_stacktrace_middle(entries, skip);
+
+	barrier();
+	return count;
+}
+
+static void riscv_stacktrace_check_skip(struct kunit *test, unsigned int skip)
+{
+	static const char * const expected[] = {
+		"riscv_stacktrace_leaf",
+		"riscv_stacktrace_middle",
+		"riscv_stacktrace_outer",
+	};
+	unsigned long entries[RISCV_STACKTRACE_DEPTH];
+	char symbol[KSYM_SYMBOL_LEN];
+	unsigned int count;
+
+	count = riscv_stacktrace_outer(entries, skip);
+	KUNIT_ASSERT_GT(test, count, 0U);
+	sprint_symbol_no_offset(symbol, entries[0]);
+	kunit_info(test, "skip=%u first=%s count=%u\n", skip, symbol, count);
+	KUNIT_EXPECT_STREQ(test, symbol, expected[skip]);
+}
+
+static void riscv_stacktrace_skip_zero(struct kunit *test)
+{
+	riscv_stacktrace_check_skip(test, 0);
+}
+
+static void riscv_stacktrace_skip_one(struct kunit *test)
+{
+	riscv_stacktrace_check_skip(test, 1);
+}
+
+static void riscv_stacktrace_skip_two(struct kunit *test)
+{
+	riscv_stacktrace_check_skip(test, 2);
+}
+
+static noinline void *riscv_return_address_leaf(unsigned int level)
+{
+	void *addr = (void *)ftrace_return_address(level);
+
+	barrier();
+	return addr;
+}
+
+static noinline void *riscv_return_address_middle(unsigned int level)
+{
+	void *addr = riscv_return_address_leaf(level);
+
+	barrier();
+	return addr;
+}
+
+static noinline void *riscv_return_address_outer(unsigned int level)
+{
+	void *addr = riscv_return_address_middle(level);
+
+	barrier();
+	return addr;
+}
+
+/*
+ * ftrace_return_address(n) is what CALLER_ADDRn expands to. Like
+ * __builtin_return_address(n), level 0 is the caller of the function that
+ * uses it.
+ */
+static void riscv_return_address_check(struct kunit *test, unsigned int level)
+{
+	static const char * const expected[] = {
+		"riscv_return_address_middle",
+		"riscv_return_address_outer",
+	};
+	char symbol[KSYM_SYMBOL_LEN];
+	void *addr;
+
+	addr = riscv_return_address_outer(level);
+	KUNIT_ASSERT_NOT_NULL(test, addr);
+	sprint_symbol_no_offset(symbol, (unsigned long)addr);
+	kunit_info(test, "level=%u caller=%s\n", level, symbol);
+	KUNIT_EXPECT_STREQ(test, symbol, expected[level]);
+}
+
+static void riscv_return_address_level_zero(struct kunit *test)
+{
+	riscv_return_address_check(test, 0);
+}
+
+static void riscv_return_address_level_one(struct kunit *test)
+{
+	riscv_return_address_check(test, 1);
+}
+
+static struct kunit_case riscv_stacktrace_cases[] = {
+	KUNIT_CASE(riscv_stacktrace_skip_zero),
+	KUNIT_CASE(riscv_stacktrace_skip_one),
+	KUNIT_CASE(riscv_stacktrace_skip_two),
+	KUNIT_CASE(riscv_return_address_level_zero),
+	KUNIT_CASE(riscv_return_address_level_one),
+	{}
+};
+
+static struct kunit_suite riscv_stacktrace_suite = {
+	.name = "riscv-stacktrace-skip",
+	.test_cases = riscv_stacktrace_cases,
+};
+
+kunit_test_suite(riscv_stacktrace_suite);
+
+MODULE_LICENSE("GPL");
