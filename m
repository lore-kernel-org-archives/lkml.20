Received: from mta1.migadu.com (out-30.mta1.migadu.com [95.215.58.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A197452E06C
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869301; cv=none; b=Ei+824X+HMrndqd0gOgKiM20K6Ps3eI4bbYeQ7dFosTEyfOps+IaQjnj7UGlXZ2Yqs2aknN5f54pAxDL+kfFm3VHMDN5iPWRR4amYA3hTTbOtjejN282C9WaLQLSl5+RpwOmwf3C9x3/WqqHzHCcF0qOramlfeLGjJCgmOC8J1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869301; c=relaxed/simple;
	bh=S9MbpFYOyRT/9+KRnGcXzjKFgivK18Y9a7e4BZyewfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YedCP3vO416oPM9rtmTCzSWNWKgNKicg9X16d2kNYiCCKC9ARhi3Nyx5zpHYdnOMmrmZ2ImXzAMehmncuCNR3Tj9HA0VI3w41xpTkqnW4AhJxepnoiaBdx6X7vf5S1c1NYCZgEvm46TOsmcCm7szWyJ2ul6zwRqBQ4vSEWvCUe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RXmIkPuW; arc=none smtp.client-ip=95.215.58.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RXmIkPuW"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=S9MbpFYOyRT/9+KRnGcXzjKFgivK18Y9a7e4BZyewfE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790869295; v=1; x=1791474095;
 b=RXmIkPuWLMPEyFKRHcMJfalc83Xlh+uD4nnctwK/qwHr+pOj43GE7+68AGj2UXt5td7U+9Kp
 mfhqLie3SRaF1pxBh3omtjNcwPpmYlR6LuiPFBXoGzNMtc3j3hiZE37n+jTk3xh3EBteh7AK5LR
 u8VSFdMWhOXgIHP15o9U7nDI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 30b8e7bec69cf5c8;
	Thu, 01 Oct 2026 15:41:34 +0000
X-Mizu-Trace-ID: 30b8e7bec69cf5c8
X-Migadu-Flow: FLOW_OUT
From: KaFai Wan <kafai.wan@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: KaFai Wan <kafai.wan@linux.dev>
Subject: [PATCH bpf 1/1] bpf, riscv: Fix stack arguments of struct_ops trampolines
Date: Thu,  1 Oct 2026 23:40:38 +0800
Message-ID: <20261001154038.2265210-1-kafai.wan@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a struct_ops trampoline takes more than 8 arguments (up to 12), the
9th and beyond are passed on the stack. store_args() copies them into the
trampoline frame using a hard-coded FP + 16 base:

	emit_ld(RV_REG_T1, 16 + (i - RV_MAX_REG_ARGS) * 8, RV_REG_FP, ctx);

That offset only holds for fentry trampolines, where the traced function's
T0/FP are saved at FP - 8/FP - 16 and its stack arguments start at FP + 16.
A struct_ops trampoline is called directly, so its stack arguments start at
FP + 0 and store_args() reads the wrong words. BPF programs then see garbage
for arg9 and beyond, which fails the selftest:

  struct_ops_multi_args/test_trampoline_stack_args:FAIL

Pass the stack argument base offset to store_args(): 0 for struct_ops
trampolines, 16 otherwise.

Fixes: 6801b0aef79d ("riscv, bpf: Add 12-argument support for RV64 bpf trampoline")
Signed-off-by: KaFai Wan <kafai.wan@linux.dev>
---
 arch/riscv/net/bpf_jit_comp64.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 01fe66774f02..4ae6674f58ed 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -875,7 +875,7 @@ int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
 	return ret;
 }
 
-static void store_args(int nr_arg_slots, int args_off, struct rv_jit_context *ctx)
+static void store_args(int nr_arg_slots, int args_off, int stack_base, struct rv_jit_context *ctx)
 {
 	int i;
 
@@ -883,8 +883,7 @@ static void store_args(int nr_arg_slots, int args_off, struct rv_jit_context *ct
 		if (i < RV_MAX_REG_ARGS) {
 			emit_sd(RV_REG_FP, -args_off, RV_REG_A0 + i, ctx);
 		} else {
-			/* skip slots for T0 and FP of traced function */
-			emit_ld(RV_REG_T1, 16 + (i - RV_MAX_REG_ARGS) * 8, RV_REG_FP, ctx);
+			emit_ld(RV_REG_T1, stack_base + (i - RV_MAX_REG_ARGS) * 8, RV_REG_FP, ctx);
 			emit_sd(RV_REG_FP, -args_off, RV_REG_T1, ctx);
 		}
 		args_off -= 8;
@@ -1179,7 +1178,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	func_meta = nr_arg_slots;
 	emit_store_stack_imm64(RV_REG_T1, -func_meta_off, func_meta, ctx);
 
-	store_args(nr_arg_slots, args_off, ctx);
+	/* skip slots for T0 and FP of traced function */
+	store_args(nr_arg_slots, args_off, is_struct_ops ? 0 : 16, ctx);
 
 	if (bpf_fsession_cnt(tnodes)) {
 		/* clear all session cookies' value */
-- 
2.43.0

