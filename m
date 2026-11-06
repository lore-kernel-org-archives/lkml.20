Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960739;
	b=xK1ExVMQk3e8GT0/Y5ZTJsjIaXhrf11pvLKj6L/81Z5DJaNUy01FAiZr/cs0Bd3SnJ2Q
	 7YfeXDx89W9lPqHY5JhWH7ZBS5jGiTmF09FbB+FM/YvlCPQsr2aQzV1H+MAKBrwkLGdAF
	 PZuCAdOX+Xd0k1KT3f/GJtt4kSTctXbY6ZGnl/L5r3soiYatAEe2avs7APdgNZr3CKFtc
	 /TvqQ89VnxvPrpKb9EW2aHAUNHTnOFBvVuC66WBMMiU5oE2vcVHDVafX8mcStAr07W20n
	 Xzh1xyaA+HVlxNSJG5BFtGEU76ZcB/iviUC3gcBTakyga0aUI5DS+tWjuYhpG2cyiHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960739;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=PdjXFx4zV68BP51Xy+u5/i6Dpb3byJ8clKNfpHZbls4=;
	b=Qpgmyz2PsoNkJxexm9TjsNbNxNlnexjVFR7BZazxoqXBFX3n3Wb+AusMOjQo0C/xlb1S
	 z6IoCFu17IYQi+rBQYwi4gPmOIzm/746zXVEAuxRUdzbwiiYfYvQcbRlyv/TklBbfv7pI
	 CMt3viXgCDMWMuH4+ZbTz6XrnF2HiIcoufdDtHybpG5u9p3RwuG6yKC5tBXNkfp/AxIWA
	 vv3FUGwHIlYNISG2UUokn06gM39M8uISUgTxSI7FV4bCyeJXr0jA2y1tL9RolfAYm3K6o
	 9d4WcDjm3eW5wnjEJe0RvuLfLJ8FwY8kf9nR8sqrWLdsvrZRNliBoHSsmDnlZ8b2CpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cUbmYP5x;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yvlDjfaY;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9FB606A331;
	Fri,  6 Nov 2026 10:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9FB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cUbmYP5x;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yvlDjfaY
Date: Fri, 06 Nov 2026 10:25:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793960736;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=PdjXFx4zV68BP51Xy+u5/i6Dpb3byJ8clKNfpHZbls4=;
	b=cUbmYP5xkFAM0/8TOBEwCOVFsF9S8ZjkbgC7j0HPSd591yVuPqt6EL0CDs7ZBgLkFekHDY
	D2R4OzGLHXJjgqc/XArJdfZIKwJz7SjcMYlQ18AaRBNoxl8S4wgNXCNXntTLewlzpciof6
	W8APKIRCjbt/ONqFsgWneSqpStOdWD/oPCuTz/omaD9/20MlCF8mcOcwYELPPSemhb1esD
	RKQmzI4SK+NAlNbUKs2nJ4NXheeZYs4Q8PyX5CsI6w9sWig+3A6NUZydGcrzKpxcYqxtgD
	2yZXvGwhJKa49h7qQ25eU9Nu/4C6kNVIWxy1Mz5U/83bKWgw9IJ0BtBKQ/Wn7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793960736;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=PdjXFx4zV68BP51Xy+u5/i6Dpb3byJ8clKNfpHZbls4=;
	b=yvlDjfaYgGEPYw6isUivj3qv+KpMWO0RmDHQkMYkTsnuVl1F9UvMG3+lPdbT0OFBont6QN
	OCOtPGFy/3i669Ag==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/core] locking/osq: Simplify osq_unlock()
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
Message-ID: <179396073498.1009794.4001275843640268957.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/core branch of tip:

Commit-ID:     4a701e4af8215226807c59915ed5d2ffbcde070f
Gitweb:        https://git.kernel.org/tip/4a701e4af8215226807c59915ed5d2ffbcd=
e070f
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Tue, 15 Sep 2026 15:54:34 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 11:16:24 +01:00

locking/osq: Simplify osq_unlock()

It is now easy to observe that the start of osq_unlock() and the
body of osq_wait_unlink_next() are in fact identical and there is
no point in repeating this code.

No change in functionality intended.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 kernel/locking/osq_lock.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index e3cd066..a6c89e5 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -216,24 +216,5 @@ bool osq_lock(struct optimistic_spin_queue *lock)
=20
 void osq_unlock(struct optimistic_spin_queue *lock)
 {
-	struct optimistic_spin_node *node, *next;
-	int curr =3D encode_cpu(smp_processor_id());
-
-	/*
-	 * Fast path for the uncontended case.
-	 */
-	if (atomic_try_cmpxchg_release(&lock->tail, &curr, OSQ_UNLOCKED_VAL))
-		return;
-
-	/*
-	 * Second most likely case.
-	 */
-	node =3D this_cpu_ptr(&osq_node);
-	next =3D xchg(&node->next, NULL);
-	if (next) {
-		WRITE_ONCE(next->prev_cpu, 0);
-		return;
-	}
-
 	osq_wait_unlink_next(lock, OSQ_UNLOCKED_VAL);
 }
