Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FAC4EC674
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617317; cv=none; b=pPe03WD1M+5FfskISN9ZOeKmkSxZq4+ClPv7JwIAdf52zrCplzDviABl1ERr5fFWsIIADohVSR9RGKIHAngPrImP15HERm7LJf1YTrysR5VxTEVCTy227ZVyEFOYFtyZqTpMF9NWIJy5s8K0PZMe4Ra9DZn3tlCGhq9b5SJuVmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617317; c=relaxed/simple;
	bh=92UIyLy7GtKPROYl2Br7ZP/exzYZtpSXAMuolLK+K3g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tw80N3ua4iN0erLDXdGctGvRRtcX85Fib9i9PCSZENPsUK0GlWScRrNcQBanzQIIDHGByS0+1WawaCCEQ4uK6mG+u5jTQRIT20o2DSVzrIAVN3XQXOjLZswh/6a0seWeWdosbaaK7ftyaxx0v6fPvjlQMp7As+pXF7nhRQ4f/qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nLsfqJxW; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nLsfqJxW"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e661c6440so22454625e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617313; x=1791222113; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLizaoNOz6hydwy+EEJKSgP0D8TbobflQ2CjOBToA3A=;
        b=nLsfqJxWSua0QwmHUFI2GZjRHL5NB/vnb24Rh/xuKWfxf9VJtWDKn0fJYUwINJp5Be
         Nqi/AmzLeZ/S8OVyewsBlXbGketoFwA73JlcKAl1+p0f+XdQo2LetNO8BI8WSSh35/Pc
         rK7/FOwB2HYxFrAnmPUrsApNI8U8YUIwP2HM27WAYOPRg+YiBSzn0rJHR8b6NiQZamJw
         KxtNIzLTdTA0WrwYwyAB5pJxQhyfL/Bnn3qJAFEJAjfMF47TWDPOakZgSVyTUHauhNyo
         nmN1PKuZGZ/8t3GbKixyRpcE2lBHFbfR8ssU0t5IJSbKnXHKYdm0ckmec3mIHXToMJB9
         8ZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617313; x=1791222113;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PLizaoNOz6hydwy+EEJKSgP0D8TbobflQ2CjOBToA3A=;
        b=lP6aiyzClvXvnEjB/g5slxg2Fu3cLGXFb7OqXTmEdYu09l7kj2vIx/a8+EgnGfd25w
         2tg8yNyCK3todLpvI9xLMqOHGOpBftzh5JpTYAk5hA1YJpapwG4ozJr0rS24QWorp3V6
         F0XWWjIWIFIOLqRwAQLVrEzkAFXdvpN7+qmZVVSA20dkBxoOYq3s5WHzcDtWNI9u0HZj
         gdjgOB1GkkGLI97kdsZn3h07GjoN543Uv9CRd+sfpp5EMb/0VwBzUV4yhBW5KK2Do3oH
         a/OSKHsnxMsgAtIPKfM8Jdw5ghv+gf08om6XrGozwSKxyl0+VByR4TdFpSaJQfN38gah
         BCeg==
X-Forwarded-Encrypted: i=1; AKwUvBxTBuMy3LjQwT7JAS6N3dtkbh1X+kKwJIbY9IWdxwkuD1sxTbgH7JeCuRC5Kd4g4rrCaFdJGWrVi5pHczI=@vger.kernel.org
X-Gm-Message-State: AFuF++mR47zQONh83NOGvh1QlD1EUj8OnaaR3WKOQdW7VoS4a9hZ1o2L
	8edNrLN6u+twi2I27/VYybg8TYokM3TXAviMaWf9LEReVxKRv0Epoq+MAt1fjSpCAxF2AJ8ptGJ
	CVFMgeDSyGPohOg==
