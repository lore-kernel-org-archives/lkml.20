Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605059;
	b=cwCkzZ4aUCZIHPx+PZ9RDvEBUXlK/0TX+DcZtvtNAz0dZBcbo1kSYPOTeLaVndLGMEby
	 44tXV22AA3Vq+1okDdZoerKxG5Eyjqg5oAGCIdZvX+rysZKZgAaOiogRCmTW2xzgRb7rR
	 fxL2TZY3oHq/ZiIhygPRS67a8gGeI2wqFmdndbvzxT7XMOIw8XluivOTw/CMxbHgyo0n+
	 ln9lqpWDqRyLEzvQ6HvJMvOLYq5Hi74KGmacK7n2cwAS1Y6ZTGxvcrWoaw6nX9sVjckUy
	 by6A6EA/4T3tI8c0JF/e/ln3w/BRYD8JYQZEd84IifeOeEEsb9nRJiUprhyPdOT8YiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IdFSo6JzzG9qQGdtD5ihKLoQ40g+bsnor4ELUYyg40E=;
	b=nn3CfnRxwxNAMfZd+k1iw0GQ1+PRRvKblkoBUMWiaE/5T2vkZb4ZATkclTKtOL5XDmTy
	 4LLaj2RV3ncgCqLKnx400qiE7zBjhvFA3VnwPoEGsOxkSxqBlM97mpPeAsy9YgH90IsMD
	 VHMqGHDskvT/UJIshM/R4AJ5RCinfM01REHeTt1v8cu+GA6rCgBhuzTsnCe/5ab3JJQXo
	 Ac/W9NYGGTpHwzta9RGxU9MtR8cQxLE/AZFYshsyALOgjtGS0mVhCKxTjo40iKwy0fJcH
	 kviS9Kh2qqcSF292a4SOXeC78St1EZviQ9fVrx8OO0p8BGIZc4FPeSdKFxRVlGx/U9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RIO3iS2R;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489E2606A8A3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 489E2606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RIO3iS2R
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b335ef6441so14170557b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605057; x=1795209857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdFSo6JzzG9qQGdtD5ihKLoQ40g+bsnor4ELUYyg40E=;
        b=RIO3iS2RV7Tpg6eCUSLoRhHJjC8HOazmZ5idRahgh/6DI5mndK/odzajLwB5rXS2PB
         fO5JCXtYGxzIdmG5nIvtJwb4sUEuN71rlTc9poJIFgr0r7/vstHZMF9uwSG2u4JYwZxT
         Qfq7sXk0V3t0DGySNP+FYF7c5tQzLp89rLSJlV4s8cbn9PdIMPfKC4brIz1z8u4CahCx
         OrRo+rnTFuxrGIdaA4+J69IEh7d/YdQAaQ6QFxqpZGrmcYhwGCGyod9Gyc+mKS7WOmac
         2e9B9JTwqYgR39wbJw0wzEZLEIKZxVt6oShjzGylmejTQrKlIrcwHxbH6Qfb6hN7FjMX
         njBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605057; x=1795209857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdFSo6JzzG9qQGdtD5ihKLoQ40g+bsnor4ELUYyg40E=;
        b=YBMK22dUtprG5Ye017NweDcz5dcrG1hSCH7pB38CGVJc25FQVfDWtKYis6l8+/cSqb
         fppkzTO1nxGJ0bCcVDwkyWee+QgxOKh2v76QoXCEu/E7//80w7vTCSjtxBVYBygGoH5q
         WKuIvbPOxgQ4tGqSt3lGBDhdEv53L0CDST5i+yPe+XRiigiEd59NLoC11meN3pQaDVF0
         4KOjffhZsj8SkFys9MSTsKqKwiP1UE7WtyGtDkUOgb0eePV9EmCfjnD8MLHto0UIyVzV
         y3uj3x8Xnd9WGZXViEb8gHPBHMtIKDxvXKP1rz1s9bjDW0scFniCPoymCmkO8kc+EGEE
         S+7A==
X-Forwarded-Encrypted: i=1; AL+hErHMvWx6cevaR+1XoePXWqpNNd6VeKSm5MCwy9kjByZRswgC+7kDK4T6nStIT7nECWwEiWq2AG8f7umO/rA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IE6mVWOb37VMyJpq91fvZCF3lmJqL2n3NlfTwX6n3SFms3Ujw
	LQXp5FjokbIVzaMrwbTIrPHyYhK3akzlobPqi8gzg0BwnxNZAEx/qQoW
X-Gm-Gg: AYBFou34ObgWzxsauW4FTsyPZFFZvn4rT1adKZiUmURuVRjCGrO0hX6li72ThY3BEDC
	QxnErH+09mmDXkO0r35tE+cGskh1qma7DHKTQ/LCq0ioxpRdlYzBr0iDCNznAr5PlMQgMolP6mZ
	upJhKcFAwhWo8o9T51ykLcfwRUGEE6+omiSqgfCyvmEjTBS3eoC6TYjF8llFGFsYf9jRodOgfD2
	O8MjEH54DnRlbIdwhwEYBU1Aw28/1Vp357o+K+jZOE6qk1ilnYGMRPdYk6mx5JL2MQOlHy3nrZc
	O6BNVNTpSeMvoJILO3cV/sCYwked1aM/TLGWZ7tAxb7zdF98T4AsFlfIS7evNBrWiKPq+25/Vry
	RPBTjbe/5FdgPST6pwjhhExXenzlLSq9ClDLIJ9x8jJ4yOjqHOFu5iBYDM3tDK38JCdMG2IF4/u
	CrlDi/c/pUsYr2mdzyNdF2zoCNxfgEGbH2JQm+9R05mbH1ImqRiHE+NEnZqte25y3M5U3kEe2Gq
	w2QqR6iDIqs4gdranRxyO2YprPa9i0by0vCU56aUKH4/6pXrSpzyaueeHVR3P7Fl/GS6fY0zCQ1
	G949GmjASn9hhjWcofKpo3nLPu2MXYy7lA==
