Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5657F348C6B
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 21:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792185131; cv=none; b=KaajnNtxvG8YlnjfZIZTz7nlGv0TUcoxW0w6qcTCfc6p7Vx6QjzJ2AY994hUJE9GbzYcuQ2p/dkLkVm498ryyymfMBeKWrLptbmIXrtOcjqWN+DEQW72B7gCfdD2w+Nw0+yxlErnNKv+/Z6qfhv8l8n10Aer9jCtH8e0Mcwex1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792185131; c=relaxed/simple;
	bh=Yb33cOuTUan89daVdDy+8O81MtxGJJ0INJ/6zE/fbfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EGm0gTDRkHZF+yzhsXkmVN9aknz/Wa/L09yfsYxWMx1XkRPkm/nsKQzyM5IzjaVDXDA7+wVVpeoysP5h7JC0B8U4TuSlwACJP8rKAwTJNI7vVjZhTYB4oYOlVUbcM/c2fJ/0SZ78CeKN/qxWMOTwKm5EnMQQkXunp943NbmknbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SBtjen+w; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SBtjen+w"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C41A514BF;
	Fri, 16 Oct 2026 14:12:03 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83B833F673;
	Fri, 16 Oct 2026 14:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185127; bh=Yb33cOuTUan89daVdDy+8O81MtxGJJ0INJ/6zE/fbfU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SBtjen+wt1HELbj+DJIV8mwlKKvunt3ae+aamOHvKgX5pH4uES2ZZUP8f4ibFC1dY
	 aSQuUw9QV82Hu10k0MiAvQwsnnZwmnIS2UyzLQt51zuuKbVh321h8fQpsWYi7xgMx3
	 xaRdVzrdg8lfKrh4HJP9Fus0665uPsRxIYoClfEY=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:45 +0100
Subject: [PATCH v2 07/11] coresight: trbe: Add KUnit tests for compute
 normal buffer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-7-383ac26382fa@arm.com>
References: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
In-Reply-To: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=26807;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Yb33cOuTUan89daVdDy+8O81MtxGJJ0INJ/6zE/fbfU=;
 b=7DelROUAaB2piFu8AFoLkmqmkJvCLrh078/1/MBpd86RU+J4KrAjxg1gxy1sZyzF4pPZL60Lv
 7+D00uRGwb2AW5z34J8FR2ZfuaTG/NB6bMc3rrZqVZvEQVBri1CXpNM
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

For normal buffer mode, the TRBE computes both the programmed limit and
the optional trigger count. This logic has several boundary cases around
head/tail wrapping, wakeup placement, alignment padding, trigger-count
headroom, and erratum-specific handling.

Add KUnit coverage for trbe_normal_offset(). The tests call the helper
and verify the returned trbe_limit and trbe_trg_count fields.

Compile the tests into coresight-trbe.c so they can exercise private TRBE
helpers without exposing data structures. Use the fixture trigger-support
flag to cover both supported and unsupported trigger-count configurations.

Route all TRBE handle-to-buffer lookups through trbe_handle_buf(), which
uses the perf sink configuration for genuine handles.

Use a test-scoped static stub to provide the synthetic buffer only for the
handle under test and simulate padding for that handle. Genuine perf
handles keep normal buffer lookup, padding and AUX accounting, including
when an IRQ interrupts the test task. Compile the stub support only when
the TRBE tests are enabled.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/Kconfig                |  15 +
 .../coresight/coresight-trbe-kunit-tests.c         | 644 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-trbe.c       |  58 +-
 3 files changed, 705 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 6a4239ebb582e95f0ebe8e9c8738a726f27f60a1..845c0691f0eba9f0cc9be22cdc6fc27ff82d437e 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -214,6 +214,21 @@ config CORESIGHT_TRBE
 	  To compile this driver as a module, choose M here: the module will be
 	  called coresight-trbe.
 
