Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E824E77E7
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617316; cv=none; b=fDHlBxo+Aa58qYaMo3Pbf7OKdq7FVhwPVH+kAkOM80+/h2y6J812CIjxWp1DvHXia5ri+6sQpd6SoFf2sn25G48+ULF+cO0do7l3Nu1sbudrLbMrx0wCuV2qOOnoMJjglsml4NIEWVU4JgDbu2ml5BBDy8H01rOfo26WvGyVc7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617316; c=relaxed/simple;
	bh=c1POIadwprxPDNsdozfeD1o6wPxvRs9raPf1U3VIYsA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BAEOODVqLOn0TEiqVnQhJ4iAcgdDSTWA1lE5F7up4HJ/Z5igzw9vfq647NiFdXz8Kkw8Uq1jvLeBKvlU63+Xxf8PrS1p9sV9Jajk/ZbP4ba7KoUSWELt0Rjseco9HibH3QR/AGyghSQsfK4iRfJ8EZnsbfaL3y0LL58Mr4cEISo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sOTojJHl; arc=none smtp.client-ip=209.85.128.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sOTojJHl"
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e635a6002so39743725e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617312; x=1791222112; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1DJuPuQM9kSMFWHvWycx46i6Qw8Tz2JNB7c4R6pz+k=;
        b=sOTojJHlNEcrLbVXo4NYzaN3fsx59QS87qsiEUOKWXV1bRLTmZV47wUbezdqfjvubc
         vpzq2LQBKNWHMjG6FcFgl74VdPKxbFm1nkuKBb+GjfZbX01kmgf2iA5eZx/AZ1p82Ik9
         hhD5HnxAC/ZuIL6iIc2f6wpm1VHSlRoY2lDEGZlOwNefK8Is3somti5Hy5dOSjyDiF3+
         11IfZU+I0jKbrv6lzz01CbRCYTOAZ1siVAllDzk55II7t8CVIF93FmmrVvzu5c07gHJu
         lJA4OksBAWmuuW3oaAS3moZbvEqeSIJakBn+g1uVgAFC7LTmj7SEtbzPv46c67O26qZv
         +mEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617312; x=1791222112;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1DJuPuQM9kSMFWHvWycx46i6Qw8Tz2JNB7c4R6pz+k=;
        b=QMAIKARm7RtDRXLflw/dAsxf1PaEA7K5itRrLDCXUO+7wVkXutD+KJUwChoglYoy0+
         +XBLXuza3ghIVsk8nckVYXvx8k37Fb7ooSMMRy+Av3xi2XWTQdlNrsJdoE0dtbqslECC
         rz8jhmmg3EIwv4jhyh3C8tCxXKqL5DRK4ot9jq7FGrQ7VGEEX+kzwF3AKlrYhLoVCqfO
         JNMuNi/ECxEkM85wxB+eN8LFu0AWzXyNT54jS9cTe8TdE/Kokyj7JjOI7+ueKiYNuxne
         EWtaLAX2bS8qTy3HMePJnqnL+3QNHLNwQhnhY+dY+LaI++rr/VcsLVxYYqF5hT0wPnuZ
         8EZA==
X-Forwarded-Encrypted: i=1; AKwUvBzkd6Kkfkbu18x2XmTP+f2P3jlbscL9JFPNUyLRM7VN/MCN4M18Bl+CoqgkmD/0HzoNCphkvhPdI65fCKM=@vger.kernel.org
X-Gm-Message-State: AFuF++l6vp8l4exmZu1pcRH84Ktz6aPdG45xW1Kjv9+WjJC43MOdmGbU
	MA3R8Ii/ryAYm/BefBOu4HtBisCg4Fz+XF7VWdd1CEi6CEfFS8HJ3Wle453SrDEvaAhzY7pzDp7
	DnjrtrMHsF/NnwA==
