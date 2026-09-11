Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAA63EE1FD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789098072; cv=none; b=Olc+eKLNlL2FxLsgD8CnMrHmqkcdi288PIcyzLedb7kbH/hRR2RJAaiJgKSvg5WNl9gnYBL75OOGP6UbjSJQnA3U6o7YG4K9Ba0LkNBxwlEoNuQP/+D0/VQuXnS4bX6D6g61AZmhsJOSh0PlZw66QrW9lc698pBbq+PajnUzmD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789098072; c=relaxed/simple;
	bh=sHzRETS9PiweXRrgLV9bDFaHahGUpuvqfaDfXNBZXnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYd1SMmH+bAsuWlu8i7hN5nmMWL+VpT0yfJ9iUkRLnPxp9hh+RTdEH/3YOqiekL5dNjh3K+AlLavcTjqpzTXycx1UAOf4HsWBl4IyNUd2YbMNknafQRVQvsJiJJlKDIvZxtrZWdXN5s8JxL32aYUNOAXrDBIRz5dabXaR7m9LDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Epl4KKc3; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Epl4KKc3"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso445237a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789098070; x=1789702870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uimiES6hPReHTTa4bHIqRbXrOxmMJ+VmsCD/x7Fg6Is=;
        b=Epl4KKc3TtsGdeIXHqtJntDjpZLj0YiuAmLwP99i7X/c2IXE75QTQ1U4YBmyzbely8
         E0lscgtjST0Co87lDyqvqDbljdSTJzk99NW1Y6MHZ1WspYkzs/0DtBbvE5uV6qspFxtM
         HS78oa9IpjvkXWwm38VXySqJWWj/cJG3gBhPepWDzDPbBzIw3OIFXnncI2qliWHhvrni
         ns+vopE9CyfO92EIRkwRmSUrU3NAo5g5LMBXXGJoorJpn0jHtRSzDSXcry6g70Fwe+cV
         BNnh7nz8CM4jI23+W9m31Nk+M/rhWjcQOvo3NBM/zDLWCB9aotlClQ6/RNA21P8UTSpp
         DNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789098070; x=1789702870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uimiES6hPReHTTa4bHIqRbXrOxmMJ+VmsCD/x7Fg6Is=;
        b=qFd/FBp9Ut+gaTGgl/n/Me3hUq21hAAMGRTZapePcE5u58m7NPgbP7mKsqSe1oGZRf
         Q9ovfqkxbye2rEvZpuIhzwZGhMHxWFK8rXIBUfVqwuJ4BLRwaLBFp+ekPV2TQcDjsqZJ
         PhdvNELQh50QlPKblgXniJEnqZqKCeRGiBA9cWAP/c9GS3RL1GN2El+RKMG4dGOgu71E
         E4sVCf1tPBn7WY7fEAoWycT1mIFao+S7oQ7Uk5VlcQoi4BVFiOImygBsxo4XKZPIK7kX
         0tNaAZzl/aSvRAFQXdgKbNAQicAqKCjA43NrgeaHG7AO7m6AtvV3fG690DCa2iVOHC+M
         0+lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMwOr2W9Rdh1ruQWGyfwUtlrryQ9d+b3kf21oqyg1xhi/QUfma1p8Rfd+teSD6WeIK/flquod4ry1LqXc=@vger.kernel.org
X-Gm-Message-State: AFuF++kI5c+3d0+CbdzHLBuulN9BB083EMDoDM4mesjVYwoj9Y4aEKTA
	MLSaJtF0SgToZNkVUusvW89NWRZUNogCnoVBZ1m7smmnYKDANbbsQ9qJ
