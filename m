Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361187;
	b=qdYWQ8NWt/eH3u3I+W+JAZ5yvG7/5wJnE+h3pZSYQA0YiWMYFNQ29N205GmeV0a5DlXz
	 79iOtk0Alc8l3UwOc5OCdPidmgThsNB+5Hmiphcurh4NvnUlOuh4C7xyFBlt0d4zY2dTU
	 8HF5rZ9qKrAkmWtVqBgAdiuglz8qt4/tsTCF4I0oMklBSpz882wsh1k0oXJiKhWipDNW6
	 KBBO9tBMQDzu4e7QFT67nAPEa4ZH+oaw4SXmPIytCECMVWPONybzfoBjezXSP9YlzwHXr
	 9kow8yB7IzXNX9hZGfD7YU7iY1B7h9Z1oQEN4I43gwOxPvPjwwlH60AvBkBUCaaZjWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=iQEzt43Iqk8rbRcHs3uXdnSD5RPpGNITGkl2B8MxniU=;
	b=J8FP5qEjrbIACr3hpJA8UA/jFdCgiZWx58mdm3u5ddc1NftLnbfyf0wRS/dG+tnUSqgB
	 9hbgbKXqBhY9hqYS5k53XnT/wHOjGUmo34Py8txtaALZkblpQRvVCjEgFCTQf/3DYtKhb
	 JftOCz0ewOEMyXAow4t1YmN7ZjPdaaycWIS9iZ6ygX8s39xi7Byu8Uh6ZecansXtWuGk1
	 ccvIby0c4oB+yML74jKmQG3Hz61rl5VlAHqleHpIWf0mHDF6oRh65KRGmg7ZicNIVBRnT
	 dJcxzqQdr94UiyQo3Xv8zS33ti5xZ4jcfVMZlu+5/d1LCr5DfUofwR+tsa+z+c3uSCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gRuXZ7z;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4F9606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B4F9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0gRuXZ7z
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a8cc11ac42so493389c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361185; x=1793965985; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iQEzt43Iqk8rbRcHs3uXdnSD5RPpGNITGkl2B8MxniU=;
        b=0gRuXZ7zMuqbsyWRK6lKnnzAHdWcTKuZUdwmJmDS1F7SpRV1uDXTNRfWBOPV3lvtlP
         jFWjXPQQYsz0P8Jz/88sy5s62vr6S+HcA1Wm3qgghHVPkppetfVW6lQsa+yPiSIax0q9
         /qrtTJTITs6yb0cSTeZjYrVbWlGVMe13t3IfWVpwPzsCCbKla7fxDMT60hsRRVTAf649
         ozSe37tXGQCcBbZ1EU4VtzcEipOkZ4BMLB2Lq93EX7Rvg+HlOXnqy0TOBewVPIFzTeV3
         FwidNwo/JtEWA2+22VhhOgQooaBUCmkDwoOhtdwemtBa/yI63uT6V4GaCVNWfbTz7NLm
         OuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361185; x=1793965985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQEzt43Iqk8rbRcHs3uXdnSD5RPpGNITGkl2B8MxniU=;
        b=kVv9LsjMyeT38jMFFo2w5XK6A7R7QfgK258Y106LB11dhPLdOlk8s7j4Txrv28pz7F
         wz5UGogNwHaRQgtBAMhd9q7yK31QIPxgyzOk2DRB9cq6PvpTpJQoj2KKx5aRdN6FO7CM
         BH2tF0pCbkFVuM+daPpoeYwwa9Za95cfZB/9losYHyEWj1z7VQyjIJv180q1s2Nbyqsj
         6IBxj4LB4Fn8IA9U4XTUQdGu6I+UUUTDxaf3qk2tNM024e9yJelsqlSiMdHX5GMYNcn5
         Nv41Sz9bzVbLSQBf5NVBw4DzNNQIkAJgHkyqJ5gvZ2PkDlDeFi2VzmIRnkKgCFwT+AbP
         OHOw==
