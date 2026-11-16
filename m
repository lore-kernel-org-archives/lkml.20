Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870090;
	b=UwoPfhDSTlmYyWkUIsziAVMJK5AhceaKtXUsWqXgN1yjd/Zk8RKOPOHhKH4sr8O4z4hb
	 Qk/a8TiunDMhmXeEpCzPIHFEuSsD05IRs/cfOQIjcWatdHPhX1loqnLrcJZqDqHUH4yf5
	 KnkysvlDl+D9z5HIsCpA5GoYZjcXOLUL7mcbzqbxiVc6D8ogIL7wJOhUw77oOLwgAUJeR
	 ezKV8b01b4wV/tY9+79Trpo55S1SOlStDrbHYRU5nzFjrK7u0aZEnZXnMHj2zfrCUDh5d
	 H3T9LI9MFsHILCAMaXMuQwuQ5Un+b2EkKe197v4Q4p48SZ3fxEZrPKqqzNZ4iF3kMTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=BI5cAJLbzLyxhSO6GkCitEL343rGe4SQ225WZ5x8QuE=;
	b=MTEKAQb8G/QKpem7jN4wqI7zI7puex9fOGPp2GiGYxY+EAk14MMnJzdljdtZFeMC4NaQ
	 AhZ3IkJu//8JtFRcL6dSCqcxSF9o1P3cl3MveJp39p1hIiZ5N3R5u3nqp7EsoxKaCSQwI
	 0R7jKziE2bZQ+R2+2MXj1Zqgzd0D5NlnFcTfcYWvbpKzZw9XLRQ0pfd/rDv/y9g3XKh6s
	 ryc4SFEDse2q+Y4q89y7tCpKe+fAipT/QQOyy3QARv/T2tpG2vi5j5kbxWGZ7fWm4LqZf
	 8g9v+jH2WpE9jvm06kx8vSmAa8Rx08ffJBLNLcfGlHgvDM8sPm8eJzwjiwTDjUnIxvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=YCTCcS51;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEB8606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BEB8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=YCTCcS51
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jT3JT5phlz1XM0nk;
	Mon, 16 Nov 2026 23:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794870083; x=1797462084; bh=BI5cA
	JLbzLyxhSO6GkCitEL343rGe4SQ225WZ5x8QuE=; b=YCTCcS51P6cTcyqwk+NvS
	RhIWiMlbYW2alapmo57DQ7Ox007I4Sw2b8qZv8pWkgobQiYhmmT01guA5uFJhklL
	zBLMcOqrtENUN/45Jc6SxlquMdXhHncKPgH5SWfhzKnn5cjXpiL5JpW3j2UeIE6H
	680BGHQBb9uuocNQMkvKNPvhKdHcu2foyNgKTdXHzc/3Tj+Bn716gHNtdeSiUxHH
	8ikLPjWfbdGKREalIVRila4QboVXfPuHKlu1WRbKcTupPRsFHE4L+DMuChnX1TB8
	stq3UhwQ0wHTu9o+qme7A6rw8Z5jUQywhzyGDlJti+FxRZK3kp5eEROC8wWM1E9r
	w==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id iGsySoz12FMx; Mon, 16 Nov 2026 23:01:23 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jT3JL6gfwz1XLkrk;
	Mon, 16 Nov 2026 23:01:22 +0000 (UTC)
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
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v3 3/3] srcu: Remove check from srcu_dereference_check()
Date: Mon, 16 Nov 2026 14:59:35 -0800
Message-ID: <8114def6bdc259f670f3d84f3ae0dad6809cd6c6.1794869902.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <cover.1794869902.git.bvanassche@acm.org>
References: <cover.1794869902.git.bvanassche@acm.org>
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

