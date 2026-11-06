Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960737;
	b=2U7ug94mx3rebKb5I0nir+0mohRadv/jt0N/irWpULxr+Au2ydar+1YK3kZ6wk9+A+Io
	 2SnKgfVhntTWvLehZ0n07DiVvtU7mOZCXcud1auU7hkq3hyzK2YzWJD7/eR6vJ35U93GL
	 cYeY0DftH+7aFoEqhVwR9V0h363tZKk6RIi8rnz6TYekl/2vuaT0FKHAzGByGJVtIRHIZ
	 5shVA4/E2TOf3Fc7+rjdm3X1GOg8uFGI7ViHKzKOR/GxXL9Bj0jwDLY4A6E5vICiUtyzo
	 fq6u9PCpHZB8rRWSZxOFeGd41S5slzjqMsnpxBtx4iM3sCkWo7/C90oGPgLcFpdWw5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960737;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=W36Ct7XJeeUTZkziIpta7QZLeHn6KFxBTRi52tY7fXQ=;
	b=zdtTZ88+rCddMs4i5M21oTl9ZH1F16pG6QowZCDxEHlI1ofTqKBbK7Dud4N99Ped92Aw
	 2TdPuchpZbljmwQGdr3bGvIcQ77JGqr3I9Vq49X4tPVRFxbq4CE/h1PTGDDp+5CS8BZ1a
	 WjWoZubUIrSIw6AZgonwD6+wbIvIDHgj9Z34vL5tjYfB42GNBAs5/0rKAxfL+tVjTD2qT
	 mzby+GM81jGGLAcxcvojYJkjTEDplzo+tdfZwPOR+PFzIps4ytkbnVHtfk7OIRNS5MrG4
	 8NUOk0MECcwEH7hz/fICrgX9dcPlUBvkFvgfRcr3eZZTJgEZ5tnQjlwSfNCnPkcmM5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1bpsPaLq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sg5wRgwp;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43039606A326;
	Fri,  6 Nov 2026 10:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43039606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1bpsPaLq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sg5wRgwp
Date: Fri, 06 Nov 2026 10:25:33 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793960735;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W36Ct7XJeeUTZkziIpta7QZLeHn6KFxBTRi52tY7fXQ=;
	b=1bpsPaLqd5cM4mD4hsaTc2w9GLq5PDjSRlf5uKEto4he1bPTWs30ca+ndpuQt4oVuEQTeM
	mJL15hDcaE6LpQb9mDW8uEgwjckC/JohvxsFt7/tIMMVKVXcro+/0BnfVey3igOa5xvtCS
	dqDwwFf990qxK978rHSenOlx32y/GEOoViHARLpA7ln2oBWpicFOdeHhuhUp7Wnwq8GzcZ
	Pvht2m7sqsXEPuKdpImNOLD1A1qUdQSbsAswTeHwpyNtTEKnDV8k1aNnfnL2SnDNTUQz4U
	sg3PRJlWJC+04h+2SY7iujtwEH/kQYSyxhZ4Btu9b+j06h2Xir6ko5JaP0MCvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793960735;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W36Ct7XJeeUTZkziIpta7QZLeHn6KFxBTRi52tY7fXQ=;
	b=Sg5wRgwpDU8woMOA1+EkjeMZVCqyn+mSbZcpEq1g//zW+eu/m5LjHZoXC3dhJL6coIMvgh
	KqSzNh+u4M8sVmCg==
From: "tip-bot2 for David Laight" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/core] locking/osq: Use CPU number for 'next' pointer
Cc: David Laight <david.laight.linux@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Waiman Long <longman@redhat.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260907084133.3696-7-david.laight.linux@gmail.com>
References: <20260907084133.3696-7-david.laight.linux@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179396073328.1009794.8798304514620219910.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/core branch of tip:

Commit-ID:     8e7c6217be7f8c016975f5b0954f6736b9ac42cf
Gitweb:        https://git.kernel.org/tip/8e7c6217be7f8c016975f5b0954f6736b9a=
c42cf
Author:        David Laight <david.laight.linux@gmail.com>
AuthorDate:    Mon, 07 Sep 2026 09:41:30 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 11:16:24 +01:00

locking/osq: Use CPU number for 'next' pointer

There is only one write done through node->next (setting prev) when
'node' is being removed. So the code can consistently use the CPU
numbers pretty much throughout (this was suggested by Linus a while
back).

This reduces struct optimistic_spin_node to 8 bytes. This is currently
padded out to a cache line which is silly. Change to be __aligned(8) so
that it isn't split between cache lines.

Accesses to 'other CPU' data are very limited and only happen during
the enqueue and dequeue operation.

[ peterz: Rewrote it completely ]

Signed-off-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Waiman Long <longman@redhat.com>
Link: https://patch.msgid.link/20260907084133.3696-7-david.laight.linux@gmail=
.com
---
 kernel/locking/osq_lock.c | 49 ++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index a6c89e5..735bf62 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -13,11 +13,11 @@
  */