X-Received: by 2002:a05:690c:f85:b0:8b3:2af9:11f9 with SMTP id 00721157ae682-8b4aa2dd1a7mr23701777b3.26.1794605057150;
        Fri, 13 Nov 2026 13:24:17 -0800 (PST)
Received: from [127.0.1.1] ([187.15.141.223])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aaa1361fsm29539357b3.43.2026.11.13.13.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:24:16 -0800 (PST)
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 13 Nov 2026 16:24:11 -0500
Subject: [PATCH bpf-next 2/2] bpf, parisc: Add support for BPF_MOVSX in the
 parisc32 JIT
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
Message-Id: <20261113-parisc_bpf_jit_movsx_20261112-v1-2-7ecc33cdf1b2@gmail.com>
References: <20261113-parisc_bpf_jit_movsx_20261112-v1-0-7ecc33cdf1b2@gmail.com>
In-Reply-To: <20261113-parisc_bpf_jit_movsx_20261112-v1-0-7ecc33cdf1b2@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, bpf@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicholas Dudar <main.kalliope@gmail.com>
X-Mailer: b4 0.16.0

RFC9669 defines BPF_MOV | BPF_X with an offset of 8, 16 or 32 as a
sign-extending move, dst = (s8,s16,s32)src. The parisc32 JIT handles it
like an ordinary register move, so r0 = (s8)r0 with 0x80 gives 128
instead of -128.

Add emit_movsx_r(). It sign-extends the low 8 or 16 bits of the source
low word with extrw,s, or copies the low word for a 32-bit extension,
and fills the high word with the sign for ALU64. For ALU32,
bpf_put_reg32() zeroes the high word unless the verifier inserts the
zero extension.

Under QEMU on a 32-bit kernel, with test_progs built as a static 32-bit
binary with jit_insns only:

  # ./test_progs -t jit_insns -w 0
  [...]
  #201/33  jit_insns/movsx:OK
  [...]
  Summary: 0/40 PASSED, 0 SKIPPED, 2/12 FAILED

Without this change jit_insns/movsx fails as well. The 12 failures left
fail without this change too.

Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/parisc/net/bpf_jit_comp32.c | 41 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/parisc/net/bpf_jit_comp32.c b/arch/parisc/net/bpf_jit_comp32.c
index eea0a34a3bfe..9cfbff3e58bb 100644
--- a/arch/parisc/net/bpf_jit_comp32.c
+++ b/arch/parisc/net/bpf_jit_comp32.c
@@ -705,6 +705,35 @@ static void emit_alu_r32(const s8 *dst, const s8 *src,
 	bpf_put_reg32(dst, rd, ctx);
 }
 
+/* dst = sign_extend(src, width) */
+static void emit_movsx_r(const s8 *dst, const s8 *src,
+			 struct hppa_jit_context *ctx, u8 width, bool is64)
+{
+	const s8 *tmp1 = regmap[TMP_REG_1];
+	const s8 *tmp2 = regmap[TMP_REG_2];
+	const s8 *rs = bpf_get_reg32(src, tmp2, ctx);
+	const s8 *rd;
+
+	if (is64)
+		rd = bpf_get_reg64_ref(dst, tmp1, false, ctx);
+	else
+		rd = bpf_get_reg32_ref(dst, tmp1, ctx);
+
+	/* Low word: sign-extend the field, or copy it for a 32-bit extension */
+	if (width == 32)
+		emit_hppa_copy(lo(rs), lo(rd), ctx);
+	else
+		emit(hppa_extrws(lo(rs), 31, 32 - width, lo(rd)), ctx);
+
+	if (is64) {
+		/* High word: copies of the sign bit */
+		emit(hppa_extrws(lo(rd), 0, 31, hi(rd)), ctx);
+		bpf_put_reg64(dst, rd, ctx);
+	} else {
+		bpf_put_reg32(dst, rd, ctx);
+	}
+}
+
 static int emit_branch_r64(const s8 *src1, const s8 *src2, s32 paoff,
 			   struct hppa_jit_context *ctx, const u8 op)
 {
@@ -1145,7 +1174,12 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct hppa_jit_context *ctx,
 	switch (code) {
 	/* dst = src */
 	case BPF_ALU64 | BPF_MOV | BPF_X:
-
+		if (off == 8 || off == 16 || off == 32) {
+			/* Sign-extending mov: dst = (s8,s16,s32)src */
+			emit_movsx_r(dst, src, ctx, off, true);
+			break;
+		}
+		fallthrough;
 	case BPF_ALU64 | BPF_ADD | BPF_X:
 	case BPF_ALU64 | BPF_ADD | BPF_K:
 
@@ -1196,6 +1230,11 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct hppa_jit_context *ctx,
 			emit_zext64(dst, ctx);
 			break;
 		}
+		if (off == 8 || off == 16) {
+			/* Sign-extending mov32: dst = (s8,s16)src */
+			emit_movsx_r(dst, src, ctx, off, false);
+			break;
+		}
 		fallthrough;
 	/* dst = dst OP src */
 	case BPF_ALU | BPF_ADD | BPF_X:

-- 
2.53.0

