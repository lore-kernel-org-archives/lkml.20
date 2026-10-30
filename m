Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361154;
	b=2xHd8gtNoeKEK1ZWmYwC2d3Lomw4LlfSPej2DsOrnFfkZcvbfazi9q1/0isH3NmHs0BU
	 zBTewYNBtB8zQ7if5D2Bdbdaw2MFwF2+pyCFdroKUCm2jTXERIe+Mv/yW1RMaxeiQ6UGE
	 RSH0QBjYEFIs0lgbBob//FvFbT3u3anRZrI4zVpOtxU7EiSk2pV5QU0f/MKeUNSfsl5BD
	 EiUyrAW1fkmVsMfyZ3L3nnGe846f9gDwkztxM6JXUgosbtbGifqCoUUU6btQvn8uQX3SU
	 Iv6Ymr2sixDpe90SAitrBrqtAZlJIV5l33bmBIm9r6fGhs+TIYwrau95hAr2pDwDmag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xY5ZkndmFMf2LbZXpMfL+ygtVk5Y69eKvZZIjY4DZNo=;
	b=iSoH8Pe4Ok9k34Qog+FaRIIJCmYno7VG5zVrL9nasPXYNPtRR6JeKtkCDv+z1Rr2OU+r
	 pA0vlyYHIFikv2aJuK0PI+O5Mx/v+zGM37YA5RV5NTyhB5nFzjgHUctUpaywrTpiInZ8a
	 rgjeKqZWI4fVqkSfSRATZDl0ZcmMpCI1ovYuEshg/Bc6NhdDIt7Z8iGDblLQJdd6J2LrK
	 O2L0Ug4xKlGXa7kuLK+yCb2A+S5TG073jZPl3yMH/Ta5yRQcNd/VB1io6eQIMV7dwhc9n
	 4eRxzYuXXUOLCOIT19GVdIju4ThcdwV0yoxuqDR6F6nEsLG1jFGFZ94cYYJ9YzK52bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xq8RwB6j;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2354B606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2354B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xq8RwB6j
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1adbf62dd31so235216c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361153; x=1793965953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xY5ZkndmFMf2LbZXpMfL+ygtVk5Y69eKvZZIjY4DZNo=;
        b=xq8RwB6jiSpXRmhtYpKXXXCRixxgLlIarUYiUq6Q18fNn+PtVojK2aVJtCVeKntG8m
         nxlMz+UP0+XDFuEgEHHioqrwNdhoEgcSBOtazo6Xt2PTqOilfONZCDXF8+ekSvjW1/V4
         BiEu2ExR3sIZwCt6g6eIzEnNal/hkMcPix7o1fwYFPaSyItK/f5VJJsvPLsfPDygrZQ3
         PtJrbNFEEwvkpzXw3yPQkBrgN0HqHmX/cSPlhvY9Pz272XXbwMEAavwpHjtX0H5MeyfJ
         P3GIHsceguiBn2fGD27ADFpKd6ZUr2xjuAgdnVrrP1wTV8Kgjw/LGUNGZw47Ynk1c4mj
         r7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361153; x=1793965953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xY5ZkndmFMf2LbZXpMfL+ygtVk5Y69eKvZZIjY4DZNo=;
        b=DmO+mnfaHCKY5BozgMhSH/xA7SwNBQ9R4S4oz130XuCXW5DOh1sZi1ruL5QmUWrpso
         Wv4rBjrym3YjCpyEaCu7+DozFbuIPlW1Tpnil2GiF/gN8LCPIUXaFIXRwafESiUKYdfO
         CNebwkOfjQ4LvDQB5hC80PhuJ7+K4jITaFeBjVdaL2KZ/HC+bVII408SDIcZjcBQ1Lnu
         YveMAjBZeafFpD27z2CBSM1cMq6/SrsTkc2VnAXsWTkXb29GP4N1eXLnCts5Xdkc6yA+
         VpdBkenttULXuo5E6dCC3Bigsy7vD3XPLqIgSRjKh4qgeNdg4Hh9VeryX7EjqwMaViLu
         8waw==
X-Forwarded-Encrypted: i=1; AKwUvBz6NHtSbYm3DkG3qEEmM0mla92AoEXk+n+OeHpVbnE8cWKG6Hl+vWZK4Un/6ZniJ5IQtn2pcidCaErwFGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8yqWx4F6vQfsP0F9/wruN0nyzCqVX+oayPvT+f9inlfs+QpZv
	JXtWaBzma5BJf9ul/AONgP0mZ4daermGkEMRIMauGbYiaJLUKq+Mvmt94zY0y624
