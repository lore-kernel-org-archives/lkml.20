Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1638C1DA60D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 01:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791164671; cv=none; b=k0Q6kpoxG54fDnf47dnYM+mx2qBT9cyDC2IMWNDnv3Xjc9iLTx4AJwMKsuROpdw15PERHr9hgeWfnv84FRoDz3PUx52QgD6w3YHCb4s+Wnsm77xXdHTB8SOuJOC4xwtIU7EpibNu2fJqRJ3cLxNIX+iEULGi3Q21VMVQSH6eUSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791164671; c=relaxed/simple;
	bh=PEKE1ZjYjM6R9MAuDM15J9UvJNlH4uTzNw8yrwfGTFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k/BeEh7tXpQ+lZcdK6ZsoorwYGH55IbQTVcPOpPP0Ezl+yWpqa2HxbHFYNha3h7JjR4NkrAP0p8HVPDkdOCkPwqXnLjyqIpuyPxc29T8K6PUe9br4AcepW9ImRRdddvhbd8W9bic2XFzc4sghef2LrYXlP40++mkEue/m4AtHoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXBo5kPm; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXBo5kPm"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c24422d4dso1912217eec.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 18:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791164669; x=1791769469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JE/amgZwOLTDxoV/Lm24iKg5GzlBHfM9+av6/noDbE8=;
        b=gXBo5kPmFmvybGbF7bhD22mfiB5xUxkNa213QJYYmf9dkIpgXA4w7GKUC05JjNotXk
         w754Zkt66kKFv0u77UXwhlMafxf8mGVFKOZk70+AZBTWXg8Uqa54GJG0NpDiylsLvP3Z
         Sze9w2QbTtJwuUI+lFppjYMMimgDBYN+njHXl6931eh2oGpczv0T85W3sP0WYd/wgrIr
         u8ZtoZ905vlTYOdvWQTMMWe2JApgWCT//HoVQcX/ZICpvEE7g0pp6z/OIGwcKnOJSW7+
         R5ws/ac3b0xypHemM4bigAfvwm1ogFX0+XH9evDjA1lJ0rx1warMMC2iEXSesnPeOMrB
         eDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791164669; x=1791769469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JE/amgZwOLTDxoV/Lm24iKg5GzlBHfM9+av6/noDbE8=;
        b=tomWpLShLdSAFrGILCjzM4E2lnI8d5UBb70COQEP0XsuGaMw/6Dwqow3LlRjzTRlFj
         4Y8mO0FXMWIOi7LuM9JLqd9If3U6BNGy3NFt3rkyrTLVes6tavfd2E53J5CN/go2KxJR
         zT66iFHHuE4C/Okk/PaGQ3F0JTQ2A5trBjEBCIH4PQWpTlmlgH/sRt5oicBO3W/n8iFb
         NRNQMstQbU+6BRJubOO/TP851FvHliB5FPsTn0Aqq1U3NPmeyilS3CMVtswwAdDobaoA
         poTCeIbO3fN+7rpJj2hZJ6UYMq8pjy442BgUGDayklMRITByuQycx03vD1m8yptNRevo
         uNLw==
X-Forwarded-Encrypted: i=1; AKwUvBzzOuXPAr9k975SXjTXIFrc6v1LRdjCd5IflDNqTlGTVRBD0v4ql2ed4U87ndsEttR9QELqGSmvYiQLGDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4F53DkHleZEVIGMdqjaPW9gzuqQFFyek+0EjUEc3tX6P27rYV
	yU17IuF+CoCr4DGA33Zavo34jhD5WybauofxOtxiGXkK6QAVQDHECyLw
