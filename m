Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD003CB8F1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439364; cv=none; b=hX4kNHO71tL+cyCJgCGt70t9mayRl/txS+edf60pZTNlzrtVXkr2KzHgVVqVwXnnV8hLAaHIcFxqLgwaDmDybgNL5qimBlbakl9toFMx0s/Db1+C9c4pJxRLmNxV0kc/GOF1gjxDbwt39BAIzJ60faw34HXzAa6PLpy4ML3mBWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439364; c=relaxed/simple;
	bh=Qc2w8Bn8jjebsauvnltyZuoDR8Orfa6XZngLN1P+7rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TVE4FjfwJJLhJ2Pc2U5ZmAiCVB9ii/msuxTpfibGLC8bPvbTc+ytrPrbFmYYUZOVsOBqowwFyQU7TPuz5MEutuWrIfILoWHSvyLWjjYp6cgV2AiyP7nStfZoqVyhVMR6DDAvJyA9NL1tsECVLJWsgOMeFbeut5wpl631oASXi3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNLIioZ/; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNLIioZ/"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-52fb76906adso39550481cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789439362; x=1790044162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zvdh8OpoPsqhiuVwU1AEGCetGNPdpdBiLFHYCom0W8U=;
        b=oNLIioZ/+q3GnuhXJe2ySLslvASCp2NWPkVahaYUgp+NeTLHkpoe3kKXTZIy5rleJg
         14NIQu7ofqdBLP//htEcl2o9fYRLziW/oCWWeH9dv+Ttf4bFugNyp2n0rMwZNCgj4k/S
         0k3g3SlTkobDH+xVfvsWP5T35FspPUOu1nWkLgeffVXZ0SO5L8mum6qFnwQs70VZtLXC
         QhOxCAH/3ZT6wdpI4T4blSLeCl3d3g6QXMCY/53bMlFRjUWe8G1odUzNZpGyd7haYmia
         8XHGHQeTsIwwyHEvHT3Ds8FoXArdCPZvrCa07L/hFJhoGaGsIHlgkyi7DtcIW0YSeQEN
         2/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789439362; x=1790044162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zvdh8OpoPsqhiuVwU1AEGCetGNPdpdBiLFHYCom0W8U=;
        b=MowOPZayck5cyjg0jfHOHak4gGsD+s3z9/IOHo7ANXoHKJi4UZIKgDyUjwBeyTG2wn
         kaemzPh+LIH+VkwKkVWJWpeYyZZEqiC/M6ISu/9NQkxlqvdDB3UCBGhyK3rMk7lZIQWs
         hMsfjSvvm1K5kQ9O1idsJL5BwRddA6IlxYXYGjFoZV9de5AcsMI0rZuRznmg/MQtmBbc
         pIfC8QQFUqgHGvGpxSAtT/DSYpaKxrRckdoCIeHyKeprCo75TzHBzOCVN7RTv1cOVe7D
         ukwoG0Rk5aX6TYW1/m5lzWKc1CPRGogW8qx7597ZOwSd07qpFo2e87QmBJMeKslbU8d6
         WFXw==
X-Forwarded-Encrypted: i=1; AKwUvBxSSwxozhoh934HXrDe4AEPskedaNzrJHxSlUWhxnctE8LwNwppnCbezStX3HzFdyY/QKlb8iFdTZGlnyc=@vger.kernel.org
X-Gm-Message-State: AFuF++mz459cNmN1/MWa9kFCeTIGodFqncxbn7oxKKGUKN3mZckQr/GO
	xnhp+4q806k96ny0E90i9bPhVFg0lgfbCyvD4loOE4mt/GxNHTrMDVlv
