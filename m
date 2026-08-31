Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D184A1E17
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186676; cv=none; b=D4HZMVkunNVHh94E37LSDLIetNIaCd/o+7/OuXIxYMMb0+Rtn2S14Lu4nQ6AmKOa1aXXgDIzMjZeWYO9E5l/zlvfS6HEW9VYWt2O4U5Xq8gksIUy3PnPtrOajERPjSh9asFj2bymLBOd4XqS8MmjhKs5fbkNs8HxeRjA7uyhrAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186676; c=relaxed/simple;
	bh=PThzMVl2U41G4FjC0inai7cd44WtMWOI/RqkRs3nPEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VsL26XF6a1qT2fbh+LwbaFaDQVAhbn2dczCryyFux5RKLynp6p3UNr24K+x3y9Wiy3xcRqpf0Zy2LzDhViwwYsLT0hchDbDmT7uVD9qSpH6J644xG0QLg+xI6FtJQaybEueDKDTV+JE/H3y85JidamZC9av2QDFb3rxRPZCzw18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxFdOi65; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxFdOi65"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8541875f596so1813141b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186674; x=1788791474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRRqCGww2uS5V9UIyyHddQUq8oZYYmx0ANna9lCcZh4=;
        b=lxFdOi65JJOg9IcKJJ93WwkU6byUiia71X484TUZCwSKBPiLbNwH1MvqaItUFLAMnM
         yP7k5lT7Vi7oYbGi3z9KK+HoSi3pTCgadIz04xJf2sDxlUYXcp0QoA7Fciy0P4aOB1Lj
         DubOevpLrvefuVhqq3Leh69Yv0+pu6Y4B6YfWpgQqbPfBmtxXYrhaDcrtUyANCs1yJo1
         ztFmSTm1nMNUwFjYlJfoZyESe0/f4lLnHRoggVFZowKlB2jKO5qIAfVh+n9yiN/pLBbl
         bd2gCoA9eXPuHtgTCBSJSexX8MM08cbfdS0WnA0+gkhnYv+MPMb7+ZYIs3Ur0CLX1Pn6
         gWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186674; x=1788791474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vRRqCGww2uS5V9UIyyHddQUq8oZYYmx0ANna9lCcZh4=;
        b=pBdylVcpProu7Lpmgt8F9QurBv09hwJpsvAASEQpdJGOV4X1w5cIpOJeDi+CdTZeI7
         BCSf4L56RKVglx3mlIhbUvluaz5Bs9PYxtpJYBqN0dhMinZwfOCsMMbb+TMI06a1p0Sy
         msiZs1WGzldYe5QxX2Io5EDJqOf27AmZ5ZoYU7w8nACpHx+TJ+Glke5YSRLP/doNpvTr
         5sNHEXdvx4X20yR+y2Y4aBHHGpVIlQMCwJJHkH2H1EUH5msbZd0GhmrSC1ugdLeW9m1i
         igmeWVmj4Xvf/z3CfsL0xzMJ7CNG6dHJZw+FkUk9XudhgW9TVVXWtXdhjaQfsfKw1l3V
         6S/g==
X-Forwarded-Encrypted: i=1; AHgh+Rr0460kyTKVxipeFRqEmXtaevQcUkFPGyV6XRkFEpC19RfviKkr24n3hOhHo1UGQKLCkcUMvXCJWPUcuoE=@vger.kernel.org
X-Gm-Message-State: AFuF++mCMYZVDIELHKPIwajCovuJJPm5s//+0S+MUouXEeVXGumOrszN
	bh4QoavL5xjRIhcyjs8ZtT0eJPHxC7oIiKphyGNgiftpzsmL9P5UHxNo6IbBdA==
X-Gm-Gg: AR+sD11jxukw0uoSNjtd5QUBywF+X+S9KHjuJNlYKTVhzoDmsLYA9Xo9be6jEvIRv/W
	HElxXhv9uqR9Utn7aSOraAAxtJpcw5YhaH0xv89BzvJHJkB7i5kJ32EpLPy1R0LoJZyb9EuOx7d
	erXRlP1kBUfaBRt+ZUggiDnXyYtHZEdginVeukM7DjXKRGS6KIhwtabktpQR1NPiPFfWWYvssAC
	bQYSFgHIX5iKh1VxvtIG2XrbNhSF1qOe4UOEZE3kEA19zSZOjlUpd3/Xf3b+IV9roifPB6xX8xe
	8zceNUOmFtGA6SMrHARN8dXuhUw81WMoDF0XKXwejEl9LRDjdHb/GoJZW0q3/m7g81IdJQQc8MX
	GS5HvIQQTetRGhc1JunS+zptYFnR9vYiv5hyZ7DKWcR2V56wgzvjSgMw8buw9ytOUHSvzh1I7Ju
	NpmcgzoIb2lpRnnuLQetDvu70iLst9nnTMklKSGmbKyN3rlYIENw+Uy+0f/Ds28UnlSfdqQMSI
X-Received: by 2002:a05:6a00:a118:b0:847:8449:2bb6 with SMTP id d2e1a72fcca58-8562953d5e9mr41605379b3a.4.1788186674309;
        Mon, 31 Aug 2026 07:31:14 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm4248961a12.10.2026.08.31.07.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:31:14 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com
Cc: thomas.weissschuh@linutronix.de,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v2 2/3] vdso/vsyscall: Keep the CLOCK_AUX base scaled
Date: Mon, 31 Aug 2026 22:30:58 +0800
Message-ID: <20260831143059.1592875-3-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143059.1592875-1-zhanxusheng@xiaomi.com>
References: <20260831143059.1592875-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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
below the syscall for the same clock.  clock_getres() reports 1 ns for
auxiliary clocks, so that is the full advertised granularity.  It is not a
monotonicity problem: across an update the step is
floor(a + d) - floor(a) - floor(d), which is 0 or 1, never negative.

Add the offset in scaled nanoseconds as the other high resolution clocks
do, and normalise with __iter_div64_u64_rem() so that the stored base
stays below one second and the userspace fast-path does not iterate more
in __iter_div_u64_rem().

monotonic_to_aux.tv_nsec is a normalised timespec64 fraction, so it stays
below NSEC_PER_SEC even for a negative offset, and the sum stays below
2 * (NSEC_PER_SEC << shift).  The largest shift clocks_calc_mult_shift()
can pick is 32, which makes that 8.6e18 against a u64 limit of 1.8e19.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 kernel/time/vsyscall.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 993258d5f1e7..697adc44eebf 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -157,11 +157,11 @@ void vdso_time_update_aux(struct timekeeper *tk)
 
 		vdso_ts->sec = tk->xtime_sec + tk->monotonic_to_aux.tv_sec;
 
-		nsec = tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
-		nsec += tk->monotonic_to_aux.tv_nsec;
-		vdso_ts->sec += __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
-		nsec = nsec << tk->tkr_mono.shift;
-		vdso_ts->nsec = nsec;
+		nsec = tk->tkr_mono.xtime_nsec;
+		nsec += (u64)tk->monotonic_to_aux.tv_nsec << tk->tkr_mono.shift;
+		vdso_ts->sec += __iter_div64_u64_rem(nsec,
+					(u64)NSEC_PER_SEC << tk->tkr_mono.shift,
+					&vdso_ts->nsec);
 	}
 
 	__arch_update_vdso_clock(vc);
-- 
2.43.0

