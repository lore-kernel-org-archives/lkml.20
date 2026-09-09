Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B7653CA78;
	Wed,  9 Sep 2026 23:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998287; cv=none; b=DFhSKPW1ednymPIPQBpZvkNKw63yWP13Hd4rmv4CpCrvSSHFccWoXBC04LW9fMtJw6n3EJC2akQFSUXhPYXvxFGY46gw1zRONb6FQPPa8Qm67K2z/+GteAQajajQfx6m9CTLvkVCAWtLbuE4b4dGQgI2vMpVoxYye66iEmqNvSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998287; c=relaxed/simple;
	bh=JtbiZtANYTMCXN5xO4VocEA+cQZdSAbdzkjyMNA4+VI=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=kRuw8o8TUrxVasjIN3bjWXpQ98wfC7YRoQbtp37gY9dBfF7k/iJWb1f+Pza+121rKRuQeOohV4owJq10jgINvWky680xVnwHrF6HT2JkE679OCE4BVjso/Lr7VeTe3rdxlFqXRt+nc9rgNchsmFjPPrX2ZP0jrnlfwbUxngdEes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZYDi7wko; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jUMSJDay; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZYDi7wko";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jUMSJDay"
Date: Wed, 09 Sep 2026 23:57:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788998281;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lXoyIQkgFAgpXnht9GblQCR2TiTHgx7LrcdBPxTn6XE=;
	b=ZYDi7wkoMs7CsxVnnAxbEcWrQSRrnyTNkiDgdE68DY7mJVuZr4pxdHTph5QKOTOGiaVoWX
	+Q058HBLmmsSRo9bqtkDFAwEjyik+LLHA1PkJN/aF63Msm8dQjF3LcqgOM6w7KXgnhc2s1
	xsfg2CWf5WoTtIbKHIzSM6oY2mXr5LoTQDzAI2+7lpwQKFqmKWTxzYyTmdpJ3MPakiwHG0
	yVkudaVxYLiDjcH7S0YKgt6Exfp7kHZG6pMw3CgHE22bbzIPQcyOYgAxjzeDUdFLcyDeo4
	lwCfl8XaCu+1c3Mc1T32VbgfAfqvW2eUG9VoL+5AyM/fZ8jAblworchgaUGCZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788998281;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lXoyIQkgFAgpXnht9GblQCR2TiTHgx7LrcdBPxTn6XE=;
	b=jUMSJDay30sS4nnddHuD5mmMsTcaW8v8qV3T6ejzSMt7coVq8zbpYvu5xctT0G6CyOzOZh
	UMXXcXKTZwEHTRDA==
From: "tip-bot2 for Eric Biggers" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/fpu] lib/crypto: x86: Stop using cpu_has_xfeatures()
Cc: Eric Biggers <ebiggers@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 Christoph Hellwig <hch@lst.de>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260901145740.42337-5-ebiggers@kernel.org>
References: <20260901145740.42337-5-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178899827961.623050.10478759216188304628.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/fpu branch of tip:

Commit-ID:     ffe52429f87081d450d5a669bda9068ec7f36c8b
Gitweb:        https://git.kernel.org/tip/ffe52429f87081d450d5a669bda9068ec7f=
36c8b
Author:        Eric Biggers <ebiggers@kernel.org>
AuthorDate:    Tue, 01 Sep 2026 07:57:36 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Tue, 08 Sep 2026 21:53:17 -07:00

lib/crypto: x86: Stop using cpu_has_xfeatures()

Checking both boot_cpu_has() and cpu_has_xfeatures() has never really been
needed in practice, and it's never been universally done (e.g., lib/raid/
omits cpu_has_xfeatures()).  Nevertheless, both x86 and UML now explicitly
clear the AVX and AVX-512 flags if their xfeatures are missing, which should
remove any remaining doubts.

