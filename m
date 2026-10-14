Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905F94D2EC3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984587; cv=none; b=HOGjMOPjYWT25ZOtylPPrv1cI0Ps0gbeGax4L5G74BPdYso2olwUXaq/1u3H42V57BLSJ+/gXo7EGsuE6WMqaiJYCZFGto1eFWOFcINuhVaA0Cq6AC0SXqluF1BKl/w+lGdx0hIxdDurHXsKrFWijh/ygiw7+F1iUcbnp/z2G2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984587; c=relaxed/simple;
	bh=WhsP1oj9M9rR97fz3Pt42Zrmdf+mcO83DUWmcxJZDBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W2W85kTKOqlnGWR+8EKli8cVsTffLoPIMOa0ZPeanjh6qQinkzIUVBOtZtg1EwSkhi84VXEkccZCI2Al+8fU1ObFNzZJPc2Vid+mzm/aQC8yZuq7zEfIbLKPKBDhJz+oZ7t4Bk842X2JE3HJR/RkhiBghtYHfMjXORIR+ZYIkSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IR55CSpt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IR55CSpt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a005aa0838so4322955e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791984580; x=1792589380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rC2NuEapkG0HHx55ovFxDQDvx/baEUOTGZopAljUgi0=;
        b=IR55CSptAPs/Ax1AQlVWgTBpQBed4jkF+txrN8KV/ewaeYsS7K0P3SmwKhzWDfmD1R
         koSVXNTgbWnsOg5jDpfGiIvaGZUN0otvU0wZn63yZv3Vdh61g9kJDQvQWy6ynjDGP+qF
         BzGd9QI42niU6vlOeMebHmfxMf75AXyTjFzKhFUXr9pQa7/le5d+I/67g99kNJZZIDU1
         jC9EPsjWJpMpesnjSM0ZG0mg8NOzYnttYvcAPkbJUd9MTfmaDJa4IQbuKNQzEiNAyzJV
         EEorayvXrOz1qD/1DnMEpTwE++JkbQaoIoQfNhHIeIaM8E8AOmzj5hponmBucRa0gFga
         5Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984580; x=1792589380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rC2NuEapkG0HHx55ovFxDQDvx/baEUOTGZopAljUgi0=;
        b=oJ5dROpDUDvXNAUvulQd0QEzjALwrxgLSCmNCq4onrn08k8X/sVJegNf9gNk44PqRB
         Ccu0PO6RHSMpJ7uOEG6WpVZGpDj6tw8uNndSDcFz4m4cIng2JoAOH/1T3GYWqV+4b3BX
         2MeokKttPIuiKxg1rA2a9bzDTCvkaj4VhTgR8ZsCVgMm6YcZl2Ku4xaYOHI5bvhnusQu
         COnJTFp0Ih6IXpZmZ+MN+kp/xo92yp03i2m9ixrmE9Qsdj0BjPV/nzRZkiRXk1ZvImVM
         cC/wLatUlCmAxzJQoGyufS+S5MoKLfGKMLo5gQLqL5oAjnFLCD9GUXbYUkqRBh84tpOs
         WoKQ==
X-Gm-Message-State: AFq9FYKYDXP2LKWygY0IVs6HjJRfCgQbS92bvXkwPvvJPw2dxHPjfL1h
	Q6YmTYDJfA1oeNWLA/juM8RrpwPpz5mCvQWetyZMg/4OGeWCTIyrmbaDT2QcP6OYBA4=
X-Gm-Gg: AYBFou0lXNJIOmM3ECC1aXcOei9ESa2EDboc3fbzcpf8Xs1uf4isohoRbC44ReqM4dH
	ZpkvwuVE8sq3iYeETU2lxKOfbuJBDNP93NqG1Tb6YU3OoBZB3Cl2EQhe6FR2HvwtLtBGu0EWNKT
	Ke1jK5/CdBCQMXgcQIaR1lB0pHPEl3QGkGonhkJDfCh71HCthEFGSf60WWk19JC28prdwRTnEu5
	7WX0yghz6srK11OiB9bGEVJMY5rJ6i9TYwc+knb3yFqL4KF+phw6ckrPFEeH/SKDVyHdEq5Oswl
	p7vExDwpQg3Zy/ih+kIsE9qFsoQ2U1EqvBFreQv6CwMxSuj6erxEihE1rmjboxx5musLdztlYjX
	fbeI3qyC80lIybtion2AcSlboeuvKV4jY4vIdc3Z8Bfd9em7ZvfDGEte37wINmoV01Mv23u7YbK
	DMZeS31RM390pqUoX+VSR1RUtS8e+2nhKV3RRsW6eZKB3fc75KDkLF67Bzl321zkzVWD0=
X-Received: by 2002:a05:600c:1e0f:b0:4a1:8469:e6c8 with SMTP id 5b1f17b1804b1-4a18e46f48fmr318687275e9.1.1791984580574;
        Wed, 14 Oct 2026 06:29:40 -0700 (PDT)
Received: from localhost ([2001:1ae9:6037:1b01:4005:7ef3:2241:3a83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bd1843sm12096212f8f.56.2026.10.14.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:29:40 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Thorsten Blum <blum@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Hans Peter Anvin <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v2 1/3] x86/tsc: Replace magic constants with xxx_PER_SEC
Date: Wed, 14 Oct 2026 15:29:30 +0200
Message-ID: <20261014132932.1495303-2-ptesarik@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014132932.1495303-1-ptesarik@suse.com>
References: <20261014132932.1495303-1-ptesarik@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it clear that these constants refer to the conversion between seconds
and milliseconds or nanoseconds.

Use TICK_NSEC instead of (NSEC_PER_SEC / HZ). Although the former rounds
differently (to the nearest integer), it makes no actual difference for any
supported value of HZ (100, 250, 300, 1000).

No functional change intended.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 arch/x86/kernel/tsc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 723347e2cf7f8..7adab8b614336 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -253,7 +253,7 @@ noinstr u64 native_sched_clock(void)
 	 */
 
 	/* No locking but a rare wrong value is not a big deal: */
-	return (jiffies_64 - INITIAL_JIFFIES) * (1000000000 / HZ);
+	return (jiffies_64 - INITIAL_JIFFIES) * TICK_NSEC;
 }
 
 /*
@@ -401,11 +401,11 @@ static unsigned long calc_pmtimer_ref(u64 deltatsc, u64 pm1, u64 pm2)
 }
 
 #define CAL_MS		10
-#define CAL_LATCH	(PIT_TICK_RATE / (1000 / CAL_MS))
+#define CAL_LATCH	(PIT_TICK_RATE / (MSEC_PER_SEC / CAL_MS))
 #define CAL_PIT_LOOPS	1000
 
 #define CAL2_MS		50
-#define CAL2_LATCH	(PIT_TICK_RATE / (1000 / CAL2_MS))
+#define CAL2_LATCH	(PIT_TICK_RATE / (MSEC_PER_SEC / CAL2_MS))
 #define CAL2_PIT_LOOPS	5000
 
 
@@ -552,7 +552,7 @@ static inline int pit_expect_msb(unsigned char val, u64 *tscp, unsigned long *de
  * more than 50ms on it.
  */
 #define MAX_QUICK_PIT_MS 50
-#define MAX_QUICK_PIT_ITERATIONS (MAX_QUICK_PIT_MS * PIT_TICK_RATE / 1000 / 256)
+#define MAX_QUICK_PIT_ITERATIONS (MAX_QUICK_PIT_MS * PIT_TICK_RATE / MSEC_PER_SEC / 256)
 
 static unsigned long quick_pit_calibrate(void)
 {
-- 
2.55.0

