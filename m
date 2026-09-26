Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EA5315D53
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386046; cv=none; b=Hypi97fI5uPS5543p7qS/bmuUqYJY11+Xc/rY2XBvQJvKaHnSHFdreFrqEpYvT9mkhPOVRYazK+G7+5dTudcUCuF/ETkJJfyZD1D6JDytbqpHp/pc9EQi/gCGBDfUvk7fBjSSgXYx+7Wr3c27fJE13sAwp2lbTfLm5zGn5Dd0Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386046; c=relaxed/simple;
	bh=oXf5D7qt6/DYOKPVdtSFwlM794VVX5vaSbtwIFTPwXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OdLiiWJcLVEuawjLnWd+2rKlf+7mE2mLZT9WttiUXOULZ9vLDgffF03oaRt/vmWR2jJPvHftwjj6v9yEwfwEz2TaDgplVHHaaBHWWgXwcoTjUM1fiH8gffNT4jSFzcdqzYEh2hoilYwiccBXR1Tm8TsRKeNWX8sxnHxs7zuQaM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pC+dkldp; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pC+dkldp"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33e619af891so962130eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386044; x=1790990844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q3+Kus2HhoVxkah1+ztadidUeTVC6bDueQ5iVUZhHKs=;
        b=pC+dkldp74g52vjIbGYDLoN/PV3uFuuFymiSxqaeFDEe9oO74A+nKh2AYcsretQxT8
         dODLeLgpgCLgt97KC+fmFUGTqzczF6QJZ8wu4UnYz8nCElyNw0Cok77vAkOgq3gen5WL
         14nx1Rw9lFPo1C4BP6mlHbEiLYL75B/yxy68bKZK7NRC65Ql5CB+EZa/XTVN0C3FJOOx
         RPkfgrfOB5kBTRkP93uIt7K2UwdmhAo2JMJRy18J7sZdbwjt8MCtthNS76hTLNDHFrvq
         7yKXw6RXQmM+G2X0zQGc1/XzTPBWtsbXpuA10ZltJTB02NLExJuEpO9d2aXEyN9DJo5n
         eOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386044; x=1790990844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3+Kus2HhoVxkah1+ztadidUeTVC6bDueQ5iVUZhHKs=;
        b=I2gRr7xkNnkzAixikAqF3GmpNd0viyHqlcirGumiskePDZCwELDV40QuArhNBXejtT
         KTCwFZNuwIhuVgxXAtUlMijx+d12oEk9jSl1mdrbn4hCTrlSVlJeZDIw1LvdcWroWZKx
         IuIbooL8nz48aQ17wEpSrZyxcI8nJhnMYlfvZ1JMTRt4diUd05wrLGtgUJ8I+NKrzBLx
         7EOnl9bsh0+ycbLjTvaNPNNubzvNQq5s/ajDMaK+QzpZ3j6OjXW7vNsstwgw8XzUKQna
         MCmeWHvWYv/SpresT10IvSC7Ma3tHp/6y70Jo+YNlN2LwkK4m+RBvEYNwStxGDG2YbeF
         KDMw==
X-Forwarded-Encrypted: i=1; AKwUvByfe6Wl/vwkBhxUOcxtHDfo4Yw1MMnPvTuNPFcEruyH9EJ78uw6t/JU/tlgdZvK77pDEhmuA9cgLM1w8wc=@vger.kernel.org
X-Gm-Message-State: AFuF++m0bASeUAZwwEvdHd2pUvJ9J71ffCd0kyJlD6G1G2wFeJ85BOQe
	M+RbL9e2e7eSOjszajWfY903ZhCGh/8FKIJb4gKRGCoY0ckXEicZMXBj24PtUzbV
X-Gm-Gg: AYBFou0QuZTzWSKzfCDNFONZTPVFBXFPDxYhib4MMOjPPAOdtf1BTfaiEmEnzPn6KKo
	fpjhHjZqRY53aVzefhmVhME1fwgyQtAQmDvUo3ldGTq37jSHbGN3A4CO2vNjN8RYIsgEDeG9LhX
	i++z+vvWs4x9qUQIPXt1GFUjhXf26b56+B5ulxzwSmUejU4lhd1i4IGzbsimtzztTFDfki4R2Wh
	mS0u+t08u1POOX+nlRNqWh3uD7YlvEPEuTP61NuYKbCxxeya/ycTdU7KQKHLy/ybiJQ1QJ5oXvM
	46RM5wUEcLbHbKi23HfX7CpPm8fCxpImso+ZkY6WdEtO5jOJJO93WdTpP0NZz7EEesktKECbaN3
	Dt4OpbisMKcfAmk+TjNPkmzGw8AvKpSt2TBzUVSPEhRiwZ8jkd3CTYHuv57jnh2KcaVU+VBctdw
	75QqY0zEk3SIP74SU8XtMJ3S2VMr/suKwQbN467oiDv7aTatnm3CcOvIGLRRNCoAtZNgkLLjyVl
	z58w20EVarv2CdzXt3RrC2AvJRuLrWquPP80omjsuNWjEVvkzCFbQbA6DNWxsPUtCJpT8HdhBsi
	bldkwEG9+EejdcytFadjSv2SpTvLs+j401kyCoX1jpDA9amAOf/ov0mKAEFrNRTmGRxIWXUSyw=
	=
