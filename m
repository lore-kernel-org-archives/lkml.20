Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580718;
	b=kHULDoEE9gQ0NvwPt21d8a/R5v2CQi66grZhd7lV2VrsrgCRS/Hwz70cy1j86gwzTDOz
	 0wML/J1Qpyl9Wb1p2tkkpioHaebG0p7rVCIp+pmI7fE7pybj1SNnFLJRaVb2C+qAqLLfX
	 iwAMMQa4RpNb2iizSWiiK1qwMjbGL8HRfaI+NdxbibjvQGMcmV2GsruCnclrK/fGoJwmL
	 EDGBlf6bmDVb3AGNwDU0yCoEECucAUF0pczdkEqq3j2gMszI94eZG6Z1rid7NqfJLQ5S9
	 ExxvQlsC1TTLuKsPACrBO1fZkKH8TU3/+mhhG1I4OsBCYebcmobQMg4mWPUdxg4J8YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tD1P6BYH+TZyZF390atjXANoQij02Bx3ASCtdtlPU2c=;
	b=JUT/4wekB1pOO26gr5zUHkKnmbdg+niFz9yxbLtM6K6M3WTplO7EvtnXClUHTrzvtgpj
	 yPGRbbZdLPG2X6rVVZnvmwFrsoX0lA/WBOzz1iLXR3gLLTQCM1f3F52/rvw105DeiqQwP
	 EwPW2gQTseDTEPFPJIzUsAh/G5mDKg8FGG22J8+tEyS6SVQbexY95OKHlLHhdbuJq5/LU
	 EJW7u6GUPhBAFq5pB89RqFcEm7uMphj/OEWHEb1P4a+xsdfT2G3nqz4YZ7ovQ++zsUDjA
	 MlTRfgnU14PnbTcqGzaU3R6XgYM8IDe5XTvhlktNmjyVxKT2RIj5/nY6w87hvq6LPYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hc1V6YFq;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B205606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B205606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hc1V6YFq
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso7294985e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794580717; x=1795185517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tD1P6BYH+TZyZF390atjXANoQij02Bx3ASCtdtlPU2c=;
        b=hc1V6YFqc0E2GjlIHotz+dPjmEyzIybeOi6pAmbmYbCqjmufyXXI4w7cC+a6Q0pJDQ
         rYlBXWWJtOnO67hDf0fQPK6VNvAUm0ihgXjdBB6RKebHlV8HMo+KJskjQw5bXGiPFMkY
         +Tb3Kt0N/SDasJmHwWvZDdnvZKrIoXuJkpsi8JV5HFgstFgG3gwFqpoEiAAeS2aZaGYI
         BnTCrhoe0XGVhMllDGFvEcKM7FSxWCS2dL/9fJRuOe797tL+ue/ABoviDwRCcfj78ZIt
         8Jw2YOmhCwRomBfrds5fmPv1GrENGLidH0ADhsjDZL4YezwqqSQctZOzmcgdHU8WJ6GN
         pi/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580717; x=1795185517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tD1P6BYH+TZyZF390atjXANoQij02Bx3ASCtdtlPU2c=;
        b=ItZbTgZyYCksLxR3LW3DI6a/ud3c6shbGFZLf9qEhr06BGrK/1LqaFMYvLL6XtCFJR
         iwO8BhOQk8pKPzlN6CtiHfM1fU9wVYP14kKgOnBF+doA5dEzoOW9tTY9FFIdGiCHAAqg
         QKE4cWHEwbteJhvnlB0x1AYGvLUXMx7mo/nzJHikiwJH5CLwu1o3bBG41yt0D7EVbalx
         G0lzS89cgwMUnlc9nNyz2OPBae8oHS1GfYQji1VyJsWZCTorxOEXWZ+3jE039bgU/yrw
         EUJXfXlUM0jRjpL1viCFacSrkjCg8yaBuFY6IIFHeY+SyFX71sq4LI58Muh67TUMfvO+
         sp2Q==
