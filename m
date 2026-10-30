Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361134;
	b=wNB1Lr8PkB9vl4u0FxYSAMjQ1DriO9ciDw8wfkXiCXaDaXisZHm1ArgHqz8GO5wv+9Xe
	 0kQevF73qetV1ltMw70qgo8tM9JYCd05exMyf/wve8RPd8LT0oHQ6qm7nORMAJUH4V0xm
	 R6vsbAP+Pit26+cykcWDBW6oXaXJ9elHBvg6llN08hlbTMyCBW2NUlYfi1/xESrfvV+k0
	 BcfL9Hm3o9u+ANYlL4SutfDyPMLFckEHqpTUwm9sKDB7U5jfXb5mX8bCrgoCrZEyJmPE/
	 cxQ38r0FdVyx3G9XIOLACV62Uy4uC9PBNtbFWMbFV6VHScASyQJf8+aT9R+7MVbjjdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361134;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9af/XKS3Oa6ntF0hzYP7heRTeTtoyKml5lxTgNvQCXA=;
	b=ItWSlE8PHdgdr46tBSh2Y5ivFInp52DPTWRAfZNTUT4FSEf920zbBRbJwI+gubc+/MEh
	 b7d15IIKmKkYsfv3t3fPfPThwkcwvGWDMyilijlqTFf4d7R4CcVgRSQ9g2BzehyQpbHoj
	 PnXpIye56J1PNzuaDbbZtgpFEKzrHzJjiMtLK1vHx5+2OQQDD4o3XTtLKFf72HUcTqUng
	 q0SQrDnKFTSQZNiD9kFJ3F/R8sn7PIUYQhNNElMIqRJ4+11DSsCo6OxnxyU1JPl74/5ss
	 4BzzTh0LyyNw/2d1FIylLZF8k5z+dKXxJbYSiq47yU5Z790Uat4JREeTMfjYt5sTDCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IclhGUs9;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51987606A329
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51987606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IclhGUs9
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15dd124bbe7so1030840c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361133; x=1793965933; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9af/XKS3Oa6ntF0hzYP7heRTeTtoyKml5lxTgNvQCXA=;
        b=IclhGUs9Lp7lwRKZN4zOJIgx1BipK2xX+DKVInSQ7zjLfKfriBQeF8tv885asTbRVM
         bG7BJfjXDEgDbqV2OoZ3Vp/DXZx3Mv1pdskfO1V/mSMKqlViObK1dcSk6zyPrPwsaGkP
         Y8JWaYkTDPuZV0Qs7LDrcG8EgNoSFY+R0ipKnTfywrTt+Ro4dTkb48YIfjHfDGFJ5tdk
         BVJ5Pd+sbn/zCoXKuTHz1+oRqFwpmQPArFCW1XGBmP0yZt8y7Dc0kYcMREWDVxs6HjSv
         FGoer1Ti+4QkzHNu0OiYbagx7CR3sOUnRMvdKNwxeIQwXFyvJX0vBJiMa8/n36gPgjge
         4j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361133; x=1793965933;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9af/XKS3Oa6ntF0hzYP7heRTeTtoyKml5lxTgNvQCXA=;
        b=l7ZYI/CmO9ii09EN+enuZxPcGLRmL0+OUOyQFpMU2qf6zzr0Y8hei0I8dCjFp7rZSH
         ux5grw9Hs8LiiblaCelDesmU5m6EfQDMyPcpFHCxkoLq6czLzQhxYu39mK0jOiGb+hb/
         G6xC6yWjUjMpD+V23v0m4WHVLIaa1heV9KD8GJ3DmN9K7N2YJ8IjE70591D6d1SDhe24
         3VulUiGgpAWJBs6Nm401qJXp2Lg8lIprjAI2HXTq6Vm1gC18j2jriQpadDUvrwqFcztZ
         wkxALIyFs2Qs3TUPDYJrfT+2aK20YL2SO1vN/lHDsZBkGnkv28bIDQ9afiuaneuLIvDS
         pHaQ==
