Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8901352ED50;
	Tue, 29 Sep 2026 19:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710074; cv=none; b=JAmNWWRCBm9ilyt1JiISkbKxyDqHOiffqldQ7ozSYYzRCQ44Vfzsxp+hFxhV2Cc5rzjg8PBNwtTfJIBX+eH2ivv+xxQBxag8CjU2bu/JyQoDQc68ldfLN6A4uP+ulVF8JDnDGtvGmR/cO/kZqZ7ggR3pB/R6RUi8ZYf1jDLZJJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710074; c=relaxed/simple;
	bh=RbcBtwOnEhzokoKRRbemXaAdFcgZ7iGlAiPKPzchOjk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=pbWDwjeKL4EdE5M/wwPOddzWy5V+IjqICpXvlbzZ1cwjaWb3BQVqsn8k/RzmTp7VPNEdSW/vqu+RJ6qSH0oqACEIcBDYj2/HNZwUldqH+VDY6JlQhIC5VfmZn01TIENCChZ5SwtMdu9sdHmkPqdfRDNNTh5YOaT5lCP8qeGFk4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ThjiQy24; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8UbdnBFG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ThjiQy24";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8UbdnBFG"
Date: Tue, 29 Sep 2026 19:27:49 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790710070;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6MY4RfNS5nUrnJF2kPhUb2n3AznYkVX3MlcxC/b9BQ=;
	b=ThjiQy2448Pg6DifiLVTsI3OY22abOcPuvMjqfyFiWg1C69/WzMWTvnc2+pbaNakLLZMQS
	Hfp19e9sYn/RrYIEdcWBQEsfvdiYnUqHWhmVzFfbCfkzDOQvG1PB1s5yV+2B2tsfLT/+qE
	pDZKpDAplHJd1uaKDOwg0IRYhUdKjcBc3Z86OrspOmSOTX+OZ6q8CQTiTfTYW0KrYcRVd/
	FVJc6Dvm/3e2QKU42VIb3Op+oTby3gEflO34QrmbI30/ma+SUwaQhG6ZXSe6bgllWR043V
	WvGs8QhTKvj8eJeHhT+399NoH/XHpe/HeCTCoyRtHwUAFgZoRpRBRv8sKriPMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790710070;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B6MY4RfNS5nUrnJF2kPhUb2n3AznYkVX3MlcxC/b9BQ=;
	b=8UbdnBFGr0Ft7mAdt+Elvqcjng59ncDNQQJBoYX8B7RYWBkFPWZufGNOq7i8K28Mt+p/du
	pu0zfA4HurPJzrBw==
From: "tip-bot2 for Zhan Xusheng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso/vsyscall: Keep the CLOCK_AUX base scaled
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>, Thomas Gleixner <tglx@kernel.org>,
 thomas.weissschuh@linutronix.de, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916023252.418473-4-zhanxusheng@xiaomi.com>
References: <20260916023252.418473-4-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179071006918.3910103.2026020818143166877.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     4e6aa9d672875aaa20cfb64ffb6fcd79e5165522
Gitweb:        https://git.kernel.org/tip/4e6aa9d672875aaa20cfb64ffb6fcd79e51=
65522
Author:        Zhan Xusheng <zhanxusheng1024@gmail.com>
AuthorDate:    Wed, 16 Sep 2026 10:32:51 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:23:30 +02:00

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
Link: https://patch.msgid.link/20260916023252.418473-4-zhanxusheng@xiaomi.com
---
 kernel/time/vsyscall.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index f43dd3f..0e4b499 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -155,11 +155,11 @@ void vdso_time_update_aux(struct timekeeper *tk)
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
