Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA29C4E3222
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617330; cv=none; b=VQdz+snWxr1AVdkjHdYWhAMMyLxKYBTqPcLARMaCFGBI8NJzKclkY1O//XCt2J0k4EDTzz+S4G+wCih6f4ZxKlb8tQBg7qlta4IoS9Do4EGi+k/0/LgRKaU94Mr2jgw/Tjnd8f1KfrCUav2zFjJUvD/MfT8VtAwMvePUi3DozxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617330; c=relaxed/simple;
	bh=fqb9OvcrF+1YGNg2ZQpu0FVkmCJMPIgeYZw98qjd2TE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GdIP+9CFMAAMW7korGGw4RekwkmuQv5K3xmZ4jrIXDE/IbqScJ8qwnVM06JWOj9kypYYu9JAgr9AB+IDTgKdTxKLVyxZAqjqK7FwJUX2otAeV7hnhC859OeuqdcrIGBf0IPm6aUZtaOlgTdWnHibZsAozikvTy95KqjaCoQTSKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R9oWZ0rV; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R9oWZ0rV"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49fffa5de0fso25076585e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617323; x=1791222123; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5BgLva5vXrAwBl9Y3v1BBOsVeywVgMCKKqE5NVyRxk=;
        b=R9oWZ0rV7gKjtA+la0UmSJwqWvDqq8wPLqFAoKyMDtFhs+vbe53tpGCRzWJ9ioM8F6
         MZksfaaiPsdWKeF9s75UWfH005UDaew0pgQPt4kE2S/O3XZuJ7PNkRZekOjBByC1ietp
         /WWRysDJT2/2FG/y+UryCV7l5fWn4Mt+FJlpcbD+B+8L6DLhBifTJVYlpI3q9RdRpNJ5
         pCzff2k5EJbV9W5yOnqn5NIDZ5ws2C0oS4uK52rsdaIQeDmVPompBLDRP+GHORm/SZDm
         UASyolwVaW6G/QQ3sN79899OUbU4HhV6rZkcpqLNXCcBYBCO1vsB1gs2hfo1xCcVo1J3
         IYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617323; x=1791222123;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5BgLva5vXrAwBl9Y3v1BBOsVeywVgMCKKqE5NVyRxk=;
        b=h90MD4la7aKGaD8r1dCOUZZnVCO3Xs7qyva9XQc+RIA5hoHrItz0+Ws7oAQhdtO8Ke
         BRmKLrQd8RNcFaXsl3ppw/QjzGLMzF5UCOuTRsXWg9OJME8uRpXMAm7gvfFTqYsqK3FL
         L3Fv41L/58/A63nyEcA+DnW7RGWs71MoDOGeOGwDhYxGvCVxu2pDIZ0uP0IsX1HJfg2q
         DpWLwq9mRukrj/M5qK5C279jaCyrTw/uA3DjukbNrqTfXSR1p3KhpwpgfA+qx1v4RO6e
         IbZ2Lxspr0PdzDhCB3txoXamF2a/ejObshTezKOv8K3Gm9BdqLzP6srQLt792XICLZQA
         YwDw==
X-Forwarded-Encrypted: i=1; AKwUvBzws1MM60hInpgaRCRcVrxlYrxSI101WqXq9HvsO0GqiVHS57KhK2WcNnoGKztaFJ8rKIgAL9XmNkX+9D0=@vger.kernel.org
X-Gm-Message-State: AFuF++mh0nSHS5t6Jim6rnf7f6mHEjmoNk2tngs3U4PI65v0/V7Iq3b2
	UpeFNEXbSN8fhGyAfQsk8GB7UYmnU4ctRGx4C5paqNz9/Pl3995/j9hg1N6khKvnttv83nIi9RF
	pvMKKgZBFUREFeQ==
X-Received: from wmhj21.prod.google.com ([2002:a05:600c:3015:b0:49e:8337:33d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c4:b0:49f:c331:39e4 with SMTP id 5b1f17b1804b1-49fe66ca101mr236733115e9.7.1790617322864;
 Mon, 28 Sep 2026 10:42:02 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:19 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-13-smostafa@google.com>
Subject: [RFC PATCH 12/15] sched/task_stack: Introduce ARCH_HAS_VARIABLE_STACK_SIZE
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

When CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE is enabled, the kernel stack
may not be fully populated with the THREAD_SIZE virtual area.

Teach task_stack_size() to return the size of the vm area and not a
fixed size.

This propagates to end_of_stack() which makes functions like
stack_not_used() and set_task_stack_end_magic() to use the lowest
valid stack address instead of THREAD_SIZE which would cause data
aborts.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/Kconfig                     | 10 ++++++++++
 include/linux/sched/task_stack.h |  5 +++++
 2 files changed, 15 insertions(+)

diff --git a/arch/Kconfig b/arch/Kconfig
index 45c657772362..d6fa2ccb0599 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -431,6 +431,16 @@ config HAVE_ASM_MODVERSIONS
 	  <asm/asm-prototypes.h> to support the module versioning for symbols
 	  exported from assembly code.
 
+config ARCH_HAS_VARIABLE_STACK_SIZE
+	bool
+	depends on VMAP_STACK
+	depends on !STACK_GROWSUP
+	depends on THREAD_INFO_IN_TASK
+	help
+	  An arch should select this if it supports dynamically configuring the
+	  kernel stack size.
+	  For example the kernel stack size can be from the command line.
+
 config HAVE_REGS_AND_STACK_ACCESS_API
 	bool
 	help
diff --git a/include/linux/sched/task_stack.h b/include/linux/sched/task_stack.h
index 4a808f9c4631..07d73adaecd1 100644
--- a/include/linux/sched/task_stack.h
+++ b/include/linux/sched/task_stack.h
@@ -10,6 +10,7 @@
 #include <linux/magic.h>
 #include <linux/refcount.h>
 #include <linux/kasan.h>
+#include <linux/vmalloc.h>
 
 #ifdef CONFIG_THREAD_INFO_IN_TASK
 
@@ -96,6 +97,10 @@ static inline unsigned long *end_of_stack(const struct task_struct *p)
  */
 static __always_inline unsigned long task_stack_size(const struct task_struct *task)
 {
+#ifdef CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE
+	if (task->stack_vm_area)
+		return task->stack_vm_area->nr_pages * PAGE_SIZE;
+#endif
 	return THREAD_SIZE;
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

