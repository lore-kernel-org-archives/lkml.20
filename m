Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960743;
	b=yisJeIaxKkn+WuqQ50Vch/Yi0+wvx1PiA2ZsYFOoRlu7iIZNh0xZj7Y1P6wTPDIEpdTq
	 /MgJQcePtM6jVkl2Fk1QlHa9DDI60o1MqR7V5+j+4Yf9L/OoxvvOSBNTCt7Dahr9gf5ru
	 vweKa3GaoGrGmdbIsCdlXLUVxL3F0ydNE8z9cboVcA2CXnKfwg5mefZJRNCpEw4DnXqbA
	 cfaizx6P/gOLWmVVKVVN84LJfaWhbj3p474rPtzsVmkzI63oZ93t/MWz8J59MLQrRpDo0
	 ynBPelN+FPDlD3O83pMzpFujJJKL7WucsEtV24cn/0KlZXd9/b40amTY4Bp9zj2NTtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960743;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=JXbEKa0xJY8uIwFRKXC05Kodw2b6tQ0R3iTy8dUcVO4=;
	b=ri4LuINfDJgyg2p/r18js0P0vWad/ejbbwwGyJvCeBbkwlnTT3VrLJisqm6HocWd/pxk
	 yoSOXy1T1kjaW8KMlI4teaD5BcnWnxCXOfeNeJ4rACThLzIszwCx9VbolN0r76mRkHvnH
	 XZ0CqNQBhh7WVThvM8lKPdj3NNFgpEcnW/9TsYUg4iHakrLMwf6/3ook7PsySxmeukROu
	 VAvxDwXl2zZ/YBb64g/EihlQv81bAXq32Zqq8hKChvwjhsH9PEJYXQHid7FGlRXkaI7n1
	 3O4kQ9u6B241V+Po5QI42UJW/N3licjHELakQgpXOB/WlkR3Gzy5nYllKXFoVa449tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=iuNt2NkZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="tmo5H/9G";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7E5606A330;
	Fri,  6 Nov 2026 10:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A7E5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=iuNt2NkZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tmo5H/9G
Date: Fri, 06 Nov 2026 10:25:39 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793960741;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JXbEKa0xJY8uIwFRKXC05Kodw2b6tQ0R3iTy8dUcVO4=;
	b=iuNt2NkZff1X+suCPYFKodZKMMRsEmFa+46R8uHHaRXLJ/GDOBRWs323XJ+6izv6FmW/LH
	sqXKouyNfGutfjyyrnfut4j5Pvo9Cvf28E44pWhSRtfqqB+2WYYi0TS8UtKzexLHJSc/Sf
	HqYJNJvn/yToJwUqAm8tR/PNbdPQdi6890/ZeWmIHBNYDKgCoHsHDaAHlNJ458AbLe+k1k
	6sqXISSoWT5jBYk8v0Zz60pRwBwOuAA3Lvbgwvc+buWkdDVMuOGnfAPtOns5LVsKP92+Rb
	JD6R6L2uXXF0gR+CHw0QlvyDMBuZYBw/QDWKF6ZL1RWFj9Jx6+mwGaSZcqwT5w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793960741;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JXbEKa0xJY8uIwFRKXC05Kodw2b6tQ0R3iTy8dUcVO4=;
	b=tmo5H/9G6d5T8gqsJitCTaEZ0BnC350iu598ZqKvT3X4cNbSInP2GyEpzuGr5y+absfAbv
	+PV78iibz0OcqEBA==
From: "tip-bot2 for David Laight" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/core] locking/osq: Set prev_cpu=0 instead of locked=1
Cc: David Laight <david.laight.linux@gmail.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Waiman Long <longman@redhat.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260907084133.3696-4-david.laight.linux@gmail.com>
References: <20260907084133.3696-4-david.laight.linux@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179396073975.1009794.11832575250659093039.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/core branch of tip:

