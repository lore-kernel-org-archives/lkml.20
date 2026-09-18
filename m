Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2834FD792
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743157; cv=none; b=jZ5xDOIUiWUJSRBO76Y2j9BnHmo8CkjlrD/+VZQ6+reFEWYBrOfsCcUFDyrOUpF5Pfy9tckVwq9I5AYvbHfMHLMyJ/iAoXiOSOj1ufpOAJMTPHqkFElQguktPoiSW4Rf68J1wPe3vi/EpPpxpLXUSGykjsv4Sg6llpjBX6Kx9gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743157; c=relaxed/simple;
	bh=6b5uJTBh8KBJxydF3x9ujPef/1MS6ZWCDmUvmhzGusE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J+4q11VKxUMCTwLdxuuiINlgbMNlnXnCZs5If68KflnGNI5gHHXRjWHPUP59ylt1mmvFUcP88DDmrg0KoqJ6r4GKNnvuVV7B7w+HH7r7bkjiAPQNLQP3Jhs1OFzjfhNFKvJ0F7jvmBsjhs/uAc3DpJpcJL/iMnAhCZVviW3gP2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVHbzjhC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVHbzjhC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434281F0089A;
	Fri, 18 Sep 2026 14:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743150;
	bh=RnutA+SVEPQhig+pWBctSm0lXzVfwP4aZM5FopJbHtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NVHbzjhCKBzFJ93rW2N72ADw2QOi2UOdtdCn8dgyKgGKczC3D02G0QfqTKYT2Cnjt
	 IjZWGBwGHNhEHimgXtJIyfYXtUps3sQrWR3agnXu3hSTCXKi+TLH/jBX0s0k8oFRUH
	 Hh51/9NoGJuuIKYU7tYBnFZX6V7eAYgZj0FYxoA/KOkCJ3raG+RxX1edGI6BYoJvXN
	 jwOtIbWpcUrdmbiDDhpms002VfnT3A2X6Lb6UlRyoNHNv/bkPbq8Lh6WXbaVaGutWt
	 G+BmJFWDau9OaFaahLjKJGss478HL7ReG86HEtSHBqlkuH5qNd76tWF4/ZSnCfJrnM
	 EfZFxcoEo2xwQ==
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
Subject: [PATCH v3 02/13] arm64: bpf: Remove big-endian support from the JIT compiler
Date: Fri, 18 Sep 2026 15:52:04 +0100
Message-ID: <20260918145217.1669-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
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
Acked-by: Alexei Starovoitov <ast@kernel.org>
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
2.55.0.1082.g2b9226bbc0-goog

