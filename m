Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8802158E2C2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066296; cv=none; b=s2zmKzpyy2EJuTUDlXmVQaCCoB298tM5cNd/Pbwauj4Ph3MHiiEla/eSHdZ1OPleiIsDvAhUsYIkKJjW8hAJA7x/tnGbA8OrVNccd+C7+ErHHjx7GSwZSjtYAk7KFlP+PuPcYB6HGdd8g266BmT9QvWy13NWt+afSqZpuRB6B+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066296; c=relaxed/simple;
	bh=xqTPn5S4ER1XAZhtIYfJFNG5V6jdP8hXJAwXIfHAJeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hb5soJ+bpznczlGWcDBB9rtPQO3f/WN8qtQbIOeAACsB9sPG2SXYlO4vH32kE9MXx9gSfM/DBaxnMhjx2FUUmecu77cUfHkYhAzE7RhW1BL+0C6wgRRWgskZOHRRbGDKpgRpGJBgHqxNeNvawVNBmWS1bP/JvVXGicp9XzEAmAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=J6E5A2Eo; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="J6E5A2Eo"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9399c77e2ebso11224185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066269; x=1789671069; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0Z6kl89L/mcJKSDFUzFWtYRNb/tGGuag8yv3GYWCr4=;
        b=J6E5A2Eol/vSbygkYzaBOBWc6SINX31T4X9/kiwA0kb6toYitLLpzKTDPOJafiRLca
         +6mPr5YkaGvxilOhAmXUj7q5e8lJX1WJscTCYfnu5kP65oInnhYSCYPfl1a+jM43HIbB
         gSmyH+qjQThuII3idNVTWHbOqiW0L61muEaRmtUtNtRGBWusO49tAhBVNk1Kp3EJsiwk
         BDu/0eHsCJEhlNqHkWe3xel3kTy8jW//+JhDUNtdRYzAQ6UI6fWd5JofuF5EGwcrfPaJ
         rcNskhVopMAjv0qTv2sHI4t/Ef+fzYJQaACy/cp7Eg8hIbAnwLAdTMuemvLpnVUsWT9F
         D8tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066269; x=1789671069;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0Z6kl89L/mcJKSDFUzFWtYRNb/tGGuag8yv3GYWCr4=;
        b=DTO8qCKZUkgto3xMOjMt8e3HJZbn7ljORmaZwGgh8KnEZpIs8fKwB5/K04jB2bCUKQ
         6P1H+imsuHs7XHt6Cf9vM/VDdQHSlbQkZZaOVx6eAadc7nvybO3M2vueooRtNzL2GRpk
         FRZbsQ/x9vjeONJjNGubDdRHaR/R9exWV52Lncwxs3BK9sMUwzdCLXLIdjUJ6b5Zpfat
         6pLX2DHwfjEMdtpo/uGPSTxN23vrACygd15M+Pd27j2kIfIbFtYPnABKeDcURwgPLbec
         akfsvjQcuknp6Gloq9ckRsLbRbf+V1iX6HUS834sBttQCGAoi1NNALrSVp1uSa33YDNt
         Z67A==
X-Forwarded-Encrypted: i=1; AKwUvBzA1kjfjiU3uG0aFhMm8taR96hyj20LRDgM7XhxyXllsdLBTPMfUud8Cs64HKhZpbQBwa6pVPpNGJfuQY8=@vger.kernel.org
X-Gm-Message-State: AFuF++lU7ZRiaVX2WlskYXcUjzG/3qTW7vd7Ye2cewhlHNzB2xQ2XZDt
	0N0eFL6tP3luDH1V7fwvH8pjthpkds4XJGsjIQj9gPGnal5J6pOItZBafXDvM68gmg0AUfRyJHw
	iPuQetAo=
