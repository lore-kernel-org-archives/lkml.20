Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E042340A6A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135795; cv=none; b=pzfSY1AYOKVMbLZkXRvaGwhZpIocBjelto259UflXD/kX53bSI8gCZnmIvxaXJTUGoKWaKG17ewPQRW2ERgoSJ/hL79XBgAfhVXSGyiaFW2v3Rjvt4Ehw3AaEQehovDcFFTE0UjRS4GnXc4V3sC68PVolsgNo1ojzY0svufb1V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135795; c=relaxed/simple;
	bh=lYdFz9QIpBbv18s7vNFL415owdJ/HvkbTUnKX5a6LVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfoVAmGY4dvvwN1WDLQLJWuk9q1PUt5sFxLmN9rtSozWj6k1Ummu4OPL5jkbvIFmV0fuNnoSbGPKd/vQM3KPGahJsvjRSi9p3T/2+q+87lN9j6VPbf3pA73aPSX0w7mSvGfWizyy1P0oUN6IEHvvc1oqTbQxQ6sQuJEEJDCjhMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=J5/zQyUr; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="J5/zQyUr"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91058dd77a2so12392686d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1789135791; x=1789740591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=;
        b=J5/zQyUrllri75hv6kPy5BM0guM4oReowgrDkY0lY6WKBZizx67u1LG5zsoJQ2XSuy
         b+9rs1JijuRfD6OHo3rXmWD3+QLKoqCW68RFWxUV6+PYqyYAih2d0FT6FkVLW/NO7B2H
         uR4DCMfgrXkOCUL5bjYBMvdSZBR43wCctfiONKnp/Jah5rsHDoxELkO1XMuSnLLHAT+S
         CyqtPO4T46EzYAlqHzmV67iTox/oacX1marzAOM1B/68xJeteNTB7sPEd7VDhFBaF8ee
         NwPVSPHTrhlDAwtAgXWUzxlviJrW14SrWH+47f1bRh2gu8hNkWDBYbw6N0V970y4D5PB
         ACVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135791; x=1789740591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxBJRgyuHY3W/iJApny4mLX1c4wnn/TYh39J8mu564M=;
        b=owLQsyMP19IHUg0MxmlDvCo3LjzOWrhIjKPlEX13kwh1YJ58wOp3x297+9W6xlzUwd
         CslVKNZ39bMeTa+xlUl2P+LvDDUtkVE95//yvbaha2BmGjcFEvozqcmglbWrEhNXekJ3
         gPc49DWEevVBcZPIugGkLKkHe62HvQcVodjeVnNnNlvUsmmc1PnovtUQ8lItrOemoSAv
         aXTjsfuYgkj2P9ylnzm3peBGKPrEDcm2vpK8s0Zay58uU51A/3o71r9m8wAyMN3bpPam
         4yepsPEcNcT9O/G2rq36MLCKaxuhzEncyNlRzm6ypcHp5fJMbamwk9loN3L/yfLXgbJt
         5cPA==
X-Forwarded-Encrypted: i=1; AKwUvBywNNlKSVnCzSadSG1BUy4PzPNH2AimFRTjRN0JWbKgBn4tIWSv/nzKIeK70DzXFiKGlo8g2ygB5T9kpoM=@vger.kernel.org
X-Gm-Message-State: AFuF++l1eqIJl6iy7QVm3cv7o1yDevv10COvP/JZw0rTcMtjhYo/ezqt
	P/s10UneJn92o8+A91+V9qelaktCaF2q2C4eWeKYojp4KBXicQfGxo/5IIFPCaUkpG0=
X-Gm-Gg: AYBFou24z5lGQa36+QEifqjIPC/PQ7z7fljf53VuhHulQYXC6FvRcRsg2SWYkCHuuCE
	MHhd1Y3s/imbrEcJgbJuE6x8t5PMYe3/2J4NWEc8HOdOQcFp2hkvSF18JUPQwAIE8Ks2+bgoTx1
	cLHfcIx3UaOYuubMvZzpR1XDmEPPpViH02h3uu1jCIoIyfV6pUt6yki9JcGK4iHkLpmj+6Z2U8M
	0Eoie7tJBYZ2Owy6i5SsfXrxcABWsSeoDDtENEAVnMVQ9rCob2TBm0yyso6fS/JLfBYOOV3iOo+
	0CLzx+BR8TEiMAlNnAHOYsM7Qv72Li5aTR6SnfYg8OJWiz9shT29v2Enw5KiyU7na409KVg/R6l
	WscdVLwgF7Z1UvjryblZh1gyx4vKI8sCSbVQ/+/lrLDtq8QwSspYQ1RHW0HlKJk28h+NnBRL+lO
	cjanepSBplkKWrSisgk/jYRI49/4L7E63yvAqyVFmttauWGYGoVAtWkzHpMzDYkwULikhPqd0lH
	JcYLi3bCLKgtYS48aG7092n2gNAJgUa4f4W0dWKxA+KMwNnBOTwdN9i
