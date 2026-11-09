Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251652;
	b=O5+WcpGWAqiNv3XMV3K/Lve69XGe+4Zdk4cvgHhr7Oc7HFL/s00zsYAqldvb9jTDw087
	 bNkviNa6Hz/6zIu+5cf4U2BOW9fwCsfHM8UfjfCQ9K0bLG6D2TtbtmgV26xs1TfImIEOE
	 fDqHTJ1is1bjr7huBgjVzR4SA+GWe+u3BKel6Rfst5UjpJD9+AlmfzJEtVdZC0dKaTmCi
	 U7VXqKehTIk4bHHBOuwyYoyjmZ3dThpK7ph/9o5W5bjP70B758ZbA6FxIJtkCeh55Z1rr
	 c+nBUcPj9B3iPf/uGO7z319lQD4lmdnl6heV91mzx0PncrCFf/TSELA8annMJgwj8xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Josgf2apkd4CsovwUO4x7itvdRFMm7l4ISgxQGgvNgQ=;
	b=WXMmCDH7yGQJi/AalefINPq6qY3xAKdO0v2YXbIyDmfedC5Wx75eOMrKOXi7Gu+LhTdp
	 unrGeuHRDs7cVwSZh5f5/r/ZuUUetqiX4E0U9VEKpjCQdQ7mffvN1+6SrLAsdaPf6FmAF
	 WESTVA24kfl2wRIXs3vBjeW98PNu7fRGO6uxocsaIRoqiwK9DPNqo/fZI3ya3ngrid4Hl
	 QYgIfR4lk0JYZJNwtrWvtSzJG0igl+CNIVh0ocBTQParlvcsmw0fIIo5OCbZams0YmY/2
	 4cGJYEKB/F67lpoAU7k341Y32k8uUnhcPgT73CrILX1W9jMABRW184LRrvLL2DdOl+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=JaXrFkGD;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E746860A2607
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E746860A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=JaXrFkGD
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfbR4z0mz1XM0nl;
	Mon,  9 Nov 2026 19:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251643; x=1796843644; bh=Josgf
	2apkd4CsovwUO4x7itvdRFMm7l4ISgxQGgvNgQ=; b=JaXrFkGDXe9pCR4iALLZh
	iDkvTuuDT4GnhJyhh3Z2Ukk7zdQeI9h5qe+tcflDDzFU4TcmQv7Hel2iCOnlu5At
	4JrRsjIdzzeMTvlgcWhJ9sXhw8aEQwFetWRINGi0NDPMwUqzydDLn8mDNhaXAWe+
	lIOU0tbVuOMGL5LvFgraiXrEUoF1L9RatIB8rA2AA2oXNfC5Xhxu/V2XCKd6GzKC
	Dv5kzIlVB8ot/uthg2VBbwB8PpzalMpYGZuKA1IZPUtG92Y8Ozb3UjhYCTu0RqFJ
	R/XoqVE7AqWgyNQglirYqc26IfTs3sFfdJ3Bv/hyZX/8vzE0v6M0jLgX5Uh69l69
	Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id d-nwGyLYvQlC; Mon,  9 Nov 2026 19:14:03 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfbF6YG1z1XM0nk;
	Mon,  9 Nov 2026 19:14:01 +0000 (UTC)
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
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 08/14] lockdep: Introduce lockdep_assume_ctx_held()
Date: Mon,  9 Nov 2026 11:13:16 -0800
Message-ID: <f4725746370a2251abf3cc3b2f34cf79caac32ed.1794250850.git.bvanassche@acm.org>
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

Introduce lockdep_assume_ctx_held() and lockdep_assume_shared_ctx_held()
for code that needs to inform Clang's context analysis that a lock is
held in code paths where lock ownership cannot be proven at compile
time, e.g. because the lock is accessed through a pointer alias that
the analysis cannot resolve. Make these macros call respectively
__assume_ctx_lock() and __assume_shared_ctx_lock() and also verify at
runtime with lockdep_assert_held() or lockdep_assert_held_read() that
the lock is held. Store the macro argument in a local variable with a
unique name such that it is evaluated only once and such that nested
use of these macros does not cause shadowing. Rely on Clang's context
analysis resolving that local variable to the expression it has been
initialized with. Document both macros with kernel-doc comments,
including that __assume_ctx_lock() and __assume_shared_ctx_lock() must
be used for context locks without lockdep support, e.g. bit spinlocks
and the RCU context tokens.

Convert the lockdep_assert_held() tests in lib/test_context-analysis.c
into lockdep_assume_ctx_held() tests and add tests for
lockdep_assume_shared_ctx_held().

Prepare for removing the context assumptions from lockdep_assert_held*()
so that pre-existing lockdep_assert_held*() calls across the kernel tree
stop silencing Clang context analysis warnings in functions that lack a
__must_hold() or __must_hold_shared() annotation when
WARN_CONTEXT_ANALYSIS_ALL is enabled. Use lockdep_assume_ctx_held() and
lockdep_assume_shared_ctx_held() only in the few places in the kernel
where static analysis cannot prove lock ownership at compile time
(futex, kfence, rtmutex and Bluetooth).

