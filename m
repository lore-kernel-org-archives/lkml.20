Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605058;
	b=kTk9znTxQ+L1X1EFvlqPkttyCPSlOju4y98/DJ+YX95V20KcSOzzNmMC6qm/94iwY+ex
	 Zk16wQ1oK3IwjL7lDaxKeNJdKS/6pX6JRCH1IxhMEUg9ZLzpfz5vWpde8vIIwb2sPksP3
	 ebBm7PVQi3U405/7f5d7dm4uCyvy0Rwy+tREsg0KDurvSnuGAQS8gGlqIKXkQ5/TR6Utt
	 P4mGJNcLSTR2QAQL6bPE8hAILxmXO6mHnons9DSLxJrY0tE6J+4FNHdldfCzKpmMyc8LL
	 cnnJyckZiDJL2UPOgtlRhhZDgzYKMBYuAWNzrlAcikPz6G4iGZJxEWSIzStgVclJ0nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jAiN1wsoSl5iEsunvD1hICWAFwkCWgqT3J/Jr+Riq9M=;
	b=ylhdVuEXmY0lUm4hUHEmwN/CIHqwUc0UiwJblVMKmq1+ITOyMD33ls3Lz8tt/HSoEExE
	 msRLLUMsLHS/KL+g2DMX+LmSiRLJHsZxc1H1LLmCia0v9cl+DyEjL5JrcOqyXmBX86haG
	 wpA0FCLflBZA+X3RnL3p/zjolzRZZbUO/rWd67MSy17i1ss5SxobSkWCn9C4ICah/9JX4
	 OqSJ1uMDb45FiN8TMK21HIyGpdmbE4ubqDG+uk3Z2brWyddlAUMhgjUMDF/Y5RUDb1vUJ
	 UfC8ymm0RpgWKxcVI2gAnpc+yAoKj45eM07vYD336SMAznNVrXa/vZawdzae2DkER2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DqgpZ+Vg;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411CD606A893
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 411CD606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DqgpZ+Vg
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b308fca7c3so14520287b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794605055; x=1795209855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jAiN1wsoSl5iEsunvD1hICWAFwkCWgqT3J/Jr+Riq9M=;
        b=DqgpZ+VghOv6kiKlYlBTomZzfu+hcG4BBrcq+hovu8GS1vBD3yjqxcs/91Mc8EiYut
         2myKqC1quAOzq43Y+sDNwh/fwLkCPXw+Sww2BiGA8npqcphk5YXIEKODAqa8Jv9Mst1D
         MK88pNxeAMNkZfU4Xvv0jU0qvW9plGeWVVv14SmK0gDFwtQKtUk1LBVzupOAYBOjexw0
         a+6U8nkbJ05qH2J2fzGT/qcRtTx7P5b8bcr3bdeHJk2kJjwCghYqnwjBKh4gFiCgO7SX
         ahR2txV/ZpVc3VVkEXLD3nAtC+9eNZgClLtGmTXBuij0JPH+qfJP6Wbw3MYQF2mq1MAX
         fUBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605055; x=1795209855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAiN1wsoSl5iEsunvD1hICWAFwkCWgqT3J/Jr+Riq9M=;
        b=cNWyZDQNlJ+Qs/9WR2I/vYClsHgh1WmraD0lVmNGwFjMr9h9KzX7FraUymj0kFsRxs
         YMJq50LbOzdhhzeigvi33TN+vl1dsZT3/Hh+Il8x3NwcqmF01+R1Sjh0PhfEPil226Oc
         e2iUldcAZmfMz+qDpAB/tkOAKaCjITEFcqtF1En0NvC2EHw4IBBKv6XpRpZ+5OjoalXg
         prgNUcJaXLgVeBeEd8c8ZTvBR2LYUxjXxy+4nZSzbC9r8i1qFe3CXKM3HoPEjQVCchvs
         f2NV7VUrb9a4EDPJb14VEWKuU08oH0YPlTeAxQRBuf64+Z3tAI3N+KTs4Z8ZJXfKKTw9
         o3pA==
X-Forwarded-Encrypted: i=1; AL+hErF5saVTRX9Gxk7O1ntld2ijJh4jPKiFzGvyLfKikjN/RC2wAwt7NPMQdu/ZymrzUhB+eqMCD6KR0ZBFWhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GW74pKFpoi7/pYCoyh3rX5a5lIApSSjpLdQQ4VUVD5jJ2lkz8
	KH4Kj9AIKXxYY3VxXXLasIand4cbsDq+roG2U0MAfNjHR309y66VEc+v
