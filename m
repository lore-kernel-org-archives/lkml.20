Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960742;
	b=JtL/YkYm4HrC6QAE97ImrTn0S3+lcNZwRn5dP9SqmPNA1jLYTBeiQwKndabJt1ulUr5/
	 PnEZJjnftq4EDDrR2ED++sPxaKQIoD26PVN04ucaBRl/aW3ocrS72szlygdXY4eXboxTM
	 tjEeV2zp9GRhrHrrvux+x48WCnRpSdWRi13VGIjS169ulnt41sdmoGwqNGRqzirWidSNB
	 bC2uOLbLC2wQm7PWBOTTbtSNhnTO/GDIn/03x2V4rj7K6KESouFUXv/4VnQ+UV8nSERYO
	 pC9/alMRbzJ0M35wQ/3r1aXHZFF7sH1qNOqbCZxLEegE7/4exzwVSOt2T0eprby/n6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960742;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=IwhL11IItbx+UkuTZLNhKV2dLMeWlpqPP0VOCiIgkaU=;
	b=umK0XMuPkiEkXdlxgQHZadusOvtoJKk5E2KJcgWDt3wy2RxhoPY2kNisKRV2srCqsCCs
	 TBZRuAxMxAu+qdzfB5QI0jpnzwG05bHn4WuSE7OxAYDw9R67tURg7HYeJ2ZuKiUv04p06
	 v7i0KJ1EQS8OO7HgnSO6y8cdxAxKZlvJLNj9j6WrXDe8eo5MMkddKlCt3bau2PxWMUQVF
	 wryzpb8Syas4jE7TMuGxfBpWdCPc8ff19VZVykd/7rIpUG0QxnvQ63F2IATApX+ITNob8
	 ixAdCbdBvDwZHDsQypCgYjRn4zz77bGY6mIGwbWxYN2YBOSlwyyYykoczBJ8MTufWDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QcKpG3kV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CItvqAHL;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC7D606A32C;
	Fri,  6 Nov 2026 10:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC7D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QcKpG3kV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CItvqAHL
Date: Fri, 06 Nov 2026 10:25:36 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793960738;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=IwhL11IItbx+UkuTZLNhKV2dLMeWlpqPP0VOCiIgkaU=;
	b=QcKpG3kVFNntlV7cvyy6KTZBGi71KXpl3CebGmY4urOdCFq7GY6Npi7iVkokgZrDeUMRdn
	8CWQHJTNYbS+H+4ZKrT9vOfXV5kY3yOsFP3cIETTpSzuS6WPqsyp4pzFrHHyP+t4okd3P7
	7ZlyYjkdeWRDZX1EOkry/StfjxcREB/LJomuaMJbZQYcrKbkrLkOs8aSUGTjcoJWXY7EEB
	efHXf5OtPIacKwFG29idt6K5W+B8bM/JrwNWOTi2QtVUb57Klih7PiRpSgOsjX/zUy2b0O
	0k7omdLHpL1tNMVgIEXBsg26y58cr3o3Kb9XWP2K0Lc7gq93C9cXio/iY7doQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793960738;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=IwhL11IItbx+UkuTZLNhKV2dLMeWlpqPP0VOCiIgkaU=;
	b=CItvqAHL+IvxEeCusaZ03zlDyjp3dgfv2QRB5oBWvDQcllAedzKpY9AALL7XlTNhRViApC
	TLJRX3FKI7p2g/Ag==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: locking/core] locking/osq: Remove osq_wait_unlink_next(.node) argument
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
Message-ID: <179396073678.1009794.17086241810080169681.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/core branch of tip:

Commit-ID:     fc5209beeec87d7a5c6a5fc5054041f106f0317c
Gitweb:        https://git.kernel.org/tip/fc5209beeec87d7a5c6a5fc5054041f106f=
0317c
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Tue, 15 Sep 2026 13:27:35 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 11:16:24 +01:00

locking/osq: Remove osq_wait_unlink_next(.node) argument

In both cases, @node is always this_cpu_ptr(&osq_node), don't
bother passing it along.

No change in functionality intended.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 kernel/locking/osq_lock.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index 11d0d34..e3cd066 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -46,11 +46,10 @@ static inline struct optimistic_spin_node *decode_cpu(int=
 encoded_cpu_val)
  */
 static inline struct optimistic_spin_node *
 osq_wait_unlink_next(struct optimistic_spin_queue *lock,
-		     struct optimistic_spin_node *node,
 		     int old_cpu)
 {
+	struct optimistic_spin_node *next, *node =3D this_cpu_ptr(&osq_node);
 	int curr =3D encode_cpu(smp_processor_id());
-	struct optimistic_spin_node *next;
=20
 	for (;;) {
 		if (atomic_read(&lock->tail) =3D=3D curr &&
@@ -208,7 +207,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	 * Similar to unlock(), wait for @node->next or move @lock from @node
 	 * back to @prev.
 	 */
-	next_cpu =3D osq_wait_unlink_next(lock, node, prev_cpu);
+	next_cpu =3D osq_wait_unlink_next(lock, prev_cpu);
 	if (next_cpu)
 		osq_link_next(prev, next_cpu);
=20
@@ -236,5 +235,5 @@ void osq_unlock(struct optimistic_spin_queue *lock)
 		return;
 	}
=20
-	osq_wait_unlink_next(lock, node, OSQ_UNLOCKED_VAL);
+	osq_wait_unlink_next(lock, OSQ_UNLOCKED_VAL);
 }
