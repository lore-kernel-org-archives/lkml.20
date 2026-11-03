Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718945;
	b=YIhqITrOar1YznHti1uMApoyRMnDzAivZKlW1Mlb5JBrGQCP9nL86L2bIYkKBVHASAG3
	 58qYoEjkzqevpgGclOizpsk/M9a9OAe2Zj090mf7MVNbP8HWnkN7mzClJ2pt+4bpFI/DC
	 MwMzzog06IovM8hvdeGHXiBDSf9ASFhJ7CMN+s2q1YgCmGQdRE2iamLvPopNkGOEYb1up
	 n2g7a3elw5ZSBoBv9JxBKEOR9Cke47WNgv37rxrX6j0Ym6h9xSVudKxaczR0EntPjPla8
	 0e9b93A+iBTN3dBm/4OBZWWr3zQQroNYmokkdLnpDI5uVw87O60XkZnlmuvlc4x9vsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wy8/2VMK0wR6luBg+JnznF3VNOa+55LpLk3TB+qFWSc=;
	b=L6pdKncvHanx9EZE7WnlEDBIchOYCj+6bODS9+B/L+ymDiGDiWyeuh6u8XJA6jZwWMs4
	 aHv2YRbohX26Mmjyp9aSTKUT2B44ptugaqyk0qrwZaUbRqIAcof9N/AT0+Uln2SHUrhZ9
	 LhPWa0AA/6osEuo5vatcFZJrkw2rfcRWjbxRsZsvfEaep4tixg3BjwBw42lrr6mQ+7bvH
	 RB0ShDlsZE2vun+u71flgV1stRbXS/3cbrgChuVC/SFERkI6VajoiSFiCdjpBjmJiZPki
	 /eu+rZIVPJvKQ2xqQMZsNKtRVz0Ou8Q6KX47+JDoHVaaj7WpJWOvazX8c6lDDtrr/Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PM7GGIcB;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BAB606B251
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90BAB606B251
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PM7GGIcB
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3514b90bb89so8844389eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718945; x=1794323745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wy8/2VMK0wR6luBg+JnznF3VNOa+55LpLk3TB+qFWSc=;
        b=PM7GGIcBBf/XzSAPTyb3a6qS6XDeOaefVgKKIQMcFvGsDQYjQHuv9LF5pS5QVxppu7
         Wey8n76N/daYQbbT0CikxA9OQi9cpc5w5r4bcSXJna3OyqKwRoobcnK3sk9kV52hc7a6
         6A1+wHbJYYRtbAWc0odVSSKZoEnOzlIf/S9nEPHH3nerjF/gy3BKdF9YPpr2SuRf/d7K
         R8lfwoe2x7zi5RHtGe2r7QfKD6JJRMt2SFzzwZpJcPc8INvsbA4Sy8T7C3wfuciRHR1y
         r8Dg0BbWZgRFyalWpayKWWHF4J2tEXZekHMfSEnb8CXpieMfng/CSJ1eLazPBbHqkJ57
         gngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718945; x=1794323745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wy8/2VMK0wR6luBg+JnznF3VNOa+55LpLk3TB+qFWSc=;
        b=ykGHHjvDu6GtLe5h6ZuMa5hYk+tN3WI2k90bVgQ8rireFb8wT5dTpWrMyvQBavlQbR
         jEHv0qeA6LEAXX58zj3qL4iomfl6MzCShWOT9vl5St0yaFmymcEI84+BgW3Y9GsB1vVI
         9jx3udqX/l8VUDxJXEkAwmxubXXqrjMy/io4ON2+pbXgBI7QgfGPke5Vd/ZX1nrY7pRk
         0/sh0EhNbc0D3O73+CycrwfQlQFmBae7DcG7vXnS60k1HaoIKfS3GbfexcZGOD8z/rGx
         cHIuRn0UdQB5giWbKQUxl9pcNI4vqk9t1nXpC0nA5eHtbj890aA/fDkqqhTjrnNwmGH0
         rj0g==
X-Gm-Message-State: APuU4Z+IE3ITjtLR46E79cA77A1TXSBwx6IgsNpzw2h5WyrY3zx0nTkm
	gAOrr78KzWw66ho53eUjKMejCiBSl2rLDQqgY8zNhoXwe+wxRhIJfAWWWQyGQA==
