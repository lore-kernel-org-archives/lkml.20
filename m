Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DF44483B4;
	Tue, 29 Sep 2026 19:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710072; cv=none; b=Kib6cNiFdDPv78QIiojE5nLhvXGrPrN7GlQh09YhwTsDnqO3jZdEuP79VgHwUENUeDwetMi/Uz+9NxuBEmmKQup4ua79NxxWmLPdsuNiMuhyl+yHbryDMDiLpBWXD15SFXgXHLF53tMMP+st+kS6yFqclClQ9T/qvp3ZTzmSmhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710072; c=relaxed/simple;
	bh=uKrPu39LW1PweMzHmzNoJhBZGOZYY+tHbjpzT8buIfk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Qs4jUyev2ecqjKqAHS6eDzOjcTAAyOGmpsxqn/aWRrlHoa0P/YdfKJeeYKU+7PQkHRPpaA5jqPwAIwzEYChDDYnJirfuEjyp9TkjzPpiDasietfvD4JBACMrvhleSfDj9pMJO4gkfKCbwYRBFeMXDxqXy4xDJU+mWEqfw7SP+c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hwZgnmFv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0qBWr5y1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hwZgnmFv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0qBWr5y1"
Date: Tue, 29 Sep 2026 19:27:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790710069;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24qLEHD056aVt4YtY+dr5Nt2fIHNQyHRAp3aACMkgYU=;
	b=hwZgnmFvHXGq6E1nDXMtxS4qphB47XnVsNEUdzO0HdJPCqI4Cdf/1ypGjsdmllsuN+Y8ff
	omGdefQeAWqPX/QtTJwYljhszWOF3DnXTZdjVqvjHz8BvdV8ztbfYDYw+wJyWhPOq5hLHc
	usWkgP34K5yMD/H/e9q2P9dLv69IyWnSGNbSLCgE6JORlweaohceXxMMEmUwhsuXVCsKtM
	3dyr68YK4csBzO6H9sCSDpZ+UhnjJjEmVs6nsDtOT0emfiVyuneIG8XMh85X1shjcWN7Tx
	0Zn4w2QgxJOG6LmnO0DhWZD4Q8EDkD/p6zF2Kx+kO4IyLtfDKH41pH2Cx+u+Gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790710069;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=24qLEHD056aVt4YtY+dr5Nt2fIHNQyHRAp3aACMkgYU=;
	b=0qBWr5y1U43BqCD+r4vbillhFhRNL/tUYIck9hFrNmTwDJYxd+rRtzeU82j7f5jYzW/DEv
	f8/0VqCBYv9rCbAg==
From: "tip-bot2 for Zhan Xusheng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso/gettimeofday: Assert that the clockid fits
 into the u32 bitmask
Cc: thomas.weissschuh@linutronix.de, Zhan Xusheng <zhanxusheng@xiaomi.com>,
 Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260916023252.418473-5-zhanxusheng@xiaomi.com>
References: <20260916023252.418473-5-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179071006760.3910103.7128144862208102168.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     ca46a07c4b68246c4e400ce3649ab7228a878d8f
Gitweb:        https://git.kernel.org/tip/ca46a07c4b68246c4e400ce3649ab7228a8=
78d8f
Author:        Zhan Xusheng <zhanxusheng1024@gmail.com>
AuthorDate:    Wed, 16 Sep 2026 10:32:52 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:23:30 +02:00

vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask

__cvdso_clock_gettime_common() and __cvdso_clock_getres_common() convert
the clockid into a bitmask and match it against VDSO_HRES, VDSO_COARSE,
VDSO_RAW and VDSO_AUX:

	msk =3D 1U << clock;

vdso_clockid_valid() rejects anything above CLOCK_AUX_LAST beforehand,
and CLOCK_AUX_LAST is 23, so the shift count is in range.  Nothing
records that dependency though.  Raising MAX_AUX_CLOCKS beyond 16 moves
CLOCK_AUX_LAST to 32 and makes the shift undefined.

Add a BUILD_BUG_ON() at both conversion sites.  The condition is on a
function parameter rather than a constant, so it relies on the compiler
deriving the range from the vdso_clockid_valid() bail-out above it.  gcc
13 and clang 18 both do: the x86 vdso64 and vdso32 builds stay clean, and
raising MAX_AUX_CLOCKS to 17 trips the assert.

Suggested-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Link: https://patch.msgid.link/20260916023252.418473-5-zhanxusheng@xiaomi.com
---
 lib/vdso/gettimeofday.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index f7a591a..ef4dcc6 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -285,6 +285,7 @@ __cvdso_clock_gettime_common(const struct vdso_time_data =
*vd, clockid_t clock,
 	 * Convert the clockid to a bitmask and use it to check which
 	 * clocks are handled in the VDSO directly.
 	 */
+	BUILD_BUG_ON(clock >=3D BITS_PER_TYPE(msk));
 	msk =3D 1U << clock;
 	if (likely(msk & VDSO_HRES))
 		vc =3D &vc[CS_HRES_COARSE];
@@ -438,6 +439,7 @@ bool __cvdso_clock_getres_common(const struct vdso_time_d=
ata *vd, clockid_t cloc
 	 * Convert the clockid to a bitmask and use it to check which
 	 * clocks are handled in the VDSO directly.
 	 */
+	BUILD_BUG_ON(clock >=3D BITS_PER_TYPE(msk));
 	msk =3D 1U << clock;
 	if (msk & (VDSO_HRES | VDSO_RAW)) {
 		/*
