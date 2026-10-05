Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26A9414A3B
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 21:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791236410; cv=none; b=ZHeo8/AW9081fVHe+2bZGY/oTLHKGtTvsyFJXWKwy5ZnIXQy3CPSJEVUmKlkza/cT0VkC7CZ0ktYF8uEPPSU/ANjnEHn68Hi62PQyrMkMRcYe3e9skkexJA1y303o9QhZ5i0cxGLs9MV3jsUBb8bbLdVM8WcGJhOjrNceMwuGrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791236410; c=relaxed/simple;
	bh=/2lEehzu5T9P8BnN3pXcEl5h4pIg8Fh+2+aQHZAzoSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LSF2PctMeKc7FAxBLv1AQ+Vf7XqJJN/b5wyws+tGhvqbfPaKOp6TcHh2Zlk6jow7iZ6QOlQC0GEL69fA2S3lQofGurDS3JCermcPt7KUODxRJOlOBryS96Zywtf5ILXMWmTpr2U3qCcO53e06VwYZ6zE8w6dUSYPSnNvIlrx2pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyqD+Gn9; arc=none smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyqD+Gn9"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-534af4d1a37so20206611cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791236408; x=1791841208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZGiQbZnsx3vV3HLL1PhpDRCAfbemOrB2Rck7g3/BeyI=;
        b=kyqD+Gn9OIR9LikObAWxptafLSxDJQ6b/EtFH9JlBelCvZZOr7NDW7D2pzzeKmX2aE
         KKtFC0vCrxxQXzoHkrbEML6j0bmKAWTMNyaOdbSZLmTc619zmo3YbPS91K4Elf9sRgld
         7nUKNcappreJV0L3SW304gCLf1CsyGD87I9aXdRRFumiflaETs3f2k0mhn5SKcjG+cDG
         KSZXn9hgCbMsBki9nLK6LxL5dvRb6SQyqNq1VpHcmg0hduuVjSKxjRB1Oz5MI8pknzI6
         ySxlVg6h+FZ14R14OvFqetD4w4pEK8G7kYQROGwW2GRkoDOSQrgDZMKM7tGOKTS7KigC
         eAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791236408; x=1791841208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGiQbZnsx3vV3HLL1PhpDRCAfbemOrB2Rck7g3/BeyI=;
        b=YNDmYwexmtnGJXbj8WhP9n02zUaYPDlqvynfF5X7fzAlKirkRVQD52mF2wczO8k8T3
         kOPlvoTPYSC7m8vGFt6udV5Q8qpAjOGj8TZcUrVLJ2pbSBRQ35oMHSsQEsyM9buNfyKe
         Ff3YlA5ZVgPBK5Q6V8R8TJIA5j2yNqMrMLQ5+a1v/9dksB3Otu/csCGL6aBG3FM+M2rl
         IpFfh6YGy12pSvYPJWILbJvMIrh1miyBqxel/pMbO+HIyXzZmKX5s7MFuIqJOHDwc8JU
         g6qHxyGz6+82yK+cRcbRlaFPMGPDU5TFkiEOqd9NiUzAI91tYqnQtStmneoOZYcukFrh
         6VSg==
X-Forwarded-Encrypted: i=1; AKwUvBwsU5mKH4FxcPneGQjDWT2Q5zJk3T0f9HDbAvB9DqRXWbSbZAoUVtxr9cER75txgJGYqj/cw3KlRyB0NGE=@vger.kernel.org
X-Gm-Message-State: AFuF++nppzNS9DqyhsPXzjW7rQZc384wmSphi0zNvQZdYHDEhRrCP4J+
	vt9vtH2w+uOiRi4zc4ApdFS4X0rZWj2yWMRowPFJIDTvxTsM3/xWZTZF
X-Gm-Gg: AYBFou01sXBvEcGwXPlRulVABbnOrm0D90CC49NLRahST2DTzxEFToDHGpXpyCGf+A2
	Ef/6JJzPKdyffpvHnoC33UK0QHAEK+WJLxy3yE6dCUxPXUh0tDekY/xFeSBgLXtMGO5avw/dPS0
	KFwlCf302YDiWth0M7cGm7DphnW/X9ci1Z4BulPfODavLc7a/yatC51he3toS2s8mKir8aBxVeR
	uQryMHJTkC9m8mnAUwFrt0rSd6G/Cz6vMhd3C8F/fGBiL3ZjXnSKy705ynfc2hk2oNVwuLgwE7G
	8HIGxC9WmgC7yXC2p6LwyUO71xo0xRUD+TKR3KYBTk9C67U+tgaqVZGslgpKhMhARrXsyqSw0Eu
	wd1Xvjv8Q/7eYlxwy4GjbFncTZuQZQGbMMjZxTnNmcJXuKC8W0J8cfW7Mact3C1OZ5RJubLmSkP
	VyHAT6STMIu7A1tPQy3aHsBvWurbtvnEr12i7cd6wVOmK9Pnres7PAxvV2oDIRuHZMzUGo4Zon
X-Received: by 2002:a05:622a:5c0e:b0:535:10cd:8b41 with SMTP id d75a77b69052e-53510cd8e08mr156011931cf.25.1791236407677;
        Mon, 05 Oct 2026 14:40:07 -0700 (PDT)
Received: from fedora ([47.14.88.220])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5351fd92b58sm55315451cf.21.2026.10.05.14.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:40:07 -0700 (PDT)
From: Armaan Sandhu <armaan.sandhu0504@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	Armaan Sandhu <armaan.sandhu0504@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] lib/cmdline: fix get_options() count and overflow with large ranges
Date: Mon,  5 Oct 2026 17:39:45 -0400
Message-ID: <20261005213945.359905-1-armaan.sandhu0504@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