X-Gm-Gg: AYBFou2sB9X8SM7ar0Twa4cxvV8jjG2sDfiRMXC8S4WmV+nYR/aX6hEOAoJJJeaFwU1
	SmiigJ/dtQr06uNB454v+0uNHepYpJZdvN2eWVmss7Pdc4jqlOGcqn7uZ4eMQtb9EqxhnAN+OqT
	o8utCHIESaNtToAKIO6TJU0i0+rr6A7ctDb2I1gDIuiXUS6fRmCD895rTX4DvG0wZqga6qCZcJY
	tQkHJ9nQ7PTUwxKFlIsgQZEaBmKcsjsU14fdDm7VdXHnk/M6L4gc6v5hgFdGa9bHz0U5KGFDNE1
	qWfDazPr8hikDG+FSD+/rtwbIX0xGoDNxFKHIVhNKwVlG6Pc5vWhZ4hRGHdPsSEQNU6Fd6CtrVA
	U55m1+y/9VAzj4Igt6yE88g1XOADThBpe3lg2KRay2x0HoJQ1s48rUiPwja38omwa4qkE+NnBy6
	cVCptPfmQKy1gPmQvEPwwWVsUa5BxllHPzqwiQVDF12HV6mTR2W5CHdqWnUBCQv73i5FForBd8G
	iXbad5WHAWDVwBZeHVNQSs6vkE17FJTyWbpq5VZqiHdifLbVJbftaFSPzYfFFNWf8qC08Vos0O4
	fhU0OuEMPiIyc4loioGPgzbAeXaJ0A1AoRXOPC3/66zk48oqYKOfdAlAC0QbloY=
X-Received: by 2002:a17:90b:134f:b0:399:1b08:28de with SMTP id 98e67ed59e1d1-39d9beb0be4mr3669832a91.7.1789098069618;
        Thu, 10 Sep 2026 20:41:09 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9afa367bsm558148a91.0.2026.09.10.20.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 20:41:09 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: paulmck@kernel.org,
	urezki@gmail.com,
	harry@kernel.org
Cc: frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	boqun@kernel.org,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	surenb@google.com,
	vbabka@kernel.org,
	rcu@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/1] rcu: make userspace barrier hook drain kvfree_rcu work
Date: Fri, 11 Sep 2026 11:40:59 +0800
Message-ID: <20260911034059.3569914-2-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911034059.3569914-1-matthias.goergens@gmail.com>
References: <6092a9d0-0125-4da4-ac48-85ccaeb83beb@paulmck-laptop>
 <20260911034059.3569914-1-matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

The bcachefs ktest allocation-leak check writes rcutree.do_rcu_barrier
before reading /proc/allocinfo. While testing bcachefs performance
changes, small objects released with kfree_rcu() remained visible after
repeated writes to the hook and 20 seconds of waiting, causing otherwise
clean tests to fail their leak check.

The test assumes a stronger contract than the hook currently documents:
rcu_barrier() waits for ordinary callbacks, but does not flush objects
still held in kfree_rcu() batching or per-CPU SLUB sheaves. The retained
population eventually fell as a sheaf filled; there is no evidence here
of unbounded growth or OOM.

Changing the hook to drain kvfree_rcu() work let the same unmodified
bcachefs workload pass its allocation check. All eight checkpoints in
one VM, after 50 through 400 option changes, reported zero retained
reconcile_scan objects. This motivated the separate private-cache test
used to isolate the incomplete drain from bcachefs.

Calling kvfree_rcu_barrier() from rcu_barrier_throttled() was proposed
when kvfree_rcu_barrier() was added in 2024, to restore a clean baseline
between userspace benchmark runs. The discussion concluded that keeping
the existing hook name, adding the second operation and documenting both
was the safest compatibility choice, but the follow-up was not added.

Add that drain and document the stronger test interface. Always retain
the existing start-rate limit and perform the kvfree_rcu() drain: an
unrelated ordinary barrier does not establish that this work completed.

Retain the entry ordinary-barrier sequence snapshot. After draining,
skip the final ordinary barrier only if that snapshot is complete,
preserving the memory barrier on the completion path. Otherwise, invoke
rcu_barrier() explicitly. This keeps the ordinary-callback guarantee
independent of whether kvfree_rcu_barrier() embeds an ordinary barrier.

