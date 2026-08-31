Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA8F4078FA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180969; cv=none; b=f/RrEjJAYXyuzcgdo4RdGpVGdDu+spwpi83ulGpRP31C2yuG5kBU+pICMRIj9N+WOiSe10MFVa82Ls8fEQZTNH1Vw0j27e26nGQ5NP+grLPSRMIp7Q2l+GodndxdSzA5sXlClWKbSGNJa7Tkp9rIUWmLxZvANh+3HYdbU3dgKBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180969; c=relaxed/simple;
	bh=vqo1fTstjQ2cPevYsFrEYAoA+m0PR9U/HfWbbwRU5ys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXUFyDvCCIeBiz4iuKJV4qH8ZkTUdRvAqzQir+6zf2NjQuFsL4oXrQ4qGphpUPxSbhpwlp8VSdH5sZkySWRqJX7/CqApfWQ0pzad2hjI3iaS0PKoxzLreCfUl7iz9fxIrdgJPGgbey5ui9xu58cf1Tpy8dzn6qmcBFU/UjPZBwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qypGGpaw; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qypGGpaw"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398b3d66515so1976049a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180968; x=1788785768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NN6UX8SgchFyO1BOoLm/UThaPGREDiDtTXvCKVHtJ0U=;
        b=qypGGpawEIKNDdIt66SKfdb7ynh+xX41s9RQvJ9W+8ICdoJ8gHF7gjt7Dc6SzjT3bS
         OZcC3kJ2hLGh8sHwy2cpniIQ61fD1fSpfIaAKL+v3cx9Zz6EMbrg4+xiJuF7Y6X59pZ8
         Nm/VWNFbGmoN4kTwFXKafva0PXo0sdfHwJ4W+kHKR+NKaiuBV9KpeCWLnfQUBJttHskY
         +qyaCd0Z8IH3ZDJxBouhHYlymCBCafEpgOJfXyKbbBy3ZuEpyEaCaNl470dwzFyNr1el
         V8ZaBeMk153EeR0qZw1LvweEMRLqJAoYkiL5QVDjx2tlAN27swpNXpQi+fHukm0bzV4i
         eQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180968; x=1788785768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NN6UX8SgchFyO1BOoLm/UThaPGREDiDtTXvCKVHtJ0U=;
        b=TSSjZqqGfAwS273sL2NUGxoi6B8KvSiRsYoez+uzpFVgFAQf5C0JJERfl5DTJ0ylfO
         iLV4wI4DFe2ZKfB1e6ognXUyzbQWaHchGfHrZcr3I04S7R9xTDnsR+TZS4nD/5VKIUh1
         CfdqUQ7/Dzv6IT5StNJI4611lwKXKxHxygrXZ8YmgJspEpytdOeaufbpr8qNyyhziZCy
         a8358pPlKZ9CDE9hqQMNuS7cq0BZhtlTvTNOLRNPcyGCJbRTD4OJSvdhfvU3DHQwUaye
         enYOlaRZzD/moqCLx96yEuwJLaJD0aJn8GxQ1WnKENU0pqw8ShIQ6mCHUR+LAjhqimdD
         hBrA==
X-Forwarded-Encrypted: i=1; AKwUvBwVSMCrzbNfGFGvJRHs27SR86KLAXIKj5aLifQaLU2JPJxOgB74uJ0ilypJzx020Z9f7vloKFgnXgMQCdA=@vger.kernel.org
X-Gm-Message-State: AFuF++mGqAhU66+p8eimXgzsJOWRgDvMiLnv9cdcVjcY5PLShyVAW8Qx
	H75a4nPPMTHmUPtBglgVttv9ksA+nim9cMhj0pJA7ofOS1gSFJ9vNxSq
