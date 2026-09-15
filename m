Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820DF4A1E0B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478288; cv=none; b=EeDlh+Rx4krcQryCo+bPszdcBcTJmaKM2rLiKLQa8O+ouZ4OchS9T4eJ1ubXe15PCzAic1iHFElXp/4ko6n2kzA0NDTcOvzdfym7Oppkex8OttHekY3td//EDwe9q4vJeBJKR0hObIHiTdmt9c/JKZdk+vtq2rifEG+EK/qdbis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478288; c=relaxed/simple;
	bh=cyOEpv7E+99KbsYBQF12i4qmiz/SB2W5CJ1v6BiG3CI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GPbkRd3b+gVXO/XbhGn7GIX/jtxm4SQJpVLidl0cqNA1RiHQ/ym3URBXCAa74L5A01vyTK31Se4unhnHlkUvrFW4fNCvs0ZWSSYsA/32G6u8eyFmo8wm0YKtiwXJsJ6ET/uXwjNB4GoFrJd5hK2mSmpMM6/v2IwJDLIH9b53ijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=gYS2Bu1V; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="gYS2Bu1V"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76906adso46629811cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789478283; x=1790083083; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=;
        b=gYS2Bu1VPt21rSZr6oDMTEAKF0+UiLvIlptr2/gtMXk5FXlmg/u2TQksoBcSz6yRI9
         +cw53Lz8Rgvomw5rm02teSz9gn9q1A7aCDekbNFumTcalcIWbTmmjQnOmMY/V69LWT6L
         DuwLk6kBVD0Ri2gt4Bml89x58yfI3lZ/eb1LPV4OTjJ0jeW2G6gGmzJ01ZcYHORj+4RV
         sFz8T4nKlFUrg7fTgLLeagu/JLWcNCOEfvLJd5e2GJMTExSnBhIue5Gl5yZuDwTFxwZs
         y/d6z4aG9nlnzM45zleX+3kkRwWCLD4s9ZzGaoUYOEs+LgqzETgkaJ6MLn/LwVOXy/wv
         uRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789478283; x=1790083083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lDajmUPmaz8BTxhPEk6XaACKGtk0v9RwI05AN+Obys=;
        b=xtxs4QFAi/9W+D0evvdT7X+4/SuYIO7B3odN9FkvlaB6DRY1gMmAaZi2iCZ5yk9bfg
         GKWPGZrmtDdfmMvV8VWs5+a2bKf+y5HAUVpoodm4EyQuCiN1N3xXKMY7NWG51NuWmBEy
         a0Q2/hCPEPK//cEw/G5oiv+ptBnMJoqzxnhH1X1wbk3BWZoL4TfuMwhy1oDMw9PVaa/8
         /LAjswCTHw/OPQRphBiF1VxKrJHQEUnCh/bWhKfB3JAeNqzX0NpAk42KaHNYseSBC6IJ
         JyL47JLpeNfiupm04aitU0qjuvdtpVzcGgyS0NM6bRKpuv+65Y/clGuZeFYLB+y0XTlj
         THXg==
X-Forwarded-Encrypted: i=1; AKwUvBxXNWsFE+/sasHBFgzj7OO3Cu88vSYJz416ks2J03ORWkmfXUNNAv1MyUUUfNNZQKao9+4Qvg2s/AwSvdg=@vger.kernel.org
X-Gm-Message-State: AFuF++kpI6Z8DTCTB6PW8eyP0kDWvDLsWUGWkckSJMviF2nVrDT76xf/
	IV9ylKojUPIg3LXT3cOKu3t9reX2cp6VFuhUZfITqSe6noeEnBsuxYD7KHsq4Edr0gw=
