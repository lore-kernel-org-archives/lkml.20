Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960745;
	b=2ZPacB1yc8Haxq1d1GYNgUs+ybufqrLWPV6AxeI9mdT1DEALPwT/zxitPeGn0F4G4tDo
	 BAehNFkgd3HytJpx/f3FZfw9LgmOBumIni2U15YDPKZRHS/mJ/u77+lulEGYjeSzNcf5F
	 QMh3l50XtobNbKAfH/g4nVNMLicOJ2oCI2cJZUZ8kaeCbG4lL+UXDxDmbmpY4hO74I1w6
	 aNB8siwrMG+FXjkVruRUMs1BGfPKW8XME+7q2VUDNprPA9a2DbQeLjp3KQWV3Dx76vhul
	 Xp+xdS/sINDM54MAoKWitAwHpl7xWrPPKOOprLuql6inifVxLBLHMMC6zBUSBqrD25g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960745;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=agWbbIG4gpUGe4EbhAPAJRARSVYN9gP1AUJ10RFb9zM=;
	b=q9+I9ZV2Wn7/o0QCPe5u/tNhgTDWhXztfrekoFatQuwV9paNaB5C6ILwqRa970TmPJOd
	 hWBf8Gqm7xi1UsGTAWXZ5CSBc0SY2yHlXO00AtRKcE72mTJIcGp6yRrYHBrajag0MicnD
	 jtuGVtjp1UAyxTjgQLPEjKH0tks19J23e2VOdFtNYU2PbaAOKs7vmmK+ePRmGSCu+8f/A
	 jheIERAwF1aIXnrlJLkocpsGxgL9JNyCZEv8J0X2rgqOTU/+YmOBZlqXbvi/JOI98dk6y
	 /j8kmUAqa2/NRAmrMSr0m9Tb9yOwQ+R/dkhhu4yCAdEquyXK5H9ZlKFD3PZQ/uBZ2WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qzxCDa2j;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7qyiJxwO;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBFC606D832;
	Fri,  6 Nov 2026 10:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBFC606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qzxCDa2j;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7qyiJxwO
Date: Fri, 06 Nov 2026 10:25:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793960743;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=agWbbIG4gpUGe4EbhAPAJRARSVYN9gP1AUJ10RFb9zM=;
	b=qzxCDa2jsmUhz/p6+BaJsEJA6noOxbikRuWh/HVc0WKX8lPwqKzhKUqhMxEz2C76KTvggZ
	Dpm/Ml6SWJ5+ry4CgpzApqn8qSpx/bUa7MeDkrLG8wVAuoMGm3gfaNGo300wrLZAeClaY+
	zp9mtYzI0IQTxflXJJi/w4ieDmBHqXdrBT4kY7Dty/y8qG5oqwTD5O5dWc1jfM5v5skikO
	PeGgmLBUoHO9uhGCTh1fnBNcW0uQkh9bdNk470IbJYe46ELnU9MQEtIgqaoe/yCI+QoFpj
	gzu2U+6t5+HOolE0GGvVlbrOXXyUVNpttMXKCW2wSnj8VCGtnkUNe75V/O1rsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793960743;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=agWbbIG4gpUGe4EbhAPAJRARSVYN9gP1AUJ10RFb9zM=;
	b=7qyiJxwOd0t4v0zF75CPUaL7yE0rSvblPb4aJTI2ZA7FkNLvEE82cuh3+mhe30/kFyDUSH
	Wa0VGHq69SW242BQ==
From: "tip-bot2 for David Laight" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/core] locking/osq: Save the CPU number for 'prev', not
 the node address
Cc: David Laight <david.laight.linux@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Waiman Long <longman@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260907084133.3696-3-david.laight.linux@gmail.com>
References: <20260907084133.3696-3-david.laight.linux@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179396074127.1009794.6674908998137430262.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/core branch of tip:

