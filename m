Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655332;
	b=xeM/cMDNSCJh7X2Jsohnsc2RvyfuIrM1dzTwgBYJCZRZ6sLVvXTnOzycttHeMXvCqhfu
	 CtFS7nxvUYudjddVQ9/VWUNcusr/WxISc7jo5lhZvSYUClJgZ71THKf49MfXyuhTsLmoe
	 YcPJnvcrMbbxYWiRa48BbUCK8aVruFiMMpS0XGNhoiE1HZqP5jpLV3CseY7zy/DV08KDx
	 yjcOPO2aHiz8dQkGl9bL1W+GKeCBbH+3L6ihKTWgRxVVBacdIZxhN0cLQ+XnSqg92xnrk
	 S/K3Fi+KSCVKrmLfQfEy3dzW6kEUJ5FsoeYkMRINjqm3oH8u5mVMN9q18AO1O0bt9OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=hs56IzoaaG8jKNJFB05xwzwPj+v7gMiUwnsjs2MwYv8=;
	b=WfYtHMhHH7VpcR5W/rhIRKEZ1iJAHjKxtnThQaQWH7gBq47YjqfLQsWybgcbCqE/V4U5
	 XPetBzYltW/oTS00da+o+ehJ03z1g8i+mXgmon31DRADzKSmwKoKePv3jePEwKqpHBGxj
	 lHIZvLtB9oLp0dFkvmVHJfDpiI+lBtVEtQlqA28b5fV11p0FtRWzqX7d0O3hQ1NNXhC7C
	 zT16sSPg9oyEw6N9JjrVerB9xz8aIiBntHYRd2l5fOzJ82gpiuyEYL2cJukSpuo9HhJ0T
	 OLkm+xHiIzlM9FHXjAOPoKVTxCan7Gvc7EUkTJSviemBu+EzfG0NdWLVNWKlK1c65TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=lmg7UN04;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86BB6082BD6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D86BB6082BD6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=lmg7UN04
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3l31YQz1XLksM;
	Mon,  2 Nov 2026 21:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655324; x=1796247325; bh=hs56I
	zoaaG8jKNJFB05xwzwPj+v7gMiUwnsjs2MwYv8=; b=lmg7UN04Gz+n3VvYKEHaQ
	F7bLtcAhGJg+8LQhTAmC6pSs31L02zyWjHsHTQpGUtl10KisDI+IUIXhw+K3d9eP
	KShrNmWsTXNpX+r3G14KcbwQiZ50GTvGCjI1u/hArTu8w+2THgMe1Ajp9HwFM9Lw
	hfwH/TqXxAz8mSJcGv2G7thmo1amRiSWeO94YfEpPGp/O4aCT+fgfieY/hNqaYvl
	JxMEC4ZNdfO9dPiYNrhclxY8vEP2r8NJggdMDUtAY8hoZ5KM22P6/9mp448sidhd
	NUS20HW3K7vcS4wqsEZJS4nnxQo6trf3up8yaD3Z3vgGQOK5FERIHdfFp6VxrJII
	Q==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id AK_Haj5rvqbN; Mon,  2 Nov 2026 21:35:24 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3b6MvPz1XLksZ;
	Mon,  2 Nov 2026 21:35:23 +0000 (UTC)
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
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 08/14] lockdep: Introduce lockdep_assume_ctx_held()
Date: Mon,  2 Nov 2026 13:34:38 -0800
Message-ID: <71bc2361d8676f1eea3c945cbf21a0c2542d5b92.1793654853.git.bvanassche@acm.org>
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

Introduce lockdep_assume_ctx_held() and lockdep_assume_shared_ctx_held()
for code that needs to inform Clang's context analysis that a lock is
held in code paths where lock ownership cannot be proven at compile
time, e.g. because the lock is accessed through a pointer alias that
the analysis cannot resolve. These macros call respectively
__assume_ctx_lock() and __assume_shared_ctx_lock() and also verify at
runtime with lockdep that the lock is held. Store the macro argument in
a local variable with a unique name such that it is evaluated only once
and such that nested use of these macros does not cause shadowing. Rely
on Clang's context analysis resolving that local variable to the
expression it has been initialized with. Document both macros with
kernel-doc comments, including that __assume_ctx_lock() and
__assume_shared_ctx_lock() must be used for context locks without
lockdep support, e.g. bit spinlocks and the RCU context tokens.

Convert the lockdep_assert_held() tests in lib/test_context-analysis.c
into lockdep_assume_ctx_held() tests and add tests for
lockdep_assume_shared_ctx_held().

This patch prepares for removing the context assumptions from
lockdep_assert_held*().

Cc: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/lockdep.h     | 59 +++++++++++++++++++++++++++++++++++++
 lib/test_context-analysis.c | 16 ++++++++--
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index a6451ecbbe9a..f774b22a35c5 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -412,6 +412,65 @@ extern int lockdep_is_held(const void *);
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
+		lockdep_assert_held(uniq);				\
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
+ * lockdep_assert_held() that @var is held. Use this macro for reader-wr=
iter
+ * locks, e.g. rwlock_t and struct rw_semaphore, in code paths where sha=
red
+ * lock ownership cannot be proven at compile time. @var is evaluated on=
ly
+ * once.
+ *
+ * Since lockdep_assert_held() is used, no lockdep warning is reported i=
f
+ * @var is held for writing instead of for reading. Holding a lock
+ * exclusively implies that shared access is allowed. Use
+ * lockdep_assume_ctx_held() if exclusive access is required.
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
