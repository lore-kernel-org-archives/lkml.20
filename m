Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57D04908A8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588174; cv=none; b=riwbO860gLhFD0GlRDduszPFR/8o5tCr+D0KNaa5kvU0rIb+T7GL0Av0NT2wZag34ZL7e29qXEFsRsnYZP0ENDGrZRMEgdgibv71Jn4lgYC2F6AjLhpDx9Xy1kxBMwDcSYcsUVDm3goURU6LWLGJdZ9Up+GWrkzrzJAk3VgOA2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588174; c=relaxed/simple;
	bh=tIr0qQGMz8tkxEgwyXCLC9RUmUeMrlVXDf6JB9RltTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qfjTUFv9VZkNVtSHWrG2UhjFM5PtN9t2PWaeDm58ZckMMMm2+tGPv68ltKjR1biFKfa8dWkaUpJ7FnPwgUZCo7NAE0uFaX2Z2UVjBGbdERhwcxi3+IV8dc4/PSnjRwRMELgkuX25+YzI+rvpS5q9XbgbdLh3Kuo7dripQI6oCno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOJGEYjX; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOJGEYjX"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-340f56c44b0so989374eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588171; x=1791192971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDZKF+tHXj8L0jV/brn3WQoevc8uK2OmlwAkvyezCMo=;
        b=FOJGEYjX/nE97NtrKkrSYCGsaioWx9teIx42Hvd71F1PheY9rI0usfokejPt46gew0
         W8UHNP0xBWtzjC/NRm9v3vJrHaEYBRHnlS33/oD9Pyn/GvM0x0wod2MGrpuOd1GLWK3C
         rDHUCJlYi1d1RLXRjb9VwfL/SOZuTnjxDaOAmucrcLAlS2MdaT4uNtJVbIsEGSiijBJ0
         O2NfyR3AhM31vu8D6LD83FsNlcVlQ3+RI6GUfctboVVnAlYj9+ymBroKw1g0gYXbkd7E
         jdbvST1O/+wPJ1KxXOiH56yi3xV2xAPGl1gn3E89Ol0TEdcay58rlSe9KyPZpwejkGtY
         Q/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588171; x=1791192971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GDZKF+tHXj8L0jV/brn3WQoevc8uK2OmlwAkvyezCMo=;
        b=dxcBNBEoP0OBcpC88uEJFnNnaVAuObot7MIBj+4AEL73TAsf11PFa596efgB/se0hK
         kYsd63cJuj7Rl69LnEXh7F/eKC3+ARr9SGWKpR1o3Nu0/zvzXaApyF+SIAJzBQFjtKO6
         vZEIb0cbGbTydUkMMAMJRbT0DlQ/KSok6ZkvtfYpjQMLxcTuxVONKV8DHrRhq8r29N6/
         wRkp1ruuyGmzRX8yfsM26NkPN0QFlvakxNzlYMHpHtmPZdvE5uLhxROjRllfRz8MZN8Y
         lyuk0mj3E0q4hTtwGMwqD87ODLlaz2DoCSACJC+O6OtTBSzuosI/o3VAi1CHIra+3mvo
         5fIg==
X-Forwarded-Encrypted: i=1; AKwUvBxlMbP3Vhikaye/drZ03tFTe4WC5KG3JGh1SktHE4dmjtphEI+oi56ia7o9sobheqpZDJU6g75zfrbyu7M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFkqkyfvsdHuryfXgGxuX5b9ncQW57t9oIsTkbFsbhWS2Jw17+
	lQY/3VYDLkPGVhlc521o7NLir9ZP6EoBlaPVXhQ4Sn/55Pnd3zsk1tBI