Cc: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/lockdep.h     | 54 +++++++++++++++++++++++++++++++++++++
 lib/test_context-analysis.c | 16 +++++++++--
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index a6451ecbbe9a..23ffc5f0557c 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -412,6 +412,60 @@ extern int lockdep_is_held(const void *);
=20
 #endif /* !LOCKDEP */
=20
+#define _lockdep_assume_ctx_held(var, uniq)				\
+	do {								\
+		__auto_type uniq =3D (var);				\
+									\
+		__assume_ctx_lock(uniq);				\
+		lockdep_assert_held(uniq);				\
+	} while (0)
+
+/**
+ * lockdep_assume_ctx_held() - assume and verify that a context lock is =
held
+ * @var: context lock instance pointer
+ *
+ * Instruct the compiler's context analysis to assume that @var is held
+ * exclusively from this point on and verify at runtime with
+ * lockdep_assert_held() that @var is held. Use this macro in code paths
+ * where lock ownership cannot be proven at compile time, e.g. because t=
he
+ * lock is accessed through an alias the analysis cannot resolve or beca=
use
+ * a function does not always require the lock, making __must_hold()
+ * inappropriate. @var is evaluated only once.
+ *
+ * @var must point at a lock object that is tracked by lockdep, i.e. tha=
t
+ * has a dep_map member. For context locks that are not tracked by lockd=
ep,
+ * e.g. bit spinlocks and the RCU context tokens, use
+ * __assume_ctx_lock() instead.
+ */
+#define lockdep_assume_ctx_held(var)					\
+	_lockdep_assume_ctx_held(var, __UNIQUE_ID(ctx_lock))
+
+#define _lockdep_assume_shared_ctx_held(var, uniq)			\
+	do {								\
+		__auto_type uniq =3D (var);				\
+									\
+		__assume_shared_ctx_lock(uniq);				\
+		lockdep_assert_held_read(uniq);				\
+	} while (0)
+
+/**
+ * lockdep_assume_shared_ctx_held() - assume and verify shared lock owne=
rship
+ * @var: context lock instance pointer
+ *
+ * Instruct the compiler's context analysis to assume that @var is held =
with
+ * shared access from this point on and verify at runtime with
+ * lockdep_assert_held_read() that @var is held for reading. Use this ma=
cro
+ * for reader-writer locks, e.g. rwlock_t and struct rw_semaphore, in co=
de
+ * paths where shared lock ownership cannot be proven at compile time. @=
var
+ * is evaluated only once.
+ *
+ * @var must point at a lock object that is tracked by lockdep, i.e. tha=
t
+ * has a dep_map member. For context locks that are not tracked by lockd=
ep,
+ * e.g. the RCU context tokens, use __assume_shared_ctx_lock() instead.
+ */
+#define lockdep_assume_shared_ctx_held(var)				\
+	_lockdep_assume_shared_ctx_held(var, __UNIQUE_ID(ctx_lock))
+
 #ifdef CONFIG_PROVE_LOCKING
 void lockdep_set_lock_cmp_fn(struct lockdep_map *, lock_cmp_fn, lock_pri=
nt_fn);
=20
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 316f4dfcda65..022891999c9c 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -68,7 +68,7 @@ static void __used test_common_helpers(void)
 	}											\
 	static void __used test_##class##_assert(struct test_##class##_data *d)=
			\
 	{											\
-		lockdep_assert_held(&d->lock);							\
+		lockdep_assume_ctx_held(&d->lock);						\
 		op(d->counter);									\
 	}											\
 	static void __used test_##class##_guard(struct test_##class##_data *d)	=
		\
@@ -156,6 +156,12 @@ TEST_SPINLOCK_COMMON(read_lock,
 		     read_trylock,
 		     TEST_OP_RO);
=20
+static void __used test_read_lock_assert_shared(struct test_read_lock_da=
ta *d)
+{
+	lockdep_assume_shared_ctx_held(&d->lock);
+	TEST_OP_RO(d->counter);
+}
+
 struct test_mutex_data {
 	struct mutex mtx;
 	int counter __guarded_by(&mtx);
@@ -203,7 +209,7 @@ static void __used test_mutex_trylock(struct test_mut=
ex_data *d, atomic_t *a)
=20
 static void __used test_mutex_assert(struct test_mutex_data *d)
 {
-	lockdep_assert_held(&d->mtx);
+	lockdep_assume_ctx_held(&d->mtx);
 	d->counter++;
 }
=20
@@ -339,6 +345,12 @@ static void __used test_rwsem_assert(struct test_rws=
em_data *d)
 	d->counter++;
 }
=20
+static void __used test_rwsem_assert_shared(struct test_rwsem_data *d)
+{
+	lockdep_assume_shared_ctx_held(&d->sem);
+	(void)d->counter;
+}
+
 static void __used test_rwsem_guard(struct test_rwsem_data *d)
 {
 	{ guard(rwsem_read)(&d->sem); (void)d->counter; }
