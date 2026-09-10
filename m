Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2B5947ED
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066295; cv=none; b=e4s0r/2vQ1298zADqDVyf45NiVqtd5b/qIIJcffoW6RAb1X8zRbozFiS0A4u44xhEpolFsmWmEma06LXuqVXGQiZKvmwglCEQb7/FaxSebUKGGDU77iTTlWhxslyNTt1JmBfw8zO7hDkbn/trFhw7P2vn8jeN5/ETlbmtZ6f8Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066295; c=relaxed/simple;
	bh=MVjrbMDjnAqQ8aHx7Jc4sWMH68fI2crdoTABU++vCCI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EuqqID5/oVfdpQOdIzwxXNsWAVScojyTW//LfWSJMN3u/I3PSJywYncV/vWcmbwVqU/JlYsSeHjfez3uJREh/egcXXwmux2MDuLis5gALomDm4ctaYQaOGKE9TIVdunsEyfg96QhZ8d+JHOiB1SVOuf7v32CvHTYn+lr7KUFV5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=lTLFN18l; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="lTLFN18l"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9103228ef53so374066d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066271; x=1789671071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b8kkjvSg0tb+ScPvKP3GAz1Pld5wxO+feqfkbC4jq4=;
        b=lTLFN18ldHl/eT7ZbJgNnxKk/9vpqRJhbnbIB7+WpDKoosEN6MeDeB+GU8Y4jo1OO+
         b3zFnD6NK7zc6MVgMFgzvWJBWEFH0PcO/yCBfznuliopNsd1+pkT0bXwGiTjnhDQFbak
         O8ivd4Tz9/M7YCUKqtqBh3A6HhFqiian1j7caPa7KfEpME9ZK8ctC29XeVt+aYBvOcU+
         PE/ZhDHfXD3Pg9PQ1t8+LmDuDx8GXQFTwQE0TLrA/NtyZYuSUj+F9p1JzBl/Q9+aVfl3
         C4l90dBwYbjZsvqyGgJwV6h7P9gZ2L06XxO/p7vyN0iEBj0VIUF17pylTHxY3Q1R5soU
         pK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066271; x=1789671071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9b8kkjvSg0tb+ScPvKP3GAz1Pld5wxO+feqfkbC4jq4=;
        b=DwPC4gGQlLfYYwM3apNaUBzP/HtKfyQVsXdsBbqTEajvgMvpUvqnqoXnWjJhU+jNcn
         y6K0xbN3Yh02zqID0OiHcR99UcuWVXoGS+T8h2QrkhMYu3tA7G3mE2YZiUZ5DL34VLyg
         roQ0zN7nnVbxpKjPdAuGSxhuDScR67Pz4rZ9ocgfKhQgUEFkMvIb08twJOwWQt7sBSAW
         wlUp1BKY4sbccVQyhZ6LhR/Hw97FcufcFxDP02KxykpeotXiosFwvc2nkAlJFBVqSJPB
         3nZbe1EuCM+S6nEriNNhpN8sYIn/LWaRMpFapXiSnOIUBWY9rUf/nAL04RvqcIL/xrjD
         uoQw==
X-Forwarded-Encrypted: i=1; AKwUvBwee6g9lROUkNzt+5nMnnviihrlrFEQjEXdTeDz7yuR4AN6l/Sl+WCPx9wZR7UQW8IHqOWJVWtGZ0DKLi4=@vger.kernel.org
X-Gm-Message-State: AFuF++kC65dQLNfczQqEg5TJL9IvE/UrUgE5wuLPSRjT87j9lt9EEk3U
	HxxJIpOWJrO5PktL58JU3pa5/820xG+MAFyvGL6XG4c2PvJxfk75bATQEWJOOyzhaYU=
X-Gm-Gg: AYBFou1lT7TmMsc2ennPbX2/3qlVTH/JQTO++RmyqvvQihe1tldcFPcFPxNSfR9kdeh
	3iwrkU7FdRxrJlNxBtpt24UT7vNDO99RJejP1w5H3WzCl3xJgfbeowFJfTjQnZp+Z05k09yhDb2
	gjfht6aHwp11rUr8EkOHHiFa/524ndhAE6cAxoPFHVMwxZ9vfIUqgQSe01Lkwqjg115r0bMwDeB
	abxhtshJv9BfAnfPDv3Vf2w3tN7dLd5YeG6IC/IA2lOtvT2G2gt1PgdxL378YJ7pNPKSj/p7Nby
	iwKpdh0efFRuMdXQCZEk0kcTl7+0HmjQNBYzPUHyvOXZ0JQ1Wr+e7jTD6HBS6btVCRstufGxU93
	UucaA/F704XJ12gxIlkghL25Xqq1xrbkIRGL9PgxRRvV0BaIlODMd5kUBmulQfO0VH64bep9f51
	uFqgInTwnByr54qNdiUiy4tifsWeTvJx8k0Mi3Aw0MhemJr9GvvgmLbbZcVmDRMOFPDUVZ1kZmW
	wzHeIH+z8Ujd5YBZNAVUi8vsdq76WYHPAwt/SdtdlKnvs4MNoFHkOmA
X-Received: by 2002:a05:6214:5544:b0:910:52ab:59dc with SMTP id 6a1803df08f44-912120e2526mr945166d6.23.1789066271231;
        Thu, 10 Sep 2026 11:51:11 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f49444bsm2501436d6.29.2026.09.10.11.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:10 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:33 +0000
