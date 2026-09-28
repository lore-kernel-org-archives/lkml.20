Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99F44E7808
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617313; cv=none; b=AloAmAn/kwXZ13mgBHAJAB2qDU/66tTKNX8cyKTB0VPZ0+qXBbYagx4PkvO4wjYfM5fk+KrN72ZZBuxKBkyJaFxzE45c6+seJgxi9Sli4KWBF+zM8YTjcpFhoWmuroPnO17BHpfZUXLhYUKGGCJkpJLRKwSQupED/cSl+E8lzFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617313; c=relaxed/simple;
	bh=ps8Vmpk8/Dvb3HvPEQ6r+gA9DsFwPpmM0auDoTT5Hck=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kKE56h2re6rTq6Jiw9pPoI/SaEwNTrIsc8eMTI+C+LHJ1hH/j/sgNbMIlk2sP+xGYRPsuxDBaSTFqhrkQbxUstfKdfUNaQvr/7ouWYjIBX+vqfQSyF0JTdhTtQnFVmRLdH0iKzXX8ToFMt63LiBeoSi3AITzn4vXwrg8GAXa+oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bQ2fSWEm; arc=none smtp.client-ip=209.85.208.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bQ2fSWEm"
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6aaa4535b3bso3709023a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617310; x=1791222110; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQQXCFUTzEuKqqGshgMGPB+3UWOKCHMCwqurMu3nBP4=;
        b=bQ2fSWEmzZ9zW4RPf8dbVeEhbqHUGuKVnTGanb//+7Ny1zSGO3V2gfWIzIVSQb9wHX
         CkXileWTB3aRfAL1e6N1z/dFnZFOb+/eyxUqzZVsdIDGIFmIJ4vyPPq3jneu6UkM9VHJ
         RoadS1TTDbZv3UpZTWzlJ6ztT/kDnJgNFtrBMbHePy1zRSzbxb0VBZYtOEiNkicHDeAH
         JQB8uqIotPU/LIguh1S4iEPrsfeZmHLBeK0Zc8aCNfrBEpFAUHGpaW6tyUEV3OSOpvAS
         ouO0C1hgSQoQcn1fk5LhOiOtgy2rzHGBYED7ZC50uUhjB4bg1RzpC0o5wtEpDTDnxdN9
         NEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617310; x=1791222110;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQQXCFUTzEuKqqGshgMGPB+3UWOKCHMCwqurMu3nBP4=;
        b=dxeyd7Qz1HtQ/RNs4+V99SZXEnb1mwhV006rU/f1TYOIJ0kNMsGUtUmhghdr4Ro9BT
         XA5vVuU/SqOgOXz8oemR2TRCGZTr30zMKI7bKP7trHSer0wiVWqXVJmzus4eCSy7bsBW
         R/xklcvP9ddTzSSjqnR/ybfbzJXjSd8AlH9jgo9oRZuCLlXTAdOZHjcLBTRgPciYo+UN
         NDzsOdAvH89khiA2Zkg9CC/yF2A0NMmGDSYaUz3QCOSyQ/Zn/EDZBCBHqUogltZ0P2ip
         IW8317jb7UH5kW0TLHeo7ibPefW+N30hVt7pGbG7ruzpZNmjTSEc/wjAnh0rtWtOF4Ye
         nxAg==
X-Forwarded-Encrypted: i=1; AKwUvBxoyEzDUQFI3oWMncNt9wy54AbFDcnfolMHngLton6rT6s8kCkZ5O5vF9HOUD+DJZ7QIOvbqGzylQYfIUY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIoZnFokH3ggB/rwAgUtiWa9DGB38L7Xs1JEOZpU6Bji7VjKIPO
	r/DZPsiOXIlnTX5LY5DtIezhjGAqz8MSimusLLfu5zp/Q4Eifxy4UyMeOIZtGjupOA2Ltd106HO
	jwOz1WI7odmk3yQ==
X-Received: from edfz6.prod.google.com ([2002:a05:6402:a406:b0:6aa:1383:f342])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:538b:b0:6aa:fc60:60d0 with SMTP id 4fb4d7f45d1cf-6aafc606c77mr6303087a12.33.1790617309305;
 Mon, 28 Sep 2026 10:41:49 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:09 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-3-smostafa@google.com>
Subject: [RFC PATCH 02/15] fork: Don't assume fully populated stack during reuse
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
	David Stevens <stevensd@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

From: David Stevens <stevensd@google.com>

In preparation for partially populated kernel stacks, don't assume
that vm_area->nr_pages matches THREAD_SIZE when clearing a stack
for reuse.
Note that the VA range is still THREAD_SIZE in that case but it
might not be fully allocated.

Signed-off-by: David Stevens <stevensd@google.com>
[Resolve conflict and updated commit msg]
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 kernel/fork.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 2065693e762c..ec4431bf309a 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -335,11 +335,16 @@ static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 
 	vm_area = alloc_thread_stack_node_from_cache(tsk, node);
 	if (vm_area) {
+		unsigned long offset = 0;
+
 		if (memcg_charge_kernel_stack(vm_area)) {
 			vfree(vm_area->addr);
 			return -ENOMEM;
 		}
 
+		if (!IS_ENABLED(CONFIG_STACK_GROWSUP))
+			offset = THREAD_SIZE - vm_area->nr_pages * PAGE_SIZE;
+
 		/* Reset stack metadata. */
 		if (!kasan_hw_tags_enabled())
 			kasan_unpoison_range(vm_area->addr, THREAD_SIZE);
@@ -347,7 +352,7 @@ static int alloc_thread_stack_node(struct task_struct *tsk, int node)
 		stack = kasan_reset_tag(vm_area->addr);
 
 		/* Clear stale pointers from reused stack. */
-		clear_pages(vm_area->addr, vm_area->nr_pages);
+		clear_pages(vm_area->addr + offset, vm_area->nr_pages);
 
 		tsk->stack_vm_area = vm_area;
 		tsk->stack = stack;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

