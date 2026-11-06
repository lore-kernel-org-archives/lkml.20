Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970831;
	b=BHaOW8kfWYxIqHiT4sTZsUJ2kkywgDz+w0DT2VPqtMgPm0dJVBXYqEa6iGdDbSJfzNe/
	 +sv2wetoczbzAsccjeXwo/f+wmAxoxBpK15ZmQqP3FkNGFrs6kSxw29X+S9auyx5SHtIw
	 DInMChCNLl+sf6aGOYMsT9JXN5x0uKKm3WDzKSZx25mAtfvu5OKErbacIFVkx0sZqJhBg
	 cNrahOPe42b+7DThRSdLNppf/IeHaaIMU74XhN30/iOWgQCW9/7j7Y5fGEQba142+Whi8
	 gJ7UgDEB5XXB5+AsNcSNLrDKQIGjOhYoEBiAxymZZJmCS3/I/DKfb82FiV90Ow6bIYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=GYMXFM2J0MpU1tX5GHSmnoI5WwG/eg0p71epcG03Hus=;
	b=Jr8VQ6O0BqX7tS/g13jFcD8/jn/XZ1YwfQcXYmysNGJBxWGgyyFdjAYxw/7q2DE5PCay
	 YXeEAsAMTv9EPYanb6/BAywxoHfN1QbuVHChNOwdWqZaF1bXExfMD51pbOI8tiFDAVpZh
	 25I2gIr/mkUGZ5TUqm6Xu1Ao3qt0rNKUQkmX7Zid7/IFqWQtODUMl0XpKBIqc5ZfMQ4pP
	 KLsHqmH47fGX/HXCDXeMYcWHQTMXhtqlEkL2PTm8YkG95L17aynMvrACgDc8wPg5J6Tnd
	 euljS0XaVzqpfBb7XASlpfQa/CcXMMf2X7Pb6P6na0/rzJ/OWW79JN+jBRNhNkoffug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FOmKJd5D;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D878C606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D878C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FOmKJd5D
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b2d14968c9so5011047b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793970830; x=1794575630; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GYMXFM2J0MpU1tX5GHSmnoI5WwG/eg0p71epcG03Hus=;
        b=FOmKJd5DMiXYzYRrgkusoLWbcSgoC7Ctl8LpoYUMpzxS/AAIo4/CzaHSo4J04V4Egi
         a+pxAHwxNedaIw6tWsCpH8IQUR3z+vssTZ5P5PmRitaGyuzDu+tfGUkd6zE36hhgWeA+
         V4jnXo+umIDh2JrdLEj/khpe3tSb2GEv16tnzTFGunRiHVFPXCIRFS8/jpwUc3ba3DYV
         zbcH1P4gLRrO6qnIOEgY7pRGjDX/Raanqb6D0c7rhFpsWyKlFXqWMARkHpPbJZJQgwiW
         kSTi0Eq7QTOF76w7YnSz9aZMcESg8ZmAb1jIBl6PAdBsSQpqJF8CrlD20B5duDvE07pd
         1uHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793970830; x=1794575630;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GYMXFM2J0MpU1tX5GHSmnoI5WwG/eg0p71epcG03Hus=;
        b=uDTeh0Qwi/TKgHe0h/kLh2AobBAjJhhRHdNabnAbfQDM5aTi8RCDAbY/bStlynr6FP
         m6DPSe+DtOes4cafff872zUscE0XMHUBOQx3KBdYavkdIdp8E+4aLCjEmC0xhhQyT+ht
         UyGc1zv8aNHdX3gLHqzKIATfTGGg30EvOK09KmZXx2vzRTVOcWSb8Eg+iP9G0q4sBt06
         dBi0QCsbxh4S4vBphUpro+/FATWbC9T2y1nrgQVjDR1qrixtFhg7SI9LIY5KD5Sl8dS4
         +zrCZgxlf2BSvIGeChoCumf0HUDOyPvXqi1RWjE3nrRk3Z0981CdhSqqOUZIZVtwQhBX
         PDcw==
X-Forwarded-Encrypted: i=1; AL+hErGfpG2cCqejvHjBDBoAiulUF7AieUFaHGkmqEOHnDzG4ElyMASO82p2OQGdBRdG6j+suyhJIA+uk6rG4Mk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pWDLjqzlgYhHQHwbRAPKkJ+fBQoOb82RtNH2ADPHVadbYkrhM
	hzZFBmHD4QoEukkX9ZaR1yAtNYg4nP5d7y/6q4Omu9bTFeUtCGqb38Rj9bpx7+E6
