Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A0348FF80
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331825; cv=none; b=RGRwZp8dyfrlcx1mpbe76NSr0DS/9WblC96l6gj+9saBirP9j7eDxRpAu5HcwvPaVBO1tvlvv/LhBV73pebflnpwEGumOjYHDdlbXH/6p2tDldaXOmLzlnFTXm8laZXzsGP+ZsGyFq1Ru5BH28gcK5FlBzIHPauha3fBKrWHAK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331825; c=relaxed/simple;
	bh=bJ9mjgvgy63CVURyEBxilwBv4lxmciIUAtuW7RsI48g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gybn7q+ntJay5Y84UHji89gmjfb2UzFDnrwTAyCcLqAODZfb8wQFsvvfh/vqoLV/SAUbFFGpY1tn9BryVYN/4IxiknNM7IMyhim+Z+i5Xu2Huunl2hRXMO4Jrumj893p7ZM2ItbiB+UHw1+c94+ExlmmMtu6dCA/ln/WDguK3Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTk41lRE; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTk41lRE"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-340f56c44b0so291814eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331823; x=1790936623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUqXXsS1oTWUMaZa0d9vSWNRltf7D2wfMl4AyP+vB8Y=;
        b=jTk41lREEfv1McUlRb/aPTr/CxsvJPHe+wcGp3eyDch21V8XySRpoLwzU7V6z7fuKS
         ubWuq+dO8VtX/zyfFtxH9VIkkYSr6ky8E2aNHVs2onAOPI3xsno2V7KJ15agOG94MjJk
         zsxWPevo2ka9RbclioibFvOfXzsyeKTo1+/8UuT1R3Wf7g+L0N10oYrchzu+J+xT98MY
         Lg7Hg2Q0DG6Ks3ys8pS5sPLHQ7viCk0FEFRO/60AoRmm9FWTl8DlhhPSzFBy7tsVf/C0
         N9h81adcrn1Npgjydo2XwJClrAnNlhz8v4desjhZ6HtOdlC7sCTrpUcvsF2fiqlVTcoB
         +I2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331823; x=1790936623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUqXXsS1oTWUMaZa0d9vSWNRltf7D2wfMl4AyP+vB8Y=;
        b=IuuMODSx48htCOJgtGGpuj9plSGL8N/olwd7hvfDb+6K2S1mUCSOIhifKlPcdxbRxq
         4UCsq4hg+hna6Xdts4WLvfV5ZQ5ZPwW9WvKo9XbP0iPBDUICtPYlcrxAPQplJV7XLCY0
         enHFO/mzugSP3Hs6QtJ9fuNFg5aE2SvLZI1wLfQpRcNJzzKBB2KQKnA1KRgUqtiSf65z
         txQ85QKYptRin5GyUByeXbTfXGOCqlmaahSzQR4Q4WQZmN3g/MBR1VTSWKD3UxuG05Vv
         5b7ZMw62sKBqEQCmCvYcnT1zG9Npj1omrt54R7AlzY+dGVgRQsdpu1pwq3rO8M1aN1TE
         zASQ==
X-Forwarded-Encrypted: i=1; AKwUvBxuBCwFQXSJcvAaK382HfMx/81oF1OPXtdHul0g63lrQNciBq9jPj1qScgXlwi6xGeVzv/G+nz0uWorQiw=@vger.kernel.org
X-Gm-Message-State: AFuF++nzpPxchGX66RenpO/w+UtAA/gW/iTpiOK599/Dtc68bFKJqyw/
	26o+zSBTEKgSc0wzaQV7XqFkDWDhksOpquGqupk5BwqyLEe4fcFVeEYn
X-Gm-Gg: AYBFou1Ry86+87tV11dKDCNK3Y+9ytuzj3XucptLifEgHwqPZBRSka9lfUWK4wylPAa
	eVlCjlqEPtLxqSKerKlkj2RUj1PONzQyqBSLh4dE754AiYbBLjS3BdPX4N7Go6CARtKPpzYgU0E
	8kcfMJ6hX6gvEEauIbluIrQoVmXXGJxtAoodT8scTz6yBpScMsPhCCR4u3BUqVARBFlXP8p2tIZ
	VfXWHmWN4L3xrPkXIyPp+b5tttPBxWDng+9B0GWtNv9bA5ktinlvtBgtGtZxRTcPjIZTRaY5yam
	2svblqQwBUwuz8R36z8rZ3UsM5ogfVmS+i9coE/ckngZPobxtXshNr5VOrYKVUW5tp+VnCWrytp
	bF9babYfrNWrrLszbtkvyXvnvyLtEO/y4bXkfT6jV4/iX9tKVQTSAtjIXDlUUDxeHYLQMsAqBe0
	3pvyeON9pT2cUYPvtTuvGv9BV8PDtFEomPHpu7ENwGSkP0jvlKepBhT3yNBWbnmjWEjOUXEbF9z
	I9kNdeON6ampKbib3lmBHCfC54CeKedAnKUcfxz8wBUUMUgVrfwFk4kd+GHOZSkb3LKQi/x943D
	rlN/nVEVTch/1mLFa1QWsS/W2Yow1DuorRn6XT+eSsGmZ1w8XV9mMPzghkIgYr0XQLyAK3pfzw=
	=
X-Received: by 2002:a05:7301:7bc9:b0:33b:e77f:8a3c with SMTP id 5a478bee46e88-34000d3600amr5598603eec.33.1790331822682;
        Fri, 25 Sep 2026 03:23:42 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144173a2asm5787949eec.6.2026.09.25.03.23.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 03:23:42 -0700 (PDT)
From: shashank <jain.sm@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Elder <elder@kernel.org>,
	David Gow <david@davidgow.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] lib/tests: add KUnit test for parser number helpers
Date: Fri, 25 Sep 2026 15:53:34 +0530
Message-ID: <20260925102334.49693-2-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925102334.49693-1-jain.sm@gmail.com>
References: <20260925102334.49693-1-jain.sm@gmail.com>
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
Signed-off-by: shashank <jain.sm@gmail.com>
---
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