Thus, remove all the calls to cpu_has_xfeatures().

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Christoph Hellwig <hch@lst.de>
Link: https://patch.msgid.link/20260901145740.42337-5-ebiggers@kernel.org
---
 lib/crypto/x86/blake2s.h  | 4 +---
 lib/crypto/x86/chacha.h   | 3 +--
 lib/crypto/x86/nh.h       | 4 +---
 lib/crypto/x86/poly1305.h | 7 ++-----
 lib/crypto/x86/sha1.h     | 4 +---
 lib/crypto/x86/sha256.h   | 4 +---
 lib/crypto/x86/sha512.h   | 3 +--
 lib/crypto/x86/sm3.h      | 3 +--
 8 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/lib/crypto/x86/blake2s.h b/lib/crypto/x86/blake2s.h
index f8eed6c..0f7c51f 100644
--- a/lib/crypto/x86/blake2s.h
+++ b/lib/crypto/x86/blake2s.h
@@ -55,8 +55,6 @@ static void blake2s_mod_init_arch(void)
 	if (boot_cpu_has(X86_FEATURE_AVX) &&
 	    boot_cpu_has(X86_FEATURE_AVX2) &&
 	    boot_cpu_has(X86_FEATURE_AVX512F) &&
-	    boot_cpu_has(X86_FEATURE_AVX512VL) &&
-	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM |
-			      XFEATURE_MASK_AVX512, NULL))
+	    boot_cpu_has(X86_FEATURE_AVX512VL))
 		static_branch_enable(&blake2s_use_avx512);
 }
diff --git a/lib/crypto/x86/chacha.h b/lib/crypto/x86/chacha.h
index 10cf8f1..c79562a 100644
--- a/lib/crypto/x86/chacha.h
+++ b/lib/crypto/x86/chacha.h
@@ -165,8 +165,7 @@ static void chacha_mod_init_arch(void)
 	static_branch_enable(&chacha_use_simd);
=20
 	if (boot_cpu_has(X86_FEATURE_AVX) &&
-	    boot_cpu_has(X86_FEATURE_AVX2) &&
-	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL)) {
+	    boot_cpu_has(X86_FEATURE_AVX2)) {
 		static_branch_enable(&chacha_use_avx2);
=20
 		if (boot_cpu_has(X86_FEATURE_AVX512VL) &&
diff --git a/lib/crypto/x86/nh.h b/lib/crypto/x86/nh.h
index 83361c2..342636d 100644
--- a/lib/crypto/x86/nh.h
+++ b/lib/crypto/x86/nh.h
@@ -37,9 +37,7 @@ static void nh_mod_init_arch(void)
 {
 	if (boot_cpu_has(X86_FEATURE_XMM2)) {
 		static_branch_enable(&have_sse2);
-		if (boot_cpu_has(X86_FEATURE_AVX2) &&
-		    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				      NULL))
+		if (boot_cpu_has(X86_FEATURE_AVX2))
 			static_branch_enable(&have_avx2);
 	}
 }
diff --git a/lib/crypto/x86/poly1305.h b/lib/crypto/x86/poly1305.h
index ee92e37..b061b99 100644
--- a/lib/crypto/x86/poly1305.h
+++ b/lib/crypto/x86/poly1305.h
@@ -143,15 +143,12 @@ static void poly1305_emit(const struct poly1305_state *=
ctx,
 #define poly1305_mod_init_arch poly1305_mod_init_arch
 static void poly1305_mod_init_arch(void)
 {
-	if (boot_cpu_has(X86_FEATURE_AVX) &&
-	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL))
+	if (boot_cpu_has(X86_FEATURE_AVX))
 		static_branch_enable(&poly1305_use_avx);
-	if (boot_cpu_has(X86_FEATURE_AVX) && boot_cpu_has(X86_FEATURE_AVX2) &&
-	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL))
+	if (boot_cpu_has(X86_FEATURE_AVX) && boot_cpu_has(X86_FEATURE_AVX2))
 		static_branch_enable(&poly1305_use_avx2);
 	if (boot_cpu_has(X86_FEATURE_AVX) && boot_cpu_has(X86_FEATURE_AVX2) &&
 	    boot_cpu_has(X86_FEATURE_AVX512F) &&
-	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM | XFEATURE_MASK=
_AVX512, NULL) &&
 	    /* Skylake downclocks unacceptably much when using zmm, but later gener=
ations are fast. */
 	    boot_cpu_data.x86_vfm !=3D INTEL_SKYLAKE_X)
 		static_branch_enable(&poly1305_use_avx512);
