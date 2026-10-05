Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1669F37F315
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231868; cv=none; b=pjz8gb9aDdcEX0yxl3EFK5jAGDEabNpKKCzxznOm7c/XAuoeTPk7TirFA7h9V9wIZD2taRkhMaSrwYFxySEtFk/EZFwNZ/y8oW9Nb5jzWeFR9Cv6Ho6f+cHUwRxn8dPDqnN+wv4kRF3JFN0SjFSNFHNrg5om2ThqKzH40Nh6O1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231868; c=relaxed/simple;
	bh=teFZD8/s7SkTvHRQ5E9gXwLE597l5z/O6G/MjJAPUDM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cZ7wDGE88RAz9+FfPHBGv3jJbec1AJb2qXwUzLp9aQ1EIjamceN8FapyZ//EfXyy9xJijXtepSVLLMzCTpXilNwDmo6XaloPg5Cf8bqRn+qLpm0AceZELOPWvXAx2KFNT4CazqEdwjwLWgjIZQPk2+UNMpz0c8Tmc0ITZKf64LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QF8y5nQV; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QF8y5nQV"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-46556b9e02cso185752fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231866; x=1791836666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xGqv0c43jB8r7queaUWKNp+S9cfIBbcfleVdy/NuuJY=;
        b=QF8y5nQVpTsLhs2XVSdE+tzxXs+YCPaMMvB/jK+b10e+SZVlKD/fi2d0xzt8QD8z8U
         efl77YSLWMoMZDCCN6wqNcZ9A+9BssjWJ+qHE/raItMgJt/qMHU6pGxkXAIpCwrNgHiW
         Q+RrDodWOf1LAtBRrPjl/89eDRnzqPzCSvSkk8EIJPdirgyTGcO1hEAhzRz19XJ0ZbTW
         DJnSTQhOvj//JqmoxVKsJZcUO1T+shbzPlQm901XcZprlXMgjtTF3UxCL9O1250AVxIz
         8vRc7hj6XCoHhcnjXJKmWxouUIo2N/SRVF5vq4WIg325XB/D1a2H83DITvAfL4UUuddg
         sVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231866; x=1791836666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xGqv0c43jB8r7queaUWKNp+S9cfIBbcfleVdy/NuuJY=;
        b=RGaSGG1nSPC/LTP091fbwVsE1i16KxKbuENQZM4ngYMTA6ZnhhOR3BrQcrE5rmRycV
         m5A6A4VZpXKnYMb1b3yUDH6x40XkLDvfpUYncsq/CL7wGlE4NK/AOIdNedntZNWj69q3
         eDzpYHWJOs60rtpTDvlER5fxOA/I3/HjTjONBB2hGWecXccfSfWGZXA6KgTms1ftW1gb
         +R+ZRdCUMXY66v7DPSojGTWVa45ibAab4PAQ4uwHvZ58wd7F/z5qRmJ6C0IllZ3NX5uL
         ODML66wYbTLkDD5r22vOFslMs4QXmmnxdhvqvLvHKgNjTJiXpjjrrkDwxh6UW5nsJSu7
         T84g==
X-Gm-Message-State: AFuF++m44nyBhJa2mT8jGuDnq/uB03DNMqgElqZ6DnhTozmhsCh2IHpu
	61+cAsArHRPlc1rS5GgxCYdDGMUuCMQhdlaBNOvRAVqEo1/ky04oncWb1gCmcdO9
X-Gm-Gg: AYBFou1kTzhAz6AdxyUCg6r6M1xJv5fhwacDGLqNgdd5qwaO2L1l5zHB0gWdRPppA8B
	/Ds+hx1gV6feNFruhmH2Hqjy+7wIelRsNZIKezGbim46U1D9BTFcubgrsDTr24BkI2w7fcDtv/o
	2TjnFS8V1cF1+zOqAdSwA+KlS+MCDEE3Es5efEBaeLnDGWkscURpVAHS7Sqlds0skBraiyR8cJD
	NUsfOKkWafZ6wxfFNfYDgtfF2PPblOogW3A5sH5F5VgC+VaGMU7MqeSizEUBw0CfsIABCgg8UDe
	kavNBE2zBzzTgIdGAo2iDFKiHZxTuVVtfNTy1lQK80o9mR4xaAyc2igXxLrchFvshi/WGYQ9U5d
	uVguPCh6c2KjnzaRcjvlyZmi+zAJUybmLHNLA4QvpzRJl9WSxbh4rXdfB4Rt7of6zydcOVMLosm
	mlzvZ+ZsFlHPKj26pgW8umcX2UeC+e0R1285SPDzuKkGSuNDzGZEFIs4c8VzQFyrALh/6WOYAul
	LsE7Kz8RPUfMRkd+l+7RVE=
