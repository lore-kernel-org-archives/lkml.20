Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F0C35AC34
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066284; cv=none; b=B30SVXsVIVEjSWc9Hpn0sWeunvlDladd+hjNGlbl8FoR4FArPzRjTIG80V2WC87VipQRTQDq5cjOAuSIr4Dn4pQGfJMDmwv61bhEQa9iYbZr8GKVzLVe33H+dHtCSa4GKaENZOIaGfMeSvmtqlq5tE4PrHLD/KW8BWLDMU+tqes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066284; c=relaxed/simple;
	bh=8cFDFeD2IXPN8Vlj1EymtW9Bi32PSZwsbXS468MRSTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s9+ZHlEd9/ZN47b0Ky95K8ji2jzul60uf6Z26FgALS0Egk7qmyPE/CD4Rw8Zzg75lJ0kZcymxIilAQf8wrUJ5ZPBwpxd7jS0ZzHbXU/4EfV2aVec0nHysq+ElquXw+vQ5U31hUiafHS8G20qHOn/MjaFi5TLLJ63BnJ+DKISqcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=P4yoQ+mO; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="P4yoQ+mO"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-53016020b2fso1772431cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789066267; x=1789671067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hbVlQmHCpb9zv+5BDFsE+SK081jwlXFhk4tZhnaWY5k=;
        b=P4yoQ+mOM4WUgBz9RADqBb404TunTklUBQ5AA9f11bVMHualuNKPRLtCOEtWC+e5in
         plReejw9msm5E59hkMfnBzgUksGKvliqi/JRHAJ3G+v2C3UP7S4R69h0KlJmznFG+8+S
         DGHZNnSgvHbjPjrIkqNSVrAUndW4qJl8PSkGe7guaopCJzQqxNAwI5qEg6UnK1N803M4
         boOa1klgsemeZGF6GHo1Fpxx/HcEhm253pFxlvbPmsNon6+t5CbXZ/DasMOIoJ+BwAfH
         rCFxlmfVc6RpAZv507EUKj3DQ4Jnj2+94prQC+Duu4Ka9hPC0dmRKmF7qp6AYdjSAkIk
         efRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066267; x=1789671067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hbVlQmHCpb9zv+5BDFsE+SK081jwlXFhk4tZhnaWY5k=;
        b=HnRrFbVWRezJqVf4D0avbwzPj/5qHOkHIGhS7ILc10Yv8rIBro2Y11KB0o7nu8sZuN
         e8j+/QLSzslMd8XbVpPHkoO2ncS/DsVzo7D1PnCIJ//9gBWwTMwJG9MFF5zQPcebtUv6
         gGFUKkOvGSJO6h4au2LfKwNhRMq0eyULZ8kdXPiA+TTAfQPv3SzR71Xp4AE+9Y6EHPzd
         EDgmFyWHPKjzh5ZRgdq6NTI+Zbw2qSo1WjNc+AjwPGK7q5b66CyWYq+JIscn/1ey/JfR
         hFIvwmEeoxtsoONHHqR9w9Q/LxRojdcAqNYd2RJgNLiyCsQnx82YhSuSxC39gdOqZQ//
         CAsA==
X-Forwarded-Encrypted: i=1; AKwUvByQHJ7voAtZU6Z/PY/LleQfIYnBT26B/5UHtZvgkVIbWcOohxruOyP77thjL5V4JW33vF5P0pd83IZzw3E=@vger.kernel.org
X-Gm-Message-State: AFuF++nymPRW1DbUHsKULYgu0w4Ajolco7Xfyq3z3S5064KZXa4KcDta
	uPD9YcPrP4+SYMfS4BeV0tj5jhytY6wdQ4Px56xEG4LhK68dA2d0rMK4aa8WtNTmQEo=