X-Gm-Gg: AYBFou1F1CCBlLocyBPod+GUBNrREaHcIePvKXcP1+ew3+DOj1YG7jPle097dLIK+Ee
	XNBbujZhufvO36KCSTB0mvmNa0jMIL8ImT+N14KtNcP5Ig/k/x0aiN4tYBt1EfN244NgzaFQsQ3
	Nv8bHah6FRUZIC8dc/D5ZOPJB36ujV/Sbz+yMcsUpz5sGgJWre8DBWuoIPMAih3ZXMp3BlMs6EJ
	c1024NkKVJiOt8Ue1d8+5AbppJ4iM3c1weDas9teynnh3ab9i7z8XbH0mWiL1QCqdItV9WQGBtk
	zeP3SUZjstdM8sSa/c2Qe/x9R9dgJoq/vuGAsLD5RucvSZNRkxFQrCAkxiMvFZU8ibgvMBNNcoQ
	/LGwK3ZtwM+Xxn7i06tlEss604WU6a/uHYWF6ufu2HN2PRD530iuZGFbgHbAiEiB71q/H0oJbH3
	EZzBTcjvTo++8HrvCWcJgRt+sElIwG2dt+NetUnaM/at6pUmtqaVGWDpZYWLXh85olUEPfrdQyY
	Sbyk+3+nebXwUDXjZzk4mNnTGBT4NWOd9ye9Kz0U72Z7Tsr81cDUqZP
X-Received: by 2002:ac8:5882:0:b0:531:4d7:bbe1 with SMTP id d75a77b69052e-5310d0620aamr106343871cf.50.1789478282597;
        Tue, 15 Sep 2026 06:18:02 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca4899dasm125209321cf.12.2026.09.15.06.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:18:02 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 15 Sep 2026 13:17:35 +0000
Subject: [PATCH RFC v3 08/13] x86/kprobes: Take a Tasks Trace reader in the
 optprobe template
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rcu-tasks-preempt-qs-v3-8-0ad30c4c5ee7@toxicpanda.com>
References: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com>
In-Reply-To: <20260915-b4-rcu-tasks-preempt-qs-v3-0-0ad30c4c5ee7@toxicpanda.com>
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
 Xu Kuohai <xukuohai@huaweicloud.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
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
 xen-devel@lists.xenproject.org, Andy Lutomirski <luto@kernel.org>, 
 Josh Triplett <josh@joshtriplett.org>, Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, linux-kernel@vger.kernel.org, 
 rcu@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789478262; l=3977;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=cyOEpv7E+99KbsYBQF12i4qmiz/SB2W5CJ1v6BiG3CI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPs7HUne0IzQlm9wRQkt109QqoRgFF/pfpz8lJ+9BcfBer6XnRW2+MjSGUTLZ6JFUaWA9Uyg01K
 Y4lSDYJOfogI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The jump-optimized kprobe template calls optimized_callback() from a
dynamically allocated slot with preemption enabled, and only Tasks RCU
keeps that slot alive under a task preempted in the callback.  For
HAVE_RCU_TRAMPOLINE_READERS that means the template must be a Tasks
Trace reader across the call, so open-code rcu_read_lock_trace() and
rcu_read_unlock_trace() around it as ftrace_64.S does.  The template
lives in .rodata and is memcpy()d into each slot without relocation
processing, so the references to current_task and
rcu_tasks_trace_srcu_struct are absolute (R_X86_64_32S, relocated for
KASLR like any other) rather than %rip-relative.  %rax and %rcx have
already been saved by SAVE_REGS_STRING and are dead after the call.

The slot itself is dynamically allocated text, so the instructions
before the lock and after the unlock are covered by the irq-exit check.
64-bit only; 32-bit x86 does not take part.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/kernel/kprobes/opt.c | 44 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/x86/kernel/kprobes/opt.c b/arch/x86/kernel/kprobes/opt.c
index 3f8fea52619f..68a5de6cdabe 100644
--- a/arch/x86/kernel/kprobes/opt.c
+++ b/arch/x86/kernel/kprobes/opt.c
@@ -31,6 +31,7 @@
 #include <asm/set_memory.h>
 #include <asm/sections.h>
 #include <asm/nospec-branch.h>
