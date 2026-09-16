Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8BC1E9B37
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525994; cv=none; b=k5mVmdN04uYutSVBXrsNa+ZV8+dwZ9cbvvu4SGFIwJT2z5jDNK6yYNVSj0BsIopNiU/Ka3QA7iwErvyQO6oP0Z8v9zeONRhVSzQXUxHvR3+D8tlHCil1OAihprI1XSaGswN9eYfn71lDoLv5A6dPKM3aCJrGI2+qlxhCI0KS/8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525994; c=relaxed/simple;
	bh=GQbBa6CHnNfUb9DKjXxRdQQLXR1WhYhhE4Qswr/Ui+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYuGrcj0v9y3CzF1f/uD9zzwwEUW2Q8/PQZT0P8uwOZh8b8+0WgYoV4D75ktcekjv7Imr4busQYsEZbQPkgCleg1wGb+T4b8Ce0ZrKwxbH9GvI6JZQ61QvBAQgd3kXw+AJS2uqoUQ6GP42E3nTnWWgbKyvlZ+eGz2d5fpU2QrfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAf6Bz1n; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sAf6Bz1n"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86dd69a1b15so96651b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789525986; x=1790130786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xza0m8WSgHtBFmr77jh/0SIGm5QzN/lBTrXqXqcFKCY=;
        b=sAf6Bz1n9fg7IovQQ4DpS1KmMTzJyOJRDOepKys7rHh0eAPAVmxULsMimoaNQ+5Y5V
         FJ5xD95oHqbb+zV5u8GO3YVS+6vT1Zy+H2TB/K76X+6goCXraoJvt7QJvFOVazlYIb01
         7GsbAxdSz2zKM8Lc3peqxXIcIfp9b/9hROU+A6m8FbQl5DgxKyEgPnTiNR+UZrlk/lbO
         3+4/jrufCTUFxhc+Iufmy34af+smlWzk/Oa3FH2LZJXwVU0z+5aDJlvPhm9jB/1iPqmg
         OGCpIYZDcgVrUccYNUjPPmzONc1gIQ76K5OuX1fXudZdhVv4HQ3U8TW8M85Ec4tZaAhP
         jg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525986; x=1790130786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xza0m8WSgHtBFmr77jh/0SIGm5QzN/lBTrXqXqcFKCY=;
        b=DS2htlbH/60dvAIgaoI546bWIasbunLHtPdB65lECYyZrz5WsLX2aYrFcbM7VLpn0q
         nJH1+FVxeFxCF8AZ5UduDbxY/B9kGz4jyNTmv6sXLP8kgxTh2jh35ImA9BHTdf8wjXNL
         CnUrMSCsSy+1rUE4QxDHRGv3RRnGwhxuG9rX8LmiKUtxqWS902U6aQS3PZmfqpDW+6IE
         kGQU3BG6v6a2B6RI2X8LOnGZj1+YS7en6UWGbZj8pgGqBFj9J2KHoSbtw5svz/CQGaAS
         pPc2dGwiLNuikdsjN0xL0iFfd0eUZvcIGPfFrhz/b3ixHBul5Og/Z9aC+fhTJnypRDuG
         uWpw==
X-Forwarded-Encrypted: i=1; AKwUvBx0DqKZPOKnLeQk6CKmEQyOYU1uoBPtfcb+FTGSUrgWjDX/YnBf7xs70/StEjhMX/R0G6zqJYUU3HvFRyU=@vger.kernel.org
X-Gm-Message-State: AFuF++kqvi1HQpxmpMOdy9ZU/LgV6LIrIG3a5A3awRLepw+B5JU6uh8k
	/syC5bGdDFlHcGENl1LQ6Ww5Q1FaUZ+3aTexJe6Go/UBBOhkCs5UN7K1
X-Gm-Gg: AYBFou0WLv132ivQqSjCJY/w8LC78v5kpBKGosAHvBE8pdGC8tRjsImhZH/UuG3agPt
	0l9wdFyhfasa5M695gZc5BExWtI6mtX+ztWCxpW4IrphcJSfOo6LjuNS8Q0dY6/5oyuCaMFP1xV
	1C3gOi3eKwVvWMKQgaW4T9k0vyCx+3YC2mkr4FjwbFO28L0oBdHuPAq5p1abkF5ev/KMFBTOrTg
	c3DDv3IYs5FBfyko+UNqzBvJbXDBa2EL63Iiu+3ygwmbFnoVsOfHu4Sx2OOga6mTM5W+inGgqt/
	kitS46gUZRLhlWE3IKk1JAqvJZ6gQpOL16kSJiGIdsu8qDQVKmTYw414MSc0qLWzJVRcRL4BY4K
	yaDoTmtjlfNnjhOoST171b0Cel1mL2aqvuz0eONlhRwI9MJKBfHe3i6LHMragbSC3BVgykIs8/V
	ftM6GtgSPqgtV8E0KElJ1+3MNhZ2EIFiGaLvRmJVS4GpKAiJ4D7/Ry6FAuVoCC2Hm5Lw/wY+xvS
	/cIR/HFdXrE
X-Received: by 2002:a05:6a00:1308:b0:869:86ae:e94f with SMTP id d2e1a72fcca58-87232a6fe6amr942116b3a.4.1789525986447;
        Tue, 15 Sep 2026 19:33:06 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720123e374sm381370b3a.24.2026.09.15.19.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:33:05 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	thomas.weissschuh@linutronix.de
Cc: luto@kernel.org,
	vincenzo.frascino@arm.com,
	david.laight.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v5 1/4] vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()
Date: Wed, 16 Sep 2026 10:32:49 +0800
Message-ID: <20260916023252.418473-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916023252.418473-1-zhanxusheng@xiaomi.com>
References: <20260916023252.418473-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__iter_div_u64_rem() divides by repeated subtraction, because its callers
only ever produce a small quotient.  A barrier inside the subtraction loop
keeps the compiler from replacing the loop with a division:

	asm("" : "+rm"(dividend));

The "rm" constraint permits a memory operand.  clang picks it and spills
the dividend inside the loop, at 32-bit and 64-bit alike.  The helper sits
on the clock_gettime() fast path through vdso_set_timespec(), so the spill
is not free: with clang 18 the x86 vDSO is 64 bytes larger in vdso64 text
and 112 bytes larger in vdso32 text than with a register-only barrier.

Use OPTIMIZER_HIDE_VAR(), which is the register-only form of the same
barrier and the form the rest of the kernel uses.  gcc 13 generates
identical code either way, and neither compiler turns the loop into a
division at either width.

Put the function signature on one line while touching it, and reformat the
comment, which described the asm() that is now gone.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/vdso/math64.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index 22ae212f8b28..c628d6cf447c 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -2,15 +2,16 @@
 #ifndef __VDSO_MATH64_H
 #define __VDSO_MATH64_H
 
-static __always_inline u32
-__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
+static __always_inline u32 __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
 {
 	u32 ret = 0;
 
 	while (dividend >= divisor) {
-		/* The following asm() prevents the compiler from
-		   optimising this loop into a modulo operation.  */
-		asm("" : "+rm"(dividend));
+		/*
+		 * Prevent the compiler from optimising this loop into a
+		 * modulo operation.
+		 */
+		OPTIMIZER_HIDE_VAR(dividend);
 
 		dividend -= divisor;
 		ret++;
-- 
2.43.0