X-Gm-Gg: AYBFou0qy8Oq+aQWX9S6K0rCIJZd+e+K7nf8NUbZpn5U44OQdDCgPFZwu1mth4ccYYX
	Nk4rd+wvdTGrCv8eylxuhQfs67s7y5oejLlMhB+X+UGwxKFX6EQs2M7aLti9XpJS0oBFJolmye5
	n7IfbNGDosyUmr3WdZ051W/DRyC+0L74P5cARpRx7h5ukdoP6tf6PDkxChI/CWjJUvkaxq8nqwc
	Qr8PHhzBV3/4X0CkgeaGi9UF2/Q3GjbAIhxykUdITzMVe+wPlHs9H28k0fm2ojrEQ+Ccf6Zjqdi
	PG2Bca+i8u5KpK0UkBDL4sQKyeyBEBKTZ2MqQanUV6ouXkPCXEe1VNqgpcCk5Gm2GAF7qWy5bk2
	9d5jUvUXuzjPFJCuCBQ7XVqWVjwdWGwU1BIJH6uALnaCcV/MF1fpRiwPM1mKF1AVEd+WvWXMuE1
	kPAlxpXfP8zsB1wcjpjsNh5AfNrR7crV29P4Q2A+rawyHlCXZyA0epBN23teIiA8C1VcawCWYgg
	6DGsIDyGvZvX9At1zkqza0JDT/nXOvNeJaAHLLH0df9gmlOVSr/5gjxLR+UTuZ8HNCflMMAvmQ0
	L+n5kDjIZwVqdV1S0c/OfaQEPVg7yP0jqGzH9x58nnF6gX0IBLg=
X-Received: by 2002:a05:7022:68a4:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-1ac5d1d155amr26608609c88.24.1793718944480;
        Tue, 03 Nov 2026 07:15:44 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm47518860c88.12.2026.11.03.07.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:15:43 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: o-takashi@sakamocchi.jp
Cc: linux-kernel@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net,
	sreekuttan2156239@gmail.com
Subject: [PATCH v2 2/2] firewire: Add KUnit tests for CSR iterator
Date: Tue,  3 Nov 2026 15:14:21 +0000
Message-ID: <20261103151421.7248-3-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103151421.7248-1-sreekuttan2156239@gmail.com>
References: <20261103042408.GB1229640@sakamocchi.jp>
 <20261103151421.7248-1-sreekuttan2156239@gmail.com>
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

Add a separate KUnit test suite for the CSR iterator.

Test iteration over valid entries, an empty directory,
and calling the iterator after reaching the end.

Add a separate Kconfig option to enable the iterator tests
and update the KUnit configuration.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/firewire/.kunitconfig               |  1 +
 drivers/firewire/Kconfig                    | 12 +++
 drivers/firewire/config-rom-iterator-test.c | 93 +++++++++++++++++++++
 drivers/firewire/core-device.c              |  4 +
 4 files changed, 110 insertions(+)
 create mode 100644 drivers/firewire/config-rom-iterator-test.c

diff --git a/drivers/firewire/.kunitconfig b/drivers/firewire/.kunitconfig
index ee9129081cef..e36dd34fd344 100644
--- a/drivers/firewire/.kunitconfig
+++ b/drivers/firewire/.kunitconfig
@@ -8,3 +8,4 @@ CONFIG_FIREWIRE_KUNIT_SELF_ID_SEQUENCE_HELPER_TEST=y
 CONFIG_FIREWIRE_KUNIT_OHCI_SERDES_TEST=y
 CONFIG_FIREWIRE_KUNIT_NODE_TREE_TEST=y
 CONFIG_FIREWIRE_KUNIT_CONFIG_ROM_PARSER_AND_GENERATOR_TEST=y
+CONFIG_FIREWIRE_KUNIT_CONFIG_ROM_ITERATOR_TEST=y
diff --git a/drivers/firewire/Kconfig b/drivers/firewire/Kconfig
index 7e1d4b2c440b..e67c2524c799 100644
--- a/drivers/firewire/Kconfig
+++ b/drivers/firewire/Kconfig
@@ -112,6 +112,18 @@ config FIREWIRE_KUNIT_CONFIG_ROM_PARSER_AND_GENERATOR_TEST
 	  For more information on KUnit and unit tests in general, refer
 	  to the KUnit documentation in Documentation/dev-tools/kunit/.
 
+config FIREWIRE_KUNIT_CONFIG_ROM_ITERATOR_TEST
+	tristate "KUnit tests for config ROM iterator" if !KUNIT_ALL_TESTS
+	depends on FIREWIRE && KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds KUnit tests for the configuration ROM iterator used
+          by the FireWire subsystem.
+
+	  The tests check iteration over valid entries, handling empty
+	  directories, and calls to the iterator after reaching the end of
+          a directory
+
 config FIREWIRE_OHCI
 	tristate "OHCI-1394 controllers"
 	depends on PCI && FIREWIRE
