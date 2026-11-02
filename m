Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634765;
	b=aeAxg9d44WgxrXE3EmYhw0DFU6g4MxKuUOfQWLQ3itwqYTwio+68wxmgYWueCe6FSOSh
	 X7Dw/n+JTvvSDs9Uh2J65yDUEzaWc9tpXjxgccd2jxM2pPoZC/pvr2/HjpEu/noJaOJ/k
	 1LSDxwrlcSdT3zeCuD1sMS7yNYkZ1yY77zB6qPbsJ5dsKFT7fmuzM9E4lN7XvnBrUegb2
	 4SpZcrnVHXoejO1bw5t9HczEx6w1o0fHflFISnpvM0gZx2U4sp9yE4AYyhA3rfzRcb0zK
	 dMdSZZvf5aba5MTHQ9ppWFEZajoPab5ypkth8gLqHhq+xqGosNPr69T9q49nGv47uPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634765;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w6Y6e+xAw5MQ+ALCeUKut6/Y+RkoG9YtlyYbDh09rhI=;
	b=GsUHfSQJGhAJohYT6tcGndoqQg/gRa6j/OCbK5nEAPUxXY0/9plFHSFHvvgHVIqo3BNQ
	 Y6tiXOu8CQwfcHaqXEeMrkREl1w1RmnZv3pbFn1tZ9FagNNFFgHS2AfaMijeBh/OKSBl7
	 J6x+Q7SlMpqyurINWhMR59cKSXekC/aGUOu72nXgNRTx8WBjiPfseqXrm1x4GcK2gFQI7
	 hfSVrzClfKFTl1gCrdKW79SKUGBMnjY0U4sFmIQB0XLgIljzvQJXai/KAicA3QXSPRqOC
	 7jz+KQkHoAlfgiGGRUNR7vXBbiGDjYZbmafUkt3DV5TnoO9um1nnImMoE+2sDL7kCNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WaYOjJIG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66536606D821
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WaYOjJIG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3410C1F00A16;
	Mon,  2 Nov 2026 15:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793634765;
	bh=w6Y6e+xAw5MQ+ALCeUKut6/Y+RkoG9YtlyYbDh09rhI=;
	h=From:To:Cc:Subject:Date;
	b=WaYOjJIGDxbP+uyPBpyV18rjSzgof+LXUjPKj1x8dy80Z1pe8UcT03jOxlcRuLhaq
	 vxkN/3jLbxRhXMiJQnO7A6s0Qfj548LgSPd6FkZxRCSM4/P1+pbUvi+/hsIZBsfnQn
	 UokcAD9g+g85O0vbbi23MuLL2zp0amwCDG+/FZacJ5tnq5slEmz4OJtnbLS4mTFCij
	 Jhq8sepEhSvzhAp2HjhcwtLypTH0NkkdNEJ81UhDi4sN8BI2gue+C0yZanHhvHlfiM
	 QxczS/oTV2+GpcRDniV5+URw1Vl2Y2B6RP01vGQ0DCGAzphnBsmpOJYL5Wuc4b2M8L
	 S/dV4DnY6zJnQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v2] reset: Add KUnit test cases