get_range() stops writing once the array is full, but get_options()
still advances its index by the whole range. So "1-100" parsed into
four ints reports 99 numbers, and a range like "0-2147483647" wraps
the index negative and writes outside the array.

Stop once a range fills the array, bail out in validation mode before
the count overflows, and saturate the range length in get_range().
Add KUnit cases; without the fix "0-2147483647" panics the test kernel.

Only root can supply this input, so this is a robustness fix.

Fixes: 22f2e2801799 ("[PATCH] get_options to allow a hypenated range for isolcpus")
Cc: stable@vger.kernel.org
Signed-off-by: Armaan Sandhu <armaan.sandhu0504@gmail.com>
---
 lib/cmdline.c             | 13 ++++++++++++-
 lib/tests/cmdline_kunit.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/lib/cmdline.c b/lib/cmdline.c
index 16cce6621cec..40b98d943a9a 100644
--- a/lib/cmdline.c
+++ b/lib/cmdline.c
@@ -11,6 +11,7 @@
 
 #include <linux/export.h>
 #include <linux/kernel.h>
+#include <linux/overflow.h>
 #include <linux/string.h>
 #include <linux/ctype.h>
 
@@ -26,7 +27,9 @@ static int get_range(char **str, int *pint, int n)
 
 	(*str)++;
 	upper_range = simple_strtol((*str), NULL, 0);
-	inc_counter = upper_range - *pint;
+	/* Keep the sign of the result when the difference doesn't fit */
+	if (check_sub_overflow(upper_range, *pint, &inc_counter))
+		inc_counter = upper_range < *pint ? -1 : INT_MAX;
 	for (x = *pint; n && x < upper_range; x++, n--)
 		*pint++ = x;
 	return inc_counter;
@@ -122,6 +125,14 @@ char *get_options(const char *str, int nints, int *ints)
 			range_nums = get_range((char **)&str, pint, n);
 			if (range_nums < 0)
 				break;
+			/* The range didn't fit, so the array is full */
+			if (!validate && range_nums > n) {
+				i = nints;
+				break;
+			}
+			/* Leave room for the upper number of the range */
+			if (range_nums >= INT_MAX - i)
+				break;
 			/*
 			 * Decrement the result by one to leave out the
 			 * last number in the range.  The next iteration
diff --git a/lib/tests/cmdline_kunit.c b/lib/tests/cmdline_kunit.c
index 3f61ff8d3178..584fcb2c0e44 100644
--- a/lib/tests/cmdline_kunit.c
+++ b/lib/tests/cmdline_kunit.c
@@ -140,6 +140,43 @@ static void cmdline_test_range(struct kunit *test)
 	} while (++i < ARRAY_SIZE(cmdline_test_range_strings));
 }
 
+static const struct {
+	const char *in;
+	int parsed[4];
+	int validated;
+} cmdline_test_range_overflow_cases[] = {
+	{ "1-100",         { 3, 1, 2, 3, },    100,        },
+	{ "1,5-100,7",     { 3, 1, 5, 6, },    98,         },
+	{ "1-2147483646",  { 3, 1, 2, 3, },    2147483646, },
+	{ "0-2147483647",  { 3, 0, 1, 2, },    0,          },
+	{ "-5-2147483647", { 3, -5, -4, -3, }, 0,          },
+	{ "2147483647--5", { 0, 2147483647, }, 0,          },
+};
+
+static void cmdline_test_range_overflow(struct kunit *test)
+{
+	unsigned int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(cmdline_test_range_overflow_cases); i++) {
+		const char *in = cmdline_test_range_overflow_cases[i].in;
+		const int *e = cmdline_test_range_overflow_cases[i].parsed;
+		/* Two guard elements past the array handed to get_options() */
+		int r[ARRAY_SIZE(cmdline_test_range_overflow_cases[0].parsed) + 2];
+		int n;
+
+		memset(r, 0, sizeof(r));
+		get_options(in, ARRAY_SIZE(r) - 2, r);
+		for (j = 0; j < ARRAY_SIZE(r) - 2; j++)
+			KUNIT_EXPECT_EQ_MSG(test, r[j], e[j], "Pattern: %s at %u", in, j);
+		for (; j < ARRAY_SIZE(r); j++)
+			KUNIT_EXPECT_EQ_MSG(test, r[j], 0, "Pattern: %s out of bound at %u", in, j);
+
+		get_options(in, 0, &n);
+		KUNIT_EXPECT_EQ_MSG(test, n, cmdline_test_range_overflow_cases[i].validated,
+				    "Pattern: %s (validated)", in);
+	}
+}
+
 static void cmdline_test_next_arg_quoted_value(struct kunit *test)
 {
 	char in[] = "foo=\"bar baz\" qux=1";
@@ -258,6 +295,7 @@ static struct kunit_case cmdline_test_cases[] = {
 	KUNIT_CASE(cmdline_test_lead_int),
 	KUNIT_CASE(cmdline_test_tail_int),
 	KUNIT_CASE(cmdline_test_range),
+	KUNIT_CASE(cmdline_test_range_overflow),
 	KUNIT_CASE(cmdline_test_next_arg_quoted_value),
 	KUNIT_CASE(cmdline_test_next_arg_bare_quote_regression),
 	KUNIT_CASE(cmdline_test_next_arg_mixed_tokens),
-- 
2.55.0

