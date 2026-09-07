Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEFC449B21
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770522; cv=none; b=i5vi4HOVkhNosF3tHK6qLIxqt9FJ9daqW7X6fB9yFH9jzNsxy0Kkf6MwT95jW7X7q2bMImf6wjkV/qIVTgAmv38RqM9FJdMQuLQjM8gN79dAAmYfJBps2jcYxbp7V/MDHX5ciFp8/SpsOuYSnhUW3jftloSUbYcBB0muooVQjP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770522; c=relaxed/simple;
	bh=dYg9aLSnApFgnIWYTGR8etCGK0yBPIva5TopG4FWNyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bKjjd2gGfcdZI7he6Pw5+TJ7HE83IiYfLIbBDi0iUekvunwq9x/x44s65VDbZL8gz1sX3h85IRMFeR0eUE+ST9q8CVZax2xuaD1j+feoUcQDtZJ2GOolwfxr+KKMzNweBxpJi+W0G5vP2YYYwzOr0RMJxKYwTGzZaB7MuUTV8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDB4IGO0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDB4IGO0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-482e257a23aso2240119f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770518; x=1789375318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fS4AFVoVfQm6rlehNhZyNvIrVZ1gzCjIRTDz5TvulTE=;
        b=IDB4IGO09610dIGOmpw//zotOFcswjyEMolSPP+vYKyt8os+hKo13nkUM4/QXoCd3A
         55PqxG2LdD9Vm+wN6n2ascW1/7Alv8qOMjA3JuK5W6NvF00mVvvotMRfjixVrCWh/fcY
         xANPPEhFndWkCGXB4Wj26jhACLL5JN+Kht0q+N3JUv461bf2bu2aMxJ9tL++ikua5vef
         Pq7Regz/VOHEshovxz4B3Dv9ndx4fcbYwkC4RwRYCQGJ34glqFhb8jDvlgPU8jajvguJ
         SsAdU6wE9I4JPt18V6mJbJI5+DS4ZUFXGFUvkiL+l71F2gTxfGzAaApwtsBCTnNpVlcu
         ShxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770518; x=1789375318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fS4AFVoVfQm6rlehNhZyNvIrVZ1gzCjIRTDz5TvulTE=;
        b=h3baLOFYOl0TvjyM1yn/D8p9xqEiv/MIwvdplY+HGYeiL2YEAJWnEbw5PmZqq7rg++
         /mCnVE5UZ9jBGl5NR3NByU5dUp/JOALWdgnHxC8gbWJFJZcK6/8/GF1UIwhsPazyLtsl
         w5iGaUJiuO3kQHw4qy7hpGkmUahSFuLmhfeq25WjsesS049Iq6y5ak4JQZZcfzAwoCxN
         SBcSFbIJbqF2blVBdR5uuZC/NCPDIaZOvcYPRKthLPlDseYqkPKf3r2FJd6v1uhgAqjO
         Q2JeIl/zav9/0LPn6PH//VMdkK5eEQ2Qg+Th3aQrvOc/doDHYoqihDCmAAnydUfqJaX2
         SfgQ==
X-Forwarded-Encrypted: i=1; AKwUvBznBdbfDEhwM0+jyb2/hmmhkIFShdq5sj4pBNqktVR33qMpIBwm9n10+7shPXW8RiBh09ZPsQmcGbgDc1M=@vger.kernel.org
X-Gm-Message-State: AFuF++kZG0ydqWSaDCCAME7rhfIL45zJ4EFREfKc9xpPIcAMRj89l7ot
	1l50RlIAX+bA2A3e+TKqQLjmovypG/TmetH4fLRfscrKQMnuiTaz8rFZVK4Ej51a
