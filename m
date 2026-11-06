Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960742;
	b=eeUzr9bw0+7WV9aBKnbXQSpNZbHvvpTWX1HpO2uhRKhxpRq6oR+zFh6WUkPuImEpt7l5
	 Ui4+HP8l4+wxkgphMTQSIu9mk+GfP92UPNkb4pympuAqu2GIe5EoOvzCFPWziWMcUL4eR
	 AM6DhV78Vc0uoMPxzKMm/PVMEJuOjsJFToYJSsFz2Q7IKL+u3sELN8FjrStDCEwgRDY4A
	 iLiRizJSU1oPqm95RY3z75S5NhN2HiVF/3o7Y1JVcClwocpwByyFtb50yRMS8LAXMRK/8
	 76GHGTD0iCRQD2cdQLGLM73gTy8KH3W+H7Opd9K2hsG8TjYT5oqLcHT+XAV5wA6odCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960742;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=tkAKK3CHkJj9GG/l4vTKgbe4L6WMVNUeJEgfHAi9Ijo=;
	b=kwodTntJ4FFYYqeFcfPGOVBoHaKEx5fa1NTX+Ps3bbcnO+i5NKJq3PZWrmcsgE87u6Og
	 6PZDQlOj/YJEJAyug5KqbOawL5JuDeeH2DD5IzLtHO++nSgaE8/BkyMBVFnsZGbLJ+uL3
	 xrNSTwUZjdppXSel2ZeDeLd75KKDrB+vxbXVao7WduOj5l0fiDZHClVVvHsc/hml2kwSQ
	 MncQnOuUxy+dY+gfJcKorJFjWtbGSoivTU1fhudv1ADFcLJ/SHiGBixYtfCWRoGGg0/Jj
	 077tLWrnIBi0HoDrZzQQun11bTtZF9Y0/be5F0hezUMIOBzMRmBQLb+R9UGs1Tp/dBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qwO2C+oX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=pJ4HLI+k;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD25606D810;
	Fri,  6 Nov 2026 10:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAD25606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qwO2C+oX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=pJ4HLI+k
Date: Fri, 06 Nov 2026 10:25:38 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793960739;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=tkAKK3CHkJj9GG/l4vTKgbe4L6WMVNUeJEgfHAi9Ijo=;
	b=qwO2C+oXnI4T+yMLRUDNitWk2jC3nsCU9ny0e+l0xORKYPpUe+LbaE1bOEMCbnRMr6FblJ
	bPvxZ3pfvPuFlR/Q/BQLAxyJhLH2j4/E9ZOYDLapviBAEsDiL53nM3E7GdnW8lSn2EBRbN
	JO/EU1WzmR8gFDmNoruE7cxDiEGfqJHKTvfCPnfbEzH8FUOtzPpNimzr5bJV1tvOBPGcfC
	0MR2L//AjssJqJwnC/voQRu4sBfy3C6jR3LpDZKMnJXMZpTM2fOIrFyp8e4yu6MYSAN+yf
	a271rSoIo01Gv3Vyubjy+0jy5oacTgkRPpHx5N1veutP+EORPIgXafWyZTgeSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793960739;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=tkAKK3CHkJj9GG/l4vTKgbe4L6WMVNUeJEgfHAi9Ijo=;
	b=pJ4HLI+kcF1BUtHjsBYyGSBEAUkAjM0qNypzvlOUYfJRRey2KLSvj1wdopk47Lwogj/yzW
	WSfk2w2HB2v3IaAQ==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/core] locking/osq: Add unlink into osq_wait_next()
Cc: David Laight <david.laight.linux@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Waiman Long <longman@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
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
Message-ID: <179396073826.1009794.11237459163513417710.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/core branch of tip:

Commit-ID:     1e8ba3fcef7b611f522aab2905c0fb88dce15e0d
Gitweb:        https://git.kernel.org/tip/1e8ba3fcef7b611f522aab2905c0fb88dce=
15e0d
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Tue, 15 Sep 2026 13:08:23 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 11:16:24 +01:00

locking/osq: Add unlink into osq_wait_next()

Both callers have a common unlink right after osq_wait_next(),
pull that in and rename.

No functional change intended.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
---
 kernel/locking/osq_lock.c | 53 +++++++++++++++-----------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index 9daf197..11d0d34 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -45,11 +45,12 @@ static inline struct optimistic_spin_node *decode_cpu(int=
 encoded_cpu_val)
  * set to OSQ_UNLOCKED_VAL.
  */
 static inline struct optimistic_spin_node *
