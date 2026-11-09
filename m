Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218531;
	b=ETZ5JzF4Qe2d85Mq2n4G3zZINDiWbzU1ugQjbW0nQVfjP1wXvbRpmpakOiqpsPwkBSkk
	 sAd9P2oSda7ZxTIoSw1hc85djxtfW5KnYWgPeiQ/jFnGE/X2hfo/QHqSLwjJFsk4VoT8M
	 J39OpSnIYuyJtJX78NTTcC+HTSMeBbBk5WpnA/lYELrBA1bYs9yjrNeS8gppARFa4Jnzo
	 voIvhPxZilYuxZ07rwChW4Oy8/1lYbuvVkz3i26szLP+H0tlHkzfpOB8A+CZGdjfpptpv
	 eTSb2bNcFOndgyvRYIsgkxKnb34vnTjqWfngra7y2FDVLZ91NX5PEPyxFj0fJJVWfnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218531;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=v4Ez0WQ2HxPI1/HhWlG80jr8kGkVUjF18fW82iBjkWk=;
	b=AV8t0DwFAnrxyAfjC7ZZB24IBdajgGWFbyW8C9hRFNIrOXqFWQ8C8fVyP2jwFQUffXu8
	 vvM/pD1NJwzfa/kZ2WTpxFexmCaOUqSOroPLlV8D8k2jEJ3VQmThrcnL1thKXw+PvW23r
	 DFycmjrrSwfsBsKgLwGE9hW1VR/Sth1VnQmN7DRiqYWDSmkb3hLeDq+Z/I/6X62GKBwtu
	 c8toDvjxwYpoOxiADon90oEn+87AzfRUmsF8c+EuMsfsSpV+eEgi+SHttsr5z4CJHuPBd
	 A5G8njTiDMt2LQ4pWOAXzX/QTu0oICJaHzkMJDry3d7BnoGpJubph0fDrsmskOfXbXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QmAoKxpW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+c54ueM1;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E3F606EE8A;
	Mon,  9 Nov 2026 10:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E3F606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=QmAoKxpW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+c54ueM1
Date: Mon, 09 Nov 2026 10:02:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794218529;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v4Ez0WQ2HxPI1/HhWlG80jr8kGkVUjF18fW82iBjkWk=;
	b=QmAoKxpW9njxSMZwfQG75FJW86Wp6HCXvdqm10eO2l8yn+IKmq1Cs8J1hJYQWBHl+Ah54l
	tHwSg4aK/58ec2nlBNj4XYxhzQDujnj3uhO00GdxjF2qdxfI+qLtkTh3YsWm+kAnHeiw0j
	PQYMApXLQue9RFCbBaCoi9hNrqF312FZBd33DFJWxpvQUvAQDsaDDQSqFMX2isbOnzjfR8
	OSEXFBnrBzLByu1jcsrlIxBAvVN6i/iXjIdOhfWuNFw4JrtFoiPcWuMJ5lvyJSNhsyTkAr
	vTYQbmzRp0KdIozianPkQHtd36t0f6KL2VvILbef+bQKabtwGsXzQS3D/vU1BQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794218529;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v4Ez0WQ2HxPI1/HhWlG80jr8kGkVUjF18fW82iBjkWk=;
	b=+c54ueM1LQ/Wb7zkUy1A6ObFyCYFwPjk4mcn71PZJ51ELCf//uEIz/JIrY17qF6vGd6jfR
	g2gkWBpfphGbJnCw==
From: "tip-bot2 for Aaron Tomlin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/debug: Protect lockless rq->curr access in
 print_cpu()
Cc: "sashiko-bot" <sashiko-bot@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030151307.768523-4-atomlin@atomlin.com>
References: <20261030151307.768523-4-atomlin@atomlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421852742.2093942.2441858993870222815.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     92066c4a9c6b1fe1745ddc45d3c862c53d2cb78e
Gitweb:        https://git.kernel.org/tip/92066c4a9c6b1fe1745ddc45d3c862c53d2=
cb78e
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:04 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:57:32 +01:00

sched/debug: Protect lockless rq->curr access in print_cpu()

In print_cpu(), rq->curr is dereferenced locklessly to print the current
task's PID via task_pid_nr(rq->curr).

While accessing /sys/kernel/debug/sched/debug is inherently best-effort
only; rq->curr is indeed expected to change dynamically while
print_cpu() is executing. However, if the task currently running on the
CPU exits concurrently and its reference count drops to zero,
put_task_struct() calls call_rcu() to schedule
__put_task_struct_rcu_cb(). Because print_cpu() does not hold the RCU
read lock while dereferencing rq->curr, an RCU grace period can complete
concurrently and free the task structure via free_task(), creating a
potential use-after-free race condition.

Resolve this by reading rq->curr using rcu_dereference(rq->curr) inside an
RCU read-side critical section. Holding the RCU read lock delays the
invocation of __put_task_struct_rcu_cb() until after rcu_read_unlock(),
ensuring that the struct task_struct memory remains valid while being
accessed.

Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261030151307.768523-4-atomlin@atomlin.com
---
 kernel/sched/debug.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index e6a3b51..ba383be 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1203,7 +1203,10 @@ do {									\
 	P(nr_switches);
 	P(nr_uninterruptible);
 	PN(next_balance);
-	SEQ_printf(m, "  .%-30s: %ld\n", "curr->pid", (long)(task_pid_nr(rq->curr))=
);
+	rcu_read_lock();
+	SEQ_printf(m, "  .%-30s: %ld\n", "curr->pid",
+		   (long)(task_pid_nr(rcu_dereference(rq->curr))));
+	rcu_read_unlock();
 	PN(clock);
 	PN(clock_task);
 #undef P
