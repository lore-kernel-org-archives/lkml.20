Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF85539B4A5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789526000; cv=none; b=m46JiVRSV3B0h/p93Hb/wP/cOHRZ80vOjm2VFK6RLhqDRxgsGUPweFF4WaonTzRvuxpUEKzpbRNR0Y1nZlN78REA4FOmTf+2kF9YV9g/al5K3j72F6yH/TSMC0XUWAxAGBmIB+Sg/ghmWviMlwgEpGJKV3FYQtyjWEdWVltXAAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789526000; c=relaxed/simple;
	bh=NAqWj+ZTOvNmujxsklsafUndubiCMRUwPApWoeVVm38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cbjQh6c3SmsR/Lhu12XxkkPuQVMvqS7RfvcUtW9jP7cnlo+xiCaSSB2uGnvp64beADOk8QygPAg7ym8L02WeT0/LwtLhstvnd2sFuWzk1LhbccsX/mkV7iQKO6uPg94kAezX77v6kLlicP2t0XDaJnLw50RK/HtW2Onm4Q6Chv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9yw/Tq+; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9yw/Tq+"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8692a856865so325717b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789525994; x=1790130794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q5QrDeVRwtO7tHo5nqKxHXoOWqHMvo8ILiu8uEBK/AE=;
        b=I9yw/Tq+PhvepGdCBPzzSvxw1IhTqlTi+6KpZMDxLCrBFhjeAIIhV8cjPazpjA7hc+
         eZq9F3qbaL+zTXVHzBHz/w9xhG8HBZPCQcn8TVGg7FwPYJjYMX/KrBfl/eTI7UwXfE5b
         x4us1KTqvnsYNaCPGZoCXBKewc1PrXgdcjIHSwn2RLKODunyyoQH4w2AXxTTdXEF8DcM
         7c2LXlhbpsksXHtXZUMqoKoxRmq1nGCPJZHHsUIgsosTgS7JdrqtmPN7o0AvZnPzK8to
         JggGkRJc+VZQ893YnAXmRsa1qjrXnp0u/JOaWPRCeEGdcNRy92EdiXAAdm/muR8Y7Rfk
         BHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525994; x=1790130794;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q5QrDeVRwtO7tHo5nqKxHXoOWqHMvo8ILiu8uEBK/AE=;
        b=U5RV/5K0U5gQiDhl8VJL7lIy5E6HLjDynZTIa/AflIfpE1+AxOcxM/fuHJohtCp89M
         uDqyNzORTyjPSHlNwVtVIXwdX0HrGsrHCZUHGIDrlBogNB/E3eMWQN9wuy6+4EIN64YL
         N68rGqG+YlLxy8lYQpAT2D3HCJ6zxycAhj93XZnMuYpjtxp2mjJUVQMQYCDIlmks5kU6
         nsdCnISm2ECipWp5RoMGtgC/x0HHJPDWD6s/LP2YRwGcRJH60sLXdFu0lalGcjLgMBAb
         7027yqctNP0dWRO3ULK3oEXYxl9Tc5hMNCcRO4WBWcJHhpN3JZrXFr7nbKMAeQcyAup3
         Xy6Q==
X-Forwarded-Encrypted: i=1; AKwUvByTkzKkMLFF8zdspxnWaf+0CvmF3+hwx9GJ4ZInmdHEfvne3cqmu7lI41T3td6VcoM1q4nF4NakKHyCzu4=@vger.kernel.org
X-Gm-Message-State: AFuF++niP+2GvInlOHWzBoQNGpUTUqkqxMmFS3Pyr+4KKx4BD9UUNQei
	yJ6NHUcPGpX/cDgoagji/HPnTmJwNXSy0ZU3SwDGW7j5QzpNb095F+7p
X-Gm-Gg: AYBFou1TGpYeaIu1N0s5SXByDFBSLThrku5d1jzE2GA1yysG5zDZ4BRXB20BoII9NDK
	axSJ+AfJe2Nd2fI7oIPb0eGF7I/KCBiGBcgGR0t50efcJgLa6m2NL3XjEcVSc0MH9S81VDtffgy
	e2jv/ylduPNva72GBX/z4tYW2z51WrK7SjjbmA3z3JlTeVcZrBIPTIgh072dvCgSo61fxPYi7YY
	GJdKUt2VnGWDkjeLI8NvhfJjDa4rmaZE6caaHONaL5DNEfXs+7WwnIylTh+PFPV+QtrDlPJIWx7
	xmNCC4H+8NVhFco3WE+ioKmetjTlpYGpdxTKkGKC36pGQ4EfCSV9vwEBjPFVYsfwzBnwNWZadHp
	wy4l52kR3xHItRysfq7HH/TPWWzSFPBiX4N4TylFzAafk+deZtQjS+rGjigk443yYzobihfKqwl
	/dSs8J+VMBQWbAzjO66vVtLwEjDPdJwJRtIFQJ8JkY4brkxjU+53eeFs5qXYFnyt2Gn88aIn0pm
	mRWR1w7i+U=
X-Received: by 2002:a05:6a00:bd8a:b0:857:72ba:ff0e with SMTP id d2e1a72fcca58-8723998c23bmr1471536b3a.22.1789525993907;
        Tue, 15 Sep 2026 19:33:13 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720123e374sm381370b3a.24.2026.09.15.19.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:33:13 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	thomas.weissschuh@linutronix.de
Cc: luto@kernel.org,
	vincenzo.frascino@arm.com,
	david.laight.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v5 2/4] vdso/math64: Add and use __iter_div64_u64_rem()
Date: Wed, 16 Sep 2026 10:32:50 +0800
Message-ID: <20260916023252.418473-3-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916023252.418473-1-zhanxusheng@xiaomi.com>
References: <20260916023252.418473-1-zhanxusheng@xiaomi.com>
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