Users of srcu_dereference_check() must either hold an SRCU reader lock
or satisfy the lockdep condition 'c', e.g. by holding the update-side
lock. However, srcu_dereference_check() calls
__srcu_read_lock_must_hold(), which tells the Clang context analyzer
that the SRCU reader lock must be held. That requirement is too strict
for update-side callers. Hence, remove the __srcu_read_lock_must_hold()
call from srcu_dereference_check() while keeping the fake RCU acquire
and release around __rcu_dereference_check(). Retain the runtime lockdep
check in srcu_dereference_check().

srcu_dereference() and srcu_dereference_notrace() do not accept a
lockdep condition and hence may only be used by SRCU readers. Call
__srcu_read_lock_must_hold() from these macros such that Clang context
analysis keeps verifying at compile time that their callers hold the
SRCU reader lock.

Cc: Marco Elver <elver@google.com>
Fixes: f0b7ce22d718 ("srcu: Support Clang's context analysis")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/srcu.h | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/include/linux/srcu.h b/include/linux/srcu.h
index d4dcaeb83e2b..5ef07357507b 100644
--- a/include/linux/srcu.h
+++ b/include/linux/srcu.h
@@ -278,8 +278,11 @@ static inline int srcu_read_lock_held(const struct s=
rcu_struct *ssp)
  * No-op helper to denote that ssp must be held. Because SRCU-protected =
pointers
  * should still be marked with __rcu_guarded, and we do not want to mark=
 them
  * with __guarded_by(ssp) as it would complicate annotations for writers=
, we
- * choose the following strategy: srcu_dereference_check() calls this he=
lper
- * that checks that the passed ssp is held, and then fake-acquires 'RCU'=
.
+ * choose the following strategy: srcu_dereference() and
+ * srcu_dereference_notrace() call this helper that checks that the pass=
ed ssp
+ * is held, and srcu_dereference_check() fake-acquires 'RCU'.
+ * srcu_dereference_check() does not call this helper because its caller=
s may
+ * satisfy the condition @c instead of holding ssp, e.g. on the update s=
ide.
  */
 static inline void __srcu_read_lock_must_hold(const struct srcu_struct *=
ssp) __must_hold_shared(ssp) { }
=20
@@ -297,7 +300,6 @@ static inline void __srcu_read_lock_must_hold(const s=
truct srcu_struct *ssp) __m
  */
 #define srcu_dereference_check(p, ssp, c)					\
 ({										\
-	__srcu_read_lock_must_hold(ssp);					\
 	__acquire_shared_ctx_lock(RCU);					\
 	__auto_type __v =3D __rcu_dereference_check((p), __UNIQUE_ID(rcu),	\
 				(c) || srcu_read_lock_held(ssp), __rcu);	\
@@ -315,7 +317,11 @@ static inline void __srcu_read_lock_must_hold(const =
struct srcu_struct *ssp) __m
  * is enabled, invoking this outside of an RCU read-side critical
  * section will result in an RCU-lockdep splat.
  */
-#define srcu_dereference(p, ssp) srcu_dereference_check((p), (ssp), 0)
+#define srcu_dereference(p, ssp)					\
+({									\
+	__srcu_read_lock_must_hold(ssp);				\
+	srcu_dereference_check((p), (ssp), 0);				\
+})
=20
 /**
  * srcu_dereference_notrace - no tracing and no lockdep calls from here
@@ -323,7 +329,11 @@ static inline void __srcu_read_lock_must_hold(const =
struct srcu_struct *ssp) __m
  * @ssp: pointer to the srcu_struct, which is used to check that we
  *	really are in an SRCU read-side critical section.
  */
-#define srcu_dereference_notrace(p, ssp) srcu_dereference_check((p), (ss=
p), 1)
+#define srcu_dereference_notrace(p, ssp)				\
+({									\
+	__srcu_read_lock_must_hold(ssp);				\
+	srcu_dereference_check((p), (ssp), 1);				\
+})
=20
 /**
  * srcu_read_lock - register a new reader for an SRCU-protected structur=
e.
