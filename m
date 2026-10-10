Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63193932E6
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791622510; cv=none; b=gW6CesP3eeJuBrNJyeKdqA5WOy5WrtbQoP2ILrlepjeHMQhzikiDPzQMIRjn5MF4tsjwDZUPSwjO76zN6roZHyN14Cvr5P33+UZo/k4F8wNLI7pLdbDbna45w8uodevrR9e+fRgiDya/JId8dG+k/enpRUPD16K909768SBSSzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791622510; c=relaxed/simple;
	bh=AqJI1iZXUxSD+B6o7ReXWZGYZQpmql7TGB1u8YM65WY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqVOiyUtFKssvMYU8jGmwZlaP2WaABrxFCODb6z+lC+Cz32VURm6KuFbRZGDMQjW+lXR1ETl5Ou/gCNOCSrXlC+w3OvBqLOwbPjGA3BBEG9br78QGooLBj6uCctes7OBJsByXeQNClUHwx8Ir9c+reBrA9fxTa1ix9fqIVQOZY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OHy+eUvm; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OHy+eUvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Dp
	kMP24/QFCugjg5fWrNqKBZaet+ltaqYvt2KJnBiFA=; b=OHy+eUvmhoc5csVfhQ
	dvHjyt1iWOXsEoRJHpr9fDSEikN7COaxvgIz9NrQCYoAd7QkAwEts+jknw0ZAJXh
	IMKGa5N4cYRwgf/k18R4xW9uYSEg3uQF9m4P4KTYZc52aBhZANFZAqKSQt+6Q4bV
	RJsvMu6fjBUkQaIUSYeBuEL4M=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3n6s0_clqxDosDg--.61835S2;
	Sat, 10 Oct 2026 16:54:12 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com,
	syzbot+917245f59371bf1d27f7@syzkaller.appspotmail.com
Subject: [PATCH v4] locking/rtmutex: Handle empty waiters tree in try_to_take_rt_mutex()
Date: Sat, 10 Oct 2026 16:54:12 +0800
Message-ID: <20261010085412.157250-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916073356.40360-1-quchaosheng000406@163.com>
References: <20260916073356.40360-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n6s0_clqxDosDg--.61835S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw4xXFW8uw1xZF4rCF15Arb_yoW5Zryxpa
	y5KrW7Gr1vqr4xurW8Xr4xW3y5Aw4rCFW7J397tFyUGan8XF4aqr97Ka1v9a18CryfXrZI
	qrs8Z39IqFWrZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEqg47UUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbDABWZD2rJ-TWwgAAA3Y

The waiter branch of try_to_take_rt_mutex() reads the top waiter from the
lock waiters tree and passes it to rt_mutex_steal() without checking that
the tree still has waiters.

rt_mutex_slowlock_block() calls try_to_take_rt_mutex() in a loop with a
waiter that was enqueued before the loop.  The loop drops wait_lock around
rt_mutex_schedule(), so another task can acquire and release the lock and
dequeue the waiter in the meantime.  The loop then calls
try_to_take_rt_mutex() again with a waiter that is no longer part of the
waiters tree.

With an empty waiters tree, rt_mutex_top_waiter() returns NULL, so
rt_mutex_steal() dereferences a NULL rt_waiter_node and reads tree.prio at
offset 0x18.  syzbot reports this as a general protection fault in
try_to_take_rt_mutex on PREEMPT_RT:

  general protection fault, probably for non-canonical address
  0xdffffc0000000003
  KASAN: null-ptr-deref in range [0x18-0x1f]
  RIP: 0010:try_to_take_rt_mutex+0x177/0xac0 kernel/locking/rtmutex.c:1138
  Call Trace:
   __rt_mutex_slowlock_locked+0x1fe5/0x25b0
   __rwbase_read_lock+0xc3/0x190
   down_read+0x132/0x200
   inode_lock_shared
   lookup_slow+0x46/0x70
   link_path_walk+0xd2a/0x1910
   path_openat+0x1ce/0x1d60

Take the lock and skip the steal attempt when the waiters tree is empty.
rt_mutex_owner() was already checked above, so the lock is free and the
waiter is the only candidate.  rt_mutex_dequeue() already returns early for
a waiter that is not queued, so the skipped call is a no-op, and
rt_mutex_set_owner() clears the transient RT_MUTEX_HAS_WAITERS state.  The
waiter == NULL branch handles an empty tree the same way.

Fixes: 48eb3f4fcfd3 ("locking/rtmutex: Implement equal priority lock stealing")
Reported-by: syzbot+917245f59371bf1d27f7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=917245f59371bf1d27f7
Assisted-by: LLM
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
Reviewed-by: Waiman Long <longman@redhat.com>
---
v4: Add the Assisted-by: tag required by coding-assistants.rst, and add the
    Reviewed-by from Waiman Long.  No functional change.

v3: Add the Fixes: tag and use the wording suggested by Waiman Long.
    No functional change.

v2: Reword the comment.  No functional change.

 kernel/locking/rtmutex.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 4728631ae..4a6b22027 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -1131,6 +1131,16 @@ try_to_take_rt_mutex(struct rt_mutex_base *lock, struct task_struct *task,
 	if (waiter) {
 		struct rt_mutex_waiter *top_waiter = rt_mutex_top_waiter(lock);
 
+		/*
+		 * The waiter could have been dequeued while the lock was
+		 * dropped. In that case the waiters tree is empty and
+		 * top_waiter is NULL, so there is nothing to steal from.
+		 * Take the lock and leave the transient state to
+		 * rt_mutex_set_owner() below.
+		 */
+		if (!top_waiter)
+			goto takeit;
+
 		/*
 		 * If waiter is the highest priority waiter of @lock,
 		 * or allowed to steal it, take it over.
-- 
2.43.0