X-Forwarded-Encrypted: i=1; AL+hErF56Hct0ny/W06LmKGDcWkzy+zzf0tRfQAzx9pq4bS3A/bEK12AGHy1gW/JizzcxaKJZw3p7wHNST4GMyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cXvYlu4xRi9VdtY4VUl0VW7T40cvpMDnvnEFozJ6GHBy3PRBU
	NsZXf1j5jZU41MEo3hDYz/AwkxCRTEO3RZCsqFtrbEJlmA0fZK593jYt
X-Gm-Gg: AYBFou3XZbyr6zDJHQTKVuNodDxeWr9IaHAHFKMkNXiLfTYs96hTF5osG9yjmbYruWA
	t3LkbrehW0cg5zjoO5FS55edflHMD1H/oXGgkO9YQi5+o7hlxo7zKI/rOVaqMWhkvsAs98FHpm+
	1MKYilh1+cop+i2JpAdlrHSRUg31kFbpAKT0nFVv7/EECSWqgXB0WHkM7h7ZlJCEnKOiykjxEkz
	zEJ/CE8/Ijo/tLM2DSEcIVRP5vAErGrzHSBTlmCEFk7bTpr9kFC8qRzHvSRfbIZ0NctbyurBduF
	fHGIT2maslgFEj6QeMJqzHf+Vrqpu5iSXGFfjTNkPaxPMX882Cxko86pVl1fDQsmpEyjrM6SVyH
	+O6MEnOl9/EWHW1A5GJubpI9BFZhOs0DetcFHTh3jFYrO1mCkmdffMfBDvrG2Ol7DPYpUt2Rp3A
	O1jmjB1OeW+Cz6wvDQdZe0nF9loK9NE1qiFORSXdyGgp2E4yaVsbJz7pqmEIKd8dTSR+Vak+GRV
	6L7ELdBsZRDpRxADrfc4ZfHsHUHxZd2xAiWP5NmWIYDt0wGsrpk/Nh8JqyyTmjq+Smsw8mIKUwT
	fw74P4gu0VA3/EGtnonCQjbOmqIWF+Pvda70ZWkG9EvRXD4nmLsHxWKieFQlAXAFkxObB4El+tj
	q17YWVzo=
X-Received: by 2002:a05:6000:4555:b0:492:820d:1e with SMTP id ffacd0b85a97d-49c73259d2cmr3894871f8f.11.1794580716427;
        Fri, 13 Nov 2026 06:38:36 -0800 (PST)
