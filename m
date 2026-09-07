Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7EC46DFF7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799068; cv=none; b=fKKXahEIR+ciZbv+FCSCFoNBlLGisJxURH62fJXEFD76d2dBxvqs7q95t766cuIstak2M36+5LZcTK9T08RVlIEElxShcIeNGEX6CS5KYJJhb+aXu/vFGtfLieUPbNV1FpdTiPB6XjRK4SJQpSUdtcKHcGhKskcPOEVyiB2iCfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799068; c=relaxed/simple;
	bh=Wyg1eN4jUdiTv0KZSQpmP1+a7E8NW+RZZqVlC/RfMl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCPbglSXKwMFoHd/YAlCfr57V/AF23PZaLLQwgyOOA3kKAlxCWYKLNlqFqDpDchj7R3fbnZm70d89P6VG2m+RmyUHn26wes4RMCZhmuCJ4ncyM+8d+NJE67EaJd5dqnepgSETalXKJgGIbGdsYGaki97mXQDd1L3AATLE4PCwbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OllL8Lp0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OllL8Lp0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFFE1F00A3F;
	Mon,  7 Sep 2026 16:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799066;
	bh=6dpWxBNfInUaNyuOgfIBwdLimXQZBIeRnLQ9BgIWjOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OllL8Lp00Z8nr/h17b8SYnuzFy/hSbyCf+Tvwy7p8L64bUGwMcN1nd6DGRDIN8fGd
	 lWzugKZ5CfdasfuwMRAZ4X9N3lClg+/7LBF5/p/hNytQOm3Vz4We/rmTvM3Iu4PCYB
	 H2dMwLJk55RtPvHCi2AUwjDzslaFvZrbSkIqGZBTJPQfmhoM/HLlkcZkHaZoMq2Yo3
	 lEIN43ThUvvn57i2gwSxBuGjYPXcHMyzxCZ6cEnzA4acvaVkXHp78mV1kAPMLgzcta
	 D7C3U9bEQJwqskOVZ+iclXqumAGaVnnGaPg8OuU06FZL3Swsv0O5vBvj+c51/grdLi
	 kFU3ux3+qnSXA==
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
Subject: [PATCH v2 02/14] arm64: bpf: Remove big-endian support from the JIT compiler
Date: Mon,  7 Sep 2026 17:37:13 +0100
Message-ID: <20260907163726.17104-3-will@kernel.org>
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

Big-endian support on arm64 depends on BROKEN. In preparation for
removing the dead code altogether, remove the big-endian-specific
support from the arm64 BPF JIT backend.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/net/bpf_jit_comp.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index c18e005a41db..a5634428fdd5 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1439,13 +1439,8 @@ static int build_insn(const struct bpf_verifier_env *env, const struct bpf_insn
 	case BPF_ALU | BPF_END | BPF_FROM_LE:
 	case BPF_ALU | BPF_END | BPF_FROM_BE:
 	case BPF_ALU64 | BPF_END | BPF_FROM_LE:
-#ifdef CONFIG_CPU_BIG_ENDIAN
-		if (BPF_CLASS(code) == BPF_ALU && BPF_SRC(code) == BPF_FROM_BE)
-			goto emit_bswap_uxt;
-#else /* !CONFIG_CPU_BIG_ENDIAN */
 		if (BPF_CLASS(code) == BPF_ALU && BPF_SRC(code) == BPF_FROM_LE)
 			goto emit_bswap_uxt;
-#endif
 		switch (imm) {
 		case 16:
 			emit(A64_REV16(is64, dst, dst), ctx);
@@ -2559,15 +2554,9 @@ static void clear_garbage(struct jit_ctx *ctx, int reg, int effective_bytes)
 {
 	if (effective_bytes) {
 		int garbage_bits = 64 - 8 * effective_bytes;
-#ifdef CONFIG_CPU_BIG_ENDIAN
-		/* garbage bits are at the right end */
-		emit(A64_LSR(1, reg, reg, garbage_bits), ctx);
-		emit(A64_LSL(1, reg, reg, garbage_bits), ctx);
-#else
 		/* garbage bits are at the left end */
 		emit(A64_LSL(1, reg, reg, garbage_bits), ctx);
 		emit(A64_LSR(1, reg, reg, garbage_bits), ctx);
-#endif
 	}
 }
 
-- 
2.55.0.979.g7e5102b832-goog

