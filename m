Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910272;
	b=tpxWJ3zXdABFEC6mPRp4Uh519swh8j1X5MeXagGhnYwAdt7wFPeNru+HxwAuIs28nbhl
	 g1g9dzhazlCxuaSfUMIFyQHKq3eVDLZ6dz5kMFZW/+of82F6sZ4sLdMwGDuFKDIBtnczU
	 nPH8fzkZ4VxNqi3evrKzg2Fy4qmPzt23oaSDycbSB448+AQ46es1OCuXe0wfZQ89abxNO
	 Lz60M2+5FcFE9bK1rISWM0sX91Ebk+oaXlY7DSpKh+HPMWlehj7jqRntYc4EbaYq26v0D
	 mxD8lcnanAVjOe7qvbM0xalD3rFNE05LnTLB853JNcHaR+V4WhfL0THVJQPjPBUP0FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910272;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=73PTVfrUcmO8FUqnE/YmJ5VjFV2irHPFR+RGv5xKzHs=;
	b=EyxUpO3IcspkifQ0Ej26PagNxICQa2AUu5vozCcuzxkHuZFR6hW/us2fBzvWyQWgSu1z
	 SCT78rG3xOCg4BVUvB/j3mK17aB50uQ38flNMRDWI2SoU49BrkCVj9HyvnE+MfjMtA6wB
	 E4fDu3bEyX8pKWg8mIzPhvaw5c7zRR4Eb1yeA00VvoBfP6B84trep0ZlnEKYmcXzeHYP0
	 XVuyb3JyN03GhsDKJ6Y5nt+adHSbTVebS+F9+SmX6AAymD6ste2G2ni8HI9OidWszlkbV
	 BZnMkUTGf9BdL+YgTGGOJQ74Ig+Nar8YJliDPL+toMbOIL512pCK0WbdPWmzE8Yi3zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YxXcVELm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF265606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YxXcVELm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DEA1F0089F;
	Thu,  5 Nov 2026 20:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793910271;
	bh=73PTVfrUcmO8FUqnE/YmJ5VjFV2irHPFR+RGv5xKzHs=;
	h=From:Date:Subject:To:Cc;
	b=YxXcVELm1aaI1idfjy9RYC0nNnUgrsBv6yGPb9sflGWCewow7vYSVeuSbBSmJaGvk
	 kBlEoWESb4Q4mmua8MYZF2MKeyCHuKfI/S3ftA3PDBmA26bCoDD+4cCeLh898h4Mfa
	 6n+66hxSEbqW81wciX0kTlEpkj0GnQt2RShisHS8qgrudZxfiBnkzDTXBs4jVnBjLB
	 s9oNdGnyUOyzKNruurCVn61PT8CHOdxTq0f+V5s9eduJUT5WBNmMzW21IIZpCpgnAB
	 E4tiKJI9PxPSIb0hGo5gXo0gd7ZX1YzCCs1PKRaTdq4QnAcGVCqDJ+6iEm5QY9YZKt
	 mvH9BMNnD6iwA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 05 Nov 2026 20:24:27 +0000
Subject: [PATCH] locking/rwsem: don't let a read lock steal from a queued
 writer
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQrCQAxG4auUrA3MlFrQq4iL1vzVgJ3RZGqF0
 rs7uPw2723kMIXTudnI8FHXnCrioaHbY0h3sEo1taHtYwxHttUxs+RU2AuGJ0+WZ34vWCC8mhY
 Yh26MUU7ShX6kWnoZJv3+L5frvv8AAb/aaHUAAAA=