X-Gm-Gg: AYBFou2XKvRlg5KwLabFZYTNF6TjpwB3vWFXmYU9Y7u6jSdG3oCRJ/5MN5OYsCJCPeL
	U+z564nBRYwkPpZxB1qEHZCxUpcFJBebKobySVYNmSqUXa6VtzNnRk11TJL5CIeDevpgcltT2/N
	abu4MRV4Cx/wywbxuPaiDzHG2iyi/AaEHxSEudJBRarlqq0anjQHoS37t75eNGvilsFx3m7Kj74
	WQ1fIzBdkKqQ8iLQ+iCg3uCLgNnso72yA+BCbjGMEfPJYMi77OxUkqmpIKam9vLotpMksJYhZSA
	tAs8bHLNAtmdVBCNhle4lVIgbB3v5fLQ5LW5rEGsC1oCJUms2EfTQivowpeMdCQkRA5rUQL6ooS
	YHEfXDsURdQkOcLyPTAc5DfZfol6Kvr3Jgr0nvbfkb0SvMQVSRpYc78L4ONUFl072GRwuslda9v
	TpYDKvCI8i7T2jLfZTYX83hTX0LDTEdXC6jUGpNTDX4Pu8DuDN1fdXYuozTHo0hoZy3rq1VblBW
	BukL6oURH8ZxVpQfdLqG0LTsatoWu8zw2u0bTpE/XAw1Lz/hKZkKJZTJ+jeEYg3aKk=
X-Received: by 2002:a05:620a:1a0a:b0:939:ca72:bef8 with SMTP id af79cd13be357-939d7fe4f58mr706492885a.41.1789066269332;
        Thu, 10 Sep 2026 11:51:09 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e7f1da12sm50063385a.9.2026.09.10.11.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:08 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:32 +0000
Subject: [PATCH RFC 09/13] arm64: ftrace: Maintain Tasks RCU trampoline
 nesting in ftrace_caller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-9-d4469f4cc101@toxicpanda.com>
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

Bracket the call out to the ftrace_ops callback in ftrace_caller with an
increment/decrement of current->rcu_tramp_nesting, using x12/w13 which
are scratch there.  The read-modify-write is not atomic, but only current
modifies the count and every interrupting user is balanced, so nothing is
lost.

ftrace_caller itself, including the early CALL_OPS direct path and the
late direct tail that carry a BPF trampoline address in x17 with the
count at zero, is static kernel text: add an ftrace_static_tramp_end
marker after ftrace_stub_direct_tramp and provide
arch_rcu_tasks_ip_in_trampoline() covering
[ftrace_caller, ftrace_static_tramp_end) so the irq-exit check treats a
task interrupted anywhere in it as inside a trampoline.

The hook is built only under CONFIG_RCU_TASKS_PREEMPT_QS, which arm64
does not select until a later patch.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/arm64/kernel/asm-offsets.c  |  3 +++
 arch/arm64/kernel/entry-ftrace.S | 35 +++++++++++++++++++++++++++++++++++
 arch/arm64/kernel/ftrace.c       | 16 ++++++++++++++++
 3 files changed, 54 insertions(+)

diff --git a/arch/arm64/kernel/asm-offsets.c b/arch/arm64/kernel/asm-offsets.c
index 9c853ed3ceab..f6655a284f18 100644
--- a/arch/arm64/kernel/asm-offsets.c
+++ b/arch/arm64/kernel/asm-offsets.c
@@ -39,6 +39,9 @@ int main(void)
   DEFINE(TSK_STACK,		offsetof(struct task_struct, stack));
 #ifdef CONFIG_STACKPROTECTOR
   DEFINE(TSK_STACK_CANARY,	offsetof(struct task_struct, stack_canary));
+#endif
+#ifdef CONFIG_TASKS_RCU
+  DEFINE(TSK_RCU_TRAMP_NESTING,	offsetof(struct task_struct, rcu_tramp_nesting));
 #endif
   BLANK();
   DEFINE(THREAD_CPU_CONTEXT,	offsetof(struct task_struct, thread.cpu_context));
diff --git a/arch/arm64/kernel/entry-ftrace.S b/arch/arm64/kernel/entry-ftrace.S
index 025140caafe7..46a102e7199a 100644
--- a/arch/arm64/kernel/entry-ftrace.S
+++ b/arch/arm64/kernel/entry-ftrace.S
@@ -14,6 +14,33 @@
 #include <asm/insn.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().  The whole