diff --git a/drivers/firewire/config-rom-iterator-test.c b/drivers/firewire/config-rom-iterator-test.c
new file mode 100644
index 000000000000..8c846f2f2011
--- /dev/null
+++ b/drivers/firewire/config-rom-iterator-test.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Sreeraj S Kurup
+ *
+ * config-rom-iterator-test.c - KUnit tests for configuration ROM iterator.
+ */
+
+#include <kunit/test.h>
+
+static void test_csr_iterator_with_valid_entries(struct kunit *test)
+{
+	static const u32 directory[] = {
+		0x00020000,	/* Two entries. */
+		0x12001234,
+		0x34005678,
+	};
+	struct fw_csr_iterator ci;
+	int key, value;
+
+	fw_csr_iterator_init(&ci, directory);
+
+	KUNIT_EXPECT_TRUE(test,
+			  fw_csr_iterator_next(&ci, &key, &value));
+	KUNIT_EXPECT_EQ(test, key, 0x12);
+	KUNIT_EXPECT_EQ(test, value, 0x001234);
+
+	KUNIT_EXPECT_TRUE(test,
+			  fw_csr_iterator_next(&ci, &key, &value));
+	KUNIT_EXPECT_EQ(test, key, 0x34);
+	KUNIT_EXPECT_EQ(test, value, 0x005678);
+
+	KUNIT_EXPECT_FALSE(test,
+			   fw_csr_iterator_next(&ci, &key, &value));
+}
+
+static void test_csr_iterator_at_end(struct kunit *test)
+{
+	static const u32 directory[] = {
+		0x00010000,	/* One entry. */
+		0x12001234,
+	};
+	struct fw_csr_iterator ci;
+	int key, value;
+
+	fw_csr_iterator_init(&ci, directory);
+
+	KUNIT_ASSERT_TRUE(test,
+			  fw_csr_iterator_next(&ci, &key, &value));
+
+	KUNIT_EXPECT_EQ(test, key, 0x12);
+	KUNIT_EXPECT_EQ(test, value, 0x001234);
+
+	KUNIT_EXPECT_PTR_EQ(test, ci.p, ci.end);
+
+	/*
+	 * Calling next() after the last entry must not
+	 * advance the iterator beyond its end.
+	 */
+	KUNIT_EXPECT_FALSE(test,
+			   fw_csr_iterator_next(&ci, &key, &value));
+
+	KUNIT_EXPECT_PTR_EQ(test, ci.p, ci.end);
+}
+
+static void test_csr_iterator_empty_directory(struct kunit *test)
+{
+	static const u32 directory[] = {
+		0x00000000,
+	};
+	struct fw_csr_iterator ci;
+	int key, value;
+
+	fw_csr_iterator_init(&ci, directory);
+
+	KUNIT_EXPECT_FALSE(test,
+			   fw_csr_iterator_next(&ci, &key, &value));
+
+	KUNIT_EXPECT_PTR_EQ(test, ci.p, ci.end);
+}
+
+static struct kunit_case csr_iterator_test_cases[] = {
+	KUNIT_CASE(test_csr_iterator_with_valid_entries),
+	KUNIT_CASE(test_csr_iterator_at_end),
+	KUNIT_CASE(test_csr_iterator_empty_directory),
+	{}
+};
+
+static struct kunit_suite csr_iterator_test_suite = {
+	.name = "firewire-config-rom-iterator",
+	.test_cases = csr_iterator_test_cases,
+};
+
+kunit_test_suite(csr_iterator_test_suite);
diff --git a/drivers/firewire/core-device.c b/drivers/firewire/core-device.c
index 36667841ca3c..5d5ad4f41ab5 100644
--- a/drivers/firewire/core-device.c
+++ b/drivers/firewire/core-device.c
@@ -1450,3 +1450,7 @@ void fw_node_event(struct fw_card *card, struct fw_node *node, int event)
 #ifdef CONFIG_FIREWIRE_KUNIT_CONFIG_ROM_PARSER_AND_GENERATOR_TEST
 #include "config-rom-parser-test.c"
 #endif
+
+#ifdef CONFIG_FIREWIRE_KUNIT_CONFIG_ROM_ITERATOR_TEST
+#include "config-rom-iterator-test.c"
+#endif
-- 
2.55.0

