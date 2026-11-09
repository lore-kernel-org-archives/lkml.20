Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251669;
	b=0pZTByDPacTnUoHz9UlnP/o9WYUM1ywLLqIF9mgeRdHEBlTwCcYskbXSGAQnGNdrMLTu
	 yg2b/lMUreIdgV5V9llOJsRNB7r+KVbuskuv5DYUzg2Ggd73rWxLotkq2cbLkux9LE213
	 8Qi2zvjpzZ7h32FwVCknJxBJGTLZGMF4h0iPmkywPLbKXInzhCub9LrR6ZI+Qd1++C+al
	 OFjyGnGSKyNUJqXX+hyWe+/wyHHKo7bxGZvepWkYhh7uHSjddjpDMgZg8hIQWJQHU64in
	 ZiuSivr3/42rKDqyc/ywVGi+ehX2Ku/bwa1vmczpZxkdo5ShZH+udvQ7FQOwAAn5QtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=S1ltz4yVWHt3M+9YyOkRiFQJzWDTgvub9nFI5v6WQUA=;
	b=PDp5pHX/dH68W8C4ETjJN7LdDZNQYzEaCu57gTlbdlrvcjRypAN5QRblbyaaZxXitIQS
	 9+in22+8Zy3dCXurK1TzDvxtPa7gp5tHLKtiBmpL5j0nWA3wuih6zQk1cRnaqWA+6iBAk
	 kSkrc+e3wrhg6WzoRQ8y/atrsgAQxVxnC5Hrwh58Te5OJvstygYeAlQw5bCn7TDOFlm5f
	 LKjRleT8BNCAOSHkBWZZYDH0K00YJSUPFoqqRF3x/F7vyl1+E0jCne8V6vR238gr73rwP
	 rWWvWi0uv1rVo8cEVuKMnkjKVMMyBQ0ZEUD0i9A1OVKVztw9AEkEEDxeLRu1tUYqqkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=nQso18jZ;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073F5606A33B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 073F5606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=nQso18jZ
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfbm5cZvz1XM4Tn;
	Mon,  9 Nov 2026 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251649; x=1796843650; bh=S1ltz
	4yVWHt3M+9YyOkRiFQJzWDTgvub9nFI5v6WQUA=; b=nQso18jZzyC/iIM3j0PBO
	DiZ5w/66XA++yBwtIivmy+2bjx50/e6x1f0FQl3S2QCUEBIQ97HPSTl986Kecr/h
	txrq9g8Vq7BPJWZCc68tgCqZOCNZNRcIYMaUjwGj6nxQAcKfzZjag5/Xj4HNvf1A
	Y6UJvKFtUsAMk4nC/XO8oabxd64PDOyrtmFO4oVAZdPgaFZ3AGQUc9Mj7Dx8GM9v
	8ecaCAAvq0apmPCDi7yNFeP4PGSIkeN16ILa0Vooxh+alWHx0T3Bc6e3Y1Xjv6xY
	doUgkflRbyFVCjOaVaQDgenvmDH1n1RKxjTSsf5t94wqgxtTYgiA5xcpDUsE7cpZ
	w==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id BcjnSUo1LCIv; Mon,  9 Nov 2026 19:14:09 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfbN5LGxz1XLwXF;
	Mon,  9 Nov 2026 19:14:08 +0000 (UTC)
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
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 14/14] rcu: Introduce lockdep_assume_in_rcu_*()
Date: Mon,  9 Nov 2026 11:13:22 -0800
Message-ID: <aa53b0013f69f1896946821cbc7b7092a5cdc636.1794250850.git.bvanassche@acm.org>
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

Remove the context assumptions from lockdep_assert_rcu_helper() and from
the !CONFIG_PROVE_RCU definitions of lockdep_assert_in_rcu_*() in
include/linux/rcupdate.h. Introduce the following macros and document
them with kernel-doc comments:
- lockdep_assume_in_rcu_read_lock(): assume RCU and call
  lockdep_assert_in_rcu_read_lock().
- lockdep_assume_in_rcu_read_lock_bh(): assume RCU and RCU_BH and call
  lockdep_assert_in_rcu_read_lock_bh().
- lockdep_assume_in_rcu_read_lock_sched(): assume RCU and RCU_SCHED and
  call lockdep_assert_in_rcu_read_lock_sched().
- lockdep_assume_in_rcu_reader(): assume RCU and call
  lockdep_assert_in_rcu_reader().
