Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BEE3CFF5A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438441; cv=none; b=bofTn6BQ0YTg7B4GSINldrhFlZgC3HSZkzVTVYhfpLzXcP4d/tVqaV4DUAaZ23o30HZygCONjMdqnEEXj4Pn1kMZUCPD7i4ML8tWM8XFRZMJQMm3q8bpYS95tgitXcX18/IUzpZE3UbZMTkhOKORncVLp1WsGD6Kh5J1SlaEvAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438441; c=relaxed/simple;
	bh=324LLKjMUj0uq84jIXtS1OvEwpU5ICvJxiUe6G7wYnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SafgWDIK5Yk10j8pSUy3HxwClFBShmrUq/gMGxGHO9swHFVb9jJ+cGclUVYjWJ5meLNlosoA5jf62GL4YWLSUedAZ5CYZyyUR1OQ83m4lnzMBjeGG084rNlBdMascHn780hOeTb8QCrctPqbaHLmulqBbyhvXV5bEtKSwF2T654=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLuq42af; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLuq42af"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5306d609317so38519501cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789438438; x=1790043238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kFkEUPsV9vHfYTD+e29tDCYCEDdf/VhB1bccVZ3Vd14=;
        b=oLuq42afvMfqH95Gqyh+hnhHCbUIxHf/nyjyNyKG4diYxvbB/acdYFq8yCpHk3ixwy
         5DkCHAnGSfpL4llOya5qG3pX3XZHzQ9OFUHovmaoP/9PONPNZxfYbmax33DvRgM0UCQ4
         ttTv25l9OizJVbtJriOozQD0AdESEyotwQ6UdB2dwG7T8aaUDdSunwiSMGt/0OxRXsxo
         qh4UqQt1kCQ85J5pxHVL/ateystwP9V0kQAJ/IoGI3Yju/RWBRG5w1WUFTh2bJRzgM2W
         6GOZoSIPXiTPoQrwRrYuqKE+RrzWVlxkeglsKe8BxVbpm58T2Z4waKZ3piryYlffQInW
         Cstg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789438438; x=1790043238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kFkEUPsV9vHfYTD+e29tDCYCEDdf/VhB1bccVZ3Vd14=;
        b=Pnkf9WAuBAxJ1l71bqTOoTce/t09ocDgIMWEQgPDKNP/aJmxU6lKuws7DpwELsTQe7
         GLHSjI106tpT4Qo2PmNbJqpy8Yn9cM9f4QiiareGNnjjdtp3geP5bPFAiD9PXHVMMV+A
         NI+FgTlmDojgxGTjrfNmVzbyKVhaCz0x/aBHK7VRuHgPEYgq534dyz9J6U3z0qwFMvGr
         5zlrtxaIs2DzWaYhI7SBEwX2S5O9cJxPulYv+vGYfK9siSZ2IOimmYcDXPmLE14hCgw/
         6N2zyyhYEZbX3h1/y0h6WH2oZmx0kLEoyegBPAAok5MYhKdkAAagxTVYj8gHU2vRUvxT
         JmgA==
X-Forwarded-Encrypted: i=1; AKwUvByTT3v9pWlVaq7eKuKOqfVxAheRGExg/a+9VWPOz78btpWMAEbOQM6kiHJHqOhiB90OyN5Vo9Wj1BYzZUs=@vger.kernel.org
X-Gm-Message-State: AFuF++l6PvhTG8POwHn3iyLIJqC8SvjfKuXSrxVe28npwAGK5BcFbawC
	EMSmx7Sm1A3seWpbDoPlOb/K4XJqLlGv3fTA6N+BBm7D1f/yo8OrlTw/
X-Gm-Gg: AYBFou0CqQHIU/ZjCk0/4Lv7GrQODljQ/fcFH40rXQY/JUs++FhjiF0DY51E1cVOPdM
	bVOouBPJV9JPmPCYkLvBEQmEQHkEriv0Vi17jN7ij99rkpHMDxYROtmiRy5aod+W19l2ljNfhS9
	KupXkXPZhA5JiiosFm6dp1XUO5SiFNoJb2QeHWo3gzjlrSnhR4yJN6hfMGRw8DJ1tEH/wPiFXxw
	ZfpRwASW9Pu0eI2ll6crd34V/5Lp6QDAftoEkXYlxZqEuwK3sGjZDmE6Uzt8cPI8QIuAuFDFTqI
	R7PGO/MwsWuze7pUweDtMzVJ35GLH4a5gWy4L02K0DbEr/b2k9z5xHTDEDDDBkZ1YwSZP1lcd6f
	IgZbz2J615VIkTz/a297Jax0gLsalMLZdWVjeS7vJjVoay3Eycr360IykN+SLv8zwcyU7VIJDja
	qVUd96ZQwgqmFDAbbA8nRkZuMOYkaNJfoCqpJGwGDXY3pGI2qZeZS/6QC1JadV/r0+rwmfO1lhz
	yg=
