Received: from mail-dy2-f35.google.com (mail-dy2-f35.google.com [74.125.229.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4023C48FF69
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331822; cv=none; b=nLZw+QTsgtpMlJjGd+0IjKb0z8KcSfBgw9DJJ033vGhPOXOXkO3BzN9hRxyzeSPhC09+yU4RV62vmsUKKx0xwMa1a/9z+Vp9rlfaU+tRcH8Q1tAhaU4NcrabXSkq9yLWSFR/Wzt1xZGrfMzZFxw3ZBjIwPcPIDPnIo8M/tA/13Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331822; c=relaxed/simple;
	bh=pvnBo0BTjzgEz5yxhZt9kr22DruVbgYxPEJ7jyn0UUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Almfmr+Q117nf5A2/rNRVzA3msJY3h+cLXNtlrPJZ6gpV6N/3cvx9eZrbMfiQ7JMkePpgl6jN7s4dpdbyNFeBWdT1wQIc+qB5caLbD37ckmEVGroXBkB+5NxBOM8yzNZE4wcvqAnNINZmln21gB3WYwYAdSEKdBQjQLTdRUyIoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=baFRAsBg; arc=none smtp.client-ip=74.125.229.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="baFRAsBg"
Received: by mail-dy2-f35.google.com with SMTP id 5a478bee46e88-3381a6a05c9so388725eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331820; x=1790936620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MFw8u/VdnLoQh1l7Rz3Xhcg3E9/nfHoTOlWcqQk/LkI=;
        b=baFRAsBgYyCC2Q0Xvz11I45AxpvH+GM6XhrZ7x1atZez21qjUNF7hNV/lqmt+a/+Am
         h9BmpGIAM4C4/b8xBtUpxqUyGIKc0xSgOfi23jrO2R9/8vzmGjm+SLha/7TCD6HOPHZ+
         Vt9k8CzqotZIT7BPxF8WBhGn6t5oxwnRQGUcQOuJTz2UPHehnb33MzwI/AURTv+T2PuA
         4zMX6IU9yWNG5kZOhWYd6RKz1cRT6RwSmdrPnCC2EC/E0W5hvtg2sGgTGA1SQdgndJWv
         KiWoklqEoH5yfZ4v2JCYT+gZ2H1MI2f9NkqZgqHI2MbZLOtGpRmIOSBe7z9SPP6JSkeg
         EoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331820; x=1790936620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MFw8u/VdnLoQh1l7Rz3Xhcg3E9/nfHoTOlWcqQk/LkI=;
        b=PluE5IgUAZGlNmAbwXlZk649diPnoYPEu11NFRZnwwMhWM2Yu9LLjmaINP5p9PrFDr
         8QZX6uBB98N7C+x301tyWk81yewrHVvKOaB4TmW3asf5MYdUueZAffV51h+pRLnZXW2v
         kJ+xKOMZ//qKvtSMkEOMcOjNwvJc9kykCC9UodgLSN57uTPIyVHOwP7YTzNK6oJ+rYWA
         EYCp3F8ZFiIcGeJ6TVuZABhXbJ+znWAKG4O484TLrjsz/O9c4bYlZN3fVvn604mEjCV8
         6NJVnECJR9CF+EconCGGU7+YI9/oCljv6biwc22wYyc+WtVeOnWEbEdaeIp7RICRpE3Z
         lkag==
X-Forwarded-Encrypted: i=1; AKwUvByh0gysxxtKvRgttGJdWrCsNkehn78KT1JETOgFB57Qen8d13VHjm1DT3TX4Vu+pmoyb34kGt6OI88OueA=@vger.kernel.org
X-Gm-Message-State: AFuF++lEfelZL/5dWZvck3Swfg99YuAsZyN/msc4gTIvBRdpUB2mv7I8
	tUyh02SWPM9mV8JfqZMuzzy/3b05IGZgmmFLmDvewNMqJhd5UWZHHIhT
X-Gm-Gg: AYBFou2/43RF2Aq8GnJc4fknBvLk4ZU4EMhnfjviW/9zcxEeMZtVF4Eb9tXp42ztNWn
	Q7wSaD9ixXW2BM6ke024709+uMkhWbVHsdtHEt0DQxhh55S8VQ/8SYDJOgeSM6QR46/JGIQ+hVB
	CnjAG+sYRE/10Odh1EyR3pprccNCKBsSVAXriogLBviNDJz2ufImDl4W81Ih+YGEcRRvxRU51mR
	vgx0R063jniRnO0NSML6Al6q+2JvHlbZJ9UpCgTQTZdD+5gGLFCbXWcMlkE5o2r8inQeAFfV9mO
	0hQiAwAROD1eFbBvGEiaEN0Pak8Dzj+TSoEC2xaC7My3/glm9R6UZRytHbtx+W8xfvulImkpYWf
	FlWrKSAzt9rxkfKmK/Evg5FAlC6ak5pNrwy3XFqEa0fUtluu7e6uSVLkCg9/eVqElw7gs4k6GeW
	EeI3knxSbIxK4XyYcMJoVwncN/GtukIi+yesbcrxvRBD0I6Lr1TLuw3EG5AB97U7NOJKZ9Inaxs
	nVFba3kf5BWakezkewavKk56All8Rm9dtrOkszcpUWgHro09If3BiIYFx2czu463czqHeDXMHlm
	RMyU7c9LhUMwqxqE+5Rk2Xo+NQpRTdEwALMHNmQL+xbWZis9+P6FsZldZ54o9SPwXD+Yh0JVmw=
	=
X-Received: by 2002:a05:7300:fd16:b0:340:ef5d:3517 with SMTP id 5a478bee46e88-340ef5d3737mr4599341eec.15.1790331820032;
        Fri, 25 Sep 2026 03:23:40 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144173a2asm5787949eec.6.2026.09.25.03.23.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 03:23:39 -0700 (PDT)
From: shashank <jain.sm@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Elder <elder@kernel.org>,
	David Gow <david@davidgow.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] lib: parser: reject out-of-range values in match_number()
Date: Fri, 25 Sep 2026 15:53:33 +0530
Message-ID: <20260925102334.49693-1-jain.sm@gmail.com>
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
Signed-off-by: shashank <jain.sm@gmail.com>
---
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

