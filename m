Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960389;
	b=lv7NGVxotIVa3N/BATI9s63hqh59/ixit6r1U9wz3lk8Pry9XrrUsp1NqEsBXO2Js5u7
	 bGG/Te6Yegvdr4CPqdqk9wMVNXa5IugKiSdYPxOr3PawQLI5c7TLDg+zpLFO5uoQSoymG
	 CIeBjcfD8MGysYXQfW5qy0V9ZnR4gLUSAWvS6IC0PAFphJpVb2x/olBnQjDGwb8Zf9Aro
	 iHtUNJw9nwF6543icLjr+gKUhiLjoSSTBbnywe0gvAf1csgqHNUBbeqNCnMiQTg/Eh2l0
	 j89iPcu4uHeYlvpdGgEmsujVZBPEF/7MdS6NtyeHgqRw29fddBbk8siOX/+6mFBEk7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960389;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:MIME-Version:Message-ID:Robot-ID:Robot-Unsubscribe:
	 Precedence:Content-Type:Content-Transfer-Encoding;
	bh=/szd/kjx5OIvlkgTTI5PTJT4UKiSLwpZw2q+Cv5yeKs=;
	b=YsimOOv0LE+Hn/FgstZJQ6lkbGDTudUYVO1XqCrT4xM3hilt+gjfsTritPK/eJ+S0WuN
	 nWGkcir6oZqnAacw8bt9ZjeClOyG/dWKz6vlJ9CsYXehKHKY8YpG/Evm8lxz7Tj3MN29w
	 GsTKcT1kE8SjW2DbO8xOLQLEppQgckS/dBqcuMmTh/czyFS5qTRDzOhXSrmV7rG13P/PJ
	 LTUaSpTEd9GDjUqPvXZRzZ39bXeQCq4umgmCecsEscCHFclgsEuBb1M3bS+ARxq+orp1B
	 OEQE6TVJRok+y/QMFkViGs7z79ItaErB0YC/PB4PirDDgg0VMrUGviBzUxgMLsSrlVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zwKrOMIx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="XOhIF/BZ";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9820606A336;
	Fri,  6 Nov 2026 10:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9820606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zwKrOMIx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XOhIF/BZ
Date: Fri, 06 Nov 2026 10:19:45 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793960387;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=/szd/kjx5OIvlkgTTI5PTJT4UKiSLwpZw2q+Cv5yeKs=;
	b=zwKrOMIxUF279hfi3jboWoJuy0R0ppuTeEgbLiuOhinG3/SoM4o0Wdl+Qvgt9gzp3BrRv9
	gh9S6m7En0mUsmetBJzuPDbODO9ZCeIsvZaPPxp5iBLQyyrQPSovWy4JZxd2kExorHTf6H
	3egyDE1s57rPQzmSfFfUPYlQArMfgXTaORCOIANnjZtJATVxl7GzlXgHUBAmwD0hki+G8A
	TD31pBRzVAUyMTtdSUh9Ja6FuL3eFeiI+jqCHcIKHY+Hrqf3m3nkNzCrHMCWz7Esb0+ctl
	eGYJSc6BaxzlievzeHkwY0Bmz6N/8YVav6FYRY6oZemxV2JaJUaYumMVXTWYYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793960387;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=/szd/kjx5OIvlkgTTI5PTJT4UKiSLwpZw2q+Cv5yeKs=;
	b=XOhIF/BZjLJ1xIPQT60BHVJl8wUvS3swZ0gb8dLOMZKsek+6jqmdg7oD5i43qzle7o2td7
	XQGUxx9Him7+VjCw==
From: "tip-bot2 for Peter Zijlstra" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/urgent] locking/osq: Switch
 osq_wait_next()/atomic_cmpxchg() ordering
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
Message-ID: <179396038563.1009794.8520787558050711261.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     1b9e01fcc47aff00d2fd64693c5dcd620eff5865
Gitweb:        https://git.kernel.org/tip/1b9e01fcc47aff00d2fd64693c5dcd620ef=
f5865
Author:        Peter Zijlstra <peterz@infradead.org>
AuthorDate:    Tue, 15 Sep 2026 13:09:33 +02:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 11:16:14 +01:00

locking/osq: Switch osq_wait_next()/atomic_cmpxchg() ordering

The atomic_cmpxchg() in osq_wait_next() removes the current CPU's node
from the tail of the queue and puts @old_cpu back.

This is very much like an 'unlock', which is RELEASE, rather than
ACQUIRE.

Additionally, on success (the only case where the ordering is
effective), this returns NULL which means both callsites will do nothing
more, there are no subsequent operations to order against.

Furthermore, the osq_lock() caller will then return false, indicating
failure to acquire -- the mutex must go block. Again, not making a case
for ACQUIRE.  Neither atomics nor locks provide ordering on failure.

Since ACQUIRE makes no sense, while RELEASE makes it more symmetric with
osq_unlock(), switch the ordering. This then makes osq_unlock()
consistently RELEASE.

Fixes: c55a6ffa6285 ("locking/osq: Relax atomic semantics")
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Waiman Long <longman@redhat.com>
Cc: linux-kernel@vger.kernel.org
---
 kernel/locking/osq_lock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index b4233dc..98b12d7 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -59,7 +59,7 @@ osq_wait_next(struct optimistic_spin_queue *lock,
=20
 	for (;;) {
 		if (atomic_read(&lock->tail) =3D=3D curr &&
-		    atomic_cmpxchg_acquire(&lock->tail, curr, old_cpu) =3D=3D curr) {
+		    atomic_cmpxchg_release(&lock->tail, curr, old_cpu) =3D=3D curr) {
 			/*
 			 * We were the last queued, we moved @lock back. @prev
 			 * will now observe @lock and will complete its
