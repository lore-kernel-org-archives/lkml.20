Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B7F490BE0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799074; cv=none; b=QFoeKjMXAhJsaCwy0DefnWCO5as1pfuKBocKxV6LgJzzRYbzcO2k1gsL2xnC6OEwsxQsQvZjJirqqJjarA/mivHWQAVMh/nsgQxsApeQwAOpCWpeW3ZjaLXiqQHNy6cgV43IheLkOQUYE+nGquU982gnAlJ87RilVQ3uNwk1MXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799074; c=relaxed/simple;
	bh=Ta0BJoV366QjGLuB04AG6vFYi50SNgDk3/hcfWm2/KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nuYz+ALrpyHoHtHRvyglJss8OqTpJevHv1MzSHKpJPn8iRpzZkri5qgVmWFY6Mcq2lcbnveozLf7tN78TgI9DkDLnEjZI2qxAfwjWm69xHTbxeeo0IVNoZLaRFfSN4wP4i16sPPenICp2K1cpZ14gcTgmyV6bBSQhUTN1Jv79tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXq9/SeA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXq9/SeA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38E1A1F00A3D;
	Mon,  7 Sep 2026 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799069;
	bh=lPrkfAXnyVR+sgg/nvBW0HnQu9CN1G6qPn9X/cZtdc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JXq9/SeANohjjJelBr1h9+h1jcvGFIKikZivAEx270yKOhUq1H3cqMfDkTsf0xF0j
	 uB8g5B7q3bEGtOK6qxsJtM1MqL/lm6O3jNtwdwsALNunbWDtW8CWH2JV5RUfig/jje
	 g5ofEbvI1pH6RCZiHq/1jd0NoIx/krybQIRQtYC7KP/wjU7EXtaLQbticQphfmrVAh
	 EVzla3MToO4W228msz497wKYEGSgaaVDQPMvU/vHjVyKSq/LIUyiY+lko6MJq6NDtf
	 aVQmfHFkTS+iHHh4qHPBVe495I9qVjHJYrCqWeSOaAtryYoUa5N1bo6yq7pG9Ljg1e
	 nnfP3GkFPLm8w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 03/14] arm64: crypto: Assume a little-endian kernel
Date: Mon,  7 Sep 2026 17:37:14 +0100
Message-ID: <20260907163726.17104-4-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907163726.17104-1-will@kernel.org>
References: <20260907163726.17104-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 5276ea17a23c ("lib/crc: arm64: Assume a little-endian kernel")
removed all usage of the CPU_LE()/CPU_BE() macros from the arm64 CRC
assembly now that big-endian support depends on BROKEN.

Do the same for the crypto assembly code.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/crypto/aes-ce-ccm-core.S    | 4 ++--
 arch/arm64/crypto/aes-neonbs-core.S    | 4 ++--
 arch/arm64/crypto/ghash-ce-core.S      | 6 +++---
 arch/arm64/crypto/sm4-ce-cipher-core.S | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/crypto/aes-ce-ccm-core.S b/arch/arm64/crypto/aes-ce-ccm-core.S
