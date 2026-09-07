Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7022C4D2EEC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799088; cv=none; b=EEfDfRHnyFvRxyC7qIIKRyfTvUcHCqzyrBQlFmLBnp8XrK3TDH2uSvUyG1WvXFVyA3dexZFBnD/vcOuKT2HJgJndbBN+NcuGS6loF1sVj3x1lpcFnvd+Pt9HKNbZZcG9fEbnhX4jdJsjdX23gXWNhVb4wdlZv10DTJItjWNIQUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799088; c=relaxed/simple;
	bh=liz77i/89QQKXV+6l33zXfgvWGjxMFbvMbLGZo6I93M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MY/Yzn1idgu5C83fr7KXbBgyFMYMFv8PZPvO9/BmYC8dkZbD68qiFxPP7Mu6zg7WRkgmBcesTAqNY6H2A7m3Huo0BnltOcN893wvYEqGNIs9nwuSa8eoweaeYWTsegErbIujCFNXkq8W8N6jMnlKAtRLdOeSovT9i4w1DOtJYbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jf4xvxp7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jf4xvxp7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EF41F00A3E;
	Mon,  7 Sep 2026 16:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799078;
	bh=Zll3jkAF+tLjIy1FB2YfJYKG7wnrj2w3ollIYbYKORY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jf4xvxp7r/Z8Z39ZlKwoSaMvTsC0e+lKBYm3NWf/FPYaYgKfZMTNvmcic8JgOjGxd
	 vXb6tHu7nsCQ2xzwdo9tfZBWH4wRuj6AY2iNHfAY7OnduTVKH1wVcoQMgPYteqQAJ9
	 trYap4SyCn0zzjlJfJG4zUM/nvdatWZinV00zEnsu0Z7DyB3yjOT16oB6rSFGi49OF
	 JlnegUf/ULgd7lnDNOS8AqffgOpG7iFHQ5/tg/70iDMUYSAGqSW2MaRC5YRAc/5j1+
	 tnW0QXfIY1KVRARAnik6nY6uZjbL86G2yYCTTIE5I9omzuF10KyS22fYD3PK6Uq1V+
	 FbrQDX93yhOEA==
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
Subject: [PATCH v2 06/14] arm64: assembler: Remove endianness helper macros
Date: Mon,  7 Sep 2026 17:37:17 +0100
Message-ID: <20260907163726.17104-7-will@kernel.org>
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

The CPU_LE()/CPU_BE() helper macros are only used by head.S. Since
big-endian support depends on BROKEN, remove the last users along with
the macro definitions. The unused regs_to_64() assembly macro, which
somewhat bizarrely behaves differently depend on the endianness, is also
removed.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/assembler.h | 31 ------------------------------
 arch/arm64/kernel/head.S           |  3 +--
 2 files changed, 1 insertion(+), 33 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 0b58b550e8dc..42a167a75486 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -129,37 +129,6 @@ lr	.req	x30		// link register
 	b	\label
 	.endm
 
-/*
- * Select code when configured for BE.
- */
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define CPU_BE(code...) code
-#else
-#define CPU_BE(code...)
-#endif
-
-/*
- * Select code when configured for LE.
- */
-#ifdef CONFIG_CPU_BIG_ENDIAN
-#define CPU_LE(code...)
-#else
-#define CPU_LE(code...) code
-#endif
-
-/*
- * Define a macro that constructs a 64-bit value by concatenating two
- * 32-bit registers. Note that on big endian systems the order of the
- * registers is swapped.
- */
-#ifndef CONFIG_CPU_BIG_ENDIAN
-	.macro	regs_to_64, rd, lbits, hbits
-#else
-	.macro	regs_to_64, rd, hbits, lbits
-#endif
-	orr	\rd, \lbits, \hbits, lsl #32
-	.endm
-
 /*
  * Pseudo-ops for PC-relative adr/ldr/str <reg>, <symbol> where
  * <symbol> is within the range +/- 4 GB of the PC.
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca..8951ce693552 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -138,8 +138,7 @@ SYM_CODE_START_LOCAL(record_mmu_state)
 	b.ne	0f
 	mrs	x19, sctlr_el2
 0:
-CPU_LE( tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
-CPU_BE( tbz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
+	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
 	tst	x19, #SCTLR_ELx_C		// Z := (C == 0)
 	and	x19, x19, #SCTLR_ELx_M		// isolate M bit
 	csel	x19, xzr, x19, eq		// clear x19 if Z
-- 
2.55.0.979.g7e5102b832-goog

