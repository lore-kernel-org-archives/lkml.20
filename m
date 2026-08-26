Received: from smtp153-141.sina.com.cn (smtp153-141.sina.com.cn [61.135.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A3E486639
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787784617; cv=none; b=I32RrcMBsoIj/eFIBTRqwK6V4RGjSYqLVNTKOVKY0S7uR4GXaQEDyOi9dBKAy55mTk+xsNfg+1HTBHV4MJd5VL8JQJzMFqNVNmuhWmTOmzjl1ZG47e8xqr/tjtuHSVRkhANmQol3M3QOkMNL/NCQzyITReICbNv4sxfukCC4+Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787784617; c=relaxed/simple;
	bh=30+cNEQGWxKaZ47JOrBpMF5BmlWYIDN/QUJU99aQOGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUedqex9PxI1wCohWOw3DFtbokm0UVWVAyuD2+AJaHoAccAJ45uhgOLrh3l/yWfZkAkx8THKRQvGNbUEUASFzvOuZ/tn7zlF/LPWeMQ1C3dx3SU4IgGCvYmxrTY44r1WVXYTQKDZOFNgL+uofNDEuZnobvMSkX8uRqVZiE/RyFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=JfUnWyKm; arc=none smtp.client-ip=61.135.153.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="JfUnWyKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787784608;
	bh=CoOH3iJ4VHTGu3S3hWgkalHbFFVL4BPGTHkMrJL4Bac=;
	h=From:Subject:Date:Message-ID;
	b=JfUnWyKmRB+WOpSf5lmYLXM/EcPWieYoXwWNjDU/MnNr+yNEtR+u6l0apmzfG2pM5
	 8ee94c3ILQYw34TMJwgQWi05iTwAmuVBi0EF7RD8AtZKGytryyk0i4Ou7XRmrGfr3L
	 NpgSut0g0Gm8GhvlsTSA8nAOs2NIqebeAM0wR1JA=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.31) with ESMTP
	id 6A8F6D92000037C3; Wed, 27 Aug 2026 06:49:56 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9555476816356
X-SMAIL-UIID: D39102DEBA3F47688D93274A14CC1A2F-20260827-064956-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+dd764a450d93885d847f@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+2d770620059281e225a4@syzkaller.appspotmail.com,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [syzbot] [kernfs?] possible deadlock in kernfs_link_sibling (2)
Date: Thu, 27 Aug 2026 06:49:43 +0800
Message-ID: <20260826224944.1592-1-hdanton@sina.com>
In-Reply-To: <6a8f3f8b.50659fcc.60cd.0005.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Wed, 26 Aug 2026 12:33:31 -0700	[thread overview]
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=10059625580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
> dashboard link: https://syzkaller.appspot.com/bug?extid=dd764a450d93885d847f
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13de8d49580000

#syz test

syzbot reported a lockdep splat hitting DEBUG_LOCKS_WARN_ON(1) in
hlock_class() due to an invalid class_idx:

  WARNING: kernel/locking/lockdep.c:238 at __lock_acquire+0x382/0x2cf0 kernel/locking/lockdep.c:5203
  Workqueue: wg-crypt-wg0 wg_packet_tx_worker
  RIP: 0010:hlock_class kernel/locking/lockdep.c:238 [inline]
  RIP: 0010:check_wait_context kernel/locking/lockdep.c:4870 [inline]
  RIP: 0010:__lock_acquire+0x389/0x2cf0 kernel/locking/lockdep.c:5203
  Call Trace:
   <IRQ>
   lock_acquire+0x106/0x350 kernel/locking/lockdep.c:5886
   _raw_spin_lock+0x2e/0x40 kernel/locking/spinlock.c:173
   tcp_tsq_handler+0x29/0x200 net/ipv4/tcp_output.c:1291
   tcp_tsq_workfn+0x384/0x410 net/ipv4/tcp_output.c:1325
   ...

When a lock class is zapped (e.g. during module unload or key
unregistration), zap_class() clears the class's bit in
lock_classes_in_use and removes it from the class hash table.
However, existing lockdep_map instances embedded in data structures
may still retain a pointer to the zapped class in their class_cache[]
array.

When __lock_acquire() subsequently runs on such a lock, it finds
lock->class_cache[subclass] != NULL, skipping register_lock_class() and
assigning hlock->class_idx to the index of the zapped class. When
check_wait_context() or hlock_class() inspects the held_lock, it finds
!test_bit(class_idx, lock_classes_in_use) and warns. Furthermore, if
the zapped slot is subsequently re-allocated to an unrelated lock key,
the stale class_cache entry would erroneously match the unrelated class
(ABA issue).

Add lock_class_cache_is_valid() to validate that the cached class is
within lock_classes bounds, still allocated in lock_classes_in_use
(using uninstrumented arch_test_bit() in __always_inline context so it
is safe in noinstr contexts like match_held_lock()), and that class->key
matches the expected subkey (taking lockdep_set_subclass() overrides into
account). Also use READ_ONCE()/WRITE_ONCE() when accessing class_cache[].
If the entry is invalid or stale, fall back to register_lock_class() /
look_up_lock_class().

Fixes: a0b0fd53e1e6 ("locking/lockdep: Free lock classes that are no longer in use")
Reported-by: syzbot+2d770620059281e225a4@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/netdev/6a8c66dc.4d75e56a.c9a88.0050.GAE@google.com/T/#u
Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Eric Dumazet <edumazet@google.com>
---
 kernel/locking/lockdep.c | 50 +++++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 25d77d4a1061..763f79806bd8 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -963,6 +963,34 @@ look_up_lock_class(const struct lockdep_map *lock, unsigned int subclass)
 	return NULL;
 }
 
