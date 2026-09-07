Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6F4448393
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770518; cv=none; b=kga6qV9thUMvZnwhFbUlf86HOysTCPjpA2amut/iaQAVdPL7bqmp6Mkq5dyb4qsrNGZbfKlmvLmxHijGLz7XP+Q7Ew6qfHEm4tsXxrcPw4iCK7Opf20Rb/4uul3hg57FSNOV5L0Nei2tQ0/ayZ43fwra533sYam2gr9IDlW1KdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770518; c=relaxed/simple;
	bh=1Q8spIejnM4aGTTfmyL4NK5XSVAAY4GV1tixC+PV06A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tyq8K9VIJJZdQFCUrchbNFrw8Abb2eolbIQdArJsDuuaLIkjdfswcZUd/HTR9ApFsAOlaaOO3WpASNCAF//KONLkPbwl4lXdnSPx6IfKM8pkiBCik9SdBdxEBoJnj/BJGgsUa1m/ucGBnuCWrUqtsifQthHVBN51yyv/AemTkH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cx09ho72; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cx09ho72"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-485850cf499so2023551f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770514; x=1789375314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6oF/RHZsuGRU+WdOikxDPvBXvsmcgSMqlQfNLaHuEiM=;
        b=Cx09ho72iiMvtYIRR/4OekbHd0aUxrBzw5ueuJbuzFazBLC8CCOozHdgbynR9Cm1bB
         rOlCidBoYMLw9fFSFNdkQphFoLdqjJNrINwlAohwohPWZpa4Kv6rGgaeD6TjXUFWPGFe
         XfdIdG6n5QyMXqH9GFT+7gqAqr2Kbv7WOX0osE9LZzBP/ATFwZBk4/qUE0pNXcEmOnZ0
         07SD+U3ouJ8UrqYLxr96qHMlPuHF8AF8nSccE+UnY7LklB6x6s2LxRYIdXSpuwh1q7/5
         FpCrp1HdfS7ZbjUYIXa+lgIu+yli9qVJHfFeo6cbp2depvBMVOk7tNBla8gF9qMhHYn9
         ytcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770514; x=1789375314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6oF/RHZsuGRU+WdOikxDPvBXvsmcgSMqlQfNLaHuEiM=;
        b=QehsPgeoF9IFlYOxrE14ss3FLLf6PcJpldT+Pj9IcbBvNpc6MkxWVsuKZYipNzuRof
         EeqsnNYErV2Wekne9cXV4YEqdPcTpVX60vLzSIvhYNSsahZSZfiAR1IMxNOkNKNkMcGh
         XEaQZrAjEuZEadjQO/ippV3YeWlYMaPKjlWcpPHPWdZkXVehJnnrbfA3yRfZIOCq/6Q4
         WFre+zAfNYgQ6lPDCD6MSJkX4fK1F1hJegMiemYEuOxChdEQxhA3ybFL9VcQXLHHm+Fc
         3JjYkajD0CV5ox5aEPeOFUYPBKPeUE9+fqYsDvMQe6IZ/7PaRZKglu6+/KYe32e5pLfG
         6mcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdNLKfuiDN3qcJy7xxFCXirGhp3htc752uvBp524Bn5AKUZtNxjsg2GVEV7wOZqJM/jMD8OTf0vzB9lvM=@vger.kernel.org
X-Gm-Message-State: AFuF++mvkmvX66gW4Vq2iVMn1mgpKVTz9X51pEJS1oueJLlKHm1JUmnK
	Nl7gX7rX7o/FhZ91eU5EuCG8cOwqOM7O82rduFCVA1S3Qamy9Gycfz3aSiU+GEmC
X-Gm-Gg: AYBFou1cp32cZLw1Vb3Eiw8ZOCi20JlzmJxcjkdEAGbpVnf7BShv8jNRkQ3yuYPq81B
	fMGhQE+Aj8Rx2GjoxUhRZSpP41eHrJcUFXL9Tltt08Ey1SN5ycEtbOkMmWcKCYtjDhk70/S5gZX
	Rt6WtEhF+Yd+0Kd/It2jNcJft1xs35haqdQzZyG5NCSwdbWLYN76hBFjCBUKVi2nSwZS7M5v2kQ
	yE0+NrwassmCWwulQQpuwTbKr0pzXqbtsBuvfh/im8FJhKB9hRVPuo8Oet1/k24wmB+Jgvq9F64
	9Dtb+SNzTkNFZv5u62NYoB+gnCzJGEUkmqC1Eo79VT2kgeGS5LD97NSpR5P6uZ0brqFB23AOzpC
	ndV4YU9+axkF8JEKjKy63lVpdBmMTHs51mnkASPejb0QMmI66EJy84HQqedtlF8z77m4uqJV/PC
	70549Mjmu4769pMpE7QZMEplRJcpIZJjNXKZG/ypn7AuMCMj7JYBJnBbpVv2ZEZq1NYw2CS8gIf
	Eom7e+Glc2nxwC/ZaS9AXxDPd64AAeGetZ/Pcnz0LoGpoxpmtd0IBuJ
