Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3273624C8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135813; cv=none; b=ee9p26b3S9sTACJ9JnV6AGuislx4sCqaKnsDVT3xi/81X4sLXqQN7RkSXxg5/2N8QM93PGG7cCHxMydTOxJjiYi5NgEtfFYM6wNM4ak/RpNvSPQZ6x/vb75GF2E55du8vxxEy/MiW9d3mJ957TttNcaq5fiR0Vnx88rr9ExhneI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135813; c=relaxed/simple;
	bh=ZoHASPcgXPkyj8nhWq6Qxe/k1AFcC7iFexyU3IrpvR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l+6q9pYjNIH8aaLXpVJpBtA3FFEcngMSZ/W9zzT6aNVXY8/rxj7+TY2G76JL/BBkVg6hZqtHMf/xeksYIjh67KVU8SZphS3YNPgFeT2GwJoEgNNM2aHeOqaU2SxoAeVMcqvjYhSB0rKr77Fvk0zBZvCckv0btYv2pR0wyZiX670=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=QW7FHd+Y; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="QW7FHd+Y"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9399a1c21c1so89526285a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135808; x=1789740608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7VM45t8rF8CqlHWPsaSwdk7BD4ox5LDNpAeDrj6m5qM=;
        b=QW7FHd+YQu+cdbwUAwPHWl6S8SJLFgDyTumlkSiN1QY5ehnv0dCylT926iFmEqJpok
         32Qx9mxvXEMsm1hYeNmA5d/m7nCtpNiLceDs1HQEYHE9dhdYkjFCYdLZ/3YToNKP3H3n
         wbpxURtuKoxXDKvhUsCs894yOY2p9P2SeT7jZH8/5JflFVem6A++FLKgvEzGOmXB2BZf
         V3z9XclxwiteNQC2991FKaQQlmm/RsTxVriIVBe0DTKXlKaO1bERJnX0MLH2/CpVUYJX
         6+xcC3O4i4HysTWL0mdzZ/uR8/hnk/SpHCh8R3Sjw3O25/y9FG9K0NTTQjC201ow5QnU
         KLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135808; x=1789740608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VM45t8rF8CqlHWPsaSwdk7BD4ox5LDNpAeDrj6m5qM=;
        b=KKSSbs4ie7Uh6LoRqwtHzuOJboZb0uj28ksM2Cxbelo9hyydk9C+AkRd4UNcZtzkL2
         YTMcJmAW8L/znmaQDer0mk8m9Wcz9O4ihvjkiUdLQizdnOQxxw4rT6fn+TOJfKrVPzCi
         mM1zizfPwBNjTRiduUJ5gm4y5fb2ayQ2mV/BebA9kixpa9rEQWtmD4FjONuT5rqKNlPX
         +REb5oGDnCtKdUBaTB5DN22Q1wlhr5lQ6Z4ZZYkR7U2cTi42d4VjXhhqwKCKF8+ZFAJF
         t8qegGo545hgRDxdhhmZCJVcr3hnAtrZjfZhM1R6SetWQFSezUjlKYvUaTFp0m1gh9Tm
         nyWQ==
X-Forwarded-Encrypted: i=1; AKwUvByKI5Tvctp83npuhiK+ceGHr1/WBBNHX+vbMoz/2DZj8VU9gwdQauVN3bviPVGyH0Ba2c2Q7b2BcjIPewI=@vger.kernel.org
X-Gm-Message-State: AFuF++kHEgAloD5d4ZHT81nZmKJAIaO5JMdysqa/NJKqxBzqaBMmok1H
	pAcyGeRlG5P5mzwowqzh5BsMyHBBEBi2kVXr2pqQIp96nnJ7RK5grRdxnbEtvIyT20A=
X-Gm-Gg: AYBFou32002+ImkHjVWctr06Q49HQwNa0qQDelJ6CW8P9P3R/R4xCMD/SCr8HhOFUW4
	Kl+gXk2xp0L0IjHNKK9NRO+f6sShi6GcZx0//c2B9YVqcVDEPwmihdbfifedNJqWC7/4tkHgTsR
	eSEpSyGfiVaSqv0rhFG93zxZRUsLB3W0Rgf4B/sVJ/9Wta6DhvRjCLCxRZN8qrkU044sWgNp1eb
	Iwx2VlRnACntZ3GQTc+prPqLfKqSTFk0j71hlM0F0OiFO+Wn3tv3JPU4zLu97+MXgljOweKqP7n
	M/MW1qADmvi17i8PR/fZYi8c4VVcUWGDyEGgetHa/ODfLJeoU51GTLD7gTWel25J5Ox0fabFk3U
	6Z6pGAhp1QZRo5ulDt1+y52MwxqKcuXgLozPM8QRVcyAoLn8QNGE777xPZSCG8GGGZNXxuCiGZA
	7/FvNYG2/0u9F3zqG0A3SqCNOqAd8FTbyHFUu+SKmgn2zrre97wPONnNLzaX2VjjOcxKGoyq9os
	m8R23yyfCwmEj3PAqyF4eOY0VicyrIYj0WlHodudGfyJlIN6pd3l0aC
X-Received: by 2002:a05:620a:25c7:b0:939:bd4e:b2fe with SMTP id af79cd13be357-939ea2877e9mr555790285a.40.1789135808266;
        Fri, 11 Sep 2026 07:10:08 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f184d9sm254193785a.12.2026.09.11.07.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:10:05 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:46 +0000
