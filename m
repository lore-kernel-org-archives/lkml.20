Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251647;
	b=LzGTSFYlmMK+qsXSTUzyVDskoe6gTDHRKmx4i2twEGnAC0ypVwET2NQx+FimTJG1l5Lm
	 fzmmBAvCEus1OSvQg1Sir3LQ8gpan6Wz5fSH7zRJio7zI2kLt2LGeEFsWHIne8eNfOloq
	 +7Fs/Sw1b8ZgLVqKS9uVWCAi3mA9shFrbLW5EVy3alMhqtQqRBrQRlEfijodg4OC0dVzu
	 6IrXPwcaF1tXQbntfMm439ifUIzJ7vCY6t59BF5ozn6NWI1QbqBM9BD5ZtdmVJsxFIciR
	 bzf82SKze70W26tQ2XkXx2z29axaWV+yCi2sjP+h+0j7YAFw4SRDOhIRZQ0iA6b2wzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=BI5cAJLbzLyxhSO6GkCitEL343rGe4SQ225WZ5x8QuE=;
	b=qnq4kQv4ak1MLqtBHGKydbu4n3bQ69GIlx/pMqkSenJUK354PT57YpOjEO8f1xGfIgHM
	 bndWwYnL5RMstt7nmdn4ixIsZXteXPFYZGBRJ3aLVrXrHjQBln/t3HzeW8eiSBmmurJZo
	 +jNnkBIknwmJ/dAsnqC0BvjZ6UZ0pEKgyGPk1TUc6E0YDJ7oPo1GQVMJu8uS4s6nS/Npv
	 tT/fFcUuaPlmmO5+72nBHkmrUm3dMC/3ggPIsFkq1mFkB5e7URiBbQKUNL5OpeJB9eFMk
	 8jXN6iVvxmcZM8+ravkSqoQwNGOa/B19WnbePY7BYNxvhY3rJMvSRsOxyipx8fMCguA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=omwI9uE9;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D9F60A2616
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2D9F60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=omwI9uE9
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jNfbL3XFsz1XLyhw;
	Mon,  9 Nov 2026 19:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1794251639; x=1796843640; bh=BI5cA
	JLbzLyxhSO6GkCitEL343rGe4SQ225WZ5x8QuE=; b=omwI9uE98BmUTvbwHpU2F
	KQihq2F3M93Ze9EwDlP/x25frAWrBZBbm1oqgtuczibubR/+4xGSPhC3OFOpfU53
	Enee09FZkjLQoQ7Bt4fq0xTD6vCqjhRI4lp0P29xL2vdwBWtEMHorDSUMfIASyLL
	iSAixKI9QtIySGKxG8JZNhtGSfBvPhPn9ANyymaFRUtM/kHk12qtvBjkGsvwvvJU
	+QObjFbNAAW1VjT6MUo7EBsBE4Fr6UGoRoOfUiNygikt5LEckCIWM6lvMcrr6uL4
	6XDVlilrwgBhBKuHQY+y9n/3ZXwJj1WveauQSiGxhK2WxoWpzM6u3HkdpkSdIVRq
	A==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id SUnYTMFl_6tM; Mon,  9 Nov 2026 19:13:59 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jNfb94Wr3z1XM6J4;
	Mon,  9 Nov 2026 19:13:57 +0000 (UTC)
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
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 04/14] srcu: Remove check from srcu_dereference_check()
Date: Mon,  9 Nov 2026 11:13:12 -0800
Message-ID: <be6af529d7cdab22b67ee4932df3c23bcee98bee.1794250850.git.bvanassche@acm.org>
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
