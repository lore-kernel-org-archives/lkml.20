Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148006;
	b=LbAPIKKPoRGWkajoi+1cdUlzctroMqm+jkirb1QrUjPhAwNxyrnTF49mtXX2stOCDr3X
	 tM/qM/loP2850fnb2FW4UTnp2vIU8ZpCBShRQKrRSAkUE8Yn0MYfXU1FoMARpHqJjt9Xu
	 ipm02FKxojT4ydDMncD3Qo0tDISAX1qrqHW6dvX0xzrLxRM0WN6tqwxPikd4g8OkqyMyq
	 KJtL2bLAULWADQ2e7hpjNVVpEnmhHiD4VFvJDuvPFuT1l4R14MdDkW1qAmSsBL/Y5E/c3
	 GUNjwOYE+aqCHCX2FWtZYw9gtpfbtrgEjyFZEk/HOdsQz0nEA8MBuXo7F57FYeiZzOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=anI1ChYfeZjCgF1xgVXnWSsm/4XxjRJS3uHT+I8cNNc=;
	b=d5ji8soaBrx8t1btIWhwSWskcfW8dIr5Kaz5EAA+jQ6N3+Kq1P5ShSo9rIv2uzAxqxVV
	 /lLDi8y8M3HvRIYsfaa/wO3dHiXQkkis6iNgqCaCQfxPRhg8ZNEa9lkTrIUsgW/JV/QzN
	 gBMapKmmVD+AQYfMR/VVS/OsbBSMOu++I9jLZg8Gqv91i/9BBmsppuOl9JVqwZ2K6YsZ5
	 hTgk78iLj0b378DgA8DchltKqmcCJmNtyeR00yuFRX4wxo+LE4DyyNllEj6W8v7zys7Zv
	 +P275yvgTZS7i8ntBo7BtptRnc1gEyA9fLtQw5OjoybIbehy6lUvFr17HjWYaGSSbXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WbqiPByv;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA58606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA58606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WbqiPByv
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so127525eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794148004; x=1794752804; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=anI1ChYfeZjCgF1xgVXnWSsm/4XxjRJS3uHT+I8cNNc=;
        b=WbqiPByvbZWkV1GSGzcT8Qm15ysm76YJWuKHyCwgIkO6CDl9nnMxOKrPIsIwhFXy4h
         oZyo/1AGKqXdIbshvRbqMIB6QrDqRXp/IXU6CROm4rQb0BXE6RiCV3YUr9sATuJDEBrE
         7MPjn+ZsKskGRCPfKse5i4j29teUHM68CuJbUZnih+jinn8bBM7eaugZTU1tOQbIWvBF
         v3bRyo92R4VzyOaSyYYZVh+gpfRF18amhhe1TyRBSTEQSyXLGfcgc80hXqjqT+lWh6MQ
         X1o1ZUxtAX20mHmdsN9hY2wJwlw6ZTR6lGxJRzbT0y7B+oDz8F4KfTIknor7Ysd9HESy
         Mpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148004; x=1794752804;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=anI1ChYfeZjCgF1xgVXnWSsm/4XxjRJS3uHT+I8cNNc=;
        b=TwjzcAEJvGXypDfNCg07BV8aF0MCJgXv55IRqoi8qmPyvaNKpjTb1jr98JXElSRrXf
         h7BAgrCHO+ZYZRHLeqs6paHprmvsecgZRxJM3Cc7FZBLTXOezTyQlkwlV4xqLJe97QaB
         KR3BwvP1I+r6OSQ/F1nPKHX2ZA+tHGjohGzhugVDqVAdiwwF3FEAMkXPDhNHjgUe/gR3
         SB+VsOOXRFA5UcuLQqRHrHAlAhCapNEoBTbOSgd0xfX2ELfrpSYM+HdP5GRkkK2Zvc4t
         o6JlpT14kmC8aXob1f6FhSi/LvVg+kbvJRnG88N3wGNDqLWPYyVMtTLVMmiIhIULfjFF
         LaZA==
X-Gm-Message-State: APuU4Z+goT+I6XvRA8miQ2+JofXrAlSHHb0fY0gfD/UBy9+KQneT20bH
	WFiTfUZ64EIAORXCxkkLbIWVfrp01FlPoGeAPqXxw37HzEoaCmtkOPPg17NEg44Mj2gAQU0L
