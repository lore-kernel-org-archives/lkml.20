Received: from mail-pj2-f37.google.com (mail-pj2-f37.google.com [74.125.227.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7244D37CD40
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783128; cv=none; b=Pz4POIR5CQBQwOquTQaB6vFE1vc57JinySFvMy3vEFnkzbgfXyPKg5RUmunwt5YUQu12zZa9VqB2WmhhwPV9kJstMaNuIIruzC+4RR3dqSI8LL9FNQvKMn/5Y+irbRAGrDaOkdkg2rJ2BDCWgRM1o6QqAx8dAh74/7H7MTuCunY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783128; c=relaxed/simple;
	bh=A4/1ri5HuIDttueCUT0PCIq2gr18ZPmxmc1yUhOG+m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RYX0/0dwJJmyWa40AVtoU29QYFcncwIXsyPwThYKMW5PWdIajvRK5PO6hEuSpRZruUyxHcZif2nD2axkr525DCG2IM6mGSrlju3uuIpiiN6aT1MyRIChl9PgUSCiXF1sqY6pObcxTme8CB1OaVi+9T0zBYo1salB8ZjBuh2vZpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/5jrTWf; arc=none smtp.client-ip=74.125.227.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/5jrTWf"
Received: by mail-pj2-f37.google.com with SMTP id 98e67ed59e1d1-3a4eda6744bso244487a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790783120; x=1791387920; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hy/ujTz3CUWmNrrscj1BmpB2cqE+O9iKHNdWqpEvyjc=;
        b=J/5jrTWfGcgW/oNEn4ypCYrb3FdYzAQ49VU54S38/wB8xVxjVGE8H7rHUCjOeqCu9O
         pDxJq8VSwEJYSzodnuv+obAvwtMbDpAZgkSgd72sFVGzTCgSCUmnzdUCa7rtedXF3/8Y
         HYWGbHyPj9Z+rMOGTP2yU46pUQl7e0F9FLMpomE5gYrGojDHH8x2sW4ZoF1xcQvHTyzH
         Nn/hk0EfcvnPMieTlEYIRtkdIJxLg0CYBKDxoF2pqK95Kqfdy5dTg0RabZuE0eamKWvp
         T/u+ubOJpcYgyb9c6dLUvAdNXp7quQA8pG/or4acI6FPzZiUQ53Kzh8tVsY7EGpN+cxk
         AX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783120; x=1791387920;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy/ujTz3CUWmNrrscj1BmpB2cqE+O9iKHNdWqpEvyjc=;
        b=oDXm99JQCjVE3jyRkVEsJQUqtNSxVNAEh0DRCvgtcRwn/t5E0pSPs1c8x/EOXeuZUu
         2RHkuEc9GUoF5UdCUHwkoyAZHV++hTN6LkX9mL2aCq6M3oEID5KFAAZdTWgzgqx6IXsD
         4tWHLSGtETsM7pDGcrxrfHsPC4EgQuzH/aW/Rm+mMQm49Td6bqlyYFhTPCS7Bx7JzGMR
         RzE/J1GfR+xaNcNyLFUuWxSxDAqGLG4NgBg+A283I23mdADUAzh3jdMxen/Zcy8hM4EU
         8XE3vGcjnJ+a85gOOICjm5rQCga+jG7TlsGFk0L9yNahC2o5BFIRSooPf8WmeDvlP1Ta
         DNuA==
X-Forwarded-Encrypted: i=1; AKwUvBz3fftrVyYjgYWyApQPBLMOKRp5sLQT0HB5OUF8XMgP175rDyw1Zs5wDrAQFFa1EdBwZHUWpxS4olOdF/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBBsjW4ZmkXEjY1TuDMr/Znt3eXV1TOHW6X7CnvLQqwTtb/q/C
	nJVCNTr7xYa1RsWjoZ2o+esaMfiKgDOCw1bgyOMTQwPpMbFT+kkuIzDP5BA12A==
X-Gm-Gg: AYBFou3+OTEBFSjxJBbBX16kH+OARVNDiNkEXjZH/SqaOr3wjCUWFNOvS/zrwGkvTqC
	MLm/D2TWnO+j28qjAVWxRSHHRQ8vvx5puO3dzH8oj5/HGkW4qdkTsGFzVetif34bHVKSwc38GqI
	P1jJjg52CEFsW6X5B/UR50+UN/vPk62nfNcbT0RiNNRqiX4a5cWz5Sp3PM0sdywJcFen1vC/qkU
	63HuizG521lGEZsuGcEF0rz9IMOvWNoUnSPjDv8JvOocGrCjOPrzkH1Hy8ws/qwmnkh33496K6Q
	BUAmFZTsiVmmwuLThiYBIF2NbdxJEe2ROvEF40toFtqTbKK+VZKcGykLKG+RLkFsAqRBSc22ODT
	LNp3XARSmGuMGArqGPSEhLBF5Mrjmh/SZqVovK4Cr311cprFA/w3wG6p4rdBKuZFgbQRFj0biC6
	+p7GXEy7aNc9DNM378NMlUtl/WLp0O8dYH8otbkp0xzMu+vd4R3ZuQ8/v19Cdzd22wHHSpVlYQN
	FafXQoXjbw=
X-Received: by 2002:a17:90a:fc47:b0:39e:6c69:f47c with SMTP id 98e67ed59e1d1-3a4d18ef78cmr1574572a91.59.1790783120019;
        Wed, 30 Sep 2026 08:45:20 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e587d178sm10313265ad.1.2026.09.30.08.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:45:19 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v6 3/5] vdso/vsyscall: Keep the CLOCK_AUX base scaled
Date: Wed, 30 Sep 2026 23:44:58 +0800
Message-ID: <20260930154500.722828-4-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930154500.722828-1-zhanxusheng@xiaomi.com>
References: <20260930154500.722828-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The vDSO basetime of a clock is stored in the scaled nanoseconds of
tkr_mono, so that the reader can floor the base and the cycle delta
together in vdso_calc_ns().

vdso_time_update_aux() instead shifts the base down to nanoseconds, adds
the offset, and shifts it back up, which zeroes the fractional nanoseconds
of xtime_nsec.  The reader then floors the base and the delta separately:

  ktime_get_aux():  base + ((delta * mult + xtime_nsec) >> shift)
  vdso:             base + (xtime_nsec >> shift)
                         + ((delta * mult) >> shift)

Since floor(a) + floor(b) <= floor(a + b), the vDSO reports 0 or 1 ns
below the syscall for the same clock.  It is not a monotonicity problem:
across an update the step is floor(a + d) - floor(a) - floor(d), which is
0 or 1, never negative.

Add the offset in scaled nanoseconds as the other high resolution clocks
do, and normalise with __iter_div64_u64_rem() so that the stored base
stays below one second and the userspace fast-path does not iterate more
in __iter_div_u64_rem().

Only the sub-second field changes.  (a + (b << shift)) >> shift is exactly
(a >> shift) + b, so the seconds carried out of the normalisation are the
same as before; what the old form dropped was the low shift bits of the
remainder.

monotonic_to_aux.tv_nsec is a normalised timespec64 fraction, so it stays
below NSEC_PER_SEC even for a negative offset, and the sum stays below
2 * (NSEC_PER_SEC << shift).  The largest shift clocks_calc_mult_shift()
can pick is 32, which makes that 8.6e18 against a u64 limit of 1.8e19.

Fixes: 380b84e168e5 ("vdso/vsyscall: Update auxiliary clock data in the datapage")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 kernel/time/vsyscall.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index f43dd3f4744b..0e4b499328c0 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -155,11 +155,11 @@ void vdso_time_update_aux(struct timekeeper *tk)
 
 		vdso_ts->sec = tk->xtime_sec + tk->monotonic_to_aux.tv_sec;
 
-		nsec = tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
-		nsec += tk->monotonic_to_aux.tv_nsec;
-		vdso_ts->sec += __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
-		nsec = nsec << tk->tkr_mono.shift;
-		vdso_ts->nsec = nsec;
+		nsec = tk->tkr_mono.xtime_nsec;
+		nsec += (u64)tk->monotonic_to_aux.tv_nsec << tk->tkr_mono.shift;
+		vdso_ts->sec += __iter_div64_u64_rem(nsec,
+						     (u64)NSEC_PER_SEC << tk->tkr_mono.shift,
+						     &vdso_ts->nsec);
 	}
 
 	__arch_update_vdso_clock(vc);
-- 
2.43.0

