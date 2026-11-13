Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590632;
	b=U9iccxc5JUQugCMZpqN0tMye1NGh/jDZbVmoICAe1QcNqoM6NCPtMrqF/5bCzvTNtNIi
	 zxWcr9pwLnoQ52ZKmT7Mtg2xA8VmB9PJXrnNLO9m+5abwdj6vvPV8+c3FN5V5j5Awj4OT
	 hN67SKZqkv+CCG97QjJw06WfJxl/wwKv7uHWmes9uaAMOTCUtPtDjerFfOTC6rgIKbw3a
	 3eaYw3Ai+D6c9jq90gOPuD3UbCRPBwwILqrrDn/byqYhvttYzP/VVuoxCylinssfwfS2B
	 VLXBIVfkO8gXtBotOgvew/2AIR3Es2QRd7vd/G4O9UtDo5+NEasGrMbCfqJQx3Q9Ujw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qylt067fDUz/E6LMeuKtjJTa+0Y9qeQhqy9Jl3KNXbE=;
	b=YgTKdhJRCd1KSyEihVDtuxBSZ6Cs8jqQN1dNVf7tayuiWkffzjt8Oqvahmn2J2ybcYC3
	 I2/IIqSGYoPg0Rn5h0KOKYwHuZK5/pzWM2DpmlV4ktteNbqmMqyVkcmVcq8ibx92ME78d
	 ynYTDy0qHSJJvo2oy9LfWNzhwsMBKAIX+igwURUdXuFFf59zRj8fNg33slz//Eubuw30Q
	 1wJAc97Yu9i7uyCaiRBWqJJLql2NoScSNmbdCTqB4kb8pv6JtEHlOT3scW3mYYh10CJ63
	 ER01PfQ3Tka599qqnLnNfanfmOYWrjkr+LTNOz8kNOLBDphDhCPIAwN/PMLbxc0xnzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWUetnmg;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A260260A262E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A260260A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWUetnmg
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67d8221074dso1328016d50.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794590630; x=1795195430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qylt067fDUz/E6LMeuKtjJTa+0Y9qeQhqy9Jl3KNXbE=;
        b=hWUetnmgyoZR2Q23w7UdunRuHC1naexYjRMz892RkaCSStmFNBOmPuUBwAsgzoQ+s8
         KKJNm7FcVfccTVj1k72SKB8JQBaZ0kHaj5FHK/jkh1VWRBCtmUyeLBx0/uMiPDBSBzj2
         GOKmJzyLUOdTB/vaL+YZAq47dfkMyF45eqYdG7QxGZ6HPvZR0x1s9CP6i4KfEp3eiiQt
         Ex2oYHcXI1qspHSgwu6TrV/vpUmpy8VqyH7s5nCTMhE4ynV1hmwfpgn+kJN2DuTqk8aR
         MaiFoZD77Y500QXXHrX4zJ7mUdKfygp69532XjOzXTsNdTkulY17bjea3zNs//N3OZbH
         bfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590630; x=1795195430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qylt067fDUz/E6LMeuKtjJTa+0Y9qeQhqy9Jl3KNXbE=;
        b=CnyeGtm3iIllSJ8Dl1ln7TpLlSBGHuLSRJ6c+uMo5GlShD4/oWeUa0bqGxZdIREUx0
         Za6acPCW2zXLJSCxbgKRu9/WL/sCUqAgeF8uVL4/yIbP4LfZg4R7++TlGjfn7yW5qnYw
         xqOEomjOJZtPUHJWe5B0zjW8iSCvq7EWqmaaun9jFsrCoKQKVJ9vLAxKUnyRoNL9SxLw
         xWrX9cqAqB/X5YUuBtue/MyS1XCriiVNE31tAwnWGZeduQa1rKj2Yv1ZaridpXcL1fKT
         k3HNZlQEQh5QlDbYa8zoyXlAr49ajI2HSnzS6HQkEMQ9C3hnbaumZ5OrqzEdngjb6RDN
         DC9g==
