Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361256;
	b=AhEYSKH0puD+vBvDgh8yEgjJ93EmsdNSi5b35l6hg6AsFVvsLFCBwrrRZwDfSKsV1eAN
	 TKqbZ93HgHIi4bxRIpaourPL+6YDQdhWsLECH4WTRLvziDuwW6jgzWZb2PwOI+/JgFHTI
	 AR2tjhpT/SWLk//uZ4PSG0/J30eZsmfTg1IKDQIrvjVgusWvgbIVscYxmMry0VVF6eeu5
	 iSWQQQXtHtXzQqXv5ngHtCtaLppTqLoZFF11eLHtvwCCqBn3JxSGupxDrPc63MObQs1BZ
	 gJfQmIKJdEnj7ykEeP40DopITANlrVjQr7akioSp2iGweQWWssUIDMfmf5Pj8bskBtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361256;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=U7T4/LBkZ2aLLguzrEpLCCec6wWvaqt4jUv6X0yRJyg=;
	b=gFabDbIWXcJ4wUQw3b9C89t86SD25pHq7ybLzUje/Csqs3DnDgIh9nJ+hhBCbnfmwgqO
	 sM6dezu0dyWLJxiffkQ3GXRqGpMSfG3KHC1PxGYBv2s7A0atrLPN/Wgc11fDsCMdwi4JG
	 Ybv4avMDNvlXz9FPVF/LLSBHN9zTLxi7wpCI2Rhm9eohtMT8p0Hj0DbAS83oWCbpg9UEW
	 tuRxRg4UW3EOIbO9I+zUparqYxNuBtaG5fgf0wJJwAub5Yfq2lBKw57qzZIWNbfLKrcsO
	 Z4ynuwfVm4f5qAPtWWgKjGO/FjfYXa8NuWC2N+ze8FRY0zXIJWxlYC5tOnRYeaA3cCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dV6pIqMz;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600FE606A338
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 600FE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dV6pIqMz
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-188406bb948so600363c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361255; x=1793966055; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U7T4/LBkZ2aLLguzrEpLCCec6wWvaqt4jUv6X0yRJyg=;
        b=dV6pIqMz6qcj5WU78ZHzj/KF4aKibYvrs8/6ji6nXDDNh5PDxdyvZSyJvYni9ymT1r
         rNBf1xYhAG/jXaKaFzktQpG2ZK9zdhVyN+y95XF127auwbS8LhI8r0OYqS0XolIPwWOW
         dzxadP/bMd8Vo8VmB2dYjuIMwpZ41MKi4hAOcuDJvY93EbmF+afT1IXyACyZlAW79pT8
         posjpZxdFgNsC0zIb6JimPVaNaLxI6Fqvryx+FhEZTBU+5IIxX0mQrHvFA0khE5DcsMT
         fRBicev11S9ZrLyo5ptfT703aUlKAzBvjIf58F4+8XG+XIcudN/+gRF0zygAR/5rE9vM
         McOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361255; x=1793966055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U7T4/LBkZ2aLLguzrEpLCCec6wWvaqt4jUv6X0yRJyg=;
        b=DXkwOvbF9oDqzEJLQ/uNwaCz+IrUCi5RFk8jXGbF6RQ/x2Iv42Ch+grygLf8yPkjLA
         7p7USWFIpJy2DOvQ02Yo3F0G5zckMcm68IV9+wWxSfRekaUdTw1z5m8uvSK737BqNha3
         k972itip6HBYQRj3HCWAA4OuoKe5uH2vctOezkwoVXwLgrDnGuN9tMu7ibDEyc9YmQLD
         vDtIXXz66JlL308G28HV5JgKI8lLktZq4aNt/UpdQK6drzLQgGkPWUlz0fS9q/BUQy/j
         orH8YwoZzJ2xgya9LoHZ830uh0Iz13xmOD365zNdAP11dJZ7f/2HtTWs0vUi6FmyeUkp
         OrzQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3I12LN4ok0dh52ufruMLDpr4ztIlNy3DlGIeq4WM+kRutrRBOWG1IdWApUu2Uj29YSDPYWVUoei8Mhk8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLM5ZrL7umdZrIfBH1gqIRbpBmnGrj7Kv3BygfhWnQota6aj/r3
	vI922U3XYnCGIqIG6z1qqPsycGAGxXLglLKkFD4lA4hojdZfD8YCV1X8xeEpomuB
