Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378BB503BE0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 23:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790378442; cv=none; b=n11Fiu52uKFau+OkGkSRh9kshCbD8EFpW8VQ0H7WMxqnQrj+q8C4beVPh7b0vG9CH7gZlwRmm3QXeSujMghMcXKb32vKx2G+q7xI7sdGmbcIWcpANQbk6xNPAipN8lj7oSCnX0SNDyxkYqIL6oZUe55wsmBtp1hnRbWeT2Ryx68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790378442; c=relaxed/simple;
	bh=mnr2716YaHPAO0nVOSdHC3VsliESQNKqJupXjuPmYD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uedEMX4b5YSNc5vq9XaPWl/9pz1J1a4h4oU1t+kk63d3sRW8HYqlctdxWRA+shdsUMk/+QACsaIwmnMa870qWESUaJsD6zyQvzdrOK45GE9v2PGiQLGcQ8Td+UUyYrSBaHcRU4FAvt1BU8XTV+xnB2wKv6mLX10S5j6lLJtwEE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com; spf=pass smtp.mailfrom=anyfinetworks.com; dkim=pass (2048-bit key) header.d=anyfinetworks.com header.i=@anyfinetworks.com header.b=eG0OZXE+; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=anyfinetworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=anyfinetworks.com header.i=@anyfinetworks.com header.b="eG0OZXE+"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8eb39a8edso866004e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anyfinetworks.com; s=google; t=1790378439; x=1790983239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=olvTM2tN3VJg9EC4QPtcU4S00qD0Qhx+5j+KpH00jBY=;
        b=eG0OZXE+HDfyTTRd8OhYMu/SPKKQ7hAHP/UGAvY7wIr6uIBvFpPaH4sCSWo7uJFgum
         lR56AYZKtA1yom0ftqQlLkPVQxbwO9PCjNWE46wzG13S0DExpqxVlMlsA1H6D+Ey+07n
         YHnny9nIdA4y3CVnJN+yol7SlA92GIJAbkErYNEWUbM6B3A2pzhTNoRqNtXpX0do+wuO
         DshpeRNrlYnDdpPiw6LTDMFvO6j9SA2JUablqsPlrMUT8b3bU7MYpRu3lzPtw0TtgjvN
         5lBGWHii4qhpq+jg526tZqK9hFYy0FDnsvWCtLNTIkPJzpmyLf3GGUa4BYKnV9O55Ikr
         Z3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790378439; x=1790983239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=olvTM2tN3VJg9EC4QPtcU4S00qD0Qhx+5j+KpH00jBY=;
        b=Pxd+5VKVIIMYeRIEWW7pIS6vIb2/a455aQ2lZVtNGLwoa4k/ZcAAPSf57HFIkfzL4h
         /47FBF/soIs6pxSwcdV11Dk71UWwuuFLPvbXqZwanG84ycdXjApgMLGZHIqF2GXndX5b
         P6ycAu1/MVd4ckepAAyq3J++2ATK20KojhFyhLhlD4VLzBB5Qb76YvROCXm26y8NJMQw
         euIHH0C+gdoM3tmF6c5y/lZ2+kEK+FeCXATwhryNvecaulWtROYGRjsKCh2etr3Toze/
         Eq4wVtl0Zg2mTU2BZQo/gzCbv/FjFJq2CxFnCiMjYm3l9Kvorflkl03/e52n+2mmFf7V
         utyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHyFbDnEiHQ0dcEbSy82VC1wftfTClVYG2fXTcSWlbf/YdX8p3kwFuKsH4/IUIh/asIPviZgF/E+k1rTs=@vger.kernel.org
X-Gm-Message-State: AFuF++lhYYPtuTLNbTrBy769vtAh21UchjBsUCWALeHsIrPf4MePbxDU
	6IpK3aaRJi7BCMCN1VL/BDcp4e/vCYoSVKGzlYd7oEXhBxPvKGDwMlPAbT0+qAsCy9U=
