Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0573DC4A0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228427; cv=none; b=hByuwAzs7dkxc8l9Ufuvf6DtqEP8IJtzyy5LZBqYXfP3sGjFjsY35OYfpOUAtIqxCtnBhcihIBxQKSI4lQ1R3VFlhKaybgEzlgPeWDjWZHErS8u2n005Mvadnp9xvMmtUMNkMAPO3JXI4NQumqGnsGmc0oUAN88B6jeo7GG8buw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228427; c=relaxed/simple;
	bh=VED7cABbFF/9gwynzx8jQHaoP1dXEDsl5ASyPHqkqaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SMOmuQK51Ubihduxjv4NDc0BW0On9A1t+hsq7v9OVzAjSBB3YS+Qy03IbtZQVwl6bj5l1WJ3PDz5pnLQ+Yf6Uaq2JwCbSCBuXAlZnLpBYBol8LEYu4q2AIbQx1Evlls4m6lWg7L+qTYccATKOm05jqHKG+ajkPlMTl+Hu51X2co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJdefopR; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJdefopR"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d58efc7356so50318465ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788228407; x=1788833207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Llu+Tl15uBHV+NHP9noBFDIvJZr91F2aFZx+MnfDiVY=;
        b=TJdefopRnX2Lsdg3NgWRDQPtYZV5io4a8XRdpedENgkLA2vCxlc68p83hzPYluU7zP
         oNKAfZmgMtAuHUeqU/xboQ9VMzRrtQq6xyEUGME8jMor9D+jl/HQv2A7IVv9AbLEweaI
         47SHb/5nJcogsKZMIcgRCbHAstDG5Nnun5AvciYoxnfZ1UMbF9H3N7QqAbfdxVWUqVlb
         yIat5cM3SnLhxkLIUdyj2DR1JEZC23zeriaMSDHkTQdDtQYusf+OnKluQjNIn5SfyBhB
         ScLpPBqQqpKDLpBXSjEcu7VGcRth5hrhfS9F1h0y58pxXTvewUKhg7vXr8anKr41UdMB
         iVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228407; x=1788833207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Llu+Tl15uBHV+NHP9noBFDIvJZr91F2aFZx+MnfDiVY=;
        b=CUvZt4txZSl3KdWlFjFXPS+sqms4XfUcR8Qno4SFfqReCvNvSvOf9Y1RJLLtrbsujW
         uiAIEvl+v+f1WGiigMOaLPJ44iNESXeVRMGpbXwX8vkklGWiwYDcEgsb1fKfToR3uGTA
         qPZv5xAJb44WRIcsYlMLrgh7tg7v3dyGfjl6kpLuCbINSHZWBkzS/7tFJPZMxAP0M8DP
         sgE8w8xZjgqQN1ojuAsVz0bX/dnD6BXyWjPdl38fNpNwmhKPAArGaA9ziJmj/z84oEv2
         HcrURKqaE0bE/rhkxMX2/8KgcTUTvqD11T7g9sfy71OZvvuc0zlDDo4NPJqgeGvpR1Bx
         s09Q==
X-Forwarded-Encrypted: i=1; AKwUvBxCxBH+BZXyInAXhca5wIIxtdOlj+cCS+ajjJPbXJ6wuunLorEn3frkPlg/6qOJNXL20OaZGSr8VCi709U=@vger.kernel.org
X-Gm-Message-State: AFuF++lYFLUBHBm/6P5wJONo638hkS6F1cynEi5djO6GBdIM2DEKuWCC
	wF0KmXLykfXxq8saIEWmEkDTQybs3sHiWBKnx3FrJcyqqQSHZiMEcZ+l4tFGBQ==
X-Gm-Gg: AYBFou0+Q3dHktpiNghCwm13fD6sIRzx0/cJGxkw5OYILrUOwskEkAYvyzK7p14+wBm
	6zXNLkTDnvM0WJPCG7wKpEO87c9vzZkrbBIY7KV1gZD7z2GXtdLNsgV5uNsuPNOxro2zR9AWWBK
	j9Rb5Mwjn+0osMxjAamK/aA+aUwDJWfMA64vuOm3QX+ZJx51q3Su5kMHmJgjmc5WhRyMP+2RTzV
	ylcxvcXC5+zpk1Uz62dkCpDX0SRdENku1eJczy+ZXKxj7oetGLtDxpDs0nWwVyBdHOKdMm3UlzV
	soLrbvVhv8A/NPOrcsTj5CEQx+Q9zQLGjR9b1Tp0bU2qex6d6K8vgJWpKth2cBIQEu0sv1rhNCB
	nsVEdq0v+F5xslLGqyAIf9uwMShBBRZaMh+6fpYP495cF22FKc8l5OFbfZnAady45pny+/cTMb4
	TVVCaXyifho4UEzjHBYlZJ8Z3qxMpGVNnlMBwWcEC2Xr1Tt8sQGlfHGcKYPA6qN8174ECLuO8OG
	ZEOT76Sk5w=
