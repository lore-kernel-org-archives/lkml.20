Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE732EFDA4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788320362; cv=none; b=FGO7FXHd3ETgZR6JzyEXYaQRjHRp7Gj7EzouqRJh7eUY+FVpEq18xQ2oHdOanrDSiOCeFuv4Y9fjWIt4PsR1uWfRE3TuKfFEM5YfneEPNtICAIP21gRHci5OI2soqBDfsIRhJGpL86F4OJkwMvIDT4kq/xezrjk+mWCzAGx5PEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788320362; c=relaxed/simple;
	bh=A4/1ri5HuIDttueCUT0PCIq2gr18ZPmxmc1yUhOG+m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VZ/MKP/yk/LDPH8mYky0iIJXMxB/Qaq1GTdbdn0ZjqUaO7Bxl3NUx0NlJSla+lolKibRt7rDdOXCTzzW49WuRqga9MnaHoZ05885d1L60R4sVMJFVLq2W9RcqCLONNHeZUC39H0xd2684pyabG925Ro9CdNLBwzswUOnS1oTulI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipK9o7Zx; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipK9o7Zx"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d8fd3b729dso4761505ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788320360; x=1788925160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hy/ujTz3CUWmNrrscj1BmpB2cqE+O9iKHNdWqpEvyjc=;
        b=ipK9o7ZxcTeKk/ABGmBzYX/G9K/eHH51lcjfGBn/XEL84jpJczs3vV7HeyTZzah564
         DqWtSRvab5Z85A5tldT9Izl1BjkQP1kFMWIxB/6js2QxxrwFCaUYqHGVLxZdj5uTNNet
         vDyWKZBUrytrMvGrlKf+PyyYOUIdX1UPGLGargyLez88j7y1BRajrevwoD/4vy96XO/v
         kerOEL08I9FwwDuBCDscdgozoCdElNIb0GrWa12z5G1qJGiR5doCgAvCxH0xqKotJfjc
         sSdEIl41QiX6i/ZhUPyDm3s/lre9vPnemJuYnsd/tmFCjdKlGVWeQaHMQZgQ9rL98dvM
         ou1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788320360; x=1788925160;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hy/ujTz3CUWmNrrscj1BmpB2cqE+O9iKHNdWqpEvyjc=;
        b=es67zVLIwVj9I+y2Et46/YdVTg0kX+sO2NeJ6/yalkkz2qCfFhjBCY63QSpGKdVQ8p
         AIUSC9XuzsiW9c/2S3V0GyFiPhaRms8jw8Ci8vOgRaINF6LgEDDVetRILGv+Eaa49YSU
         crdd6nBhLI5SN7euLOwlug9l8AHGihpFfxsEgUGXEtnw2NFlLjKRHivbXQ01atbUPhdX
         XJEEnJAk9PmVKXsxm4fR6HhH8+AeHbR/d0O9/zXU5pXbVUHkggoeFzJnlL2tXc9dGUtg
         a2i5Tszc8UHA9Uh9Ks6ARugfeo2Vq8KtH9vYe0sgvjAosP3zJMRkQgpn72NWZOxChV+v
         mUlA==
X-Forwarded-Encrypted: i=1; AHgh+RpJa4owg8Flol5Nmv7vgNRI5YYKi0bshnIip9QwGT5C83lg1qmjPVV+3osNZhFXemH0vrUV96xT+vtpmt8=@vger.kernel.org
X-Gm-Message-State: AFuF++n+Y3fdXhdYqxKC+a+t/iHEojRSdb47PhoCzDt8TTKLee41kVSI
	lGgnnQm4J4+U3YbhbnOrA9hiXVfMZ7c/sSt4hTOP0LgQTO15WrQV8FOB
X-Gm-Gg: AYBFou094Wd5z+bCa/Xq8EnA7ccfnGe4RZxo6FUVLz6pI1ShilzKo/UrmYPQUEGqy5j
	kXRgiHET8O2tkjuuU0JtU5r8PJTTOR9iZBvX2af1ImUIyDRJRnnETuOkDck3JSxdVGvVLF23nHn
	2Poy3oZbS7/OICyX8yTMdTUp6cofeDpC2YSbFjhATBRO14iIgJLxpA8EDd87usH9fbgSMT+5Gnx
	NUpDs+jd0QGEtZmnLTKKkO0m9iLj7bm+Dmkw/qPRJSL00bsmemx6Tw50Lie/nbgvb+Ir3Nrxw19
	0ESb3aB8l2smnLYbGdt7PAE7c+4Vd+U4eo2LX/Q5O4BaK/t6OvI2WVvg9raBttfFjBApVDzUMT2
	K86eYfU897K+5rjN5Srg2AIuBpOxcrwZlni2KEyUR5DIm+JxJdxviqzA7ZubADnluZxGYUIMnnY
	tSFB7QD2h1irXSUGjRLTIq5NhGRiUYTvR/4SpQvZ8ND57Qcz8NvD7EUZA/oxPeRTUXDCATKPVPV
	pl8+hEvbMg=
X-Received: by 2002:a17:903:3850:b0:2d8:d4d3:da4e with SMTP id d9443c01a7336-2daec772204mr29255265ad.18.1788320360398;
        Tue, 01 Sep 2026 20:39:20 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd386eefsm5715715ad.28.2026.09.01.20.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:39:20 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: thomas.weissschuh@linutronix.de
Cc: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com,
	david.laight.linux@gmail.com,
	zhanxusheng@xiaomi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] vdso/vsyscall: Keep the CLOCK_AUX base scaled
Date: Wed,  2 Sep 2026 11:38:00 +0800
Message-ID: <20260902033801.2912699-4-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
References: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
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