Date: Mon,  2 Nov 2026 23:52:07 +0800
Message-ID: <20261102155207.19252-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 9035073d0ef1 ("reset: convert reset core to using firmware
nodes"), reset suppliers and consumers can be wired up using software
nodes without requiring Device Tree or hardware devices.  Leverage this
to add KUnit test cases for the reset controller framework.

The test cases cover the following scenarios:

- Basic: Verifies that a consumer can acquire a reset control via
  fwnode and perform reset, assert, deassert, status, release, and
  acquire operations.
- Use After Unregister: Verifies that after the supplier unregisters
  the reset_controller_dev while a consumer still holds a reset_control
  handle, subsequent consumer operations fail safely with -ENODEV.
- Concurrent Unregister: Verifies that unregistering the
  reset_controller_dev concurrently with an in-flight reset operation
  waits for the active operation to complete before returning.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Test:
$ ./tools/testing/kunit/kunit.py run \
        --kconfig_add CONFIG_RESET_CONTROLLER=y \
        --kconfig_add CONFIG_RESET_KUNIT_TEST=y \
        reset_test
---
v2:
- Separate out from the revocable series.
- Add reset_test_exit() to clean up rstc and rcdev on test exit or
  assertion failure.
- Clean up kthreads on error paths in reset_test_concurrent_unregister().

v1: https://lore.kernel.org/all/20261011121246.162759-5-tzungbi@kernel.org
---
 drivers/reset/Kconfig     |   5 +
 drivers/reset/Makefile    |   2 +
 drivers/reset/core-test.c | 351 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 358 insertions(+)
 create mode 100644 drivers/reset/core-test.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f..c7dceec8f58c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -457,4 +457,9 @@ source "drivers/reset/starfive/Kconfig"
 source "drivers/reset/sti/Kconfig"
 source "drivers/reset/tegra/Kconfig"
 
+config RESET_KUNIT_TEST
+	tristate "KUnit tests for reset controller" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+
 endif
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6bbe3..bb01198d495b 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -55,3 +55,5 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_RESET_ZYNQMP) += reset-zynqmp.o
+
+obj-$(CONFIG_RESET_KUNIT_TEST) += core-test.o
diff --git a/drivers/reset/core-test.c b/drivers/reset/core-test.c
new file mode 100644
index 000000000000..613db78040c6
--- /dev/null
+++ b/drivers/reset/core-test.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Google LLC
+ *
+ * KUnit tests for the reset controller.
+ *
+ * The test cases cover the following scenarios:
+ *
+ * - Basic: Verifies that a consumer can acquire a reset control via
+ *   fwnode and perform reset, assert, deassert, status, release, and
+ *   acquire operations.
+ *
+ * - Use After Unregister: Verifies that after the supplier unregisters
+ *   the reset_controller_dev while a consumer still holds a reset_control
+ *   handle, subsequent consumer operations fail safely with -ENODEV.
+ *
+ * - Concurrent Unregister: Verifies that unregistering the
+ *   reset_controller_dev concurrently with an in-flight reset operation
+ *   waits for the active operation to complete before returning.
+ */
+
+#include <kunit/fwnode.h>
+#include <kunit/test.h>
+
+#include <linux/completion.h>
+#include <linux/fwnode.h>
+#include <linux/iopoll.h>
+#include <linux/kthread.h>
+#include <linux/property.h>
+#include <linux/reset-controller.h>
+#include <linux/reset.h>
+#include <linux/sched/task.h>
+
+struct reset_test_context {
+	struct fwnode_handle *supp_fwnode;
+	struct fwnode_handle *cons_fwnode;
+	struct reset_controller_dev rcdev;
+	bool rcdev_registered;
+	struct reset_control *rstc;
+
+	int reset_count;
+	int assert_count;
+	int deassert_count;
+	int status_count;
+
+	void *priv;
+};
+
+static int reset_test_op_reset(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct reset_test_context *ctx = container_of(rcdev, typeof(*ctx), rcdev);
+
+	ctx->reset_count++;
+	return 0;
+}
+
+static int reset_test_op_assert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct reset_test_context *ctx = container_of(rcdev, typeof(*ctx), rcdev);
+
+	ctx->assert_count++;
+	return 0;
+}
+
+static int reset_test_op_deassert(struct reset_controller_dev *rcdev,
+				  unsigned long id)
+{
+	struct reset_test_context *ctx = container_of(rcdev, typeof(*ctx), rcdev);
+
+	ctx->deassert_count++;
+	return 0;
+}
+
+static int reset_test_op_status(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct reset_test_context *ctx = container_of(rcdev, typeof(*ctx), rcdev);
+
+	ctx->status_count++;
+	return 0;
+}
+
+static const struct reset_control_ops reset_test_ops = {
+	.reset = reset_test_op_reset,
+	.assert = reset_test_op_assert,
+	.deassert = reset_test_op_deassert,
+	.status = reset_test_op_status,
+};
+
+static int reset_test_init(struct kunit *test)
+{
+	static const struct property_entry supp_props[] = {
+		PROPERTY_ENTRY_U32("#reset-cells", 1),
+		{}
+	};
+	static const struct software_node supp_swnode = {
+		.name = "reset-test-supplier",
+		.properties = supp_props,
+	};
+	static const struct software_node_ref_args refs[] = {
+		SOFTWARE_NODE_REFERENCE(&supp_swnode, 0),
+	};
+	static const struct property_entry cons_props[] = {
+		PROPERTY_ENTRY_REF_ARRAY("resets", refs),
+		{}
+	};
+
+	struct reset_test_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+	test->priv = ctx;
+
+	ctx->supp_fwnode = kunit_software_node_register(test, &supp_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->supp_fwnode);
+
+	ctx->cons_fwnode = kunit_fwnode_create_software_node(test, cons_props,
+							     NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->cons_fwnode);
+
+	ctx->rcdev.ops = &reset_test_ops;
+	ctx->rcdev.nr_resets = 1;
+	ctx->rcdev.fwnode = ctx->supp_fwnode;
+
+	ret = reset_controller_register(&ctx->rcdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	ctx->rcdev_registered = true;
+
+	ctx->rstc = __fwnode_reset_control_get(ctx->cons_fwnode, NULL, 0,
+					       RESET_CONTROL_EXCLUSIVE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->rstc);
+
+	return 0;
+}
+
+static void reset_test_exit(struct kunit *test)
+{
+	struct reset_test_context *ctx = test->priv;
+
+	if (!ctx)
+		return;
+
+	reset_control_put(ctx->rstc);
+	if (ctx->rcdev_registered)
+		reset_controller_unregister(&ctx->rcdev);
+}
+
+static void reset_test_basic(struct kunit *test)
+{
+	struct reset_test_context *ctx = test->priv;
+	struct reset_control *rstc = ctx->rstc;
+
+	KUNIT_EXPECT_EQ(test, ctx->reset_count, 0);
+	KUNIT_EXPECT_EQ(test, reset_control_reset(rstc), 0);
+	KUNIT_EXPECT_EQ(test, ctx->reset_count, 1);
+
+	KUNIT_EXPECT_EQ(test, ctx->assert_count, 0);
+	KUNIT_EXPECT_EQ(test, reset_control_assert(rstc), 0);
+	KUNIT_EXPECT_EQ(test, ctx->assert_count, 1);
+
+	KUNIT_EXPECT_EQ(test, ctx->deassert_count, 0);
+	KUNIT_EXPECT_EQ(test, reset_control_deassert(rstc), 0);
+	KUNIT_EXPECT_EQ(test, ctx->deassert_count, 1);
+
+	KUNIT_EXPECT_EQ(test, ctx->status_count, 0);
+	KUNIT_EXPECT_EQ(test, reset_control_status(rstc), 0);
+	KUNIT_EXPECT_EQ(test, ctx->status_count, 1);
+
+	reset_control_release(rstc);
+	KUNIT_EXPECT_EQ(test, reset_control_acquire(rstc), 0);
+}
+
+static void reset_test_use_after_unregister(struct kunit *test)
+{
+	struct reset_test_context *ctx = test->priv;
+	struct reset_control *rstc = ctx->rstc;
+
+	KUNIT_EXPECT_EQ(test, ctx->reset_count, 0);
+	KUNIT_EXPECT_EQ(test, reset_control_reset(rstc), 0);
+	KUNIT_EXPECT_EQ(test, ctx->reset_count, 1);
+
+	/* Unregister supplier while consumer still holds rstc. */
+	reset_controller_unregister(&ctx->rcdev);
+	ctx->rcdev_registered = false;
+
+	KUNIT_EXPECT_EQ(test, ctx->reset_count, 1);
+	KUNIT_EXPECT_EQ(test, reset_control_reset(rstc), -ENODEV);
+	KUNIT_EXPECT_EQ(test, ctx->reset_count, 1);
+
+	KUNIT_EXPECT_EQ(test, reset_control_assert(rstc), -ENODEV);
+	KUNIT_EXPECT_EQ(test, reset_control_deassert(rstc), -ENODEV);
+	KUNIT_EXPECT_EQ(test, reset_control_status(rstc), -ENODEV);
+
+	reset_control_release(rstc);
+	KUNIT_EXPECT_EQ(test, reset_control_acquire(rstc), -ENODEV);
+}
+
+struct test_concurrent_unregister_context {
+	struct kunit *test;
+	struct completion started, enter;
+	struct task_struct *thread;
+
+	/* Used by test consumer. */
+	struct completion entered, exit;
+	int expected_ret;
+};
+
+static int test_concurrent_unregister_supplier(void *data)
+{
+	struct test_concurrent_unregister_context *ctx = data;
+	struct reset_test_context *rtc = ctx->test->priv;
+
+	complete(&ctx->started);
+
+	if (wait_for_completion_interruptible(&ctx->enter))
+		return 0;
+	reset_controller_unregister(&rtc->rcdev);
+	rtc->rcdev_registered = false;
+
+	return 0;
+}
+
+static int test_concurrent_unregister_consumer(void *data)
+{
+	struct test_concurrent_unregister_context *ctx = data;
+	struct reset_test_context *rtc = ctx->test->priv;
+	int ret;
+
+	complete(&ctx->started);
+
+	if (wait_for_completion_interruptible(&ctx->enter))
+		return 0;
+
+	ret = reset_control_reset(rtc->rstc);
+	KUNIT_EXPECT_EQ(ctx->test, ret, ctx->expected_ret);
+
+	return 0;
+}
+
+static int
+reset_test_concurrent_unregister_op_reset(struct reset_controller_dev *rcdev,
+					  unsigned long id)
+{
+	struct reset_test_context *rtc = container_of(rcdev, typeof(*rtc), rcdev);
+	struct test_concurrent_unregister_context *ctx = rtc->priv;
+
+	rtc->reset_count++;
+	complete(&ctx->entered);
+
+	wait_for_completion_interruptible(&ctx->exit);
+	return ctx->expected_ret;
+}
+
+static const struct reset_control_ops reset_test_concurrent_unregister_ops = {
+	.reset = reset_test_concurrent_unregister_op_reset,
+};
+
+static void reset_test_concurrent_unregister(struct kunit *test)
+{
+	struct reset_test_context *rtc = test->priv;
+	struct test_concurrent_unregister_context *ctx;
+	int i, ret, val;
+
+	rtc->rcdev.ops = &reset_test_concurrent_unregister_ops;
+
+	ctx = kunit_kmalloc_array(test, 3, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+
+	for (i = 0; i < 3; ++i) {
+		ctx[i].test = test;
+		init_completion(&ctx[i].started);
+		init_completion(&ctx[i].enter);
+
+		if (i == 0) {
+			ctx[i].thread = kthread_run(
+				test_concurrent_unregister_supplier, ctx + i,
+				"supplier%d", i);
+		} else {
+			init_completion(&ctx[i].entered);
+			init_completion(&ctx[i].exit);
+
+			ctx[i].thread = kthread_run(
+				test_concurrent_unregister_consumer, ctx + i,
+				"consumer%d", i);
+		}
+		if (IS_ERR(ctx[i].thread)) {
+			ret = PTR_ERR(ctx[i].thread);
+			while (i--)
+				kthread_stop_put(ctx[i].thread);
+			KUNIT_ASSERT_EQ(test, ret, 0);
+		}
+		get_task_struct(ctx[i].thread);
+
+		wait_for_completion(&ctx[i].started);
+	}
+
+	rtc->priv = &ctx[1];
+	ctx[1].expected_ret = 0x12345678;
+	/* consumer1 enters reset(). */
+	KUNIT_EXPECT_EQ(test, rtc->reset_count, 0);
+	complete(&ctx[1].enter);
+	wait_for_completion(&ctx[1].entered);
+	KUNIT_EXPECT_EQ(test, rtc->reset_count, 1);
+
+	/* supplier0 unregisters. */
+	complete(&ctx[0].enter);
+	ret = read_poll_timeout(reset_control_status, val, val == -ENODEV,
+				1000, 100000, false, rtc->rstc);
+	if (ret) {
+		for (i = 2; i >= 0; --i)
+			kthread_stop_put(ctx[i].thread);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+	}
+	/* supplier0 can't exit.  It's waiting for all consumers. */
+
+	ctx[2].expected_ret = -ENODEV;
+	/* consumer2 must see -ENODEV. */
+	complete(&ctx[2].enter);
+	kthread_stop_put(ctx[2].thread);
+
+	/* consumer1 exits reset(). */
+	complete(&ctx[1].exit);
+	kthread_stop_put(ctx[1].thread);
+	kthread_stop_put(ctx[0].thread);
+
+	/* Subsequent access must see -ENODEV. */
+	KUNIT_EXPECT_EQ(test, reset_control_reset(rtc->rstc), -ENODEV);
+}
+
+static struct kunit_case reset_test_cases[] = {
+	KUNIT_CASE(reset_test_basic),
+	KUNIT_CASE(reset_test_use_after_unregister),
+	KUNIT_CASE(reset_test_concurrent_unregister),
+	{}
+};
+
+static struct kunit_suite reset_test_suite = {
+	.name = "reset_test",
+	.test_cases = reset_test_cases,
+	.init = reset_test_init,
+	.exit = reset_test_exit,
+};
+
+kunit_test_suite(reset_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Tzung-Bi Shih <tzungbi@kernel.org>");
+MODULE_DESCRIPTION("KUnit tests for the reset controller");
-- 
2.53.0