X-Gm-Gg: AYBFou0xX9PIFKAUzvTxtMOBp+Wt9saBecbDDpr8zSnJv/xm9VeEhNu/F+lsx1puj6n
	DJIGKhIER7ie9UoeF56UBct9Fn8AV7OIO3o5JYdP66WarmyNQgVuQShLNH6c2xRGjo/GsxOoPog
	sn5rLzSvh7LmFrnEm/EHJYH5rpvWYAcYEv8sDrd21b9AYy1fbarS9MMQW6T90rpOoQUYzijvnEx
	pssoXmWcglvziTo/aDeCTV1+FIcpxwwhanDz1prm0A9ht/gY4YdO0d28jpzGXKL8wYbJf3sfWLo
	/ELM8OzR6PFn1kH6OhzsFcuwfF78Pqh2Iwvqy5fpIaQLhle/95K9JNQlS6fKatYQKwX5tcgz1y6
	yGCjs+WxuhtMZzvIHHa6J1YhI8QECqp7EkzgbHioBelNHRGNENrcB7gHWtRy9q+LxmWhA7pd0AE
	7v8mDDYrqQICHAwxpiBFu8PzdbGpIMoqJ3byR+fEmCuW85ikzC3KUONrLPgKSSzTtH
X-Received: by 2002:a05:622a:96:b0:530:b2e4:d598 with SMTP id d75a77b69052e-5310d061f0bmr78040911cf.51.1789439356980;
        Mon, 14 Sep 2026 19:29:16 -0700 (PDT)
