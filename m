Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDBF44E04C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544090; cv=none; b=S1tzgJax/1qUIYHqbBd/IOKQAzefZ8gTLPAUrlEcPIvmYoGk4BcWJSjX6CXcMNvPvwhhsxt9EaksOF1Imi8w90diSKhhmB89vc3aQ4GmERWhHYGypfjCyBoIEuP5JZ8PDHHHg/Vr/JxL19CFVvAlU8nXpQ0MYvdDhAkL5gFElwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544090; c=relaxed/simple;
	bh=NvHuL+Z4RoJEKa4mWIvA//zyFvrmcX7zcMazixrBaUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BoU4gRoNVjoVyesZhHWSV0HQPLFrwKrIBg9WK3h7pZ7KadYpRrto1pkad2SKjPmK3mB7zwkvlDUzl8lBIFIeEbLwxwnG+5w500YFkQzLo92qP0vMQba08kerfR0jTKTCh1GMr6iWmScpURYOy2RQptoe9hLktBPO4d4wSI7vU1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=G97uQ+ei; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="G97uQ+ei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=m2
	47+aQLTATsuwGD//OJLjBzSzGU/ynEZTT5aZTBjbA=; b=G97uQ+eiYzgUzrcjCD
	JXnSsDJh5mPo+ZqHIFJOHqCMnN7ZUel8NIWSX8ZdaTWjfjp4eP5UZO6GobArj06H
	TnG2i3n0NS/x41XUL5rgUjOkOCyGR77duODbRhq2bFwkwSupb804xNH0IxOTz2Y4
	JdeUVCHw+ZjlBGJx5AOJ+8cbU=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDXo3RlRqpq73QXBA--.1417S2;
	Wed, 16 Sep 2026 15:33:58 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	quchaosheng000406@163.com,
	syzbot+917245f59371bf1d27f7@syzkaller.appspotmail.com
Subject: [PATCH v3] locking/rtmutex: Handle empty waiters tree in try_to_take_rt_mutex()
Date: Wed, 16 Sep 2026 15:33:56 +0800
Message-ID: <20260916073356.40360-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915014222.13423-1-quchaosheng000406@163.com>
References: <20260915014222.13423-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDXo3RlRqpq73QXBA--.1417S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw4xXFW8uw1xZF4rCF15Arb_yoW5AF4Dp3
	y5KrW7Gw1vqr4xurWxZr4xWrW5Aw4rCFW7J3s7tFyUGan8XF4aqrn7Ka10gF40krWfZrZI
	grs8Z39IqFyrXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEQJ5UUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC5AbvZWqqRmacsAAA3k

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
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
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

