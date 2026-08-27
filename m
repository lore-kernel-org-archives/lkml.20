Received: from smtp153-171.sina.com.cn (smtp153-171.sina.com.cn [61.135.153.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ADE246770
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787810767; cv=none; b=m+2ltbpTz7hXkF8LehIaAnsRecBIs1ydL109kgHv+05IY04GwiiebExT1PO6RwELriiA9nHhCqjOG0FXo044RGSrxuV77P/wo7a2TLwkaeYOMmdpITnMjccLV+JzPlBOdvmPou3lAvb3u321IFh8UBXxb7GgOQqh1uVRmIfn6k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787810767; c=relaxed/simple;
	bh=8zodDge3o/qibwNwpqsUJ7+0//bkgeJuseh0oSKMKsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2u8hpmexfhuXZJ+wB/AwX9n3P5qoZBlBkxQ4IW0svD8Pdp2TpJe+Bo6ovCqjKmmDzM0XyW8mj2YgoHm17mQbAff8V5IGVTO7logVHctX4vLjU9MCqxZBRPC/SS4qHmRS0PMhKC/2jAxZiXVowtmBMps3YQmDG7NYTF/E4bQHis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=wCuKs6R4; arc=none smtp.client-ip=61.135.153.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="wCuKs6R4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1787810760;
	bh=kxLjF8qWVRouJ6hSyKBmio1bVTVcz3/7BhM5Yc84c4s=;
	h=From:Subject:Date:Message-ID;
	b=wCuKs6R4584CYRDxK1Kgh6hXKpmmD5A313KdlelU/MIiyQz3Z3RC1HilfHpEY9p/j
	 elL5vKHf38aKcxtL3VOl69qPyG7zEHaxquEchbDLhdJGqXtdjO+D6fWk2wCnCAlq14
	 h5cQIw6grOBEcNxoLsMp0wndGulQMXuQ5desO+GE=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.62.194])
	by sina.com (10.54.253.34) with ESMTP
	id 6A8FD32C00004CE1; Thu, 27 Aug 2026 14:03:27 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 5981956292094
X-SMAIL-UIID: 242C103D4013432DACE858AC845B89C1-20260827-140327-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+dd764a450d93885d847f@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernfs?] possible deadlock in kernfs_link_sibling (2)
Date: Thu, 27 Aug 2026 14:03:13 +0800
Message-ID: <20260827060314.1793-1-hdanton@sina.com>
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

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 818bebeb63dd

--- x/kernel/locking/lockdep.c
+++ y/kernel/locking/lockdep.c
@@ -947,6 +947,34 @@ look_up_lock_class(const struct lockdep_
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
@@ -1379,9 +1407,9 @@ out_unlock_set:
 
 out_set_class_cache:
 	if (!subclass || force)
-		lock->class_cache[0] = class;
+		WRITE_ONCE(lock->class_cache[0], class);
 	else if (subclass < NR_LOCKDEP_CACHING_CLASSES)
-		lock->class_cache[subclass] = class;
+		WRITE_ONCE(lock->class_cache[subclass], class);
 
 	/*
 	 * Hash collision, did we smoke some? We found a class with a matching
@@ -4941,7 +4969,7 @@ void lockdep_init_map_type(struct lockde
 	int i;
 
 	for (i = 0; i < NR_LOCKDEP_CACHING_CLASSES; i++)
-		lock->class_cache[i] = NULL;
+		WRITE_ONCE(lock->class_cache[i], NULL);
 
 #ifdef CONFIG_LOCK_STAT
 	lock->cpu = raw_smp_processor_id();
@@ -5006,12 +5034,15 @@ EXPORT_SYMBOL_GPL(__lockdep_no_track__);
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
 
@@ -5103,8 +5134,11 @@ static int __lock_acquire(struct lockdep
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
@@ -5307,9 +5341,9 @@ static noinstr int match_held_lock(const
 		return 1;
 
 	if (hlock->references) {
-		const struct lock_class *class = lock->class_cache[0];
+		const struct lock_class *class = READ_ONCE(lock->class_cache[0]);
 
-		if (!class)
+		if (!lock_class_cache_is_valid(lock, class, 0))
 			class = look_up_lock_class(lock, 0);
 
 		/*
--- x/lib/once.c
+++ y/lib/once.c
@@ -93,6 +93,6 @@ void __do_once_sleepable_done(bool *done
 {
 	*done = true;
 	mutex_unlock(&once_mutex);
-	static_branch_disable(once_key);
+	once_disable_jump(once_key, mod);
 }
 EXPORT_SYMBOL(__do_once_sleepable_done);
--