Received: from beelink0 (host86-181-68-246.range86-181.btcentralplus.com. [86.181.68.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm6246854f8f.45.2026.11.13.06.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:38:36 -0800 (PST)
From: Graeme Harker <graeme.harker@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Graeme Harker <graeme.harker@gmail.com>
Subject: [PATCH] m68k: delay: Fix rounding of short udelay() and ndelay()
Date: Fri, 13 Nov 2026 14:38:32 +0000
Message-ID: <20261113143832.168233-1-graeme.harker@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__xdelay() takes the high word of xloops * loops_per_jiffy and only then
multiplies by HZ, so the loop count is truncated to a multiple of HZ.
On a 16 MHz 68030 (loops_per_jiffy 17792, HZ 100) every udelay() below
57 us becomes __delay(0): measured on such a machine, udelay(10),
udelay(20) and udelay(50) all take the same 8 us, the call overhead,
and udelay(100) takes 67 us.

Multiply by loops per second instead and keep the high word, which
truncates by less than one loop; __delay() runs one more loop than it
is given, so the delay is never short.  As on x86, a factor of 4 is
moved from loops per second to xloops, so that the product
loops_per_jiffy * HZ only overflows above 2**34 loops per second
(34000 BogoMIPS).

ndelay() works out loops per microsecond from loops_per_jiffy rounded
down to a multiple of 2048, which on this CPU is 1 instead of 1.78.
With a 64-bit multiply available, use __xdelay() as udelay() does,
with 5 (2**32 / 10**9 rounded up) as on x86.  The CPU_HAS_NO_MULDIV64
variants are unchanged.

Measured on the 68030 (1 s of each, timed by jiffies, interrupts on),
time per call before -> after:

  udelay(10)     8.0 us ->   18.2 us
  udelay(20)     8.0 us ->   29.0 us
  udelay(50)     8.5 us ->   61.5 us
  udelay(100)   67   us ->  114   us
  udelay(1000) 1020  us -> 1070   us
  ndelay(400)    1.8 us ->    7.9 us

About 8 us of each is the call and the 64-bit multiply on this CPU.
ndelay() now pays for that multiply too, so very short ndelay()s cost
more; they are no longer short when loops_per_jiffy is small.

Signed-off-by: Graeme Harker <graeme.harker@gmail.com>
Assisted-by: Claude:claude-opus-5.5
Assisted-by: Claude:claude-fable-5.2
---
The 68030 is a homebrew board whose support is not upstream.  The
timings above were taken on v7.3-rc1 with the multiply written as
xloops * (loops_per_jiffy * HZ).  The form sent here, with the factor
of 4 moved to xloops, gives the same loop count whenever neither
product overflows (compared on the host for loops_per_jiffy from 16896
to 170000000 and every delay the table uses); it has been booted under
QEMU (virt, 770 BogoMIPS) but the table has not been re-measured with
it.

Without the factor of 4 the product would overflow above 8590
BogoMIPS, which a fast QEMU host is within reach of; the old code had
no such limit in practice.

Build-tested on m68k master (v7.4-rc2) with multi_defconfig,
sun3_defconfig, virt_defconfig and m5208evb_defconfig (the
CPU_HAS_NO_MULDIV64 side).

 arch/m68k/include/asm/delay.h | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/delay.h b/arch/m68k/include/asm/delay.h
index 751712f8beea..2d6b18a23f4e 100644
--- a/arch/m68k/include/asm/delay.h
+++ b/arch/m68k/include/asm/delay.h
@@ -57,14 +57,24 @@ extern void __bad_udelay(void);
 
 #else
 
+/*
+ * xloops is the delay in units of 2**-32 s.  Multiply by loops per second
+ * and keep the high word, so the result is truncated by less than one loop;
+ * __delay() runs one more loop than asked, so the delay is never short.
+ * Scaling by loops_per_jiffy first and by HZ afterwards would truncate in
+ * steps of HZ loops, turning any delay below HZ loops into __delay(0).
+ *
+ * As on x86, a factor of 4 is moved from loops per second to xloops, so
+ * that loops_per_jiffy * HZ may be up to 2**34.
+ */
 static inline void __xdelay(unsigned long xloops)
 {
 	unsigned long tmp;
 
 	__asm__ ("mulul %2,%0:%1"
 		: "=d" (xloops), "=d" (tmp)
-		: "d" (xloops), "1" (loops_per_jiffy));
-	__delay(xloops * HZ);
+		: "d" (xloops * 4), "1" (loops_per_jiffy * (HZ / 4)));
+	__delay(xloops);
 }
 
 /*
@@ -113,6 +123,7 @@ static inline void __udelay(unsigned long usecs)
  */
 #define	HZSCALE		(268435456 / (1000000 / HZ))
 
+#ifdef CONFIG_CPU_HAS_NO_MULDIV64
 static inline void ndelay(unsigned long nsec)
 {
 	__delay(DIV_ROUND_UP(nsec *
@@ -120,6 +131,17 @@ static inline void ndelay(unsigned long nsec)
 			       (loops_per_jiffy >> 11)) >> 6),
 			     1000));
 }
+#else
+/*
+ * The shifts above round loops_per_jiffy down to a multiple of 2048, which
+ * on a slow CPU loses most of it.  With a 64-bit multiply, use __xdelay():
+ * 5 is 2**32 / 10**9 rounded up, as on x86.
+ */
+static inline void ndelay(unsigned long nsec)
+{
+	__xdelay(nsec * 5);
+}
+#endif
 #define ndelay(n) ndelay(n)
 
 #endif /* defined(_M68K_DELAY_H) */

base-commit: 8c9ddebb300c719362a52a2d465f44e7d055778d
prerequisite-patch-id: d8f836f1e047af08e6fff01d411b44e442086214
-- 
2.53.0

