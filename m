Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793361181;
	b=So9VPlsiVi+6RgXAnfsaUGdbGWi9G8dlfgvpW5m1QMO96m6sLMJoyXxq4ne7OwAAQE+j
	 HGCboAFNXozvpRMYseDi8NRs7WiHXlLkT6X13Bot7fdlRhEDz+ZapWgqgnDpL2T56sevY
	 bFr/pB9oLpFYkjxGqLi/Sux4wvd8ydjjddWXS9eEK3cvJTP/SsbucCcg3bRlPml3RRFQS
	 zM/0cvfwCZmyDK6MjiG97YuMvqcoHdEE/6XcLLAofKqne4heTT1wINGx1itaI/7AJGgk2
	 hjkphPDrXyLU0JkhE5Iym1Yi0zII7CNNe9/MBhjOqTkmLiSrXlFFtuKrp9Lms94HLEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ZkE/ZDnHJgQvDf1Bb845QvHopDXrBigTya+KCrllSPg=;
	b=hiuagfffUAV3EcAo6yNe9JFbuO/GPEJBVMqIFSMa5IUtbkR3oLhhPDwFLVwjONFHuFRk
	 JPZ4qhXd+Tzp8gyWVykqyxBD3aC0/jfVV+JB6Cw/Ml2XXwsPzNmw4gd/njWrqoQzwIMZn
	 UW50YmwNJb+4NZ/5PM3DiHmKBKWFNSTXD6W59S1GCcNuIYLguHyVzY26X4SlpliNH2z3x
	 cJyLb+pNnL9bnKg9VaXEvKBZIHf5di1cqTrThmoFp5GrlycuufWj/xyTYmZY/0Y9R6vtK
	 AHs1TqQo3SzpZXRp5yhkjygq1nTk2k4+GYII9hVLapQ5/0QdQA7sf5gmLKRT8S6KWsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zkOcpsA/";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDDF606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DDDF606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zkOcpsA/
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-181516de561so550580c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361179; x=1793965979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZkE/ZDnHJgQvDf1Bb845QvHopDXrBigTya+KCrllSPg=;
        b=zkOcpsA/04GOKmvzKQVCzg3hDr/g1PrBlMfvjOr2x5lnoJuyuYYNBPwm6cCyXxGKdk
         xkxciLBFbZ5vI15u6DanzCgdDl6cPOFMymISFdXHGGih8R7J1OmudBa4GiyRicMWGQBn
         LUV/lfKc+qgpvnBkkBmD7Gia1f2civfQVRTZK9Tv6e6xtKu/Ue3r6aKRtSwncKqd4Hn4
         SCnLDWM2wPviSuAu43DorU3D+4kGa4lqsUnxRz4Tjce1A9+JKonMUF/4QvlCayhFOG+e
         5AFlsoDvU7HPCIsAXJYw/doz6Plhzqq/XIYXQGu+uxQEe+KmR1lEqEwVAI4UJT6GUIud
         SQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361179; x=1793965979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZkE/ZDnHJgQvDf1Bb845QvHopDXrBigTya+KCrllSPg=;
        b=zniKZEs/mF8Asx1UYYuNdToQ3lNvppElwBPD8TtwmKPo055sT/YZfh61ox4Nh0uq5G
         3dNLVi/w262P46Q9T+WgR7rPQ2M1avVEzypRiq6AfMCp8P8mtQsNS5I/4kIzzuqUEHUl
         q77R4hdN8ZaJ3pDymEVLlkwh5oDynHDT8GCcD4ztkccYRbPO+i6/1RDTM5TSrAD8UTj3
         2Xxob7ZawqTTD7npprL24l+y/mAYEm4XCt5iaIvjMRykS5XIQajWvsr1wvvIl9dzqGNK
         rqkU/Ijr6082kmFAsjvVKnG2b3d5S8d7p2fC1ewIg+W6ES5hzkjtufI7OUsHddfJHmil
         8o+A==
X-Forwarded-Encrypted: i=1; AKwUvBwPU1O1WiuGP4achuhHFsgCjHwgbZdKvbH3VVq01mYQ3hQDZYlpcXY4SC+dgANHVInabyCJzCrHiX7WRns=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsXgc5GgUyw6WKkDCHJNoch15MallHVrrYXbBNeIQuCgiAnjfl
	GJRWJ76p7nnTsKlIizH0eEpfO4+9CF6P/aQz+x4yfgJK1rWjtl/eTO6fOojVT88w
X-Gm-Gg: AYBFou3aqPj0lTxTb/x57yT2oll8tZJP7kB3c3k5n2Eo61uRV4LY9kWI9ehmLcwblsv
	ZAliO8a6eGNXGvvc5SSRuXWXOvani7q8jTkcXr+eBqEsYM+c2m5h39K9Nz7eSZZ3LU2LU2g12oB
	bTcup04wJInRJc0ERWHQQwqHMXUolMWLBIcUXQjMC6Bc4LLVWpvc7R7nqszJUdDkfiEo0xk6ofi
	oN/iuPXaY6aeFT69nzOUJpPYx3QPdO+wuDQDi9SgRv16YoRG10H3hZDEYmN2+B68o0+q8bwgxQn
	utp343t4h4M1kQfoPpoUHssHkhQuyJAJ0OB2R9b2SUAFMSL+7n2dHAzJ13IUv4O+CiZED4myGSs
	U3M/VoNfAfyhVCUB3PtGhTOXhlhIIJ/Y1Qlfyb8p9UbI6QLvePTgSa6r7JvWAITgMx1jJfSmqBQ
	kKn+dWWtJrjPffPNr+gi9CYJmImaLD/2firzqDXG3qDNp/3SqQkGP2beBAm4qXghbpe6xNcjSeQ
	bsKhW41XIWwu6j/kVmVWXAptFRVYYi4XFUD1LDoCgriPXca4eY4dhhgPTIVR2AIVq/tn6MZTWPq
	Ddotkuea8Bpl4J/xGj9dJmIp
