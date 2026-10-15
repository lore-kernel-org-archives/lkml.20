Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D2B399003;
	Thu, 15 Oct 2026 15:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078694; cv=none; b=r4nMcFeR2dDyy5a42aW2EHRLur/EVpflgE1PW+25sCdFm9y5uGCyBVg2liqpuvc02OULL4/qAIDHMd2sowvCEoeYkHKzK03lAKhfBdsQFheh6Qf3SNxKb6av8obdHWfr9p38+U7VeylZI59Oh68/s8b0SPEAEZRjiGc0IODE32U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078694; c=relaxed/simple;
	bh=/F7R39e6ATl5VsPUVNRdcw1sIJ8fc48iq4XqPzN2fyY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=BLOhZbsdAGuSPYglP02F8wrqb5f00N1Bcm1TNacl7Njc/XDxHDcSnmV2RJHZLYDbbDeYgZhUn1pxAqOFDsfFQDlXXxZ/yPo3LNH9/zkT7XN/tzyiDnMiAriePOnFX02081c6+rjqA9bxcP+Ml3cnChfHNm3RPHWzQ669bbMSoNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X13B5WHH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fa3+XgGP; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X13B5WHH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fa3+XgGP"
Date: Thu, 15 Oct 2026 15:37:53 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792078675;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDvYgwfxC3JS7a7MQQt4aUVORU+bPpTu2UslkLExE9k=;
	b=X13B5WHHjde3czSxI1LGrBm5pj6lqZbNrpZ/KutLloP3az3spxkZjGbMihpexYMP+/S+aM
	S1nu1f+dy0tegzeRS133Bkv25tRhT3B+tnWdhSWETAeMHjL7pMTQP1JnQKsAp7qHqkqb71
	Q3o7GKvkY7YhYvhYKtK7MXGJ48KMSswhZw3ZjLPKaXaQRIWlz6rX1dQ9YQYxCzLuT8uE54
	4zERwXwiCm6DFvMrgfQTvS/iQ7SWWdxvGeOkjN9PlcCicp8GZCumD00uzLz8yuHzDnZikc
	Mq2pVrteSG0Coy58mRzMDb+NKOIaaW0hCrtygk+kS3sdkXzIZoUzCMtjcOMa0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792078675;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDvYgwfxC3JS7a7MQQt4aUVORU+bPpTu2UslkLExE9k=;
	b=fa3+XgGPnCvdL11hhgSUTQX+sCx77MNe5j6N1J/FHv5uKEyRiWizlLeeHH4WwjqW8TEMKg
	or57r4DcW5e2QJCw==
From: tip-bot2 for Thomas =?utf-8?q?Wei=C3=9Fschuh?= <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: timers/vdso] vdso/gettimeofday: Define fallback
 __arch_get_vdso_u_time_data() in gettimeofday.c
Cc: thomas.weissschuh@linutronix.de, Thomas Gleixner <tglx@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To:
 <20260909-vdso-asm-generic-vsyscall-h-v1-2-63ae856cc659@linutronix.de>
References:
 <20260909-vdso-asm-generic-vsyscall-h-v1-2-63ae856cc659@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179207867360.2666988.9506178193356079066.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/vdso branch of tip:

Commit-ID:     4fba7bb3e73a8087c353a6679a49ad81579114bc
Gitweb:        https://git.kernel.org/tip/4fba7bb3e73a8087c353a6679a49ad81579=
114bc
Author:        Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
AuthorDate:    Wed, 09 Sep 2026 10:51:15 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 17:33:19 +02:00

vdso/gettimeofday: Define fallback __arch_get_vdso_u_time_data() in gettimeof=
day.c

__arch_get_vdso_u_time_data() is only used in gettimeofday.c. vsyscall.h
has become a dumping ground for different kinds of fallbacks.

Move the fallback function definition into gettimeofday.c,
similar to other fallbacks.

Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20260909-vdso-asm-generic-vsyscall-h-v1-2-63ae=
856cc659@linutronix.de
---
 include/asm-generic/vdso/vsyscall.h | 7 -------
 lib/vdso/gettimeofday.c             | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/v=
syscall.h
index a6b03cf..fe12fb1 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -4,13 +4,6 @@
=20
 #ifndef __ASSEMBLER__
=20
-#ifndef __arch_get_vdso_u_time_data
-static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_d=
ata(void)
-{
-	return &vdso_u_time_data;
-}
-#endif
-
 #ifndef __arch_get_vdso_u_rng_data
 static __always_inline const struct vdso_rng_data *__arch_get_vdso_u_rng_dat=
a(void)
 {
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index f7a591a..b867c23 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -93,6 +93,13 @@ static inline bool vdso_cycles_ok(u64 cycles)
 }
 #endif
=20
+#ifndef __arch_get_vdso_u_time_data
+static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_d=
ata(void)
+{
+	return &vdso_u_time_data;
+}
+#endif
+
 static __always_inline bool vdso_clockid_valid(clockid_t clock)
 {
 	/* Check for negative values or invalid clocks */
