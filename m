Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2611A4E2F06
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847354; cv=none; b=ayhTpxFGjzA1mQpD9GHL5HYSCne7WQr0LnoKFsS6To03vFV+YvgLdv0+8zIEs80r6WJCIIPb9U9IaDyZv/jbrTdCa/dYpR2RKN6xBVR/xvb7v+eoXnBr+x8HWVjeaX4NwM3ayTBzRGF9xhI/ETWFEj0oxyyulqIOE66yoVz3XXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847354; c=relaxed/simple;
	bh=mpG8mcoI/dDXU0KSIMfFTBXxDshCigaoUbowi5yjPoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XtBHD3+Qom0kfZpJRW63N3fYqtHPWD4vYGEjfQ7PePsIkZuKWhBtxJo0wYmCoJedUtYUZ7NEAAtU+AKHjpEzMbi0sjPk4LGGpyOBXHecOQoa2qgPYJsVH4cIIXCCMG3k8VrrmL+ZPhXrVC8atb/F6Ejbv75ntEEg2CswulOQEes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0CDQ0R+; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0CDQ0R+"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-340f56c44b0so2638817eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790847350; x=1791452150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aAz5snqfAkudHA86VdYviv8NA1pdaM+oDlkyjTBWf/k=;
        b=W0CDQ0R+nQZy+sDOU875sl6D6LuZphpsKBm/MF98EiPSnnZLNwZHKCsLGmpN8PHJG3
         5K4YUWvC96uYuip++uQw6bqVjmOWB0KIG3gPK1D/2Bwa58RaCnQNAIrHsOK0Oh9tOFOX
         sVetehrqZigqy3V4ngB6QG/n6ZxZr0hq2Af2sCY1+CmWErAe5VMWAUS7F+JoQkpmr1Tc
         pZxcOzhinTkKUeHNhc+tLgdWRNJAEu+H7ESbgjhVef8j01dqCBtIaZvQQmPTUBr1PjtA
         uXcalO0VkJoEVhqrjP83vdWDLPMkz/2Yu8iK/jsb7Te73N+XWGMMJUAh096G3uHLy3qc
         /3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847350; x=1791452150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAz5snqfAkudHA86VdYviv8NA1pdaM+oDlkyjTBWf/k=;
        b=LGa+V7K8c760Jy5/t+JzAxdPLvE9TEZwLsIpNB4Fr/i+i+nFmJLhSzsCZDy+4cTOwI
         3SzvEZvPY4wIEmMBHvo7rNgJwix0NaxrSWPDih+U0LRqEJxz+xsb93jX66ZSHGh67yCr
         YK00x3zXyL+NXhrGod09SRGQoXXg491J1H+xp5sY/DUDxvSDuaey2ddki6MlQlYEwrO9
         K8wEnghYHzuARpJJLKDLU3OApNZtCBNFm+PA/l91x5m/kWG5q4hUMR5hUgh3HnUGSoFF
         HnmqVYr1ASiLYmnJH0IDqbFJpTmoApX+7ZPgJ4L7i7bLWZqn8MUjJWLFB9YlGFpTaXa7
         XwHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvE8TswXSvlllhicW669F5TelCaXll2uK2t14+inmNsCDGfpiCbs2WJlz9VbC/CVWFnlxkeHdVVPsMaxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDQpwp/ccdK7D8SYKucERF5ecs76xKnZKU13iT20s9IOo9HJf5
	1EVjVLLNmvUcW2SiT8k4wZSjf6j4bPq8RR2lbEYoP+fzC0BkojfZPHtn
X-Gm-Gg: AYBFou1BeTHXKmY0KhbH66panD4FxDc0jSdkH2PDFkV8I2pdBwjy1bBQ6WYjhbFMaD9
	CT8/R4x9hdXUto3wLm37Tfsy+fYLIE4hcKZBE6avAypVHyNMbEOORifUywg2fwyO4bNhsE5xS6+
	upwThAdfJ8mkKMmVHEFzmDME/89ImzGHN3FM2wUpK2rr7ayeQZsikRyC3kBtTP9u/3kNm9cboBX
	jQqLkJmWDIBtGVi2wbCN33gabXde9RpdqN0Dy2sL/JavSdpnq79kZMzB9+dQ7ugW2fy1+mVU4bi
	zGsp0P42S35neVLk063XC1n++r/gewymuNCDMd8V2JzNDF0CJMo38eqqPtrsenlhBxM04Dh4Yze
	VUW7C7v5640eXLU4e87jFNyYTPrZbUqScS2cEKT8uztia/Ndx7qcP+JwrIFUbRherZt/TKeSn/L
	WtQfpxYiO4S3Vct5q1P9Epa3f7Qt4VOrYluTlA171LgFRTHgO4G+hiU3s3elP5kEnRHu0Tkg7el
	8CcSg==
X-Received: by 2002:a05:693c:8948:10b0:33a:f8c8:1d47 with SMTP id 5a478bee46e88-34cdc9bd06emr4263009eec.28.1790847350110;
        Thu, 01 Oct 2026 02:35:50 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db37507a7sm6003982eec.13.2026.10.01.02.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:49 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 01 Oct 2026 17:35:33 +0800
Subject: [PATCH bpf-next 2/4] bpf: Queue the rewrites of
 bpf_do_misc_fixups() and apply them at once
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bpf-verifier-patch-batch-v1-2-a12df8a09160@gmail.com>
References: <20261001-bpf-verifier-patch-batch-v1-0-a12df8a09160@gmail.com>
In-Reply-To: <20261001-bpf-verifier-patch-batch-v1-0-a12df8a09160@gmail.com>
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

