Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE10653D0C0;
	Wed,  9 Sep 2026 23:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998294; cv=none; b=QJEO7aTU5j2JyV2fM3XhRlDZEfYu8GDcWs8mSmQHJ0rzdYH5jAFJ5siaH4jGA8HOSYTxwBQajm58d06YMsW5fZX6x3sZS0vwVMe4o6/PjtTqmeQIG2H8LAcFG6LWM/U4qi5qkZuk41mtu3GPUMQ5s7GMu1XHw5zsv2YimPqHJ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998294; c=relaxed/simple;
	bh=Ija0qSt+TczG/6pi7F5rpZhDY347hLNQcm7Qb0z2/CU=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=b1qedw2vSfQplgl9ZpSTv4AestPRwlAcxIZvAozHHiPpgyedBcN3Ve38RiXvTlMf6B+00fKfHPawlrBfaiJPeD0L4i7ALheEfg1KQxXxdeYXhbZkdiPQzEEFSBqFcDqs/0y5b55XzjHs7+EFTzBnxjIgHGHlYFT1Jkc9x0XeFok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xb/rS4q5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fDwTzXSo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xb/rS4q5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fDwTzXSo"
Date: Wed, 09 Sep 2026 23:58:01 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788998282;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eU6qTz4SDjWQWNkSvtK0emu/OZlgv5cww0u9kqgK+TE=;
	b=Xb/rS4q5M2HSSg31ftMoMersVAzq8VY/oPq7zr0Ww3pqXYJMVVxrvGdevxnEntpnt0V77N
	LvGEYWNd6kiGnWfwTx7A+H7Gzbxt5pAGf0hF+xtYGMnWOGNjZF/TbpvCJUyJwe8/jHMkNn
	p7lRG4fLJaLLCWUtr+84I8bfpio3HcZh/XmT/6grOx+kDfNbU2o047KDHFTZWtbnIy0heE
	VmUM3SoHL+99Cp/fP8vnNSB7aAcXV9rTPbR7IaqmxCfsI5P5X6X/wGbvPniY75C+cosIa1
	VHqTb1awyc7fE7Zg66bAB96ksE4zNnqVM9hE3pA8GQW1ZX7lttUY3B9yd+7pVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788998282;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eU6qTz4SDjWQWNkSvtK0emu/OZlgv5cww0u9kqgK+TE=;
	b=fDwTzXSoducbA1j7UIpaDYojqOkPaB+3uJ1ZnnzuxHiZXV1h/YuqraRG4bkmIV/lyZjbgf
	WUPOOS+TupLEu/Cw==
From: "tip-bot2 for Eric Biggers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] crypto: x86 - Stop using cpu_has_xfeatures()
Cc: Eric Biggers <ebiggers@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Christoph Hellwig <hch@lst.de>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901145740.42337-4-ebiggers@kernel.org>
References: <20260901145740.42337-4-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178899828108.623050.1615358587543676424.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     9256e0496c14d0c267f508400a2450371e265fca
Gitweb:        https://git.kernel.org/tip/9256e0496c14d0c267f508400a2450371e2=
65fca
Author:        Eric Biggers <ebiggers@kernel.org>
AuthorDate:    Tue, 01 Sep 2026 07:57:35 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 08 Sep 2026 21:25:46 -07:00

crypto: x86 - Stop using cpu_has_xfeatures()

Checking both boot_cpu_has(X86_FEATURE_AVX*) and cpu_has_xfeatures() has never
really been needed in practice, and it's never been universally done (e.g.,
lib/raid/ omits cpu_has_xfeatures()).  Nevertheless, both x86 and UML now
explicitly clear the AVX and AVX-512 flags if their xfeatures are missing,
which should remove any remaining doubts.

Thus, remove all the calls to cpu_has_xfeatures(), as well as the related
checks of boot_cpu_has(X86_FEATURE_OSXSAVE).

