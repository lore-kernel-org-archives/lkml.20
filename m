Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AFD2D3733
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790529898; cv=none; b=R83Vf0oD/AqzeO4CZFJy40VFsj6r9o0FRYViw7Sabf8POr6kAOGcVdmTV/+Hd0/ci1NHxI9wUZno/n51xOfY8XoJwEdJSL1RGiGNJ/qQlLK38vqY2ofzrQs9VGcoPRNQ3P2zow37bjeE1A8Q0ZZL2ZAffYIcUoDzvlbkr80H3FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790529898; c=relaxed/simple;
	bh=sL+Fkc3YLiNXq0MTjd0o+fOKOWhNQkCKgJvKW8XAgwY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tWfd5qQUUa4N6hRl2fGYy14+tz5d9kDOhX8Kes0xI2viimz7cNAGPDtjtmlTP678XY6QZu2aA7izg8tsXH7eQDQkuOPzirEjezuSMMMA0VYy0ZlWfCpQ2nJL6dW3idk5BOd+fHpPrKOOivuAjhYJmMCQWhzM9JT3GUob8pnynug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p1HXwtS1; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p1HXwtS1"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso280315eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790529896; x=1791134696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Mrpap4vuw93yFpM2AvGPigU58bbN/HoM52OdmW2oTE=;
        b=p1HXwtS1DFkqYJl9nyql3reZomhoV1eAQdTn5npZno7XfArZjF7OjOyRW0v6n98kPB
         o34cr5ECXMIhYm949MKeCDJp0+0Yk35mEAsMiskMiRttyrTsAmL53A/FKnBwKDV5XGlm
         X84+NV6Ad7vuNBZYPyfXtcrTLJimPNtxXJNnkTD2vUkF83u7UbrpVNqbcP85CkeqtOeU
         rWWsbpeM1lotnc7dflsY3sUZUddhMZUBS+dDHLK63kZ7DlTxN77yhSgJyBRIGgx9V/u3
         hTOirDTq2MroXmYVBGh1cb7fitL8PiouCzo/B0MwGanFIjZYfDllDx1dsqrRLxrZB1gR
         hZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790529896; x=1791134696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Mrpap4vuw93yFpM2AvGPigU58bbN/HoM52OdmW2oTE=;
        b=mDkpcOq9/0vWk0CJkBF9fpK2kF/BjK93WxL4sxuYb1N+A6o2Wq5EIC3MX4otsu+uAH
         o8yhFng9001Rj6uWIBhfN8RnPGQWdUPKd0bcj41L+QPOTqXIY2SmIRKApEXbNLbjtRE+
         Q7o82cIqXyfbzF3BVlJEftqAjYCFMXfUsxSppsS6RUb2ll9k6ueVxwISQPPhH/6UhBmw
         2NkTY5t2pQg6rcR2ndClVrdiBcrSCs9HD//Kklds9Z3ODV/I0JKk8XGbsxEUHjrIzQZ+
         F6Z0i6nlXYF93MW/IGRz5BGU3eoW5EygHIE8AM4kQSJC6o0QtJuvmXHBNQkj1+l1sQgO
         Isbg==
X-Forwarded-Encrypted: i=1; AKwUvBweckWEt6eJoh8jsA0r0mWQEFJ7kUCKG3ENpbR0Ygl25ELzvcex1aex1ePREvxv6bC9szVgWS24abLhst0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+jUjaQC9GREZmNbQAjPSsh+xCF9QAey9D7WSnVzu2AkqucJLy
	UZwaAdAU8dHN4ntog8xivV+8WKCwnlZGkxrImmtD9JJEGFsrdVSaXn/fZrHCcmJK
X-Gm-Gg: AYBFou2TslGlDmn22fRMrhYBNiaQmrogJENBdMd5KwFC9kmX/t4WwTFyeLy3vYkNRYO
	0sEkUF4B7zpFL2yf/0We6omWvznDFFiuQ8aWhI8KEMLC09BYydjuxBzqRQT2QcDEZXjv/BxVjZG
	ecU0IPVdcrUjkhvW/AnwrkOE4GVadgjd9394TaxWQRcSehJ8x6rFaKgcqqqXHdvQpuOlNciXc4u
	3bcMtFyBe5Xx9LQpjMLjygUvrN3N/as/l35Z/r33AuPbbqlEO9k7IHPT9LSYLyiy1YnRZDLzd3e
	wSG5P3iSVfa0+ibYZcDI8prNAoQZx08GwMMQzNTCPSSKlhSMUho8Cuz7F5PLrLj7PwldNATEmww
	Hop40O5xXCZO9L9nNQCs2KwX6VsQ2riCzA23xvlkKw2M0lnt2g6NYs+VVnm7D3f2wsBI6hNu3v2
	YcBN0frYYlzx1GfP5lh3QMbtZttDyMrMOl6wWgBwSYTpPN/CzVlUS8gqJEdKHCdYhuT+0DflZtx
	6kejIgvQZiTD66ydgYjGiw=
