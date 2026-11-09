Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216528;
	b=zhwvLkcjIvC+QPtCGo7JLHXWeRT81UTToJQ/NwIkdCrwSnGDD0BYKaKN/z7mB5ZWnuas
	 I01LKw14uFdurC7R5M4O2xSe4SHxs7Rb0fjx8zdwoyM28ofwOpBUP0Jn5tQAI7wETUq/2
	 xlyAnBNYzOvcQrlbc2gOpU3Mc4AhMHK84JdHbU0jAKbEdHacj3Zs+pTWzRb3yEAU6iaBM
	 SU+PYTAu4tugNyB27LfpHLi8AoNtaKLmBqTfNZ9348vcf3pCihBkLOM+vdEVIOHPs6foI
	 qWz1BL47s4UMNpw6wCDg/tTaw0Kec0i4MLprWyZbzqygzMW7tKu1Buy+c87yFASveuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216528;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=GKA84vU2CYago/0ADGrQ6yi+zGCH+XuJWrBe/uk1BMg=;
	b=DpT0vaQC7xfpUzzxjSunmeuK3FyzDVrT9PrDcnLs+kqhFI8lE1U/ODRNM2x131wMMspK
	 9ycGXY0WuflbHCKwzp8zUZ5mNuFbSVBaAFI+7CxnuM4Xo0G0SwQ4udxnyA50y1wVskh/0
	 We1Tk2eB6ZlidmvgBGXYmD3hikzdyinjl+Sc3TUwtB4UTzS88viRDiJXUA8o0cS4uGOnj
	 mGGBuroL99e2berzm7JqtGYU0b78ZxqqgKR3WzgSnhXh8hnNvLDL95IEX9H4O3pDsFAZm
	 TBtYNJp4Omlqe569Qi5lVuAdSYnjrnoD8CvhuAp/UBJLOezsXfr5bGY6oADpDWqaS7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PZI+bJ2j;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JjGj1fQr;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA90606EE88;
	Mon,  9 Nov 2026 09:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA90606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PZI+bJ2j;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JjGj1fQr
Date: Mon, 09 Nov 2026 09:28:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216526;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GKA84vU2CYago/0ADGrQ6yi+zGCH+XuJWrBe/uk1BMg=;
	b=PZI+bJ2j82cloYlBUPxzwKA6ZC+GMgBXuFKRHEE04Vxsqf/lO9shhWPMeEyPQKdOTiaS+P
	kxOkuUaLFaZgZpmfGmTLxMVAF2FT9M6NHHE0wMYxnMwzMkCblE/GUQnvEUB78A2La3uxh7
	+d+RFqBvs3uSFntnjIGo97Zam8DnRX4PepcVxMdVYNCV6e6ZQW9jp+HfIE7iMoCeaGm/D3
	O4fnJtaIkbBP5TgxslYZzvqfxQP5wEWDuTg76t4yLAoj8DvoNHj9JCpI58QZ4WmrG6/Qzg
	Tf0aY1itEY1lmSOezw4PE8tiBE1dtlrp7Zh1x3cE/Pyts1RLihH7jfxc2II75w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216526;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GKA84vU2CYago/0ADGrQ6yi+zGCH+XuJWrBe/uk1BMg=;
	b=JjGj1fQrH2z9o0xwFYJbyOSQaFACpnq6vIWXl4I5yEGUBzDYnM7UYM5xiFW4cwEfHs/Oni
	oaMLs3Wrwhnyk6Cw==
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
Message-ID: <179421652414.2093942.3767265732355133296.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     06c4df428fe9a4e86d65f37d2e5c232607f29c8a
Gitweb:        https://git.kernel.org/tip/06c4df428fe9a4e86d65f37d2e5c232607f=
29c8a
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:04 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:23:48 +01:00

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
index 439e59b..be886ed 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1204,7 +1204,10 @@ do {									\
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