X-Gm-Gg: AYBFou1XKP6aZR2v4JBa1D1yWF2MkrSFGW8gFUKe9cTTPEAwdqWggjYCkdv9TWTbleb
	X6X5OlanDS7/MkAnmPgA7o8CCStIDSf1L8cqfr1D4o5k9UGSXE/jA+zvaIlzVJNc3UdjN1zVNEn
	GzXq73flfVRvWve2GkLmHXwePFq5F3v5Wqx0TsGiN1H/6NgATQKasbFhNm23bbbxq3PaSlHDmkY
	rndrYnhSK0ZxA72+L0c+mh3fw8/R8tsm+4zrJbkExQBcBJNH4oGTMa0gfu9kMRDSIlm/c+oyO2+
	RPNgTGdfk77e4W2/uzjKo1z/UbxUIrozvLRiyV/ZGO7m1cKkUGbQPYJoF3lDiI/Euzh3DfR6yep
	ym4MQ36tbbokWMdWwvHXb/IUmo/KiaEymQlZr9CiPk7fuHoh1RrHJcKq7Vmw35fV8UmGQgasqeg
	J9XTSKDFOjl9WgOCC/2g5g5UiTgLxBcdUK+aKKCxAB6uXXG9D7vAIThxRiV+CmwlBp0KvD3sFDf
	HZut5bVZzegj/7VfhHbvQPanVEL2srkewBs3CNjHB/d7sYu+YRLoyw6f28O3bc3SiRURNXbt7oG
	B/yqxBuMkY+H3cY4SkTtukiqDK9ogGq1Sw==
X-Received: by 2002:a05:690c:c6c3:b0:890:c0ab:2303 with SMTP id 00721157ae682-8b4aa2331f1mr19962947b3.21.1794605055316;
        Fri, 13 Nov 2026 13:24:15 -0800 (PST)
Received: from [127.0.1.1] ([187.15.141.223])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aaa1361fsm29539357b3.43.2026.11.13.13.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:24:14 -0800 (PST)
From: Nicholas Dudar <main.kalliope@gmail.com>
Date: Fri, 13 Nov 2026 16:24:10 -0500
Subject: [PATCH bpf-next 1/2] bpf, parisc: Add support for BPF_MOVSX in the
 parisc64 JIT
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
Message-Id: <20261113-parisc_bpf_jit_movsx_20261112-v1-1-7ecc33cdf1b2@gmail.com>
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
sign-extending move, dst = (s8,s16,s32)src. The parisc64 JIT does not
look at the offset and emits a plain move, so r0 = (s8)r0 with 0x80
gives 128 instead of -128.

Sign-extend the low 8, 16 or 32 bits of the source with extrd,s for
ALU64, and the low 8 or 16 bits with extrw,s for ALU32. Zero-extend the
ALU32 result unless the verifier inserts the zero extension.

Under QEMU on a 64-bit kernel, with test_progs built as a static 32-bit
binary with jit_insns only:

  # ./test_progs -t jit_insns -d jit_insns/helper_calls -w 0
  [...]
  #201/33  jit_insns/movsx:OK
  [...]
  #202     jit_insns_blinded:OK
  Summary: 1/46 PASSED, 0 SKIPPED, 1/5 FAILED

Without this change jit_insns/movsx fails as well. The five failures
left fail without it too. jit_insns/helper_calls is left out because it
does not complete on the 64-bit kernel with or without this change.

Signed-off-by: Nicholas Dudar <main.kalliope@gmail.com>
---
 arch/parisc/net/bpf_jit_comp64.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/parisc/net/bpf_jit_comp64.c b/arch/parisc/net/bpf_jit_comp64.c
index c326fa737ec8..315ae2a3ead8 100644
--- a/arch/parisc/net/bpf_jit_comp64.c
+++ b/arch/parisc/net/bpf_jit_comp64.c
@@ -619,6 +619,17 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct hppa_jit_context *ctx,
 			emit_zext_32(rd, ctx);
 			break;
 		}
+		if (off == 8 || off == 16 || (is64 && off == 32)) {
+			/* Sign-extending mov: dst = (s8,s16,s32)src */
+			if (is64)
+				emit_hppa64_extrd(rs, 63, off, rd, true, ctx);
+			else
+				emit_hppa64_extrw(rs, 31, off, rd, true, ctx);
+
+			if (!is64 && !aux->verifier_zext)
+				emit_hppa64_zext32(rd, rd, ctx);
+			break;
+		}
 		if (!is64 && !aux->verifier_zext)
 			emit_hppa64_zext32(rs, rd, ctx);
 		else

-- 
2.53.0