X-Received: by 2002:a05:6214:5297:b0:912:bed:c40 with SMTP id 6a1803df08f44-91212116f69mr58502326d6.34.1789135790416;
        Fri, 11 Sep 2026 07:09:50 -0700 (PDT)
Received: from toxicpanda.com (ec2-34-228-114-98.compute-1.amazonaws.com. [34.228.114.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f478bf1sm21734556d6.25.2026.09.11.07.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:09:48 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 11 Sep 2026 14:08:40 +0000
Subject: [PATCH RFC v2 02/15] entry: Pass pt_regs to
 irqentry_exit_cond_resched()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-rcu-tasks-preempt-qs-v2-2-eaaa61ed2da4@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1789135736; l=4149;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=lYdFz9QIpBbv18s7vNFL415owdJ/HvkbTUnKX5a6LVk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNLFUziLYUgokPYUCSvxyZJ4wGM33t0Exk3VASr1V813+Mcb6CwBQQCYTgKz4pDcXnm0a03w7j0
 ZSuWxmEEtwQ4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The irq-exit preemption path is about to need the interrupted context's
registers to decide whether the preemption may be reported to Tasks RCU
as a quiescent state.  irqentry_exit_to_kernel_mode_preempt() already
has them; hand them down through irqentry_exit_cond_resched(), its
PREEMPT_DYNAMIC static-call and static-key variants, and
raw_irqentry_exit_cond_resched().  The only caller outside the generic
entry code is Xen PV's upcall handler, which has regs as well.

No functional change.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/xen/enlighten_pv.c      |  2 +-
 include/linux/irq-entry-common.h | 12 ++++++------
 kernel/entry/common.c            |  6 +++---
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 2c64b388f616..3d85035f5624 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -739,7 +739,7 @@ __visible noinstr void xen_pv_evtchn_do_upcall(struct pt_regs *regs)
 
 	inhcall = get_and_clear_inhcall();
 	if (inhcall && !WARN_ON_ONCE(state.exit_rcu)) {
-		irqentry_exit_cond_resched();
+		irqentry_exit_cond_resched(regs);
 		instrumentation_end();
 		restore_inhcall(inhcall);
 	} else {
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 8da571622000..fc04725ae46b 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -348,21 +348,21 @@ typedef struct irqentry_state {
  *
  * Conditional reschedule with additional sanity checks.
  */
-void raw_irqentry_exit_cond_resched(void);
+void raw_irqentry_exit_cond_resched(struct pt_regs *regs);
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 #if defined(CONFIG_HAVE_PREEMPT_DYNAMIC_CALL)
 #define irqentry_exit_cond_resched_dynamic_enabled	raw_irqentry_exit_cond_resched
 #define irqentry_exit_cond_resched_dynamic_disabled	NULL
 DECLARE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
-#define irqentry_exit_cond_resched()	static_call(irqentry_exit_cond_resched)()
+#define irqentry_exit_cond_resched(regs)	static_call(irqentry_exit_cond_resched)(regs)
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void);
-#define irqentry_exit_cond_resched()	dynamic_irqentry_exit_cond_resched()
+void dynamic_irqentry_exit_cond_resched(struct pt_regs *regs);
+#define irqentry_exit_cond_resched(regs)	dynamic_irqentry_exit_cond_resched(regs)
 #endif
 #else /* CONFIG_PREEMPT_DYNAMIC */
-#define irqentry_exit_cond_resched()	raw_irqentry_exit_cond_resched()
+#define irqentry_exit_cond_resched(regs)	raw_irqentry_exit_cond_resched(regs)
 #endif /* CONFIG_PREEMPT_DYNAMIC */
 
 /**
@@ -467,7 +467,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 		return;
 
 	if (IS_ENABLED(CONFIG_PREEMPTION))
-		irqentry_exit_cond_resched();
+		irqentry_exit_cond_resched(regs);
 }
 
 /**
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index e3d381fd3d25..e4acd50bd81a 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -134,7 +134,7 @@ static inline bool arch_irqentry_exit_need_resched(void);
 static inline bool arch_irqentry_exit_need_resched(void) { return true; }
 #endif
 
-void raw_irqentry_exit_cond_resched(void)
+void raw_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!preempt_count()) {
 		/* Sanity check RCU and thread stack */
@@ -150,11 +150,11 @@ void raw_irqentry_exit_cond_resched(void)
 DEFINE_STATIC_CALL(irqentry_exit_cond_resched, raw_irqentry_exit_cond_resched);
 #elif defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
 DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
-void dynamic_irqentry_exit_cond_resched(void)
+void dynamic_irqentry_exit_cond_resched(struct pt_regs *regs)
 {
 	if (!static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
 		return;
-	raw_irqentry_exit_cond_resched();
+	raw_irqentry_exit_cond_resched(regs);
 }
 #endif
 #endif

-- 
2.55.0