X-Received: by 2002:a05:693c:2589:b0:340:f698:fd56 with SMTP id 5a478bee46e88-34273249209mr11024375eec.2.1790529895897;
        Sun, 27 Sep 2026 10:24:55 -0700 (PDT)
Received: from localhost.localdomain ([60.243.188.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3433628f5basm13777515eec.18.2026.09.27.10.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 10:24:55 -0700 (PDT)
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Subject: [RFC PATCH] remoteproc: core: add KUnit tests for rproc_check_carveout_da()
Date: Sun, 27 Sep 2026 22:54:28 +0530
Message-Id: <20260927172428.110718-1-saileshnandanavanam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit test suite covering rproc_check_carveout_da(), the
internal helper that validates a resource-table-requested (da, len)
pair against an already-allocated carveout's bounds.

The test is #include'd directly into remoteproc_core.c (a pattern
already used by mm/damon/) rather than built as a separate module,
since rproc_check_carveout_da() is static and this avoids adding an
exported symbol purely for test visibility.

Six cases are included, exercising every branch of the function:
requested length exceeding the carveout, a specific da requested
against a carveout with none set, a da before the carveout's start,
a (da + len) past the carveout's end, an exact boundary fit, and the
FW_RSC_ADDR_ANY skip-check path.

Verified via:
 - QEMU (x86_64), booting a kernel with CONFIG_REMOTEPROC_KUNIT_TEST=y
 - tools/testing/kunit/kunit.py under UML

All 6 cases pass in both environments:

    # remoteproc_core: pass:6 fail:0 skip:0 total:6

This is posted as an RFC to check whether this structure (test
headers embedded per-file, DAMON-style) is the preferred approach for
remoteproc before expanding coverage to other files in the driver
(remoteproc_virtio.c, remoteproc_sysfs.c, etc.).

Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
---
 drivers/remoteproc/Kconfig                    |  10 ++
 drivers/remoteproc/remoteproc_core.c          |   4 +
 .../remoteproc/tests/remoteproc_core-kunit.h  | 130 ++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 drivers/remoteproc/tests/remoteproc_core-kunit.h

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 5b56b2dcc725..dc5a8f483693 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -390,6 +390,16 @@ config XLNX_R5_REMOTEPROC
 
 	  It's safe to say N if not interested in using RPU r5f cores.
 
+config REMOTEPROC_KUNIT_TEST
+	bool "KUnit tests for remoteproc core" if !KUNIT_ALL_TESTS
+	depends on REMOTEPROC && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  Enable KUnit tests for the remoteproc core, covering internal
+	  helpers such as carveout/address-translation logic.
+
+	  If unsure, say N.
+
 endif # REMOTEPROC
 
 endmenu
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 1ed406714849..4f0ad28305d2 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2839,3 +2839,7 @@ static void __exit remoteproc_exit(void)
 module_exit(remoteproc_exit);
 
 MODULE_DESCRIPTION("Generic Remote Processor Framework");
+
+#if IS_ENABLED(CONFIG_REMOTEPROC_KUNIT_TEST)
+#include "tests/remoteproc_core-kunit.h"
+#endif
diff --git a/drivers/remoteproc/tests/remoteproc_core-kunit.h b/drivers/remoteproc/tests/remoteproc_core-kunit.h
new file mode 100644
index 000000000000..615a854fffbf
--- /dev/null
+++ b/drivers/remoteproc/tests/remoteproc_core-kunit.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _REMOTEPROC_CORE_KUNIT_H
+#define _REMOTEPROC_CORE_KUNIT_H
+
+#include <kunit/test.h>
+
+/*
+ * Tests for rproc_check_carveout_da().
+ *
+ * The function is static, so this header is #include'd directly at the
+ * bottom of remoteproc_core.c (see CONFIG_REMOTEPROC_KUNIT_TEST), giving
+ * it access to the symbol despite the lack of external linkage.
+ *
+ * rproc_check_carveout_da() only touches &rproc->dev for dev_err() on
+ * its failure paths, so a zeroed struct rproc is sufficient here -- no
+ * device registration needed. dev_err()'s formatting chain
+ * (dev_driver_string() -> "" on NULL driver/bus/class, dev_name() ->
+ * NULL on an unregistered device, and the kernel's own %s NULL guard
+ * in lib/vsprintf.c) is safe end-to-end against a bare zeroed device.
+ */
+
+static void rproc_test_check_carveout_len_exceeds(struct kunit *test)
+{
+	struct rproc rproc = { 0 };
+	struct rproc_mem_entry mem = { 0 };
+	int ret;
+
+	/* mem->len = 0x100; request len 0x200 with no da constraint */
+	mem.da = FW_RSC_ADDR_ANY;
+	mem.len = 0x100;
+
+	ret = rproc_check_carveout_da(&rproc, &mem, FW_RSC_ADDR_ANY, 0x200);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
+static void rproc_test_check_carveout_da_any_mismatch(struct kunit *test)
+{
+	struct rproc rproc = { 0 };
+	struct rproc_mem_entry mem = { 0 };
+	int ret;
+
+	/* caller wants a specific da, but the carveout itself has none set */
+	mem.da = FW_RSC_ADDR_ANY;
+	mem.len = 0x100;
+
+	ret = rproc_check_carveout_da(&rproc, &mem, 0x1000, 0x50);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
+static void rproc_test_check_carveout_da_negative_delta(struct kunit *test)
+{
+	struct rproc rproc = { 0 };
+	struct rproc_mem_entry mem = { 0 };
+	int ret;
+
+	/* requested da (0x1000) lies before the carveout's da (0x2000) */
+	mem.da = 0x2000;
+	mem.len = 0x100;
+
+	ret = rproc_check_carveout_da(&rproc, &mem, 0x1000, 0x10);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
+static void rproc_test_check_carveout_da_exceeds_end(struct kunit *test)
+{
+	struct rproc rproc = { 0 };
+	struct rproc_mem_entry mem = { 0 };
+	int ret;
+
+	/* delta (0x80) + len (0x100) = 0x180, one byte over mem->len (0x100) -> 0x180 > 0x100 */
+	mem.da = 0x1000;
+	mem.len = 0x100;
+
+	ret = rproc_check_carveout_da(&rproc, &mem, 0x1080, 0x100);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+}
+
+static void rproc_test_check_carveout_da_exact_fit(struct kunit *test)
+{
+	struct rproc rproc = { 0 };
+	struct rproc_mem_entry mem = { 0 };
+	int ret;
+
+	/*
+	 * Boundary case: delta (0xf0) + len (0x10) == mem->len (0x100)
+	 * exactly. The check is "> mem->len", so this must pass -- this
+	 * is exactly the kind of edge an off-by-one would break.
+	 */
+	mem.da = 0x1000;
+	mem.len = 0x100;
+
+	ret = rproc_check_carveout_da(&rproc, &mem, 0x10f0, 0x10);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static void rproc_test_check_carveout_da_any_skip_check(struct kunit *test)
+{
+	struct rproc rproc = { 0 };
+	struct rproc_mem_entry mem = { 0 };
+	int ret;
+
+	/*
+	 * da == FW_RSC_ADDR_ANY -> address check is skipped entirely,
+	 * only len is validated against mem->len.
+	 */
+	mem.da = 0x1000;
+	mem.len = 0x100;
+
+	ret = rproc_check_carveout_da(&rproc, &mem, FW_RSC_ADDR_ANY, 0x50);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+}
+
+static struct kunit_case rproc_core_test_cases[] = {
+	KUNIT_CASE(rproc_test_check_carveout_len_exceeds),
+	KUNIT_CASE(rproc_test_check_carveout_da_any_mismatch),
+	KUNIT_CASE(rproc_test_check_carveout_da_negative_delta),
+	KUNIT_CASE(rproc_test_check_carveout_da_exceeds_end),
+	KUNIT_CASE(rproc_test_check_carveout_da_exact_fit),
+	KUNIT_CASE(rproc_test_check_carveout_da_any_skip_check),
+	{}
+};
+
+static struct kunit_suite rproc_core_test_suite = {
+	.name = "remoteproc_core",
+	.test_cases = rproc_core_test_cases,
+};
+
+kunit_test_suite(rproc_core_test_suite);
+
+#endif /* _REMOTEPROC_CORE_KUNIT_H */
-- 
2.34.1

