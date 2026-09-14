Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80412360EF2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417278; cv=none; b=gMYGSm+J2F4b+M7DYOWcCl7Al3Bm99kStv8J+wrQIft9OU9Uk5U+oTMTgqpn4Hx2do+jMwv9Of5m2as5ButH/tZX3IiYnlz1NO0qoMGq/NuZdq7wp92lE7o90nGNIfNdNHYGYOI6K0icN2FrhTFWAH09sgYnZ1oJga3s5FQXbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417278; c=relaxed/simple;
	bh=4oIuNAace9osCs6P4Y/q7oNy6nszerF2ATiuOVlmTp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cgvrF7+i9TQ5tqiH0b4WKrpX1dB4tNtRD06J3Q23+4gttazeYox+rg59dwx2yhNXGZxua7eNqweApIZXOu5Hwl9quJSLf1jKEl8KgxvztOhrhmz8TzJKRZ/Dmn6HNq3pNnHQXclmiRcqWU8XLFTkbwv428gtwQ+IRMt6r6eev6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UPok7tN1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UPok7tN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789417275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=04aS89ikRpYTME0wB1eRuHwfCbKw7kFZm97yMiMAI0k=;
	b=UPok7tN1PDIJogqbPzukN3U94iy/M9VtvA9WIG4m72GDdcovPqjFUH3mht9d7oyRkDRF30
	zNpDHKKoR/zzC05jeXJpjgxuCKpe6yLNYK6JoqcH1FW7xyRg77gu9jSJuHGKpOK5rOiAG1
	/jdimeIo6nJaYF/JiOXI0h1BaYlJi0M=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-376-n_vfQXXEOKSm5Oia3JCOWA-1; Mon,
 14 Sep 2026 16:21:11 -0400
X-MC-Unique: n_vfQXXEOKSm5Oia3JCOWA-1
X-Mimecast-MFC-AGG-ID: n_vfQXXEOKSm5Oia3JCOWA_1789417270
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E4A41195D003;
	Mon, 14 Sep 2026 20:21:09 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 95FB23000223;
	Mon, 14 Sep 2026 20:21:07 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Davidlohr Bueso <dave@stgolabs.net>,
	Haakon Bugge <haakon.bugge@oracle.com>,
	David Laight <david.laight.linux@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v3] locking/osq_lock: Ensure proper locking semantics for osq_lock/osq_unlock()
Date: Mon, 14 Sep 2026 16:21:02 -0400
Message-ID: <20260914202102.551333-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The osq_lock is special in the sense that lock transfer from one CPU to
the next can happen either over the common optimistic_spin_queue.tail
value with uncontended lock or over a lock waiter's own percpu
optimistic_spin_node.locked flag when the lock is contended.

To ensure proper lock synchronization, we need to provide
the acquire/release semantics for the osq_lock/osq_unlock()
functions in both cases. This is currently the case for the
common optimistic_spin_queue.tail value, but not for the percpu
optimistic_spin_node.locked flag as the proper barriers can be missing.

The "node->locked" read in osq_lock() was relaxed by commit 036cc30c6b6a
("locking/osq: No need for load/acquire when acquire-polling") a while
ago as the smp_load_acquire() loop was causing a performance hit due to
the repeated acquire barriers in the loop and it argued that an earlier
atomic_xchg() call could provide the needed barrier and reordering
wasn't a problem in the way osq_lock is being used by mutex and rwsem
for queuing purpose only. That atomic_xchg() barrier does not work
as a proper acquire barrier for osq_lock() if the lock hasn't been
acquired or isn't ready to be acquired when the barrier ends. So an
acquire barrier is still needed in order to have proper locking semantics.

The performance impact stated in that patch is due to repeated issuance
of acquire barrier which can be expensive depending on the architectures
and the actual processor used. It was not clear what machine and what
benchmark was being used to produce the performance data. Anyway, with
the new smp_cond_load_acquire() helper, only one acquire barrier is
issued at the end of the loop. So even if there is a performance impact,
it should be less than a repeating one.

As for the two percpu optimistic_spin_node.locked setting in osq_unlock(),
they are currently preceded by a full barrier xchg() call which can
provide the needed release barrier. Add comments saying that a release
barrier is needed for the proper functioning of the unlock operation
to alert people from accidentally remove the barrier when the code is
updated.

Fixes: 036cc30c6b6a ("locking/osq: No need for load/acquire when acquire-polling")
Tested-by: Håkon Bugge <haakon.bugge@oracle.com>
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/locking/osq_lock.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

[v2] Reword the commit log and keep the WRITE_ONCE() in osq_unlock()
     with comments.
[v3] Fix the comment above smp_cond_load_acquire().

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index b4233dc2c2b0..37f1b6346c51 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -139,11 +139,11 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 
 	/*
 	 * Wait to acquire the lock or cancellation. Note that need_resched()
-	 * will come with an IPI, which will wake smp_cond_load_relaxed() if it
+	 * will come with an IPI, which will wake smp_cond_load_acquire() if it
 	 * is implemented with a monitor-wait. vcpu_is_preempted() relies on
 	 * polling, be careful.
 	 */
-	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
+	if (smp_cond_load_acquire(&node->locked, VAL || need_resched() ||
 				  vcpu_is_preempted(node_cpu(node->prev))))
 		return true;
 
@@ -224,11 +224,17 @@ void osq_unlock(struct optimistic_spin_queue *lock)
 	node = this_cpu_ptr(&osq_node);
 	next = xchg(&node->next, NULL);
 	if (next) {
+		/* The xchg() call above provides the release barrier */
 		WRITE_ONCE(next->locked, 1);
 		return;
 	}
 
 	next = osq_wait_next(lock, node, OSQ_UNLOCKED_VAL);
-	if (next)
+	if (next) {
+		/*
+		 * The xchg() call in osq_wait_next() before a non-NULL return
+		 * provides the release barrier.
+		 */
 		WRITE_ONCE(next->locked, 1);
+	}
 }
-- 
2.55.0