X-Received: by 2002:a05:7300:880d:b0:341:6bbe:b9d6 with SMTP id 5a478bee46e88-342700c06d7mr1639410eec.1.1790386043498;
        Fri, 25 Sep 2026 18:27:23 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144173a2asm9568089eec.6.2026.09.25.18.27.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 18:27:22 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Elder <elder@kernel.org>,
	David Gow <david@davidgow.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] lib: parser: reject out-of-range values in match_number()
Date: Sat, 26 Sep 2026 06:57:17 +0530
Message-ID: <20260926012718.15675-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

match_int(), match_octal() and match_hex() store the result in an int
and return -EINVAL or -ERANGE on failure.  match_number() checks the
range by parsing into a long with simple_strtol() and comparing against
INT_MIN/INT_MAX, a check added by commit 77dd3b0bd17a ("lib/parser.c:
avoid overflow in match_number()").  That does not catch every
out-of-range input:

 - simple_strtoull() saturates to ULLONG_MAX on overflow and
   simple_strtol() simply converts its result to long, so any value of
   at least 2^64 - 2^31, and anything that overflows 64 bits, ends up
   inside the int range.  On 64-bit, match_int() returns 0 and sets
   the result to -1 for "18446744073709551615" or
   "99999999999999999999", match_hex() does the same for
   "ffffffffffffffff", and "-18446744073709551615" gives 1.

 - On 32-bit, long has the same width as int, so the range check can
   never fail: "2147483648" gives INT_MIN and "4294967295" gives -1.

On 64-bit, values from INT_MAX + 1 up to 2^64 - 2^31 - 1 are already
rejected, so for those this only makes 32-bit kernels behave like
64-bit ones.  Two callers store the result in a u32 and so accepted
such values on 32-bit only: the legacy NFSv4 idmapper upcall
(fs/nfs/nfs4idmap.c), which falls back to a numeric id when the lookup
fails, and rd_pages= in drivers/target/target_core_rd.c, which also
ignores match_int()'s return value.

These helpers parse mount options and similar user-supplied strings,
so an out-of-range number is silently accepted as a different value
instead of being rejected.

Parse the number the same way simple_strtol() does, using the same
kstrtox helpers, but keep the unsigned magnitude and the overflow
indication, and check the magnitude against the int range.  The
accepted syntax, including what counts as "no number" (-EINVAL), is
unchanged.  kstrtoint() is not used because it rejects trailing
characters ("12abc" gives 12 today) and differs in the handling of a
lone "-" or "0x".

Fixes: 77dd3b0bd17a ("lib/parser.c: avoid overflow in match_number()")
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
These patches were prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5): the analysis, the Lean models used to find and check the bugs,
the fixes and the tests. I reviewed them and take responsibility for them. The
trailer only says "Assisted-by: LLM", as Documentation/process/coding-assistants.rst
requires since commit 816d9992d9ed ("coding-assistants: simplify attribution").

Changes in v2:
- Resent with my full name; no code changes.

v1: https://lore.kernel.org/r/20260925102334.49693-1-jain.sm@gmail.com

 lib/parser.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/lib/parser.c b/lib/parser.c
index 62da0ac0d438..30fdaefe4957 100644
--- a/lib/parser.c
+++ b/lib/parser.c
@@ -11,6 +11,8 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 
+#include "kstrtox.h"
+
 /*
  * max size needed by different bases to express U64
  * HEX: "0xFFFFFFFFFFFFFFFF" --> 18
@@ -137,22 +139,35 @@ EXPORT_SYMBOL(match_token);
  */
 static int match_number(substring_t *s, int *result, int base)
 {
-	char *endp;
 	char buf[NUMBER_BUF_LEN];
-	int ret;
-	long val;
+	unsigned long long val;
+	unsigned int radix = base;
+	const char *cp = buf;
+	bool negative;
+	unsigned int rv;
 
 	if (match_strlcpy(buf, s, NUMBER_BUF_LEN) >= NUMBER_BUF_LEN)
 		return -ERANGE;
-	ret = 0;
-	val = simple_strtol(buf, &endp, base);
-	if (endp == buf)
-		ret = -EINVAL;
-	else if (val < (long)INT_MIN || val > (long)INT_MAX)
-		ret = -ERANGE;
-	else
-		*result = (int) val;
-	return ret;
+
+	/*
+	 * Parse like simple_strtol() does, but keep the magnitude and the
+	 * overflow indication instead of truncating to a long, so that
+	 * values outside the range of an int can be rejected.
+	 */
+	negative = *cp == '-';
+	if (negative)
+		cp++;
+	cp = _parse_integer_fixup_radix(cp, &radix);
+	rv = _parse_integer(cp, radix, &val);
+	if (cp + (rv & ~KSTRTOX_OVERFLOW) == buf)
+		return -EINVAL;
+
+	if (rv & KSTRTOX_OVERFLOW ||
+	    val > (negative ? (unsigned long long)INT_MAX + 1 : INT_MAX))
+		return -ERANGE;
+
+	*result = negative ? -(long long)val : (long long)val;
+	return 0;
 }
 
 /**
-- 
2.43.0

