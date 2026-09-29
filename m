Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892173D647C;
	Tue, 29 Sep 2026 02:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790650788; cv=none; b=kcvTltZ2qUHLRvYM+ffIr6m65tP0Xv5ysXJVYLnpIJeQ+ocrEXHMmv88q677RgRlp0ssyFxqI0VBdvNBlp7M8mmSdK7c8vjIIgiSDKqpIlX4jJD+GtKJSdqiuNnLxXH6F911q34Tf8SoPiUjEIWlzNcpHWu3x7J/aPhHi6TzX2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790650788; c=relaxed/simple;
	bh=bujOARXZzmcEtC8e2H4FTS1bNJr6TIBeOW6MhW8V76s=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=Gq/g1chGIqeV9/XHfx/VmB8Ohh9x4Xw36JNuRwaFhAu13VlyEqFR5zZVPc3aZZjU8i6ZIECmHDPFCzBMs3dy/zZyJMr9DmaYsHsaCLK0xe8G8fdaJG3H1m3pyYPDYa40F1szINmvfl+ww6PfQEahvKFc3ui9ZuYWQ+6jtpxwaBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2Rkj9B8c; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tqiqZ0+g; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2Rkj9B8c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tqiqZ0+g"
Date: Tue, 29 Sep 2026 02:59:29 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790650771;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TtHeqx0gcOV5nIwDcRCOTPUmTWUxp/ZGoH+KKJ2FOM=;
	b=2Rkj9B8cZjWys4jFGAxC4jvVJ5g7XBDvnkgWPtSdO38meD478rO5CjF09IEBYL9Ca2nAR3
	mxHDA1MQCgocLLqHq/ZmAMPHd6iWdALqWX7pT9KXftdqWdM/szDOJ2p5WmUeRaCbs65/B9
	AZoc9HmtdzO3abqKp9Vq8tr8onLnvjHzYHtT4V6WzAEFS2vQd3GMPnraOS9tqqwmpC44Ha
	+DvdQkfsYWtMXiXbnpMzrbK9CnB34Emk5x5JGobTGwVDY66azIra2xTLzf+dTV9RA1YbeR
	AzKe41WGicKgbbOKoHLqjtPcroliDb/qdzO7z913Qr3iCpFCOoBGGt/Cne6vpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790650771;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7TtHeqx0gcOV5nIwDcRCOTPUmTWUxp/ZGoH+KKJ2FOM=;
	b=tqiqZ0+gImlifGU9qLd6AScwYe1HD8l7FFVd0xcNKlHKmimQH8EYqj2K/c7ZEaYj0nSuzD
	IRIijVOdiJtuo3Bg==
From: "tip-bot2 for Ard Biesheuvel" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/boot] x86/boot: Drop unused implementation of panic()
Cc: Ard Biesheuvel <ardb@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260925075137.44298-8-ardb@kernel.org>
References: <20260925075137.44298-8-ardb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179065076983.3910103.4877552419162170480.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/boot branch of tip:

Commit-ID:     dc2a1671d983d26b8ea5a4c5de9c5a028707f40b
Gitweb:        https://git.kernel.org/tip/dc2a1671d983d26b8ea5a4c5de9c5a02870=
7f40b
Author:        Ard Biesheuvel <ardb@kernel.org>
AuthorDate:    Fri, 25 Sep 2026 09:51:41 +02:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Mon, 28 Sep 2026 18:07:34 -07:00

x86/boot: Drop unused implementation of panic()

The decompressor has its own implementation of panic(), which is based
on the vsnprintf() routine provided by the EFI stub.

The decompressor's panic() has no remaining users, and is implemented in
terms of the EFI stub's snprintf() implementation, which is going away
(and relying on the EFI stub from code that does not execute in the
context of the EFI boot services is a bad idea in general).

So drop it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Link: https://patch.msgid.link/20260925075137.44298-8-ardb@kernel.org
---
 arch/x86/boot/compressed/error.c | 19 -------------------
 arch/x86/boot/compressed/error.h |  1 -
 2 files changed, 20 deletions(-)

diff --git a/arch/x86/boot/compressed/error.c b/arch/x86/boot/compressed/erro=
r.c
index 19a8251..ce5ed7d 100644
--- a/arch/x86/boot/compressed/error.c
+++ b/arch/x86/boot/compressed/error.c
@@ -22,22 +22,3 @@ void error(char *m)
 	while (1)
 		asm("hlt");
 }
-
-/* EFI libstub  provides vsnprintf() */
-#ifdef CONFIG_EFI_STUB
-void panic(const char *fmt, ...)
-{
-	static char buf[1024];
-	va_list args;
-	int len;
-
-	va_start(args, fmt);
-	len =3D vsnprintf(buf, sizeof(buf), fmt, args);
-	va_end(args);
-
-	if (len && buf[len - 1] =3D=3D '\n')
-		buf[len - 1] =3D '\0';
-
-	error(buf);
-}
-#endif
diff --git a/arch/x86/boot/compressed/error.h b/arch/x86/boot/compressed/erro=
r.h
index 31f9e08..87062de 100644
--- a/arch/x86/boot/compressed/error.h
+++ b/arch/x86/boot/compressed/error.h
@@ -6,6 +6,5 @@
=20
 void warn(const char *m);
 void error(char *m) __noreturn;
-void panic(const char *fmt, ...) __noreturn __cold;
=20
 #endif /* BOOT_COMPRESSED_ERROR_H */