-osq_wait_next(struct optimistic_spin_queue *lock,
-	      struct optimistic_spin_node *node,
-	      int old_cpu)
+osq_wait_unlink_next(struct optimistic_spin_queue *lock,
+		     struct optimistic_spin_node *node,
+		     int old_cpu)
 {
 	int curr =3D encode_cpu(smp_processor_id());
+	struct optimistic_spin_node *next;
=20
 	for (;;) {
 		if (atomic_read(&lock->tail) =3D=3D curr &&
@@ -73,19 +74,23 @@ osq_wait_next(struct optimistic_spin_queue *lock,
 		 * wait for a new @node->next from its Step-C.
 		 */
 		if (node->next) {
-			struct optimistic_spin_node *next;
-
 			next =3D xchg(&node->next, NULL);
 			if (next)
-				return next;
+				break;
 		}
=20
 		cpu_relax();
 	}
+
+	/*
+	 * Unlink @node from @next.
+	 */
+	WRITE_ONCE(next->prev_cpu, old_cpu);
+	return next;
 }
=20
 /*
- * Set prev->next; this is the counterpart of osq_wait_next() in that
+ * Set prev->next; this is the counterpart of osq_wait_unlink_next() in that
  * by setting ->next the wait is terminated and progress is resumed.
  */
 static inline void osq_link_next(struct optimistic_spin_node *prev,
@@ -103,11 +108,12 @@ static inline void osq_link_next(struct optimistic_spin=
_node *prev,
 	 *
 	 * And this is CPU2 doing the self-unqueue concurrent against CPU1s
 	 * unlock()/unqueue(). Since 'prev->next =3D=3D NULL' and CPU1 will be
-	 * stuck in osq_wait_next() until the below store of 'prev->next'.
+	 * stuck in osq_wait_unlink_next() until the below store of
+	 * 'prev->next'.
 	 *
 	 * CPU2				CPU1
 	 *
-	 * next->prev =3D prev;		osq_wait_next()
+	 * next->prev =3D prev;		osq_wait_unlink_next()
 	 * WMB				MB
 	 * prev->next =3D next;		next->prev =3D prev
 	 *
@@ -117,7 +123,7 @@ static inline void osq_link_next(struct optimistic_spin_n=
ode *prev,
 	 * CPU2				CPU1
 	 *
 	 * prev->next =3D next // CPU1.n =3D 3
-	 *				next =3D osq_wait_next() // =3D 3
+	 *				next =3D osq_wait_unlink_next() // =3D 3
 	 *				next->prev =3D prev // CPU3.p =3D nil
 	 * next->prev =3D prev // CPU3.p =3D 1
 	 *
@@ -168,9 +174,8 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 					 vcpu_is_preempted(VAL - 1));
=20
 	/* unqueue */
+
 	/*
-	 * Step - A  -- stabilize @prev
-	 *
 	 * Loop until either node->prev_cpu is zero (lock acquired) or we
 	 * atomically change prev->next from node to NULL (stopping prev
 	 * handing on the lock).
@@ -200,26 +205,12 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	}
=20
 	/*
-	 * Step - B -- stabilize @next
-	 *
 	 * Similar to unlock(), wait for @node->next or move @lock from @node
 	 * back to @prev.
 	 */
-
-	next =3D osq_wait_next(lock, node, prev_cpu);
-	if (!next)
-		return false;
-
-	/*
-	 * Step - C -- unlink
-	 *
-	 * @prev is stable because its still waiting for a new @prev->next
-	 * pointer, @next is stable because our @node->next pointer is NULL and
-	 * it will wait in Step-A.
-	 */
-
-	WRITE_ONCE(next->prev_cpu, prev_cpu);
-	osq_link_next(prev, next);
+	next_cpu =3D osq_wait_unlink_next(lock, node, prev_cpu);
+	if (next_cpu)
+		osq_link_next(prev, next_cpu);
=20
 	return false;
 }
@@ -245,7 +236,5 @@ void osq_unlock(struct optimistic_spin_queue *lock)
 		return;
 	}
=20
-	next =3D osq_wait_next(lock, node, OSQ_UNLOCKED_VAL);
-	if (next)
-		WRITE_ONCE(next->prev_cpu, 0);
+	osq_wait_unlink_next(lock, node, OSQ_UNLOCKED_VAL);
 }