Assume RCU in the _bh() and _sched() variants because rcu_read_lock_bh()
and rcu_read_lock_sched() acquire RCU in addition to RCU_BH and
RCU_SCHED, and because __rcu_guarded pointers are guarded by RCU. Use
the lockdep_assume_ prefix for consistency with lockdep_assume_ctx_held()
and lockdep_assume_shared_ctx_held(): __assume_*() macros only inform
context analysis while lockdep_assume_*() macros also verify the
assumption at runtime.

Mention lockdep_assume_in_rcu_read_lock() in
Documentation/dev-tools/context-analysis.rst. Convert the RCU assertion
tests in lib/test_context-analysis.c to the lockdep_assume_in_rcu_*()
macros and verify in the _bh() and _sched() tests that RCU is assumed
too.

Prevent lockdep_assert_in_rcu_*() from silencing Clang context analysis
warnings in functions that lack a __must_hold_shared(RCU) annotation,
such that the compiler reports missing function annotations and checks
callers for RCU read lock ownership at compile time. This makes the RCU
assertions consistent with lockdep_assert_held*().

Verify at runtime with lockdep that the RCU read lock is held whenever
one of the lockdep_assume_in_rcu_*() macros instructs Clang context
analysis to assume RCU read lock ownership without compile-time proof.

Change lockdep_assert_rcu_helper() from __always_inline back into inline.
Commit 451c3a035609 ("rcu: Mark lockdep_assert_rcu_helper()
__always_inline") made this function __always_inline because if it was
not inlined, its callers passed the address of the RCU, RCU_BH or
RCU_SCHED context token to it. Since these tokens are not defined
anywhere, that resulted in link failures. Now that the ctx argument has
been removed from lockdep_assert_rcu_helper(), the context tokens are no
longer referenced and hence __always_inline is no longer necessary.

Cc: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 Documentation/dev-tools/context-analysis.rst | 26 ++++---
 include/linux/rcupdate.h                     | 82 +++++++++++++++++---
 lib/test_context-analysis.c                  | 10 ++-
 3 files changed, 92 insertions(+), 26 deletions(-)

diff --git a/Documentation/dev-tools/context-analysis.rst b/Documentation=
/dev-tools/context-analysis.rst
index 88b4ed6a182f..bc94e5bb56a5 100644
--- a/Documentation/dev-tools/context-analysis.rst
+++ b/Documentation/dev-tools/context-analysis.rst
@@ -111,18 +111,20 @@ checking): either with a ``context_unsafe(var =3D i=
nit)`` expression, or by
 marking small initialization functions with the ``__context_unsafe(init)=
``
 attribute.
=20
-`lockdep_assume_ctx_held()` and `lockdep_assume_shared_ctx_held()` infor=
m the
-compiler's context analysis that the associated synchronization primitiv=
e is
-held and verify this at runtime via Lockdep. This avoids false positives=
 in
-complex control-flow scenarios while still checking lock ownership with =
Lockdep
-where static analysis is limited. For example, this is useful when a fun=
ction
-doesn't *always* require a lock, making `__must_hold()` inappropriate.
-
-Lockdep assertions, such as `lockdep_assert_held()`, only perform a runt=
ime
-check and do not inform the compiler's context analysis that a lock is h=
eld.
-For context locks that are not tracked by Lockdep, e.g. bit spinlocks, u=
se
-`__assume_ctx_lock()` or `__assume_shared_ctx_lock()` instead. These onl=
y
-inform the compiler's context analysis and do not perform a runtime chec=
k.
+`lockdep_assume_ctx_held()`, `lockdep_assume_shared_ctx_held()` and
+`lockdep_assume_in_rcu_read_lock()` inform the compiler's context analys=
is that
+the associated synchronization primitive is held and verify this at runt=
ime via
+Lockdep. This avoids false positives in complex control-flow scenarios w=
hile
+still checking lock ownership with Lockdep where static analysis is limi=
ted.
+For example, this is useful when a function doesn't *always* require a l=
ock,
+making `__must_hold()` inappropriate.
+
+Lockdep assertions, such as `lockdep_assert_held()` and
+`lockdep_assert_in_rcu_read_lock()`, only perform a runtime check and do=
 not
