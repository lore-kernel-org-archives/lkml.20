Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE573932F0
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792299201; cv=none; b=pjSwi2K1KjBh59F1gR9ogapZTkUR6RB4QWJtcWeeZISk/LK6i9m2CRHgHgQoshUwe3XP4vXcUe8EWbvhWJM+ys1mxMDQlygRewvo9AM2zniY1Ic+eWzZz1vWDcmT0LphdxUyj3T9XMglO+nY1ZF1IRAAspdYJLQL1EwoSWHBOsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792299201; c=relaxed/simple;
	bh=JdWbu+pWVZBfEQSWUKTn+Y93GeKlHqrybuRdhpHUi2w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dGFLydhwrKU7JuNphXf4FI/VZ5TKmpe5AhX25JeNrtXo4XKfpjye5hIUVhIZAlOPgaXiTTdBEgtwo5bAbJ9vdnjAaMaGqQ8IihgfpBtI2u7k0rjUdtTm8KYIRJMJ+aMKF9ew7Fm+zACuPFDsrJvVPfOTYomIn/egoOOnwNTjyn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEpoxlw3; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEpoxlw3"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35f036b17easo2014393eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792299199; x=1792903999; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vKBZrvo9gd0CUjOza/xA+iBTaDbgfOk+BsxyRzZQseg=;
        b=UEpoxlw3vsAGd5GM/nFYBaa4gXWSSBCPM8Nvv9MYg43BTlx2uJosK3/+0JaPjlyb0M
         Y0jMlAqnsx0TGO5yV5MU3/9kHmVdpyzR9dxkmrXMOyy11imVT/KMc/zVmshz3ncF5hU3
         nFiS2l2mlU9HWwpbi/e15Y8e2+McVFzsZKV6qsPd/Ji2hsLyR0WNxqrGEyrv3+/L5w+d
         7DXSzkrHPEwKy1DNVlAptQyVHWetx7YoRYsCLsW1Q7BYTvwdrBLOJ+F1Dx8owjtuDloF
         LNVVmTpZ77zyCnkBMltsZfk4N5S8hsOiZ+tFU8Yrw6nrdFvX51jyU6brqqGcCnQB1LRn
         xoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792299199; x=1792903999;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vKBZrvo9gd0CUjOza/xA+iBTaDbgfOk+BsxyRzZQseg=;
        b=2qejmnpBZHf3W+O1iY/0Y6HsmU0scTzmyIjG4zQk7J0jBeQvglfASCUOji8rqWwS5E
         50kF6UTgv60HhV2BHxSarqV0qCv7qL+CzePIQDG5qGT8duDq1b7bXZfzBo49ConsHtSj
         52/fZuFmWLRLLOKiC8It+nUNnie4oko1P84JgeGNAAZTKXKE3953WcGsGTPLDSpm0h+u
         2jw+ovWg4FroPmslVWhcaXLrhJ1NGU1voNG3JRvLf5TCD6uHfmkivVd9nI4Fi60kSz5z
         GxvfnLj/C3UFz+24JLQ4ebpgx590V/7xwCkO8EOxyVqc1gwfZY3ynVZx6PkVcrnIKdVU
         gewA==
X-Gm-Message-State: AFq9FYKpcXArt08Z5UlPcW08mqoyZAiuGbjpbkga8p/CI3zxAt10Kad+
	fd7VcwxSmxhPy8BPiWX57bnuVszV41JuFe8FMtYFyq3HswYs6f+Ngs77