X-Gm-Gg: AYBFou0DEh+pxLZv/wZoa3J02szQHg2bkphgNxh2z2AA4GjRRqNf1ycr6i2nzeRjtQA
	GYXi9CRgRyfsT32uscONaKej8Jo/PvN9CCynArL6u47WrS5APfEP4p2gNUlKNc8LO/Gy3MjCSDI
	LNvOBQf9lX/0Ck6ykDVcmGVqIFLuVQOTnYsvkljO3MlcjQuHNhgFNUmuAwVW5JcPDYab3DFZrsy
	/+sCswBmep4yu8N6KP41h3b7UwrIipNvUDrzxmAQwNJ1jF8Uu/PyzEto1Izlt2KT80iMz7xPaxA
	Nf3axd+o5L3dL8if/WzzbU+/ZmmnZ4K4poHmljNLOETdyoZZ2UYPJEkE9EFXEguT00o1EPGIys5
	Hp9RirbJgbjdYRQSvm9XhMk4AknjqR03WmZfMOH2N73T2s2PVP3n47IochBuLTWM3XjtlMkfz8M
	BsbHnSL1CaRLPerfUn9TcguzLh4t7RO/vcUHoJJv+CJq7vVsEwxWjrMw610FT417dB7X+/OSlP4
	VZ1HMHL1dewsnyIlrVQ7/PqegYJcR1sqnDFbM9QUWMzSQ==
X-Received: by 2002:a05:6000:240e:b0:485:8de9:4b85 with SMTP id ffacd0b85a97d-4858de94e2emr16063005f8f.0.1788770517514;
        Mon, 07 Sep 2026 01:41:57 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm27883762f8f.30.2026.09.07.01.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:41:57 -0700 (PDT)
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
Subject: [PATCH v4 next 9/9] locking/osq_lock: Swap next<->prev and tail<->head
Date: Mon,  7 Sep 2026 09:41:33 +0100
Message-Id: <20260907084133.3696-10-david.laight.linux@gmail.com>
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

I think it is easier to understand this code if you think that cpu
add themselves to the head of the list and the cpu at the tail
owns the lock.
Remember nodes are never removed from the list - they only remove
themselves.

So swap the field names over.

Pretty much all the code has already been changed in this series
so it doesn't make that much difference to the overall lines changed.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/osq_lock.h  |   8 +-
 kernel/locking/osq_lock.c | 165 +++++++++++++++++++-------------------
 2 files changed, 86 insertions(+), 87 deletions(-)

diff --git a/include/linux/osq_lock.h b/include/linux/osq_lock.h
index 9e637e265189..d471f3ab4238 100644
--- a/include/linux/osq_lock.h
+++ b/include/linux/osq_lock.h
@@ -9,10 +9,10 @@
 
 struct optimistic_spin_queue {
 	/*
-	 * Stores an encoded value of the CPU # of the tail node in the queue.
+	 * Stores an encoded value of the CPU # of the head node in the queue.
 	 * If the queue is empty, then it's set to OSQ_UNLOCKED_VAL.
 	 */
-	unsigned int tail;
+	unsigned int head;
 };
 
 #define OSQ_UNLOCKED_VAL (0)