X-Received: from wmnb21.prod.google.com ([2002:a05:600c:6d5:b0:49f:e43f:afd1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c5:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49fe66c8623mr231494305e9.1.1790617313066;
 Mon, 28 Sep 2026 10:41:53 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:12 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-6-smostafa@google.com>
Subject: [RFC PATCH 05/15] sched/task_stack: Add helpers for stack high/low
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

Soon, memory mapped for a kernel stack can be less than THREAD_SIZE.
However, many parts of the kernel assume it is.
Add new helpers for the kernel stack that can be called regardless of
CONFIG_STACK_GROWSUP or the kernel stack size:
- task_stack_low(): Lowest usable address on the stack.
- task_stack_high(): Highest usable address on the stack.
- task_stack_size(): The size of a task kernel stack, it is still
  THREAD_SIZE at the moment but that will change soon.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 include/linux/sched/task_stack.h | 56 ++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/include/linux/sched/task_stack.h b/include/linux/sched/task_stack.h
index 1fab7e9043a3..4a808f9c4631 100644
--- a/include/linux/sched/task_stack.h
+++ b/include/linux/sched/task_stack.h
@@ -13,6 +13,8 @@
 
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 
+static __always_inline void *task_stack_low(const struct task_struct *task);
+
 /*
  * When accessing the stack of a non-current task that might exit, use
  * try_get_task_stack() instead.  task_stack_page will return a pointer
@@ -30,7 +32,7 @@ static __always_inline unsigned long *end_of_stack(const struct task_struct *tas
 #ifdef CONFIG_STACK_GROWSUP
 	return (unsigned long *)((unsigned long)task->stack + THREAD_SIZE) - 1;
 #else
-	return task->stack;
+	return task_stack_low(task);
 #endif
 }
 
@@ -64,6 +66,53 @@ static inline unsigned long *end_of_stack(const struct task_struct *p)
 
 #endif
 
+/*
+ * Kernel stack layout, higher addresses at the top. task_stack_page() is
+ * the start of the THREAD_SIZE area, task_stack_low() => task_stack_high()
+ * is the usable stack.
+ *
+ * Case 1) Stack grows down: Only the top task_stack_size() bytes are mapped:
+ *
+ *   +-------------+ <- task_stack_high() = task_stack_page() + THREAD_SIZE
+ *   |    stack    |
+ *   |      |      |    task_stack_size() bytes
+ *   |      v      |
+ *   +-------------+ <- task_stack_low() = end_of_stack() (*)
+ *   |   may be    |
+ *   |  unmapped   |    THREAD_SIZE - task_stack_size() bytes
+ *   +-------------+ <- task_stack_page()
+ *
+ *   (*) Depending on CONFIG_THREAD_INFO_IN_TASK, end_of_stack() might be just
+ *       above it.
+ *
+ * Case 2) Stack grows up (CONFIG_STACK_GROWSUP): The whole area is used.
+ * No support for partially mapped stacks.
+ *
+ *   +-------------+ <- task_stack_high() = task_stack_page() + THREAD_SIZE
+ *   |      ^      |    end_of_stack() is the last unsigned long below it
+ *   |      |      |
+ *   |    stack    |    THREAD_SIZE bytes
+ *   +-------------+ <- task_stack_low() = task_stack_page()
+ */
+static __always_inline unsigned long task_stack_size(const struct task_struct *task)
+{
+	return THREAD_SIZE;
+}
+
+static __always_inline void *task_stack_low(const struct task_struct *task)
+{
+#if defined(CONFIG_STACK_GROWSUP)
+	return task_stack_page(task);
+#else
+	return task_stack_page(task) + THREAD_SIZE - task_stack_size(task);
+#endif
+}
+
+static __always_inline void *task_stack_high(const struct task_struct *task)
+{
+	return task_stack_low(task) + task_stack_size(task);
+}
+
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 static inline void *try_get_task_stack(struct task_struct *tsk)
 {
@@ -88,10 +137,11 @@ void exit_task_stack_account(struct task_struct *tsk);
 
 static inline int object_is_on_stack(const void *obj)
 {
-	void *stack = task_stack_page(current);
+	void *stack_base = task_stack_low(current);
+	void *stack_end = task_stack_high(current);
 
 	obj = kasan_reset_tag(obj);
-	return (obj >= stack) && (obj < (stack + THREAD_SIZE));
+	return (obj >= stack_base) && (obj < stack_end);
 }
 
 extern void thread_stack_cache_init(void);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

