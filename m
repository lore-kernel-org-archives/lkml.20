Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960388;
	b=vBg81althZBeln5+1VKQRftdcVPsDYUV0Tf16ELT/A86FPtDEMCIL6UzWHjDx1SBge7E
	 1y+Vd7E3KDwiBw/AWILETJoRUyl5VkMcIZ73M5PJHau3WBdk3ll4iNW40plTlRQNfrb+Y
	 gJZ+Wnsz2A46EM4VBPP5r9d5vUHTTc1vMj/CqPfUwTbj4IX1I3dPfPV0hLRGgvcOW/kmm
	 GwcDiDPqBDBIlrYpCWxU+CTw9vy00yaeJFcEeoQKbo4DXG+WkvrPMvx1ISsosGZdmh58e
	 i3lg1AXYTkjx8KkqV76uNPb/0x257NCp6NsECBMtOXU6mKRuWMiX47HIW33uopUxnWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960388;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=R82BS7g33XL5O8Vki5r+nohNubS/w5kTkPYHt8eGc6U=;
	b=O4RzMdJEOkrHETUFP9rGmboA3cXCo/hAHDNwpSlf3YYvVBvDQu75ePqYcTgEFjlGBGOG
	 eqVznua7WSAgDBNd8HfdI0mjkv3K35hG1DezykLnx4Ma+SKETUZVbfMWqzMYlf/2j5krP
	 /E2zCWzBpohYeNLxpq4oewvqv6fxOrGf95n5EtGexjLmJ4fmUCuX/c7H9y4eUGCAjPI9Z
	 v28kE8ob4tOSc2NSByylylKMlyxxQWlQY1Y5TcfVbr2SsMucDW7N6hp7Xt6d1qKK2ZuAs
	 ZjqcExxnbquSZvNldedLRV6R3ZRU4zGsrBlyS603u0uf1slRwSLbC87weEPNADpx6QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=21ZUQ2z5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7wYt8SEx;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2B7606A32F;
	Fri,  6 Nov 2026 10:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C2B7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=21ZUQ2z5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7wYt8SEx
Date: Fri, 06 Nov 2026 10:19:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793960385;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=R82BS7g33XL5O8Vki5r+nohNubS/w5kTkPYHt8eGc6U=;
	b=21ZUQ2z54d0XcHqnT9v85PTxFNwfRDlKeBYbGEHnHXheKcy/t+OHGrTXVL8f0hNHKopynF
	znfY3Tn2b6L5qBenvC+oRjhX9d+c1Cjf06tsfNSY3IAOSP9o7sFZw7porzaaEJWcxjRHyd
	FkKjxBHr+KyAhpvsUawTF7jLjRYw147EiQWETYnrDo289ZCV3nrGK163opHHNjgpleH5C2
	Sfq4+LWfxDid7xdGepTgKGTt+V4XPV/xvY6Z2t8XG5R4/OseVZlhYG626DJ4ow0HpyF813
	2bZ7xGWmdi9Mdo3uS0EKVOg2/+gmcY0lJOcNy1mi+sE1e4PdPpSWVl1GFLDK6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793960385;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=R82BS7g33XL5O8Vki5r+nohNubS/w5kTkPYHt8eGc6U=;
	b=7wYt8SExxF2AKL9+7Td4GhsDEckGuxnKf9DGYtjYfCza1qKHm0okiVwxCCiPro0U4FqLUG
	Yw8b+sryL3hE/wCg==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/urgent] locking/osq: Fix unlink queue corruption
Cc: David Laight <david.laight.linux@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179396038359.1009794.1549407973153751210.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     408b129aac48b574c0c9d11137a89eefba825d5d
Gitweb:        https://git.kernel.org/tip/408b129aac48b574c0c9d11137a89eefba8=
25d5d
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Tue, 15 Sep 2026 13:51:12 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 11:16:14 +01:00

locking/osq: Fix unlink queue corruption

Very similar to commit 50972fe78f24 ("locking/osq_lock: Fix osq_lock
queue corruption"), make sure to order the prev->next store against
the next->prev store.

Fixes: 50972fe78f24 ("locking/osq_lock: Fix osq_lock queue corruption")
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 kernel/locking/osq_lock.c | 60 ++++++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 15 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index 98b12d7..2bcc148 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -90,6 +90,49 @@ osq_wait_next(struct optimistic_spin_queue *lock,
 	}
 }
=20
+/*
+ * Set prev->next; this is the counterpart of osq_wait_next() in that
+ * by setting ->next the wait is terminated and progress is resumed.
+ */
+static inline void osq_link_next(struct optimistic_spin_node *prev,
+				 struct optimistic_spin_node *next)
+{
+	/*
+	 * Suppose:
+	 *
+	 *                   tail
+	 *                    |
+	 *                    V
+	 *   CPU1 -> CPU2 -> CPU3:
+	 *   n: 2    n: 3    n: nil
+	 *   p: nil  p: 1    p: 2
+	 *
+	 * And this is CPU2 doing the self-unqueue concurrent against CPU1s
+	 * unlock()/unqueue(). Since 'prev->next =3D=3D NULL' and CPU1 will be
+	 * stuck in osq_wait_next() until the below store of 'prev->next'.
+	 *
+	 * CPU2				CPU1
+	 *
+	 * next->prev =3D prev;		osq_wait_next()
+	 * WMB				MB
+	 * prev->next =3D next;		next->prev =3D prev
+	 *
+	 * Without the WMB it would be possible to have conflicting stores
+	 * like:
+	 *
+	 * CPU2				CPU1
+	 *
+	 * prev->next =3D next // CPU1.n =3D 3
+	 *				next =3D osq_wait_next() // =3D 3
+	 *				next->prev =3D prev // CPU3.p =3D nil
+	 * next->prev =3D prev // CPU3.p =3D 1
+	 *
+	 * Which would result in list corruption.
+	 */
+	smp_wmb();
+	WRITE_ONCE(prev->next, next);
+}
+
 bool osq_lock(struct optimistic_spin_queue *lock)
 {
 	struct optimistic_spin_node *node =3D this_cpu_ptr(&osq_node);
@@ -113,20 +156,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
=20
 	prev =3D decode_cpu(old);
 	node->prev =3D prev;
-
-	/*
-	 * osq_lock()			unqueue
-	 *
-	 * node->prev =3D prev		osq_wait_next()
-	 * WMB				MB
-	 * prev->next =3D node		next->prev =3D prev // unqueue-C
-	 *
-	 * Here 'node->prev' and 'next->prev' are the same variable and we need
-	 * to ensure these stores happen in-order to avoid corrupting the list.
-	 */
-	smp_wmb();
-
-	WRITE_ONCE(prev->next, node);
+	osq_link_next(prev, node);
=20
 	/*
 	 * Normally @prev is untouchable after the above store; because at that
@@ -202,7 +232,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 */
=20
 	WRITE_ONCE(next->prev, prev);
-	WRITE_ONCE(prev->next, next);
+	osq_link_next(prev, next);
=20
 	return false;
 }