X-Gm-Gg: AYBFou0mKRsMd4zf0Zx7XAXOehI3r7kBkBvhPk6czsQkEyE3l8J2imTDoyW8pFufByK
	VJqbinldSZ/bfbZ8JX9lDuX8Pnj7BU01LfvplVcNkBZaSI6UbUSqSim5GpCNRpBV30s+RZ/yVVS
	wWIbKGSWbnVDzle7TY4KOairBXss/kRI6UPZsG9UR+u00MUb/+Tcu17NKW1jd62dyU44jHx+JVm
	hu99er5zd54IHNn5yDT4uLa1w/qEOW5xtJfFFakVBwzEIUgWofTPWbQsoILI4/7BDtSHy5iwL90
	ljJ7jvMidQfiI5ohXyNbq0aVEeRKiInotsjKCYNvoaX/xdXEAx9ya6jneSLd6FhL17akqTkeUHB
	rSPlWBZ81F0CfFuc+7lwlJmjjYw3y1Lpc1LiXO54wWWDoeMQX6csfQ3ZLtT6jjcQ6sqVLwQC3tW
	0z3Fg9OA354QGEOGk1ZGcoAKScR5BGd0L518sW+L6ApUCbdtPEO+loX41V1PvLKyXxGVZUic8v6
	rsQ98T8DpMWKHWgWm/TWIGQ9jS0Hvr/zT9+lHnvOGE=
X-Received: by 2002:a05:6512:668b:20b0:5b6:1a7c:59d3 with SMTP id 2adb3069b0e04-5b8df0d0059mr1857582e87.45.1790378439335;
        Fri, 25 Sep 2026 16:20:39 -0700 (PDT)
Received: from nuc.. (78-69-188-101-no600.tbcn.telia.com. [78.69.188.101])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6af81cfsm875260e87.40.2026.09.25.16.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 16:20:38 -0700 (PDT)
From: Johan Almbladh <johan.almbladh@anyfinetworks.com>
To: tsbogend@alpha.franken.de,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	paulburton@kernel.org,
	main.kalliope@gmail.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	philmd@oss.qualcomm.com,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>
Subject: [PATCH bpf-next 1/2] bpf, mips: Add JIT support for unconditional BSWAP
Date: Sat, 26 Sep 2026 01:19:31 +0200
Message-ID: <20260925231932.1063678-2-johan.almbladh@anyfinetworks.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925231932.1063678-1-johan.almbladh@anyfinetworks.com>
References: <20260925231932.1063678-1-johan.almbladh@anyfinetworks.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The unconditional BSWAP instruction from the eBPF v4 ISA was not
implemented. This caused programs using the instruction to fall
back to the interpreter.

Implement the unconditional BSWAP instruction.

Signed-off-by: Johan Almbladh <johan.almbladh@anyfinetworks.com>
---
 arch/mips/net/bpf_jit_comp32.c | 4 ++++
 arch/mips/net/bpf_jit_comp64.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/mips/net/bpf_jit_comp32.c b/arch/mips/net/bpf_jit_comp32.c
index bbbe4a737825..158e69718c09 100644
--- a/arch/mips/net/bpf_jit_comp32.c
+++ b/arch/mips/net/bpf_jit_comp32.c
@@ -1701,6 +1701,10 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 	case BPF_ALU64 | BPF_MOD | BPF_X:
 		emit_divmod_r64(ctx, dst, src, BPF_OP(code), off);
 		break;
+	/* dst = bswap(dst) */
+	case BPF_ALU64 | BPF_END:
+		emit_bswap_r64(ctx, dst, imm);
+		break;
 	/* dst = htole(dst) */
 	/* dst = htobe(dst) */
 	case BPF_ALU | BPF_END | BPF_FROM_LE:
diff --git a/arch/mips/net/bpf_jit_comp64.c b/arch/mips/net/bpf_jit_comp64.c
index b04b68fa5ace..8359ad3f6992 100644
--- a/arch/mips/net/bpf_jit_comp64.c
+++ b/arch/mips/net/bpf_jit_comp64.c
@@ -876,6 +876,10 @@ int build_insn(const struct bpf_insn *insn, struct jit_context *ctx)
 	case BPF_ALU64 | BPF_MOD | BPF_X:
 		emit_alu_r64(ctx, dst, src, BPF_OP(code), off);
 		break;
+	/* dst = bswap(dst) */
+	case BPF_ALU64 | BPF_END:
+		emit_bswap_r64(ctx, dst, imm);
+		break;
 	/* dst = htole(dst) */
 	/* dst = htobe(dst) */
 	case BPF_ALU | BPF_END | BPF_FROM_LE:
-- 
2.43.0

