Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BC54F3929
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617325; cv=none; b=EO0FS+nOAgBoeP8YqNcx+0G95rAVadnSZE8Yg68KNpgylS7cL2d7oWr8/oAyivbl6LUxvP8lDYsrk8DfYOmMq+FkDLhRVqVb/2VBd+YDWMAzPKTENRP+y7xJwnfu7WfBKQ4Flv0soCkHvUS3okYBcLbpE0aeSDLImSpDE8eIPMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617325; c=relaxed/simple;
	bh=6mIvWhe/r7QU8+ZBormU4CZE5CRYcvmpUPaCx/ZKS+I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OnHAJXQL1zIPPBsK5Boxuw8EnFJjW9UH0PDoRZHifT4OMIDLm0dSnVT87nLrcrkEDfMcR9f9ZXi+rwhi4LYmTk7EXLUe44+kF4HqUfS5Y8/pJPcpTnRASKnEh0rbuK3AwOFZL1gr20ATjfth1/+R0GXIO9kxM1jrwGkivCfM+VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ry6i+YjE; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ry6i+YjE"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49cdc4080ddso2130755e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617318; x=1791222118; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbjBREz9vOqId6KGSe2hfelOhYq7OUN6jgn8hmrgsOA=;
        b=Ry6i+YjEdQbCZ/QFdD8xg6lqDlsLxbsxzvjFLvRY/F7VeU5ELTOQz8ZOrvRfhqE+jN
         Jj2kLKoVjK7984i82fw8GmTZSSa3qqE91CDO6irVlee7ARWHCh8L8mSkq8NACohSzPTi
         o3hF9IdZUYKcbDDtWctUeJnMVO2ctfGaDlri8iEAJnMfGMveMGsf4PL11LuO1c+gUPoy
         lqQN67Q3SC/RQtqDxc0ardUYB1XOcv2587QNkEywuiKIWKg4Wzz6POQ0lV6E9gx+aSby
         LdVNx+rCZwJRDcX/oj9r9gzLUrYZ5dqIYR1cGsK7eLfsUPyQi5SA61pqJ+79k3aKPkEz
         e13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617318; x=1791222118;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbjBREz9vOqId6KGSe2hfelOhYq7OUN6jgn8hmrgsOA=;
        b=ekra7F0ZjkGhujsgYYa8uoDt3EEiAVT7zM1Pnr3YrpMOAnSOeyFG3IBRcCYURhS9TB
         5jvjAGHQIGI0BjtS+KOHr+NtzbqzxDnO3/dj5J7SGAEJ1VuCXoJgbY5iDy7YuNBkXcq4
         C9th2HTm4E1wHZ+wvxCWuUvYgw+TxJnavzifMkzaNMCfH7KmRSNU7/QTcN6v8WeeIXOF
         xnnkM3+y0z3wYasfTZB3ZikN5apsqO6p3165KLMfyj29H5vo5Zrje2TTd/1lySUFQxYD
         VbORN2D+X+LhaZZ2J8ILIkzpEZhv5XSZztnSaBEpOYl7bIzlNYtm8nq5Ko/NGO//xutB
         XYug==
X-Forwarded-Encrypted: i=1; AKwUvBzBytCbzX9L7jn4avIE9vQHObWslA+4GKkzGPzJCKA2u1nsrEbaet2DmbqbzLV/RcQTOvKfkaADBbupMuY=@vger.kernel.org
X-Gm-Message-State: AFuF++l8BeBy0xE0cDHkKyV5p6Y+Kyiciu6qcS/IT+V+fOkvTEP017Hb
	ktiuzFk2xWIyzTwvu6LaT6DYB9VwnP50bm5dfKq6ZZ0pqigH5wcQr58fEX8PL0TJslCg9t8gHEt
	2hz4cCOHI8a+iQg==
X-Received: from wmdv11.prod.google.com ([2002:a05:600c:12cb:b0:4a0:8ba:ba83])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:470d:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a00d778efemr1664475e9.14.1790617317905;
 Mon, 28 Sep 2026 10:41:57 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:16 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-10-smostafa@google.com>
Subject: [RFC PATCH 09/15] arm64: Don't assume the kernel stack size
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

stacktrace and panic functions assume that the kernel stack size is
THREAD_SIZE.

The allocated kernel stack size may not be THREAD_SIZE anymore, rely
on the newly introduced helpers task_stack_{low, high}()

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/include/asm/stacktrace.h | 4 ++--
 arch/arm64/kernel/traps.c           | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/stacktrace.h b/arch/arm64/include/asm/stacktrace.h
index eb18d7cee62f..cbc93cf213a7 100644
--- a/arch/arm64/include/asm/stacktrace.h
+++ b/arch/arm64/include/asm/stacktrace.h
@@ -41,8 +41,8 @@ static inline bool on_irq_stack(unsigned long sp, unsigned long size)
 
 static inline struct stack_info stackinfo_get_task(const struct task_struct *tsk)
 {
-	unsigned long low = (unsigned long)task_stack_page(tsk);
-	unsigned long high = low + THREAD_SIZE;
+	unsigned long low = (unsigned long)task_stack_low(tsk);
+	unsigned long high = (unsigned long)task_stack_high(tsk);
 
 	return (struct stack_info) {
 		.low = low,
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index ce0e213d772d..b91b154843ef 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -902,7 +902,8 @@ DEFINE_PER_CPU(unsigned long [KERNEL_EXC_STACK_SIZE/sizeof(long)],
 
 void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigned long far)
 {
-	unsigned long tsk_stk = (unsigned long)current->stack;
+	unsigned long tsk_stk = (unsigned long)task_stack_low(current);
+	unsigned long tsk_stk_end = (unsigned long)task_stack_high(current);
 	unsigned long irq_stk = (unsigned long)this_cpu_read(irq_stack_ptr);
 	unsigned long exc_stk = (unsigned long)this_cpu_ptr(kernel_exception_stack);
 
@@ -913,7 +914,7 @@ void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigne
 	pr_emerg("FAR: 0x%016lx\n", far);
 
 	pr_emerg("Task stack:      [0x%016lx..0x%016lx]\n",
-		 tsk_stk, tsk_stk + THREAD_SIZE);
+		 tsk_stk, tsk_stk_end);
 	pr_emerg("IRQ stack:       [0x%016lx..0x%016lx]\n",
 		 irq_stk, irq_stk + IRQ_STACK_SIZE);
 	pr_emerg("Exception stack: [0x%016lx..0x%016lx]\n",
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