X-Gm-Gg: AYBFou197rMahnno7Hh4TVrJM2iZ1Hmn3bfuXzLwxS5HLHsxV4BXhWch+AoIzgo0xwJ
	OPlVfm0v6heWPRUAZjYoudWgIAMDfG1lJAWIIaEpBLF/xnz/jpBaiPvBH1KDFAab1fgM5k9KUZx
	FEzQ+DAG6EW/Fy0lyD1T/dLe3dtKleCpxEQNmXE4BIKSA/wUYSjD3IuIleE2ouYpUHXlKwOXyXb
	ZHqSuGuPvsTs218LeSFvJoIgeCQm9zpzsnFvGeNXmt0QPLK9ggxu6ZWQjnF6b0Ze+Vry9S/Dqmx
	6WAbkHdj6qjG0hs87XrA1F2vsFMdf1L9QxkT4H6Nzc8P897MBMMT2q+qvmTdhcY35otBadKggzM
	2O6a+dxm4CuLJGU+qQuur1ftQbBX2NPWDrbx1YkswZ/sNx3tJ5/j4peJabGxTefi+5XtH6WPDar
	5lv6iuxetgpmBd7DEwnbwgGMhDbkljSYqz+3T54fVPgAyQm5S/Nsq/RPgpJudAfquyTT4HT7FZD
	cKz31ttDQ6OHzNczlHacaxu7K8Zdxh6U0aMjv7xK9hOFQz4H4DR47FS
X-Received: by 2002:a05:622a:1309:b0:530:42e4:effc with SMTP id d75a77b69052e-530c87566f0mr10949261cf.41.1789066264886;
        Thu, 10 Sep 2026 11:51:04 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca47efa2sm216291cf.11.2026.09.10.11.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:51:04 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 10 Sep 2026 18:50:30 +0000
Subject: [PATCH RFC 07/13] x86/kprobes: Maintain Tasks RCU trampoline
 nesting in the optprobe template
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-rcu-tasks-preempt-qs-v1-7-d4469f4cc101@toxicpanda.com>
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

The jump-optimized kprobe template calls optimized_callback() with
preemption still enabled for its first few instructions, so bracket the
call with an increment/decrement of current->rcu_tramp_nesting.  The
template lives in .rodata and is memcpy()d into each optinsn slot without
relocation processing, so the per-CPU reference to current_task must be
an absolute %gs: address (R_X86_64_32S, relocated for KASLR like any
other) rather than %rip-relative.  %rax has already been saved by
SAVE_REGS_STRING and is dead after the call.

The slot itself is dynamically allocated text, so the instructions before
the increment and after the decrement are covered by the irq-exit IP
check.  64-bit only; 32-bit x86 does not take part.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/kernel/kprobes/opt.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 3f8fea52619f..f722520bb989 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -31,6 +31,7 @@
 #include <asm/set_memory.h>
 #include <asm/sections.h>
 #include <asm/nospec-branch.h>
+#include <asm/asm-offsets.h>
 
 #include "common.h"
 
@@ -101,6 +102,23 @@ static void synthesize_set_arg1(kprobe_opcode_t *addr, unsigned long val)
 	*(unsigned long *)addr = val;
 }
 
+/*
+ * Tasks RCU trampoline nesting, see rcu_tasks_trampoline_enter().  The
+ * template is memcpy()d into the slot without relocation processing, so the
+ * per-CPU reference must be absolute, not %rip-relative.
+ */
+#if defined(CONFIG_TASKS_RCU) && defined(CONFIG_X86_64)
+#define OPTPROBE_RCU_TASKS_ENTER					\
+			"	movq %gs:current_task, %rax\n"		\
+			"	incl " __stringify(TASK_rcu_tramp_nesting) "(%rax)\n"
+#define OPTPROBE_RCU_TASKS_EXIT					\
+			"	movq %gs:current_task, %rax\n"		\
+			"	decl " __stringify(TASK_rcu_tramp_nesting) "(%rax)\n"
+#else
+#define OPTPROBE_RCU_TASKS_ENTER
+#define OPTPROBE_RCU_TASKS_EXIT
+#endif
+
 asm (
 			".pushsection .rodata\n"
 			".global optprobe_template_entry\n"
@@ -114,6 +132,7 @@ asm (
 			"optprobe_template_clac:\n"
 			ASM_NOP3
 			SAVE_REGS_STRING
+			OPTPROBE_RCU_TASKS_ENTER
 			"	movq %rsp, %rsi\n"
 			".global optprobe_template_val\n"
 			"optprobe_template_val:\n"
@@ -122,6 +141,7 @@ asm (
 			".global optprobe_template_call\n"
 			"optprobe_template_call:\n"
 			ASM_NOP5
+			OPTPROBE_RCU_TASKS_EXIT
 			/* Copy 'regs->flags' into 'regs->ss'. */
 			"	movq 18*8(%rsp), %rdx\n"
 			"	movq %rdx, 20*8(%rsp)\n"

-- 
2.55.0