=20
 struct optimistic_spin_node {
-	struct optimistic_spin_node *next;
+	int next_cpu; /* CPU number offset by 1 */
 	int prev_cpu; /* CPU number offset by 1 */
-};
+} __aligned(8);
=20
-static DEFINE_PER_CPU_SHARED_ALIGNED(struct optimistic_spin_node, osq_node);
+static DEFINE_PER_CPU(struct optimistic_spin_node, osq_node);
=20
 /*
  * We use the value 0 to represent "no CPU", thus the encoded value
@@ -44,22 +44,21 @@ static inline struct optimistic_spin_node *decode_cpu(int=
 encoded_cpu_val)
  * For osq_unlock() there is never a previous node and old_cpu is
  * set to OSQ_UNLOCKED_VAL.
  */
-static inline struct optimistic_spin_node *
-osq_wait_unlink_next(struct optimistic_spin_queue *lock,
-		     int old_cpu)
+static inline int
+osq_wait_unlink_next(struct optimistic_spin_queue *lock, int old_cpu)
 {
 	struct optimistic_spin_node *next, *node =3D this_cpu_ptr(&osq_node);
-	int curr =3D encode_cpu(smp_processor_id());
+	int next_cpu, node_cpu =3D encode_cpu(smp_processor_id());
=20
 	for (;;) {
-		if (atomic_read(&lock->tail) =3D=3D curr &&
-		    atomic_cmpxchg_release(&lock->tail, curr, old_cpu) =3D=3D curr) {
+		if (atomic_read(&lock->tail) =3D=3D node_cpu &&
+		    atomic_cmpxchg_release(&lock->tail, node_cpu, old_cpu) =3D=3D node_cpu=
) {
 			/*
 			 * We were the last queued, we moved @lock back. @prev
 			 * will now observe @lock and will complete its
 			 * unlock()/unqueue().
 			 */
-			return NULL;
+			return 0;
 		}
=20
 		/*
@@ -72,9 +71,9 @@ osq_wait_unlink_next(struct optimistic_spin_queue *lock,
 		 * wait for either @lock to point to us, through its Step-B, or
 		 * wait for a new @node->next from its Step-C.
 		 */
-		if (node->next) {
-			next =3D xchg(&node->next, NULL);
-			if (next)
+		if (node->next_cpu) {
+			next_cpu =3D xchg(&node->next_cpu, 0);
+			if (next_cpu)
 				break;
 		}
=20
@@ -84,16 +83,16 @@ osq_wait_unlink_next(struct optimistic_spin_queue *lock,
 	/*
 	 * Unlink @node from @next.
 	 */
+	next =3D decode_cpu(next_cpu);
 	WRITE_ONCE(next->prev_cpu, old_cpu);
-	return next;
+	return next_cpu;
 }
=20
 /*
  * Set prev->next; this is the counterpart of osq_wait_unlink_next() in that
  * by setting ->next the wait is terminated and progress is resumed.
  */
-static inline void osq_link_next(struct optimistic_spin_node *prev,
-				 struct optimistic_spin_node *next)
+static inline void osq_link_next(struct optimistic_spin_node *prev, int next=
_cpu)
 {
 	/*
 	 * Suppose:
@@ -128,17 +127,17 @@ static inline void osq_link_next(struct optimistic_spin=
_node *prev,
 	 *
 	 * Which would result in list corruption.
 	 */
-	smp_store_release(&prev->next, next);
+	smp_store_release(&prev->next_cpu, next_cpu);
 }
=20
 bool osq_lock(struct optimistic_spin_queue *lock)
 {
 	struct optimistic_spin_node *node =3D this_cpu_ptr(&osq_node);
-	struct optimistic_spin_node *prev, *next;
-	int curr =3D encode_cpu(smp_processor_id());
-	int prev_cpu;
+	int node_cpu =3D encode_cpu(smp_processor_id());
+	struct optimistic_spin_node *prev;
+	int prev_cpu, next_cpu;
=20
-	node->next =3D NULL;
+	node->next_cpu =3D 0;
=20
 	/*
 	 * We need both ACQUIRE (pairs with corresponding RELEASE in
@@ -146,13 +145,13 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * the node fields we just initialised) semantics when updating
 	 * the lock tail.
 	 */
-	prev_cpu =3D atomic_xchg(&lock->tail, curr);
+	prev_cpu =3D atomic_xchg(&lock->tail, node_cpu);
 	if (prev_cpu =3D=3D OSQ_UNLOCKED_VAL)
 		return true;
=20
 	prev =3D decode_cpu(prev_cpu);
 	node->prev_cpu =3D prev_cpu;
-	osq_link_next(prev, node);
+	osq_link_next(prev, node_cpu);
=20
 	/*
 	 * Normally @prev is untouchable after the above store; because at that
@@ -191,8 +190,8 @@ bool osq_lock(struct optimistic_spin_queue *lock)
=20
 		prev =3D decode_cpu(prev_cpu);
=20
-		if (data_race(prev->next) =3D=3D node &&
-		    cmpxchg(&prev->next, node, NULL) =3D=3D node)
+		if (data_race(prev->next_cpu) =3D=3D node_cpu &&
+		    cmpxchg(&prev->next_cpu, node_cpu, 0) =3D=3D node_cpu)
 			break;
=20
 		/*