Received: from Turin ([187.15.143.6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9121a4fb3e4sm90358906d6.24.2026.09.14.19.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:29:16 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	bpf@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com
Subject: [PATCH bpf-next v2 2/2] bpf, parisc: Add support for BPF_SDIV and BPF_SMOD in the parisc32 JIT
Date: Mon, 14 Sep 2026 22:29:05 -0400
Message-ID: <20260915022905.1535566-3-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915022905.1535566-1-main.kalliope@gmail.com>
References: <20260915022905.1535566-1-main.kalliope@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

emit_alu_r32() and emit_alu_r64() call the unsigned millicode
($$divU/$$remU) and libgcc-style (hppa_div64()/hppa_div64_rem())
divide/remainder helpers for BPF_DIV and BPF_MOD regardless of the
BPF instruction's signedness, so the parisc32 JIT does not implement
signed BPF_SDIV and BPF_SMOD (off == 1). Signed ALU32 and ALU64
div/mod get an unsigned quotient and remainder rather than the
verifier's and the interpreter's signed result for negative operands.

Thread is_signed = (insn->off == 1) through emit_alu_r32()/
emit_alu_r64(), and on the signed path use the $$divI/$$remI signed
millicode routines (32-bit) or the hppa_sdiv64()/hppa_sdiv64_rem()
helpers added in patch 1 (64-bit) instead of their unsigned
counterparts. $$divI and $$remI are extern-declared and exported next
to $$divU/$$remU in arch/parisc/kernel/parisc_ksyms.c.
bpf_do_misc_fixups() rewrites the zero-divisor and INT_MIN/-1 cases out
of the instruction stream before the JIT runs.

Acked-by: Helge Deller <deller@gmx.de>
Tested-by: Helge Deller <deller@gmx.de>
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/parisc/net/bpf_jit_comp32.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/arch/parisc/net/bpf_jit_comp32.c b/arch/parisc/net/bpf_jit_comp32.c
index 5ff0cf925fe95..eea0a34a3bfee 100644
--- a/arch/parisc/net/bpf_jit_comp32.c
+++ b/arch/parisc/net/bpf_jit_comp32.c
@@ -321,6 +321,8 @@ static void bpf_put_reg32(const s8 *reg, const s8 *src,
 extern void $$mulI(void);
 extern void $$divU(void);
 extern void $$remU(void);
+extern void $$divI(void);
+extern void $$remI(void);
 
 static void emit_call_millicode(void *func, const s8 arg0,
 		const s8 arg1, u8 opcode, struct hppa_jit_context *ctx)
@@ -562,12 +564,14 @@ static void emit_alu_i32(const s8 *dst, s32 imm,
 }
 
 static void emit_alu_r64(const s8 *dst, const s8 *src,
-			 struct hppa_jit_context *ctx, const u8 op)
+			 struct hppa_jit_context *ctx, const u8 op,
+			 bool is_signed)
 {
 	const s8 *tmp1 = regmap[TMP_REG_1];
 	const s8 *tmp2 = regmap[TMP_REG_2];
 	const s8 *rd;
 	const s8 *rs = bpf_get_reg64(src, tmp2, ctx);
+	void *func;
 
 	if (op == BPF_MOV)
 		rd = bpf_get_reg64_ref(dst, tmp1, false, ctx);
@@ -604,10 +608,12 @@ static void emit_alu_r64(const s8 *dst, const s8 *src,
 		emit_call_libgcc_ll(__muldi3, rd, rs, op, ctx);
 		break;
 	case BPF_DIV:
-		emit_call_libgcc_ll(&hppa_div64, rd, rs, op, ctx);
+		func = is_signed ? &hppa_sdiv64 : &hppa_div64;
+		emit_call_libgcc_ll(func, rd, rs, op, ctx);
 		break;
 	case BPF_MOD:
-		emit_call_libgcc_ll(&hppa_div64_rem, rd, rs, op, ctx);
+		func = is_signed ? &hppa_sdiv64_rem : &hppa_div64_rem;
+		emit_call_libgcc_ll(func, rd, rs, op, ctx);
 		break;
 	case BPF_LSH:
 		emit_call_libgcc_ll(__ashldi3, rd, rs, op, ctx);
@@ -630,7 +636,8 @@ static void emit_alu_r64(const s8 *dst, const s8 *src,
 }
 
 static void emit_alu_r32(const s8 *dst, const s8 *src,
-			 struct hppa_jit_context *ctx, const u8 op)
+			 struct hppa_jit_context *ctx, const u8 op,
+			 bool is_signed)
 {
 	const s8 *tmp1 = regmap[TMP_REG_1];
 	const s8 *tmp2 = regmap[TMP_REG_2];
@@ -666,10 +673,12 @@ static void emit_alu_r32(const s8 *dst, const s8 *src,
 		emit_call_millicode($$mulI, lo(rd), lo(rs), op, ctx);
 		break;
 	case BPF_DIV:
-		emit_call_millicode($$divU, lo(rd), lo(rs), op, ctx);
+		emit_call_millicode(is_signed ? $$divI : $$divU,
+				    lo(rd), lo(rs), op, ctx);
 		break;
 	case BPF_MOD:
-		emit_call_millicode($$remU, lo(rd), lo(rs), op, ctx);
+		emit_call_millicode(is_signed ? $$remI : $$remU,
+				    lo(rd), lo(rs), op, ctx);
 		break;
 	case BPF_LSH:
 		emit(hppa_subi(0x1f, lo(rs), HPPA_REG_T0), ctx);
@@ -1163,12 +1172,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct hppa_jit_context *ctx,
 			emit_imm32(tmp2, imm, ctx);
 			src = tmp2;
 		}
-		emit_alu_r64(dst, src, ctx, BPF_OP(code));
+		emit_alu_r64(dst, src, ctx, BPF_OP(code), off == 1);
 		break;
 
 	/* dst = -dst */
 	case BPF_ALU64 | BPF_NEG:
-		emit_alu_r64(dst, tmp2, ctx, BPF_OP(code));
+		emit_alu_r64(dst, tmp2, ctx, BPF_OP(code), false);
 		break;
 
 	case BPF_ALU64 | BPF_MOV | BPF_K:
@@ -1211,7 +1220,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct hppa_jit_context *ctx,
 			emit_imm32(tmp2, imm, ctx);
 			src = tmp2;
 		}
-		emit_alu_r32(dst, src, ctx, BPF_OP(code));
+		emit_alu_r32(dst, src, ctx, BPF_OP(code), off == 1);
 		break;
 
 	/* dst = dst OP imm */
@@ -1236,7 +1245,7 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct hppa_jit_context *ctx,
 		 * src is ignored---choose tmp2 as a dummy register since it
 		 * is not on the stack.
 		 */
-		emit_alu_r32(dst, tmp2, ctx, BPF_OP(code));
+		emit_alu_r32(dst, tmp2, ctx, BPF_OP(code), false);
 		break;
 
 	/* dst = BSWAP##imm(dst) */
