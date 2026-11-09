Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251657;
	b=mWSSUq+yYmQDE1zHp6DpnJ7wroXnSxw6+zx1y+oLIg6U9vRwLu29p5848XETM64DnHhO
	 GlQ+8RQnjjamZayCHiwMNxjYPuMWVtiYI6OCwetvvfxBdwPP7Wa3o3fClSlPIdW8BMqcI
	 Etuc/2+ryTaoBaEogk7194htpjMJjF6LaEkq16fpIcYM6XMbLz9KpL/CKu8guHT40qkfv
	 huGNEB2aw5UdBFm6L5KUBqduwcQTfTcbffb6/LdnC9WCjRlJ5BicvXMosEwKkfhxDVGkG
	 BIjPgQ+woHoSBWBum9kivAH3jUH16lS/VUx0RFtoZfcQEWns9iYvB2nkRHhRfVSePnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=LmOWgBcFnpsZppt9uLq7FxndtK6hFlKKvDB2G12jkrM=;
	b=pJvfZS4oZYNJHTAMf/Y6gYGKKOVsI7GNEyO5k9qNR/p1ku6p1jAp0DKCckmXjeqUqwqQ
	 Q/CeqA9aDg+kbfRZfozMpR1X34YEd83RWtYyEHehnzt/g+uCQlKhbLtH0xYIiqoVlZxOa
	 4xJYKyOu0qtL4pF1zzFyI670sN+hud1v0gjOZUU0OTvD3qxPEjnV9RKKZ2knRMkXczIwz
	 7qIVzDYQMfVTm2hXVgQ6PgsNYNYxC5uXGkXDo1cx9FrOF79ljz/nsAgl0lMm3jhPMD6Q3
	 WjPU7cQB0uSB529KDRLsMDpUjtBFMPI60U/IHK46veyKk8ujPhBfAA5rzS7jQvVuYyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=NBDyG2Tk;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1384660A382E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1384660A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=NBDyG2Tk
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfbX4YBzz1XM30h;
	Mon,  9 Nov 2026 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251647; x=1796843648; bh=LmOWg
	BcFnpsZppt9uLq7FxndtK6hFlKKvDB2G12jkrM=; b=NBDyG2TkS9wkykCzXpIpH
	1D++15GDq1N+RTp+/N2rvzB885E/Z0mLDX24/JrBD9duDIGOIqbiO/nRKdgeCRWy
	P0CLtolbp+A0d5lka5fBUhbnCOuQn3yzUacHYJGymxp6uTY204t4m9W52vYWguQS
	KGblRKrVei71cta6ThC02g04L77bAqaRNnuU8fte8ajIZU511kZ25+jZbtkBWgg1
	PKaVa6Px/rLWyv24H2+vLF2XRfEz+w6S96aSgmM/SVK4mwsU8+vUkP9cD35HDEly
	Y4Q6nitwTrk2Fqq22ySiRa8f29o/l0R8W0eSBeM24t3tJqlxy1pnU1epZ3ie8BGQ
	A==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id MokuFqZxG6Aq; Mon,  9 Nov 2026 19:14:07 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfbL4Dvxz1XM6J4;
	Mon,  9 Nov 2026 19:14:06 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Bart Van Assche <bvanassche@acm.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 12/14] lockdep: Stop lockdep_assert_held*() from assuming lock ownership