+static __always_inline bool lock_class_cache_is_valid(const struct lockdep_map *lock,
+						      const struct lock_class *class,
+						      unsigned int subclass)
+{
+	unsigned int class_subclass;
+
+	if (!class)
+		return false;
+
+	if (unlikely(class < lock_classes || class >= lock_classes + MAX_LOCKDEP_KEYS))
+		return false;
+
+	if (unlikely(!arch_test_bit(class - lock_classes, lock_classes_in_use)))
+		return false;
+
+	if (unlikely(!lock->key))
+		return false;
+
+	class_subclass = subclass ? subclass : class->subclass;
+	if (unlikely(class_subclass >= MAX_LOCKDEP_SUBCLASSES))
+		return false;
+
+	if (unlikely(READ_ONCE(class->key) != lock->key->subkeys + class_subclass))
+		return false;
+
+	return true;
+}
+
 /*
  * Static locks do not have their class-keys yet - for them the key is
  * the lock object itself. If the lock is in the per cpu area, the
@@ -1395,9 +1423,9 @@ register_lock_class(struct lockdep_map *lock, unsigned int subclass, int force)
 
 out_set_class_cache:
 	if (!subclass || force)
-		lock->class_cache[0] = class;
+		WRITE_ONCE(lock->class_cache[0], class);
 	else if (subclass < NR_LOCKDEP_CACHING_CLASSES)
-		lock->class_cache[subclass] = class;
+		WRITE_ONCE(lock->class_cache[subclass], class);
 
 	/*
 	 * Hash collision, did we smoke some? We found a class with a matching
@@ -4957,7 +4985,7 @@ void lockdep_init_map_type(struct lockdep_map *lock, const char *name,
 	int i;
 
 	for (i = 0; i < NR_LOCKDEP_CACHING_CLASSES; i++)
-		lock->class_cache[i] = NULL;
+		WRITE_ONCE(lock->class_cache[i], NULL);
 
 #ifdef CONFIG_LOCK_STAT
 	lock->cpu = raw_smp_processor_id();
@@ -5022,12 +5050,15 @@ EXPORT_SYMBOL_GPL(__lockdep_no_track__);
 void lockdep_set_lock_cmp_fn(struct lockdep_map *lock, lock_cmp_fn cmp_fn,
 			     lock_print_fn print_fn)
 {
-	struct lock_class *class = lock->class_cache[0];
+	struct lock_class *class = READ_ONCE(lock->class_cache[0]);
 	unsigned long flags;
 
 	raw_local_irq_save(flags);
 	lockdep_recursion_inc();
 
+	if (!lock_class_cache_is_valid(lock, class, 0))
+		class = NULL;
+
 	if (!class)
 		class = register_lock_class(lock, 0, 0);
 
@@ -5119,8 +5150,11 @@ static int __lock_acquire(struct lockdep_map *lock, unsigned int subclass,
 	if (DEBUG_LOCKS_WARN_ON(subclass >= MAX_LOCKDEP_SUBCLASSES))
 		return 0;
 
-	if (subclass < NR_LOCKDEP_CACHING_CLASSES)
-		class = lock->class_cache[subclass];
+	if (subclass < NR_LOCKDEP_CACHING_CLASSES) {
+		class = READ_ONCE(lock->class_cache[subclass]);
+		if (!lock_class_cache_is_valid(lock, class, subclass))
+			class = NULL;
+	}
 	/*
 	 * Not cached?
 	 */
@@ -5323,9 +5357,9 @@ static noinstr int match_held_lock(const struct held_lock *hlock,
 		return 1;
 
 	if (hlock->references) {
-		const struct lock_class *class = lock->class_cache[0];
+		const struct lock_class *class = READ_ONCE(lock->class_cache[0]);
 
-		if (!class)
+		if (!lock_class_cache_is_valid(lock, class, 0))
 			class = look_up_lock_class(lock, 0);
 
 		/*

base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
-- 
2.55.0.766.g2966f0265a-goog