diff --git a/lib/crypto/x86/sha1.h b/lib/crypto/x86/sha1.h
index c48a013..6aff433 100644
--- a/lib/crypto/x86/sha1.h
+++ b/lib/crypto/x86/sha1.h
@@ -59,9 +59,7 @@ static void sha1_mod_init_arch(void)
 {
 	if (boot_cpu_has(X86_FEATURE_SHA_NI)) {
 		static_call_update(sha1_blocks_x86, sha1_blocks_ni);
-	} else if (cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				     NULL) &&
-		   boot_cpu_has(X86_FEATURE_AVX)) {
+	} else if (boot_cpu_has(X86_FEATURE_AVX)) {
 		if (boot_cpu_has(X86_FEATURE_AVX2) &&
 		    boot_cpu_has(X86_FEATURE_BMI1) &&
 		    boot_cpu_has(X86_FEATURE_BMI2))
diff --git a/lib/crypto/x86/sha256.h b/lib/crypto/x86/sha256.h
index 0ee69d8..e98ffda 100644
--- a/lib/crypto/x86/sha256.h
+++ b/lib/crypto/x86/sha256.h
@@ -104,9 +104,7 @@ static void sha256_mod_init_arch(void)
 		   boot_cpu_has(X86_FEATURE_PHE_EN) &&
 		   boot_cpu_data.x86 >=3D 0x07) {
 		static_call_update(sha256_blocks_x86, sha256_blocks_phe);
-	} else if (cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM,
-				     NULL) &&
-		   boot_cpu_has(X86_FEATURE_AVX)) {
+	} else if (boot_cpu_has(X86_FEATURE_AVX)) {
 		if (boot_cpu_has(X86_FEATURE_AVX2) &&
 		    boot_cpu_has(X86_FEATURE_BMI2))
 			static_call_update(sha256_blocks_x86,
diff --git a/lib/crypto/x86/sha512.h b/lib/crypto/x86/sha512.h
index 0213c70..4e177b4 100644
--- a/lib/crypto/x86/sha512.h
+++ b/lib/crypto/x86/sha512.h
@@ -37,8 +37,7 @@ static void sha512_blocks(struct sha512_block_state *state,
 #define sha512_mod_init_arch sha512_mod_init_arch
 static void sha512_mod_init_arch(void)
 {
-	if (cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL) &&
-	    boot_cpu_has(X86_FEATURE_AVX)) {
+	if (boot_cpu_has(X86_FEATURE_AVX)) {
 		if (boot_cpu_has(X86_FEATURE_AVX2) &&
 		    boot_cpu_has(X86_FEATURE_BMI2))
 			static_call_update(sha512_blocks_x86,
diff --git a/lib/crypto/x86/sm3.h b/lib/crypto/x86/sm3.h
index 3834780..e06d4a2 100644
--- a/lib/crypto/x86/sm3.h
+++ b/lib/crypto/x86/sm3.h
@@ -33,7 +33,6 @@ static void sm3_blocks(struct sm3_block_state *state,
 #define sm3_mod_init_arch sm3_mod_init_arch
 static void sm3_mod_init_arch(void)
 {
-	if (boot_cpu_has(X86_FEATURE_AVX) && boot_cpu_has(X86_FEATURE_BMI2) &&
-	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL))
+	if (boot_cpu_has(X86_FEATURE_AVX) && boot_cpu_has(X86_FEATURE_BMI2))
 		static_call_update(sm3_blocks_x86, sm3_blocks_avx);
 }
