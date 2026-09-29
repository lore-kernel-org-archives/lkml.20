Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D35568FC8;
	Tue, 29 Sep 2026 19:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710077; cv=none; b=C5TK8TFksO3+V90wNYp/hdHjPHLZW3jMQus0hcJMoIq/eBR4PffTR877l7Qq6PPG8sGsAR4dy+U35BGRUxtA6COqBBDmQfWc++vUfYM3fRcwnBFyjYVL96SNzbyScwOTZODwjPFCSDa0Q/My50f1PJLvNpAiFYgszsmn1SpZNZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710077; c=relaxed/simple;
	bh=NIocjTe+NMU8daivWCUahF174/R2p4B8MbRYv3N5qnA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=fusUk1Aj042VWZcQ9N18bB/hTriVo1ntIuwPMWKqCGXzpARtCSHM3kTDJdSybP38D9VxlTqrzQ8p7qcLPEaBOii4QQHxoMMgjOMb0NCuXaQlgGzaU1ZjORZ7sVa76TyWLuaHP1XEaC/B9HrBOK/RbAtqAyCEMOOcLK46aNkIJfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=irJhiNJ7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x3FMYnbA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="irJhiNJ7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x3FMYnbA"
Date: Tue, 29 Sep 2026 19:27:52 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790710074;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEb3ssYZjC5eOJuXI51WGagRmlgw8ItabDZyhUcYCrI=;
	b=irJhiNJ7RyJLF5IBbMd1DB6LE7v6wOsh1eeaDH3U1eyGRQo6KEEFoq4GEtBFOVMK5YhssX
	qWMJMA0G80RbHAGPJByu0+jt1rkxVhKG7J8ZCbezW+lSCaXndWJXP2SpTVFzJqXGKg4D1N
	kjCWIrOMDgPM5H5BlZg9M2WJLQoxf2EmFbCOcOxKAZlIjwmG66EQUjxySXpNrD4SQFFQkZ
	W1Xk3gHyiHvxNYL5eP0yFi8hI480cNpK+on9LfXzRrWNXvbmpi4WG36Fkg6xpbFgOK9sGE
	nwVta9mohllJa/XavOIeo8ECjQ84p27ZsP6YC5s3hiU3ONkDpEBCZOjYMza56A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790710074;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pEb3ssYZjC5eOJuXI51WGagRmlgw8ItabDZyhUcYCrI=;
	b=x3FMYnbAbvAAYL3x6Mep7bVE/cmeMzviwT45JDbB9uYCnXWBObQyLxA/RulHNGvQWiWQOc
	r3x90fo6bcpRRVAg==
From: "tip-bot2 for Zhan Xusheng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso/math64: Use OPTIMIZER_HIDE_VAR() in
 __iter_div_u64_rem()
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>, Thomas Gleixner <tglx@kernel.org>,
 thomas.weissschuh@linutronix.de, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260916023252.418473-2-zhanxusheng@xiaomi.com>
References: <20260916023252.418473-2-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179071007229.3910103.10624612430659519102.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     37db375ad90467d7e3ce4e450b3d1c4f297d4ed3
Gitweb:        https://git.kernel.org/tip/37db375ad90467d7e3ce4e450b3d1c4f297=
d4ed3
Author:        Zhan Xusheng <zhanxusheng1024@gmail.com>
AuthorDate:    Wed, 16 Sep 2026 10:32:49 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Tue, 29 Sep 2026 21:23:30 +02:00

vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()

__iter_div_u64_rem() divides by repeated subtraction, because its callers
only ever produce a small quotient.  A barrier inside the subtraction loop
keeps the compiler from replacing the loop with a division:

	asm("" : "+rm"(dividend));

The "rm" constraint permits a memory operand.  clang picks it and spills
the dividend inside the loop, at 32-bit and 64-bit alike.  The helper sits
on the clock_gettime() fast path through vdso_set_timespec(), so the spill
is not free: with clang 18 the x86 vDSO is 64 bytes larger in vdso64 text
and 112 bytes larger in vdso32 text than with a register-only barrier.

Use OPTIMIZER_HIDE_VAR(), which is the register-only form of the same
barrier and the form the rest of the kernel uses.  gcc 13 generates
identical code either way, and neither compiler turns the loop into a
division at either width.

Put the function signature on one line while touching it, and reformat the
comment, which described the asm() that is now gone.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Link: https://patch.msgid.link/20260916023252.418473-2-zhanxusheng@xiaomi.com
---
 include/vdso/math64.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index 22ae212..c628d6c 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -2,15 +2,16 @@
 #ifndef __VDSO_MATH64_H
 #define __VDSO_MATH64_H
=20
-static __always_inline u32
-__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
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