X-Forwarded-Encrypted: i=1; AL+hErFAZnrypB2tSe9NiDd+1A67Gbw6NZRYiN4AaytNBAosQwR8HM4v4tEH7uDPbjNz6RfVasjXANLkCXYQCX4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j7Pnp1Ivjegf3G94Xsd4N/SwS85DKL4rNYxDqV8YmUJ02I4xz
	DAZakFhNMbgg1qx3WsAe8ZroNdsMzScL8/TRELPSN28N/v0a5EF13AeV
X-Gm-Gg: AYBFou1KWrRNehOeYYlOetYnyMTsmdNf44WI9wOByRAC2/HD2CW2SxBLlZ1X1zPIQ3b
	N95H+VTY6YQ/8tS8jffw2OiJNh3u3K+x3BIgJET/5f2iZgDjq6t/emP04OMsVxdl7OKOvQmn/rF
	slWQNT5JSS6/LbwpVkXW6kkSfwecCkSng+aFdcmr2degVMAZSNLnOVR68F4bFncnIgEd11VE3/h
	CNRWTBQZvgB+hp/gGHao/OqJnMZXHjGqDhMpnoB3pAPjNyZHiO0Y89bao2Q8uu1UoLSsrZ8L8E2
	mstmp2sUFdH5xl+M30XW8bWwEdDuoTLMbGEsYZMcKp88GDW0TubTWmsCxNfDRqw/uKnSfScK6Ln
	eRBQpSWHsQmnbGCVYZhLM9YzHwtd3ezs+GC5U5ELYDZ2rP/5MPd8SuFkeeEbz2wCZjBbPDczm2m
	9rvhjJQIQuwSbVP1tBaBNc4UYDgmG9i1M7G8+DcmwWrHwICJbw53g2QTgWAy1dRmGxm1pV9Nf25
	16YrbQbfwRui3N+4dLrbw9EhxW2ARglcTxqYt+Mdo6twMFbQELen4BIJ1iHW2TPzOAkRX0ACsb7
	9u9bn7H8j3QWlr5vPsLA5hlWsKor8EhPpQ==
X-Received: by 2002:a05:690e:80c:10b0:67b:e531:90b3 with SMTP id 956f58d0204a3-67d895c21f1mr1278125d50.33.1794590630395;
        Fri, 13 Nov 2026 09:23:50 -0800 (PST)
Received: from [127.0.1.1] ([187.15.141.223])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9dc1c9sm25187277b3.36.2026.11.13.09.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:23:49 -0800 (PST)
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 13 Nov 2026 12:23:42 -0500
Subject: [PATCH bpf v2 1/2] bpf, x86: Fix signed division and modulo in the
 i386 JIT
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-i386_bpf_jit_wrong_code_20261028-v2-1-1dd0b03072a3@gmail.com>
References: <20261113-i386_bpf_jit_wrong_code_20261028-v2-0-1dd0b03072a3@gmail.com>
In-Reply-To: <20261113-i386_bpf_jit_wrong_code_20261028-v2-0-1dd0b03072a3@gmail.com>
To: Wang YanQing <udknight@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, Yonghong Song <yonghong.song@linux.dev>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, "H. Peter Anvin" <hpa@zytor.com>, 
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org, visitorckw@gmail.com, 
 Nicholas Dudar <main.kalliope@gmail.com>
X-Mailer: b4 0.16.0

RFC9669 defines SDIV and SMOD, encoded as DIV and MOD with an offset of
1, as signed division and modulo, which the interpreter implements. The
i386 JIT ignores the offset and emits an unsigned div for both, so for
ALU32 -1 s/ 2 returns 0x7fffffff instead of 0. A verifier-accepted
program can therefore use values outside the range proved by the
verifier.

Emit cdq and idiv when the offset is 1. The verifier has rejected or
patched out a zero divisor and INT_MIN s/ -1 before the JIT runs, so
idiv cannot trap. ALU64 DIV and MOD are still left to the interpreter.

On an unpatched i386 kernel, an SDIV and an SMOD test program each
passed a helper a length beyond the verifier's bound. Both stayed
within it after this change.

Found by manually comparing the signed DIV/MOD handling of the BPF
JITs.