X-Gm-Gg: AYBFou2gM6Un7Ng4MW+xzocxSielnCHUyaipjJ8gb5+xyf50cQI46plUATPe6MsLdmS
	RtIAFfVJEFkFfhyG0EPtwGAB7kZ/mV5UgDB4YTU259Go1qs77k9qf49iycd0qfT2sRxILvQcpQ/
	ugPD0uL2Oz4sy/EXN/ZaVH9P+ZGa/Y16YbZ29Ckg8QMt6tDdiHVb3FBp4CplHSyiC81MyPpfkyP
	puBKfKNLsWJ47SFMpcxBmy6PphbMN7eYtGYrNHBbIZDHAnFEA1fI5NfiKNLam+x8ytdRvOOPvNW
	JGlbLFPu9pmZYvM7vpFPm7w0PfVrjX19SC6DjR/y4T+pC+K0NoupnDJxUVY9twnvfrtLK3XivV2
	AkynJ7yBubmpAYUUqKIoxBuR4ci792L4BXtem4zvcsSAmvazBygj5HogErfYGRNeySPSmYH2d40
	dYMqx1NPjuAaLgSwy/FQMrAjvkCmVcyXVFwxzX71/psdjqiwMHYvu/X6/uJRltCXE8WAbKQ1pyk
	ly1+kKoDm/d36howUxPClT5NTTMYAF0lzaYFWaQPMrumS+az/IWbIBPGqFxJLvzprr7/A3dtiJT
	wihpM9SWYnQVDNFZ6RRwbwXB
X-Received: by 2002:a05:701b:2091:20b0:148:bc4a:8356 with SMTP id a92af1059eb24-1ac5d5aae1fmr2848969c88.28.1793361153022;
        Fri, 30 Oct 2026 04:52:33 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:52:32 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:51 -0400
Subject: [PATCH bpf-next v2 06/22] bpf: Drop the constant delta from
 bpf_do_misc_fixups()
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-6-55cd43439f7c@gmail.com>
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

bpf_do_misc_fixups() counts in delta how far the patches moved the
instruction that it handles, and indexes instructions and aux data
with i + delta.

Nothing changes the program while the loop walks it anymore, so delta
is always 0.

Remove delta and index by i alone.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 76 ++++++++++++++++++++++++++---------------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 1d281428acbb3..940265cb80ebf 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -2025,7 +2025,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 	struct bpf_insn *insn_buf = env->insn_buf;
 	struct bpf_prog *new_prog;
 	struct bpf_map *map_ptr;
-	int i, ret, cnt, delta = 0, cur_subprog = 0;
+	int i, ret, cnt, cur_subprog = 0;
 	struct bpf_subprog_info *subprogs = env->subprog_info;
 	u16 stack_depth = subprogs[cur_subprog].stack_depth;
 	u16 stack_depth_extra = 0;
@@ -2057,14 +2057,14 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			goto next_insn;
 		}
 
-		if (env->insn_aux_data[i + delta].needs_zext)
+		if (env->insn_aux_data[i].needs_zext)
 			/* Convert BPF_CLASS(insn->code) == BPF_ALU64 to 32-bit ALU */
 			insn->code = BPF_ALU | BPF_OP(insn->code) | BPF_SRC(insn->code);
 
-		if (env->insn_aux_data[i + delta].arena_scalar) {
+		if (env->insn_aux_data[i].arena_scalar) {
 			cnt = arena_scalar_access(insn, insn_buf);
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2089,7 +2089,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 
 			cnt = patch - insn_buf;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2176,7 +2176,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				cnt = patch - insn_buf;
 			}
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2202,7 +2202,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			*patch++ = BPF_MOV64_IMM(insn->dst_reg, 0);
 
 			cnt = patch - insn_buf;
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2218,7 +2218,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				return -EFAULT;
 			}
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2233,7 +2233,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			bool issrc, isneg, isimm;
 			u32 off_reg;
 
-			aux = &env->insn_aux_data[i + delta];
+			aux = &env->insn_aux_data[i];
 			if (!aux->alu_state ||
 			    aux->alu_state == BPF_ALU_NON_POINTER)
 				goto next_insn;