X-Gm-Gg: AYBFou0qz8y65CruLfFjyWypEse9XJvLz2KFxsNH9wcuA0hDf4vWECQZXegk07INNdv
	VvoTubYtTv6p6Dba00YCFDPHj5gEwnzj0jmjhjnD+XUhpc+ZgqkGJZjVd52Nat6hKQ1XUl/8cDO
	p4W+4+JqtEtWbo3tDLoUDcL2AX+pi5sBCv6jNNzjbwGhXJOOeO76kVqlDmiUvPLbLGNMGeFzwIl
	ZX8fShFE1w6c+wCsys2lRAWAD23zd0OcGCb+kyVI8BAD4KGryW6Zwlrt5qoJxikSx8du2ozG2sU
	21b9MR8L5AjL+u1cNhDww4EPrHOOdAW0Zrd93SN/ivy73HHiWcjczDLncqFkGOW8t+iU+Yk6IbF
	Z5qGf1wHKrF8En1eZFpZeSs0wM0J2uFSz9FOQcd39g9LcsVj6QhGefhNgmL8ekHv7YiPgls2CyV
	TtexmaIaAZQscIfHGSwPeAWYRAbUurMbJW/GN8/XG3J37Cxn6zSJgVZYMg+25PF/R/UJmmd6MQJ
	UdU55Z7a0aWDpYntiOeZbNaJIV+qI7w84zcVTfC5S3tCdnLfM2yABrWEtBDn1/9deu5tLNVDL3u
	Y7t6NfPu+rOJFJ4LF/XJV1ta
X-Received: by 2002:a05:7022:b053:10b0:190:da74:2c89 with SMTP id a92af1059eb24-1ac5bda4447mr3052864c88.21.1793361255352;
        Fri, 30 Oct 2026 04:54:15 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:54:13 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:52:07 -0400
Subject: [PATCH bpf-next v2 22/22] selftests/bpf: Cover a backward may_goto
 pushed out of range by patches
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-22-55cd43439f7c@gmail.com>
References: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
In-Reply-To: <20261030-bpf-verifier-patch-batch-v2-0-55cd43439f7c@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

bpf_do_misc_fixups() expands a backward may_goto to gotol when the
patches queued between it and its target push its offset out of the
16-bit range.

No test covers a backward may_goto whose expanded jump only goes out
of the 16-bit range through the patches in between.

Check that a may_goto jumping back over 8191 guarded divisions loads
and is expanded to gotol.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 .../selftests/bpf/progs/verifier_patch_list.c      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_patch_list.c b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
index 1370cdd5e5836..302e739caf83c 100644
--- a/tools/testing/selftests/bpf/progs/verifier_patch_list.c
+++ b/tools/testing/selftests/bpf/progs/verifier_patch_list.c
@@ -172,4 +172,39 @@ l0_%=:							\
 }
 #endif
 
+/*
+ * may_goto jumps back by 8195 insns, by 32768 once each of the 8191
+ * divisions is guarded by a patch of 4 insns. That still fits the 16 bits of
+ * may_goto, but not the jump it expands to, which has to become gotol. Once
+ * the budget runs out, may_goto jumps back with r6 set and the program exits.
+ */
+SEC("raw_tp")
+__description("patch list: backward may_goto expanded to gotol")
+__arch_x86_64
+__success
+__xlated("...")
+__xlated("{{[0-9]+}}: gotol pc-{{[0-9]+}}")
+__naked void patch_list_may_goto_gotol(void)
+{
+	asm volatile ("					\
+	call %[bpf_get_prandom_u32];			\
+	r1 = r0;					\
+	r6 = 0;						\
+	goto 0f;					\
+1:	r0 = 0;						\
+	exit;						\
+0:	if r6 != 0 goto 1b;				\
+	.rept 8191;					\
+	r0 /= r1;					\
+	.endr;						\
+	r2 = 0;						\
+	r6 = 1;						\
+	may_goto 0b;					\
+	r0 = 0;						\
+	exit;						\
+"	:
+	: __imm(bpf_get_prandom_u32)
+	: __clobber_all);
+}
+
 char _license[] SEC("license") = "GPL";

-- 
2.43.0

