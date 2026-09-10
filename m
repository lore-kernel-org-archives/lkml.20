Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139C84AA032;
	Thu, 10 Sep 2026 15:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054743; cv=none; b=tquJnw5/9bplFLxPDT1Jje399Le1zhjPIeycRI9njtIh9YCGHz8FQ49NSUHlzbr3hHaTtEpxck/1wPzQj0Oemsevrmt7x7hd19A1TA59wKThHFdhVtiMO6/bKlx7x8ivu6CToFBjWswpP9g8g4oBkEthUiGMTa9shbPcQH/AdLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054743; c=relaxed/simple;
	bh=qiQSJzfMZMbcVWpRiewjKb2x4CfXhs3iHGNKDOI7BDI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=rET14HVMf3eFm6SotfB5Y39HlCocvprzyKqvoYMY9sdMRBC7EVZpuZRTSC06MDEKas1rwDKE2s/gARQriOpBOOj7ufbqfzUUV7xFuI5xZNdMnPyxIcyoaIitxucXpGJyOGomMFuHTCBamr7Qrc/rm+prOELOzzMUMQQf1k3k4SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VqxYL9q1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5RaebYKq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VqxYL9q1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5RaebYKq"
Date: Thu, 10 Sep 2026 15:38:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789054739;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z9ezTPWu88gO1navj4o3Me0yQtFjI1caVVb3ufd5Tog=;
	b=VqxYL9q1SO5yFQiLIIaBi9muMJSpWPXYNHoJxR9Iz7kqapjrMd6O1KnaxT7c9NVn+7UJ/Y
	bdtLyPQgyKbE/NEr1g07aXZwty7JBbUmE8nfsfPbNfFeGL9IkbWRoO+HJxEQuAzWkYRKGU
	GoNrYGeHfFmiIFyaLrHcqeW7StZeqV8tVnx9l7Uw2TXcSvBPQTTJSxAaBngfRykFwy5zA3
	Kddglh1GDVcl2+RrV8byIo16Y3v53zBVUX94ZqsNI1a5mkWFr28jJd3Q1+lVRfM7SrAirh
	rPW4jkD0ZtTR0o9xDDKfvHLcUXyH0qpbcLbc3ib9eHjS+yof6AUf8Saz8wwscg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789054739;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z9ezTPWu88gO1navj4o3Me0yQtFjI1caVVb3ufd5Tog=;
	b=5RaebYKqSDgoGd/aZIW1EF1hiRYwc2T9O6v6f81RJU911bswBkhJhFcHdYuQ4Mvi68zNSJ
	97z+BsoUJR79UuDA==
From: "tip-bot2 for Eric Biggers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] xor: Remove redundant X86_FEATURE_OSXSAVE check
Cc: Eric Biggers <ebiggers@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Christoph Hellwig <hch@lst.de>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901145740.42337-8-ebiggers@kernel.org>
References: <20260901145740.42337-8-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178905473775.623050.17066408136116945234.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     2405d15e5ae469bd9ae88ab0381f03e07787742f
Gitweb:        https://git.kernel.org/tip/2405d15e5ae469bd9ae88ab0381f03e0778=
7742f
Author:        Eric Biggers <ebiggers@kernel.org>
AuthorDate:    Tue, 01 Sep 2026 07:57:39 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 10 Sep 2026 07:26:19 -07:00

xor: Remove redundant X86_FEATURE_OSXSAVE check

X86_FEATURE_AVX implies X86_FEATURE_OSXSAVE already.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Christoph Hellwig <hch@lst.de>
Link: https://patch.msgid.link/20260901145740.42337-8-ebiggers@kernel.org
---
 lib/raid/xor/x86/xor_arch.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/raid/xor/x86/xor_arch.h b/lib/raid/xor/x86/xor_arch.h
index 99fe85a..991abe3 100644
--- a/lib/raid/xor/x86/xor_arch.h
+++ b/lib/raid/xor/x86/xor_arch.h
@@ -18,8 +18,7 @@ extern struct xor_block_template xor_block_avx;
  */
 static __always_inline void __init arch_xor_init(void)
 {
-	if (boot_cpu_has(X86_FEATURE_AVX) &&
-	    boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+	if (boot_cpu_has(X86_FEATURE_AVX)) {
 		xor_force(&xor_block_avx);
 	} else if (IS_ENABLED(CONFIG_X86_64) || boot_cpu_has(X86_FEATURE_XMM)) {
 		xor_register(&xor_block_sse);
