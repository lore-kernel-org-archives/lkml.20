Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655328;
	b=c1uFpggwq6dUH3SyWKls7Y7lbtIJi9A6QX6DmuIR8AMJnAy0ibecmmt1Q1kZ4RJZ1JhL
	 TX92AULWf4mEYKd/8EwuvMPej+c18ZpXPS7T9dX3eK6N8F5/9VIeNfwuy82a07g/WL44/
	 ErrCR4flARvVU4bDgi0JkNy5o9FTp411ZUymRw3b9dRUfJFbKzBujoOPfvyvHHvKx9jKU
	 V6/xcn2B4U7zNwC/Zzl6pQz68GUHLmBR9kGFH6EJo29ywAWeoF4/81lDvsF/OO+hiFJLU
	 JcB8xvYurx+9f6Ih/adwkdWZmjIztOOIhAq2NgyeYds75o0QUDF7Vmc4O1O73/8khOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=Df1OCOo3/ZQGa3fH6XCHgfxD8+toxxag0Zm0KuDw2/I=;
	b=YmQb9/x8mudx2P1xxX3wKWppjiCpdSi01gA/3D4H6S80lFRc3BwSk+sWDGQeI440upiG
	 77V430Y9SbThC+A+9TuClUoo5VTSn4pwVzRRp1IMrvuXJnLNGs7NNaLWbEEllpB7KLzm7
	 +zfuv77WvO+ObR4ExfvwKfOo40wHOxnwpqH3t05SvLdw0uYsfmcVVyJLEOIs6VS1IVo4U
	 WA1KWk2Su1TfQ1ZuSMr9eCI6MefDbmbtDaDUW9O0Oc2uQkn2ZmUnoTMnXqxmfJANcVcxh
	 KTgLMDUET5/iVmnQHZ1nslrkefXybo5J2OQNBikKTWQ0LjozquSDXB1X6/3KLKchP5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=FMRwonuJ;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA1D606EE8A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CA1D606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=FMRwonuJ
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jJQ3g5d37z1XLksY;
	Mon,  2 Nov 2026 21:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1793655321; x=1796247322; bh=Df1OC
	Oo3/ZQGa3fH6XCHgfxD8+toxxag0Zm0KuDw2/I=; b=FMRwonuJI+DGKIAyU/X+t
	IZHUjEEPA5gjpWI39peKHisHjJCvaT2aiNBMDdGe9mbgGN2lCIP/S98vZwz6TPWP
	7icIqhvLo+yketwDYQdH0CfsPzDZ508QwJAJN6V+uTPhbbggBfSRWcDJ1RFkTUIj
	CSazutEPA1WVVaRP8QqYUkaXEJJECVZfhC8UNYAxNNFGchRg3B8xWTqj2OF22JXO
	qOwYx8WM1X2KH+OLPUDoWw5kx0B3d3wgxm2Rbnn7JZDM1fD30cnxYcluIx4f/99l
	DdXOWbl4zagJc0cUx7bd23EgGuqA4DdvHWkmwhfcIyZFUlGroXSOzr8nxbOb5ggl
	w==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id TuqWvsEW6go1; Mon,  2 Nov 2026 21:35:21 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jJQ3W65Lpz1XLksL;
	Mon,  2 Nov 2026 21:35:19 +0000 (UTC)
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
Subject: [PATCH 04/14] srcu: Remove check from srcu_dereference_check()
Date: Mon,  2 Nov 2026 13:34:34 -0800
Message-ID: <5b3ecec8c995f0aac99f9f6b361027dabe01cb7f.1793654853.git.bvanassche@acm.org>
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
index 1a8a465a5650..e72d2e1dfd82 100644
--- a/include/linux/srcu.h
+++ b/include/linux/srcu.h
@@ -242,8 +242,11 @@ static inline int srcu_read_lock_held(const struct s=
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
@@ -261,7 +264,6 @@ static inline void __srcu_read_lock_must_hold(const s=
truct srcu_struct *ssp) __m
  */
 #define srcu_dereference_check(p, ssp, c)					\
 ({										\
-	__srcu_read_lock_must_hold(ssp);					\
 	__acquire_shared_ctx_lock(RCU);					\
 	__auto_type __v =3D __rcu_dereference_check((p), __UNIQUE_ID(rcu),	\
 				(c) || srcu_read_lock_held(ssp), __rcu);	\
@@ -279,7 +281,11 @@ static inline void __srcu_read_lock_must_hold(const =
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
@@ -287,7 +293,11 @@ static inline void __srcu_read_lock_must_hold(const =
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