+#include <asm/asm-offsets.h>
 
 #include "common.h"
 
@@ -101,6 +102,47 @@ static void synthesize_set_arg1(kprobe_opcode_t *addr, unsigned long val)
 	*(unsigned long *)addr = val;
 }
 
+/*
+ * Open-coded rcu_read_lock_trace() / rcu_read_unlock_trace() around the call
+ * to optimized_callback(), see CONFIG_HAVE_RCU_TRAMPOLINE_READERS and the
+ * equivalent macros in ftrace_64.S.  The template is memcpy()d into the slot
+ * without relocation processing, so memory references must be absolute
+ * rather than %rip-relative.  %rax and %rcx are free at both points.
+ */
+#ifdef CONFIG_TASKS_RCU_TRAMPOLINE_READERS
+#ifndef CONFIG_TASKS_TRACE_RCU_NO_MB
+#define OPTPROBE_TRACE_RCU_MB	"	lock addl $0, -4(%rsp)\n"
+#else
+#define OPTPROBE_TRACE_RCU_MB
+#endif
+#define OPTPROBE_TRACE_RCU_READ_LOCK						\
+		"	movq %gs:current_task, %rcx\n"				\
+		"	movl " __stringify(TASK_trc_reader_nesting) "(%rcx), %eax\n"	\
+		"	incl " __stringify(TASK_trc_reader_nesting) "(%rcx)\n"	\
+		"	testl %eax, %eax\n"						\
+		"	jnz 1f\n"							\
+		"	movq rcu_tasks_trace_srcu_struct+" __stringify(SRCU_srcu_ctrp) ", %rax\n" \
+		"	incq %gs:" __stringify(SRCU_CTR_srcu_locks) "(%rax)\n"		\
+		"	movq %rax, " __stringify(TASK_trc_reader_scp) "(%rcx)\n"	\
+		OPTPROBE_TRACE_RCU_MB						\
+		"1:\n"
+#define OPTPROBE_TRACE_RCU_READ_UNLOCK						\
+		"	movq %gs:current_task, %rcx\n"				\
+		"	movl " __stringify(TASK_trc_reader_nesting) "(%rcx), %eax\n"	\
+		"	subl $1, %eax\n"						\
+		"	jnz 2f\n"							\
+		"	movq " __stringify(TASK_trc_reader_scp) "(%rcx), %rax\n"	\
+		"	movl $0, " __stringify(TASK_trc_reader_nesting) "(%rcx)\n"	\
+		OPTPROBE_TRACE_RCU_MB						\
+		"	incq %gs:" __stringify(SRCU_CTR_srcu_unlocks) "(%rax)\n"	\
+		"	jmp 3f\n"							\
+		"2:	movl %eax, " __stringify(TASK_trc_reader_nesting) "(%rcx)\n"	\
+		"3:\n"
+#else
+#define OPTPROBE_TRACE_RCU_READ_LOCK
+#define OPTPROBE_TRACE_RCU_READ_UNLOCK
+#endif
+
 asm (
 			".pushsection .rodata\n"
 			".global optprobe_template_entry\n"
@@ -114,6 +156,7 @@ asm (
 			"optprobe_template_clac:\n"
 			ASM_NOP3
 			SAVE_REGS_STRING
+			OPTPROBE_TRACE_RCU_READ_LOCK
 			"	movq %rsp, %rsi\n"
 			".global optprobe_template_val\n"
 			"optprobe_template_val:\n"
@@ -122,6 +165,7 @@ asm (
 			".global optprobe_template_call\n"
 			"optprobe_template_call:\n"
 			ASM_NOP5
+			OPTPROBE_TRACE_RCU_READ_UNLOCK
 			/* Copy 'regs->flags' into 'regs->ss'. */
 			"	movq 18*8(%rsp), %rdx\n"
 			"	movq %rdx, 20*8(%rsp)\n"

-- 
2.55.0