X-Gm-Gg: AYBFou2CfS0lu20QS/iOZxBC69tdJYIcYlDVtdCZ7XKvLrPtLXS33T3STWTTQjhGYUE
	GIwWVkQHjfq6ayx/yfWoVQ+M3922xhJp0GoJAGcUTdwq1cAwlSbxsCibwjmCPrQavLH5hWy/3Ty
	3FQ+Ys4GYvEo6fKNGoJ+f+F104ebQDBf2Yd1NdcXBTnfiFkxtNKiI2DiRdq3uQIXh2Acte7+n4c
	6zSLvwUC4PDWAyPwGoVWQrOMiA58DSQ7X+hGn7mfv6zMoLHixkCWzV0M1HYKlyToTz1F/7fzcfk
	rF64AJGQ17dqCvtl0pucT891bnKkgjrZMrMdOFBAWX80hch5j5hw1by6W/ropVsdk/5TPsVOKzW
	LBala0iZK/pJkwYrkA02Oo2N4drncCEAaX4Q2WbzCXFgJgCwlLA8lPNxtEEE4mtmAgCiKDAFmL0
	0w2CxDS3jx1y+cL28WIlWlIIFqojuPk9zvH6JEMdRZQFZr9Muuy+3KAXZvtC/yd44zocCsbBQ/P
	YMxgGx3PUVg42Bu+LcjhlW6aelMd9bQFzSEvYD8aPzYFPTQif7mU6sml9keE5nka98Z8woYiXLc
	XUC4ACAzQkScIMUOzqUtNflqphr67G1k1APAoTkESJLy9Z4pHRYZ2NjEF4u9SxEX7zsn4A+jUA=
	=
X-Received: by 2002:a05:693c:87d7:10b0:343:8685:d8f5 with SMTP id 5a478bee46e88-343868677bfmr7686722eec.29.1790588170569;
        Mon, 28 Sep 2026 02:36:10 -0700 (PDT)