X-Gm-Gg: AYBFou1mC1VMBCwGJ5SHgSZGpTmQA23GIWYJCFV0gpeAJPlKwJT9/gZMvdwM49lT0th
	qLJc7/WpkQ649OZMgRjnpxrZN9x2uunxQVoAGA7y5NPZTCJEgfL1DBXFG0b3cHhZtmMXL0l+g1T
	ODspLlPz6L/swbN77CORcoA2rHTiy/5HEoFgESGjTpod5JMaZZD5UOJ0ZORipYRg7HVg/QAW5uA
	kvNOp3O8hd3OcGe2eVWMgNy16FEEEaQWCW53ITyhlAoEQWqJfvS3G7P6AnJ+sDbD6KQLQzdhgLO
	2AQEUaEmhRQjwpHCQzTvgFMZ05f1rt+vZcas70yuXrkWtTiu2IIc/ukcNH0ag6y9sncXvkLJuVj
	T8PZySj75wR+JTqSpHhMi7gWrlc9vPGK88RRRo6fEM3A1Bi/JvUzI2cA/xDMHkQEltN1hBwEVwj
	vk4xSnQ3v7K1B0AbpuJBbfqvCcttV7rVKdNVW4exOaMxSB0yPA4PLjQvIlP5hVpiux5v6q13c5D
	7tRSr4CEnKPtH4LB+Q+6XI+r6+ZArPILmMOEcoHxRNKOBfBptM1/bSEtcD9mxAIGcuSjlIvzn4e
	3SmOa6GiwkcKdEJPU+LfeoeR8nFmTlVeXSKJXucfeFbuWeUr1/1rmZK/80De/gFb66pG16sV/ur
	VnRp+rsHAyLCMsxYh/jj6/5wUUAWr18LF1cDr2cMY8CIHl8I=
X-Received: by 2002:a05:701b:424b:20b0:1b2:32e1:3bb4 with SMTP id a92af1059eb24-1b39fed71a0mr2656735c88.18.1794148004300;
        Sun, 08 Nov 2026 06:26:44 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771e5728sm5601098c88.16.2026.11.08.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:26:43 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Mon, 09 Nov 2026 01:23:46 +1100
Subject: [PATCH] mm/damon/paddr: add KUnit tests for addr_unit conversion
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-test-damon-paddr-addr-unit-kunit-v1-1-bd10bb87be98@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWN2wrCMBBEf6Xss4tN8P4rxYdctjZKtiVJVSj9d
 9MEXwbOMJxZIFJwFOHWLBDo7aIbOYPYNWAGxQ9CZzODbOVJiPaKiWJCq/zIOClrA5aY2SV8ldS
 yP5MUx4OlC2TNFKh333LR3SvHWT/JpM27LbSKhDooNsNWVW2V/W/33iPTB9b1B4FX6YSyAAAA
X-Change-ID: 20261109-test-damon-paddr-addr-unit-kunit-b2f7e2154de8
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, damon@lists.linux.dev, linux-mm@kvack.org
X-Mailer: b4 0.16.0

damon_pa_phys_addr() and damon_pa_core_addr() convert between DAMON core
addresses and physical addresses using addr_unit.  addr_unit lets 32-bit
kernels with a 64-bit phys_addr_t monitor physical memory above 4 GiB,
but no test covers the conversions.

Add a KUnit suite for both helpers, including a case for addresses above
4 GiB that is skipped when phys_addr_t is 32-bit.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
KUnit passes on x86_64 and i386.  Selftests pass on x86_64, except for
damos_quota.py, which is flaky even without this patch.
---
 mm/damon/Kconfig             | 12 ++++++++++
 mm/damon/paddr.c             |  2 ++
 mm/damon/tests/.kunitconfig  |  4 ++++
 mm/damon/tests/paddr-kunit.h | 55 ++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+)

diff --git a/mm/damon/Kconfig b/mm/damon/Kconfig
index 34631a44cdec..6f8722fcf464 100644
--- a/mm/damon/Kconfig
+++ b/mm/damon/Kconfig
@@ -65,6 +65,18 @@ config DAMON_VADDR_KUNIT_TEST
 
 	  If unsure, say N.
 
