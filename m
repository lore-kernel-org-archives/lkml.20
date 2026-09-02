Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E817D1F5821
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788320357; cv=none; b=DPgpyyoG3k8FLzkyFh3y9jyFkjgZpi3SpX0Zvk/4TavehkhDHku9hECZatZc9RqUMmTWzSt1lSL4QC2u9Sh5fiM9gqgHBxvEuiW7eaQc/8DzoA8pSevytiUOKox7zVemP5kbTOBxaHj42Dl9FSAGtT6NJszPqeP65J9Eby0vpmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788320357; c=relaxed/simple;
	bh=pNDQYWahXAcj04IY+6y1XqOX+1du2ZcEmNJpACTrvps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSAGQm90dL9PdozKW/X/ZwpGcSCZk8mqjYt7jh1RwQeymrUH9pw+EQNIYkjfGiLHtYaqVaItvRZhWKo080+ynZJl+I8lHJ0BLcJZvEMlFtYc13oKivR67CbO0K4qxAvz2qZTS0EEStGWd09VHmdyNr3ZijH4mU/1hcj8O4h1iZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pLMC+gii; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pLMC+gii"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce98cb8165so5978865ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788320355; x=1788925155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNqa9yT4Y/nUgLdm9d2X8y4bUC7AsEowg0WP+KpNCNE=;
        b=pLMC+gii99FNDsA6DkwpO+P/S97O+i7rx6+jPsYSrc8QWJ+278QMtKeGmmGyZ5Wkw+
         1mvS0JJw/d/eJi3eir/KiadlqH2QrIG7gocxvKZVkcBOl2hm/8URCKqB9SX+/uhhJkne
         7cB6pv1zRdo5994BuDc4OZKpvNF4qIk3Y3TJ27j3hAdMOvh4pP3AatnP1n7CYr3ImvyS
         Kl+m2PlW040cKO1i4XIh94cEI9RyVZEYdZRHD4YSD2bkPqEMeNnuEdtSORjByurrq9GI
         zILRtGy95p52O3by66lfOxRyw+cfdG1PSlDNb1/fmExqC7uw+8Zccp4eQVXzn1ub1lNK
         rJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788320355; x=1788925155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yNqa9yT4Y/nUgLdm9d2X8y4bUC7AsEowg0WP+KpNCNE=;
        b=PAX/mYoJ5XPITqgFiAmpITmHaAoGLyFAMcNGPfhmMbvSBWgZcO3GWIbDY6IVWmj+NF
         x5rS2Cn7aSdu4xtwZ9iTbWchFt/aLgNkRnlD7cre0JDHErPA92hujbYlKTym1T2KvlxT
         hATSx9ggPWrMTveP260f8LrlPBvLQaJ65qsfbiRFvs1ndG1DFsv7bRZa8rtdKIGhAjGk
         4gIGqKY9cShbv+9sXvv/tnkvauidfRMaiUVnNiut2VAqt3wWQ9MfVRnTyTcZosfHx2q4
         +LSBPg8LhAQN9ceWbmNUu6r3LtFNGG7j/9tt7ufS45edfVreUqGqIcQmBh83MgpyxVqX
         kUKA==
X-Forwarded-Encrypted: i=1; AKwUvBzP5Rapt2LId7UXfGGlPaNI/5ev3drsR3BS0BOWi6jBf6M59YPYmbCxOICoejG6vZGmZ74RZbCeSrEDCns=@vger.kernel.org
X-Gm-Message-State: AFuF++lmx0mhX0mGh6Yq7BbiWLeVjMKdiD9M3628fA/P5U0uun+Vsf8N
	lU+9en5csN1+gLAGWJ8cAjUdJOxdPLvafBoyTeKynDkjVOuWirgiyQd8
X-Gm-Gg: AYBFou0t5VyKto8ll1C9CGKkzW0pHj44E1WPQbLTqgx25RwvWzY4qMenyhqCmxnHLE9
	mV61//9wzuYkdcYYclmZiXTwS+3lDBmuTPYt22qS52G9jsCzC+f5fdVxXyGShFsEb7i31DTC9/I
	i686zL9Z9ckrxqYrvG/+TwqsdUurtx5ldrS4BqLWKlPBfDR2riOwOZnwPRQa2yligNkpRws/j/C
	XkIiiq6kJrOgYWbpMp/SinYUJUXp2xLX1Ag8kZrdtSiuax/cuvT65ovFE+W6o58ro6l93OaM7ox
	bwAnTEJ+GQwi1tURcom46qyDej8jl0i1XT1RBld5WYYJED8HZv7wWzIB28uLitQgyaWYGHzP6/R
	j3biYp8r1OC6ZN5K0B7cPn/eG10WJT3kSTkdZJ2UyoqetAP+tPuHrV/EchgXNUr7kF8C5VXdPJf
	68mJX0IAgVLtl/dqkdRwzIvmgYcbTlpbJOCaU5rn5ISJSpwLJVFaZgCSo4CVlmahpgoF7ETcRb
X-Received: by 2002:a17:902:f687:b0:2d9:14e8:bcb7 with SMTP id d9443c01a7336-2daf125a7d4mr1779085ad.3.1788320355118;
        Tue, 01 Sep 2026 20:39:15 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd386eefsm5715715ad.28.2026.09.01.20.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:39:14 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: thomas.weissschuh@linutronix.de
Cc: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com,
	david.laight.linux@gmail.com,
	zhanxusheng@xiaomi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] vdso/math64: Add and use __iter_div64_u64_rem()
Date: Wed,  2 Sep 2026 11:37:59 +0800
Message-ID: <20260902033801.2912699-3-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
References: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
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
__iter_div_u64_rem().  update_vdso_time_data() therefore open-codes the
iterative division twice.

Subtracting is the right shape here rather than dividing, because the
quotient is never more than one: xtime_nsec is kept below one scaled
second by accumulate_nsecs_to_secs(), and the offset added to it is a
normalised timespec64 fraction, so the dividend stays below twice the
divisor.  That holds on every architecture, which matters more than what
any one of them charges for a division.

Add __iter_div64_u64_rem(), the u64-divisor counterpart of
__iter_div_u64_rem(), and use it for both.  The remainder goes straight
into the basetime as the coarse clocks already do, which also makes the
copy of the CLOCK_MONOTONIC values for CLOCK_BOOTTIME take both of them
from the same place.

The quotient is a u32 like the u32-divisor version returns.  It keeps
32-bit from carrying the counter in a register pair: vsyscall.o loses 16
bytes of text on x86-64 and the loop drops from 36 to 28 instructions on
32-bit gcc.

No functional change.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/vdso/math64.h  | 21 +++++++++++++++++++++
 kernel/time/vsyscall.c | 16 +++++-----------
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index 83ebac2e5c1b..0c91410e5f69 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -23,6 +23,27 @@ __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
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