Date: Mon,  9 Nov 2026 11:13:20 -0800
Message-ID: <48989e8f3639525e5ad2430249a46470b00d701c.1794250850.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <cover.1794250850.git.bvanassche@acm.org>
References: <cover.1794250850.git.bvanassche@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since commit 7c451541743c ("lockdep: Annotate lockdep assertions for
context analysis"), lockdep_assert_held(), lockdep_assert_held_write()
and lockdep_assert_held_read() instruct Clang's context analysis to
assume that a lock is held. This has the following disadvantages:
- lockdep_assert_held*() silences context analysis warnings in functions
  that lack a __must_hold() or __must_hold_shared() annotation. Hence,
  the compiler neither reports the missing function annotation nor
  checks at compile time whether callers hold the lock.
- lockdep_assert_held() makes context analysis assume exclusive lock
  ownership, even if a reader-writer lock is held in shared mode.
- lockdep_assert_held*() can only be used with lock types that are
  defined with context_lock_struct().

Hence, remove the context assumptions from lockdep_assert_held*() for
both CONFIG_LOCKDEP and !CONFIG_LOCKDEP builds. Code that needs to
inform context analysis that a lock is held should use
lockdep_assume_ctx_held() or lockdep_assume_shared_ctx_held() instead.
Mention this in the kernel-doc comments of these macros.

Convert the __assume_ctx_lock() calls in kernel/locking/rtmutex.c into
lockdep_assume_ctx_held() calls such that the lock ownership assumptions
are verified at runtime. Remove the lockdep_assert_held(&lock->wait_lock)
call from __rt_mutex_slowlock() because lockdep_assume_ctx_held() now
performs the same runtime check.

Update Documentation/dev-tools/context-analysis.rst accordingly.

Cc: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 Documentation/dev-tools/context-analysis.rst | 18 ++++++++++++------
 include/linux/lockdep.h                      | 18 ++++++++++++------
 kernel/locking/rtmutex.c                     |  7 +++----
 3 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/Documentation/dev-tools/context-analysis.rst b/Documentation=
/dev-tools/context-analysis.rst
index 8e71e1e75b5b..88b4ed6a182f 100644
--- a/Documentation/dev-tools/context-analysis.rst
+++ b/Documentation/dev-tools/context-analysis.rst
@@ -111,12 +111,18 @@ checking): either with a ``context_unsafe(var =3D i=
nit)`` expression, or by
 marking small initialization functions with the ``__context_unsafe(init)=
``
 attribute.
=20
-Lockdep assertions, such as `lockdep_assert_held()`, inform the compiler=
's
-context analysis that the associated synchronization primitive is held a=
fter
-the assertion. This avoids false positives in complex control-flow scena=
rios
-and encourages the use of Lockdep where static analysis is limited. For
-example, this is useful when a function doesn't *always* require a lock,=
 making
-`__must_hold()` inappropriate.
+`lockdep_assume_ctx_held()` and `lockdep_assume_shared_ctx_held()` infor=
m the
+compiler's context analysis that the associated synchronization primitiv=
e is
+held and verify this at runtime via Lockdep. This avoids false positives=
 in
+complex control-flow scenarios while still checking lock ownership with =
Lockdep
+where static analysis is limited. For example, this is useful when a fun=
ction
+doesn't *always* require a lock, making `__must_hold()` inappropriate.
+
+Lockdep assertions, such as `lockdep_assert_held()`, only perform a runt=
ime
+check and do not inform the compiler's context analysis that a lock is h=
eld.
+For context locks that are not tracked by Lockdep, e.g. bit spinlocks, u=
se
+`__assume_ctx_lock()` or `__assume_shared_ctx_lock()` instead. These onl=
y
+inform the compiler's context analysis and do not perform a runtime chec=
k.
=20
 Keywords
 ~~~~~~~~
diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 23ffc5f0557c..e2618271eb0e 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -285,16 +285,16 @@ extern u32 lock_sequence(struct lockdep_map *lock);
 	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
=20
 #define lockdep_assert_held(l)		\
-	do { lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD); __ass=
ume_ctx_lock(l); } while (0)
+	lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
=20
 #define lockdep_assert_not_held(l)	\
 	lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_HELD)
=20
 #define lockdep_assert_held_write(l)	\
-	do { lockdep_assert(lockdep_is_held_type(l, 0)); __assume_ctx_lock(l); =
} while (0)
+	lockdep_assert(lockdep_is_held_type(l, 0))
=20
 #define lockdep_assert_held_read(l)	\