Subject: [PATCH RFC v2 08/15] bpf, x86: Maintain Tasks RCU trampoline
 nesting in the BPF trampoline
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-8-eaaa61ed2da4@toxicpanda.com>
References: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
In-Reply-To: <20260911-b4-rcu-tasks-preempt-qs-v2-0-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=4464;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ZoHASPcgXPkyj8nhWq6Qxe/k1AFcC7iFexyU3IrpvR8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNGMQXlnJ9mLTB5EylkME94aCeeA53rjkqD+SHndTEJHVSfeCPYIUtSGAIP6GARv7tJy5dM1hBK
 jP1T+H+zt3A0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Emit an increment of current->rcu_tramp_nesting once the trampoline's
frame is set up and a decrement before the final register restore, so
that a task preempted while running fentry/fexit/fmod_ret/LSM programs
or the __bpf_tramp_enter()/__bpf_tramp_exit() glue is not treated as
Tasks-RCU quiescent.  Drop the count around the call to the original
function: that may run arbitrarily long without sleeping and must not pin
a Tasks RCU grace period, and the trampoline frame above it is held by
im->pcref rather than by Tasks RCU (see bpf_tramp_image_put()).  The
fmod_ret early-exit branch and the ip_after_call -> ip_epilogue poke both
skip the decrement/increment pair around the original call, so the count
stays balanced on every path.

The sequence is "mov r11, gs:[current_task]; inc/dec dword [r11 + off]";
r11 is scratch at every emission point and (u32)&current_task is a valid
sign-extended %gs-absolute with the current per-CPU layout, the same form
the JIT already uses for this_cpu_off.  The image is dynamically
allocated text, so the instructions outside the bracketed region are
covered by the irq-exit IP check.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/net/bpf_jit_comp.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
index 2853e87797a7..a375c1b7bd50 100644
--- a/arch/x86/net/bpf_jit_comp.c
+++ b/arch/x86/net/bpf_jit_comp.c
@@ -722,6 +722,31 @@ static void emit_indirect_jump(u8 **pprog, int bpf_reg, u8 *ip)
 	*pprog = prog;
 }
 
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().
+ *
+ *   mov r11, QWORD PTR gs:[current_task]
+ *   inc/dec DWORD PTR [r11 + offsetof(struct task_struct, rcu_tramp_nesting)]
+ *
+ * r11 (AUX_REG) is scratch in the trampoline at every point this is emitted.
+ */
+static void emit_rcu_tasks_tramp_nesting(u8 **pprog, bool enter)
+{
+#ifdef CONFIG_TASKS_RCU
+	u8 *prog = *pprog;
+
+	/* mov r11, gs:[abs32] */
+	EMIT2(0x65, 0x4C);
+	EMIT3(0x8B, 0x1C, 0x25);
+	EMIT((u32)(unsigned long)&current_task, 4);
+	/* inc/dec dword ptr [r11 + disp32] */
+	EMIT3(0x41, 0xFF, enter ? 0x83 : 0x8B);
+	EMIT(offsetof(struct task_struct, rcu_tramp_nesting), 4);
+
+	*pprog = prog;
+#endif
+}
+
 static void emit_return(u8 **pprog, u8 *ip)
 {
 	u8 *prog = *pprog;
@@ -3610,6 +3635,13 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	/* mov QWORD PTR [rbp - rbx_off], rbx */
 	emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_6, -rbx_off);
 
+	/*
+	 * From here until the matching decrement before the final return, a
+	 * preemption of this task is not a Tasks RCU quiescent state.  The
+	 * instructions above this point are covered by the irq-exit IP check.
+	 */
+	emit_rcu_tasks_tramp_nesting(&prog, true);
+
 	func_meta = nr_regs;
 	/* Store number of argument registers of the traced function */
 	emit_store_stack_imm64(&prog, BPF_REG_0, -func_meta_off, func_meta);
@@ -3670,6 +3702,13 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 			LOAD_TRAMP_TAIL_CALL_CNT_PTR(stack_size);
 		}
 
+		/*
+		 * The original function may run for a long time without
+		 * sleeping; do not let it pin a Tasks RCU grace period.  The
+		 * trampoline frame above it is held by im->pcref
+		 * (__bpf_tramp_enter()), not by Tasks RCU, across the call.
+		 */
+		emit_rcu_tasks_tramp_nesting(&prog, false);
 		if (flags & BPF_TRAMP_F_ORIG_STACK) {
 			emit_ldx(&prog, BPF_DW, BPF_REG_6, BPF_REG_FP, 8);
 			EMIT2(0xff, 0xd3); /* call *rbx */
@@ -3680,6 +3719,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 				goto cleanup;
 			}
 		}
+		emit_rcu_tasks_tramp_nesting(&prog, true);
 		/* remember return value in a stack for bpf prog to access */
 		emit_stx(&prog, BPF_DW, BPF_REG_FP, BPF_REG_0, -8);
 		im->ip_after_call = image + (prog - (u8 *)rw_image);
@@ -3741,6 +3781,9 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	if (save_ret)
 		emit_ldx(&prog, BPF_DW, BPF_REG_0, BPF_REG_FP, -8);
 
+	/* Remaining instructions are covered by the irq-exit IP check. */
+	emit_rcu_tasks_tramp_nesting(&prog, false);
+
 	emit_ldx(&prog, BPF_DW, BPF_REG_6, BPF_REG_FP, -rbx_off);
 
 	EMIT1(0xC9); /* leave */

-- 
2.55.0