Subject: [PATCH RFC 10/13] bpf, arm64: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-10-d4469f4cc101@toxicpanda.com>
References: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
In-Reply-To: <20260910-b4-rcu-tasks-preempt-qs-v1-0-d4469f4cc101@toxicpanda.com>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Boqun Feng <boqun@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2

Same scheme as x86: emit "mrs x10, sp_el0; ldr/add|sub/str w11" to bump
current->rcu_tramp_nesting after the callee-saved registers are stored
and to drop it before they are restored, and release it around the call
to the original function, which im->pcref protects and which must not
pin a Tasks RCU grace period.  x10/x11 are scratch at every emission
point; the fmod_ret cbnz target lies after the decrement/increment pair
around the original call, and the ip_after_call nop follows the
re-increment, so the count is balanced on every path.  BUILD_BUG_ON
guards the LDR/STR immediate range for the task_struct offset.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/arm64/net/bpf_jit_comp.c | 46 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index c18e005a41db..5c9a7bde5cc9 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -2591,6 +2591,34 @@ static void emit_arena_arg_conv(struct jit_ctx *ctx, u8 dst, u8 src, bool nullab
 	emit(A64_SUB(0, dst, src, base_lo), ctx);
 }
 
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().
+ *
+ *   mrs  x10, sp_el0
+ *   ldr  w11, [x10, #offsetof(struct task_struct, rcu_tramp_nesting)]
+ *   add/sub w11, w11, #1
+ *   str  w11, [x10, #...]
+ *
+ * x10/x11 are scratch in the trampoline at every point this is emitted.
+ */
+static void emit_rcu_tasks_tramp_nesting(struct jit_ctx *ctx, bool enter)
+{
+#ifdef CONFIG_TASKS_RCU
+	const int off = offsetof(struct task_struct, rcu_tramp_nesting);
+	const u8 tsk = A64_R(10), cnt = A64_R(11);
+
+	BUILD_BUG_ON(off & 3 || off >= SZ_16K);	/* LDR/STR (imm12, scaled) */
+
+	emit(A64_MRS_SP_EL0(tsk), ctx);
+	emit(A64_LDR32I(cnt, tsk, off), ctx);
+	if (enter)
+		emit(A64_ADD_I(0, cnt, cnt, 1), ctx);
+	else
+		emit(A64_SUB_I(0, cnt, cnt, 1), ctx);
+	emit(A64_STR32I(cnt, tsk, off), ctx);
+#endif
+}
+
 static void save_args(struct jit_ctx *ctx, int bargs_off, int oargs_off,
 		      const struct btf_func_model *m, const struct arg_aux *a,
 		      bool for_call_origin, bool is_struct_ops, u64 arena_base)
@@ -2854,6 +2882,13 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	emit(A64_STR64I(A64_R(19), A64_SP, regs_off), ctx);
 	emit(A64_STR64I(A64_R(20), A64_SP, regs_off + 8), ctx);
 
+	/*
+	 * From here until the matching decrement in the epilogue, a preemption
+	 * of this task is not a Tasks RCU quiescent state.  The instructions
+	 * above this point are covered by the irq-exit IP check.
+	 */
+	emit_rcu_tasks_tramp_nesting(ctx, true);
+
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		/* for the first pass, assume the worst case */
 		if (!ctx->image)
@@ -2898,12 +2933,20 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	if (flags & BPF_TRAMP_F_CALL_ORIG) {
 		/* the original func takes kernel addresses, never converted ones */
 		save_args(ctx, bargs_off, oargs_off, m, a, true, is_struct_ops, 0);
+		/*
+		 * The original function may run for a long time without
+		 * sleeping; do not let it pin a Tasks RCU grace period.  The
+		 * trampoline frame above it is held by im->pcref
+		 * (__bpf_tramp_enter()), not by Tasks RCU, across the call.
+		 */
+		emit_rcu_tasks_tramp_nesting(ctx, false);
 		/* call original func */
 		emit(A64_LDR64I(A64_R(10), A64_SP, retaddr_off), ctx);
 		emit(A64_ADR(A64_LR, AARCH64_INSN_SIZE * 2), ctx);
 		emit(A64_RET(A64_R(10)), ctx);
 		/* store return value */
 		emit(A64_STR64I(A64_R(0), A64_SP, retval_off), ctx);
+		emit_rcu_tasks_tramp_nesting(ctx, true);
 		/* reserve a nop for bpf_tramp_image_put */
 		im->ip_after_call = ctx->ro_image + ctx->idx;
 		emit(A64_NOP, ctx);
@@ -2945,6 +2988,9 @@ static int prepare_trampoline(struct jit_ctx *ctx, struct bpf_tramp_image *im,
 	if (flags & BPF_TRAMP_F_RESTORE_REGS)
 		restore_args(ctx, bargs_off, a->regs_for_args);
 
+	/* Remaining instructions are covered by the irq-exit IP check. */
+	emit_rcu_tasks_tramp_nesting(ctx, false);
+
 	/* restore callee saved register x19 and x20 */
 	emit(A64_LDR64I(A64_R(19), A64_SP, regs_off), ctx);
 	emit(A64_LDR64I(A64_R(20), A64_SP, regs_off + 8), ctx);

-- 
2.55.0

