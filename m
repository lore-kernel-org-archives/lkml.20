Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361148;
	b=HMfLtGn62Exy+NQTQEXw91rxcLb/QUw/9GVv985giUFgjsNpZmG9oyFCfoUuAoDDB32B
	 uXw3luuYRBAery4cj4GKVgabAP2A1D0Hbhz2tZVbq2oBiPBBOqrFbFsBvliRIgiDDjYJ1
	 NNJozCgD0wWEX08q31kauoq35BwZRP6Wd3rdFZpEkT4Id+3SOUq+jeDcaKCfHkXAlKtXX
	 voQPFO+T5tu/RP69Gt6Ibdi4NCK5L+7vKboK0iGHttTFABmu7j25g8pI5xM85OxFN26QN
	 WI3XSt2gpNyDPXAdvBBDq3cpHdjXyFk4zOgmZOygqHH+kHF9XUaEe+9L+1neyCC/vpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xlFJ7GxYpC5EWMxIsQaH4NQ1xOX2nqD7BFPSqffaoss=;
	b=NHmAdiBlTTXHnZdG3MKVblRi1P7nvfkOxqLFbc8hAUIBfxn+WjNlPyofELrdgaTr6KGl
	 S94esGo14n5ntnHMP5l1Kt5Uz50DPkhm882qoan9gqREqvwYKBo4tJou8pqO/ZkNysLuT
	 +ueukVtoOXqaT7qVq2Xt5oDeimq0TWzuYdlyXinc/eP7G9EfmJC4sMuDArWJc1nPQ1ISu
	 S1ZILQ960JOIb6pV2vL4/ucPp53IDpjzeRE15yV9MuYWkymEC1M4ieYW5oGDoAFfU6m1v
	 7E2EKqmg8RF+doFhipRhw+GNar/G3iC1trWb7gizHoeiNGeANgiW8214MI+jEsDRizw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tn3+2EVE;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E323606A324
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E323606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tn3+2EVE
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15943c9c005so1060568c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361147; x=1793965947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlFJ7GxYpC5EWMxIsQaH4NQ1xOX2nqD7BFPSqffaoss=;
        b=tn3+2EVE9VsxwlCaUiZdSdLVlwb/v0LnryO6LnbLY8j3QiEm6249BpnLNTY/KWFTdt
         66/QA3JH0cBHo6rKkhoE2LBCdyA/1rhThK85SvImlToRzwA99LWFZRP02smBQOva3oZh
         qxsrSiPZ9AehYWd4zQwLTCnAWEmJY+iQYFHkxMyqq/X1rPn6iFv6Hur0GfWkg1OKQQJv
         q0UlblrOJX+EinwDNmE3Au0C73k6pONf8AlMXmXWBIYVzPdVS+5u8PMQPfvgtlUgNkdl
         nUTAm8kvFYudk85w+QJdyBX13wAMGyXsist3Qpp4hI/f5yrGgOn7U3GIaASV8uxrj/jE
         bAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361147; x=1793965947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlFJ7GxYpC5EWMxIsQaH4NQ1xOX2nqD7BFPSqffaoss=;
        b=CJvBqnGzLZMsF+w3twNItQ9TFXPJ7wQTAzlGVk/13AmHd7+Anj9Dd/qYHeWtSA6dkv
         nEWAtKYxdx14DmdrsiDFr59FGgHKCZ1cu+QcxU5Y8jWw2fycv5JfO+FqcqGU9VWT5d9k
         MhajYtSwmvynjhm7GslM86jLQHBZK9CTQI+HJD0MqQrfGE7Bcxgb7l0RuxRLlcyUpYVI
         IPyMhWkJ6TJ074KBcB1J5T4bYc6nyfEW0m9sI0S7OGyfwnvd/fW3Quokdty8hve28pwK
         rYHeqRXblIkl2aKmaaQFidu4pLGtp4KqmkP8GJiECkePlyduiSlFS4m/k6GV6UGDEZC9
         xbbg==
X-Forwarded-Encrypted: i=1; AKwUvBw8sdoAlmh76Los1VdnyHjeqjE5XerNuSHXusxPLLiwPyF1gOctgsPBg5Xio5C2r0vm7HIFk7XIOilivZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+2JOJXzMxJzfc+xnrt8Td0PwB6Q1i3iBdMtcxz2KsOxEooZB+
	1QwcZidIS5NZAiVybSs9YAlbJNUFOMNE4vB+bJwZZwipbovK8iOWkGxK661+EFgR