X-Gm-Gg: AYBFou3tdj35yDyb3uDW6iZAa6D4r2BpXXVwkI0qLM5Giv8/+1HpLhUv2S72K1d28C+
	ZcomBBD5LVo2foqvedLu9z2L9iVSaTuv4GZx0BN+8JWhqW4jRvkpC6RXZY+CLWftGMMelSYE6mX
	aZ6pJfmgh0I3bmI85aFKf7phISyPKW0iI/cnTpBmQH2msjMn6DTRnJgfseUBgZzdI+BR8KlRLgD
	E4mZ6Q9rD2AhY0lFyAPW8+4v39+6RomosHa3rnG1v3ch6S3pPgGg2YvynJtyY3pF2rYg3dl50zs
	QtmXWPKobmT768wvKIi0JhOZNKEk0OOtvSOZmQf21tPt7R4MMhuq5zrYCu94REeB4rv2ZT8aoXp
	Jk8HGDg3G7NBFP9+NLr1hrN7cWvmwpIcVUgT4DDqccHDlVsrqPRu76GN4fA7jaYklnD53pLwnwi
	yDLZKk5QAxAqp5V74rjuz/VunpL4QLqtvV1VvtKieOWOwsBHe9dJnkCX+AIhLLsLwfYTmwqeV7h
	TybBUIbkHoT7mNSc7vJsCmShf5SEJSG3U9Pa7zmKcCESqoDU6Cc6kd2an0fbUGCtCkfKhjU1vEs
	7HilZljfUZu7ccIbcxdT/LK7JpYpdyCWcM1TyscfdvdDmxdRY4lctalAvcb1a/6IzZqq559a+8r
	yuklBbkkuCqIhtuyWJxXc1AKc4GYg+o2c5tTygoOGm29S07w5pqyfUWjEm1d8LslXwz7JjWTbET
	YPnZv0sQ==
X-Received: by 2002:a05:690c:4490:b0:8b3:3854:c28b with SMTP id 00721157ae682-8b34193a884mr8859657b3.22.1793970829450;
        Fri, 06 Nov 2026 05:13:49 -0800 (PST)
Received: from lab01.myowncloud.network ([2601:cb:4000:1c5:5396:7ba1:d08a:ebca])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f770cb7sm18250047b3.11.2026.11.06.05.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:13:48 -0800 (PST)
From: Amit Patole <amit.patole@gmail.com>
Date: Fri, 06 Nov 2026 08:12:31 -0500
Subject: [PATCH] lib/tests: add KUnit tests for the UCS-2 string helpers
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
Message-Id: <20261106-kunit-ucs2-string-v1-1-28d8e134ba1f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD7S7WoC/yXMQQqDMBBA0avIrDuQSatIryJdpHHUsRAlk5SCe
 HdjXb7F/xsoR2GFZ7VB5K+oLKGAbhX4yYWRUfpisMY2RKbGTw6SMHu1qClKGLFu2RnniO70gNK
 tkQf5/Z/d67Lm98w+nSPY9wPzKEZ+dQAAAA==
X-Change-ID: 20261105-kunit-ucs2-string-58ea0aa11314
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Rae Moar <raemoar63@gmail.com>, linux-efi@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, Amit Patole <amit.patole@gmail.com>
X-Mailer: b4 0.15.2

lib/ucs2_string.c is used for EFI variable names (efivarfs, efi-pstore),
Apple device properties, the EFI stub's load options and Hyper-V
interface aliases, but has no unit tests.

Add a KUnit suite that covers:

- ucs2_strnlen(), ucs2_strlen() and ucs2_strsize(), including a
  byte limit that is not a whole number of characters;
- ucs2_strscpy(): exact fit, truncation with -E2BIG and NUL
  termination, and the zero-sized and oversized buffer checks;
- ucs2_strncmp(): ordering, the length limit, prefixes and unsigned
  comparison of characters above 0x7fff;
- ucs2_utf8size() and ucs2_as_utf8() for the one, two and three byte
  UTF-8 boundaries (U+007F/U+0080, U+07FF/U+0800, U+FFFF);
