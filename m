Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B09633509B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228423; cv=none; b=qhLq/u1UtgDp3IxwVdlRXHvbsubOKRv7EJPb11uOfW7lqrrsFB9wGIWBiqI1tduOwaN+uEGDeezwXI21lG1oru0Cmow/Ixs+rCnsjDTXTKrZ6ljpfyLC6pOr3g47MLSvMqbHeqXNbsAIl/z3r4bVQ16N5t67H4zyHvQANaaheE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228423; c=relaxed/simple;
	bh=m57cAquf4D5BvPKUTyalA+AN3iuizHT7a9CafvoSbU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMzjQ1UY+yhrjlS4MwuJqNTZ/wu0GleY4LgLGiksqdM9hk+jj3651BDMbrIgpyjWnDbRTPYiKvQ6/vEVWW6Ps1ElXcwS9iI7CH6K4lb9+Rqoqlp/UiyIhzx4FrFunK0UAnlo4vwYZwfMTAvbz+TOmKIGvkK7pyJslw660mC5LvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=domyRLc7; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="domyRLc7"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso43785195ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788228411; x=1788833211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+aE65LROA3tM0FyfM+y8kmJmKw3eA8aOwwCRKMD2L0=;
        b=domyRLc7bFdVC+xM5cozg6CPPoOYWBsS1nniV2uSY28xbMA1EFWPcqbLe5oN/vusnu
         GKOOmtiinXGYJUkXpAJo7YnE71BsFC3Jx/vJH5KYJCWLUQKYu6YGchTarz3fgHKo9fAm
         PHIpgIUwvTvB7ZHzGsbhi50AYBIHLLC8252rU4wqcfiRF5tZ8EDcEqKnbxkGSBrX6ji0
         7YAkTTd2VscycWNF9/X9TcSSPZYIhJNRKUDfsR7Jwp6AR8SN0C639BgnWwFQxTsHDeQ6
         myzQqn3PcgcKmb/epBLFqAvM36UhjQ2NEuJpVxiE0XF0AyXZK+tidQur4P1FUmePbVHu
         HXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228411; x=1788833211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l+aE65LROA3tM0FyfM+y8kmJmKw3eA8aOwwCRKMD2L0=;
        b=Q9bvG7pq32AWy2khx9BH/s0GB+yIdNHC/pDUXqZJgij0jcvhq4q3uuPZW56ZWRFiTc
         uLm+eetD6rAZfJ6K3tECQjqrHph5LK7PEVACIxNDiT9okPvaWTdUwXboI0vFOLc2ahNo
         qjTKF+vXJ3lhfNe/QOkGcrLQWgjKL+/PXTY36SafzND7QfT+HqFkp4noLOcqxtCKEILQ
         xE+9tBHScsTe/sbljddfMyH9uBJWzTrwfCSW+DZM/lq6sQ2g9nkG4ts+1h33zVkaVaMz
         Knhr/ngApBgQ8XES09aHnrCOHJVfpiA2Cbpi6ja9Sgqab7rjiUHWA49ge7Kgiai4k7fE
         2tLg==
X-Forwarded-Encrypted: i=1; AKwUvBxIiDNf6zaCPgZALeeLveHOG2eZoRFhZwhSpmzWWnogVKYHXqJRtbFVOjQglS9Hg9M3bX5ZhlnLN4VYrrc=@vger.kernel.org
X-Gm-Message-State: AFuF++lNUiuTQUVaXfu0gb2M+bc3Q7VcTzlA6VNDXBeUXUcYFoT784D3
	swfLZPLnA2goWENV5pzhbiBy6wG3gRwDBHq5NCGS+S9Z/gEOvrG1pQkH
X-Gm-Gg: AYBFou3ElJZa1pnT4qTNycR+QdSPoMbdX7pHEa+9y3BCBtdCT8b/w+kjH1YmK1n4MGw
	mmyy1f3g1NrzNADepqhPPJui7kNpxCDD9ecYk+pXXYgC/8TMe5VEja1Uq3Scz6igAfAh/RHPE8k
	R/O5QDpkjynwEATXOtBtXjyktxKFbxk+CgXhXwo0kOiflQOs1CdpXGvB35kKTh1xiuAUGgNH8FD
	Az0+sXPH9t+m1H5DUC04RtMZdLjJkTp1k9wNVXcCJHItKaeSoeX6fd+BDX05UGRE4E+J7V/09fY
	SUZft5KBd01iFkLnYZN+r2BQBeNcml/m2qxpe1xVIb+2onxULugQwYBnWo52yTGR46SJVZOgy1i
	KjA28SR/kZ1nC2lPpl8sagl3Mr8P3PFrjiZp7TUqlIbclqbA7b7KD+uweCT42jRjLNH6L5gwBUQ
	BM1qNWxdID4Gno2Nof+ZTBWm6A9ooHzQhtZCaAw6tXD/19WntQ452MHPkl2GCUsGhw2+9nrpdmi
	g==
X-Received: by 2002:a17:903:2a8f:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2d9599ee20cmr26019885ad.3.1788228410935;
        Mon, 31 Aug 2026 19:06:50 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7596412c2sm43098735ad.37.2026.08.31.19.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:06:50 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com
Cc: thomas.weissschuh@linutronix.de,
	david.laight.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v3 2/3] vdso/vsyscall: Keep the CLOCK_AUX base scaled
Date: Tue,  1 Sep 2026 10:06:35 +0800
Message-ID: <20260901020636.1821993-3-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901020636.1821993-1-zhanxusheng@xiaomi.com>
References: <20260901020636.1821993-1-zhanxusheng@xiaomi.com>
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

Fixes: 380b84e168e5 ("vdso/vsyscall: Update auxiliary clock data in the datapage")
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