Received: from FT6N242TWK ([223.181.116.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343539989casm19014358eec.14.2026.09.28.02.36.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 02:36:10 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Joel Granados <joel.granados@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] time/jiffies: Don't saturate usecs_to_jiffies() on a truncated limit
Date: Mon, 28 Sep 2026 15:05:59 +0530
Message-ID: <20260928093601.79224-2-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260928093601.79224-1-jain.sm@gmail.com>
References: <20260928093601.79224-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usecs_to_jiffies() and __usecs_to_jiffies() return MAX_JIFFY_OFFSET, an
effectively infinite timeout, when

	u > jiffies_to_usecs(MAX_JIFFY_OFFSET)

but jiffies_to_usecs() returns an unsigned int, so the limit is
MAX_JIFFY_OFFSET microseconds truncated to 32 bits, an arbitrary value.
With HZ=300 the out-of-line jiffies_to_usecs() also overflows 64 bits in
j * HZ_TO_USEC_NUM, and the limit ends up at 1431649098 us on 64-bit and
1431649781 us on 32-bit. Every timeout between about 23.9 and 71.6
minutes then becomes infinite: usecs_to_jiffies(2000000000) returns
MAX_JIFFY_OFFSET instead of 600000. For instance, a PIE tupdate or a
DAMOS watermark interval of 30 minutes never fires at HZ=300. With
HZ=100, 250 and 1000 the limit is 4294947296, 4294959296 and 4294965296
us, so there only the top 19999, 7999 and 1999 values are affected.

The check is not needed at all. MAX_JIFFY_OFFSET is at least 2^30 - 2
jiffies and HZ is below 12288, so UINT_MAX microseconds are far below
MAX_JIFFY_OFFSET jiffies for every supported HZ. Drop it, update the
kernel-doc, and add a static_assert() for the assumption.

The bogus limit was also hiding a wrap: when HZ divides USEC_PER_SEC,
_usecs_to_jiffies() rounds up with (u + USEC_PER_SEC / HZ - 1) in
unsigned int, which wraps for u close to UINT_MAX (usecs_to_jiffies(
UINT_MAX) would become 0 at HZ=100). Round up with a remainder test
instead. The reciprocal multiplication used for the other HZ values is
done in 64 bits and does not wrap for any 32-bit input.

Values above the old limit, including UINT_MAX, now give a finite
timeout (at most about 71.6 minutes) with every HZ. No caller uses
UINT_MAX as an "infinite" marker; the callers that clamp to UINT_MAX or
range-check the result (TCP_RTO_MIN_US, TCP_DELACK_MAX_US) keep working.

When HZ does not divide USEC_PER_SEC, jiffies_to_usecs() is out of line,
so the check also defeated the constant folding: every
usecs_to_jiffies(<constant>) compiled to a call to jiffies_to_usecs()
and a compare. Those now fold to a constant.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
Checked in userspace over all 2^32 inputs, with the current code and
the code from this patch both extracted verbatim from the tree and
built with the generated timeconst.h, for every Kconfig HZ value (24,
32, 48, 64, 100, 128, 200, 250, 256, 300, 500, 1000, 1024, 1200),
32- and 64-bit. The KUnit test in patch 3 fails without this patch on
UML x86_64 (HZ=100) and on qemu x86_64 and i386 with HZ=300, and passes
with it. Prepared with Claude Code (Anthropic), model Claude Opus 5.5
(claude-opus-5-5).

 include/linux/jiffies.h | 22 ++++++++--------------
 kernel/time/time.c      | 10 +++++++---
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/include/linux/jiffies.h b/include/linux/jiffies.h
index bbd57061802c..d3f2663e4435 100644
--- a/include/linux/jiffies.h
+++ b/include/linux/jiffies.h
@@ -575,7 +575,8 @@ extern unsigned long __usecs_to_jiffies(const unsigned int u);
 #if !(USEC_PER_SEC % HZ)
 static inline unsigned long _usecs_to_jiffies(const unsigned int u)
 {
-	return (u + (USEC_PER_SEC / HZ) - 1) / (USEC_PER_SEC / HZ);
+	/* Round up without overflowing for u close to UINT_MAX */
+	return u / (USEC_PER_SEC / HZ) + !!(u % (USEC_PER_SEC / HZ));
 }
 #else
 static inline unsigned long _usecs_to_jiffies(const unsigned int u)
@@ -589,14 +590,10 @@ static inline unsigned long _usecs_to_jiffies(const unsigned int u)
  * usecs_to_jiffies: - convert microseconds to jiffies
  * @u:	time in microseconds
  *
- * conversion is done as follows:
- *
- * - 'too large' values [that would result in larger than
- *   MAX_JIFFY_OFFSET values] mean 'infinite timeout' too.
- *
- * - all other values are converted to jiffies by either multiplying
- *   the input value by a factor or dividing it with a factor and
- *   handling any 32-bit overflows as for msecs_to_jiffies.
+ * conversion is done by either multiplying the input value by a factor
+ * or dividing it with a factor, rounding up. Any unsigned int number of
+ * microseconds is far below MAX_JIFFY_OFFSET jiffies for every supported
+ * HZ, so, unlike msecs_to_jiffies(), there is no 'infinite timeout' case.
  *
  * usecs_to_jiffies() checks for the passed in value being a constant
  * via __builtin_constant_p() allowing gcc to eliminate most of the
@@ -611,13 +608,10 @@ static inline unsigned long _usecs_to_jiffies(const unsigned int u)
  */
 static __always_inline unsigned long usecs_to_jiffies(const unsigned int u)
 {
-	if (__builtin_constant_p(u)) {
-		if (u > jiffies_to_usecs(MAX_JIFFY_OFFSET))
-			return MAX_JIFFY_OFFSET;
+	if (__builtin_constant_p(u))
 		return _usecs_to_jiffies(u);
-	} else {
+	else
 		return __usecs_to_jiffies(u);
-	}
 }
 
 extern unsigned long timespec64_to_jiffies(const struct timespec64 *value);
diff --git a/kernel/time/time.c b/kernel/time/time.c
index 079ab34f61db..470195e88ca0 100644
--- a/kernel/time/time.c
+++ b/kernel/time/time.c
@@ -591,16 +591,20 @@ unsigned long __msecs_to_jiffies(const unsigned int m)
 }
 EXPORT_SYMBOL(__msecs_to_jiffies);
 
+/*
+ * UINT_MAX microseconds are far less than MAX_JIFFY_OFFSET jiffies for every
+ * supported HZ, so usecs_to_jiffies() never needs to saturate.
+ */
+static_assert((u64)UINT_MAX * HZ / USEC_PER_SEC < MAX_JIFFY_OFFSET);
+
 /**
  * __usecs_to_jiffies: - convert microseconds to jiffies
- * @u:	time in milliseconds
+ * @u:	time in microseconds
  *
  * Return: jiffies value
  */
 unsigned long __usecs_to_jiffies(const unsigned int u)
 {
-	if (u > jiffies_to_usecs(MAX_JIFFY_OFFSET))
-		return MAX_JIFFY_OFFSET;
 	return _usecs_to_jiffies(u);
 }
 EXPORT_SYMBOL(__usecs_to_jiffies);
-- 
2.43.0

