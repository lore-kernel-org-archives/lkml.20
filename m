Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D513531B10;
	Wed,  9 Sep 2026 23:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998282; cv=none; b=CNCV3EG9cv5S4A5NcDb/TAmR1Ei87GgnXHnpibj1HyynhrodpY77icvAM/hlr44afybMYXxmBRGmrcH5+snsgOa/icoWoE5Z24emcdAJ7iYReV3tzN1N68h5tC+wwwizXMAI3t9nAPiHoV6jslaEza/qMMhD7UVW++HLkD1q5J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998282; c=relaxed/simple;
	bh=ZwYI9m7G132YZPY3AaOeKgr10e7aVNFOTxXTze8IUag=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=qFt+dPx69wsRynml+YlAa6gao11GUxHXf9H9U39G9QIIjhJfw299JLG1WCmwvNM5UuC0+GYMtMCjCQN3cP+ePgDeAYnVUpvUnR+ZsPu5+xGp7sW1/+7PJ8LNiYSndDcbuUovNn5nh+t57N1Zra8WpOD1FlK/rvrcba1TzBa5DJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JW42woUd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5jSXeAbH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JW42woUd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5jSXeAbH"
Date: Wed, 09 Sep 2026 23:57:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788998276;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=371tuQggDXjRvVE/cVE8lCjqu5nPytVJvKMClVUBLmU=;
	b=JW42woUdE+OCt/MBrPIKwE+e2SuzZa4fKa2M8SxUT9EvfzMorCR/27qV69gXqjezwB8/ze
	iW1E5/hprv5mQepLnngWvIv+ptPv4ytFAnxFDIl5wgGgav/bEVVIzR1kTdjvH2cNuOOBpI
	kw25JpGRzuM2ssJExg7GW287msfcJjq3EIzmlBhGGEboHr+LJ908eXgSQVWYFc1jVOn+i5
	Cpvi4klfzzijaPMs8cpYyTru56hma+T6lP3Q2VwTIUhaQTmJNumZKewAEhCeh3QjG7nsqc
	jcHhpfPURpq2eXkmjrp9ERLJbmOl/HEvE8zwMjtBkDS8dMYPo81dGc1B6b2Q8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788998276;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=371tuQggDXjRvVE/cVE8lCjqu5nPytVJvKMClVUBLmU=;
	b=5jSXeAbHFe9DHZk8mda9uBGJxSKrGdmE1EsUZX4u/qbEiALPKNIlVJzCDS9jB94HwbcJWa
	fRS/vC2aNP9h/eBA==
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
Message-ID: <178899827530.623050.12258480059431715110.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     2b1b0d6f4ea7be1c838c73988ac46c06ed0308ae
Gitweb:        https://git.kernel.org/tip/2b1b0d6f4ea7be1c838c73988ac46c06ed0=
308ae
Author:        Eric Biggers <ebiggers@kernel.org>
AuthorDate:    Tue, 01 Sep 2026 07:57:39 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Wed, 09 Sep 2026 14:20:42 -07:00

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
