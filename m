Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8873E2AA1;
	Wed,  2 Sep 2026 07:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334382; cv=none; b=iyPylx0J+gqGLS0skpzt8h9pAXFCkNc65gBoTPY/ma1lr32yHAed+MSnxSTZPkBpAixub0xtQnE84kE4ODOWsfCPLjMLTjkFbes5etxFPHKvHbpMEv29yFDQXrhVYuTxNWECo8+FRNJ/LbRhLXuLjTtTRnBQKbQ3z2mZFeOMldQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334382; c=relaxed/simple;
	bh=GSjO5tAIB7VGelSuEXkDHr2vH4d3/1bGioX0B8qrcXs=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=bMIJvTq99PZomBzGv4WYYXq7JjbVnLkfbrGA2CHKXCChNjm7ceVmW/QDIyt2z6vTwFHBObiQirQtIhv9i3DR4LBK6KX6dfcixKoRiIi6EmmztIGiN7xBnAoySJFUzltfdIPxW81T9u2PSnfzPawtj+PlJ7BN2Wa+V3bBIJqB2HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CZKp55MN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H0QubGNL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CZKp55MN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H0QubGNL"
Date: Wed, 02 Sep 2026 07:32:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788334379;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qaq6Ozvd9kYKHAhw7AWsnmpFQIyCiRHSkKSayY7g9aE=;
	b=CZKp55MNNZRdjBr+KeZSGkLfqbXT1O3UTcr47koY9vnYbHcqTuCJ3uUT1Bsyfw+azlCqPd
	dWCRaOL8ZZH3aZJLZ6mMaLPptKlJXEPwyHrYcBeZwKn6HfyDF1MVjNN+1FqV/hd97/+cpF
	0tVqjm2HxPgREZMYM/L3M+pFyqRStGdjiSC4rYiLUo4dryO4JwICeD6JRobY5XTmWTdNHB
	mj9bJSBmPtCiICiYVhUSia7Z5hCeOXOwrfO7roWE7c769Ng0DoZ9K5cn+TWFNAAKdnD2kv
	O80IZpRtdDBsaaf1WL5Lzeunr9VRwaYNmqDKrJ5HZiMyfaBF7XFTqQWHBvI7BQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788334379;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qaq6Ozvd9kYKHAhw7AWsnmpFQIyCiRHSkKSayY7g9aE=;
	b=H0QubGNLhOJdJmBLRSClHg7n0aTvOERqJK6YbAGxxpsWH0C26heUwmZNFgqLN/jqo1QegE
	V60Yo68Sg17cb5CA==
From: "tip-bot2 for Eric Dumazet" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/urgent] locking/lockdep: Invalidate stale class_cache
 entries for zapped classes
Cc: syzbot+2d770620059281e225a4@syzkaller.appspotmail.com,
 Eric Dumazet <edumazet@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260824155129.676096-1-edumazet@google.com>
References: <20260824155129.676096-1-edumazet@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833437727.3717435.4595107264514888193.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     02c6be7d675b21d81f0ba3a524346850a8c0e3bf
Gitweb:        https://git.kernel.org/tip/02c6be7d675b21d81f0ba3a524346850a8c=
0e3bf
Author:        Eric Dumazet <edumazet@google.com>
AuthorDate:    Mon, 24 Aug 2026 15:51:29=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:18:03 +02:00

locking/lockdep: Invalidate stale class_cache entries for zapped classes

syzbot reported a lockdep splat hitting DEBUG_LOCKS_WARN_ON(1) in
hlock_class() due to an invalid class_idx:

  WARNING: kernel/locking/lockdep.c:238 at __lock_acquire+0x382/0x2cf0 kernel=
/locking/lockdep.c:5203
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
lock->class_cache[subclass] !=3D NULL, skipping register_lock_class()
and assigning hlock->class_idx to the index of the zapped class. When
check_wait_context() or hlock_class() inspects the held_lock, it finds
!test_bit(class_idx, lock_classes_in_use) and warns. Furthermore, if
the zapped slot is subsequently re-allocated to an unrelated lock key,
the stale class_cache entry would erroneously match the unrelated
class (ABA issue).

Add lock_class_cache_is_valid() to validate that the cached class is
within lock_classes bounds, still allocated in lock_classes_in_use
(using uninstrumented arch_test_bit() in __always_inline context so it
is safe in noinstr contexts like match_held_lock()), and that
class->key matches the expected subkey (taking lockdep_set_subclass()
overrides into account). Also use READ_ONCE()/WRITE_ONCE() when
accessing class_cache[].  If the entry is invalid or stale, fall back
to register_lock_class() / look_up_lock_class().

