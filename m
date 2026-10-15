Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF53A9D94;
	Thu, 15 Oct 2026 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051536; cv=none; b=XKo5EmDLhnQCWxC2cudGivOJmdukvX8jwNRTRlxZiBSZBzL0SjNGF4r6nmSqw+xGUMQxCESqabidHVJNV+q13qM84PpvD6TMtzu/OqdqlbbeDTOp+1eNZ+ka0eKUWJAJ2hVRnrnShmkowdBkuTRbvoqQDMNd3u8A35IcYBhcg+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051536; c=relaxed/simple;
	bh=YFn9U1Mq33AjMdTgfSXIkTLt0M8SL/v/YXis5TjdxEA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=YN37tM2HYvs8XvqrCobBrKL31C1816b9R9E3E6xy2tONE9jT9jxvxS3Uz2wbge2h+1VNNbzhIDMFRc5gaMZ4p5DULa0kcJALfS0UyVOFc6keb+zZTgAKPTEjw7zRBWjP5p72quHyx4wAia0j+Y6sGImPv4ShtbWn0AblLVnPq9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l0uQgfCo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=37qy8Iqh; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l0uQgfCo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="37qy8Iqh"
Date: Thu, 15 Oct 2026 08:05:30 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792051531;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TftCQIJ0yRD8724jkPnZj+qztT9KpPhGfnMqmafWFGY=;
	b=l0uQgfCohXoISfOKZj3BSZma041xFV6kiXwbnogPwfNUdxF66dlvfFxwqe/ZqFT4ZdqjA6
	zN+cqLhUwmzOtuoUsTbagqaM01m8b4Rv9b72VPyUI8Afo8ttNUsMDEf9mUrpoOLV2SsL7h
	xX+DUWzT6k9P4MZPmhzCgD52D+KVNPvmrOs39B42P+b9r+ru0JZX+QPKL3wFb6lZqdWTWR
	T0ZqyxC+SewnpD6KyzjSpBtdKrQRh7jcaOQRdJiY2z94hym/XA3kRM7udcdr+LYXsCMJWf
	ry5cSXqafFGqOQiCgyRa//nsNNmX9YHerrBUkuc6+fM2JeexTQeimsLnzXhibQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792051531;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TftCQIJ0yRD8724jkPnZj+qztT9KpPhGfnMqmafWFGY=;
	b=37qy8Iqh8vnCwKwU1rq4hJ58M8dPukReb5ImLaGr8pBIhZNWhohTrHK2OkT6trZYv2E/f8
	oONX+Zvo6AYucfCQ==
From: "tip-bot2 for Hui Su" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/wait: Avoid modifying entry on failed
 priority registration
Cc: Hui Su <sh_def@163.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Sean Christopherson <seanjc@google.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261011015019.4056529-1-sh_def@163.com>
References: <20261011015019.4056529-1-sh_def@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205153011.2666988.8056837708928643024.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     159b172906110f736fdbd7af8a21d0e0b469f671
Gitweb:        https://git.kernel.org/tip/159b172906110f736fdbd7af8a21d0e0b46=
9f671
Author:        Hui Su <sh_def@163.com>
AuthorDate:    Sun, 11 Oct 2026 10:50:19 +09:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Tue, 13 Oct 2026 13:51:28 +02:00

sched/wait: Avoid modifying entry on failed priority registration

add_wait_queue_priority_exclusive() sets WQ_FLAG_EXCLUSIVE and
WQ_FLAG_PRIORITY before checking whether another priority waiter is
already present. Thus, when registration fails with -EBUSY, the entry
is left unqueued but with modified flags.

There is no need to modify the entry before the failure check. Move the
flag update after the check so that a rejected registration does not
unnecessarily alter the entry.

Signed-off-by: Hui Su <sh_def@163.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Sean Christopherson <seanjc@google.com>
Link: https://patch.msgid.link/20261011015019.4056529-1-sh_def@163.com
---
 kernel/sched/wait.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index 477e4bf..f8d6d8b 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -54,14 +54,13 @@ int add_wait_queue_priority_exclusive(struct wait_queue_h=
ead *wq_head,
 {
 	struct list_head *head =3D &wq_head->head;
=20
-	wq_entry->flags |=3D WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
-
 	guard(spinlock_irqsave)(&wq_head->lock);
=20
 	if (!list_empty(head) &&
 	    (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIO=
RITY))
 		return -EBUSY;
=20
+	wq_entry->flags |=3D WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
 	list_add(&wq_entry->entry, head);
 	return 0;
 }
