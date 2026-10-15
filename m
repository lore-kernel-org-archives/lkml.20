Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA46253D0AD;
	Thu, 15 Oct 2026 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078666; cv=none; b=Cu6jCqHfH3Hzy59jRJtIALLQWWFQjvHfaQVoc9qPnU/FeGscWrUq/zl/+mRn3Dbmz2yp6lEeqIhQHUnQ8iz+CX9Uuxxb2rOiWKQoxNRDb2NEpczVNN88PRnALAjei4IWIYvS4AtvptKC16IeslQXWNSDcscjDIx9rzPgGdcoqZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078666; c=relaxed/simple;
	bh=tFs9SjR+TBGvV2HMtA9/+oi/fMLKNpW6BgnuBVqGdjI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=foVnTLeuewiYSFB1Fk8yaPMIxozxBvMyaCysLJs/2JYwIvsQmBEYpCENZxdlBToovIp2xL2vIkxkAgDDlvQlMF2+tGKfH4ksnZjYWhc0TxRXWs14sTnGrOGiZA5Pyv8jdKu91ibg1SvXsWcXru1TDwEzR6LEmbHhF7Fzlfi1LZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OeBkWV/E; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8Z3bag31; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OeBkWV/E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8Z3bag31"
Date: Thu, 15 Oct 2026 15:37:31 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078652;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6lJEMCe65Wzdh0qfRiOIOnl/0JEn4GZXGXFECznm6ns=;
	b=OeBkWV/EodkdsR//xt3bYaYSO1oIfS8Bp6w+vB9DG21sGcVlTbbhNCxMtMOuc262UWajsm
	NtEumxREq72mNNORj6l7jcWGJMNL5NSVpawsR4P+W8/a8HUatcVNfEeAZON0QFOPWuGwyC
	a91iFfn2t4prn7mRn4zmpJNyO4xmLwk7I+Fa8Qw/kgj+hO7tM+kZUAoujSD3dzHoU8lqFY
	ka5V75UF/V2sN6Qj7bLmQNLn+RQfPxRDB3iWHHhmC3wVOXFdV0PS+hWCZK5FBI3k9WIB0l
	g09Q+NGlX4mOLXi3ICrk8WUxLKYgEnDHiOQuQJEuvg6LiC8g8KGZCXWTZJDQBQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078652;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6lJEMCe65Wzdh0qfRiOIOnl/0JEn4GZXGXFECznm6ns=;
	b=8Z3bag31Q4NYMqlaLizsNzAmXSjjhDbrL1U0XbcvD1O9qvToL1AZbt3AzB6RN7VEx5pYrO
	psRSkLs+lCUeftBw==
From: "tip-bot2 for Zhan Xusheng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso/math64: Use OPTIMIZER_HIDE_VAR() in
 __iter_div_u64_rem()
Cc: kernel test robot <lkp@intel.com>, Zhan Xusheng <zhanxusheng@xiaomi.com>,
 Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261002153104.1347978-2-zhanxusheng@xiaomi.com>
References: <20261002153104.1347978-2-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207865112.2666988.8701333238247627591.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     c1b910b270fee8930865410455f71e273f4c602c
Gitweb:        https://git.kernel.org/tip/c1b910b270fee8930865410455f71e273f4=
c602c
Author:        Zhan Xusheng <zhanxusheng1024@gmail.com>
AuthorDate:    Fri, 02 Oct 2026 23:30:59 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:20 +02:00

vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()

__iter_div_u64_rem() open-codes an empty asm() to keep the compiler from
turning the subtraction loop into a modulo operation.  That is what
OPTIMIZER_HIDE_VAR() is for, so use it and reflow the comment.

The macro lives in linux/compiler.h, which this header did not include.
vdso/math64.h is reached from linux/math64.h, whose includes are
linux/types.h, linux/math.h, asm/div64.h and vdso/math64.h; none of them
guarantees linux/compiler.h.  x86 happens to get it through
asm/div64.h -> linux/log2.h, m68k's asm/div64.h only pulls in
asm-generic/div64.h and linux/types.h, so the macro is undeclared there
and the build fails with -Werror=3Dimplicit-function-declaration.

Include linux/compiler.h so the header no longer depends on its includer.
This is a no-op for the vDSO, where lib/vdso/gettimeofday.c already gets
it through linux/build_bug.h, and vdso/unaligned.h sets the same
precedent by including linux/compiler_types.h.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261002153104.1347978-2-zhanxusheng@xiaomi.com
Closes: https://lore.kernel.org/oe-kbuild-all/202609300626.zwNjKaO6-lkp@intel=
.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202609301300.uAawkHuh-lkp@intel=
.com/
---
 include/vdso/math64.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index 22ae212..3c08909 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -2,15 +2,18 @@
 #ifndef __VDSO_MATH64_H
 #define __VDSO_MATH64_H
=20
-static __always_inline u32
-__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
+#include <linux/compiler.h>
+
+static __always_inline u32 __iter_div_u64_rem(u64 dividend, u32 divisor, u64=
 *remainder)
 {
 	u32 ret =3D 0;
=20
 	while (dividend >=3D divisor) {
-		/* The following asm() prevents the compiler from
-		   optimising this loop into a modulo operation.  */
-		asm("" : "+rm"(dividend));
+		/*
+		 * Prevent the compiler from optimising this loop into a
+		 * modulo operation.
+		 */
+		OPTIMIZER_HIDE_VAR(dividend);
=20
 		dividend -=3D divisor;
 		ret++;
