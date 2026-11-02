Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655338;
	b=BTZaa6Wa5EhgY9hodkv5c9wIHa5oo1fYPersiOFi7HTcONdhrSKHIt70qZYAbBHtwIq2
	 q0DBcKEV2cDQg34z4yUoPG4Y5ySakfe2jVvu5Aq0ICRVAoDp1aCbsKpnUdfW0N7t/Lt6C
	 QURjIfZMNSNmkF+VVwo8A8yRD29PgrHvqbo/bBzGOVoA0n4WoiNbTY6geleVKHm0Rfqa6
	 2dc8TEWfpxkGLAO0MdSElVlu6AnAbtp6mkOkNEpWKaT0xmzpU/GGBF1hs4o46QXYwk6PN
	 o4fbtSIypA+UBHe9AVXrgA/idw3IH50kehGaCEPAUx4dxrICd8LBTRUpZ3y6CXI2I7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=XAywz8Se1AQEtVzfeQQ5q1v5dd0mbXaLBpbeh3QCFTg=;
	b=GUd1hpOcjkPBjsp2wVdncwZHuxbRFdrPezgV2+EYVe63UGsokDGI4bGJ4xX2R9hS5aEq
	 hxXNJPVrjmxxi4/CSyI/eohiZjz+3q35p+UD+ll+X8b9JMxcpmnSOmYsT52bj7Gk9qbiI
	 ATmA/1PTxHEciWheRu8eKaavKAK/4kfFQ/97x3gNwjBzuRddYS/sIN5wisxFNzz7jf5W3
	 r1mP60MUl9QqIYiE5tGHpmiOYU1jJRmzS0e3I8W278bBBZvDGMHB49/06mflnCPjQkrrf
	 xs+urbC6AImqqSsJ4tVQ9XaxJeZ74BiTguwVLnT52rkRGPWlkwF806gU+yTzSn4DTZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b="Cz9/aPUn";
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B34B6083617
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B34B6083617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=Cz9/aPUn
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3s0zLwz1XLktr;
	Mon,  2 Nov 2026 21:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655328; x=1796247329; bh=XAywz
	8Se1AQEtVzfeQQ5q1v5dd0mbXaLBpbeh3QCFTg=; b=Cz9/aPUnnmtx0VPAcY2W+
	U97AoDNVxxAUmjMp8mA88bi6jifOeN3ygxk1H28b/pXQJClvg8NrZ7cz/vOn94Ms
	Rc1FmLgxif1HV3K/LpNucNVHxRw6HPVnf31XVIMko14tuovEBLlCMqMrhxck1Fwj
	I4obP1EvIctAJoQbez6crgJqOY1/FGY/UyUDTekB2yejYWr9HCs0tJXzSUwNuqFq
	RcydHNcZ0yFyVoGnb+Dc2vTWV1R1V8pd3K3QA/N8KbzzfrJIyulIpbUDy9MUT0O6
	DEMCo9oDgZcgcjj97x9FtagC1EZKxLiTPV9he2kH6Y2tSrCdRLInmYQztVotXigC
	g==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id hPkouiIQ_PoU; Mon,  2 Nov 2026 21:35:28 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3h1hWjz1XLksL;
	Mon,  2 Nov 2026 21:35:28 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 12/14] lockdep: Stop lockdep_assert_held*() from assuming lock ownership
Date: Mon,  2 Nov 2026 13:34:42 -0800
Message-ID: <f470c5f2c98e89bd97c8e0b6b7befcfcfd3b00c1.1793654853.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <cover.1793654853.git.bvanassche@acm.org>
References: <cover.1793654853.git.bvanassche@acm.org>
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
index f774b22a35c5..ac2f1d2997a1 100644
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
@@ -467,6 +470,9 @@ extern int lockdep_is_held(const void *);
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
