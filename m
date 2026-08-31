Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22D740A92E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180973; cv=none; b=bASiN6aewb2YsBnmYIhGaMqGGpqu6rQtpQvH+Kk9r9ZwNvj7oft+EKcs9BuWoUCtZB/Bv9DgZb8sLToyNO0AcQraeRjPWV67lN3TB5tRTFUgUORewj/Qd6TWgI4IKckQunAx7wWKWnvGt0L0u7l6617L2Tf1wICqBj8zPSJ2MZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180973; c=relaxed/simple;
	bh=vMk5Gst64mIB1v2cQOjLobgDxm5sx5Wt53K2CpdA30s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQjtIoH9+f4PdPvUACnLSOeIX9k3+px+OsDq0HJuvOcIb7kT/Z2W9X4mFSLKMfh4uxezK8SWUWGyVrWddJNVbvhwca6Ib7wWYcRUeS8X75ityldOQaYOFHqeI7xvD+e3ZEokHthqnJl26bDikQFpY8fB3AWJ8Du2cZrm0cXKWnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PL375YkJ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PL375YkJ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca12086c06eso2741559a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180971; x=1788785771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0axMxz8oadXve+GEcfT74nt0vh3LGcycmiqTGP+1WU=;
        b=PL375YkJI1XWHPeo0jev7i0Tfh/Q7MKFXEEY417Yk2kN1VzVXhkEsFLoOjWdG301tB
         sAk5s/uY4sSkgjHdlEfNG5ir910t5HLF/3XNjbpikUE7YkJfMLVYP5wlI7dhod6NtNQI
         WnUZ3Epnb9KxhAIwKNz+ZiRoASkEBqkeMx0JkSUJw1oLbz3uoFsVSxlzT1M6BwASa8DW
         MYuouhe70Q26ZY+AAuizp1IEr7/xkC32p2k8Kx1tKAQjATBKpZOmfe33pOiiAMglwP23
         7UmXzuEjpouw6Eq8D2QMIVS1cFCOAYr7kmoOrsz4cPV0nsIkDIbBsAeWoiybfn8td6/h
         GT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180971; x=1788785771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0axMxz8oadXve+GEcfT74nt0vh3LGcycmiqTGP+1WU=;
        b=WwsrojYE0F7U02Uh/W152H01b5FMwMgPP1fFmzraPtFQ8cuzD67bUdehbrPLHD3bKG
         92+IImNZKYhyGIi19bZFX/DdUf6Iaq0BWxNetYfY2RwV6ehdp8aWDcmaQH/ai6B5lWF1
         R11MltngSwVuplhRH011Kwnk8tqFVEK6t0FFuPpRa+IIvPCEsNKdzb5fWx9igZvG2qYV
         iubDw0+E7sMjWx6zZgsENwqLULmAHKf6oR3NnDpF6ZK7BpifxLt8BL9NyMh0ERspx43G
         JMSizRoTnOHjagO7eqtvM9hO5pk8+7cAFjHvK74NAAGNu3JBML6oLc5bWrjNTnuRAVTc
         6DLA==
X-Forwarded-Encrypted: i=1; AKwUvBxwadCHnrY3L9h30MUVUnaz37N3VhrJ1w3tjY3OKEgyPPFAN9e8KACdLXfeaWVnk2azbbDY/+iUdp0gG7I=@vger.kernel.org
X-Gm-Message-State: AFuF++nV2eXvbEC81ieFGHi1tT1bvYgYQWudNVKwQ4fXlPpkYuhwo3/g
	DFVMyc0Vzh1oHOOPMmvfZat/BVRQNRkQZK+IpnqF38ADqC6Y1fwwqpFq
X-Gm-Gg: AYBFou3FAe7LBAdbNXV/M/p4P3H5BlHKR7u/8oXXHk8f3S4fGUQTY8VjUTVt/dW+CWA
	MzO650IEl5Rt12C+1PaHSjRfT2NmA46T9nT488E7MYbVHbnrd2+oxgNkTmkh7EsfHveYZnwGmOs
	udnqatHQSupUnciAjIIhXyjjRBwcS9+9duWFMgoUUF/11EnMmrv8S9nQ/eiOLRmtKqgl1Hg16pw
	+IQ7rFJfoP3A6mRqhjDdN0WEGNLkcTy9KQhRPKy5jg6rig9mmGIbplm57nxUszlJgY3xvK47EGw
	kS7pPh9KIOJeANlfcjCMbqHqKenAu1XFmnHMFL7rpUqVNNcmLYezKODAJrDAw0MwfI5f9XPYgEV
	gYUhF3duPHCFRwmTIvKSI43CnVUBs1OmRbI7bOqEuRUGrDrqyTRcLL2Em5nSUeoDEr0EIJZh4bh
	Xllngo042LVJpXDla6SeYaRUTAeINapL50ro91rJb3D0vgCSf/3Kap1vqfx6PBT9fv3MXELwFR
X-Received: by 2002:a17:90b:4a90:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-396d0f8e9f9mr38159479a91.11.1788180970839;
        Mon, 31 Aug 2026 05:56:10 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d776d0dcsm5645997a91.4.2026.08.31.05.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:56:10 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com
Cc: thomas.weissschuh@linutronix.de,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 2/3] vdso/vsyscall: Keep the CLOCK_AUX base scaled
Date: Mon, 31 Aug 2026 20:55:56 +0800
Message-ID: <20260831125557.1490398-3-zhanxusheng@xiaomi.com>
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

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 kernel/time/vsyscall.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 165ad9d7f154..ab3ef1e7d3c8 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -137,8 +137,8 @@ void vdso_time_update_aux(struct timekeeper *tk)
 	struct vdso_time_data *vdata = vdso_k_time_data;
 	struct vdso_timestamp *vdso_ts;
 	struct vdso_clock *vc;
+	u64 nsec_per_sec, nsec;
 	s32 clock_mode;
-	u64 nsec;
 
 	vc = &vdata->aux_clock_data[tk->id - TIMEKEEPER_AUX_FIRST];
 	vdso_ts = &vc->basetime[VDSO_BASE_AUX];
@@ -156,10 +156,11 @@ void vdso_time_update_aux(struct timekeeper *tk)
 
 		vdso_ts->sec = tk->xtime_sec + tk->monotonic_to_aux.tv_sec;
 
-		nsec = tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
-		nsec += tk->monotonic_to_aux.tv_nsec;
-		vdso_ts->sec += __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
-		nsec = nsec << tk->tkr_mono.shift;
+		nsec_per_sec = (u64)NSEC_PER_SEC << tk->tkr_mono.shift;
+
+		nsec = tk->tkr_mono.xtime_nsec;
+		nsec += (u64)tk->monotonic_to_aux.tv_nsec << tk->tkr_mono.shift;
+		vdso_ts->sec += __iter_div64_u64_rem(nsec, nsec_per_sec, &nsec);
 		vdso_ts->nsec = nsec;
 	}
 
-- 
2.43.0

