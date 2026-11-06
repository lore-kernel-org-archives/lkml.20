Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958645;
	b=P6ALPx1h/wkqIyq+ikdeWLjJTHIan77BpQC7bVFgh0uCcDbxlbowNOu/f4cLMiDKjPv8
	 fkZayKHkZ6kKWD0Oe0V70VsNffoNOAyBlg7U7Wt4GToZz6Nde2BEE7h+BgkRVUSdfffuP
	 54qX3U7aknQLbDyRlPXelyfHEL7W1lhrsCLzvwmv2MCBPk2yljnT+Bpn13zNVznJ9fWGy
	 /WtH8MZXjK1sqGI1/a5WvCViTSB8unT9gWili9K3LMBijZVKtzQNSt+p1D6rQt1F+5ruL
	 lC0KykKh6CkSgNIWM72LmGfxhuJnf9143Z1N4eJBUqzbQNMlN+95EbVHlG+iskZsasQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958645;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=hgQgGBcIBM5U1Sq+2XdDaQC19jinwG2tz2ISob/Xdtg=;
	b=TEYVg0AjKxTauGzmPJWtvex0SN3//NMtu78PIdyvxNnrRrNSFO/vkIJe6LesBqWt/fHw
	 aJsLAWSy+zHkMBivk2pQA4BTvtdnVBB/O8kBhTSDYU5sWdpFs5nYA/flPeqLtgykxomw5
	 sVOTkbSyksMeRT5wD9cmu3CcIfHgyTUynV9McuAfqtVM9Qqtkb1eJbhB/gqZM6MfF0MV9
	 eY/5wm/+OAYWFqQNe0IUyz7RzhI/N+X1FH0kM2uUWBy5goaY159Cztb6IGBPuuo5Mef+s
	 gRyc6q7zSSDBp7BQU4PH4taIJZgNSb2O58LSXbTuK6m5B2cj//IhghssVaw+NQEmCyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="m9/uXhCk";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=v2KgS68d;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934A96082BE8;
	Fri,  6 Nov 2026 09:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 934A96082BE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=m9/uXhCk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=v2KgS68d
Date: Fri, 06 Nov 2026 09:50:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793958643;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hgQgGBcIBM5U1Sq+2XdDaQC19jinwG2tz2ISob/Xdtg=;
	b=m9/uXhCki5dlb8jGW3Yi4FeHix+2zhND4LL/mPYHF/xEU6kCd2pIU4NT7dFGIBYbJJvU/l
	sE9cnINSzDlMMNbn5KrB3e06r9f6wt4xv7vsBL+hGf2QJw4ToZa3LOTgJKTrOr29P9aESk
	gdqGHhijRrvPoTgViJumkIrMH54l8CfJ3p/cpa2s4X0MT+Pf88QeyWXXLLoleidqLvdz2B
	MAkmDEHdECFORbQoR6CC/kleYm9k9kli4NRNTesZU58LBFapDUxi1Jd6Rusl1UcRNP4UVN
	PGkyU+OVhd777LtDK3qQ5EO1d/xp0iI0Kikh4gGs2/9HgoYdOUCWseSRrj7qqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793958643;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hgQgGBcIBM5U1Sq+2XdDaQC19jinwG2tz2ISob/Xdtg=;
	b=v2KgS68dFRktUt1cCxgUtBtSxiFQZr0e5K5rwqJWBduSWjOWvelx3s4AYUgcXkGgLMo2A7
	CgTIwIdsb4YPYFAg==
From: "tip-bot2 for Nickolai Zeldovich" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/deadline: Fix this_bw on class change of a
 dying task
Cc: Nickolai Zeldovich <nickolai@csail.mit.edu>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261025124657.836229-1-nickolai@csail.mit.edu>
References: <20261025124657.836229-1-nickolai@csail.mit.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179395864120.1009794.11212049218049367777.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     0c93e25ef11a9dee43f6076bd1f09771dc2b167e
Gitweb:        https://git.kernel.org/tip/0c93e25ef11a9dee43f6076bd1f09771dc2=
b167e
Author:        Nickolai Zeldovich <nickolai@csail.mit.edu>
AuthorDate:    Sun, 25 Oct 2026 08:46:57 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 10:00:50 +01:00

sched/deadline: Fix this_bw on class change of a dying task

Moving a SCHED_DEADLINE task out of the class with sched_setscheduler(2)
after it stored TASK_DEAD in do_task_dead(), but before __schedule()
dequeued it, subtracts its bandwidth from the runqueue's this_bw twice.
this_bw then stays short until reboot: __sub_rq_bw() warns about the
underflow or about running_bw > this_bw, and GRUB reclaim for
SCHED_FLAG_RECLAIM tasks on that CPU is miscomputed.

The class change dequeues the still queued task with DEQUEUE_SAVE, which
removes its bandwidth from running_bw and this_bw. switched_from_dl()
then calls task_non_contending(), which, if the 0-lag time has passed,
removes it from this_bw again because the task is TASK_DEAD. That
removal is meant for the dying task's own DEQUEUE_SLEEP dequeue, which
has removed nothing before it.

Do the TASK_DEAD removal only on that dequeue path.

Reproduced under QEMU on x86_64 and riscv64 by moving exiting deadline
tasks to SCHED_OTHER in a loop; with this patch there is no warning.

Fixes: 8fd27231c330 ("sched/deadline: Track the "total rq utilization" too")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Juri Lelli <juri.lelli@redhat.com>
Tested-by: Juri Lelli <juri.lelli@redhat.com>
Link: https://patch.msgid.link/20261025124657.836229-1-nickolai@csail.mit.edu
---
 kernel/sched/deadline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index c0ebdcd..dfae086 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -444,7 +444,7 @@ static void task_non_contending(struct sched_dl_entity *d=
l_se, bool dl_task)
 			if (!dl_task || READ_ONCE(p->__state) =3D=3D TASK_DEAD) {
 				struct dl_bw *dl_b =3D dl_bw_of(task_cpu(p));
=20
-				if (READ_ONCE(p->__state) =3D=3D TASK_DEAD)
+				if (dl_task && READ_ONCE(p->__state) =3D=3D TASK_DEAD)
 					sub_rq_bw(dl_se, &rq->dl);
 				raw_spin_lock(&dl_b->lock);
 				__dl_sub(dl_b, dl_se->dl_bw, dl_bw_cpus(task_cpu(p)));