Each rewrite in the main loop of bpf_do_misc_fixups() patches the
program right away, which costs O(prog->len) per rewrite. Queue them
with bpf_patch_list_add() instead and commit them once the loop is done,
before the stack of subprogs is initialized for may_goto.

The loop now walks the unpatched program, delta stays 0. A rewrite that
fixes up the helper call after queueing it goes on to patch_call_imm
with insn pointing to the queued copy of the call, so step insn from
the program by index instead of incrementing it.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 228 +++++++++++++++++-----------------------------------
 1 file changed, 72 insertions(+), 156 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 39566f3825108..4b96f4ee9b3d8 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -2099,13 +2099,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 
 			cnt = patch - insn_buf;
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2190,13 +2186,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				cnt = patch - insn_buf;
 			}
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2220,13 +2212,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			*patch++ = BPF_MOV64_IMM(insn->dst_reg, 0);
 
 			cnt = patch - insn_buf;
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2240,13 +2228,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				return -EFAULT;
 			}
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2293,13 +2277,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				*patch++ = BPF_ALU64_IMM(BPF_MUL, off_reg, -1);
 			cnt = patch - insn_buf;
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2336,13 +2316,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			cnt = may_goto_expand(insn_buf, insn->off, stack_off_cnt,
 					      tail, ARRAY_SIZE(tail));
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta += cnt - 1;
-			env->prog = prog = new_prog;
-			insn = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		} else if (bpf_is_may_goto_insn(insn)) {
 			int stack_off = -stack_depth - 8;
@@ -2355,13 +2331,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			cnt = may_goto_expand(insn_buf, insn->off, stack_off,
 					      tail, ARRAY_SIZE(tail));
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta += cnt - 1;
-			env->prog = prog = new_prog;
-			insn = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2392,13 +2364,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			cnt = 2;
 
 			i++;
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2413,13 +2381,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			if (cnt == 0)
 				goto next_insn;
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta	 += cnt - 1;
-			env->prog = prog = new_prog;
-			insn	  = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2500,13 +2464,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 								 map)->index_mask);
 			insn_buf[2] = *insn;
 			cnt = 3;
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2534,13 +2494,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[2] = *insn;
 			cnt = 3;
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto patch_call_imm;
 		}
 
@@ -2553,13 +2509,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[1] = *insn;
 			cnt = 2;
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta += cnt - 1;
-			env->prog = prog = new_prog;
-			insn = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto patch_call_imm;
 		}
 
@@ -2596,14 +2548,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				if (bpf_map_is_percpu_map(map_ptr->map_type))
 					prog->jit_required = true;
 
-				new_prog = bpf_patch_insn_data(env, i + delta,
-							       insn_buf, cnt);
-				if (!new_prog)
-					return -ENOMEM;
-
-				delta    += cnt - 1;
-				env->prog = prog = new_prog;
-				insn      = new_prog->insnsi + i + delta;
+				insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+				if (IS_ERR(insn))
+					return PTR_ERR(insn);
 				goto next_insn;
 			}
 
@@ -2679,14 +2626,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 						  BPF_REG_0, 0);
 			cnt = 3;
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf,
-						       cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2709,13 +2651,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[0] = BPF_ALU32_REG(BPF_XOR, BPF_REG_0, BPF_REG_0);
 			cnt = 1;
 #endif
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2728,13 +2666,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[2] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_0, 0);
 			cnt = 3;
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 #endif
@@ -2762,13 +2696,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[cnt++] = BPF_JMP_A(1);
 			insn_buf[cnt++] = BPF_MOV64_IMM(BPF_REG_0, -EINVAL);
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2794,13 +2724,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				cnt = 1;
 			}
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2820,13 +2746,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 				cnt = 2;
 			}
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2836,12 +2758,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			/* Load IP address from ctx - 16 */
 			insn_buf[0] = BPF_LDX_MEM(BPF_DW, BPF_REG_0, BPF_REG_1, -16);
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, 1);
-			if (!new_prog)
-				return -ENOMEM;
-
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, 1);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2891,13 +2810,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[10] = BPF_MOV64_IMM(BPF_REG_0, -ENOENT);
 			cnt = 11;
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 
@@ -2909,13 +2824,9 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			insn_buf[1] = BPF_ATOMIC_OP(BPF_DW, BPF_XCHG, BPF_REG_1, BPF_REG_0, 0);
 			cnt = 2;
 
-			new_prog = bpf_patch_insn_data(env, i + delta, insn_buf, cnt);
-			if (!new_prog)
-				return -ENOMEM;
-
-			delta    += cnt - 1;
-			env->prog = prog = new_prog;
-			insn      = new_prog->insnsi + i + delta;
+			insn = bpf_patch_list_add(env, i + delta, insn_buf, cnt);
+			if (IS_ERR(insn))
+				return PTR_ERR(insn);
 			goto next_insn;
 		}
 patch_call_imm:
@@ -2946,9 +2857,14 @@ int bpf_do_misc_fixups(struct bpf_verifier_env *env)
 			stack_depth_extra = 0;
 		}
 		i++;
-		insn++;
+		insn = &prog->insnsi[i + delta];
 	}
 
+	ret = bpf_patch_list_commit(env);
+	if (ret)
+		return ret;
+	prog = env->prog;
+
 	env->prog->aux->stack_depth = subprogs[0].stack_depth;
 	for (i = 0; i < env->subprog_cnt; i++) {
 		int delta = bpf_jit_supports_timed_may_goto() ? 2 : 1;

-- 
2.43.0

