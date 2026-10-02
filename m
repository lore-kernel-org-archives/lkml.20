Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC8D4E1C9A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955094; cv=none; b=J+CBW1QDvuHvro5fA+BYeszA69hw/uDcPFXETtriBEicub1pXkwJTZ+KF+ZCLpiM5hRD5/eqk/kWau+yMWekE4h16TpDO7yM4Wv06/as8RSbURn18+7IS1gWgpg0TQuYvKTGTiJFLmFy5RHvnBWhaRPqMiGkPLtgWYZOLzdsfqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955094; c=relaxed/simple;
	bh=A4/1ri5HuIDttueCUT0PCIq2gr18ZPmxmc1yUhOG+m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GSGSiHPxSTmu0YPeH+XBJP86RqFIe9VpVlm7rpiVz5fPx3VKS8MLDxzs5zcql24QO5MmtP++99QMzxtCgWTR6W61JGRXrFSwaX2plfQEzuIhCO4u8oYR9+BXXLmKFvhK8SrthnZyVccClkFz1X/g6YJ+c7cGtJ0DxyzrRj0+DNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsiuY6Z7; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsiuY6Z7"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so36757a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790955092; x=1791559892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hy/ujTz3CUWmNrrscj1BmpB2cqE+O9iKHNdWqpEvyjc=;
        b=KsiuY6Z7LgQ/IhaU8lK6jJYYYIR7vG4ISvwIyj9DVGUMMCOYNsJ2Z3oBLvoy05J3aC
         aHke+YJgLNmh7UorwM53IaHY9cj/4MyYy6nuJtnunA81SnkAsVacdAH9RMph6fXJecKw
         Tfszwa2a/9EfLHJrQn5TOK6QdmRneCE2IjGzlfS1H9/vZ5Vryom9IwiaIp5owx1WfI5E
         p4UNLgAPm55JQ6xOFgRSpDb1NM8B6O66w90UbiXFb9mGGWvhxlnWBYNHgBhgZuS1GQv9
         Yg7qSL5WXRWqgcexqXsqBV4rkVcOgSJxgAKr2hHL/yKWXS5RFadqiS9DFVF7ZrUm7dEQ
         PBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955092; x=1791559892;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy/ujTz3CUWmNrrscj1BmpB2cqE+O9iKHNdWqpEvyjc=;
        b=G/6uGwcRe2JV1/6icuhGjvEq75GX9eSS6xAx+Ep3BVPNIqbjGp//L85DetasuChmPP
         s1EBKgvRIbu3eD9WEZ1NCIXdYoogRKTPjRwANwN81Nx4U6rvr1AjSDJQhroR6Uh5z96f
         VB8m7JxU1uGHh7NkdlnVWQJIu4C6bZwRpnX1IYwLKXIwUzcn9fsPxZ4tMLQbdb/MghlT
         ZeQFFptobqE0SqxzJuHuxbAiScnkIj8aaKSB4r3j9EOOmmGKzOI01aubf7rIwzZLjXDW
         4wqXNlheCmPbgADNYglVa5ZEahr6zdP7L17zvuGmjpIKNi+1M2Qr7jfk4YD4lVU+iiZl
         aLIQ==
X-Forwarded-Encrypted: i=1; AKwUvByjnuJkEvWUFeVCwohC2DN7lptQWSplFXjXCrsd4HQauYSfO/QKZkJMkyIwSCIVI9X7l8kKNKWMK9w+ANE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC8O/ONOPqIlIQck++lPzSTDB/DM9UdiEsq79ny7mQCqMq7bDJ
	AudTbUNNvCKQswyB1dqHZAIS5xPBZvJm1zqm8GIFGKTOiWgyc+MOWBRg
X-Gm-Gg: AYBFou1OrXdVHhvFgexNhcamXSGeH4N82MM5N72hmXAf6OtVlCpKpTv5bBS4v0/BVWQ
	qr5euPwn/V7DXpH+idbU1bGXTwO0ujuJPdzXx18gT49Y5/aHFL3HZdQArWwoLAFrpLGblHCk6kO
	mK26I3BVBDms9hT5oMZIkmMCvFJIZhmPwu16q4slk84A7eoFObf6u9g7GBGp1GN3HGQOKczLxA+
	pDDPwd2AqijteJN3YO30FWPzeXXd/gPg6IxB8G/IV58FeKTLmfA6kEIvcMCiloVYm6p03e7lPy7
	Pyp/jfToLKFmoT29aIFBQmAvv8ioxJle/nysixnxjMlJTxAODuuuFMnJdMHGEuuuwf6l6DXw54q
	wFEKolbSbPh8WXmjtTkOy9D57caIMDyrigZMPWp5b3Bt4zMYT74eM4sLV5hdZcTzCLt+iZ3ecBO
	rL+JgLoK4A48txforpfnkoADOd0VYevvJGt4J6TQ+EP9hqhGMH7DqP4TpJgFFrFz7060R0N67U6
	C+gypMGMUs/xhkNzQ+Dwg==
X-Received: by 2002:a17:90b:2e46:b0:3a7:1da:2be9 with SMTP id 98e67ed59e1d1-3a701da2d25mr794828a91.1.1790955091897;
        Fri, 02 Oct 2026 08:31:31 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6fc716b5esm1649468a91.14.2026.10.02.08.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:31:31 -0700 (PDT)
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
Subject: [PATCH v7 3/5] vdso/vsyscall: Keep the CLOCK_AUX base scaled
Date: Fri,  2 Oct 2026 23:31:01 +0800
Message-ID: <20261002153104.1347978-4-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002153104.1347978-1-zhanxusheng@xiaomi.com>
References: <20261002153104.1347978-1-zhanxusheng@xiaomi.com>
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

