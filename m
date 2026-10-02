Received: from mail-pz2-f36.google.com (mail-pz2-f36.google.com [74.125.228.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51C14AEBC6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955090; cv=none; b=Er1bzXA5GaAQ1kBOdR5M0fHFBZSdJ1RU79sBGqcZHXH/MibJuiriqXIo7vmwK4LQzhLbNYWFKMjuq4gdwTH0UsHSjkVO7VSGCF5+7e3kMkwMK5KqzhZyi++7tMyJTLW7+xBeTXa4pTfBlXd242WytnsUPiNQ2y0QVZftladTMps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955090; c=relaxed/simple;
	bh=3ySdLyS5zZGCiIjzqgAsFdAtt7LbEXrGcZYnL60E0Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I+Kgeqw17hSfJx5Q/k61+uGqNi5EWlW76R189xlXCP2j3Sh1MPsh9wVhik5ZODk/UBFoEeAXidZcsj1knkajOu6xrzCtupmW2sd0TEhlZkKd1M5Eu2hN6PHtOUFdyew+lcXdve7UnIbt8/om6GlQSgviwvxtYAb/mSE5eTyuqcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpBaQ/Er; arc=none smtp.client-ip=74.125.228.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpBaQ/Er"
Received: by mail-pz2-f36.google.com with SMTP id 41be03b00d2f7-cc7e7717675so1387482a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790955088; x=1791559888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MSLiQOzB3qV862TBu5G2ri78NZBVMPVqnDaJImAF/+Q=;
        b=jpBaQ/ErQy5PDBJ8lV62erp1LNnhrD6kXoG/RXkQ9ShKg8+qRwJPF12VYF6n5opeWL
         qRk9zlfg+VZjTtImjwGyKuhPfY1O0JoBn2etmYnkS+GiLYBb6+h0qFesU2iqhbkbLrHr
         VI6yRLYlwsYdLriU2iGJ9dmWFbGr8V4UBv+/gdI6dJUIiXtZTRQTbTXP+0uMlNAtDdCL
         68xlP1BVRIQM2zpidLpEmIRM5E/tfVb53OQSK3j7/pgKlWsWFR6GO5SZLaBcHvszNTQW
         I7b2AoVNW6Hz33AdUyW14i/7teY3AVzJ+gqUPjGJbwmHlS5YjcMxNdhUC0c4hZ1Au1/j
         eYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955088; x=1791559888;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSLiQOzB3qV862TBu5G2ri78NZBVMPVqnDaJImAF/+Q=;
        b=zi708E0XCEFVhBulcaWMSj0ZaAQhbBoNd1xqBfOStGFm2xXF5ffDhsLB5/N6lhLcqY
         bempd7ptIcreX+Pp2cmjiy11DLCKYFsP2XoqNneNYEsnTF5mVreS6H4PYADKjXJ5e9f6
         8oJb3Sx0TUQ7p2nhUCEuAtEf51QuP2kEtXi4khofHhn1/26ydg9WZhB7dVs2kWJSqmxo
         sU9Rts4nDqfDYC9JL/17Wq/r6VdkwkG+C/z6mYfjRnKhOG2+jk75bKDvR3/camOUUXvq
         Y4uF12b9qTnAUERkFqL16JTyCr+T/qAuVLqnLj9VIdocBvPLMk5vVJ+TabSAbuhjFHLR
         AeaA==
X-Forwarded-Encrypted: i=1; AKwUvBwjZqyZ6npAz4268AefH9NpyqwP4dTnCCluG5Ka4SUrEfLSnLevTuDeHQ4YsQad2rXisSlujOwzoDPbQXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLt8w5AMI2++e6MdMqWxia1EspPtU49awJlTGbYYNt7uLdSZPpP
	Uhskzjdhei8GHmekdhunRULaDgOCml/mOS9XPg7xvfy1HFd4+9L6HH7f
X-Gm-Gg: AYBFou0JqwMucPy7mDhqMawcgxk3xBqBLr8rfEt/AgP+zfWaFLDq3KNlDWDc41TXI98
	wq/MqsuMIjWllz9pqdZVioA80kjSWe33WCo1Xcr+PLwYSTXyFNpzS1kf1n13LWIix/ZeRs8zLVw
	y00ba/d89LuSFBM898bvgFdmUst1V48xyXKEaOdZE6u84yFz5vi4w2jdLNB7styh5NBS7YN/J34
	TtvBTunlaM0MkztWoQv+74WcucGcyKPo4imS3lNWd3pZAh6VeUhaeiULZnNfP1TE00IjD4Rl2U4
	iMbwEnB3IFZkalJOupOfqXDQi6EnQAvrYBMI58WBjPR9myCVjBayB4VZEpj9U/JqyokjufWEwJ1
	bMzWfdFajnH19yaetx/pxHIuNMMhD7mUO58ycLz2CwoTmpXW2ZPrFHFdHARGh1E1Rx8IKN0BTZG
	xW/dl92OCElzTN/K9qI0N0LO3yRoo1hcAw9hkPn7IcXOKfPsysAwQ1j4N50gqh2GZ9Wwq+OFYYI
	IqK478AnW0=
X-Received: by 2002:a17:90b:1806:b0:3a6:c8f0:c3ca with SMTP id 98e67ed59e1d1-3a6f27d1de1mr1688789a91.47.1790955087587;
        Fri, 02 Oct 2026 08:31:27 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6fc716b5esm1649468a91.14.2026.10.02.08.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:31:27 -0700 (PDT)
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
Subject: [PATCH v7 2/5] vdso/math64: Add and use __iter_div64_u64_rem()
Date: Fri,  2 Oct 2026 23:31:00 +0800
Message-ID: <20261002153104.1347978-3-zhanxusheng@xiaomi.com>
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
index 3c08909e742b..6f1e311cfdbd 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -24,6 +24,26 @@ static __always_inline u32 __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *re
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