X-Forwarded-Encrypted: i=1; AKwUvBzASXR5YO2Z5IFB3wraAihjYt1zoMMeuW5hDtkb2vT0e9zVJlAHO+lX41A1m32xzsdqrEtVEUtiwOEoP2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzbhlbj1Qa9xtI9U8DngvYASbDNT9XBy2pl582Y7JVQjiAGlJF
	4YFBbwkL7R6+Fz+aX/RZ3VLSLxeyebJ0Jl4Dmiu5iqWrWJqyzJNwDhHZCJ8TkhN/
X-Gm-Gg: AYBFou1ohNKC/hVU1pnn3a9zGNLTGXAMhdKLLYWZ46paITRnBSkXz8QVBUe0QqVCrZo
	4vS7G0MUm+C3BnuboyKgAsoIcPrX74oUGd5wjwS5OG2LFdJvYdtLgaBjQ/Ru1t+62CKPZh/Lf4D
	w8PYS9PUw13beeyxrdz4DYCcebU+l7voawbDHdLMldwzxupjranD5M4PCg/hw7UZ13isOXor+nB
	JGUqmIJBtZ4+TehRKZv6ZHszT9Ivui6f/oex+dq0eW3WIhZLSwfUTyZqfLDD19+L+kiwpCxWodX
	w6qdYT5NnnmsgCP1Jz0J6eUYDY3PKdobnMZVP7Gr1OqzW50SEUvTwX55NmuBeV5nh5jKdU4tn0n
	L1SWR6gOsFyhDGxqIZ1FeRN9q5KEiAXLoBXsC3Za6MkQCOnn2v23OLOBQ7C8ZK+NqrOE/9Gwc04
	dQj/1PbjFqNR1xo1bwV+CrPL2qIdY5PE6ipylIrH9LBCqPWad4YQGK+mSD5pcVNvEGOkUrN9s7p
	rziWNXQOwdmXf+mzEL+rPqham3gwwVowPWSgCB8diZWsVLzEIfjimio6Zi0D3Ykf/gYxN4Ydb3z
	Kgw+85D0kV2/eOG6nWKqMDBh
X-Received: by 2002:a05:7022:7f0e:b0:168:6ad8:e89f with SMTP id a92af1059eb24-1ad1068169fmr1638356c88.3.1793361185232;
        Fri, 30 Oct 2026 04:53:05 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:53:04 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:56 -0400
Subject: [PATCH bpf-next v2 11/22] bpf: Allow patching an instruction twice
 through the patch list
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-11-55cd43439f7c@gmail.com>
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

bpf_convert_ctx_accesses() puts a barrier in front of an instruction
and may then rewrite the instruction as well. bpf_patch_insn_data()
applies the second patch to where the first one left the instruction,
the last instruction of the barrier patch.

The patch list refuses a second patch for an instruction, since it
takes patches in increasing order of the instruction they replace.

Make a patch queued again for the same instruction replace the last
instruction of the patch queued before. Move the backward jumps of the
new instructions down with them, so that a jump back to an earlier
instruction, like the one to the shared epilogue, still lands on it.
The barrier in front of it doesn't jump, so warn and fail if an
instruction in front of the last one jumps past it, instead of moving
such jumps along.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/core.c   | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++--
 kernel/bpf/fixups.c |  5 +++--
 2 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 75d6399ce0965..10efd1dd36689 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -599,6 +599,46 @@ static int insn_set_rel(struct bpf_insn *insn, s64 rel, bool is_imm)
 	return 0;
 }
 