+inform the compiler's context analysis that a lock is held. For context =
locks
+that are not tracked by Lockdep, e.g. bit spinlocks, use `__assume_ctx_l=
ock()`
+or `__assume_shared_ctx_lock()` instead. These only inform the compiler'=
s
+context analysis and do not perform a runtime check.
=20
 Keywords
 ~~~~~~~~
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 3f74ae6d6e1f..3effadda45a3 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -403,8 +403,7 @@ static inline void rcu_preempt_sleep_check(void) { }
=20
 // See RCU_LOCKDEP_WARN() for an explanation of the double call to
 // debug_lockdep_rcu_enabled().
-static __always_inline bool lockdep_assert_rcu_helper(bool c, const stru=
ct __ctx_lock_RCU *ctx)
-	__assumes_shared_ctx_lock(RCU) __assumes_shared_ctx_lock(ctx)
+static inline bool lockdep_assert_rcu_helper(bool c)
 {
 	return debug_lockdep_rcu_enabled() &&
 	       (c || !rcu_is_watching() || !rcu_lockdep_current_cpu_online()) &=
&
@@ -417,7 +416,7 @@ static __always_inline bool lockdep_assert_rcu_helper=
(bool c, const struct __ctx
  * Splats if lockdep is enabled and there is no rcu_read_lock() in effec=
t.
  */
 #define lockdep_assert_in_rcu_read_lock() \
-	WARN_ON_ONCE(lockdep_assert_rcu_helper(!lock_is_held(&rcu_lock_map), RC=
U))
+	WARN_ON_ONCE(lockdep_assert_rcu_helper(!lock_is_held(&rcu_lock_map)))
=20
 /**
  * lockdep_assert_in_rcu_read_lock_bh - WARN if not protected by rcu_rea=
d_lock_bh()
@@ -427,7 +426,7 @@ static __always_inline bool lockdep_assert_rcu_helper=
(bool c, const struct __ctx
  * actual rcu_read_lock_bh() is required.
  */
 #define lockdep_assert_in_rcu_read_lock_bh() \
-	WARN_ON_ONCE(lockdep_assert_rcu_helper(!lock_is_held(&rcu_bh_lock_map),=
 RCU_BH))
+	WARN_ON_ONCE(lockdep_assert_rcu_helper(!lock_is_held(&rcu_bh_lock_map))=
)
=20
 /**
  * lockdep_assert_in_rcu_read_lock_sched - WARN if not protected by rcu_=
read_lock_sched()
@@ -437,7 +436,7 @@ static __always_inline bool lockdep_assert_rcu_helper=
(bool c, const struct __ctx
  * instead an actual rcu_read_lock_sched() is required.
  */
 #define lockdep_assert_in_rcu_read_lock_sched() \
-	WARN_ON_ONCE(lockdep_assert_rcu_helper(!lock_is_held(&rcu_sched_lock_ma=
p), RCU_SCHED))
+	WARN_ON_ONCE(lockdep_assert_rcu_helper(!lock_is_held(&rcu_sched_lock_ma=
p)))
=20
 /**
  * lockdep_assert_in_rcu_reader - WARN if not within some type of RCU re=
ader
@@ -455,20 +454,83 @@ static __always_inline bool lockdep_assert_rcu_help=
er(bool c, const struct __ctx
 	WARN_ON_ONCE(lockdep_assert_rcu_helper(!lock_is_held(&rcu_lock_map) &&	=
		\
 					       !lock_is_held(&rcu_bh_lock_map) &&		\
 					       !lock_is_held(&rcu_sched_lock_map) &&		\
-					       preemptible(), RCU))
+					       preemptible()))
=20
 #else /* #ifdef CONFIG_PROVE_RCU */
=20
 #define RCU_LOCKDEP_WARN(c, s) do { } while (0 && (c))
 #define rcu_sleep_check() do { } while (0)
=20
-#define lockdep_assert_in_rcu_read_lock() __assume_shared_ctx_lock(RCU)
-#define lockdep_assert_in_rcu_read_lock_bh() __assume_shared_ctx_lock(RC=
U_BH)
-#define lockdep_assert_in_rcu_read_lock_sched() __assume_shared_ctx_lock=
(RCU_SCHED)
-#define lockdep_assert_in_rcu_reader() __assume_shared_ctx_lock(RCU)
+#define lockdep_assert_in_rcu_read_lock() do { } while (0)
+#define lockdep_assert_in_rcu_read_lock_bh() do { } while (0)
+#define lockdep_assert_in_rcu_read_lock_sched() do { } while (0)
+#define lockdep_assert_in_rcu_reader() do { } while (0)
=20
 #endif /* #else #ifdef CONFIG_PROVE_RCU */
=20
+/**
+ * lockdep_assume_in_rcu_read_lock() - assume and verify RCU protection
+ *
+ * Instruct the compiler's context analysis to assume that the RCU read =
lock
+ * is held from this point on and verify at runtime with
+ * lockdep_assert_in_rcu_read_lock() that rcu_read_lock() is in effect. =
Use
+ * this macro in functions that are called with rcu_read_lock() held but=
 for
+ * which a __must_hold_shared(RCU) annotation is not appropriate.
+ */
+#define lockdep_assume_in_rcu_read_lock()		\
+	do {						\
+		__assume_shared_ctx_lock(RCU);		\
+		lockdep_assert_in_rcu_read_lock();	\
+	} while (0)
+
+/**
+ * lockdep_assume_in_rcu_read_lock_bh() - assume and verify RCU-bh prote=
ction
+ *
+ * Instruct the compiler's context analysis to assume that both RCU and
+ * RCU_BH are held from this point on and verify at runtime with
+ * lockdep_assert_in_rcu_read_lock_bh() that rcu_read_lock_bh() is in
+ * effect. RCU is assumed too because rcu_read_lock_bh() acquires both R=
CU
+ * and RCU_BH, and because __rcu_guarded pointers are guarded by RCU.
+ */
+#define lockdep_assume_in_rcu_read_lock_bh()		\
+	do {						\
+		__assume_shared_ctx_lock(RCU);		\
+		__assume_shared_ctx_lock(RCU_BH);	\
+		lockdep_assert_in_rcu_read_lock_bh();	\
+	} while (0)
+
+/**
+ * lockdep_assume_in_rcu_read_lock_sched() - assume and verify RCU-sched
+ *
+ * Instruct the compiler's context analysis to assume that both RCU and
+ * RCU_SCHED are held from this point on and verify at runtime with
+ * lockdep_assert_in_rcu_read_lock_sched() that rcu_read_lock_sched() is=
 in
+ * effect. RCU is assumed too because rcu_read_lock_sched() acquires bot=
h
+ * RCU and RCU_SCHED, and because __rcu_guarded pointers are guarded by =
RCU.
+ */
+#define lockdep_assume_in_rcu_read_lock_sched()			\
+	do {							\
+		__assume_shared_ctx_lock(RCU);			\
+		__assume_shared_ctx_lock(RCU_SCHED);		\
+		lockdep_assert_in_rcu_read_lock_sched();	\
+	} while (0)
+
+/**
+ * lockdep_assume_in_rcu_reader() - assume and verify any RCU reader
+ *
+ * Instruct the compiler's context analysis to assume that the RCU read =
lock
+ * is held from this point on and verify at runtime with
+ * lockdep_assert_in_rcu_reader() that some type of RCU reader is in eff=
ect.
+ * Unlike lockdep_assume_in_rcu_read_lock(), this macro also accepts reg=
ions of
+ * code in which preemption, softirqs or interrupts are disabled, since =
such
+ * regions also qualify as RCU readers.
+ */
+#define lockdep_assume_in_rcu_reader()			\
+	do {						\
+		__assume_shared_ctx_lock(RCU);		\
+		lockdep_assert_in_rcu_reader();		\
+	} while (0)
+
 /*
  * Helper functions for rcu_dereference_check(), rcu_dereference_protect=
ed()
  * and rcu_assign_pointer().  Some of these could be folded into their
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 048b839bae92..2b5e8612c14e 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -466,25 +466,27 @@ static void __used test_rcu_lock_reentrant(void)
=20
 static void __used test_rcu_assert(void)
 {
-	lockdep_assert_in_rcu_read_lock();
+	lockdep_assume_in_rcu_read_lock();
 	wants_rcu_held();
 }
=20
 static void __used test_rcu_assert_bh(void)
 {
-	lockdep_assert_in_rcu_read_lock_bh();
+	lockdep_assume_in_rcu_read_lock_bh();
+	wants_rcu_held();
 	wants_rcu_held_bh();
 }
=20
 static void __used test_rcu_assert_sched(void)
 {
-	lockdep_assert_in_rcu_read_lock_sched();
+	lockdep_assume_in_rcu_read_lock_sched();
+	wants_rcu_held();
 	wants_rcu_held_sched();
 }
=20
 static void __used test_rcu_assert_reader(void)
 {
-	lockdep_assert_in_rcu_reader();
+	lockdep_assume_in_rcu_reader();
 	wants_rcu_held();
 }
=20