+config DAMON_PADDR_KUNIT_TEST
+	bool "Test for DAMON physical address space operations" if !KUNIT_ALL_TESTS
+	depends on DAMON_PADDR && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the DAMON physical address operations Kunit test suite.
+
+	  For more information on KUnit and unit tests in general, please refer
+	  to the KUnit documentation.
+
+	  If unsure, say N.
+
 config DAMON_SYSFS
 	bool "DAMON sysfs interface"
 	depends on DAMON && SYSFS
diff --git a/mm/damon/paddr.c b/mm/damon/paddr.c
index 5b773012a876..e89cb14ee17b 100644
--- a/mm/damon/paddr.c
+++ b/mm/damon/paddr.c
@@ -479,3 +479,5 @@ static int __init damon_pa_initcall(void)
 }
 
 subsys_initcall(damon_pa_initcall);
+
+#include "tests/paddr-kunit.h"
diff --git a/mm/damon/tests/.kunitconfig b/mm/damon/tests/.kunitconfig
index 144d27e6ecc5..9279f0c82be7 100644
--- a/mm/damon/tests/.kunitconfig
+++ b/mm/damon/tests/.kunitconfig
@@ -9,6 +9,10 @@ CONFIG_PAGE_IDLE_FLAG=y
 CONFIG_DAMON_VADDR=y
 CONFIG_DAMON_VADDR_KUNIT_TEST=y
 
+# for DAMON paddr ops
+CONFIG_DAMON_PADDR=y
+CONFIG_DAMON_PADDR_KUNIT_TEST=y
+
 # for DAMON sysfs interface
 CONFIG_SYSFS=y
 CONFIG_DAMON_SYSFS=y
diff --git a/mm/damon/tests/paddr-kunit.h b/mm/damon/tests/paddr-kunit.h
new file mode 100644
index 000000000000..9839cc233071
--- /dev/null
+++ b/mm/damon/tests/paddr-kunit.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Data Access Monitor Unit Tests
+ */
+
+#ifdef CONFIG_DAMON_PADDR_KUNIT_TEST
+
+#ifndef _DAMON_PADDR_TEST_H
+#define _DAMON_PADDR_TEST_H
+
+#include <kunit/test.h>
+
+static void damon_test_pa_phys_addr(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, damon_pa_phys_addr(0x1000, 1), 0x1000);
+	KUNIT_EXPECT_EQ(test, damon_pa_phys_addr(0x40000, 0x1000), 0x40000000);
+}
+
+static void damon_test_pa_core_addr(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, damon_pa_core_addr(0x1000000, 0x1000), 0x1000);
+	/* The conversion rounds down. */
+	KUNIT_EXPECT_EQ(test, damon_pa_core_addr(0x1fff, 0x1000), 1);
+	KUNIT_EXPECT_EQ(test, damon_pa_core_addr(0xfff, 0x1000), 0);
+}
+
+static void damon_test_pa_addr_over_4g(struct kunit *test)
+{
+	unsigned long addr = 0xffffffffUL;
+	unsigned long addr_unit = 0x1000;
+	u64 pa = 0xffffffff000ULL;
+
+	if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
+		kunit_skip(test, "phys_addr_t is 32-bit");
+
+	KUNIT_EXPECT_EQ(test, damon_pa_phys_addr(addr, addr_unit), pa);
+	KUNIT_EXPECT_EQ(test, damon_pa_core_addr(pa, addr_unit), addr);
+}
+
+static struct kunit_case damon_paddr_test_cases[] = {
+	KUNIT_CASE(damon_test_pa_phys_addr),
+	KUNIT_CASE(damon_test_pa_core_addr),
+	KUNIT_CASE(damon_test_pa_addr_over_4g),
+	{},
+};
+
+static struct kunit_suite damon_paddr_test_suite = {
+	.name = "damon-paddr",
+	.test_cases = damon_paddr_test_cases,
+};
+kunit_test_suite(damon_paddr_test_suite);
+
+#endif /* _DAMON_PADDR_TEST_H */
+
+#endif	/* CONFIG_DAMON_PADDR_KUNIT_TEST */

---
base-commit: 2c5dafa7f289d760f4492260b0988029aab478b0
change-id: 20261109-test-damon-paddr-addr-unit-kunit-b2f7e2154de8

Best regards,
--  
Aveline Noir <jm5905938@gmail.com>