+/* Whether one of the 'len' insns of a patch in front of the last one jumps past it. */
+static bool patch_list_jumps_past(const struct bpf_insn *insns, u32 len)
+{
+	bool is_imm;
+	s64 rel;
+	u32 k;
+
+	for (k = 0; k + 1 < len; k++)
+		if (insn_get_rel(&insns[k], &rel, &is_imm) && (s64)k + rel + 1 >= len)
+			return true;
+	return false;
+}
+
+/*
+ * The 'len' insns of a patch were moved down by 'by' insns inside it. Keep
+ * what they referred to in front of the patch, the same way as
+ * bpf_adj_moved_insn() does: a call to the start of the patch, the old start
+ * of a subprog, stays there, a jump to itself doesn't.
+ */
+static int patch_list_move_down(struct bpf_insn *insns, u32 len, u32 by)
+{
+	bool is_imm, call;
+	s64 rel, tgt;
+	u32 k;
+	int err;
+
+	for (k = 0; k < len; k++) {
+		if (!insn_get_rel(&insns[k], &rel, &is_imm))
+			continue;
+		call = bpf_pseudo_func(&insns[k]) || bpf_pseudo_call(&insns[k]);
+		tgt = (s64)k + rel + 1;
+		if (tgt > 0 || (tgt == 0 && !call))
+			continue;
+		err = insn_set_rel(&insns[k], rel - by, is_imm);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
 /*
  * insn is number 'idx' of the 'len' insns that replace insn 'off' of the old
  * image (an insn that isn't patched is its own patch of length 1). It lands
@@ -631,7 +671,10 @@ static int patch_list_adj_insn(struct bpf_insn *insn, const u32 *new_off,
  * Queue the replacement of insn 'off' of 'prog' by 'patch[0..len)'. Patches
  * are queued in increasing order of 'off' and applied together, so a pass
  * keeps addressing insns by their index in 'prog'. Jumps in the patch that
- * leave it are relative to the patch placed at 'off'.
+ * leave it are relative to the patch placed at 'off'. Patching 'off' again
+ * replaces the last insn of its patch, where the insn being patched went, and
+ * the insns in front of it must not jump past it. Jumps of the new insns that
+ * leave the patch are relative to the first of them, as for a first patch.
  *
  * Return the copy of the last insn of the patch, which stays valid until the
  * next call.
@@ -640,9 +683,26 @@ struct bpf_insn *__bpf_patch_list_add(struct bpf_patch_list *pl,
 				      const struct bpf_prog *prog, u32 off,
 				      const struct bpf_insn *patch, u32 len)
 {
-	struct bpf_insn_patch *p;
+	struct bpf_insn_patch *p = pl->cnt ? &pl->patches[pl->cnt - 1] : NULL;
 	int err;
 
+	if (p && off == p->off) {
+		if (WARN_ON_ONCE(patch_list_jumps_past(pl->insns + p->start, p->len)))
+			return ERR_PTR(-EFAULT);
+		err = patch_list_reserve_insns(pl, len - 1);
+		if (err)
+			return ERR_PTR(err);
+		/* the last patch is at the end of pl->insns */
+		memcpy(pl->insns + p->start + p->len - 1, patch, len * sizeof(*patch));
+		err = patch_list_move_down(pl->insns + p->start + p->len - 1, len,
+					   p->len - 1);
+		if (err)
+			return ERR_PTR(err);
+		p->len += len - 1;
+		pl->insn_cnt += len - 1;
+		return &pl->insns[p->start + p->len - 1];
+	}
+
 	err = patch_list_reserve_patch(pl) ?: patch_list_reserve_insns(pl, len);
 	if (err)
 		return ERR_PTR(err);
diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 6c2dce8f3b6eb..a56b743be0062 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -381,16 +381,17 @@ struct bpf_insn *bpf_patch_list_add(struct bpf_verifier_env *env, u32 off,
 				    const struct bpf_insn *patch, u32 len)
 {
 	struct bpf_patch_list *pl = &env->patch_list;
+	struct bpf_insn_patch *p = pl->cnt ? &pl->patches[pl->cnt - 1] : NULL;
 
 	if (bpf_rewrite_must_abort())
 		return ERR_PTR(-EINTR);
 
 	if (verifier_bug_if(!len || off >= env->prog->len ||
-			    (pl->cnt && off <= pl->patches[pl->cnt - 1].off),
+			    (p && (off < p->off || (off == p->off && !p->len))),
 			    env, "insn %u patched out of order", off))
 		return ERR_PTR(-EFAULT);
 
-	if (len == 1) {
+	if (len == 1 && (!p || off != p->off)) {
 		env->prog->insnsi[off] = *patch;
 		adjust_insn_aux_data(env, env->prog, off, 1, NULL,
 				     BPF_PATCH_KEEP_TARGET);

-- 
2.43.0