On i386 under qemu, with test_progs built as a 32-bit binary from the
same tree:

  # ./test_progs -t verifier_movsx,verifier_sdiv,jit_insns \
    -d jit_insns_blinded,'verifier_movsx/*@unpriv' -w 600
  [...]
  #191/3   jit_insns/alu_imm:OK
  #191/4   jit_insns/alu_reg:OK
  #191/5   jit_insns/alu_imm_regs:OK
  #191/6   jit_insns/div_const:OK
  #191/7   jit_insns/alu_reg_pairs:OK
  #191/8   jit_insns/alu_edges:OK
  [...]
  #650     verifier_sdiv:OK (SKIP: 16/144)
  Summary: 1/167 PASSED, 16 SKIPPED, 2/11 FAILED

  # ./test_progs -t jit_insns_blinded -w 600
  [...]
  #192     jit_insns_blinded:OK
  Summary: 1/14 PASSED, 0 SKIPPED, 0/0 FAILED

Without this change, the six jit_insns subtests above, four of
jit_insns_blinded and 50 of verifier_sdiv fail. The 11 failures left
are the five MOVSX ones fixed by the next patch and six jit_insns
subtests that fail without the series as well.

Fixes: ec0e2da95f72 ("bpf: Support new signed div/mod instructions.")
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/x86/net/bpf_jit_comp32.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
index 852baf2e4db4..012161da3e82 100644
--- a/arch/x86/net/bpf_jit_comp32.c
+++ b/arch/x86/net/bpf_jit_comp32.c
@@ -432,11 +432,13 @@ static inline void emit_ia32_to_be_r64(const u8 dst[], s32 val,
  * ALU operation (32 bit)
  * dst = dst (div|mod) src
  */
-static inline void emit_ia32_div_mod_r(const u8 op, const u8 dst, const u8 src,
-				       bool dstk, bool sstk, u8 **pprog)
+static inline void emit_ia32_div_mod_r(const struct bpf_insn *insn, const u8 dst,
+				       const u8 src, bool dstk, bool sstk, u8 **pprog)
 {
 	u8 *prog = *pprog;
 	int cnt = 0;
+	const u8 op = BPF_OP(insn->code);
+	const bool is_signed = (insn->off == 1);
 
 	if (sstk)
 		/* mov ecx,dword ptr [ebp+off] */
@@ -454,10 +456,17 @@ static inline void emit_ia32_div_mod_r(const u8 op, const u8 dst, const u8 src,
 		/* mov eax,dst */
 		EMIT2(0x8B, add_2reg(0xC0, dst, IA32_EAX));
 
-	/* xor edx,edx */
-	EMIT2(0x31, add_2reg(0xC0, IA32_EDX, IA32_EDX));
-	/* div ecx */
-	EMIT2(0xF7, add_1reg(0xF0, IA32_ECX));
+	if (is_signed) {
+		/* cdq */
+		EMIT1(0x99);
+		/* idiv ecx */
+		EMIT2(0xF7, add_1reg(0xF8, IA32_ECX));
+	} else {
+		/* xor edx,edx */
+		EMIT2(0x31, add_2reg(0xC0, IA32_EDX, IA32_EDX));
+		/* div ecx */
+		EMIT2(0xF7, add_1reg(0xF0, IA32_ECX));
+	}
 
 	if (op == BPF_MOD) {
 		if (dstk)
@@ -1795,14 +1804,14 @@ static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image,
 		case BPF_ALU | BPF_MOD | BPF_X:
 			switch (BPF_SRC(code)) {
 			case BPF_X:
-				emit_ia32_div_mod_r(BPF_OP(code), dst_lo,
+				emit_ia32_div_mod_r(insn, dst_lo,
 						    src_lo, dstk, sstk, &prog);
 				break;
 			case BPF_K:
 				/* mov ecx,imm32*/
 				EMIT2_off32(0xC7, add_1reg(0xC0, IA32_ECX),
 					    imm32);
-				emit_ia32_div_mod_r(BPF_OP(code), dst_lo,
+				emit_ia32_div_mod_r(insn, dst_lo,
 						    IA32_ECX, dstk, false,
 						    &prog);
 				break;

-- 
2.53.0