In a few cases there was no corresponding boot_cpu_has(X86_FEATURE_AVX*)
check, so add the missing ones.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Christoph Hellwig <hch@lst.de>
Link: https://patch.msgid.link/20260901145740.42337-4-ebiggers@kernel.org
---
 arch/x86/crypto/aegis128-aesni-glue.c      |  3 +--
 arch/x86/crypto/aesni-intel_glue.c         |  7 ++-----
 arch/x86/crypto/aria_aesni_avx2_glue.c     | 11 +----------
 arch/x86/crypto/aria_aesni_avx_glue.c      | 11 +----------
 arch/x86/crypto/aria_gfni_avx512_glue.c    | 11 +----------
 arch/x86/crypto/camellia_aesni_avx2_glue.c | 11 +----------
 arch/x86/crypto/camellia_aesni_avx_glue.c  | 11 +----------
 arch/x86/crypto/cast5_avx_glue.c           |  7 ++-----
 arch/x86/crypto/cast6_avx_glue.c           |  7 ++-----
 arch/x86/crypto/serpent_avx2_glue.c        |  9 +--------
 arch/x86/crypto/serpent_avx_glue.c         |  7 ++-----
 arch/x86/crypto/sm4_aesni_avx2_glue.c      | 11 +----------
 arch/x86/crypto/sm4_aesni_avx_glue.c       | 11 +----------
 arch/x86/crypto/twofish_avx_glue.c         |  6 ++----
 14 files changed, 19 insertions(+), 104 deletions(-)

diff --git a/arch/x86/crypto/aegis128-aesni-glue.c b/arch/x86/crypto/aegis128=
-aesni-glue.c
index f1adfba..09fc0b1 100644
--- a/arch/x86/crypto/aegis128-aesni-glue.c
+++ b/arch/x86/crypto/aegis128-aesni-glue.c
@@ -265,8 +265,7 @@ static struct aead_alg crypto_aegis128_aesni_alg =3D {
 static int __init crypto_aegis128_aesni_module_init(void)
 {
 	if (!boot_cpu_has(X86_FEATURE_XMM4_1) ||
-	    !boot_cpu_has(X86_FEATURE_AES) ||
-	    !cpu_has_xfeatures(XFEATURE_MASK_SSE, NULL))
+	    !boot_cpu_has(X86_FEATURE_AES))
 		return -ENODEV;
=20
 	return crypto_register_aead(&crypto_aegis128_aesni_alg);
diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel=
_glue.c
index f522fff..f6f899d 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -1548,8 +1548,7 @@ static int __init register_avx_algs(void)
 	if (!boot_cpu_has(X86_FEATURE_AVX2) ||
 	    !boot_cpu_has(X86_FEATURE_VAES) ||
 	    !boot_cpu_has(X86_FEATURE_VPCLMULQDQ) ||
-	    !boot_cpu_has(X86_FEATURE_PCLMULQDQ) ||
-	    !cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL))
+	    !boot_cpu_has(X86_FEATURE_PCLMULQDQ))
 		return 0;
 	err =3D crypto_register_skciphers(skcipher_algs_vaes_avx2,
 					ARRAY_SIZE(skcipher_algs_vaes_avx2));
@@ -1562,9 +1561,7 @@ static int __init register_avx_algs(void)
=20
 	if (!boot_cpu_has(X86_FEATURE_AVX512BW) ||
 	    !boot_cpu_has(X86_FEATURE_AVX512VL) ||
-	    !boot_cpu_has(X86_FEATURE_BMI2) ||
-	    !cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM |
-			       XFEATURE_MASK_AVX512, NULL))
+	    !boot_cpu_has(X86_FEATURE_BMI2))
 		return 0;
