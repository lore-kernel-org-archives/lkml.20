Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52304BCADC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 17:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396002; cv=none; b=fnIgecaMb7QyuQMmDTex9qzrbsUGQiUlQMtpJUiQZ6bFXyyFy+vTw6bvfdXy0NVr6Z/epy72+DIrNo36f38AakLvb55dmalpwUeHEN62EjyViWXEbPHQPDAd+luZeud/vBTfFr648+I9dAci8Mb5etczPHiixresw7CZQ4B1Enc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396002; c=relaxed/simple;
	bh=JgyVm6yEpNf/2dQ/k32vsyW3ebTaboiZjy+TYXe0G50=;
	h=From:To:Cc:Message-ID:Date:Subject; b=rgMRbhddCiE0Bito7TpVZ33E3sSGibBIDLxvWDZSz/kEnWXagw8mKrAY1k99dn6N+rCf2GotbKiGS4iOnsJjT8djEiZkPIShCBLbnWYFf5bFB7HbzTVri9x6mzDK2qQGurgc/mDdVd6/6Bc/XJTEhTW2qFSBKSGab9WQEYQIkbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=T3Fcw7NJ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=L0xrpi/0; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="T3Fcw7NJ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="L0xrpi/0"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Subject:Date:Message-ID:To:From; t=1791395994; bh=3jAENaBzyuwOwECaqvThTmn
	S/3VZ/IJOgHT6IsIY+E8=; b=T3Fcw7NJwKaAZr787tBc9HeDvTzo1v0pMd5h+UousMWy14qCfy
	VZo6ujBjwmur+lziGekbHEHcbjWPh23Z2KaPggEpAVHDLvfkrEJnKm0KsSuGubGTxwhKPDFeI/g
	/IP+sr5j3rJVeU6JNHWJZ3r6Bcl945szgNxUZeJ2K/GabiVakmlCahoc0BrwJQfoyBflU9yJMHN
	+bus2qPDioAFEmuHRTzRLPxE02KGmZwltg5k7h5bGRrLM48ugy3C9JebfMyofH3CYw/1+Nzv1Y6
	U0QOyYXtXkFqqWQBbHEXZz4cwVWHhzpwSE5UcYzmf70Hof1BuUTPCT/GwmSLS894Xbg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Subject:Date:Message-ID:To:From; t=1791395994; bh=3jAENaBzyuwOwECaqvThTmn
	S/3VZ/IJOgHT6IsIY+E8=; b=L0xrpi/0DxjUzLAoyfzqiuuqpBNzka2EZ/JYBGyxu9bD+jFvH8
	YnTMPianKzaRk1fY6q2MlrnNHkYjRT4LzFCQ==;
From: Bradley Morgan <brads@mainlining.org>
To: catalin.marinas@arm.com, will@kernel.org
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, brads@mainlining.org
Message-ID: <20261007185512.2.mte-tmp2@mainlining.org>
Date: Wed, 7 Oct 2026 17:45:01 +0000
Subject: [PATCH RESEND] arm64: entry: drop the unused tmp2 argument of
 mte_set_kernel_gcr()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

mte_set_kernel_gcr() takes a tmp2 argument the macro never uses. It
used to, the body passed \tmp and \tmp2 to mte_set_gcr, then
commit 82868247897b ("arm64: kasan: mte: use a constant kernel
GCR_EL1 value") swapped that for

    mov     \tmp, KERNEL_GCR_EL1

and tmp2 stayed in the declaration and in the one caller, which
passes x23 for it.

Drop it, both places.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
Resending, the first send's body got mangled.

 arch/arm64/kernel/entry.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index f63049ac32dc..c3106dee61e1 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -171,7 +171,7 @@ alternative_else_nop_endif
 #endif
 	.endm
 
-	.macro mte_set_kernel_gcr, tmp, tmp2
+	.macro mte_set_kernel_gcr, tmp
 #ifdef CONFIG_KASAN_HW_TAGS
 alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
 	b	1f
@@ -258,7 +258,7 @@ alternative_else_nop_endif
 
 	apply_ssbd 1, x22, x23
 
-	mte_set_kernel_gcr x22, x23
+	mte_set_kernel_gcr x22
 
 	/*
 	 * Any non-self-synchronizing system register updates required for
-- 
2.53.0