X-Change-ID: 20261105-rwsem-dont-steal-from-queued-writer-04b11d9d406b
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>, ljs@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3869; i=ljs@kernel.org;
 h=from:subject:message-id; bh=x1xda1C7CGx0sFscZ23xVdZFI9RbMceSNU2CDK5DgA8=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLLePP2jqf3DXcvVnNGc9cOepEQNgeSTOp4aH0u8Lockb
 QndzVbcUcrCIMbFICumyPL8i/j+IJGweZ0X/N1g5rAygQxh4OIUgIlwcTL89//yWzXDiH/xrhfW
 H9j/Xym5XaZ3lEXt5hMhn95rCovfzWRkWLGAOVaW6czNU9stj3NIZHjd+vLnohHHdufntxd8PTz
 5DisA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Since commit 1a728dff855a ("locking/rwsem: Enable reader optimistic lock
stealing"), a racing read lock can steal an rwsem from under a queued
writer whose handoff timeout hasn't expired yet.

This is most problematic when an rwsem read lock is released then
reacquired in order to relieve lock contention, as instead it will simply
have the lock handed right back to it ahead of the intended beneficiary.

Naturally, this behaviour rather defeats the object of doing this kind of
thing, so this is less than ideal.

Fix this by updating the optimistic read lock stealing code in
rwsem_down_read_slowpath() to explicitly check whether the first queued
lock is a waiting writer, and to not allow the theft if so.

When a steal is disallowed, keep the existing sem->wait_lock held when
jumping to the queue code to avoid useless lock acquisition/release.

In order to perform this check, sem->wait_lock is acquired whenever there
are queued waiters in the steal code, rather than the previous behaviour of
only doing so when the reader count is 1.

Since failing to steal a read lock unconditionally results in acquisition
of the sem->wait_lock, this doesn't seem likely to be a significant
overhead.

Also update the comment describing optimistic read lock acquisition
conditions to include this newly introduced behaviour.

Care is taken to ensure correct ordering of lock acquisition, lock waking
and marking the lock reader-owned.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 kernel/locking/rwsem.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index b9c180ac1eee..cdb3dd6260bf 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -59,7 +59,8 @@
  * A fast path reader optimistic lock stealing is supported when the rwsem
  * is previously owned by a writer and the following conditions are met:
  *  - rwsem is not currently writer owned
- *  - the handoff isn't set.
+ *  - the handoff isn't set
+ *  - a writer isn't at the head of the wait queue.
  */
 #define RWSEM_READER_OWNED	(1UL << 0)
 #define RWSEM_NONSPINNABLE	(1UL << 1)
@@ -1034,31 +1035,36 @@ rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int stat
 	 * Reader optimistic lock stealing.
 	 */
 	if (!(count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF))) {
-		rwsem_set_reader_owned(sem);
-		lockevent_inc(rwsem_rlock_steal);
-
-		/*
-		 * Wake up other readers in the wait queue if it is
-		 * the first reader.
-		 */
-		if ((rcnt == 1) && (count & RWSEM_FLAG_WAITERS)) {
+		if (count & RWSEM_FLAG_WAITERS) {
 			raw_spin_lock_irq(&sem->wait_lock);
-			if (sem->first_waiter)
+			first = sem->first_waiter;
+			/* A writer at the head of queue takes precedence. */
+			if (first && first->type == RWSEM_WAITING_FOR_WRITE)
+				goto queue_locked;
+			rwsem_set_reader_owned(sem);
+			/* If first reader, wake other readers in queue. */
+			if (first && rcnt == 1)
 				rwsem_mark_wake(sem, RWSEM_WAKE_READ_OWNED,
 						&wake_q);
 			raw_spin_unlock_irq(&sem->wait_lock);
-			wake_up_q(&wake_q);
+		} else {
+			rwsem_set_reader_owned(sem);
 		}
+
+		lockevent_inc(rwsem_rlock_steal);
+		if (!wake_q_empty(&wake_q))
+			wake_up_q(&wake_q);
 		return sem;
 	}
 
 queue:
+	raw_spin_lock_irq(&sem->wait_lock);
+queue_locked:
 	waiter.task = current;
 	waiter.type = RWSEM_WAITING_FOR_READ;
 	waiter.timeout = jiffies + RWSEM_WAIT_TIMEOUT;
 	waiter.handoff_set = false;
 
-	raw_spin_lock_irq(&sem->wait_lock);
 	first = sem->first_waiter;
 	if (!first) {
 		/*

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261105-rwsem-dont-steal-from-queued-writer-04b11d9d406b

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