@@ -22,7 +22,7 @@ struct optimistic_spin_queue {
 
 static inline void osq_lock_init(struct optimistic_spin_queue *lock)
 {
-	WRITE_ONCE(lock->tail, OSQ_UNLOCKED_VAL);
+	WRITE_ONCE(lock->head, OSQ_UNLOCKED_VAL);
 }
 
 extern bool osq_lock(struct optimistic_spin_queue *lock);
@@ -30,7 +30,7 @@ extern void osq_unlock(struct optimistic_spin_queue *lock);
 
 static inline bool osq_is_locked(struct optimistic_spin_queue *lock)
 {
-	return READ_ONCE(lock->tail) != OSQ_UNLOCKED_VAL;
+	return READ_ONCE(lock->head) != OSQ_UNLOCKED_VAL;
 }
 
 #endif
diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index 8dfd729d1a81..8dd01fee80bf 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -17,25 +17,24 @@
  * spinning.
  *
  * The osq_nodes for the spinning CPU are put on a double-linked (non circular)
- * list. The list 'pointers' can either be the address of the osq_node or the
- * associated CPU number, the CPU numbers are offset by one so that zero can
- * be used like a NULL ponter.
- * The mutex/rwsem contains a pointer (CPU number) to the tail of the list.
- * There is no equivalent pointer to the list head - the 'head' is the
- * osq_node of the CPU that acquired the osq lock.
+ * list similar to an hlist.
+ * The list 'pointers' are the CPU numbers (offset by one so that zero can
+ * be used like a NULL ponter).
+ * Waiting cpu are added to the head of the list, the tail of the list is
+ * the osq_node of the CPU that acquired the osq lock.
  *
- * The 'next' pointer of the tail must be zero, all the other 'next' pointers
+ * The 'prev' pointer of the head must be zero, all the other 'prev' pointers
  * must either be valid or transiently zero.
- * The 'prev' pointer is zero unless the node is waiting for the lock, when
- * waiting it may refer to the wrong node (node->prev->next != node).
- * The 'prev' value is only needed for the node->prev->next = node->next update
- * when 'node' is being removed. Atomically checking node->prev->next == node
+ * The 'next' pointer is zero unless the node is waiting for the lock, when
+ * waiting it may refer to the wrong node (node->next->prev != node).
+ * The 'next' value is only needed for the node->next->prev = node->prev update
+ * when 'node' is being removed. Atomically checking node->next->prev == node
  * ensures the list doesn't get corrupted.
  */
 
 struct optimistic_spin_node {
-	unsigned int next; /* CPU number offset by 1, 0 if no next */
-	unsigned int prev; /* CPU number offset by 1, 0 if lock held */
+	unsigned int next; /* CPU number offset by 1, 0 if lock held */
+	unsigned int prev; /* CPU number offset by 1, 0 if no prev */
 } __aligned(8);
 
 static DEFINE_PER_CPU(struct optimistic_spin_node, osq_node);
@@ -47,38 +46,38 @@ cpu_spin_node(unsigned int offset_cpu_num)
 }
 
 /*
- * Unlink the current cpu's node from the lock's node->prev list.
+ * Unlink the current cpu's node from the lock's node->next list.
  *
- * More specifically atomically write its node->prev over the link that
+ * More specifically atomically write its node->next over the link that
  * currently points to node.
  * This is either:
- *    lock->tail = node->prev
+ *    lock->head = node->next
  * or:
- *    node->next->prev = node->prev
+ *    node->prev->next = node->next
  * The first is a simple cmpxchg(), the second is protected against
- * node->next trying to unlink itself (after need_resched() is set) by using
- * an xchg() on node->next that sets it to NULL.
+ * node->prev trying to unlink itself (after need_resched() is set) by using
+ * an xchg() on node->prev that sets it to NULL.
  *
- * When a lock request is being cancelled the caller needs 'next' to
- * set node->prev->next = next.
+ * When a lock request is being cancelled the caller needs 'prev' to
+ * set node->next->prev = prev.
  */
 static inline unsigned int
