Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4F249E14F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416961; cv=none; b=QPPxwY9PXxs9gHWkojbsTZCJhBKGP65M07qsrY1G1soxHwGFv2Y6YybQlPFdvHEr2oAod5mReM3WvBDohZCbJ42ChzC9buAAxxSKR9utRipL9Kot72FB2hyxHsNAbGX3D7lBFwu1jOZWfry10Pmtz8ZBdyhBu7+xr975zmuZjRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416961; c=relaxed/simple;
	bh=rAq94N9EKURM8V6jEL9q+TlWH6FB1vYHg6ypBlLasSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PRhnpncK8sTvLRFJWPRFEyMiGXa1NbsU2bAaooW4Q/aVA+OI8YrG19oM6h3T4Orx8NHCyz9cxqJj46FYjL2djXTmZ+6Kk5Q+MBZo7nZujj7WLFOfq5cTqlEI7yNMbDz+xPIbkgnmzTzdB7h3GN24Lbts/wQwITrLhyPSqUie0Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jfmiw9JE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jfmiw9JE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789416959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EK5UeQp0tqmVZcyZlllhzwtRO998nODIDBt3oW5fefc=;
	b=Jfmiw9JEpDtercliOeseopBizI0yTXsx2QLfvuFb4B5mDYdYVs04/usZsjJu3+5Hb01x0c
	MUWSx0Bcc4dTCHTFouiVse3DplmMmM+A/IMQWBEBrsYyCB0XVTHfZWgN22nXTLIhsTN1ea
	VUlgti8LFY7RDDHSsIqXEtH6VOxA/sY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-161-ReeQhifjMy-nYm7Erd0zZg-1; Mon,
 14 Sep 2026 16:15:55 -0400
X-MC-Unique: ReeQhifjMy-nYm7Erd0zZg-1
X-Mimecast-MFC-AGG-ID: ReeQhifjMy-nYm7Erd0zZg_1789416954
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1E651944B09;
	Mon, 14 Sep 2026 20:15:53 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9ADCA1956095;
	Mon, 14 Sep 2026 20:15:51 +0000 (UTC)
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
Subject: [PATCH v2] locking/osq_lock: Ensure proper locking semantics for osq_lock/osq_unlock()
Date: Mon, 14 Sep 2026 16:15:36 -0400
Message-ID: <20260914201536.550415-1-longman@redhat.com>
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
 kernel/locking/osq_lock.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

[v2] Reword the commit log and keep the WRITE_ONCE() in osq_unlock()
     with comments.

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index b4233dc2c2b0..4fb63197f699 100644
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