Commit-ID:     72c440a4e225879063809c3d0bcdd7e6544069fe
Gitweb:        https://git.kernel.org/tip/72c440a4e225879063809c3d0bcdd7e6544=
069fe
Author:        David Laight <david.laight.linux@gmail.com>
AuthorDate:    Mon, 07 Sep 2026 09:41:26 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 11:16:24 +01:00

locking/osq: Save the CPU number for 'prev', not the node address

The CPU number of node->prev is needed for both the vcpu_is_preempted()
test and to update lock->tail. This saves reading the cache line for
the other CPU's per-CPU data.

The CPU member of optimistic_spin_node is no longer needed.

[ peterz: Renamed stuff ]

Signed-off-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Reviewed-by: Waiman Long <longman@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://patch.msgid.link/20260907084133.3696-3-david.laight.linux@gmail=
.com
---
 kernel/locking/osq_lock.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index 984fa11..ee1f69b 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -13,9 +13,9 @@
  */
=20
 struct optimistic_spin_node {
-	struct optimistic_spin_node *next, *prev;
+	struct optimistic_spin_node *next;
 	int locked; /* 1 if lock acquired */
-	int cpu; /* encoded CPU # + 1 value */
+	int prev_cpu; /* CPU number offset by 1 */
 };
=20
 static DEFINE_PER_CPU_SHARED_ALIGNED(struct optimistic_spin_node, osq_node);
@@ -29,11 +29,6 @@ static inline int encode_cpu(int cpu_nr)
 	return cpu_nr + 1;
 }
=20
-static inline int node_cpu(struct optimistic_spin_node *node)
-{
-	return node->cpu - 1;
-}
-
 static inline struct optimistic_spin_node *decode_cpu(int encoded_cpu_val)
 {
 	int cpu_nr =3D encoded_cpu_val - 1;
@@ -137,11 +132,10 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	struct optimistic_spin_node *node =3D this_cpu_ptr(&osq_node);
 	struct optimistic_spin_node *prev, *next;
 	int curr =3D encode_cpu(smp_processor_id());
-	int old;
+	int prev_cpu;
=20
 	node->locked =3D 0;
 	node->next =3D NULL;
-	node->cpu =3D curr;
=20
 	/*
 	 * We need both ACQUIRE (pairs with corresponding RELEASE in
@@ -149,12 +143,12 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * the node fields we just initialised) semantics when updating
 	 * the lock tail.
 	 */
-	old =3D atomic_xchg(&lock->tail, curr);
-	if (old =3D=3D OSQ_UNLOCKED_VAL)
+	prev_cpu =3D atomic_xchg(&lock->tail, curr);
+	if (prev_cpu =3D=3D OSQ_UNLOCKED_VAL)
 		return true;
=20
-	prev =3D decode_cpu(old);
-	node->prev =3D prev;
+	prev =3D decode_cpu(prev_cpu);
+	node->prev_cpu =3D prev_cpu;
 	osq_link_next(prev, node);
=20
 	/*
@@ -173,7 +167,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * polling, be careful.
 	 */
 	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
-				  vcpu_is_preempted(node_cpu(node->prev))))
+				  vcpu_is_preempted(node->prev_cpu - 1)))
 		return true;
=20
 	/* unqueue */
@@ -208,7 +202,8 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 		 * Or we race against a concurrent unqueue()'s step-B, in which
 		 * case its step-C will write us a new @node->prev pointer.
 		 */
-		prev =3D READ_ONCE(node->prev);
+		prev_cpu =3D READ_ONCE(node->prev_cpu);
+		prev =3D decode_cpu(prev_cpu);
 	}
=20
 	/*
@@ -218,7 +213,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * back to @prev.
 	 */
=20
-	next =3D osq_wait_next(lock, node, prev->cpu);
+	next =3D osq_wait_next(lock, node, prev_cpu);
 	if (!next)
 		return false;
=20
@@ -230,7 +225,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * it will wait in Step-A.
 	 */
=20
-	WRITE_ONCE(next->prev, prev);
+	WRITE_ONCE(next->prev_cpu, prev_cpu);
 	osq_link_next(prev, next);
=20
 	return false;