X-Received: by 2002:a05:701b:4586:20b0:1ab:9742:e028 with SMTP id a92af1059eb24-1ac55960b4bmr2589820c88.3.1793361179476;
        Fri, 30 Oct 2026 04:52:59 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcd6f1sm6437304c88.20.2026.10.30.04.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:52:59 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 30 Oct 2026 07:51:55 -0400
Subject: [PATCH bpf-next v2 10/22] bpf: Batch the patches of
 bpf_opt_subreg_zext_lo32_rnd_hi32()
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
Message-Id: <20261030-bpf-verifier-patch-batch-v2-10-55cd43439f7c@gmail.com>
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

bpf_opt_subreg_zext_lo32_rnd_hi32() inserts a zero extension, or with
BPF_F_TEST_RND_HI32 a randomization of the upper half, after every
instruction that needs it, one bpf_patch_insn_data() at a time.

Each of them costs O(prog->len). Loading pyperf180 with
BPF_F_TEST_RND_HI32 does 4610 of them, which takes more than twice as
long as loading it without.

Queue them with bpf_patch_list_add() and commit them at the end of the
pass.

perf stat -r10 of loading with BPF_F_TEST_RND_HI32, average of two
runs, x86_64 VM with 32 vCPUs, before and after this patch:

              before     after
  pyperf180   1.507 s    0.359 s
  pyperf600   4.533 s    0.899 s

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 kernel/bpf/fixups.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/kernel/bpf/fixups.c b/kernel/bpf/fixups.c
index 7c7c38eb9f0c2..6c2dce8f3b6eb 100644
--- a/kernel/bpf/fixups.c
+++ b/kernel/bpf/fixups.c
@@ -922,9 +922,8 @@ int bpf_opt_subreg_zext_lo32_rnd_hi32(struct bpf_verifier_env *env,
 	struct bpf_insn *zext_patch = env->insn_buf;
 	struct bpf_insn *rnd_hi32_patch = &env->insn_buf[2];
 	struct bpf_insn_aux_data *aux = env->insn_aux_data;
-	int i, patch_len, delta = 0, len = env->prog->len;
+	int i, patch_len, len = env->prog->len;
 	struct bpf_insn *insns = env->prog->insnsi;
-	struct bpf_prog *new_prog;
 	bool rnd_hi32;
 
 	rnd_hi32 = attr->prog_flags & BPF_F_TEST_RND_HI32;
@@ -933,13 +932,12 @@ int bpf_opt_subreg_zext_lo32_rnd_hi32(struct bpf_verifier_env *env,
 	rnd_hi32_patch[2] = BPF_ALU64_IMM(BPF_LSH, BPF_REG_AX, 32);
 	rnd_hi32_patch[3] = BPF_ALU64_REG(BPF_OR, 0, BPF_REG_AX);
 	for (i = 0; i < len; i++) {
-		int adj_idx = i + delta;
 		struct bpf_insn insn;
 		int load_reg;
 
-		insn = insns[adj_idx];
+		insn = insns[i];
 		load_reg = insn_def_regno(&insn);
-		if (!aux[adj_idx].zext_dst) {
+		if (!aux[i].zext_dst) {
 			u8 code, class;
 			u32 imm_rnd;
 
@@ -960,7 +958,7 @@ int bpf_opt_subreg_zext_lo32_rnd_hi32(struct bpf_verifier_env *env,
 
 			/* ctx load could be transformed into wider load. */
 			if (class == BPF_LDX &&
-			    aux[adj_idx].ptr_type == PTR_TO_CTX)
+			    aux[i].ptr_type == PTR_TO_CTX)
 				continue;
 
 			imm_rnd = get_random_u32();
@@ -999,16 +997,12 @@ int bpf_opt_subreg_zext_lo32_rnd_hi32(struct bpf_verifier_env *env,
 		patch = zext_patch;
 		patch_len = 2;
 apply_patch_buffer:
-		new_prog = bpf_patch_insn_data(env, adj_idx, patch, patch_len);
-		if (!new_prog)
-			return -ENOMEM;
-		env->prog = new_prog;
-		insns = new_prog->insnsi;
-		aux = env->insn_aux_data;
-		delta += patch_len - 1;
+		patch = bpf_patch_list_add(env, i, patch, patch_len);
+		if (IS_ERR(patch))
+			return PTR_ERR(patch);
 	}
 
-	return 0;
+	return bpf_patch_list_commit(env);
 }
 
 /*

-- 
2.43.0