- truncation in ucs2_as_utf8(): a multi-byte character is never
  split, and the terminator is written only when there is room;
- ucs2_as_utf8_l() on a source that is not NUL terminated, which is
  why it was split out of ucs2_as_utf8().

An AI coding assistant (Claude Opus 5.5) was used to pick the untested
helpers and draft the tests. They were run with
"tools/testing/kunit/kunit.py run" on UML (19/19 pass), built with W=1
without warnings, and checked against deliberately broken versions of
ucs2_strscpy() and ucs2_as_utf8_l(), which the suite catches.

Signed-off-by: Amit Patole <amit.patole@gmail.com>
---
Tested on UML with a kunitconfig of CONFIG_KUNIT=y and

CONFIG_UCS2_STRING_KUNIT_TEST=y: 19/19 pass.
---
 lib/Kconfig.debug             |  14 ++
 lib/tests/Makefile            |   1 +
 lib/tests/ucs2_string_kunit.c | 288 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 303 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2d22638ec13a..6e5d1c617f2e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3461,6 +3461,20 @@ config RATELIMIT_KUNIT_TEST
 
 	  If unsure, say N.
 
+config UCS2_STRING_KUNIT_TEST
+	tristate "KUnit test for UCS-2 string helpers" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	select UCS2_STRING
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables the KUnit test suite for the UCS-2 string
+	  helpers in lib/ucs2_string.c, which are used for EFI variable
+	  names and other firmware strings. The tests cover length,
+	  copy and compare helpers and the UCS-2 to UTF-8 conversion,
+	  including truncation at the destination buffer size.
+
+	  If unsure, say N.
+
 config UUID_KUNIT_TEST
 	tristate "KUnit test for UUID" if !KUNIT_ALL_TESTS
 	depends on KUNIT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index df0537e1b91f..cf5486008d75 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -54,6 +54,7 @@ CFLAGS_stackinit_kunit.o += $(call cc-disable-warning, switch-unreachable)
 obj-$(CONFIG_STACKINIT_KUNIT_TEST) += stackinit_kunit.o
 obj-$(CONFIG_STRING_KUNIT_TEST) += string_kunit.o
 obj-$(CONFIG_STRING_HELPERS_KUNIT_TEST) += string_helpers_kunit.o
+obj-$(CONFIG_UCS2_STRING_KUNIT_TEST) += ucs2_string_kunit.o
 obj-$(CONFIG_USERCOPY_KUNIT_TEST) += usercopy_kunit.o
 obj-$(CONFIG_UTIL_MACROS_KUNIT) += util_macros_kunit.o
 obj-$(CONFIG_RATELIMIT_KUNIT_TEST) += test_ratelimit.o