Fixes: a0b0fd53e1e6 ("locking/lockdep: Free lock classes that are no longer i=
n use")
Closes: https://lore.kernel.org/netdev/6a8c66dc.4d75e56a.c9a88.0050.GAE@googl=
e.com/T/#u
Reported-by: syzbot+2d770620059281e225a4@syzkaller.appspotmail.com
Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260824155129.676096-1-edumazet@google.com
---
 kernel/locking/lockdep.c | 50 ++++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 25d77d4..763f798 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -963,6 +963,34 @@ look_up_lock_class(const struct lockdep_map *lock, unsig=
ned int subclass)
 	return NULL;
 }
=20
+static __always_inline bool lock_class_cache_is_valid(const struct lockdep_m=
ap *lock,
+						      const struct lock_class *class,
+						      unsigned int subclass)
+{
+	unsigned int class_subclass;
+
+	if (!class)
+		return false;
+
+	if (unlikely(class < lock_classes || class >=3D lock_classes + MAX_LOCKDEP_=
KEYS))
+		return false;
+
+	if (unlikely(!arch_test_bit(class - lock_classes, lock_classes_in_use)))
+		return false;
+
+	if (unlikely(!lock->key))
+		return false;
+
+	class_subclass =3D subclass ? subclass : class->subclass;
+	if (unlikely(class_subclass >=3D MAX_LOCKDEP_SUBCLASSES))
+		return false;
+
+	if (unlikely(READ_ONCE(class->key) !=3D lock->key->subkeys + class_subclass=
))
+		return false;
+
+	return true;
+}
+
 /*
  * Static locks do not have their class-keys yet - for them the key is
  * the lock object itself. If the lock is in the per cpu area, the
@@ -1395,9 +1423,9 @@ out_unlock_set:
=20
 out_set_class_cache:
 	if (!subclass || force)
-		lock->class_cache[0] =3D class;
+		WRITE_ONCE(lock->class_cache[0], class);
 	else if (subclass < NR_LOCKDEP_CACHING_CLASSES)
-		lock->class_cache[subclass] =3D class;
+		WRITE_ONCE(lock->class_cache[subclass], class);
=20
 	/*
 	 * Hash collision, did we smoke some? We found a class with a matching
@@ -4957,7 +4985,7 @@ void lockdep_init_map_type(struct lockdep_map *lock, co=
nst char *name,
 	int i;
=20
 	for (i =3D 0; i < NR_LOCKDEP_CACHING_CLASSES; i++)
-		lock->class_cache[i] =3D NULL;
+		WRITE_ONCE(lock->class_cache[i], NULL);
=20
 #ifdef CONFIG_LOCK_STAT
 	lock->cpu =3D raw_smp_processor_id();
@@ -5022,12 +5050,15 @@ EXPORT_SYMBOL_GPL(__lockdep_no_track__);
 void lockdep_set_lock_cmp_fn(struct lockdep_map *lock, lock_cmp_fn cmp_fn,
 			     lock_print_fn print_fn)
 {
-	struct lock_class *class =3D lock->class_cache[0];
+	struct lock_class *class =3D READ_ONCE(lock->class_cache[0]);
 	unsigned long flags;
=20
 	raw_local_irq_save(flags);
 	lockdep_recursion_inc();
=20
+	if (!lock_class_cache_is_valid(lock, class, 0))
+		class =3D NULL;
+
 	if (!class)
 		class =3D register_lock_class(lock, 0, 0);
=20
@@ -5119,8 +5150,11 @@ static int __lock_acquire(struct lockdep_map *lock, un=
signed int subclass,
 	if (DEBUG_LOCKS_WARN_ON(subclass >=3D MAX_LOCKDEP_SUBCLASSES))
 		return 0;
=20
-	if (subclass < NR_LOCKDEP_CACHING_CLASSES)
-		class =3D lock->class_cache[subclass];
+	if (subclass < NR_LOCKDEP_CACHING_CLASSES) {
+		class =3D READ_ONCE(lock->class_cache[subclass]);
+		if (!lock_class_cache_is_valid(lock, class, subclass))
+			class =3D NULL;
+	}
 	/*
 	 * Not cached?
 	 */
@@ -5323,9 +5357,9 @@ static noinstr int match_held_lock(const struct held_lo=
ck *hlock,
 		return 1;
=20
 	if (hlock->references) {
-		const struct lock_class *class =3D lock->class_cache[0];
+		const struct lock_class *class =3D READ_ONCE(lock->class_cache[0]);
=20
-		if (!class)
+		if (!lock_class_cache_is_valid(lock, class, 0))
 			class =3D look_up_lock_class(lock, 0);
=20
 		/*
