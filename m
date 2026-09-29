Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCBC568FAE;
	Tue, 29 Sep 2026 19:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710075; cv=none; b=EBVd5Z2Trwgw1BZ+VR7+gf3rBvlwmg/zDBfKvRrR43Ui8hwsCXf0z6xuXvcz4ePgQb35jcoG54e4XX00D2/63OcD2qvHSJD55HDXvVCX7FYnfqcdAaXaXbARNP0xMzYpAA4OuEovbPXhusbSdVu0jBfyF1c7gQtlRUTrl3HRer4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710075; c=relaxed/simple;
	bh=REGXdFQKzOCTphZgJJueJvHOJ2Kfq36lkeMTG7DfMLU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=rtwqhSXh4RgC+ut3dafGcw6MhTqupop0cDoq+ywwe3dXtHE/S1TvctNahbkVmJNCIfvnxmvfbeF9uRG4CvZmKrgXB2pZGm4uc32MxT1AxxaGCN+qINd4JebhBqHGNujgHG7kMg9mZmXjLVDG0B5S2zO+HRcBgqfivViBMX41gP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CAdwxrhf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/fEZgD3A; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CAdwxrhf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/fEZgD3A"
Date: Tue, 29 Sep 2026 19:27:50 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790710072;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThSZBDsCwoSTHmicrZkERAMLB/7qpI18IPVx5CKK+M8=;
	b=CAdwxrhfUSaTwwoh81htng5QCv8WqoZUyDLR/CJybEQHqRje4XzneySttjurkOozyOHaRV
	vjaQnMgL/l4AX+0878svcjuQL8ncAnfi9GiuQ/a/WRSDJgtptm/qzw8yl4rn0iZU+nJbxq
	yPjGkySFkvf/meOzJ73aYj5k6Xhn/RqNUhOOkW+wsY/J7YZoAS4ld8bzyiKgpfNU5GD67Y
	sn2QKAl6tBoC2L/pGCP+VWztCj8y2hGNwKuufeNxTOwKl16S1msTtoixiryt6Ems4eBg9V
	4maohKcHAy9G7+Q2OAmWD16vIGFbGzvX8nHVZ5Dgcec+q7u7Q3p+xapri5Qv+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790710072;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThSZBDsCwoSTHmicrZkERAMLB/7qpI18IPVx5CKK+M8=;
	b=/fEZgD3Ajup+55C1kgZnQj+oXwLTBLwq13esh7qtiBCazpIpM+YywLEpANxh7tcBTAMSsG
	HriiBgnjea3TT4Bg==
From: "tip-bot2 for Zhan Xusheng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso/math64: Add and use __iter_div64_u64_rem()
Cc: David Laight <david.laight.linux@gmail.com>,
 Zhan Xusheng <zhanxusheng@xiaomi.com>, Thomas Gleixner <tglx@kernel.org>,
 thomas.weissschuh@linutronix.de, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916023252.418473-3-zhanxusheng@xiaomi.com>
References: <20260916023252.418473-3-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179071007076.3910103.10413428784268163624.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     5c82c995b63748cfa5026f4ca813eee754263f62
Gitweb:        https://git.kernel.org/tip/5c82c995b63748cfa5026f4ca813eee7542=
63f62
Author:        Zhan Xusheng <zhanxusheng1024@gmail.com>
AuthorDate:    Wed, 16 Sep 2026 10:32:50 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:23:30 +02:00

vdso/math64: Add and use __iter_div64_u64_rem()

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
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Link: https://patch.msgid.link/20260916023252.418473-3-zhanxusheng@xiaomi.com
---
 include/vdso/math64.h  | 20 ++++++++++++++++++++
 kernel/time/vsyscall.c | 16 +++++-----------
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index c628d6c..55b45f5 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -22,6 +22,26 @@ static __always_inline u32 __iter_div_u64_rem(u64 dividend=
, u32 divisor, u64 *re
 	return ret;
 }
=20
+static __always_inline u32 __iter_div64_u64_rem(u64 dividend, u64 divisor, u=
64 *remainder)
+{
+	u32 ret =3D 0;
+
+	while (dividend >=3D divisor) {
+		/*
+		 * Prevent the compiler from optimising this loop into a
+		 * modulo operation.
+		 */
+		OPTIMIZER_HIDE_VAR(dividend);
+
+		dividend -=3D divisor;
+		ret++;
+	}
+
+	*remainder =3D dividend;
+
+	return ret;
+}
+
 #if defined(CONFIG_ARCH_SUPPORTS_INT128) && defined(__SIZEOF_INT128__)
=20
 #ifndef mul_u64_u32_add_u64_shr
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index aa59919..f43dd3f 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -41,14 +41,12 @@ static inline void update_vdso_time_data(struct vdso_time=
_data *vdata, struct ti
=20
 	nsec =3D tk->tkr_mono.xtime_nsec;
 	nsec +=3D ((u64)tk->wall_to_monotonic.tv_nsec << tk->tkr_mono.shift);
-	while (nsec >=3D (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
-		nsec -=3D (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
-		vdso_ts->sec++;
-	}
-	vdso_ts->nsec	=3D nsec;
+	vdso_ts->sec	+=3D __iter_div64_u64_rem(nsec, (u64)NSEC_PER_SEC << tk->tkr_m=
ono.shift,
+						&vdso_ts->nsec);
=20
 	/* Copy MONOTONIC time for BOOTTIME */
 	sec	=3D vdso_ts->sec;
+	nsec	=3D vdso_ts->nsec;
 	/* Add the boot offset */
 	sec	+=3D tk->monotonic_to_boot.tv_sec;
 	nsec	+=3D (u64)tk->monotonic_to_boot.tv_nsec << tk->tkr_mono.shift;
@@ -56,12 +54,8 @@ static inline void update_vdso_time_data(struct vdso_time_=
data *vdata, struct ti
 	/* CLOCK_BOOTTIME */
 	vdso_ts		=3D &vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
 	vdso_ts->sec	=3D sec;
-
-	while (nsec >=3D (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
-		nsec -=3D (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift);
-		vdso_ts->sec++;
-	}
-	vdso_ts->nsec	=3D nsec;
+	vdso_ts->sec	+=3D __iter_div64_u64_rem(nsec, (u64)NSEC_PER_SEC << tk->tkr_m=
ono.shift,
+						&vdso_ts->nsec);
=20
 	/* CLOCK_MONOTONIC_RAW */
 	vdso_ts		=3D &vc[CS_RAW].basetime[CLOCK_MONOTONIC_RAW];