-osq_unlink_from_next(struct optimistic_spin_queue *lock, unsigned int prev)
+osq_unlink_from_prev(struct optimistic_spin_queue *lock, unsigned int next)
 {
 	unsigned int curr = smp_processor_id() + 1;
 	struct optimistic_spin_node *node;
-	unsigned int next;
+	unsigned int prev;
 
 	for (;;) {
-		unsigned int tail = READ_ONCE(lock->tail);
-		if (curr == tail &&
-		    try_cmpxchg_release(&lock->tail, &tail, prev)) {
+		unsigned int head = READ_ONCE(lock->head);
+		if (curr == head &&
+		    try_cmpxchg_release(&lock->head, &head, next)) {
 			/*
-			 * We were the last queued, lock->tail now references
-			 * prev (or is 0 if the list is now empty).
-			 * If prev was spinning in this loop it can continue.
+			 * We were the last queued, lock->head now references
+			 * next (or is 0 if the list is now empty).
+			 * If next was spinning in this loop it can continue.
 			 *
-			 * Since we are the tail of the list, node->next
+			 * Since we are the head of the list, node->prev
 			 * must be zero.
 			 */
 			return 0;
@@ -87,16 +86,16 @@ osq_unlink_from_next(struct optimistic_spin_queue *lock, unsigned int prev)
 		node = this_cpu_ptr(&osq_node);
 
 		/*
-		 * We must xchg() the @node->next value to ensure that a
-		 * concurrent unqueue() from @node->next will find an invalid
-		 * @prev value (node_next->prev->next != node_next).
+		 * We must xchg() the @node->prev value to ensure that a
+		 * concurrent unqueue() from @node->prev will find an invalid
+		 * @next value (node_prev->next->prev != node_prev).
 		 *
-		 * If @node->next is already NULL then we need to wait until
+		 * If @node->prev is already NULL then we need to wait until
 		 * the concurrent unqueue completes.
 		 */
-		if (node->next) {
-			next = xchg(&node->next, 0);
-			if (next)
+		if (node->prev) {
+			prev = xchg(&node->prev, 0);
+			if (prev)
 				break;
 		}
 
@@ -104,52 +103,52 @@ osq_unlink_from_next(struct optimistic_spin_queue *lock, unsigned int prev)
 	}
 
 	/*
-	 * When called from osq_unlock() prev is zero and this hands
+	 * When called from osq_unlock() next is zero and this hands
 	 * over the lock ownership.
 	 * When called while unqueueing in osq_lock() this completes the
 	 * backwards link, the forwards link is done by the caller.
 	 */
-	WRITE_ONCE(cpu_spin_node(next)->prev, prev);
+	WRITE_ONCE(cpu_spin_node(prev)->next, next);
 
-	return next;
+	return prev;
 }
 
 bool osq_lock(struct optimistic_spin_queue *lock)
 {
-	struct optimistic_spin_node *node, *prev_ptr;
+	struct optimistic_spin_node *node, *next_ptr;
 	unsigned int curr = smp_processor_id() + 1;
-	unsigned int next, prev;
+	unsigned int prev, next;
 
 	/*
 	 * We need both ACQUIRE (pairs with corresponding RELEASE in
 	 * unlock() uncontended, or fastpath) and RELEASE (to publish
 	 * the node fields we just initialised) semantics when updating
-	 * the lock tail.
+	 * the lock head.
 	 */
-	prev = xchg(&lock->tail, curr);
-	if (prev == OSQ_UNLOCKED_VAL)
+	next = xchg(&lock->head, curr);
+	if (next == OSQ_UNLOCKED_VAL)
 		return true;
 
 	node = this_cpu_ptr(&osq_node);
-	prev_ptr = cpu_spin_node(prev);
-	node->prev = prev;
+	next_ptr = cpu_spin_node(next);
+	node->next = next;
 
 	/*
 	 * osq_lock()			unqueue
 	 *
-	 * node->prev = prev		osq_unlink_from_next()
+	 * node->next = next		osq_unlink_from_prev()
 	 * WMB				MB
-	 * prev->next = node		next->prev = prev // unqueue-C
+	 * next->prev = node		prev->next = next // unqueue-C
 	 *
-	 * Here 'node->prev' and 'next->prev' are the same variable and we need
+	 * Here 'node->next' and 'prev->next' are the same variable and we need
 	 * to ensure these stores happen in-order to avoid corrupting the list.
 	 */
 	smp_wmb();
 
-	WRITE_ONCE(prev_ptr->next, curr);
+	WRITE_ONCE(next_ptr->prev, curr);
 
 	/*
-	 * Normally @prev is untouchable after the above store; because at that
+	 * Normally @next is untouchable after the above store; because at that
 	 * moment unlock can proceed and wipe the node element from stack.
 	 *
 	 * However, since our nodes are static per-cpu storage, we're
@@ -163,31 +162,31 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * is implemented with a monitor-wait. vcpu_is_preempted() relies on
 	 * polling, be careful.
 	 */
-	prev = smp_cond_load_relaxed(&node->prev, !VAL || need_resched() ||
+	next = smp_cond_load_relaxed(&node->next, !VAL || need_resched() ||
 				     vcpu_is_preempted(VAL - 1));
 
 	/*
-	 * Loop until either node->prev is zero (lock acquired) or we
-	 * atomically change prev->next from node to NULL (stopping prev
+	 * Loop until either node->next is zero (lock acquired) or we
+	 * atomically change next->prev from node to NULL (stopping next
 	 * handing on the lock).
-	 * Note that 'prev' can unlink itself concurrently with this
-	 * test so that prev/prev_ptr can be stale, but since it
+	 * Note that 'next' can unlink itself concurrently with this
+	 * test so that next/next_ptr can be stale, but since it
 	 * is per-cpu data the memory can always be read.
 	 */
 
-	for (;; prev = READ_ONCE(node->prev)) {
-		if (!prev)
+	for (;; next = READ_ONCE(node->next)) {
+		if (!next)
 			/* Lock acquired */
 			return true;
 
-		prev_ptr = cpu_spin_node(prev);
+		next_ptr = cpu_spin_node(next);
 
-		if (data_race(prev_ptr->next) == curr &&
-		    cmpxchg(&prev_ptr->next, curr, 0) == curr)
+		if (data_race(next_ptr->prev) == curr &&
+		    cmpxchg(&next_ptr->prev, curr, 0) == curr)
 			break;
 
 		/*
-		 * 'prev' must have unlinked (or be in the process of unlinking)
+		 * 'next' must have unlinked (or be in the process of unlinking)
 		 * itself from the list.
 		 */
 
@@ -195,47 +194,47 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	}
 
 	/*
-	 * If 'prev' tries to remove itself from the list before we write
-	 * a new value to prev->next it will spin in osq_unlink_from_next().
+	 * If 'next' tries to remove itself from the list before we write
+	 * a new value to next->prev it will spin in osq_unlink_from_prev().
 	 * This means we can no longer be given the lock and always
 	 * return false.
 	 */
 
 	/*
-	 * Invalidate prev matching osq_unlock().
+	 * Invalidate next matching osq_unlock().
 	 * This isn't necessary but ensures that both unlocked and fast-path
-	 * locked nodes (where the initial xchg() returned 0) have prev set
+	 * locked nodes (where the initial xchg() returned 0) have next set
 	 * to zero.
-	 * If nothing else it lets the lock chain be followed from lock->tail
+	 * If nothing else it lets the lock chain be followed from lock->head
 	 * whch may help diagnostics.
 	 */
-	node->prev = 0;
+	node->next = 0;
 
 	/*
-	 * Now that the linkage to prev cannot change underneath us
-	 * remove ourselves from the node->prev list.
+	 * Now that the linkage to next cannot change underneath us
+	 * remove ourselves from the node->next list.
 	 * This does:
-	 * (node->next ? node->next->prev : lock->tail) = node->prev
+	 * (node->prev ? node->prev->next : lock->head) = node->next
 	 */
-	next = osq_unlink_from_next(lock, prev);
+	prev = osq_unlink_from_prev(lock, next);
 
 	/*
-	 * Finally mend the node->next list that was 'broken' to
-	 * stop node->prev trying to unlink from us.
-	 * If next is NULL then lock->tail is prev_ptr and another node
+	 * Finally mend the node->prev list that was 'broken' to
+	 * stop node->next trying to unlink from us.
+	 * If prev is NULL then lock->head is next_ptr and another node
 	 * can be added - so we must not re-write the NULL.
 	 */
-	if (next) {
+	if (prev) {
 		/*
-		 * This must happen after the write to node->next->prev.
-		 * If swapped then prev could unlink itself before our
-		 * write to node->next->prev and the the wrong value would
-		 * end up in node->next->prev.
+		 * This must happen after the write to node->prev->next.
+		 * If swapped then next could unlink itself before our
+		 * write to node->prev->next and the the wrong value would
+		 * end up in node->prev->next.
 		 * Probably can't actually happen due to re-ordering of writes,
 		 * but could happen without a compiler barrier.
 		 */
 		smp_wmb();
-		WRITE_ONCE(prev_ptr->next, next);
+		WRITE_ONCE(next_ptr->prev, prev);
 	}
 
 	return false;
@@ -243,5 +242,5 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 
 void osq_unlock(struct optimistic_spin_queue *lock)
 {
-	osq_unlink_from_next(lock, OSQ_UNLOCKED_VAL);
+	osq_unlink_from_prev(lock, OSQ_UNLOCKED_VAL);
 }
-- 
2.39.5