X-Received: by 2002:a05:6871:7a7:b0:490:d828:a7e5 with SMTP id 586e51a60fabf-49f4ef256afmr555774fac.30.1791231865644;
        Mon, 05 Oct 2026 13:24:25 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ead0dbsm10900148fac.12.2026.10.05.13.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:24:24 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] lib/cmdline: fix integer overflow of the index in get_options()
Date: Mon,  5 Oct 2026 15:24:12 -0500
Message-Id: <20261005202412.3460441-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

For a range "M-N", get_options() advances its index by the size of the
range:

	i += (range_nums - 1);

get_range() only bounds how many values it stores, but returns the full
size of the range, which can be as large as INT_MAX. The addition then
overflows i, which wraps to a negative value since the kernel is built
with -fno-strict-overflow. As a result:

 - with nints > 0, the loop continues (i < nints still holds) and the
   next get_option() call writes to ints[i], about 8 GiB below the
   array;

 - in validation mode (nints == 0), the returned count is negative or
   bogus, so callers such as parse_int_array() allocate a too small
   array, and the second get_options() pass then performs the same out
   of bounds write.

For example, get_options("0-2147483647", 6, ints) writes to ints[INT_MIN].
parse_int_array() is reachable from several root-writable debugfs
files via parse_int_array_user() (e.g. in sound/soc/sof,
sound/soc/intel/avs, drivers/gpu/drm/xe and
drivers/platform/x86/intel/vsec_tpmi.c), and get_options() is used
directly by e.g. the lux_table sysfs store handlers in
drivers/iio/light/tsl2583.c and tsl2772.c.

Stop parsing if the range would overflow the index, and add a KUnit test
case. Ranges that don't overflow are parsed exactly as before.

Found by fuzzing get_options() and parse_int_array() with ASan/UBSan
in userspace; the new test case fails without this fix.

Fixes: 22f2e2801799 ("[PATCH] get_options to allow a hypenated range for isolcpus")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 lib/cmdline.c             |  5 ++++-
 lib/tests/cmdline_kunit.c | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/lib/cmdline.c b/lib/cmdline.c
index 16cce6621..76a4a39ec 100644
--- a/lib/cmdline.c
+++ b/lib/cmdline.c
@@ -125,8 +125,11 @@ char *get_options(const char *str, int nints, int *ints)
 			/*
 			 * Decrement the result by one to leave out the
 			 * last number in the range.  The next iteration
-			 * will handle the upper number in the range
+			 * will handle the upper number in the range.
+			 * Stop if that would overflow @i.
 			 */
+			if (range_nums > INT_MAX - 1 - i)
+				break;
 			i += (range_nums - 1);
 		}
 		i++;
diff --git a/lib/tests/cmdline_kunit.c b/lib/tests/cmdline_kunit.c
index 3f61ff8d3..96e6593ff 100644
--- a/lib/tests/cmdline_kunit.c
+++ b/lib/tests/cmdline_kunit.c
@@ -252,12 +252,31 @@ static void cmdline_test_memparse(struct kunit *test)
 				    "    when parsing '%s'", e->input);
 	}
 }
+static void cmdline_test_range_overflow(struct kunit *test)
+{
+	int r[16];
+
+	/*
+	 * A range spanning (almost) the whole int space must not overflow
+	 * the number of parsed integers; such a range is not counted.
+	 * Only the validation mode is used, as it never writes beyond r[0].
+	 */
+	r[0] = -1;
+	get_options("0-2147483647", 0, r);
+	KUNIT_EXPECT_EQ(test, r[0], 0);
+
+	r[0] = -1;
+	get_options("1,0-2147483647", 0, r);
+	KUNIT_EXPECT_EQ(test, r[0], 1);
+}
+
 
 static struct kunit_case cmdline_test_cases[] = {
 	KUNIT_CASE(cmdline_test_noint),
 	KUNIT_CASE(cmdline_test_lead_int),
 	KUNIT_CASE(cmdline_test_tail_int),
 	KUNIT_CASE(cmdline_test_range),
+	KUNIT_CASE(cmdline_test_range_overflow),
 	KUNIT_CASE(cmdline_test_next_arg_quoted_value),
 	KUNIT_CASE(cmdline_test_next_arg_bare_quote_regression),
 	KUNIT_CASE(cmdline_test_next_arg_mixed_tokens),
-- 
2.34.1