X-Gm-Gg: AYBFou2ALnZEbYEKcfA5Takv+31ttsdYPi6IWv2758I05mV/MANA/fHi1R6AFteHaba
	wm1CVZplmSoFg7M+dDmNNgYhKTVUTmGTNmi7/8QwdN7l9KRBN8qydFNpD0Y9jbQS3fxVXImPxvX
	1OVqZGzQIj3/23Ut58txvSIG9LPSj2Yo5vPY+BeHVXvyjF6pSG+C47Ut4iVBP6ZPc/5zvijLE46
	Zez+w+w2mS/i0qn4B1RsfbZxTm9FtAKDGWEKC2s0WZXhiFRQlb0QYIGx2DaoPir6tR3oZ5idnhx
	OX44fVkHWWqp6ag42DuC+R2yMr4judse/qMQfqIf5P0KEh/AK0v8HCemtFSw9ZxXd/2jRD1KNlR
	6JfQJ+FOS/HDvQ6Fae7T7+eTzaIpNm5k6CsppsIfjEJhgVjlvxUJ97fje6H6RneEHrVC2KahCkC
	v/zyLDV39aUyYbIFI686C4vHbCpWgOEtvmu9fpFfzl3Vr2ldrMm2Orto+fVSqFK4arzQ==
X-Received: by 2002:a05:7300:ec97:b0:361:6dc4:d0b2 with SMTP id 5a478bee46e88-3619e54358cmr6638408eec.2.1792299198975;
        Sat, 17 Oct 2026 21:53:18 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm34983352eec.28.2026.10.17.21.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:53:18 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sun, 18 Oct 2026 12:53:14 +0800
Subject: [PATCH] string: instrument the word loads in sized_strscpy()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-bug-string-strscpy-kasan-first-byte-v1-1-375a2c46d88f@gmail.com>
X-B4-Tracking: v=1; b=H4sIALlQ1GoC/x2NywqDMBAAf0X27EIeREp/RTzEuOpSSGU3lor47
 wZPw1xmTlASJoV3c4LQj5W/uYptG0hrzAshT9XBGddZYzsc9wW1COcHmrYDP1FjxplFC45HIfQ
 +hFdI5IyfoJY2oZn/z6UfrusGph0wUnUAAAA=
To: Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Peter Collingbourne <peter@pcc.me.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 kasan-dev@googlegroups.com, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

sized_strscpy() copies a word at a time. The loads go through
read_word_at_a_time(), which checks the first byte of each word with
KASAN and KCSAN, or through load_unaligned_zeropad() on architectures
with CONFIG_DCACHE_WORD_ACCESS.

load_unaligned_zeropad() is inline assembly that the compiler does not
instrument, and it has no such check. Since sized_strscpy() switched to
it, generic and software tag-based KASAN no longer report strscpy()
reading from a freed or out-of-bounds source on x86_64, arm64 and the
other architectures that select CONFIG_DCACHE_WORD_ACCESS. On x86_64
the kasan_strings KUnit case, which expects a report when the first
source byte is out of bounds, fails as a result:

  KASAN and string KUnit suites      failures
  on x86_64, generic KASAN        before    after
  CONFIG_FORTIFY_SOURCE=n              1        0
  CONFIG_FORTIFY_SOURCE=y              1        0

Check the first byte with instrument_read() before each
load_unaligned_zeropad(), as read_word_at_a_time() does. Hardware
tag-based KASAN does not use this check, so it does not bring back the
tag check faults that load_unaligned_zeropad() avoids.

Fixes: d94c12bd97d5 ("string: Add load_unaligned_zeropad() code path to sized_strscpy()")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 lib/string.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/string.c b/lib/string.c
index a3778d5aab4af..91de344956fee 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -19,6 +19,7 @@
 #include <linux/bug.h>
 #include <linux/ctype.h>
 #include <linux/errno.h>
+#include <linux/instrumented.h>
 #include <linux/limits.h>
 #include <linux/linkage.h>
 #include <linux/minmax.h>
@@ -132,6 +133,12 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
 		unsigned long c, data;
 
 #ifdef CONFIG_DCACHE_WORD_ACCESS
+		/*
+		 * Unlike read_word_at_a_time(), load_unaligned_zeropad() is
+		 * not instrumented. Check the first byte, which must be
+		 * readable, as read_word_at_a_time() does.
+		 */
+		instrument_read(src + res, 1);
 		c = load_unaligned_zeropad(src+res);
 #else
 		c = read_word_at_a_time(src+res);

---
base-commit: 90201351a862182bdabfc1ad1c97b1e1b6ed5931
change-id: 20261016-bug-string-strscpy-kasan-first-byte-335585ce203d

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

