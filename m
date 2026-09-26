Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E893264D8
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386048; cv=none; b=Lo+zhyraJepsUs2Aa+SpOiR1FJba1Nb8V/k4m64xW6NnQop/35NCJcFdSxKnqzjIRmZipZR9nxHWzZrzupgR74orNkh+DSTYKkle6p9fg/G+uKDg2gQyHzQMEscB5lWwbooWwuVIKhPY+o9Z5vfCpZsQTuRuAylaGb6WQ5nNv4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386048; c=relaxed/simple;
	bh=odcmYWLHPyWZm1evDvxPOXvvbdh0skkTjRuGv22NwS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdPpjYZfQfNOPVVSDUOkZNJZ0R0/O14m3yffTU5ZcpxMsecldvSdmnUFmK8cKSalyq08DhG6lpMJl6EmUGMq5pK8xoUZmCkzILw9RX4I9N+EDwsv9j42lnLrQvUt7yyJQXIopRqvG1uxuIWI+J7BEMhBn6l9Wg3vV9PezWnj+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pxy7LJLL; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pxy7LJLL"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so1184131c88.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386046; x=1790990846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N87uJCNDRnymcFxWSEt0qb5wVoDFWrpGlBM79r+8CnI=;
        b=Pxy7LJLLr2ieIs26LvQwhrx2R++2yncN+NX6dRUN/9HB25/5QW/u+x1DiBUEXham61
         FyjYNzDxkJgriGmqojWph8xdQZtMioF4URj9XQ+ED3uT47+EGfLIokJWmSQO2UscYMIE
         6tGUIQRRWvmLpqou7fu627YXKYsRTbXF9YkBrsTD6i6ka/8fP0/zZs//Uo93dmAKZtti
         b+EkztucGH/wWtZdd2+uR5Y4XntmokF9FW9S5hKf3CvNzuL7uDmZqNi8o0rxueTXuOpR
         Y0EYGe7BVshP/MPwRcG9OZ9W50sC7aoWMPa8IlKlb3zxKCLYkvsTdT51XBzVjPGgqcq1
         jQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386046; x=1790990846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N87uJCNDRnymcFxWSEt0qb5wVoDFWrpGlBM79r+8CnI=;
        b=t1Y0y4LZb5F/ljFkF7uNOYFbNhCM68S4ujXM7XovO27Jp/v1xjSWbaPZ7FUg7NT5xY
         DMVwFmcXcG7a9yqGEh3Z0OztcWZoF2d10NIE/3cSUduaVCIVEFcWoWh7T9qwlUrCDy6p
         dkapHEeqYBWlQEwpNCY/lV09ApAdEh9758otJhYOvw5vg4mgQK3H/aiQKBl4Ov8U1qp8
         a+4yT7O03LpzbjeAFV1BPtSIuzrGdJ58I8bNJhTmSazJEZNoSqgF89MYKv1agtiX8nbD
         G4cBZTVYVef35CUlBzE6YpoA2nq5KF6tkSIFSVeAd4ePtDJuAZCzh775ppFi7NZbqx2J
         jBDw==
X-Forwarded-Encrypted: i=1; AKwUvBzp1jRzbpdIkro/2MvPu9nA0LO6Z/g2oG4YnaiB05glAKnawy0Uhda4qmd36ZzOGiRqm9z6TGpoxDxRrdA=@vger.kernel.org
X-Gm-Message-State: AFuF++nmzBfjR/u9U7KbQQDH/ZbbBWN/MiLjwf1rw0JhIyxoXS8G55q4
	yT543KeSgqXIGEG+KyiWTnjVRJGr9ZwyALeGG5wIXgnLu9UUiLZCj9Ef
X-Gm-Gg: AYBFou2QHCFUORV+LpLlx6eGvqX23yRSu50I+uxhpTHW7T7i8HQ9c+d9LGV6dntKU1b
	m+H9TRb3e2vh2rT7yQYSFdTHe7fF7ZGdpnvbNBh6Rj3hmTEC33f3e9HZC86570yN1DKiiffhU5d
	ZVpeQsQCil5JF+H4f4xeo0g9TUcO1NjXGYHxEkcZIr/M8jLLgUyZf5EXZEFbSpUA1ivkRLeAFco
	li3rWPoulKToXsje/KDadsRvSuErO8B7svyqL8rCLX4nV1PtXxTAv0Xnv+tqZwik0q+WyuAYVwT
	0EIQKNe7xmenNXBYrbIOlc7taUPGpvYIsBxkSH+3wEXgGcmbq5KVN9IuoGmEOTF3Q69+qkzcQo5
	PyTKcnUm4GqUV3zc6Ixz6FSHDmMoDszZDAIbNUXNNFxzRr07NYqCJ5pYY1UktlnFYlAVrkxRdZq
	aDAyxPD1QE3JaNJaem28NfoWnLVp1LhyWDbOOytNPmEHj2eo0Va84ykVibx2OS5c27kYcrJvXU7
	8pBXoynE//XDEquj2ojapbxGbdq0O1vNJ2Kc6NUFaMt1xPQswgejWGzSlZQTTDmdsmoqEAPJGpD
	OpkMT/cIPnFUM7cE5JjyKXOdxW2/G0mKmsEzHS1adOWV/fQ3QwVPyst3vrzy3fqwndFAUMtAKw=
	=
X-Received: by 2002:a05:7301:6781:b0:341:a4ed:d910 with SMTP id 5a478bee46e88-3426fcc826cmr2166612eec.7.1790386046156;
        Fri, 25 Sep 2026 18:27:26 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144173a2asm9568089eec.6.2026.09.25.18.27.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 18:27:25 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Elder <elder@kernel.org>,
	David Gow <david@davidgow.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] lib/tests: add KUnit test for parser number helpers
Date: Sat, 26 Sep 2026 06:57:18 +0530
Message-ID: <20260926012718.15675-2-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260926012718.15675-1-jain.sm@gmail.com>
References: <20260926012718.15675-1-jain.sm@gmail.com>
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

