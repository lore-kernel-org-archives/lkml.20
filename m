Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8AD3932C3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787873484; cv=none; b=rbUpKB3xoRR9MiV1fwxkxCJsFKdWMIpKhdNpp+CJ5VI5Vq21wG/bWh+YSQughk543VuNcdFlhJ+PDSZ/02l1U6tRrhd0F68cCmUJnKsCbFhbJnXt0FFX13amluJ6Hpsk6e5EMsc18r1rRS5iwVBbLS10eFaHMAVBwGaP2+WxZd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787873484; c=relaxed/simple;
	bh=dfPDgNVh62+kHVsnAbD/7Pdvo8mCB2lnJPdMqfNI/Gc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Oh6mmZz8Br3SLmvnYdVV+UvWuO3p42lAlqh8/f9dozwJHy/AffdKHsR+kdcI1qJsjJjFSb6cz2CVJH9ZOCdTjc6stkS0eDIznTR0aN2klDw0EMbMNcZwEMH+uirfMeULo3YyfguId0XLdl+8TXXxPLoAic6RX8MXnP7OU8GT4K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stevensd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ot44G7at; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stevensd.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ot44G7at"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso660747a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873482; x=1788478282; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRF3HmEVCSbkNryj4HHFEle4K2g8xeVsDlkdo6/RfiQ=;
        b=Ot44G7atyvQiCmg1NPcjdfAjvjJk19lKqljvJjLPxH7VIjp1LAkK0R0AbufPd3ZhWM
         KqZS0HxD7rstsZrRZ0GYfNsZV+E+FhpnLp2OBwwGfjO+4myg53cKaQe2GFZxYoCPnxji
         onWpX7G956XlbE5nIzJo7z3VGNkMfNy+nTZAzxl9UpLvNvxy4F0sEKdU0FYN0OFaLBX7
         qyEhoRBboQ1jNCx5J8WEi68Wlte+qkP3ls4UzxMncWbzeW5Fmw8+/uv3/+WPogplbP/g
         iJpqb5IYuOWB7ZUHoilvdr6o5pNxPQcJc2iYj7CK3AUCIZsB9FFiI6E9scYAE+IyU4hQ
         ChRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873482; x=1788478282;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRF3HmEVCSbkNryj4HHFEle4K2g8xeVsDlkdo6/RfiQ=;
        b=BJ5jtiAhvrwjDqSTQLByhvB0EGYvhwsUdIyioCywrCaqVNUfK5nwf8C5jGPeydyfZS
         +scQnzt2gp1z19s12kRUeP4kfUUU/7QMMIkpCXBD7zSBeHSkSu/yJ3JIWbNXzDc40cRR
         //jnutwf7ET3J/zZHWkPrTJcFs0tKf4wWBp15sHm8Ki5W93OuWcfPTffG1IC10Ih/jay
         eCXUIZcDKLxTqQBAP82tLw3Z6/eIitY6QiqwNfAm0bsI4LDB+4GSID6LneAKEYLDt2B9
         7IIKiG492S3AztxhUWlVOdvfRTjrGdP51N0D4Uvg8QfTanR1wAF7anjpM01XroqFlUC5
         HWuw==
X-Gm-Message-State: AFuF++nRCFzYUaVSKbIYECU1y/CBJqQuno58dZCtGJjE3CgN+6nXPE8D
	G8YgJES18FThZH7fpVf3KkK3GbYLLetJVaUat0tqvRtj4YhWKTt07f81AHkv+r/ZYdk8FCfEwe1
	akxQqdkJY141ETQ==
X-Received: from dyblf13.prod.google.com ([2002:a05:7301:a0d:b0:315:bf25:ce14])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:94c9:b0:3d1:be60:2816 with SMTP id adf61e73a8af0-3d268cf776bmr3404563637.10.1787873482070;
 Thu, 27 Aug 2026 16:31:22 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:41 -0700
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-4-stevensd@google.com>
Subject: [RFC 03/10] fork: refactor vmap stack alloc/free into helpers
From: David Stevens <stevensd@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"

Prepare for alternate implementations of some functions for reclaimable
stacks by creating helpers for allocating and freeing vmap stacks. Also
reorder some functions to consolidate the functions that will have
alternate implementations.

Signed-off-by: David Stevens <stevensd@google.com>
---
 kernel/fork.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index f0e2e131a9a5..10bd76f6dd20 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -207,11 +207,6 @@ static DEFINE_PER_CPU(struct vm_struct *, cached_stacks[NR_CACHED_STACKS]);
  */
 #define GFP_VMAP_STACK (GFP_KERNEL | __GFP_ZERO | __GFP_SKIP_KASAN)
 
-struct vm_stack {
-	struct rcu_head rcu;
-	struct vm_struct *stack_vm_area;
-};
-
 static struct vm_struct *alloc_thread_stack_node_from_cache(struct task_struct *tsk, int node)
 {
 	struct vm_struct *vm_area;
@@ -272,6 +267,26 @@ static bool try_release_thread_stack_to_cache(struct vm_struct *vm_area)
 	return false;
 }
 
+static void free_vmap_stack(struct vm_struct *vm_area)
+{
+	vfree(vm_area->addr);
+}
+
+static struct vm_struct *alloc_vmap_stack(int node)
+{
+	void *stack = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN,
+				     GFP_VMAP_STACK,
+				     node, __builtin_return_address(0));
+	if (!stack)
+		return NULL;
+	return find_vm_area(stack);
+}
+
+struct vm_stack {
+	struct rcu_head rcu;
+	struct vm_struct *stack_vm_area;
+};
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
@@ -302,7 +317,7 @@ static int free_vm_stack_cache(unsigned int cpu)
 		if (!vm_area)
 			continue;
 
-		vfree(vm_area->addr);
+		free_vmap_stack(vm_area);
 		cached_vm_stack_areas[i] = NULL;
 	}
 
@@ -338,7 +353,7 @@ static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 	vm_area = alloc_thread_stack_node_from_cache(tsk, node);
 	if (vm_area) {
 		if (memcg_charge_kernel_stack(vm_area)) {
-			vfree(vm_area->addr);
+			free_vmap_stack(vm_area);
 			return -ENOMEM;
 		}
 
@@ -356,15 +371,13 @@ static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 		return 0;
 	}
 
-	stack = __vmalloc_node(THREAD_SIZE, THREAD_ALIGN,
-				     GFP_VMAP_STACK,
-				     node, __builtin_return_address(0));
-	if (!stack)
+	vm_area = alloc_vmap_stack(node);
+	if (!vm_area)
 		return -ENOMEM;
+	stack = vm_area->addr;
 
-	vm_area = find_vm_area(stack);
 	if (memcg_charge_kernel_stack(vm_area)) {
-		vfree(stack);
+		free_vmap_stack(vm_area);
 		return -ENOMEM;
 	}
 	/*
-- 
2.55.0.897.gb25b4bd76c-goog

