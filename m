Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8082B3783BB;
	Wed,  9 Sep 2026 23:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998286; cv=none; b=Wy941/f98k+MCEiJvpSF+Cgo8wAVhCYPsnXowVEninbmuE1X9hRzick7CCox9zhDmxEpxN7hqY9jvCtXpdSSu8JkrM92cgbDoggzlyY9i2kELxjhmGcSf2cos42cnGFkZSpKLaApnLJyX0u0mqlTxpqNBHvfKf3YIGJiArkMCUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998286; c=relaxed/simple;
	bh=pd+U+WSHzDg0/oZ3AX3jLyfj2Q4j1lXa3oi3hgVBqIY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=qcyjIL2nwmXRFGVFxPdpOmnciqHzoj+GS2DTihGRORv8KzeROH8S2KyNeFYPzUaUYX3OcnR3uicIlniYliNl80dTqzUUXSStMa4p80h2ZukpaVgbkeZShHPoEUe2xrKIWt+r8p19SS7t66XAOekzBu1ph18I3r+OUiTPlipzaXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BI3Y6Y02; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/gUwO0z8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BI3Y6Y02";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/gUwO0z8"
Date: Wed, 09 Sep 2026 23:57:58 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788998279;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tc+Z9U+oh2NlZLJJEK3CzzG+kRV5FxxqR7lUMleynX4=;
	b=BI3Y6Y02hoaaxjPlsZOCp+i/6igrlUUWfxfVXHmfgEKfPIzYVzu35IUfGR8yJge9NHfdLQ
	uwuIJwwCdpjfAwKS7LSEMDfyc655j01Rf+tFi4YAL17uWVrQbx5XqapB92aR5F0xImAUf0
	4a49buTX5Pae+wlbREDCElpKgif93PqdkaZYvC7ITllztg/HNJc1uanrDHkOjYnX48Y6YM
	lb8fQSyIurVm+g8YY6daHZ2Qx/30LSZhKTlKazlJ3koFjrfGvp0ZkSv1dB9BJXk1iVH2n+
	jKJfxlQxXKUS+l28EFGCYwYwGyLCSHjoidfGlRwyA1z3OoxEBtPbePobEVZJKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788998279;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tc+Z9U+oh2NlZLJJEK3CzzG+kRV5FxxqR7lUMleynX4=;
	b=/gUwO0z8vGPYPTWXSPSQRS9COPnYKWlFklUQSkSR0SO/hNH7lKXkNpbxVv/Yay7TM89RAm
	aCC/7ykrPoV2EpBA==
From: "tip-bot2 for Eric Biggers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] lib/crc: x86: Stop using cpu_has_xfeatures()
Cc: Eric Biggers <ebiggers@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Christoph Hellwig <hch@lst.de>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901145740.42337-6-ebiggers@kernel.org>
References: <20260901145740.42337-6-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178899827818.623050.5258882168631587428.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     b93f05df9c660a3a11d1db608a859241d65ccb96
Gitweb:        https://git.kernel.org/tip/b93f05df9c660a3a11d1db608a859241d65=
ccb96
Author:        Eric Biggers <ebiggers@kernel.org>
AuthorDate:    Tue, 01 Sep 2026 07:57:37 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Wed, 09 Sep 2026 14:04:40 -07:00

lib/crc: x86: Stop using cpu_has_xfeatures()

Checking both boot_cpu_has() and cpu_has_xfeatures() has never really been
needed in practice, and it's never been universally done (e.g., lib/raid/
omits cpu_has_xfeatures()).  Nevertheless, both x86 and UML now explicitly
clear the AVX and AVX-512 flags if their xfeatures are missing, which should
remove any remaining doubts.

Thus, remove all the calls to cpu_has_xfeatures().

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Christoph Hellwig <hch@lst.de>
Link: https://patch.msgid.link/20260901145740.42337-6-ebiggers@kernel.org
---
 lib/crc/x86/crc-pclmul-template.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/lib/crc/x86/crc-pclmul-template.h b/lib/crc/x86/crc-pclmul-templ=
ate.h
index 0274483..893119b 100644
--- a/lib/crc/x86/crc-pclmul-template.h
+++ b/lib/crc/x86/crc-pclmul-template.h
@@ -27,16 +27,14 @@ DEFINE_STATIC_CALL(prefix##_pclmul, prefix##_pclmul_sse)
 static inline bool have_vpclmul(void)
 {
 	return boot_cpu_has(X86_FEATURE_VPCLMULQDQ) &&
-	       boot_cpu_has(X86_FEATURE_AVX2) &&
-	       cpu_has_xfeatures(XFEATURE_MASK_YMM, NULL);
+	       boot_cpu_has(X86_FEATURE_AVX2);
 }
=20
 static inline bool have_avx512(void)
 {
 	return boot_cpu_has(X86_FEATURE_AVX512BW) &&
 	       boot_cpu_has(X86_FEATURE_AVX512VL) &&
-	       !boot_cpu_has(X86_FEATURE_PREFER_YMM) &&
-	       cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL);
+	       !boot_cpu_has(X86_FEATURE_PREFER_YMM);
 }
=20
 /*