diff --git a/lib/tests/ucs2_string_kunit.c b/lib/tests/ucs2_string_kunit.c
new file mode 100644
index 000000000000..c24288edaefd
--- /dev/null
+++ b/lib/tests/ucs2_string_kunit.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for the UCS-2 string helpers in lib/ucs2_string.c
+ */
+
+#include <kunit/test.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/ucs2_string.h>
+
+/* "abc" */
+static const ucs2_char_t abc[] = { 'a', 'b', 'c', 0 };
+/* "a", U+00E9 (e acute), U+20AC (euro sign) */
+static const ucs2_char_t mixed[] = { 'a', 0x00e9, 0x20ac, 0 };
+static const ucs2_char_t empty[] = { 0 };
+
+static void ucs2_strnlen_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, ucs2_strnlen(empty, 10), 0);
+	KUNIT_EXPECT_EQ(test, ucs2_strnlen(abc, 10), 3);
+	KUNIT_EXPECT_EQ(test, ucs2_strnlen(abc, 3), 3);
+	KUNIT_EXPECT_EQ(test, ucs2_strnlen(abc, 2), 2);
+	KUNIT_EXPECT_EQ(test, ucs2_strnlen(abc, 0), 0);
+	KUNIT_EXPECT_EQ(test, ucs2_strnlen(mixed, 10), 3);
+}
+
+static void ucs2_strlen_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, ucs2_strlen(empty), 0);
+	KUNIT_EXPECT_EQ(test, ucs2_strlen(abc), 3);
+	KUNIT_EXPECT_EQ(test, ucs2_strlen(mixed), 3);
+}
+
+static void ucs2_strsize_test(struct kunit *test)
+{
+	/* The result is in bytes, and @maxlength is in bytes too. */
+	KUNIT_EXPECT_EQ(test, ucs2_strsize(abc, 100), 6);
+	KUNIT_EXPECT_EQ(test, ucs2_strsize(abc, 4), 4);
+	/* An odd byte limit is rounded down to whole characters. */
+	KUNIT_EXPECT_EQ(test, ucs2_strsize(abc, 5), 4);
+	KUNIT_EXPECT_EQ(test, ucs2_strsize(abc, 1), 0);
+	KUNIT_EXPECT_EQ(test, ucs2_strsize(empty, 100), 0);
+}
+
+static void ucs2_strscpy_test(struct kunit *test)
+{
+	ucs2_char_t dst[8];
+
+	/* Plenty of room. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_strscpy(dst, abc, ARRAY_SIZE(dst)), 3);
+	KUNIT_EXPECT_EQ(test, ucs2_strncmp(dst, abc, ARRAY_SIZE(dst)), 0);
+	/* Nothing is written past the terminator. */
+	KUNIT_EXPECT_EQ(test, dst[4], 0xffff);
+
+	/* Exact fit: three characters plus the terminator. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_strscpy(dst, abc, 4), 3);
+	KUNIT_EXPECT_EQ(test, dst[3], 0);
+
+	/* One short: truncated, still terminated, -E2BIG. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_strscpy(dst, abc, 3), -E2BIG);
+	KUNIT_EXPECT_EQ(test, dst[0], 'a');
+	KUNIT_EXPECT_EQ(test, dst[1], 'b');
+	KUNIT_EXPECT_EQ(test, dst[2], 0);
+	KUNIT_EXPECT_EQ(test, dst[3], 0xffff);
+
+	/* Room for the terminator only. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_strscpy(dst, abc, 1), -E2BIG);
+	KUNIT_EXPECT_EQ(test, dst[0], 0);
+	KUNIT_EXPECT_EQ(test, dst[1], 0xffff);
+
+	/* A zero-sized buffer is rejected and left untouched. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_strscpy(dst, abc, 0), -E2BIG);
+	KUNIT_EXPECT_EQ(test, dst[0], 0xffff);
+
+	/* So is a size that does not fit in the ssize_t return value. */
+	KUNIT_EXPECT_EQ(test, ucs2_strscpy(dst, abc, (size_t)SSIZE_MAX + 1),
+			-E2BIG);
+	KUNIT_EXPECT_EQ(test, dst[0], 0xffff);
+
+	/* Empty source. */
+	KUNIT_EXPECT_EQ(test, ucs2_strscpy(dst, empty, ARRAY_SIZE(dst)), 0);
+	KUNIT_EXPECT_EQ(test, dst[0], 0);
+}
+
+static void ucs2_strncmp_test(struct kunit *test)
+{
+	static const ucs2_char_t abd[] = { 'a', 'b', 'd', 0 };
+	static const ucs2_char_t ab[] = { 'a', 'b', 0 };
+	static const ucs2_char_t lo[] = { 0x0001, 0 };
+	static const ucs2_char_t hi[] = { 0xffff, 0 };
+
+	KUNIT_EXPECT_EQ(test, ucs2_strncmp(abc, abc, 10), 0);
+	KUNIT_EXPECT_EQ(test, ucs2_strncmp(abc, abd, 10), -1);
+	KUNIT_EXPECT_EQ(test, ucs2_strncmp(abd, abc, 10), 1);
+	/* Only the first @len characters are compared. */
+	KUNIT_EXPECT_EQ(test, ucs2_strncmp(abc, abd, 2), 0);
+	KUNIT_EXPECT_EQ(test, ucs2_strncmp(abc, abd, 0), 0);
+	/* A prefix sorts first, because its terminator is the smaller value. */
+	KUNIT_EXPECT_EQ(test, ucs2_strncmp(ab, abc, 10), -1);
+	KUNIT_EXPECT_EQ(test, ucs2_strncmp(abc, ab, 10), 1);
+	KUNIT_EXPECT_EQ(test, ucs2_strncmp(empty, empty, 10), 0);
+	/* Characters compare as unsigned 16-bit values. */
+	KUNIT_EXPECT_EQ(test, ucs2_strncmp(lo, hi, 10), -1);
+	KUNIT_EXPECT_EQ(test, ucs2_strncmp(hi, lo, 10), 1);
+}
+
+/* One UCS-2 character and its expected UTF-8 encoding. */
+struct ucs2_utf8_case {
+	ucs2_char_t c;
+	u8 utf8[3];
+	unsigned int len;
+};
+
+static const struct ucs2_utf8_case utf8_cases[] = {
+	{ 0x0001, { 0x01 }, 1 },
+	{ 0x0041, { 0x41 }, 1 },
+	{ 0x007f, { 0x7f }, 1 },
+	{ 0x0080, { 0xc2, 0x80 }, 2 },
+	{ 0x00e9, { 0xc3, 0xa9 }, 2 },
+	{ 0x07ff, { 0xdf, 0xbf }, 2 },
+	{ 0x0800, { 0xe0, 0xa0, 0x80 }, 3 },
+	{ 0x20ac, { 0xe2, 0x82, 0xac }, 3 },
+	{ 0xfffd, { 0xef, 0xbf, 0xbd }, 3 },
+	{ 0xffff, { 0xef, 0xbf, 0xbf }, 3 },
+};
+
+static void ucs2_utf8_case_desc(const struct ucs2_utf8_case *t, char *desc)
+{
+	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "U+%04X", t->c);
+}
+
+KUNIT_ARRAY_PARAM(ucs2_utf8, utf8_cases, ucs2_utf8_case_desc);
+
+static void ucs2_as_utf8_char_test(struct kunit *test)
+{
+	const struct ucs2_utf8_case *t = test->param_value;
+	const ucs2_char_t src[] = { t->c, 0 };
+	u8 dst[8];
+
+	KUNIT_EXPECT_EQ(test, ucs2_utf8size(src), t->len);
+
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_ASSERT_EQ(test, ucs2_as_utf8(dst, src, sizeof(dst)), t->len);
+	KUNIT_EXPECT_MEMEQ(test, dst, t->utf8, t->len);
+	KUNIT_EXPECT_EQ(test, dst[t->len], 0);
+}
+
+static void ucs2_utf8size_test(struct kunit *test)
+{
+	KUNIT_EXPECT_EQ(test, ucs2_utf8size(empty), 0);
+	KUNIT_EXPECT_EQ(test, ucs2_utf8size(abc), 3);
+	KUNIT_EXPECT_EQ(test, ucs2_utf8size(mixed), 1 + 2 + 3);
+}
+
+static void ucs2_as_utf8_string_test(struct kunit *test)
+{
+	static const u8 mixed_utf8[] = { 'a', 0xc3, 0xa9, 0xe2, 0x82, 0xac };
+	u8 dst[16];
+
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_ASSERT_EQ(test, ucs2_as_utf8(dst, mixed, sizeof(dst)),
+			sizeof(mixed_utf8));
+	KUNIT_EXPECT_MEMEQ(test, dst, mixed_utf8, sizeof(mixed_utf8));
+	KUNIT_EXPECT_EQ(test, dst[sizeof(mixed_utf8)], 0);
+
+	/* The output length matches what ucs2_utf8size() predicts. */
+	KUNIT_EXPECT_EQ(test, ucs2_as_utf8(dst, mixed, sizeof(dst)),
+			ucs2_utf8size(mixed));
+
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_as_utf8(dst, empty, sizeof(dst)), 0);
+	KUNIT_EXPECT_EQ(test, dst[0], 0);
+}
+
+static void ucs2_as_utf8_truncate_test(struct kunit *test)
+{
+	u8 dst[16];
+
+	/*
+	 * Output that exactly fills @maxlength is not NUL terminated, and
+	 * nothing is written past it.
+	 */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_as_utf8(dst, abc, 3), 3);
+	KUNIT_EXPECT_MEMEQ(test, dst, "abc", 3);
+	KUNIT_EXPECT_EQ(test, dst[3], 0xff);
+
+	/* A shorter buffer truncates, with no terminator. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_as_utf8(dst, abc, 2), 2);
+	KUNIT_EXPECT_MEMEQ(test, dst, "ab", 2);
+	KUNIT_EXPECT_EQ(test, dst[2], 0xff);
+
+	/*
+	 * A multi-byte character is never split: "a" + U+00E9 + U+20AC needs
+	 * 6 bytes; with 4 the euro sign is dropped whole and the spare byte
+	 * holds the terminator.
+	 */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_as_utf8(dst, mixed, 4), 3);
+	KUNIT_EXPECT_MEMEQ(test, dst, "a\xc3\xa9", 3);
+	KUNIT_EXPECT_EQ(test, dst[3], 0);
+	KUNIT_EXPECT_EQ(test, dst[4], 0xff);
+
+	/* Likewise when two bytes are left for the three-byte euro sign. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_as_utf8(dst, mixed, 5), 3);
+	KUNIT_EXPECT_MEMEQ(test, dst, "a\xc3\xa9", 3);
+	KUNIT_EXPECT_EQ(test, dst[3], 0);
+	KUNIT_EXPECT_EQ(test, dst[4], 0xff);
+
+	/* No room for even the first two-byte character. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_as_utf8(dst, &mixed[1], 1), 0);
+	KUNIT_EXPECT_EQ(test, dst[0], 0);
+	KUNIT_EXPECT_EQ(test, dst[1], 0xff);
+
+	/* A zero-sized buffer is not written at all. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_as_utf8(dst, abc, 0), 0);
+	KUNIT_EXPECT_EQ(test, dst[0], 0xff);
+}
+
+static void ucs2_as_utf8_l_test(struct kunit *test)
+{
+	/* Deliberately not NUL terminated. */
+	static const ucs2_char_t unterminated[] = { 'x', 0x00e9, 'y' };
+	static const u8 expected[] = { 'x', 0xc3, 0xa9, 'y' };
+	u8 dst[16];
+
+	/* @limit bounds the source, so it may lack a terminator. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_as_utf8_l(dst, unterminated,
+					     ARRAY_SIZE(unterminated),
+					     sizeof(dst)), sizeof(expected));
+	KUNIT_EXPECT_MEMEQ(test, dst, expected, sizeof(expected));
+	KUNIT_EXPECT_EQ(test, dst[sizeof(expected)], 0);
+
+	/* A smaller @limit stops early, on a character boundary. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_as_utf8_l(dst, unterminated, 2,
+					     sizeof(dst)), 3);
+	KUNIT_EXPECT_MEMEQ(test, dst, expected, 3);
+	KUNIT_EXPECT_EQ(test, dst[3], 0);
+
+	/* @maxlength still applies when @limit allows more. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_as_utf8_l(dst, unterminated,
+					     ARRAY_SIZE(unterminated), 2), 1);
+	KUNIT_EXPECT_EQ(test, dst[0], 'x');
+	KUNIT_EXPECT_EQ(test, dst[1], 0);
+	KUNIT_EXPECT_EQ(test, dst[2], 0xff);
+
+	/* A zero @limit converts nothing but still terminates. */
+	memset(dst, 0xff, sizeof(dst));
+	KUNIT_EXPECT_EQ(test, ucs2_as_utf8_l(dst, unterminated, 0,
+					     sizeof(dst)), 0);
+	KUNIT_EXPECT_EQ(test, dst[0], 0);
+}
+
+static struct kunit_case ucs2_string_test_cases[] = {
+	KUNIT_CASE(ucs2_strnlen_test),
+	KUNIT_CASE(ucs2_strlen_test),
+	KUNIT_CASE(ucs2_strsize_test),
+	KUNIT_CASE(ucs2_strscpy_test),
+	KUNIT_CASE(ucs2_strncmp_test),
+	KUNIT_CASE(ucs2_utf8size_test),
+	KUNIT_CASE_PARAM(ucs2_as_utf8_char_test, ucs2_utf8_gen_params),
+	KUNIT_CASE(ucs2_as_utf8_string_test),
+	KUNIT_CASE(ucs2_as_utf8_truncate_test),
+	KUNIT_CASE(ucs2_as_utf8_l_test),
+	{}
+};
+
+static struct kunit_suite ucs2_string_test_suite = {
+	.name = "ucs2_string",
+	.test_cases = ucs2_string_test_cases,
+};
+
+kunit_test_suite(ucs2_string_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for the UCS-2 string helpers");
+MODULE_LICENSE("GPL");

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261105-kunit-ucs2-string-58ea0aa11314

Best regards,
--  
Amit Patole <amit.patole@gmail.com>