-	do { lockdep_assert(lockdep_is_held_type(l, 1)); __assume_shared_ctx_lo=
ck(l); } while (0)
+	lockdep_assert(lockdep_is_held_type(l, 1))
=20
 #define lockdep_assert_held_once(l)		\
 	lockdep_assert_once(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
@@ -392,10 +392,10 @@ extern int lockdep_is_held(const void *);
 #define lockdep_assert(c)			do { } while (0)
 #define lockdep_assert_once(c)			do { } while (0)
=20
-#define lockdep_assert_held(l)			__assume_ctx_lock(l)
+#define lockdep_assert_held(l)			do { (void)(l); } while (0)
 #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
-#define lockdep_assert_held_write(l)		__assume_ctx_lock(l)
-#define lockdep_assert_held_read(l)		__assume_shared_ctx_lock(l)
+#define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
+#define lockdep_assert_held_read(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held_once(l)		do { (void)(l); } while (0)
 #define lockdep_assert_none_held_once()	do { } while (0)
=20
@@ -436,6 +436,9 @@ extern int lockdep_is_held(const void *);
  * has a dep_map member. For context locks that are not tracked by lockd=
ep,
  * e.g. bit spinlocks and the RCU context tokens, use
  * __assume_ctx_lock() instead.
+ *
+ * Note: lockdep_assert_held() does not inform the compiler's context
+ * analysis that a lock is held. Use this macro if that is needed.
  */
 #define lockdep_assume_ctx_held(var)					\
 	_lockdep_assume_ctx_held(var, __UNIQUE_ID(ctx_lock))
@@ -462,6 +465,9 @@ extern int lockdep_is_held(const void *);
  * @var must point at a lock object that is tracked by lockdep, i.e. tha=
t
  * has a dep_map member. For context locks that are not tracked by lockd=
ep,
  * e.g. the RCU context tokens, use __assume_shared_ctx_lock() instead.
+ *
+ * Note: lockdep_assert_held_read() does not inform the compiler's conte=
xt
+ * analysis that a lock is held. Use this macro if that is needed.
  */
 #define lockdep_assume_shared_ctx_held(var)				\
 	_lockdep_assume_shared_ctx_held(var, __UNIQUE_ID(ctx_lock))
diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 5a9534c715b8..424cd38a72d2 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -1259,7 +1259,7 @@ static int __sched task_blocks_on_rt_mutex(struct r=
t_mutex_base *lock,
=20
 		/* Check whether the waiter should back out immediately */
 		rtm =3D container_of(lock, struct rt_mutex, rtmutex);
-		__assume_ctx_lock(&rtm->rtmutex.wait_lock);
+		lockdep_assume_ctx_held(&rtm->rtmutex.wait_lock);
 		res =3D __ww_mutex_add_waiter(waiter, rtm, ww_ctx, wake_q);
 		if (res) {
 			raw_spin_lock(&task->pi_lock);
@@ -1634,7 +1634,7 @@ static int __sched rt_mutex_slowlock_block(struct r=
t_mutex_base *lock,
 	struct task_struct *owner;
 	int ret =3D 0;
=20
-	__assume_ctx_lock(&rtm->rtmutex.wait_lock);
+	lockdep_assume_ctx_held(&rtm->rtmutex.wait_lock);
=20
 	lockevent_inc(rtmutex_slow_block);
 	for (;;) {
@@ -1724,8 +1724,7 @@ static int __sched __rt_mutex_slowlock(struct rt_mu=
tex_base *lock,
 	struct ww_mutex *ww =3D ww_container_of(rtm);
 	int ret;
=20
-	__assume_ctx_lock(&rtm->rtmutex.wait_lock);
-	lockdep_assert_held(&lock->wait_lock);
+	lockdep_assume_ctx_held(&rtm->rtmutex.wait_lock);
 	lockevent_inc(rtmutex_slowlock);
=20
 	/* Try to acquire the lock again: */