X-Received: by 2002:a05:622b:10a:10b0:531:172f:79e8 with SMTP id d75a77b69052e-531172f7e58mr37466341cf.57.1789438438205;
        Mon, 14 Sep 2026 19:13:58 -0700 (PDT)
Received: from Turin ([187.15.143.6])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47e800sm113147306d6.27.2026.09.14.19.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:13:57 -0700 (PDT)
From: Nicholas Dudar <main.kalliope@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	udknight@gmail.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	hpa@zytor.com,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com
Subject: [PATCH bpf-next 1/5] bpf, x86: Add support for BPF_MOVSX in the i386 JIT
Date: Mon, 14 Sep 2026 22:13:34 -0400
Message-ID: <20260915021338.1520964-2-main.kalliope@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915021338.1520964-1-main.kalliope@gmail.com>
References: <20260915021338.1520964-1-main.kalliope@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i386 JIT lowers register BPF_MOVSX as an ordinary move because
do_jit() does not inspect insn->off. The generated code therefore copies
the source instead of sign-extending the selected low bits. Context-access
conversion can also introduce MOVSX while lowering signed loads, so
rejecting BPF_MEMSX does not protect those paths.

Stage the source low word in EAX and use the native byte and word
sign-extension instructions. Derive the high word from the sign bit for
ALU64 and retain verifier-managed zero extension for ALU32.

Assisted-by: Codex:gpt-6
Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/x86/net/bpf_jit_comp32.c | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
index 852baf2e4db4..9cbeabac4f27 100644
--- a/arch/x86/net/bpf_jit_comp32.c
+++ b/arch/x86/net/bpf_jit_comp32.c
@@ -266,6 +266,51 @@ static inline void emit_ia32_mov_r64(const bool is64, const u8 dst[],
 		emit_ia32_mov_i(dst_hi, 0, dstk, pprog);
 }
 
+/* dst = sign_extend(src, insn->off) */
+static inline void emit_ia32_movsx_r64(const struct bpf_insn *insn, u8 **pprog,
+				       const struct bpf_prog_aux *aux)
+{
+	const u8 *dst = bpf2ia32[insn->dst_reg];
+	const u8 *src = bpf2ia32[insn->src_reg];
+	bool dstk = insn->dst_reg != BPF_REG_AX;
+	bool sstk = insn->src_reg != BPF_REG_AX;
+	bool is64 = BPF_CLASS(insn->code) == BPF_ALU64;
+	u8 *prog = *pprog;
+	int cnt = 0;
+
+	if (sstk)
+		/* mov eax,dword ptr [ebp+off] */
+		EMIT3(0x8B, add_2reg(0x40, IA32_EBP, IA32_EAX),
+		      STACK_VAR(src_lo));
+	else
+		/* mov eax,src_lo */
+		EMIT2(0x89, add_2reg(0xC0, IA32_EAX, src_lo));
+
+	switch (insn->off) {
+	case 8:
+		/* movsx eax,al */
+		EMIT3(0x0F, 0xBE, 0xC0);
+		break;
+	case 16:
+		/* movsx eax,ax */
+		EMIT3(0x0F, 0xBF, 0xC0);
+		break;
+	case 32:
+		/* EAX already holds the low word; CDQ supplies the high word. */
+		break;
+	}
+
+	emit_ia32_mov_r(dst_lo, IA32_EAX, dstk, false, &prog);
+	if (is64) {
+		EMIT1(0x99); /* cdq */
+		emit_ia32_mov_r(dst_hi, IA32_EDX, dstk, false, &prog);
+	} else if (!aux->verifier_zext) {
+		emit_ia32_mov_i(dst_hi, 0, dstk, &prog);
+	}
+
+	*pprog = prog;
+}
+
 /* Sign extended move */
 static inline void emit_ia32_mov_i64(const bool is64, const u8 dst[],
 				     const u32 val, bool dstk, u8 **pprog)
@@ -1697,6 +1742,12 @@ static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image,
 					emit_ia32_mov_i(dst_hi, 0, dstk, &prog);
 					break;
 				}
+				if (insn->off == 8 || insn->off == 16 ||
+				    (is64 && insn->off == 32)) {
+					emit_ia32_movsx_r64(insn, &prog,
+							    bpf_prog->aux);
+					break;
+				}
 				emit_ia32_mov_r64(is64, dst, src, dstk, sstk,
 						  &prog, bpf_prog->aux);
 				break;