X-Received: from wmbhn25.prod.google.com ([2002:a05:600c:a399:b0:4a0:146:71bc])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c4:b0:49f:c331:39e4 with SMTP id 5b1f17b1804b1-49fe66ca101mr236728135e9.7.1790617311982;
 Mon, 28 Sep 2026 10:41:51 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:11 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-5-smostafa@google.com>
Subject: [RFC PATCH 04/15] fork: Separate vmap stack allocation and free calls
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
	Pasha Tatashin <pasha.tatashin@soleen.com>, Linus Walleij <linus.walleij@linaro.org>, 
	David Stevens <stevensd@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pasha Tatashin <pasha.tatashin@soleen.com>

In preparation for the partially populated stacks, separate out the
__vmalloc_node and vfree calls from the vmap based stack allocations.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[Fix a bug in original patch: free_vmap_stack(vm_area->addr)]
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
[Add missing free_vmap_stack conversion, fix typos, rebase]
Signed-off-by: David Stevens <stevensd@google.com>
[Resolved conflict in alloc_thread_stack_node(), update commit msg]
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 kernel/fork.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 473878d7f62f..3f1c46d8f7ec 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -272,6 +272,21 @@ static bool try_release_thread_stack_to_cache(struct vm_struct *vm_area)
 	return false;
 }
 
+static inline struct vm_struct *alloc_vmap_stack(int node)
+{
+	void *stack;
+
+	stack = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN, GFP_VMAP_STACK,
+			       node, __builtin_return_address(0));
+
+	return stack ? find_vm_area(stack) : NULL;
+}
+
+static inline void free_vmap_stack(struct vm_struct *vm_area)
+{
+	vfree(vm_area->addr);
+}
+
 static void thread_stack_free_rcu(struct rcu_head *rh)
 {
 	struct vm_stack *vm_stack = container_of(rh, struct vm_stack, rcu);
@@ -280,7 +295,7 @@ static void thread_stack_free_rcu(struct rcu_head *rh)
 	if (try_release_thread_stack_to_cache(vm_stack->stack_vm_area))
 		return;
 
-	vfree(vm_area->addr);
+	free_vmap_stack(vm_area);
 }
 
 static void thread_stack_delayed_free(struct task_struct *tsk)
@@ -307,7 +322,7 @@ static int free_vm_stack_cache(unsigned int cpu)
 		if (!vm_area)
 			continue;
 
-		vfree(vm_area->addr);
+		free_vmap_stack(vm_area);
 		cached_vm_stack_areas[i] = NULL;
 	}
 
@@ -336,14 +351,14 @@ static int memcg_charge_kernel_stack(struct vm_struct *vm_area)
 static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 {
 	struct vm_struct *vm_area;
-	void *stack;
 
 	vm_area = alloc_thread_stack_node_from_cache(tsk, node);
 	if (vm_area) {
 		unsigned long offset = 0;
+		void *stack;
 
 		if (memcg_charge_kernel_stack(vm_area)) {
-			vfree(vm_area->addr);
+			free_vmap_stack(vm_area);
 			return -ENOMEM;
 		}
 
@@ -364,15 +379,12 @@ static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 		return 0;
 	}
 
-	stack = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN,
-				     GFP_VMAP_STACK,
-				     node, __builtin_return_address(0));
-	if (!stack)
+	vm_area = alloc_vmap_stack(node);
+	if (!vm_area)
 		return -ENOMEM;
 
-	vm_area = find_vm_area(stack);
 	if (memcg_charge_kernel_stack(vm_area)) {
-		vfree(stack);
+		free_vmap_stack(vm_area);
 		return -ENOMEM;
 	}
 	/*
@@ -381,8 +393,7 @@ static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 	 * so cache the vm_struct.
 	 */
 	tsk->stack_vm_area = vm_area;
-	stack = kasan_reset_tag(stack);
-	tsk->stack = stack;
+	tsk->stack = kasan_reset_tag(vm_area->addr);
 	return 0;
 }
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