Clarify that the documented completion guarantee covers work queued
before the request, without preventing new work from being queued.

Earlier validation of the unconditional-drain version used four fresh
VM pairs with a private-cache fixture: controls retained the queued
object (60 to 60 active objects), and treatments drained it (60 to 59).
An ordinary-callback test passed on both kernels. Those runs predated
the guarded skip and do not validate that change. No elapsed-time
improvement is claimed.

Link: https://lore.kernel.org/all/20240820155935.1167988-1-urezki@gmail.com/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  9 ++++--
 kernel/rcu/tree.c                             | 30 ++++++++++++-------
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd2..914b65ae9413 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5699,9 +5699,12 @@ Kernel parameters
 			there is an ongoing too-long CSD-lock wait.
 
 	rcutree.do_rcu_barrier=	[KNL]
-			Request a call to rcu_barrier().  This is
-			throttled so that userspace tests can safely
-			hammer on the sysfs variable if they so choose.
+			Wait for deferred kfree_rcu() frees and ordinary
+			call_rcu() callbacks queued before this request to
+			complete.  This does not prevent new work from being
+			queued concurrently.  Requests are throttled so that
+			userspace tests can safely hammer on the sysfs
+			variable if they so choose.
 			If triggered before the RCU grace-period machinery
 			is fully active, this will error out with EAGAIN.
 
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 96848fc1f02b..93b71682306c 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -3989,12 +3989,12 @@ EXPORT_SYMBOL_GPL(rcu_barrier);
 static unsigned long rcu_barrier_last_throttle;
 
 /**
- * rcu_barrier_throttled - Do rcu_barrier(), but limit to one per second
+ * rcu_barrier_throttled - Drain deferred RCU frees, but rate-limit starts
  *
- * This can be thought of as guard rails around rcu_barrier() that
- * permits unrestricted userspace use, at least assuming the hardware's
- * try_cmpxchg() is robust.  There will be at most one call per second to
- * rcu_barrier() system-wide from use of this function, which means that
+ * This can be thought of as guard rails around the deferred-free barriers
+ * that permit unrestricted userspace use, at least assuming the hardware's
+ * try_cmpxchg() is robust.  There will be at most one drain operation started
+ * per sixteenth of a second from use of this function, which means that
  * callers might needlessly wait a second or three.
  *
  * This is intended for use by test suites to avoid OOM by flushing RCU
@@ -4016,14 +4016,24 @@ static void rcu_barrier_throttled(void)
 	while (time_in_range(j, old, old + HZ / 16) ||
 	       !try_cmpxchg(&rcu_barrier_last_throttle, &old, j)) {
 		schedule_timeout_idle(HZ / 16);
-		if (rcu_seq_done(&rcu_state.barrier_sequence, s)) {
-			smp_mb(); /* caller's subsequent code after above check. */
-			return;
-		}
 		j = jiffies;
 		old = READ_ONCE(rcu_barrier_last_throttle);
 	}
-	rcu_barrier();
+	/*
+	 * kfree_rcu() can retain objects outside the ordinary callback lists in
+	 * per-CPU SLUB sheaves and kvfree_rcu batches.  Always drain those queues:
+	 * an ordinary barrier does not establish that this work was drained.
+	 */
+	kvfree_rcu_barrier();
+	/*
+	 * A completed barrier can still cover ordinary callbacks queued before
+	 * our entry snapshot.  Otherwise, retain an explicit ordinary barrier
+	 * without depending on the implementation of kvfree_rcu_barrier().
+	 */
+	if (rcu_seq_done(&rcu_state.barrier_sequence, s))
+		smp_mb(); /* caller's subsequent code after above check. */
+	else
+		rcu_barrier();
 }
 
 /*
-- 
2.55.0