Commit-ID:     ee2e144a4e8538c4d2de0301792b03608b79e71e
Gitweb:        https://git.kernel.org/tip/ee2e144a4e8538c4d2de0301792b03608b7=
9e71e
Author:        David Laight <david.laight.linux@gmail.com>
AuthorDate:    Mon, 07 Sep 2026 09:41:27 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 11:16:24 +01:00

locking/osq: Set prev_cpu=3D0 instead of locked=3D1

There is no need for separate prev_cpu and locked members of struct
optimistic_spin_node. Using a single field simplifies the code slightly. It
also removes any possibility of the two values being out of sync.

[ peterz: Removed the random prev_node store ]

Signed-off-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Waiman Long <longman@redhat.com>
Link: https://patch.msgid.link/20260907084133.3696-4-david.laight.linux@gmail=
.com
---
 kernel/locking/osq_lock.c | 45 ++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index ee1f69b..9daf197 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -14,7 +14,6 @@
=20
 struct optimistic_spin_node {
 	struct optimistic_spin_node *next;
-	int locked; /* 1 if lock acquired */
 	int prev_cpu; /* CPU number offset by 1 */
 };
=20
@@ -134,7 +133,6 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	int curr =3D encode_cpu(smp_processor_id());
 	int prev_cpu;
=20
-	node->locked =3D 0;
 	node->next =3D NULL;
=20
 	/*
@@ -166,44 +164,39 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * is implemented with a monitor-wait. vcpu_is_preempted() relies on
 	 * polling, be careful.
 	 */
-	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
-				  vcpu_is_preempted(node->prev_cpu - 1)))
-		return true;
+	prev_cpu =3D smp_cond_load_relaxed(&node->prev_cpu, !VAL || need_resched() =
||
+					 vcpu_is_preempted(VAL - 1));
=20
 	/* unqueue */
 	/*
 	 * Step - A  -- stabilize @prev
 	 *
-	 * Undo our @prev->next assignment; this will make @prev's
-	 * unlock()/unqueue() wait for a next pointer since @lock points to us
-	 * (or later).
+	 * Loop until either node->prev_cpu is zero (lock acquired) or we
+	 * atomically change prev->next from node to NULL (stopping prev
+	 * handing on the lock).
+	 * Note that 'prev' can unlink itself concurrently with this
+	 * test so that prev/prev_ptr can be stale, but since it
+	 * is per-cpu data the memory can always be read.
 	 */
=20
 	for (;;) {
-		/*
-		 * cpu_relax() below implies a compiler barrier which would
-		 * prevent this comparison being optimized away.
-		 */
+		if (!prev_cpu) {
+			smp_acquire__after_ctrl_dep();
+			return true;
+		}
+
+		prev =3D decode_cpu(prev_cpu);
+
 		if (data_race(prev->next) =3D=3D node &&
 		    cmpxchg(&prev->next, node, NULL) =3D=3D node)
 			break;
=20
 		/*
-		 * We can only fail the cmpxchg() racing against an unlock(),
-		 * in which case we should observe @node->locked becoming
-		 * true.
+		 * 'prev' must have unlinked (or be in the process of unlinking)
+		 * itself from the list.
 		 */
-		if (smp_load_acquire(&node->locked))
-			return true;
-
 		cpu_relax();
-
-		/*
-		 * Or we race against a concurrent unqueue()'s step-B, in which
-		 * case its step-C will write us a new @node->prev pointer.
-		 */
 		prev_cpu =3D READ_ONCE(node->prev_cpu);
-		prev =3D decode_cpu(prev_cpu);
 	}
=20
 	/*
@@ -248,11 +241,11 @@ void osq_unlock(struct optimistic_spin_queue *lock)
 	node =3D this_cpu_ptr(&osq_node);
 	next =3D xchg(&node->next, NULL);
 	if (next) {
-		WRITE_ONCE(next->locked, 1);
+		WRITE_ONCE(next->prev_cpu, 0);
 		return;
 	}
=20
 	next =3D osq_wait_next(lock, node, OSQ_UNLOCKED_VAL);
 	if (next)
-		WRITE_ONCE(next->locked, 1);
+		WRITE_ONCE(next->prev_cpu, 0);
 }
