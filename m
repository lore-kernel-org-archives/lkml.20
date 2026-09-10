Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003C2493D4E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049990; cv=none; b=PkKIZEIKVPsI8nBxgZFT1CL2+D9PUOgiDGVJbnYRBNK9UujbHcsa5kot3RHD2VDfr5+O+/BlOzywQaDoy+oPikHHSCsis3fdneDqRkF3mr6r3jRDz0fPFOvgiq9H5J14h0udlKoZidks97NmKSAgkk3N8p2alpMk6HlINQY6xnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049990; c=relaxed/simple;
	bh=KPtR+IYyr3qh22EhC8GOcnmM6k72gMu+SV243zFjrDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N+u7nEXKZiGSDGSHWOS27inOciSi75wFmERYn7d/08mgVJeg2pUr033BcQ+x2Q51hZJITthv4MDiMKN/xEspPoXoB/3Uar7pv87RqQsXhX4xDgrFgep0Vg94hCUE7xBsBDYFXnOQ/bHG9Dez0dcFByDZRHJGszxphpWhxHzKViI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bYY1pKYf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bYY1pKYf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789049987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rjutPnukpua1KQtyP4ndp5fAljkQ8RVREfHPPeOKRZ0=;
	b=bYY1pKYfN+LS7LEYgmEyy9qsM6R11o8P/j+IK5dFrAHmYKGGTvoT4KjtNoEtMK1jIIyNyX
	CyN4qj7b7H7ZiWtqKJWZugkrUV/K+pTrhKnI4dhnY1Qtf2LFZ02eIXzpk/Ery2QwL/DS+v
	hC5eSSZJWxtpI0k5J9PyquCS6pCAsYA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-695-GXCvJBa1PAytjKpwAr9d_Q-1; Thu,
 10 Sep 2026 10:19:44 -0400
X-MC-Unique: GXCvJBa1PAytjKpwAr9d_Q-1
X-Mimecast-MFC-AGG-ID: GXCvJBa1PAytjKpwAr9d_Q_1789049982
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20A6C1800632;
	Thu, 10 Sep 2026 14:19:42 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 91D191955F19;
	Thu, 10 Sep 2026 14:19:39 +0000 (UTC)
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
Subject: [PATCH] locking/osq_lock: Ensure proper locking semantics for osq_lock/osq_unlock()
Date: Thu, 10 Sep 2026 10:19:08 -0400
Message-ID: <20260910141908.592414-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The osq_lock is special in the sense that lock transfer from one CPU to
the next can happen either over the common optimistic_spin_queue.tail
value with uncontended lock or over a lock waiter's own percpu
optimistic_spin_node.locked flag when the lock is contended.

To ensure proper lock synchronization, we need to provide
the acquire/release semantics for the osq_lock/osq_unlock()
functions in both cases. This is currently the case for the
common optimistic_spin_queue.tail value, but not for the percpu
optimistic_spin_node.locked flag as the proper barriers are missing in
some places. Fix that by adding the needed barriers in those places.

Note that the two percpu optimistic_spin_node.locked setting in
osq_unlock() are proceeded by a full barrier xchg() call, but the
contended cachelines are different. This should probably work in most
cases except in some exotic architectures where the barrier semantics
may be cacheline specific. Nevertheless a release barrier is still added
for safety reason as we may opt to relax the xchg() calls in the future.

The "node->locked" read in osq_lock() was relaxed by commit 036cc30c6b6a
("locking/osq: No need for load/acquire when acquire-polling") a while
ago as the smp_load_acquire() loop was causing a performance hit due to
the repeated acquire barriers in the loop and it argued that an earlier
atomic_xchg() call could provide the needed barrier. That may not be
enough especially if we have to loop for a while before the lock is
released. Now with the new smp_cond_load_acquire() helper, only one
acquire barrier is added at the end of the loop. So it shouldn't have
the performance hit noted in that commit.

Currently osq_lock is used only by mutex and rw_semaphore code for queuing
purpose. As a result, the imperfect lock synchronization support does
not cause harmful consequence as the new osq_lock owner of a contended
osq_lock will still have to wait for the real mutex and rwsem lock to
be released by the pervious osq_lock owner before it can acquire it and
go into its critical section. For correctness, we still have to fix it
in case it is used elsewhere which doesn't have this inherent protection.

Fixes: 036cc30c6b6a ("locking/osq: No need for load/acquire when acquire-polling")
Tested-by: Håkon Bugge <haakon.bugge@oracle.com>
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/locking/osq_lock.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index b4233dc2c2b0..ef1bbd914917 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -143,7 +143,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * is implemented with a monitor-wait. vcpu_is_preempted() relies on
 	 * polling, be careful.
 	 */
-	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
+	if (smp_cond_load_acquire(&node->locked, VAL || need_resched() ||
 				  vcpu_is_preempted(node_cpu(node->prev))))
 		return true;
 
@@ -224,11 +224,14 @@ void osq_unlock(struct optimistic_spin_queue *lock)
 	node = this_cpu_ptr(&osq_node);
 	next = xchg(&node->next, NULL);
 	if (next) {
-		WRITE_ONCE(next->locked, 1);
+		/* Provide release barrier for unlock */
+		smp_store_release(&next->locked, 1);
 		return;
 	}
 
 	next = osq_wait_next(lock, node, OSQ_UNLOCKED_VAL);
-	if (next)
-		WRITE_ONCE(next->locked, 1);
+	if (next) {
+		/* Provide release barrier for unlock */
+		smp_store_release(&next->locked, 1);
+	}
 }
-- 
2.55.0

