Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905734A1DFD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186672; cv=none; b=s+7kLDisocW83k94KjnA2S7OJXBtjYNIPADGnejfkEvBRP4fnHHAHzPOt0Y8GvoIOUOedVj99+VPO7hlnw+uZZFEOi39tqyPvZhy/CiGcjL3FrZeOqUVHoeKzQYMo0La9JeyylNEoUtFoqtaszTR9IgTQ9IBqQyK5oOgHyJ3NxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186672; c=relaxed/simple;
	bh=YZbKszZy3ChYxt2JVB23rZ6z1qPmN9Q7oTKWBYYDYYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AL5HumrEHzdU7gn1Kn3tQ/e9RJOBablyoDD/lh2gn4jRktvy+3tOz6YNBL6iqqUmzCOG6Seq3E+wsNkpPiaBjE/92TBZvIPEsTwHicuEyJv/AS/VJ9WLuT5RQAqaqhJzOEJVU63BsDB3oxwZAhKezGVkDHFQlXPDZH4wp85Uybs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKu4NVgZ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKu4NVgZ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-852c481415fso4345474b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186671; x=1788791471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPh9WrfgsA1BT7kCoB0rFWY5ZOMllfKrUZerjtmx/jo=;
        b=ZKu4NVgZ9mp6p4aQxJcXA8vX87Fu4bQWJ6rOAjrs63J0tXMlOhABmk9lGrhYn0+Dje
         aRONWr9K2sQPyDq7uniLV7XPc/5irsQ0Ybf/fXERLgrG72vXsyX+8Nx0DsjQppPxTZZj
         5qRR6agSA9+VCHHxUQLYHX6ibHvkuLP0uCOgiUdQLda8uEianvq0WZ/YGxYLdEd2f5ee
         2GYeAOmDw8C9otcuheK4XcqCHyDsfuB4L7JJqfWt5i0weNwE6BExPicsk1UgOeW9UfZr
         lZA/INHg2YbpkCMKhMXZX6Ro105dIK5jIdxF16jVZ4OdhFErmlMoeaDiTukMGjtT6vCo
         ZVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186671; x=1788791471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPh9WrfgsA1BT7kCoB0rFWY5ZOMllfKrUZerjtmx/jo=;
        b=AXYW8zXl9HYxHJM9pvnx45oFuOceGnqEsFrx79wLfl3QigoNaScWUP3KKsSW7oGDx/
         wBBVuRXBjiEjyLU5Op4yUH2RFhCkQaihDY1ouj9wJOMgeCtrbDJBEmN3utOKTxVeAIl/
         6kmCMdOiDhH1i7NEGtyez1lQPH58vM31SyWT02f3TUuMVoifnIlW1WLOgWIjZiMtwYy3
         ZJUu2+hJuS/eLMIf9J7+Qgp9GJTPncNGiht9MzdFkfUtN5K62ixs8KHwV3vh46hkpn2O
         LjGPSiTylcnVhP1964cFjYEpyaq3dEwjYx4xPSj3hAOx4RpZ1Bs1Wc9s/s11EgN/ko0J
         G14A==
X-Forwarded-Encrypted: i=1; AHgh+RrplTmsR45fByBdxE4GT6S1g6vLelfuhFcqbeDLfJMRgU+Ez+FiQZixuhxWpXiMjJ2ACHaN1Jix7qeswQI=@vger.kernel.org
X-Gm-Message-State: AFuF++ndCtD4bLnxN61gEl/NZcIr3zngqAVeAiPawCPD8mpT4q6jzQta
	Ad01Z9FiOghjnoPDMXAplFMNilzlbEqdQ8bzwTwZvOL/fWI5kQuK9YT9
X-Gm-Gg: AR+sD119sc2pQNPoVEiUukBDz022uV8Isz5CwmuUegEGc8CU7GV/But0wGgQl/6wIJN
	3m8h8S0X0X0uoJqOiURhS9NdHH/Gkhg9YJpKaLpw/8NMaoNJDVRctX4EzVOSJCwoJYktyrdA82T
	oPhO+71Mz8tFw6XTYNCLhzAJFAktvXCU+mhSJp0If4FCDLPRGuKdThYInfxUlriGofEEjYzvqQ9
	4jovJNXYJfXkWIBmEIzrzF7ZJJUypiNrVa4x6v6XzdpmgIJf7QiyQ+kVwqIQEtHNVZseM9DTV1x
	IkseRgzd0COwGPDT7Spg9aL43a2FQx5Vp/W4NIRI732mE8LK/Eyr712MZodfSWxtWB6yMjj7vrI
	BB/i9YVOdP/qTAbbT6cBlRg9+mQaqH51IGamycq1AE+OxtU2+ve8mwHIhQH1SwZq59GbmTaqyaa
	eepwU8aqGv2yy9OksWlbu/128KiIP8TAGxQfxn1rOltoyTc+5JrkuGozJ42GLXQA0ERgqZyLKe
X-Received: by 2002:a05:6a20:3c90:b0:3d2:2011:d184 with SMTP id adf61e73a8af0-3d2681aa109mr41291931637.14.1788186670767;
        Mon, 31 Aug 2026 07:31:10 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm4248961a12.10.2026.08.31.07.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:31:10 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com
Cc: thomas.weissschuh@linutronix.de,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v2 1/3] vdso/math64: Add and use __iter_div64_u64_rem()
Date: Mon, 31 Aug 2026 22:30:57 +0800
Message-ID: <20260831143059.1592875-2-zhanxusheng@xiaomi.com>
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

The vDSO basetimes for CLOCK_MONOTONIC and CLOCK_BOOTTIME are kept in the
scaled nanoseconds of tkr_mono, so normalising them means dividing by
NSEC_PER_SEC << shift, which does not fit the u32 divisor of
__iter_div_u64_rem().

update_vdso_time_data() therefore open-codes the iterative division twice.
Turning the loops into a plain modulo is not an option either, as the vDSO
has no 64-bit division helpers on 32-bit.

Add __iter_div64_u64_rem(), the u64-divisor counterpart of
__iter_div_u64_rem(), keeping the asm() barrier that stops the compiler
turning the loop into a division, and use it for both.  The remainder goes
straight into the basetime as the coarse clocks already do, which also
makes the copy of the CLOCK_MONOTONIC values for CLOCK_BOOTTIME take both
of them from the same place.

No functional change.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/vdso/math64.h  | 21 +++++++++++++++++++++
 kernel/time/vsyscall.c | 18 +++++++-----------
 2 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index 22ae212f8b28..eb39d3411981 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -21,6 +21,27 @@ __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
 	return ret;
 }
 
+static __always_inline u64
+__iter_div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
+{
+	u64 ret = 0;
+
+	while (dividend >= divisor) {
+		/*
+		 * Prevent the compiler from optimising this loop into a
+		 * modulo operation.
+		 */
+		asm("" : "+rm"(dividend));
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