X-Gm-Gg: AYBFou18ev9qGYpvkYusboJR6BK7PnPxF67eC6aQKbjcmW6FlsaUWJ13VC8uwQdrZX4
	8ZZETodLqS/TWLOmj05+pWqz8VEG53eNb0q6O5WydiIG5nWf3j2DKKPpsRwxOKbYwFsPictSY2v
	81WzxSPne8o7SpQXgNZijvHsEt9IHxsf0/XarBiJKnqerFZ/LRbqqqLeTKL+PfuyaJSvZIxj4Bl
	bmQyYHbbEcCnA65kJrIiN33AxD4Ww9uwTfvwnOBVoM1+EF6tzAtrGixzF/zWkZZFlLu7ARpi3UK
	r0qoH9XRtsjyWdlYanrPMhlAKNhhfvChRJ0m1JfDb25QuDol4L/ikxwkd/dxS59rZql6yvH0WHE
	6Mmjp2IdqyrI+7e/5ULVkR5kOPoBaohEBGysx7/Vrwm4egdaMD9PeRLAC+VbRhRJdb2KMiA7JGe
	p0T78oB4cj2LraGxBhIDHtjppGIr5fjvnLWCu7CvAElS6WxQ51boLOeUC22dxBxmAkrsVMszvGl
	5ORao0O5AemEDofsMynppvVefpcolBnXi2Dja2AAk3+XeSp5Hp27J3ttZNaRx6d6OjJ5xGaeoMp
	A2O6yjimrhlEg3k+dSS1lEDUzcOU5eHsD8wuqKl54e1QGtXRBGYmrgc7YRFI5O9GxlW1HTHGLSX
	WhxslsMm+5R/TTZJon7lxtj7aVQsaoUkwmyebyAV1GemXh7ZjbLNjHUY=
X-Received: by 2002:a05:693c:638e:10b0:33b:dab1:d6b5 with SMTP id 5a478bee46e88-34f1509e5a3mr11209050eec.11.1791164668977;
        Sun, 04 Oct 2026 18:44:28 -0700 (PDT)
Received: from FT6N242TWK ([223.181.113.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272d5103sm8912084eec.27.2026.10.04.18.44.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 18:44:28 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Elder <elder@kernel.org>,
	David Gow <david@davidgow.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] lib: parser: reject out-of-range values in match_number()
Date: Mon,  5 Oct 2026 07:14:22 +0530
Message-ID: <20261005014423.78677-1-jain.sm@gmail.com>
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

These helpers parse mount options and similar user-supplied strings,
so an out-of-range number is silently accepted as a different value
instead of being rejected.

Use kstrtol(), as the comment above simple_strtol() recommends.  It
returns -ERANGE for values that don't fit in a long, which on 32-bit
is the whole int range check, and the INT_MIN/INT_MAX check covers
64-bit.  The substrings passed in come from match_one(), which ends a
%d, %o or %x argument where simple_strtol()/simple_strtoul() stops,
so kstrtol() sees the same characters and accepts the same values in
the int range as before.

Fixes: 77dd3b0bd17a ("lib/parser.c: avoid overflow in match_number()")
Suggested-by: Alex Elder <elder@kernel.org>
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
These patches were prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5): the analysis, the Lean models used to find and check the bugs,
the fix, the tests, and the check of the in-tree callers for v3.

Changes in v3:
- Use kstrtol() as suggested by Alex Elder, instead of open-coding the
  parse with _parse_integer(); the changelog says why it accepts the same
  values for the callers. The existing "int ret" and "long val"
  declarations are kept, so the diff only replaces the parse.
  Patch 2/2 (the KUnit test) is unchanged.

v2: https://lore.kernel.org/r/20260926012718.15675-1-jain.sm@gmail.com
v1: https://lore.kernel.org/r/20260925102334.49693-1-jain.sm@gmail.com

 lib/parser.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/lib/parser.c b/lib/parser.c
index 62da0ac..5e3abf0 100644
--- a/lib/parser.c
+++ b/lib/parser.c
@@ -137,22 +137,19 @@ EXPORT_SYMBOL(match_token);
  */
 static int match_number(substring_t *s, int *result, int base)
 {
-	char *endp;
 	char buf[NUMBER_BUF_LEN];
 	int ret;
 	long val;
 
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
+	ret = kstrtol(buf, base, &val);
+	if (ret)
+		return ret;
+	if (val < (long)INT_MIN || val > (long)INT_MAX)
+		return -ERANGE;
+	*result = (int) val;
+	return 0;
 }
 
 /**
-- 
2.54.0 (Apple Git-157)