+config CORESIGHT_TRBE_KUNIT_TESTS
+	bool "Enable Coresight TRBE unit tests" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	depends on CORESIGHT_TRBE
+	depends on KUNIT=y if CORESIGHT_TRBE=y
+	default KUNIT_ALL_TESTS
+	help
+	  Enable KUnit coverage for the Coresight TRBE buffer offset
+	  calculations. The tests are compiled into the TRBE driver and
+	  exercise private helpers through the in-source KUnit pattern.
+	  This is only useful for development and not intended for production.
+
+	  These tests are not expected to run concurrently with perf tracing
+	  sessions.
+
 config ULTRASOC_SMB
 	tristate "Ultrasoc system memory buffer drivers"
 	depends on ACPI || COMPILE_TEST
diff --git a/drivers/hwtracing/coresight/coresight-trbe-kunit-tests.c b/drivers/hwtracing/coresight/coresight-trbe-kunit-tests.c
new file mode 100644
index 0000000000000000000000000000000000000000..a594881a10c4aa31258c14bd1240fb16e9619935
--- /dev/null
+++ b/drivers/hwtracing/coresight/coresight-trbe-kunit-tests.c
@@ -0,0 +1,644 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <kunit/test.h>
+#include <linux/limits.h>
+
+struct trbe_test_context {
+	struct perf_output_handle *handle;
+	struct trbe_buf *buf;
+};
+
+static struct trbe_buf *trbe_test_handle_buf_stub(struct perf_output_handle *handle)
+{
+	struct trbe_test_context *ctx = kunit_get_current_test()->priv;
+
+	/* An IRQ on the test task can still use a genuine perf handle. */
+	return handle == ctx->handle ? ctx->buf : NULL;
+}
+
+static void trbe_test_init(struct perf_output_handle *handle,
+			   struct trbe_buf *buf,
+			   struct trbe_cpudata *cpudata,
+			   int nr_pages, u64 trbe_align,
+			   u64 trbe_hw_align,
+			   bool trig_is_supported)
+{
+	*handle = (struct perf_output_handle) { };
+	*buf = (struct trbe_buf) { };
+	*cpudata = (struct trbe_cpudata) {
+		.trbe_align = trbe_align,
+		.trbe_hw_align = trbe_hw_align,
+		.trig_is_supported = trig_is_supported,
+	};
+
+	buf->nr_pages = nr_pages;
+	buf->cpudata = cpudata;
+}
+
+static void __trbe_test_assert_normal_offset(struct kunit *test,
+					     struct perf_output_handle *handle,
+					     struct trbe_buf *buf,
+					     int expected_ret,
+					     unsigned long expected_limit,
+					     unsigned long expected_count,
+					     unsigned int line)
+{
+	struct trbe_test_context ctx = {
+		.handle = handle,
+		.buf = buf,
+	};
+	void *priv = test->priv;
+	unsigned long limit;
+	unsigned long count;
+	int ret;
+
+	buf->trbe_limit = 0;
+	buf->trbe_trg_count = 0;
+
+	test->priv = &ctx;
+	kunit_activate_static_stub(test, trbe_test_handle_buf,
+				   trbe_test_handle_buf_stub);
+	ret = trbe_normal_offset(handle);
+	kunit_deactivate_static_stub(test, trbe_test_handle_buf);
+	test->priv = priv;
+
+	limit = buf->trbe_limit;
+	count = buf->trbe_trg_count;
+
+	KUNIT_ASSERT_EQ_MSG(test, ret, expected_ret,
+			    "line %u: ret=%d expected=%d",
+			    line, ret, expected_ret);
+	KUNIT_ASSERT_EQ_MSG(test, limit, expected_limit,
+			    "line %u: limit=%#lx expected=%#lx",
+			    line, limit, expected_limit);
+	KUNIT_ASSERT_EQ_MSG(test, count, expected_count,
+			    "line %u: count=%#lx expected=%#lx",
+			    line, count, expected_count);
+}
+
+#define trbe_test_assert_normal_offset(...) \
+	__trbe_test_assert_normal_offset(__VA_ARGS__, __LINE__)
+
+static void test_normal_offset_limit(struct kunit *test)
+{
+	struct perf_output_handle handle;
+	struct trbe_buf buf;
+	struct trbe_cpudata cpudata;
+
+	trbe_test_init(&handle, &buf, &cpudata, SZ_1M / PAGE_SIZE,
+		       PAGE_SIZE, 1, false);
+
+	/*
+	 * ### : Free space, $$$ : Filled space
+	 *
+	 * |################|################|
+	 * `head            `wakeup
+	 * `tail            `limit
+	 */
+	handle.head = 0;
+	handle.size = SZ_1M;
+	handle.wakeup = SZ_1M / 2;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0, SZ_1M / 2, 0);
+
+	/*
+	 * |################|################|
+	 * `head            `wakeup         `tail
+	 *                  `limit
+	 */
+	handle.head = 0;
+	handle.size = SZ_1M - 1;
+	handle.wakeup = SZ_1M / 2;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0, SZ_1M / 2, 0);
+
+	/*
+	 * |#################################|
+	 * `head                            `tail
+	 * `wakeup                         `limit
+	 */
+	handle.head = 0;
+	handle.size = SZ_1M - 1;
+	handle.wakeup = 0;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, -ENOSPC, 0, 0);
+
+	/*
+	 * |#################################|
+	 * `head                            `tail
+	 *                                   `wakeup
+	 *                                 `limit
+	 */
+	handle.head = 0;
+	handle.size = SZ_1M - 1;
+	handle.wakeup = SZ_1M;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M - PAGE_SIZE, 0);
+
+	/*
+	 * |$$$$$$$$$$$$$$$$|########|#######|
+	 *                  `head           `tail
+	 *                           `wakeup
+	 *                                 `limit
+	 */
+	handle.head = SZ_1M / 2;
+	handle.size = SZ_1M / 2 - 1;
+	handle.wakeup = SZ_1M * 3 / 4;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M * 3 / 4, 0);
+
+	/*
+	 * |$$$$$$$$|$$$$$$$|################|
+	 *                  `head           `tail
+	 *          `wakeup
+	 *                                 `limit
+	 */
+	handle.head = SZ_1M / 2;
+	handle.size = SZ_1M / 2 - 1;
+	handle.wakeup = SZ_1M * 1 / 4;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M - PAGE_SIZE, 0);
+
+	/*
+	 * |$$$$$$$$$$$$$$$$|################|
+	 *                  `head           `tail
+	 *                                  `wakeup
+	 *                                 `limit
+	 */
+	handle.head = SZ_1M / 2;
+	handle.size = SZ_1M / 2 - 1;
+	handle.wakeup = SZ_1M - 1;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M - PAGE_SIZE, 0);
+
+	/*
+	 * |#########|$$$$$$$$$$|########|###|
+	 *           `tail      `head    `wakeup
+	 *                                   `limit
+	 */
+	handle.head = SZ_1M * 3 / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = handle.head + SZ_1M / 8;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M * 7 / 8, 0);
+
+	/*
+	 * |####|####|$$$$$$$$$$|############|
+	 *           `tail      `head
+	 *      `wakeup
+	 *                                   `limit
+	 */
+	handle.head = SZ_1M * 3 / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = SZ_1M + SZ_1M / 8;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0, SZ_1M, 0);
+
+	/*
+	 * |#######|########|$$$$$$$$$$$$$$$$|
+	 * `head   `wakeup  `>tail
+	 *         `limit
+	 */
+	handle.head = SZ_1M;
+	handle.wakeup = SZ_1M + SZ_1M / 8;
+	handle.size = SZ_1M / 2;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0, SZ_1M / 8, 0);
+
+	/*
+	 * |#######|$$$$$$$$$$$$$$$$$|#######|
+	 *         `tail             `head
+	 *         `wakeup
+	 *                                   `limit
+	 */
+	handle.head = SZ_1M * 3 / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = SZ_1M + SZ_1M / 4;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0, SZ_1M, 0);
+
+	/*
+	 * |#######|$$$$$$$$|$$$$$$$$|#######|
+	 *         `tail    `wakeup  `head
+	 *                                   `limit
+	 */
+	handle.head = SZ_1M * 3 / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = SZ_1M + SZ_1M / 2;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0, SZ_1M, 0);
+
+	/*
+	 * |$$$$$$$|########|########|$$$$$$$|
+	 *         `head    `wakeup  `tail
+	 *                           `limit
+	 */
+	handle.head = SZ_1M / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = SZ_1M / 2;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0, SZ_1M / 2, 0);
+
+	/*
+	 * |$$$$$$$|#################|$$$$$$$|
+	 *         `head             `tail
+	 *                           `wakeup
+	 *                           `limit
+	 */
+	handle.head = SZ_1M / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = SZ_1M * 3 / 4;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M * 3 / 4, 0);
+
+	/*
+	 * |$$$$$$$|#################|$$$$$$$|
+	 * `wakeup `head             `tail
+	 *                           `limit
+	 */
+	handle.head = SZ_1M / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = 0;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M * 3 / 4, 0);
+
+	/*
+	 * |$$$$$$|$$$$$$$$$$$$$$$$$$$$$$$$$$|
+	 *        `head
+	 *        `tail
+	 */
+	handle.head = SZ_1M / 4;
+	handle.size = 0;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, -ENOSPC, 0, 0);
+
+	/*
+	 * |$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$|#$|
+	 *                                `head
+	 *                                  `tail
+	 */
+	handle.head = SZ_1M - SZ_1K * 2;
+	handle.size = SZ_1K;
+	handle.wakeup = 0;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, -ENOSPC, 0, 0);
+}
+
+static void test_normal_offset_limit_and_counter(struct kunit *test)
+{
+	struct perf_output_handle handle;
+	struct trbe_buf buf;
+	struct trbe_cpudata cpudata;
+
+	trbe_test_init(&handle, &buf, &cpudata, SZ_1M / PAGE_SIZE,
+		       PAGE_SIZE, 1, true);
+
+	/*
+	 * ### : Free space, $$$ : Filled space
+	 *
+	 * |################|################|
+	 * `head            `wakeup          `limit
+	 * `tail
+	 * `----- count ----'
+	 */
+	handle.head = 0;
+	handle.size = SZ_1M;
+	handle.wakeup = SZ_1M / 2;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M, SZ_1M / 2);
+
+	/*
+	 * |################|################|
+	 * `head            `wakeup         `tail
+	 *                                 `limit
+	 * `----- count ----'
+	 */
+	handle.head = 0;
+	handle.size = SZ_1M - 1;
+	handle.wakeup = SZ_1M / 2;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M - PAGE_SIZE, SZ_1M / 2);
+
+	/*
+	 * |#################################|
+	 * `head                            `tail
+	 * `wakeup                         `limit
+	 */
+	handle.head = 0;
+	handle.size = SZ_1M - 1;
+	handle.wakeup = 0;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, -ENOSPC, 0, 0);
+
+	/*
+	 * |#################################|
+	 * `head                            `tail
+	 *                                   `wakeup
+	 *                                 `limit
+	 */
+	handle.head = 0;
+	handle.size = SZ_1M - 1;
+	handle.wakeup = SZ_1M;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M - PAGE_SIZE, 0);
+
+	/*
+	 * |$$$$$$$$$$$$$$$$|########|#######|
+	 *                  `head           `tail
+	 *                           `wakeup
+	 *                                 `limit
+	 *                  [  count ]
+	 */
+	handle.head = SZ_1M / 2;
+	handle.size = SZ_1M / 2 - 1;
+	handle.wakeup = SZ_1M * 3 / 4;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M - PAGE_SIZE, SZ_1M / 4);
+
+	/*
+	 * |$$$$$$$$|$$$$$$$|################|
+	 *                  `head           `tail
+	 *          `wakeup
+	 *                                 `limit
+	 */
+	handle.head = SZ_1M / 2;
+	handle.size = SZ_1M / 2 - 1;
+	handle.wakeup = SZ_1M * 1 / 4;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M - PAGE_SIZE, 0);
+
+	/*
+	 * |$$$$$$$$$$$$$$$$|################|
+	 *                  `head           `tail
+	 *                                  `wakeup
+	 *                                 `limit
+	 */
+	handle.head = SZ_1M / 2;
+	handle.size = SZ_1M / 2 - 1;
+	handle.wakeup = SZ_1M - 1;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M - PAGE_SIZE, 0);
+
+	/*
+	 * |#########|$$$$$$$$$$|########|###|
+	 *           `tail      `head    `wakeup
+	 *                                   `limit
+	 *                      [  count ]
+	 */
+	handle.head = SZ_1M * 3 / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = handle.head + SZ_1M / 8;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M, SZ_1M / 8);
+
+	/*
+	 * |####|####|$$$$$$$$$$|############|
+	 *           `tail      `head
+	 *      `wakeup
+	 *                                   `limit
+	 *                      [   count  >>>
+	 * >>>       ]
+	 */
+	handle.head = SZ_1M * 3 / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = SZ_1M + SZ_1M / 8;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0, SZ_1M,
+				       SZ_1M / 2 - TRBE_TRIGGER_STOP_HEADROOM);
+
+	/*
+	 * |#######|########|$$$$$$$$$$$$$$$$|
+	 * `head   `wakeup  `>tail
+	 *                  `limit
+	 * [ count ]
+	 */
+	handle.head = SZ_1M;
+	handle.wakeup = SZ_1M + SZ_1M / 8;
+	handle.size = SZ_1M / 2;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M / 2, SZ_1M / 8);
+
+	/*
+	 * |#######|$$$$$$$$$$$$$$$$$|#######|
+	 *         `tail             `head
+	 *         `wakeup
+	 *                                   `limit
+	 *                           [ count >
+	 * >>>     ]
+	 */
+	handle.head = SZ_1M * 3 / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = SZ_1M + SZ_1M / 4;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0, SZ_1M,
+				       SZ_1M / 2 - TRBE_TRIGGER_STOP_HEADROOM);
+
+	/*
+	 * |#######|$$$$$$$$|$$$$$$$$|#######|
+	 *         `tail    `wakeup  `head
+	 *                                   `limit
+	 *                           [ count >
+	 * >>>     ]
+	 */
+	handle.head = SZ_1M * 3 / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = SZ_1M + SZ_1M / 2;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0, SZ_1M,
+				       SZ_1M / 2 - TRBE_TRIGGER_STOP_HEADROOM);
+
+	/*
+	 * |$$$$$$$|########|########|$$$$$$$|
+	 *         `head    `wakeup  `tail
+	 *                           `limit
+	 *         [ count  ]
+	 */
+	handle.head = SZ_1M / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = SZ_1M / 2;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M * 3 / 4, SZ_1M / 4);
+
+	/*
+	 * |$$$$$$$|#################|$$$$$$$|
+	 *         `head             `tail
+	 *                           `wakeup
+	 *                           `limit
+	 */
+	handle.head = SZ_1M / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = SZ_1M * 3 / 4;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M * 3 / 4, 0);
+
+	/*
+	 * |$$$$$$$|#################|$$$$$$$|
+	 * `wakeup `head             `tail
+	 *                           `limit
+	 */
+	handle.head = SZ_1M / 4;
+	handle.size = SZ_1M / 2;
+	handle.wakeup = 0;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M * 3 / 4, 0);
+}
+
+static void test_normal_offset_alignment_padding(struct kunit *test)
+{
+	struct perf_output_handle handle;
+	struct trbe_buf buf;
+	struct trbe_cpudata cpudata;
+
+	trbe_test_init(&handle, &buf, &cpudata, SZ_1M / PAGE_SIZE,
+		       PAGE_SIZE, 1, false);
+
+	handle.head = 128;
+	handle.size = 2 * PAGE_SIZE;
+	handle.wakeup = 0;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       2 * PAGE_SIZE, 0);
+
+	handle.head = SZ_1M - PAGE_SIZE / 2;
+	handle.size = PAGE_SIZE / 4;
+	handle.wakeup = 0;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, -ENOSPC, 0, 0);
+}
+
+static void test_normal_offset_small_range_padding(struct kunit *test)
+{
+	struct perf_output_handle handle;
+	struct trbe_buf buf;
+	struct trbe_cpudata cpudata;
+
+	trbe_test_init(&handle, &buf, &cpudata, SZ_1M / PAGE_SIZE,
+		       PAGE_SIZE, 1, false);
+
+	handle.head = 2 * PAGE_SIZE;
+	handle.size = PAGE_SIZE / 4;
+	handle.wakeup = 0;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, -ENOSPC, 0, 0);
+}
+
+static void test_normal_offset_trigger_count_alignment(struct kunit *test)
+{
+	struct perf_output_handle handle;
+	struct trbe_buf buf;
+	struct trbe_cpudata cpudata;
+
+	trbe_test_init(&handle, &buf, &cpudata, SZ_1M / PAGE_SIZE,
+		       PAGE_SIZE, 256, true);
+
+	handle.head = 0;
+	handle.size = SZ_1M;
+	handle.wakeup = PAGE_SIZE + 1;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0, SZ_1M,
+				       PAGE_SIZE + 256);
+
+	handle.head = 0;
+	handle.size = 2 * PAGE_SIZE;
+	handle.wakeup = 2 * PAGE_SIZE - 1;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       2 * PAGE_SIZE, 0);
+}
+
+static void test_normal_offset_trigger_count_over_u32(struct kunit *test)
+{
+	struct perf_output_handle handle;
+	struct trbe_buf buf;
+	struct trbe_cpudata cpudata;
+	unsigned long wakeup = (unsigned long)U32_MAX + 1;
+	int nr_pages = (wakeup + PAGE_SIZE) / PAGE_SIZE;
+
+	trbe_test_init(&handle, &buf, &cpudata, nr_pages, PAGE_SIZE, 1, true);
+
+	handle.head = 0;
+	handle.size = (unsigned long)nr_pages * PAGE_SIZE;
+	handle.wakeup = wakeup;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0, wakeup, 0);
+}
+
+static void test_normal_offset_trigger_count_handle_wrap(struct kunit *test)
+{
+	struct perf_output_handle handle;
+	struct trbe_buf buf;
+	struct trbe_cpudata cpudata;
+
+	trbe_test_init(&handle, &buf, &cpudata, SZ_1M / PAGE_SIZE,
+		       PAGE_SIZE, 1, true);
+
+	handle.head = ULONG_MAX - PAGE_SIZE + 1;
+	handle.size = 2 * PAGE_SIZE;
+	handle.wakeup = handle.head + PAGE_SIZE / 2;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       SZ_1M, PAGE_SIZE / 2);
+}
+
+static void test_normal_offset_min_trace_size(struct kunit *test)
+{
+	struct perf_output_handle handle;
+	struct trbe_buf buf;
+	struct trbe_cpudata cpudata;
+	unsigned long head = 2 * PAGE_SIZE - 32;
+
+	trbe_test_init(&handle, &buf, &cpudata, SZ_1M / PAGE_SIZE, 1, 1, false);
+
+	handle.head = head;
+	handle.size = PAGE_SIZE + 96;
+	handle.wakeup = 0;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, 0,
+				       3 * PAGE_SIZE, 0);
+
+	trbe_test_init(&handle, &buf, &cpudata, SZ_1M / PAGE_SIZE, 1, 1, false);
+	set_bit(TRBE_WORKAROUND_WRITE_OUT_OF_RANGE, cpudata.errata);
+
+	handle.head = head;
+	handle.size = PAGE_SIZE + 96;
+	handle.wakeup = 0;
+
+	trbe_test_assert_normal_offset(test, &handle, &buf, -ENOSPC, 0, 0);
+}
+
+static struct kunit_case coresight_trbe_testcases[] = {
+	KUNIT_CASE(test_normal_offset_limit),
+	KUNIT_CASE(test_normal_offset_limit_and_counter),
+	KUNIT_CASE(test_normal_offset_alignment_padding),
+	KUNIT_CASE(test_normal_offset_small_range_padding),
+	KUNIT_CASE(test_normal_offset_trigger_count_alignment),
+	KUNIT_CASE(test_normal_offset_trigger_count_over_u32),
+	KUNIT_CASE(test_normal_offset_trigger_count_handle_wrap),
+	KUNIT_CASE(test_normal_offset_min_trace_size),
+	{}
+};
+
+static struct kunit_suite coresight_trbe_test_suite = {
+	.name = "coresight_trbe_test_suite",
+	.test_cases = coresight_trbe_testcases,
+};
+
+kunit_test_suites(&coresight_trbe_test_suite);
diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 391e5013647477ae145d777d406c63355bc38278..7cea3542ad0797435c9deac3b5017da9f30b884c 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -20,6 +20,9 @@
 #include <linux/iopoll.h>
 #include <linux/kvm_host.h>
 #include <linux/vmalloc.h>