X-Gm-Gg: AYBFou2vMxoPRWu1Rv/dzjS7H+5h7vt6ujLB/RIhhmQQ9rxxWxbAuxTLYZD3J8FDY/j
	p8QnLANAe/lxiZhgoF1eq2L24olJUYhXZrGU+2N319mTpMSCLI/IfTW2CIztczt0SOMHkgPafZx
	aQNm4tJDoG4PK1oWLAWREK26To39uolkTjxDtkSKSICnObYjkJF+WDE7zhzm53WMnF8l9vZSdbf
	6Npyc5g2H8+O2VtyYtiovIgUDvNZsFtr0BADKevaUU9EY/XwAelPqHuUjaCifW+m9SUGLabgjXX
	ZOsEvV4DBX50zHOYCMu9DIyCKC/a7+DEFXrE7Zy1PJYHPqQVCKQp2M6rUuGIXsccAq8hT/ZJh/D
	Px1kGUi2n/k5tiVXg3uz1rr0HF0nmDfenW5YZ73TD3deNRxp2zeJHNKh28/yaa1A5o0Yl1siHn+
	HALLyglq1SiyQuWEkpEWRw1jj701fODbFs14CpYW8H45HOTYmTSwBkbiuMflg5bhXF7xuYapBLl
	AP744KuYpQ5ao3gmieTlEFqYIvokDVzHj24vq3pAhR//d/SrN5KoWxWIyFsMnMF7obMU3Fd1HHb
	Fj5St3fuVAf9wYBRJJdd4646QWIwcH12SzLK2/blkEC5ow==
X-Received: by 2002:a05:701b:230f:b0:1ac:d029:70b5 with SMTP id a92af1059eb24-1acd029740cmr1979637c88.33.1793361147478;
        Fri, 30 Oct 2026 04:52:27 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:52:27 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:50 -0400
Subject: [PATCH bpf-next v2 05/22] bpf: Expand a backward may_goto to gotol
 when patches push it out of range
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-5-55cd43439f7c@gmail.com>
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

may_goto_expand() turns may_goto into a conditional jump with a 16-bit
offset, or into gotol when the offset of may_goto doesn't fit in 16
bits.

bpf_do_misc_fixups() picks the jump from the offset of may_goto in the
unpatched program. When the patches queued between a backward may_goto
and its target push the offset out of the 16-bit range, the commit
fails with -ERANGE, as bpf_patch_insn_data() did before when applying
those patches.

Add the growth of the patches queued between a backward may_goto and
its target to its offset, and use gotol when the result doesn't fit in
16 bits.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 38 +++++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 7 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index c9963d8d81356..1d281428acbb3 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -1968,16 +1968,21 @@ static int add_hidden_subprog(struct bpf_verifier_env *env, struct bpf_insn *pat
  * may_goto when it is zero, then the tail that updates the count.
  * Use gotol when the target is too far for 16-bit offset of a conditional jump.
  */
-static int may_goto_expand(struct bpf_insn *insn_buf, int off, int stack_off,
-			   const struct bpf_insn *tail, int tail_cnt)
+/*
+ * 'off' is the offset of may_goto, 'reach' how far it jumps once the patches
+ * in between are applied, which decides whether a 16-bit jump will do.
+ */
+static int may_goto_expand(struct bpf_insn *insn_buf, int off, int reach,
+			   int stack_off, const struct bpf_insn *tail, int tail_cnt)
 {
 	int cnt = 0;
 
 	/* Forward jump has to step over the tail */
 	off = off >= 0 ? off + tail_cnt : off - 1;
+	reach = reach >= 0 ? reach + tail_cnt : reach - 1;
 
 	insn_buf[cnt++] = BPF_LDX_MEM(BPF_DW, BPF_REG_AX, BPF_REG_10, stack_off);
-	if (off == (s16)off) {
+	if (reach == (s16)reach) {
 		insn_buf[cnt++] = BPF_JMP_IMM(BPF_JEQ, BPF_REG_AX, 0, off);
 	} else {
 		insn_buf[cnt++] = BPF_JMP_IMM(BPF_JNE, BPF_REG_AX, 0, 1);
@@ -1987,6 +1992,23 @@ static int may_goto_expand(struct bpf_insn *insn_buf, int off, int stack_off,
 	return cnt + tail_cnt;
 }
 
+/* The offset of may_goto at 'idx' once the patches queued in front are applied. */
+static int may_goto_off(struct bpf_verifier_env *env, const struct bpf_insn *insn,
+			u32 idx)
+{
+	struct bpf_patch_list *pl = &env->patch_list;
+	u32 tgt = idx + insn->off + 1;
+	int off = insn->off;
+	u32 k = pl->cnt;
+
+	if (off >= 0)
+		return off;
+	/* all queued patches are in front of idx */
+	while (k > 0 && pl->patches[k - 1].off >= tgt)
+		off -= pl->patches[--k].len - 1;
+	return off;
+}
+
 /* Do various post-verification rewrites in a single program pass.
  * These rewrites simplify JIT and interpreter implementations.
  */
@@ -2281,8 +2303,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			 * after subtraction, rinse and repeat.
 			 */
 			stack_depth_extra = 16;
-			cnt = may_goto_expand(insn_buf, insn->off, stack_off_cnt,
-					      tail, ARRAY_SIZE(tail));
+			cnt = may_goto_expand(insn_buf, insn->off,
+					      may_goto_off(env, insn, i + delta),
+					      stack_off_cnt, tail, ARRAY_SIZE(tail));
 
 			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
 			if (IS_ERR(insn))
@@ -2296,8 +2319,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			};
 
 			stack_depth_extra = 8;
-			cnt = may_goto_expand(insn_buf, insn->off, stack_off,
-					      tail, ARRAY_SIZE(tail));
+			cnt = may_goto_expand(insn_buf, insn->off,
+					      may_goto_off(env, insn, i + delta),
+					      stack_off, tail, ARRAY_SIZE(tail));
 
 			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
 			if (IS_ERR(insn))

-- 
2.43.0