X-Received: by 2002:a05:6000:2311:b0:484:42d5:e6d5 with SMTP id ffacd0b85a97d-48587094b12mr22290563f8f.11.1788770514133;
        Mon, 07 Sep 2026 01:41:54 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm27883762f8f.30.2026.09.07.01.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:41:53 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v4 next 4/9] locking/osq_lock: Delete 'fast path' code from osq_unlock()
Date: Mon,  7 Sep 2026 09:41:28 +0100
Message-Id: <20260907084133.3696-5-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907084133.3696-1-david.laight.linux@gmail.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'fast path' code in osq_unlock() is pretty much exactly the same as
the first pass of the loop in osq_wait_next() except that it doesn't
have the optimisation to avoid the locked RMW when not the tail of
the list.
So just call osq_wait_next().

Move the assignment next->prev_cpu = old_cpu into osq_wait_next()
as it is always the next line.
Rename osq_wait_next() to osq_unlink_from_next() since that is what is does.

Change osq_wait_next() to use atomic_cmpxchg_release() (not _acquire)
on lock->tail.
This is what osq_unlock() did and seems right to me.

Add an smp_wmb() before the 'prev->next = next' assignment when cancelling
a lock. The previous 'next->prev = prev' assignment lets the 'prev' cpu
complete an unlocking sequence and do its 'next->prev = prev' assignment
first - corrupting the list.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 kernel/locking/osq_lock.c | 140 ++++++++++++++++++++------------------
 1 file changed, 73 insertions(+), 67 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index 23f00c670507..f39f77c3a07d 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -57,52 +57,67 @@ static inline struct optimistic_spin_node *decode_cpu(int encoded_cpu_val)
 }
 
 /*
- * Get a stable @node->next pointer, either for unlock() or unqueue() purposes.
- * Can return NULL in case we were the last queued and we updated @lock instead.
+ * Unlink the current cpu's node from the lock's node->prev list.
  *
- * If osq_lock() is being cancelled there must be a previous node
- * and 'old_cpu' is its CPU #.
- * For osq_unlock() there is never a previous node and old_cpu is
- * set to OSQ_UNLOCKED_VAL.
+ * More specifically atomically write its node->prev over the link that
+ * currently points to node.
+ * This is either:
+ *    lock->tail = node->prev
+ * or:
+ *    node->next->prev = node->prev
+ * The first is a simple cmpxchg(), the second is protected against
+ * node->next trying to unlink itself (after need_resched() is set) by using
+ * an xchg() on node->next that sets it to NULL.
+ *
+ * When a lock request is being cancelled the caller needs 'next' to
+ * set node->prev->next = next.
  */
 static inline struct optimistic_spin_node *
