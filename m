Received: from mail-pj2-f28.google.com (mail-pj2-f28.google.com [74.125.227.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786D8353A71
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783122; cv=none; b=N8jJ/D+Zu/8Pf2eXU89T66te+UC/OqdVIiKslkJqqpcEvMEnUJrUORSI9XHBXZsodk68Tr9We/1+qfCIJTbuNe57WXLrkHctBUhC5YNZmcqiGulPTQymtPC33tTlCpBVlI4JnX8Fp1U9DjTuJXV43KS18z0Ru1AyB4aC8F00okw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783122; c=relaxed/simple;
	bh=NAqWj+ZTOvNmujxsklsafUndubiCMRUwPApWoeVVm38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fNddQRwPa20UzqQyz/5XpLOVUmsZ1qCOckYFicvA+S21Y/6jOf3HXfhPD75UL+l7TjQrDvhs+JExFNvPpt9HtKJ+/tz7JUPSpX20I9WYr3uYTnZ3RKiv4b6v+7VJwLyulD3G0NIZ93G/syl6Xvkx6m+6qepVOZz9wEB2zm36TkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpstlT8H; arc=none smtp.client-ip=74.125.227.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpstlT8H"
Received: by mail-pj2-f28.google.com with SMTP id d9443c01a7336-2e2dd05994cso4715735ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790783116; x=1791387916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q5QrDeVRwtO7tHo5nqKxHXoOWqHMvo8ILiu8uEBK/AE=;
        b=XpstlT8HrweeIVoAyWpebDaWpTItLhFIHWMSeUFNUONVT+osfQyyNkQf0m//e3im8R
         KL1V4zrKdXQMs24qrjrAtxzvEPCnwnTUqCPTbIqIs08sz2S0zHLzv9H4VDJVVFNy75ft
         KZIsn/Cnouc+YFcTJzgdbyUwseyZ6hDic62rf7pWQr19slbwz8nUD4WXFjpiAYaNvjWx
         s+2n/1OsuwEPGrvybTw9ctf3u+Txzc9+jGmLRU//HXoyRk3As86eWR5JU7cMb2clu4EZ
         4Uy3ppCkZRz8lb0y85S0jnpgeaphG37QZKoWJPF9MYiZUmmiZzdR0Z8BvhCn3njj6jjj
         Hxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783116; x=1791387916;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5QrDeVRwtO7tHo5nqKxHXoOWqHMvo8ILiu8uEBK/AE=;
        b=zyzOV8yCiG4FQauV6pS97D73yqUgpVIIjE7HgmvfBLS0PWcUMNA1kGJQAkS/KkHodY
         ECu7EWstToFC0qo4qoMW5DxNKO9sPST7XmIyTM2i2ES+DEXjOpkHrnBa9bGI6Tp7bxqF
         J/IASBKdlQWDdITXBPGm/RIgbuDGtv3BfBneCV3NrTQC+M1fPo36dnp9EH81xxjJZSWx
         cNlnSMQP+Gf2RsGzzopgZ6ein49SrjmTfruQd5I6LPmilMLbgBVRfo6TldFE+Fvpgwr0
         otN6jVcfjG8HQDo5DUOe+a8M06P4b8I4EUJs4gQEkGGDv/+YKish76po18JGHaTZFfmx
         4POQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaB4X5m1YwH+P5CfhUyR6ckk0cIQ14Ccw47E8JT29unApW1U0amKq/RVR09Nh7veCyTWfELx/Y0OY1e1E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4uoEDhbrM+R4h0wIKivQSQBZS9yH8rOhRc1f5doSzTYewwWiy
	AtKdwd0wl0kEDyoY1zxZ0yjih+lloSEvSft3AT1w/oVdkaT17Qz0nXFL
X-Gm-Gg: AYBFou2qBZm7IkJnxKbnkI5uTWLopua9NY46coFN/G1d/AcDu3OaDcPRiL7b8+/LOB1
	EaGp0Ul+5Bri4pTh1koaazMGC/Pw6P1+U2YjyziWydYYsVM8pkyK98X9BhGJSLIuOVLds8cA5ti
	EYft24ldQmQIb4+I7IrnnFIcU6L2rvmCrMmtcY4lQt8yHuuBMWPFh4UtACYcqFoNxYoTcpvO9ZB
	hanFnHGN6HyZc0uDpIJKWMmhCqEUcxHY3NumEjamBEnS9CCtnVCKsmdxFNK4wH3hZx2krzNdob9
	Ky3EKMhBYHBWLq5L5zZPU4RN2YY/8g44mhKL5/qrOHitaAsSdiUsT/flHbbc734zUUP/VXExVNI
	/ilNBfmEWK91kUCwE0wP13JHC7qIZHWBRbL7Y6oKQnhdnSspjQwpSHoxffbWLrr672ncijRBWXo
	e6+2Z9cqz2aak2NsM+GJ7TfgBSEkPIVohzE7L7QohjZnTFuc52RFui+k45EqvuVKECveZxb8LbI
	Kt/jDtROWA=
X-Received: by 2002:a17:903:283:b0:2df:83ce:727d with SMTP id d9443c01a7336-2e2e4a1f7d9mr15724765ad.21.1790783115837;
        Wed, 30 Sep 2026 08:45:15 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e587d178sm10313265ad.1.2026.09.30.08.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:45:15 -0700 (PDT)
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
Subject: [PATCH v6 2/5] vdso/math64: Add and use __iter_div64_u64_rem()
Date: Wed, 30 Sep 2026 23:44:57 +0800
Message-ID: <20260930154500.722828-3-zhanxusheng@xiaomi.com>
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

The vDSO basetimes for CLOCK_MONOTONIC and CLOCK_BOOTTIME are stored in
the scaled nanoseconds of tkr_mono, so normalising them requires a
division by NSEC_PER_SEC << shift.  That divisor does not fit the u32
parameter of __iter_div_u64_rem(), so update_vdso_time_data() open-codes
the same iterative division twice.

Repeated subtraction is the appropriate form at these two sites because
the quotient never exceeds one.  accumulate_nsecs_to_secs() keeps
xtime_nsec below one scaled second, and the offset added to it is a
normalised timespec64 fraction, so the dividend stays below twice the
divisor.  That bound holds on every architecture, which matters more here
than the cost of a division on any particular one.

Add __iter_div64_u64_rem(), the u64-divisor counterpart of
__iter_div_u64_rem(), and use it at both sites.  Return the quotient as a
u32 for consistency with the u32-divisor variant; the bound above leaves
no use for a wider type.

Store the remainder directly into the basetime, as the coarse clocks
already do.  The CLOCK_BOOTTIME copy of the CLOCK_MONOTONIC values then
takes both fields from the same place.

Folding the two open-coded loops into one inlined helper removes 16 bytes
of vsyscall.o text on x86-64 with gcc 13.

No functional change.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/math64.h  | 20 ++++++++++++++++++++
 kernel/time/vsyscall.c | 16 +++++-----------
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index c628d6cf447c..55b45f5cf615 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -22,6 +22,26 @@ static __always_inline u32 __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *re
 	return ret;
 }
 
+static __always_inline u32 __iter_div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
+{
+	u32 ret = 0;
+
+	while (dividend >= divisor) {
+		/*
+		 * Prevent the compiler from optimising this loop into a
+		 * modulo operation.
+		 */
+		OPTIMIZER_HIDE_VAR(dividend);
+
+		dividend -= divisor;
+		ret++;
+	}
+
+	*remainder = dividend;
+
+	return ret;
+}
+
 #if defined(CONFIG_ARCH_SUPPORTS_INT128) && defined(__SIZEOF_INT128__)
 
 #ifndef mul_u64_u32_add_u64_shr
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index aa59919b8f2c..f43dd3f4744b 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -41,14 +41,12 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 
 	nsec = tk->tkr_mono.xtime_nsec;
 	nsec += ((u64)tk->wall_to_monotonic.tv_nsec << tk->tkr_mono.shift);
-	while (nsec >= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
-		nsec -= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
-		vdso_ts->sec++;
-	}
-	vdso_ts->nsec	= nsec;
+	vdso_ts->sec	+= __iter_div64_u64_rem(nsec, (u64)NSEC_PER_SEC << tk->tkr_mono.shift,
+						&vdso_ts->nsec);
 
 	/* Copy MONOTONIC time for BOOTTIME */
 	sec	= vdso_ts->sec;
+	nsec	= vdso_ts->nsec;
 	/* Add the boot offset */
 	sec	+= tk->monotonic_to_boot.tv_sec;
 	nsec	+= (u64)tk->monotonic_to_boot.tv_nsec << tk->tkr_mono.shift;
@@ -56,12 +54,8 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 	/* CLOCK_BOOTTIME */
 	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
 	vdso_ts->sec	= sec;
-
-	while (nsec >= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
-		nsec -= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
-		vdso_ts->sec++;
-	}
-	vdso_ts->nsec	= nsec;
+	vdso_ts->sec	+= __iter_div64_u64_rem(nsec, (u64)NSEC_PER_SEC << tk->tkr_mono.shift,
+						&vdso_ts->nsec);
 
 	/* CLOCK_MONOTONIC_RAW */
 	vdso_ts		= &vc[CS_RAW].basetime[CLOCK_MONOTONIC_RAW];
-- 
2.43.0