X-Received: by 2002:a17:903:22d1:b0:2d9:464f:d45f with SMTP id d9443c01a7336-2d9464fd590mr75255575ad.5.1788228407405;
        Mon, 31 Aug 2026 19:06:47 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7596412c2sm43098735ad.37.2026.08.31.19.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:06:46 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com
Cc: thomas.weissschuh@linutronix.de,
	david.laight.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v3 1/3] vdso/math64: Add and use __iter_div64_u64_rem()
Date: Tue,  1 Sep 2026 10:06:34 +0800
Message-ID: <20260901020636.1821993-2-zhanxusheng@xiaomi.com>
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

The vDSO basetimes for CLOCK_MONOTONIC and CLOCK_BOOTTIME are kept in the
scaled nanoseconds of tkr_mono, so normalising them means dividing by
NSEC_PER_SEC << shift, which does not fit the u32 divisor of
__iter_div_u64_rem().

update_vdso_time_data() therefore open-codes the iterative division twice.
Turning the loops into a plain modulo is not an option either, as the vDSO
has no 64-bit division helpers on 32-bit.

Add __iter_div64_u64_rem(), the u64-divisor counterpart of
__iter_div_u64_rem(), and use it for both.  The remainder goes straight
into the basetime as the coarse clocks already do, which also makes the
copy of the CLOCK_MONOTONIC values for CLOCK_BOOTTIME take both of them
from the same place.

The quotient is a u32 like the u32-divisor version returns.  A loop that
subtracts only makes sense when it iterates a handful of times, and it
keeps 32-bit from carrying the counter in a register pair: vsyscall.o
loses 16 bytes of text on x86-64 and the loop drops from 36 to 28
instructions on 32-bit gcc.

The barrier keeps the value in a register rather than offering a memory
alternative like __iter_div_u64_rem() does.  Both forms stop the loop
becoming a division, but clang takes the memory alternative and spills
inside the loop, on 64-bit as well.  Converting __iter_div_u64_rem() the
same way is worth 64 bytes of vdso64 text and 112 of vdso32 built with
clang 18, since it sits on the clock_gettime() path through
vdso_set_timespec(); that is left for a separate patch as it also has
users outside the vDSO.

No functional change.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/vdso/math64.h  | 22 ++++++++++++++++++++++
 kernel/time/vsyscall.c | 18 +++++++-----------
 2 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index 22ae212f8b28..02abdf6e82ed 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -21,6 +21,28 @@ __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
 	return ret;
 }
 
+static __always_inline u32
+__iter_div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
+{
+	u32 ret = 0;
+
+	while (dividend >= divisor) {
+		/*
+		 * Prevent the compiler from optimising this loop into a
+		 * modulo operation.  Keep the value in a register, as clang
+		 * spills it when offered a memory alternative.
+		 */
+		asm("" : "=r"(dividend) : "0"(dividend));
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
index aa59919b8f2c..993258d5f1e7 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -41,14 +41,13 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 
 	nsec = tk->tkr_mono.xtime_nsec;
 	nsec += ((u64)tk->wall_to_monotonic.tv_nsec << tk->tkr_mono.shift);
-	while (nsec >= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
-		nsec -= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
-		vdso_ts->sec++;
-	}
-	vdso_ts->nsec	= nsec;
+	vdso_ts->sec	+= __iter_div64_u64_rem(nsec,
+				(u64)NSEC_PER_SEC << tk->tkr_mono.shift,
+				&vdso_ts->nsec);
 
 	/* Copy MONOTONIC time for BOOTTIME */
 	sec	= vdso_ts->sec;
+	nsec	= vdso_ts->nsec;
 	/* Add the boot offset */
 	sec	+= tk->monotonic_to_boot.tv_sec;
 	nsec	+= (u64)tk->monotonic_to_boot.tv_nsec << tk->tkr_mono.shift;
@@ -56,12 +55,9 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 	/* CLOCK_BOOTTIME */
 	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
 	vdso_ts->sec	= sec;
-
-	while (nsec >= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
-		nsec -= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
-		vdso_ts->sec++;
-	}
-	vdso_ts->nsec	= nsec;
+	vdso_ts->sec	+= __iter_div64_u64_rem(nsec,
+				(u64)NSEC_PER_SEC << tk->tkr_mono.shift,
+				&vdso_ts->nsec);
 
 	/* CLOCK_MONOTONIC_RAW */
 	vdso_ts		= &vc[CS_RAW].basetime[CLOCK_MONOTONIC_RAW];
-- 
2.43.0