X-Gm-Gg: AYBFou3gSH6xya+T2S5awSo0QG8BtQ3vjn4F20NJSMpcyr6Ix7H8ESCcPqargoPBrsB
	kn3sd0SdDyFh83E6DuF4aj04UoJt4i6hJTg1YLyvuZw1ElcRgzTQRcfNbbqRfWyLwPcxSW+p/9h
	/XJXgC/BRN4ZI3hoBs0N/IFOAXqCOR2sC4ddhqPVUzpoF7os4fQcM0Ih1JwDs7OVEArJXQFoLNR
	LTKeOasMSHx3ffXjiHtt2Ov42I88alNKZ6B/uvJXTwCS9HGnLSU2SWyegVQGx6emQZCqUYCHZTc
	hjj4iXsFQMaSYcnzzOWa24oL9ekhNUBHZHT3LeYxLBJqf+xYJNrZ+gWqhF3oCui2HFwQ3+86iGG
	tZYmOJ7gV9U8BmSexy12Nu4hm9AKEhwmwxXr4FrbmqomByVHEjqbtCvCxC4Dlh+/P+VeI0J86vH
	DXw2vvD1RQWCiUlk308zuS9k3CIxJFDVWU2wDAbhqWUle79WUwi01wmcxe2SErEpfQEMFQ8NVs
X-Received: by 2002:a17:90a:e7cf:b0:38f:dec8:f7e9 with SMTP id 98e67ed59e1d1-396d0fccec0mr37935649a91.12.1788180967550;
        Mon, 31 Aug 2026 05:56:07 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d776d0dcsm5645997a91.4.2026.08.31.05.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:56:07 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com
Cc: thomas.weissschuh@linutronix.de,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 1/3] vdso/math64: Add and use __iter_div64_u64_rem()
Date: Mon, 31 Aug 2026 20:55:55 +0800
Message-ID: <20260831125557.1490398-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831125557.1490398-1-zhanxusheng@xiaomi.com>
References: <20260831125557.1490398-1-zhanxusheng@xiaomi.com>
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
turning the loop into a division, and use it for both.

No functional change.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/vdso/math64.h  | 21 +++++++++++++++++++++
 kernel/time/vsyscall.c | 17 ++++++-----------
 2 files changed, 27 insertions(+), 11 deletions(-)

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
index aa59919b8f2c..165ad9d7f154 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -30,21 +30,21 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 {
 	struct vdso_clock *vc = vdata->clock_data;
 	struct vdso_timestamp *vdso_ts;
-	u64 nsec, sec;
+	u64 nsec_per_sec, nsec, sec;
 
 	fill_clock_configuration(&vc[CS_HRES_COARSE],	&tk->tkr_mono);
 	fill_clock_configuration(&vc[CS_RAW],		&tk->tkr_raw);
 
+	/* One second in the scaled nanoseconds of tkr_mono */
+	nsec_per_sec = (u64)NSEC_PER_SEC << tk->tkr_mono.shift;
+
 	/* CLOCK_MONOTONIC */
 	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC];
 	vdso_ts->sec	= tk->xtime_sec + tk->wall_to_monotonic.tv_sec;
 
 	nsec = tk->tkr_mono.xtime_nsec;
 	nsec += ((u64)tk->wall_to_monotonic.tv_nsec << tk->tkr_mono.shift);
-	while (nsec >= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
-		nsec -= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
-		vdso_ts->sec++;
-	}
+	vdso_ts->sec	+= __iter_div64_u64_rem(nsec, nsec_per_sec, &nsec);
 	vdso_ts->nsec	= nsec;
 
 	/* Copy MONOTONIC time for BOOTTIME */
@@ -55,12 +55,7 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 
 	/* CLOCK_BOOTTIME */
 	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
-	vdso_ts->sec	= sec;
-
-	while (nsec >= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
-		nsec -= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
-		vdso_ts->sec++;
-	}
+	vdso_ts->sec	= sec + __iter_div64_u64_rem(nsec, nsec_per_sec, &nsec);
 	vdso_ts->nsec	= nsec;
 
 	/* CLOCK_MONOTONIC_RAW */
-- 
2.43.0