=20
 	if (boot_cpu_has(X86_FEATURE_PREFER_YMM)) {
diff --git a/arch/x86/crypto/aria_aesni_avx2_glue.c b/arch/x86/crypto/aria_ae=
sni_avx2_glue.c
index 1487a49..371be2f 100644
--- a/arch/x86/crypto/aria_aesni_avx2_glue.c
+++ b/arch/x86/crypto/aria_aesni_avx2_glue.c
@@ -195,22 +195,13 @@ static struct skcipher_alg aria_algs[] =3D {
=20
 static int __init aria_avx2_init(void)
 {
-	const char *feature_name;
-
 	if (!boot_cpu_has(X86_FEATURE_AVX) ||
 	    !boot_cpu_has(X86_FEATURE_AVX2) ||
-	    !boot_cpu_has(X86_FEATURE_AES) ||
-	    !boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+	    !boot_cpu_has(X86_FEATURE_AES)) {
 		pr_info("AVX2 or AES-NI instructions are not detected.\n");
 		return -ENODEV;
 	}
=20
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				&feature_name)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
-		return -ENODEV;
-	}
-
 	if (boot_cpu_has(X86_FEATURE_GFNI)) {
 		aria_ops.aria_encrypt_16way =3D aria_aesni_avx_gfni_encrypt_16way;
 		aria_ops.aria_decrypt_16way =3D aria_aesni_avx_gfni_decrypt_16way;
diff --git a/arch/x86/crypto/aria_aesni_avx_glue.c b/arch/x86/crypto/aria_aes=
ni_avx_glue.c
index e4e3d78..d23fc91 100644
--- a/arch/x86/crypto/aria_aesni_avx_glue.c
+++ b/arch/x86/crypto/aria_aesni_avx_glue.c
@@ -182,21 +182,12 @@ static struct skcipher_alg aria_algs[] =3D {
=20
 static int __init aria_avx_init(void)
 {
-	const char *feature_name;
-
 	if (!boot_cpu_has(X86_FEATURE_AVX) ||
-	    !boot_cpu_has(X86_FEATURE_AES) ||
-	    !boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+	    !boot_cpu_has(X86_FEATURE_AES)) {
 		pr_info("AVX or AES-NI instructions are not detected.\n");
 		return -ENODEV;
 	}
=20
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				&feature_name)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
-		return -ENODEV;
-	}
-
 	if (boot_cpu_has(X86_FEATURE_GFNI)) {
 		aria_ops.aria_encrypt_16way =3D aria_aesni_avx_gfni_encrypt_16way;
 		aria_ops.aria_decrypt_16way =3D aria_aesni_avx_gfni_decrypt_16way;
diff --git a/arch/x86/crypto/aria_gfni_avx512_glue.c b/arch/x86/crypto/aria_g=
fni_avx512_glue.c
index 363cbf4..e05bbeb 100644
--- a/arch/x86/crypto/aria_gfni_avx512_glue.c
+++ b/arch/x86/crypto/aria_gfni_avx512_glue.c
@@ -196,24 +196,15 @@ static struct skcipher_alg aria_algs[] =3D {
=20
 static int __init aria_avx512_init(void)
 {
-	const char *feature_name;
-
 	if (!boot_cpu_has(X86_FEATURE_AVX) ||
 	    !boot_cpu_has(X86_FEATURE_AVX2) ||
 	    !boot_cpu_has(X86_FEATURE_AVX512F) ||
 	    !boot_cpu_has(X86_FEATURE_AVX512VL) ||
-	    !boot_cpu_has(X86_FEATURE_GFNI) ||
-	    !boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+	    !boot_cpu_has(X86_FEATURE_GFNI)) {
 		pr_info("AVX512/GFNI instructions are not detected.\n");
 		return -ENODEV;
 	}
=20
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM |
-			       XFEATURE_MASK_AVX512, &feature_name)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
-		return -ENODEV;
-	}
-
 	aria_ops.aria_encrypt_16way =3D aria_aesni_avx_gfni_encrypt_16way;
 	aria_ops.aria_decrypt_16way =3D aria_aesni_avx_gfni_decrypt_16way;
 	aria_ops.aria_ctr_crypt_16way =3D aria_aesni_avx_gfni_ctr_crypt_16way;
diff --git a/arch/x86/crypto/camellia_aesni_avx2_glue.c b/arch/x86/crypto/cam=
ellia_aesni_avx2_glue.c
index 2d2f4e1..073fa3b 100644
--- a/arch/x86/crypto/camellia_aesni_avx2_glue.c
+++ b/arch/x86/crypto/camellia_aesni_avx2_glue.c
@@ -97,22 +97,13 @@ static struct skcipher_alg camellia_algs[] =3D {
=20
 static int __init camellia_aesni_init(void)
 {
-	const char *feature_name;
-
 	if (!boot_cpu_has(X86_FEATURE_AVX) ||
 	    !boot_cpu_has(X86_FEATURE_AVX2) ||
-	    !boot_cpu_has(X86_FEATURE_AES) ||
-	    !boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+	    !boot_cpu_has(X86_FEATURE_AES)) {
 		pr_info("AVX2 or AES-NI instructions are not detected.\n");
 		return -ENODEV;
 	}
=20
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				&feature_name)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
-		return -ENODEV;
-	}
-
 	return crypto_register_skciphers(camellia_algs,
 					 ARRAY_SIZE(camellia_algs));
 }
diff --git a/arch/x86/crypto/camellia_aesni_avx_glue.c b/arch/x86/crypto/came=
llia_aesni_avx_glue.c
index 5c321f2..872e5e0 100644
--- a/arch/x86/crypto/camellia_aesni_avx_glue.c
+++ b/arch/x86/crypto/camellia_aesni_avx_glue.c
@@ -98,21 +98,12 @@ static struct skcipher_alg camellia_algs[] =3D {
=20
 static int __init camellia_aesni_init(void)
 {
-	const char *feature_name;
-
 	if (!boot_cpu_has(X86_FEATURE_AVX) ||
-	    !boot_cpu_has(X86_FEATURE_AES) ||
-	    !boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+	    !boot_cpu_has(X86_FEATURE_AES)) {
 		pr_info("AVX or AES-NI instructions are not detected.\n");
 		return -ENODEV;
 	}
=20
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				&feature_name)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
-		return -ENODEV;
-	}
-
 	return crypto_register_skciphers(camellia_algs,
 					 ARRAY_SIZE(camellia_algs));
 }
diff --git a/arch/x86/crypto/cast5_avx_glue.c b/arch/x86/crypto/cast5_avx_glu=
e.c
index 3aca04d..5de35e8 100644
--- a/arch/x86/crypto/cast5_avx_glue.c
+++ b/arch/x86/crypto/cast5_avx_glue.c
@@ -92,11 +92,8 @@ static struct skcipher_alg cast5_algs[] =3D {
=20
 static int __init cast5_init(void)
 {
-	const char *feature_name;
-
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				&feature_name)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
+	if (!boot_cpu_has(X86_FEATURE_AVX)) {
+		pr_info("AVX instructions are not detected.\n");
 		return -ENODEV;
 	}
=20
diff --git a/arch/x86/crypto/cast6_avx_glue.c b/arch/x86/crypto/cast6_avx_glu=
e.c
index c4dd28c..3d7ea48 100644
--- a/arch/x86/crypto/cast6_avx_glue.c
+++ b/arch/x86/crypto/cast6_avx_glue.c
@@ -92,11 +92,8 @@ static struct skcipher_alg cast6_algs[] =3D {
=20
 static int __init cast6_init(void)
 {
-	const char *feature_name;
-
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				&feature_name)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
+	if (!boot_cpu_has(X86_FEATURE_AVX)) {
+		pr_info("AVX instructions are not detected.\n");
 		return -ENODEV;
 	}
=20
diff --git a/arch/x86/crypto/serpent_avx2_glue.c b/arch/x86/crypto/serpent_av=
x2_glue.c
index f5f2121..72a9e2b 100644
--- a/arch/x86/crypto/serpent_avx2_glue.c
+++ b/arch/x86/crypto/serpent_avx2_glue.c
@@ -93,17 +93,10 @@ static struct skcipher_alg serpent_algs[] =3D {
=20
 static int __init serpent_avx2_init(void)
 {
-	const char *feature_name;
-
-	if (!boot_cpu_has(X86_FEATURE_AVX2) || !boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+	if (!boot_cpu_has(X86_FEATURE_AVX2)) {
 		pr_info("AVX2 instructions are not detected.\n");
 		return -ENODEV;
 	}
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				&feature_name)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
-		return -ENODEV;
-	}
=20
 	return crypto_register_skciphers(serpent_algs,
 					 ARRAY_SIZE(serpent_algs));
diff --git a/arch/x86/crypto/serpent_avx_glue.c b/arch/x86/crypto/serpent_avx=
_glue.c
index 9c8b3a3..42c4e15 100644
--- a/arch/x86/crypto/serpent_avx_glue.c
+++ b/arch/x86/crypto/serpent_avx_glue.c
@@ -100,11 +100,8 @@ static struct skcipher_alg serpent_algs[] =3D {
=20
 static int __init serpent_init(void)
 {
-	const char *feature_name;
-
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				&feature_name)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
+	if (!boot_cpu_has(X86_FEATURE_AVX)) {
+		pr_info("AVX instructions are not detected.\n");
 		return -ENODEV;
 	}
=20
diff --git a/arch/x86/crypto/sm4_aesni_avx2_glue.c b/arch/x86/crypto/sm4_aesn=
i_avx2_glue.c
index fec0ab7..eef7389 100644
--- a/arch/x86/crypto/sm4_aesni_avx2_glue.c
+++ b/arch/x86/crypto/sm4_aesni_avx2_glue.c
@@ -98,22 +98,13 @@ static struct skcipher_alg sm4_aesni_avx2_skciphers[] =3D=
 {
=20
 static int __init sm4_init(void)
 {
-	const char *feature_name;
-
 	if (!boot_cpu_has(X86_FEATURE_AVX) ||
 	    !boot_cpu_has(X86_FEATURE_AVX2) ||
-	    !boot_cpu_has(X86_FEATURE_AES) ||
-	    !boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+	    !boot_cpu_has(X86_FEATURE_AES)) {
 		pr_info("AVX2 or AES-NI instructions are not detected.\n");
 		return -ENODEV;
 	}
=20
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				&feature_name)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
-		return -ENODEV;
-	}
-
 	return crypto_register_skciphers(sm4_aesni_avx2_skciphers,
 					 ARRAY_SIZE(sm4_aesni_avx2_skciphers));
 }
diff --git a/arch/x86/crypto/sm4_aesni_avx_glue.c b/arch/x86/crypto/sm4_aesni=
_avx_glue.c
index 88caf41..ed383da 100644
--- a/arch/x86/crypto/sm4_aesni_avx_glue.c
+++ b/arch/x86/crypto/sm4_aesni_avx_glue.c
@@ -314,21 +314,12 @@ static struct skcipher_alg sm4_aesni_avx_skciphers[] =
=3D {
=20
 static int __init sm4_init(void)
 {
-	const char *feature_name;
-
 	if (!boot_cpu_has(X86_FEATURE_AVX) ||
-	    !boot_cpu_has(X86_FEATURE_AES) ||
-	    !boot_cpu_has(X86_FEATURE_OSXSAVE)) {
+	    !boot_cpu_has(X86_FEATURE_AES)) {
 		pr_info("AVX or AES-NI instructions are not detected.\n");
 		return -ENODEV;
 	}
=20
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				&feature_name)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
-		return -ENODEV;
-	}
-
 	return crypto_register_skciphers(sm4_aesni_avx_skciphers,
 					 ARRAY_SIZE(sm4_aesni_avx_skciphers));
 }
diff --git a/arch/x86/crypto/twofish_avx_glue.c b/arch/x86/crypto/twofish_avx=
_glue.c
index 9e20db0..985bc54 100644
--- a/arch/x86/crypto/twofish_avx_glue.c
+++ b/arch/x86/crypto/twofish_avx_glue.c
@@ -102,10 +102,8 @@ static struct skcipher_alg twofish_algs[] =3D {
=20
 static int __init twofish_init(void)
 {
-	const char *feature_name;
-
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, &feature_name=
)) {
-		pr_info("CPU feature '%s' is not supported.\n", feature_name);
+	if (!boot_cpu_has(X86_FEATURE_AVX)) {
+		pr_info("AVX instructions are not detected.\n");
 		return -ENODEV;
 	}
=20