+#ifdef CONFIG_CORESIGHT_TRBE_KUNIT_TESTS
+#include <kunit/static_stub.h>
+#endif
 
 #include "coresight-etm4x.h"
 #include "coresight-self-hosted-trace.h"
@@ -377,10 +380,37 @@ static void __trbe_pad_buf(struct trbe_buf *buf, u64 offset, int len)
 	memset((void *)buf->trbe_base + offset, ETE_IGNORE_PACKET, len);
 }
 
+static struct trbe_buf *trbe_test_handle_buf(struct perf_output_handle *handle)
+{
+#ifdef CONFIG_CORESIGHT_TRBE_KUNIT_TESTS
+	KUNIT_STATIC_STUB_REDIRECT(trbe_test_handle_buf, handle);
+#endif
+	return NULL;
+}
+
+static struct trbe_buf *trbe_handle_buf(struct perf_output_handle *handle)
+{
+	struct trbe_buf *buf = trbe_test_handle_buf(handle);
+
+	if (buf)
+		return buf;
+
+	return etm_perf_sink_config(handle);
+}
+
 static void trbe_pad_buf(struct perf_output_handle *handle, int len)
 {
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
-	u64 head = PERF_IDX2OFF(handle->head, buf);
+	struct trbe_buf *buf;
+	u64 head;
+
+	if (trbe_test_handle_buf(handle)) {
+		handle->head += len;
+		handle->size -= len;
+		return;
+	}
+
+	buf = trbe_handle_buf(handle);
+	head = PERF_IDX2OFF(handle->head, buf);
 
 	__trbe_pad_buf(buf, head, len);
 	if (!buf->snapshot)
@@ -389,7 +419,7 @@ static void trbe_pad_buf(struct perf_output_handle *handle, int len)
 
 static int trbe_snapshot_offset(struct perf_output_handle *handle)
 {
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_buf *buf = trbe_handle_buf(handle);
 
 	/*
 	 * The ETE trace has alignment synchronization packets allowing
@@ -403,7 +433,7 @@ static int trbe_snapshot_offset(struct perf_output_handle *handle)
 static u64 trbe_min_trace_buf_size(struct perf_output_handle *handle)
 {
 	u64 size = TRBE_TRACE_MIN_BUF_SIZE;
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_buf *buf = trbe_handle_buf(handle);
 	struct trbe_cpudata *cpudata = buf->cpudata;
 
 	/*
@@ -443,7 +473,7 @@ static bool trbe_wakeup_before_tail(struct perf_output_handle *handle,
 static u32 trbe_normal_trigger_count(struct perf_output_handle *handle,
 				     u64 head, u64 wakeup, u64 limit)
 {
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_buf *buf = trbe_handle_buf(handle);
 	struct trbe_cpudata *cpudata = buf->cpudata;
 	const u64 bufsize = buf->nr_pages * PAGE_SIZE;
 	u64 count;
@@ -507,7 +537,7 @@ static u32 trbe_normal_trigger_count(struct perf_output_handle *handle,
 static unsigned long __trbe_normal_offset(struct perf_output_handle *handle,
 					  struct trbe_buf_next *next)
 {
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_buf *buf = trbe_handle_buf(handle);
 	struct trbe_cpudata *cpudata = buf->cpudata;
 	const u64 bufsize = buf->nr_pages * PAGE_SIZE;
 	u64 limit = bufsize;
@@ -650,7 +680,7 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle,
 
 static int trbe_normal_offset(struct perf_output_handle *handle)
 {
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_buf *buf = trbe_handle_buf(handle);
 	struct trbe_buf_next next = { };
 	u64 limit;
 
@@ -679,7 +709,7 @@ static int trbe_normal_offset(struct perf_output_handle *handle)
 
 static int trbe_compute_next(struct perf_output_handle *handle)
 {
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_buf *buf = trbe_handle_buf(handle);
 	int ret;
 
 	perf_aux_output_flag(handle, PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW);
@@ -1193,7 +1223,7 @@ static int arm_trbe_enable(struct coresight_device *csdev, enum cs_mode mode,
 	struct trbe_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
 	struct perf_output_handle *handle = path->handle;
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_buf *buf = trbe_handle_buf(handle);
 	int ret;
 
 	WARN_ON(cpudata->cpu != smp_processor_id());
@@ -1333,7 +1363,7 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
 {
 	struct perf_output_handle *handle = cpudata->handle;
 	struct perf_event *event = handle->event;
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_buf *buf = trbe_handle_buf(handle);
 	unsigned long size;
 	struct etm_event_data *event_data;
 	u64 trcprgctlr = 0;
@@ -1381,7 +1411,7 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
 	 * truncate the trace to stop the event. A subsequent normal restart
 	 * installs the buffer and its CPU association through sink enable.
 	 */
-	buf = etm_perf_sink_config(handle);
+	buf = trbe_handle_buf(handle);
 	if (!buf || buf->cpudata != cpudata) {
 		ret = -EINVAL;
 		goto truncate_event;
@@ -1408,7 +1438,7 @@ static int trbe_handle_overflow(struct trbe_cpudata *cpudata,
 
 static bool is_perf_trbe(struct perf_output_handle *handle)
 {
-	struct trbe_buf *buf = etm_perf_sink_config(handle);
+	struct trbe_buf *buf = trbe_handle_buf(handle);
 	struct trbe_cpudata *cpudata;
 	struct trbe_drvdata *drvdata;
 	int cpu = smp_processor_id();
@@ -1988,3 +2018,7 @@ module_exit(arm_trbe_exit);
 MODULE_AUTHOR("Anshuman Khandual <anshuman.khandual@arm.com>");
 MODULE_DESCRIPTION("Arm Trace Buffer Extension (TRBE) driver");
 MODULE_LICENSE("GPL v2");
+
+#ifdef CONFIG_CORESIGHT_TRBE_KUNIT_TESTS
+#include "coresight-trbe-kunit-tests.c"
+#endif

-- 
2.34.1

