Received: from mail-dy2-f39.google.com (mail-dy2-f39.google.com [74.125.229.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D7827E1DC
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 01:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791164675; cv=none; b=ntwOBlG0bXSvkPnVpqepIuoPZ1qw0SaLm/7bgn70gdYk19z/aIUYgdPnkbWAZGl6vcyMuTnKeTLQhv6pxGTr8rTB2cbqGd/WmEHSnlsbrfP1D8K8Lm7bjixYdCzL548OtdXTPkfpvbo6+lVkcbFVGbDuTCeNWNIPgYbvhFrENgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791164675; c=relaxed/simple;
	bh=yPHi56gAtqA/TDzFJ72uOu5MIoHc4QHdXCJoW2ufS4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O1oEEy+uqTMwx0drZXLy42JDtq2Ige8VYqB+A6eWPvtm9mZcipKue7EE30jlGagdznj7tj5hfwxT0bbcD7/k4DaGD0kB+yN0AbRy9TbNpeyIFZgC3lhvRN9jk8helFf8IdYSlMsw9WIWTHUzIxoa0NuIoccSZCiCvRKQQq3MY/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pu8smvcS; arc=none smtp.client-ip=74.125.229.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pu8smvcS"
Received: by mail-dy2-f39.google.com with SMTP id 5a478bee46e88-34b3a9cd8edso558085eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 18:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791164672; x=1791769472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z11OeYwmY+zK3ViQe25TXbebJyVJEKxWldYjNJp9g2c=;
        b=pu8smvcS31NjqG4rc6Q+J3OzsNIh2anoDOunDbWNGexjQdDgDdMYv0/Jt0QClwYXRQ
         SgPET79Wgfzp0TiUmNs0BrsPYy6g5+1+q5RbaKNBmj/QvrTvwsgfO17Mp5ZCbWeaeTdd
         85b1UO/QAz2smBDFNKCjfNN24yG7ZsUI+XSN5pkFheiUK6PL/lbWqW8NMx6EiGB2C0zq
         OkuKBWMKFJP7tm54SY9JEbHj3W0J+kPelO/txrBFB4Fkofp7lf9+lSRz9dsC/ZVY+Lvf
         MTwvzyc6rrD0F7nyu4oSSwKLOS9Z4VFcYF96sx4f4KnrPEDDOojNc03mOX58xRWeW8bb
         p62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791164672; x=1791769472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z11OeYwmY+zK3ViQe25TXbebJyVJEKxWldYjNJp9g2c=;
        b=rKl+XT/plwgcdlOd8btcOU/J98uZ81/o4KCFO5BUImAVWQTD4Iou+dRLTU2pMLXNIf
         I01Le9P8i3FDwP5JVWN/2d1mokJUDz1j1DWgG30xhgbwBRDTWQ/Dvmk/pYwO9H2d0gVN
         HCbQNKeOk72LKsz+tbXGS27Zs83QC5gk72I1qIEUyMzlFypYnXYl0SKLb43aKpRf4A0J
         kkXP/VpYBqMQTO/MS3Pm1jfSnDOE1Gmo5Z4+1IxYo/uwHYxqM5Y4KDrdQmQMuXkZFTHN
         s6k2AdZBOHMt1N1Yv/KXBvUagJoUUrq1OaIi0BgsO5v8fWVUy4pP4qwOEzq5plTvhz/O
         6UBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPI2o1Wwtlw3quzQqB9TlXfx3abByqpAxNY8ALph0qh4DfquBhlXcNSjX6r66gSjcnJAbBiy+FJbArnD0=@vger.kernel.org
X-Gm-Message-State: AFuF++n6Qh0OsjzUtPiDAuoPMHtrKA9drPClOSYWCnT8P5jdsL79Em6B
	qQJt7bHypqBNikRa6rKKqmKQ0CLfYxrL52amoBe+Ja+d5GspK00gabEH8YGnF/ZGt3U=
X-Gm-Gg: AYBFou0p0RZnM+JAYzKPKl7eq7dW2iZnSIZf88DEr4KrL7TwretCUyO7q3zd+BVOhOo
	cUq6SHFp1Lm6X40hig0ui42ySxBLf/ts1Gxobu5EeqrAWWHg6k2zsgeqsLLCLl7iA4CY2uAcyQF
	88O/f66/MnpLl7P2IqGVeHdykZPc47CYuzgiztgEQEMHd/hg8P4LjDNVkI2/6tPI1c4yXln3Ezh
	Ox6SJ1lFcN3V3qZivb2PERkRz8Lh1WdcOhQ01KDnAibkZ1JMFbl3ZY3RDpTeqPSciyAUgEhM3SK
	AtYBjP3B+VmuxJPJEiprQFIuukHFbqsRrFZOzBSc5AawDqr8jkPrZSc2gcMEnblbR/ckcFSRx60
	8LEBnH7ZQ8DgHglJfsDKcrSn0OGNpxuYaMsNJohunxsk8uDGO9CCVDIeg3QVpkKcu8rbXb71tXB
	Rtvk8n0zNVgaSqaHBUyZDmgK0nH6SZfRx1p/xEI8t9LFD5T1Sa6xm9S0gNYN7sH6fOHMAJu1IY9
	4xwWNZD9JZosm21OnLmibAHNHwPEASzrMOjl8MRMDqxsIZ4KuyG993CiLp8SYbs6lPDJzm656A7
	2xtuxjTL7QOb54ItDkgtMFxzFB9W1ZHTEqJQQ003ofT9d4Dy1ski4+29fBpTfZwcHFHZ6FVqsXe
	EvTmUXRTEZAn0rENBhLDH4zxHn1CyMD5K6zVA33/H+uaj4gdJ93HC5v7C4rezdJo2UQ==
X-Received: by 2002:a05:693c:408c:b0:33e:aa3d:ebe9 with SMTP id 5a478bee46e88-34f21991794mr12389583eec.12.1791164672128;
        Sun, 04 Oct 2026 18:44:32 -0700 (PDT)
Received: from FT6N242TWK ([223.181.113.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272d5103sm8912084eec.27.2026.10.04.18.44.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 18:44:31 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Elder <elder@kernel.org>,
	David Gow <david@davidgow.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] lib/tests: add KUnit test for parser number helpers
Date: Mon,  5 Oct 2026 07:14:23 +0530
Message-ID: <20261005014423.78677-2-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261005014423.78677-1-jain.sm@gmail.com>
References: <20261005014423.78677-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a small KUnit suite for match_int(), match_octal() and match_hex(),
covering values at and just beyond the int range, values that overflow
64 bits, and a match_token() round trip with an out-of-range argument.

Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Changes in v3:
- None (the test passes with the kstrtol() based match_number() of patch 1/2).

 lib/Kconfig.debug        |  12 ++++
 lib/tests/Makefile       |   1 +
 lib/tests/parser_kunit.c | 131 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)
 create mode 100644 lib/tests/parser_kunit.c

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 134b15a44625..905ccec61868 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2918,6 +2918,18 @@ config CMDLINE_KUNIT_TEST
 
 	  If unsure, say N.
 
+config PARSER_KUNIT_TEST
+	tristate "KUnit test for parser number helpers" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the unit test for the number parsing helpers in
+	  lib/parser.c (match_int(), match_octal(), match_hex()).
+	  For more information on KUnit and unit tests in general please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 config BASE64_KUNIT
 	tristate "KUnit test for base64 decoding and encoding" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 3cac3b63a752..cbabf4939ce8 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -41,6 +41,7 @@ obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
 obj-$(CONFIG_MIN_HEAP_KUNIT_TEST) += min_heap_kunit.o
 CFLAGS_overflow_kunit.o = $(call cc-disable-warning, tautological-constant-out-of-range-compare)
 obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow_kunit.o
+obj-$(CONFIG_PARSER_KUNIT_TEST) += parser_kunit.o
 obj-$(CONFIG_PRANDOM_KUNIT_TEST) += random32_kunit.o
 obj-$(CONFIG_PRINTF_KUNIT_TEST) += printf_kunit.o
 obj-$(CONFIG_RANDSTRUCT_KUNIT_TEST) += randstruct_kunit.o
diff --git a/lib/tests/parser_kunit.c b/lib/tests/parser_kunit.c
new file mode 100644
index 000000000000..b92476cf711f
--- /dev/null
+++ b/lib/tests/parser_kunit.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * KUnit tests for the number helpers in lib/parser.c
+ */
+
+#include <kunit/test.h>
+#include <linux/limits.h>
+#include <linux/parser.h>
+#include <linux/string.h>
+
+struct parser_number_case {
+	const char *in;
+	int ret;
+	int val;
+};
+
+typedef int (*match_fn_t)(substring_t *s, int *result);
+
+static void parser_check(struct kunit *test, match_fn_t fn, const char *name,
+			 const struct parser_number_case *c, size_t n)
+{
+	size_t i;
+
+	for (i = 0; i < n; i++) {
+		char buf[64];
+		substring_t s;
+		int val = 0x5a5a5a5a;
+		int ret;
+
+		strscpy(buf, c[i].in, sizeof(buf));
+		s.from = buf;
+		s.to = buf + strlen(buf);
+
+		ret = fn(&s, &val);
+		KUNIT_EXPECT_EQ_MSG(test, ret, c[i].ret, "%s(\"%s\")",
+				    name, c[i].in);
+		if (!c[i].ret)
+			KUNIT_EXPECT_EQ_MSG(test, val, c[i].val, "%s(\"%s\")",
+					    name, c[i].in);
+	}
+}
+
+static const struct parser_number_case match_int_cases[] = {
+	{ "0",				0,		0 },
+	{ "42",				0,		42 },
+	{ "-42",			0,		-42 },
+	{ "0x10",			0,		16 },
+	{ "010",			0,		8 },
+	{ "2147483647",			0,		INT_MAX },
+	{ "-2147483648",		0,		INT_MIN },
+	{ "2147483648",			-ERANGE,	0 },
+	{ "-2147483649",		-ERANGE,	0 },
+	{ "4294967295",			-ERANGE,	0 },
+	{ "9223372036854775808",	-ERANGE,	0 },
+	{ "18446744073709551615",	-ERANGE,	0 },
+	{ "-18446744073709551615",	-ERANGE,	0 },
+	{ "99999999999999999999",	-ERANGE,	0 },
+	{ "0xffffffffffffffff",		-ERANGE,	0 },
+	{ "abc",			-EINVAL,	0 },
+};
+
+static const struct parser_number_case match_octal_cases[] = {
+	{ "755",			0,		0755 },
+	{ "17777777777",		0,		INT_MAX },
+	{ "20000000000",		-ERANGE,	0 },
+	{ "1777777777777777777777",	-ERANGE,	0 },
+	{ "8",				-EINVAL,	0 },
+};
+
+static const struct parser_number_case match_hex_cases[] = {
+	{ "ff",				0,		0xff },
+	{ "7fffffff",			0,		INT_MAX },
+	{ "80000000",			-ERANGE,	0 },
+	{ "ffffffffffffffff",		-ERANGE,	0 },
+	{ "10000000000000000",		-ERANGE,	0 },
+	{ "g",				-EINVAL,	0 },
+};
+
+static void parser_test_match_int(struct kunit *test)
+{
+	parser_check(test, match_int, "match_int", match_int_cases,
+		     ARRAY_SIZE(match_int_cases));
+}
+
+static void parser_test_match_octal(struct kunit *test)
+{
+	parser_check(test, match_octal, "match_octal", match_octal_cases,
+		     ARRAY_SIZE(match_octal_cases));
+}
+
+static void parser_test_match_hex(struct kunit *test)
+{
+	parser_check(test, match_hex, "match_hex", match_hex_cases,
+		     ARRAY_SIZE(match_hex_cases));
+}
+
+enum { PARSER_TEST_OPT_SIZE, PARSER_TEST_OPT_ERR };
+
+static const match_table_t parser_test_tokens = {
+	{ PARSER_TEST_OPT_SIZE, "size=%d" },
+	{ PARSER_TEST_OPT_ERR, NULL },
+};
+
+static void parser_test_match_token_int(struct kunit *test)
+{
+	char opt[] = "size=18446744073709551615";
+	substring_t args[MAX_OPT_ARGS];
+	int val = 0;
+
+	KUNIT_ASSERT_EQ(test, match_token(opt, parser_test_tokens, args),
+			PARSER_TEST_OPT_SIZE);
+	KUNIT_EXPECT_EQ(test, match_int(&args[0], &val), -ERANGE);
+}
+
+static struct kunit_case parser_test_cases[] = {
+	KUNIT_CASE(parser_test_match_int),
+	KUNIT_CASE(parser_test_match_octal),
+	KUNIT_CASE(parser_test_match_hex),
+	KUNIT_CASE(parser_test_match_token_int),
+	{}
+};
+
+static struct kunit_suite parser_test_suite = {
+	.name = "parser",
+	.test_cases = parser_test_cases,
+};
+
+kunit_test_suite(parser_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for lib/parser.c number helpers");
+MODULE_LICENSE("GPL");
-- 
2.43.0