@@ -2267,7 +2267,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				*patch++ = BPF_ALU64_IMM(BPF_MUL, off_reg, -1);
 			cnt = patch - insn_buf;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2304,10 +2304,10 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			 */
 			stack_depth_extra = 16;
 			cnt = may_goto_expand(insn_buf, insn->off,
-					      may_goto_off(env, insn, i + delta),
+					      may_goto_off(env, insn, i),
 					      stack_off_cnt, tail, ARRAY_SIZE(tail));
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2320,10 +2320,10 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 
 			stack_depth_extra = 8;
 			cnt = may_goto_expand(insn_buf, insn->off,
-					      may_goto_off(env, insn, i + delta),
+					      may_goto_off(env, insn, i),
 					      stack_off, tail, ARRAY_SIZE(tail));
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2335,7 +2335,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 		     insn->src_reg == BPF_PSEUDO_MAP_IDX_VALUE)) {
 			struct bpf_map *map;
 
-			aux = &env->insn_aux_data[i + delta];
+			aux = &env->insn_aux_data[i];
 			map = env->used_maps[aux->map_index];
 			if (map->map_type != BPF_MAP_TYPE_PERCPU_ARRAY)
 				goto next_insn;
@@ -2356,7 +2356,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			cnt = 2;
 
 			i++;
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2367,13 +2367,13 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 		if (insn->src_reg == BPF_PSEUDO_CALL)
 			goto next_insn;
 		if (insn->src_reg == BPF_PSEUDO_KFUNC_CALL) {
-			ret = bpf_fixup_kfunc_call(env, insn, insn_buf, i + delta, &cnt);
+			ret = bpf_fixup_kfunc_call(env, insn, insn_buf, i, &cnt);
 			if (ret)
 				return ret;
 			if (cnt == 0)
 				goto next_insn;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2414,7 +2414,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn->imm = 0;
 			insn->code = BPF_JMP | BPF_TAIL_CALL;
 
-			aux = &env->insn_aux_data[i + delta];
+			aux = &env->insn_aux_data[i];
 			if (env->bpf_capable && !prog->blinding_requested &&
 			    prog->jit_requested &&
 			    !bpf_map_key_poisoned(aux) &&
@@ -2424,7 +2424,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 					.reason = BPF_POKE_REASON_TAIL_CALL,
 					.tail_call.map = aux->map_ptr_state.map_ptr,
 					.tail_call.key = bpf_map_key_immediate(aux),
-					.insn_idx = i + delta,
+					.insn_idx = i,
 				};
 
 				ret = bpf_jit_add_poke_descriptor(prog, &desc);
@@ -2460,13 +2460,13 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 								 map)->index_mask);
 			insn_buf[2] = *insn;
 			cnt = 3;
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
-		aux = &env->insn_aux_data[i + delta];
+		aux = &env->insn_aux_data[i];
 		if (aux->arg_prog) {
 			/* The verifier will process callback_fn as many times as necessary
 			 * with different maps and the register states prepared by
@@ -2490,14 +2490,14 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[2] = *insn;
 			cnt = 3;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto patch_call_imm;
 		}
 
 		/* bpf_per_cpu_ptr() and bpf_this_cpu_ptr() */
-		if (env->insn_aux_data[i + delta].call_with_percpu_alloc_ptr) {
+		if (env->insn_aux_data[i].call_with_percpu_alloc_ptr) {
 			/* patch with 'r1 = *(u64 *)(r1 + 0)' since for percpu data,
 			 * bpf_mem_alloc() returns a ptr to the percpu data ptr.
 			 */
@@ -2505,7 +2505,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[1] = *insn;
 			cnt = 2;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto patch_call_imm;
@@ -2525,7 +2525,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 		     insn->imm == BPF_FUNC_redirect_map    ||
 		     insn->imm == BPF_FUNC_for_each_map_elem ||
 		     insn->imm == BPF_FUNC_map_lookup_percpu_elem)) {
-			aux = &env->insn_aux_data[i + delta];
+			aux = &env->insn_aux_data[i];
 			if (bpf_map_ptr_poisoned(aux))
 				goto patch_call_imm;
 
@@ -2544,7 +2544,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				if (bpf_map_is_percpu_map(map_ptr->map_type))
 					prog->jit_required = true;
 
-				insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+				insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 				if (IS_ERR(insn))
 					return PTR_ERR(insn);
 				goto next_insn;
@@ -2622,7 +2622,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 						  BPF_REG_0, 0);
 			cnt = 3;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2647,7 +2647,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[0] = BPF_ALU32_REG(BPF_XOR, BPF_REG_0, BPF_REG_0);
 			cnt = 1;
 #endif
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2662,7 +2662,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[2] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_0, 0);
 			cnt = 3;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2692,7 +2692,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[cnt++] = BPF_JMP_A(1);
 			insn_buf[cnt++] = BPF_MOV64_IMM(BPF_REG_0, -EINVAL);
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2720,7 +2720,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				cnt = 1;
 			}
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2742,7 +2742,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				cnt = 2;
 			}
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2754,7 +2754,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			/* Load IP address from ctx - 16 */
 			insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, -16);
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, 1);
+			insn = bpf_patch_list_add(env, i, insn_buf, 1);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2806,7 +2806,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[10] = BPF_MOV64_IMM(BPF_REG_0, -ENOENT);
 			cnt = 11;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2820,7 +2820,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[1] = BPF_ATOMIC_OP(BPF_DW, BPF_XCHG, BPF_REG_1, BPF_REG_0, 0);
 			cnt = 2;
 
-			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			insn = bpf_patch_list_add(env, i, insn_buf, cnt);
 			if (IS_ERR(insn))
 				return PTR_ERR(insn);
 			goto next_insn;
@@ -2838,7 +2838,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 		}
 		insn->imm = BPF_CALL_IMM(fn->func);
 next_insn:
-		if (subprogs[cur_subprog + 1].start == i + delta + 1) {
+		if (subprogs[cur_subprog + 1].start == i + 1) {
 			subprogs[cur_subprog].stack_depth += stack_depth_extra;
 			subprogs[cur_subprog].stack_extra = stack_depth_extra;
 
@@ -2853,7 +2853,7 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			stack_depth_extra = 0;
 		}
 		i++;
-		insn = &prog->insnsi[i + delta];
+		insn = &prog->insnsi[i];
 	}
 
 	ret = bpf_patch_list_commit(env);

-- 
2.43.0