X-Forwarded-Encrypted: i=1; AKwUvByhg9aN+MCyLatohkPoJnzbnSj5ZxJkwCSFBC54GGRWAYf0zm77EDy8wUzQT2uYNV/SyZL4Y8zv/AvCxZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmMAUNYi87VBhfSs/QmSdeArz4YrY3TiNPTsbMHLA6R609v15W
	Zuq5duvjHZiXOlVTVj6sxElfFDMUpBBwqULBMP8bo+jDBXq9gIyxYU7TEUuybn3F
X-Gm-Gg: AYBFou0vcfQVCYvhQBanGFMH72NLY9vbLVpzjlxGgBGvEHwk9Wtplh7Np1HVU0JQs2m
	GXI9ET/msRAg1thyweYg/mjYV0TX0VTu7cq3QAh7zscjwnGmcsN1Qp3bqKAYYDYElclq7a2ZL7e
	3ymEoPCuv+/gx5J8TEKSt+bXXKKFag79vVwoBgMwzG0lHRtNCsHgyDsyZ1wLG4usPMqKaTc5FZU
	5/9kHsEg+a3+gw8rK7L1gZ4UGsgjp1sBrLxQ69SxZw04AZOr4loreE2mIRZ/hI/3CySmzpc+3zc
	BA9vvMpMG7STiMtV5pbIAtxfSYaLxRvyk6zzEuGfbvepThIZW1U+lAG2Io8ga6RUj1jSGf/6pgZ
	cMIifm81en0hqKhIEDUiveD48v3/rBaFh57bPBFcshFDi0Kj4q7GFfNVXCjvjpCMIgcGj7VqMUM
	RNYp5gyhAmUcRUHLCO9Zu37fIjxGQGA7GjeHnk9Vmk68d6sCqZaSl6CUqqM5X2Gdmni9HW8rtdo
	k858cKPPGgOASd9qwxaqp6q/2ERuh/1Irj8zpu/E9Tox0pgz0hu6laqNqxtvSOipUE6KA/tHJAc
	5JwgUzqO/VTRguhyOA5WDB2U
X-Received: by 2002:a05:701b:4784:b0:165:4b88:abc2 with SMTP id a92af1059eb24-1ac5b5ee632mr3868276c88.26.1793361133396;
        Fri, 30 Oct 2026 04:52:13 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:52:12 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:48 -0400
Subject: [PATCH bpf-next v2 03/22] bpf: Apply single-instruction patches of
 the verifier in place
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-3-55cd43439f7c@gmail.com>
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

bpf_patch_insn_data() replaces one instruction by one in place, and
only sets non_stack_access of its aux data from whether the new
instruction accesses memory.

bpf_patch_list_add() queues such a patch like any other, although it
moves nothing, and the commit fills in its aux data the way it does
for a longer patch, which keeps non_stack_access of the old
instruction where bpf_patch_insn_data() recomputes it.

Write a patch of a single instruction to the program right away and
adjust its aux data with adjust_insn_aux_data(), as
bpf_patch_insn_data() does.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 0697f66b1ffc1..a0dd582312d86 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -382,7 +382,8 @@ struct bpf_prog *bpf_patch_insn_data(struct bpf_verifier_env *env, u32 off,
 
 /*
  * Queue the replacement of insn 'off' by 'patch[0..len)' until
- * bpf_patch_list_commit(), see __bpf_patch_list_add().
+ * bpf_patch_list_commit(), see __bpf_patch_list_add(). Replacing one insn by
+ * one moves nothing and is done right away.
  */
 struct bpf_insn *bpf_patch_list_add(struct bpf_verifier_env *env, u32 off,
 				    const struct bpf_insn *patch, u32 len)
@@ -397,6 +398,13 @@ struct bpf_insn *bpf_patch_list_add(struct bpf_verifier_env *env, u32 off,
 			    env, "insn %u patched out of order", off))
 		return ERR_PTR(-EFAULT);
 
+	if (len == 1) {
+		env->prog->insnsi[off] = *patch;
+		adjust_insn_aux_data(env, env->prog, off, 1, NULL,
+				     BPF_PATCH_KEEP_TARGET);
+		return &env->prog->insnsi[off];
+	}
+
 	return __bpf_patch_list_add(pl, env->prog, off, patch, len);
 }
 

-- 
2.43.0