-osq_wait_next(struct optimistic_spin_queue *lock,
-	      struct optimistic_spin_node *node,
-	      int old_cpu)
+osq_unlink_from_next(struct optimistic_spin_queue *lock, int prev)
 {
 	int curr = encode_cpu(smp_processor_id());
+	struct optimistic_spin_node *node, *next;
 
 	for (;;) {
-		if (atomic_read(&lock->tail) == curr &&
-		    atomic_cmpxchg_acquire(&lock->tail, curr, old_cpu) == curr) {
+		int tail = atomic_read(&lock->tail);
+		if (curr == tail &&
+		    atomic_try_cmpxchg_release(&lock->tail, &tail, prev)) {
 			/*
-			 * We were the last queued, we moved @lock back. @prev
-			 * will now observe @lock and will complete its
-			 * unlock()/unqueue().
+			 * We were the last queued, lock->tail now references
+			 * prev (or is 0 if the list is now empty).
+			 * If prev was spinning in this loop it can continue.
 			 */
 			return NULL;
 		}
 
+		node = this_cpu_ptr(&osq_node);
+
 		/*
-		 * We must xchg() the @node->next value, because if we were to
-		 * leave it in, a concurrent unlock()/unqueue() from
-		 * @node->next might complete Step-A and think its @prev is
-		 * still valid.
+		 * We must xchg() the @node->next value to ensure that a
+		 * concurrent unqueue() from @node->next will find an invalid
+		 * @prev value (node_next->prev->next != node_next).
 		 *
-		 * If the concurrent unlock()/unqueue() wins the race, we'll
-		 * wait for either @lock to point to us, through its Step-B, or
-		 * wait for a new @node->next from its Step-C.
+		 * If @node->next is already NULL then we need to wait until
+		 * the concurrent unqueue completes.
 		 */
 		if (node->next) {
-			struct optimistic_spin_node *next;
-
 			next = xchg(&node->next, NULL);
 			if (next)
-				return next;
+				break;
 		}
 
 		cpu_relax();
 	}
+
+	/*
+	 * When called from osq_unlock() prev is zero and this hands
+	 * over the lock ownership.
+	 * When called while unqueueing in osq_lock() this completes the
+	 * backwards link, the forwards link is done by the caller.
+	 */
+	WRITE_ONCE(next->prev, prev);
+
+	return next;
 }
 
 bool osq_lock(struct optimistic_spin_queue *lock)
@@ -130,7 +145,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	/*
 	 * osq_lock()			unqueue
 	 *
-	 * node->prev = prev		osq_wait_next()
+	 * node->prev = prev		osq_unlink_from_next()
 	 * WMB				MB
 	 * prev->next = node		next->prev = prev // unqueue-C
 	 *
@@ -160,8 +175,6 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 				     vcpu_is_preempted(VAL - 1));
 
 	/*
-	 * Step - A
-	 *
 	 * Loop until either node->prev is zero (lock acquired) or we
 	 * atomically change prev->next from node to NULL (stopping prev
 	 * handing on the lock).
@@ -191,59 +204,52 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 
 	/*
 	 * If 'prev' tries to remove itself from the list before we write
-	 * a new value to prev->next it will spin in osq_wait_next().
+	 * a new value to prev->next it will spin in osq_unlink_from_next().
+	 * This means we can no longer be given the lock and always
+	 * return false.
 	 */
 
-	/* Invalidate prev_cpu matching osq_unlock() */
+	/*
+	 * Invalidate prev matching osq_unlock().
+	 * This isn't necessary but ensures that both unlocked and fast-path
+	 * locked nodes (where the initial xchg() returned 0) have prev set
+	 * to zero.
+	 * If nothing else it lets the lock chain be followed from lock->tail
+	 * whch may help diagnostics.
+	 */
 	node->prev = 0;
 
 	/*
-	 * Step - B -- stabilize @next
-	 *
-	 * Similar to unlock(), wait for @node->next or move @lock from @node
-	 * back to @prev.
+	 * Now that the linkage to prev cannot change underneath us
+	 * remove ourselves from the node->prev list.
+	 * This does:
+	 * (node->next ? node->next->prev : lock->tail) = node->prev
 	 */
-
-	next = osq_wait_next(lock, node, prev);
-	if (!next)
-		return false;
+	next = osq_unlink_from_next(lock, prev);
 
 	/*
-	 * Step - C -- unlink
-	 *
-	 * @prev is stable because its still waiting for a new @prev->next
-	 * pointer, @next is stable because our @node->next pointer is NULL and
-	 * it will wait in Step-A.
+	 * Finally mend the node->next list that was 'broken' to
+	 * stop node->prev trying to unlink from us.
+	 * If next is NULL then lock->tail is prev_ptr and another node
+	 * can be added - so we must not re-write the NULL.
 	 */
-
-	WRITE_ONCE(next->prev, prev);
-	WRITE_ONCE(prev_ptr->next, next);
+	if (next) {
+		/*
+		 * This must happen after the write to node->next->prev.
+		 * If swapped then prev could unlink itself before our
+		 * write to node->next->prev and the the wrong value would
+		 * end up in node->next->prev.
+		 * Probably can't actually happen due to re-ordering of writes,
+		 * but could happen without a compiler barrier.
+		 */
+		smp_wmb();
+		WRITE_ONCE(prev_ptr->next, next);
+	}
 
 	return false;
 }
 
 void osq_unlock(struct optimistic_spin_queue *lock)
 {
-	struct optimistic_spin_node *node, *next;
-	int curr = encode_cpu(smp_processor_id());
-
-	/*
-	 * Fast path for the uncontended case.
-	 */
-	if (atomic_try_cmpxchg_release(&lock->tail, &curr, OSQ_UNLOCKED_VAL))
-		return;
-
-	/*
-	 * Second most likely case.
-	 */
-	node = this_cpu_ptr(&osq_node);
-	next = xchg(&node->next, NULL);
-	if (next) {
-		WRITE_ONCE(next->prev, 0);
-		return;
-	}
-
-	next = osq_wait_next(lock, node, OSQ_UNLOCKED_VAL);
-	if (next)
-		WRITE_ONCE(next->prev, 0);
+	osq_unlink_from_next(lock, OSQ_UNLOCKED_VAL);
 }
-- 
2.39.5