+ * of ftrace_caller is treated as trampoline text by the irq-exit IP check (see
+ * arch_rcu_tasks_ip_in_trampoline()), so these only need to bracket the call
+ * out to ops->func; everything before the increment and after the decrement,
+ * including the direct-call tails that carry a BPF trampoline address in x17,
+ * is covered by that.  The count is only modified by current and every nested
+ * user (interrupts) is balanced, so a plain ldr/add/str is sufficient.
+ */
+	.macro rcu_tasks_tramp_enter, tsk:req, tmp:req
+#ifdef CONFIG_TASKS_RCU
+	mrs	\tsk, sp_el0
+	ldr	\tmp, [\tsk, #TSK_RCU_TRAMP_NESTING]
+	add	\tmp, \tmp, #1
+	str	\tmp, [\tsk, #TSK_RCU_TRAMP_NESTING]
+#endif
+	.endm
+
+	.macro rcu_tasks_tramp_exit, tsk:req, tmp:req
+#ifdef CONFIG_TASKS_RCU
+	mrs	\tsk, sp_el0
+	ldr	\tmp, [\tsk, #TSK_RCU_TRAMP_NESTING]
+	sub	\tmp, \tmp, #1
+	str	\tmp, [\tsk, #TSK_RCU_TRAMP_NESTING]
+#endif
+	.endm
+
 /*
  * Due to -fpatchable-function-entry=2, the compiler has placed two NOPs before
  * the regular function prologue. For an enabled callsite, ftrace_init_nop() and
@@ -94,6 +121,8 @@ SYM_CODE_START(ftrace_caller)
 	stp	x29, x30, [sp, #FREGS_SIZE]
 	add	x29, sp, #FREGS_SIZE
 
+	rcu_tasks_tramp_enter x12, w13
+
 	/* Prepare arguments for the tracer func */
 	sub	x0, x30, #AARCH64_INSN_SIZE		// ip (callsite's BL insn)
 	mov	x1, x9					// parent_ip (callsite's LR)
@@ -111,6 +140,8 @@ SYM_INNER_LABEL(ftrace_call, SYM_L_GLOBAL)
 	bl      ftrace_stub				// func(ip, parent_ip, op, regs)
 #endif
 
+	rcu_tasks_tramp_exit x12, w13
+
 /*
  * At the callsite x0-x8 and x19-x30 were live. Any C code will have preserved
  * x19-x29 per the AAPCS, and we created frame records upon entry, so we need
@@ -178,6 +209,10 @@ SYM_CODE_START(ftrace_stub_direct_tramp)
 SYM_CODE_END(ftrace_stub_direct_tramp)
 #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */
 
+/* End of [ftrace_caller, ...) for arch_rcu_tasks_ip_in_trampoline(). */
+SYM_CODE_START(ftrace_static_tramp_end)
+SYM_CODE_END(ftrace_static_tramp_end)
+
 #else /* CONFIG_DYNAMIC_FTRACE_WITH_ARGS */
 
 /*
diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index e1a3c0b3a051..1b7ac2afed0d 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -17,6 +17,22 @@
 #include <asm/insn.h>
 #include <asm/text-patching.h>
 
+#ifdef CONFIG_RCU_TASKS_PREEMPT_QS
+extern void ftrace_static_tramp_end(void);
+
+/*
+ * See rcu_tasks_ip_in_trampoline().  ftrace_caller and ftrace_stub_direct_tramp
+ * are core kernel text but must be treated as trampolines: a task preempted in
+ * them may be carrying an ops pointer (x11) or a direct-call BPF trampoline
+ * address (x17) whose lifetime is guarded only by Tasks RCU.
+ */
+bool arch_rcu_tasks_ip_in_trampoline(unsigned long ip)
+{
+	return ip >= (unsigned long)ftrace_caller &&
+	       ip <  (unsigned long)ftrace_static_tramp_end;
+}
+#endif
+
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
 struct fregs_offset {
 	const char *name;

-- 
2.55.0

