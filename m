Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B610C414412;
	Thu, 15 Oct 2026 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078662; cv=none; b=jDE5QZQZdk+1xms7/Re58TxIoAK/dCEmq2BL9TcTQyMwEXMTbNUzUA4nFf4Mzo5t11sziYISpiaFkaOjRQCTRg3ZbuHvCjEy2d2V0SqTQPojptVLnfP3/BMLKF/HgX6f6gq9FxPEByQUMd4EpoVkySwHS6zSORL7+xkyzgXabWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078662; c=relaxed/simple;
	bh=AlTeFXGJ4R/kRuJSMT3BEwMaKUnG/KNnS+cBy2e33VQ=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=q5I1YBRayeJtFQXTTs1dhf3xZt4k8GMkiH9gyOWN+79umNFv1Sz3lzo3cKLRxAp+gnmgkmrbVcUJDFOGK4p53xFDbYxMeyUJbm8Xc02Hpvi2ssNe0hadmjN9ZsB0JmcPuj+hWagydZ0AQ16ylAbqzCFHrWwQbpfM09yMYW4EqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W7h/k2zc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qPn/ICju; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W7h/k2zc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qPn/ICju"
Date: Thu, 15 Oct 2026 15:37:28 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078649;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vPNP4mVTHfX9o/OP+DpKNyMQdK1AiDSBwCTNZ+GX4A=;
	b=W7h/k2zc2jtXAXzXT2u3hcNegaa/rqOI8J7IIXuqJoED7A/X90/ZopFovx1DI+r5bDjxql
	REztpR/Vje7Fg9dPC5H/Aspy7wADOhD/JMLGEwZhE3KNTaK4K6Ldc7cFvnHsezwjBhqr/R
	C7yTe6rSTTwYjxeHT93Yd+PUWnlOcNbqckT/KAoqXUPgB4hwl1z+jsyU+8FUtmqMQn5lBE
	cqNjXzrO7Xm94wYYc5T2VH1J0EJXzpSOlqLEMy0QbxRR4rxJuFYnXb0umZImUs4H77SztW
	BIeuwhFK1qsOOFV5LL8SIWSYi5uNanPAHQczBhgAcfCVNMVLR4/NHNBeOa0uXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078649;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vPNP4mVTHfX9o/OP+DpKNyMQdK1AiDSBwCTNZ+GX4A=;
	b=qPn/ICjuZQ+1gTZp6bmNLJIJMvQLPyJ0RPB5LPvfteOv8m3Lg1IHRHd+L5+4bA8XhXvnnF
	1Q/hO3JNdK+jUCBQ==
From: "tip-bot2 for Zhan Xusheng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso/vsyscall: Keep the CLOCK_AUX base scaled
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>, Thomas Gleixner <tglx@kernel.org>,
 thomas.weissschuh@linutronix.de, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261002153104.1347978-4-zhanxusheng@xiaomi.com>
References: <20261002153104.1347978-4-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207864805.2666988.2571712675011360941.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     8d17190fae2caab89cd5df19257ed9dac0739e3b
Gitweb:        https://git.kernel.org/tip/8d17190fae2caab89cd5df19257ed9dac07=
39e3b
Author:        Zhan Xusheng <zhanxusheng1024@gmail.com>
AuthorDate:    Fri, 02 Oct 2026 23:31:01 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:20 +02:00

vdso/vsyscall: Keep the CLOCK_AUX base scaled

The vDSO basetime of a clock is stored in the scaled nanoseconds of
tkr_mono, so that the reader can floor the base and the cycle delta
together in vdso_calc_ns().

vdso_time_update_aux() instead shifts the base down to nanoseconds, adds
the offset, and shifts it back up, which zeroes the fractional nanoseconds
of xtime_nsec.  The reader then floors the base and the delta separately:

  ktime_get_aux():  base + ((delta * mult + xtime_nsec) >> shift)
  vdso:             base + (xtime_nsec >> shift)
                         + ((delta * mult) >> shift)

Since floor(a) + floor(b) <=3D floor(a + b), the vDSO reports 0 or 1 ns
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

Fixes: 380b84e168e5 ("vdso/vsyscall: Update auxiliary clock data in the datap=
age")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Link: https://patch.msgid.link/20261002153104.1347978-4-zhanxusheng@xiaomi.com
---
 kernel/time/vsyscall.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index bd57c54..658553f 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -168,11 +168,11 @@ void vdso_time_update_aux(struct timekeeper *tk)
=20
 		vdso_ts->sec =3D tk->xtime_sec + tk->monotonic_to_aux.tv_sec;
=20
-		nsec =3D tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
-		nsec +=3D tk->monotonic_to_aux.tv_nsec;
-		vdso_ts->sec +=3D __iter_div_u64_rem(nsec, NSEC_PER_SEC, &nsec);
-		nsec =3D nsec << tk->tkr_mono.shift;
-		vdso_ts->nsec =3D nsec;
+		nsec =3D tk->tkr_mono.xtime_nsec;
+		nsec +=3D (u64)tk->monotonic_to_aux.tv_nsec << tk->tkr_mono.shift;
+		vdso_ts->sec +=3D __iter_div64_u64_rem(nsec,
+						     (u64)NSEC_PER_SEC << tk->tkr_mono.shift,
+						     &vdso_ts->nsec);
 	}
=20
 	__arch_update_vdso_clock(vc);