index f2624238fd95..c2e8f500da14 100644
--- a/arch/arm64/crypto/aes-ce-ccm-core.S
+++ b/arch/arm64/crypto/aes-ce-ccm-core.S
@@ -50,7 +50,7 @@
 	ld1	{v0.16b}, [x5]			/* load mac */
 	cbz	x2, ce_aes_ccm_final
 	ldr	x8, [x6, #8]			/* load lower ctr */
-CPU_LE(	rev	x8, x8			)	/* keep swabbed ctr in reg */
+	rev	x8, x8				/* keep swabbed ctr in reg */
 0:	/* outer loop */
 	ld1	{v1.8b}, [x6]			/* load upper ctr */
 	prfm	pldl1strm, [x1]
@@ -73,7 +73,7 @@ CPU_LE(	rev	x8, x8			)	/* keep swabbed ctr in reg */
 	eor	v0.16b, v0.16b, v2.16b		/* xor mac with pt ^ rk[last] */
 	st1	{v6.16b}, [x0], #16		/* write output block */
 	bne	0b
-CPU_LE(	rev	x8, x8			)
+	rev	x8, x8
 	str	x8, [x6, #8]			/* store lsb end of ctr (BE) */
 	cbnz	x7, ce_aes_ccm_final
 	st1	{v0.16b}, [x5]			/* store mac */
diff --git a/arch/arm64/crypto/aes-neonbs-core.S b/arch/arm64/crypto/aes-neonbs-core.S
index baf450717b24..ba1f981a5464 100644
--- a/arch/arm64/crypto/aes-neonbs-core.S
+++ b/arch/arm64/crypto/aes-neonbs-core.S
@@ -824,8 +824,8 @@ SYM_FUNC_START(aesbs_ctr_encrypt)
 	frame_push	0
 	ldp		x7, x8, [x5]
 	ld1		{v0.16b}, [x5]
-CPU_LE(	rev		x7, x7		)
-CPU_LE(	rev		x8, x8		)
+	rev		x7, x7
+	rev		x8, x8
 	adds		x8, x8, #1
 	adc		x7, x7, xzr
 
diff --git a/arch/arm64/crypto/ghash-ce-core.S b/arch/arm64/crypto/ghash-ce-core.S
index 33772d8fe6b5..ba350d57fc76 100644
--- a/arch/arm64/crypto/ghash-ce-core.S
+++ b/arch/arm64/crypto/ghash-ce-core.S
@@ -148,7 +148,7 @@ SYM_FUNC_START(pmull_ghash_update_p64)
 	sub		w0, w0, #1
 
 3:	/* multiply XL by SHASH in GF(2^128) */
-CPU_LE(	rev64		T1.16b, T1.16b	)
+	rev64		T1.16b, T1.16b
 
 	ext		T2.16b, XL.16b, XL.16b, #8
 	ext		IN1.16b, T1.16b, T1.16b, #8
@@ -272,7 +272,7 @@ SYM_FUNC_END(pmull_ghash_update_p64)
 	cbz		x0, 3f				// tag only?
 
 	ldr		w8, [x5, #12]			// load lower counter
-CPU_LE(	rev		w8, w8		)
+	rev		w8, w8
 
 0:	mov		w9, #4				// max blocks per round
 	add		x10, x0, #0xf
@@ -380,7 +380,7 @@ CPU_LE(	rev		w8, w8		)
 	ret
 
 5:
-CPU_LE(	rev		w8, w8		)
+	rev		w8, w8
 	str		w8, [x5, #12]			// store lower counter
 	st1		{XL.2d}, [x4]
 	b		4b
diff --git a/arch/arm64/crypto/sm4-ce-cipher-core.S b/arch/arm64/crypto/sm4-ce-cipher-core.S
index 4ac6cfbc5797..1682d727e097 100644
--- a/arch/arm64/crypto/sm4-ce-cipher-core.S
+++ b/arch/arm64/crypto/sm4-ce-cipher-core.S
@@ -18,7 +18,7 @@
 SYM_FUNC_START(sm4_ce_do_crypt)
 	ld1		{v8.4s}, [x2]
 	ld1		{v0.4s-v3.4s}, [x0], #64
-CPU_LE(	rev32		v8.16b, v8.16b		)
+	rev32		v8.16b, v8.16b
 	ld1		{v4.4s-v7.4s}, [x0]
 	sm4e		v8.4s, v0.4s
 	sm4e		v8.4s, v1.4s
@@ -30,7 +30,7 @@ CPU_LE(	rev32		v8.16b, v8.16b		)
 	sm4e		v8.4s, v7.4s
 	rev64		v8.4s, v8.4s
 	ext		v8.16b, v8.16b, v8.16b, #8
-CPU_LE(	rev32		v8.16b, v8.16b		)
+	rev32		v8.16b, v8.16b
 	st1		{v8.4s}, [x1]
 	ret
 SYM_FUNC_END(sm4_ce_do_crypt)
-- 
2.55.0.979.g7e5102b832-goog

