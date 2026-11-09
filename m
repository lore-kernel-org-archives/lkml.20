Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213843;
	b=AqTeEdjx4D0Smc0SMO0zHgkMbSli1doe6CR+7kRUGmfOqtpbEqF5qJJBJquZRj5ySei2
	 A3ntm+X+0ZL/61ZPHxbj35L+Gh2DObWflAy0evUA/t0pGNpEwx0/TupTgKgWxIXI5zuMt
	 H+QzUKhQh2Nnalb3lD7PhxS1whGRW7BRncMXUApt40u22SuCmDDV/dRmUMeH/C8h+efoa
	 uGYJqnPFvYJd/+DUEPqhm6lfDj3eNSsiaA60I3rbFt0bs9bdv7PyZ10UN7xhIldz6kaaS
	 nIuZaVsYdmJ6xaJeMdWcDSz5+LoASdENcHcPWq4Z3G1JRbWG9El7UOQvO2Eg4bFZYlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213843;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=x3TjM3eLKq9HC6yTNhJyWTNidwfupqJpD1op1jdrN5E=;
	b=k8IqnScQxyt4BVLXVnUFe6rcck5CJELq1yRct2pCh8dz56tHwfl3HRcP7ftpLw2ECdMs
	 Y5BY/lL4fyqOyw1a87/euUPSkPulP/pVoOwMTkRCm5BLawHXi/oI2ApNn7FIPBgAHdNPP
	 MC1rfJIks7BT8IAl/w3CC3h8PWyEzgwNBxAWN71q/o87NdkjcU2Qs+wdRwmeBvjPnbadm
	 whHhV6ZvX+XUr8OW1Px0S/FQiFyZ1K6ko1c41dZnGL6UA2X2d5Lss2Dd4fUnNQ5HlHdXY
	 lb9IF9SOMAtqc4EH6g5psV7Z3hq3ca/Z1/06m5vn4i21SF9Yyr5VxF8w9VDUZ2kn9Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GEdVNphP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AyC8AP0Q;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B595606D801;
	Mon,  9 Nov 2026 08:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B595606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GEdVNphP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AyC8AP0Q
Date: Mon, 09 Nov 2026 08:43:59 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794213841;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x3TjM3eLKq9HC6yTNhJyWTNidwfupqJpD1op1jdrN5E=;
	b=GEdVNphPcN1oqxYyHq5STXGAl+GlMnIszBqPdg7vjpH3GbzbJ0l2AtnBqaw1mqR8A7zalW
	P7DA+/dokKyUZBWAPonFyfRxn4C9Bjqlxm88dOxSglmpSTC/zD/MqJWfDgDDLCYOPUwlaO
	zTR6n8bnFjZwfs/4R9pIF3yidOxmb3kBz/mBV2pO2IbmdOMiZTPbZ8vW7xahE0DOxhrSJR
	4YsabfuJqvqTxqHxtU6hwTZYlLn9YaiL5d7ZgPQcBVEj4l4dxD0QnF+w5oqZcOnguMznDH
	dtrSZ9dMBlQFWMwZ4x9WWKHySjLJ75DzpSBswkBBiCzHhJqd4Fy5QVh7hnh+qA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794213841;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x3TjM3eLKq9HC6yTNhJyWTNidwfupqJpD1op1jdrN5E=;
	b=AyC8AP0QqDnKeRY9tPRBRFLzO4r5ulVmNhUjxH5ee2AGZb/y9IcZ5GgVbZ6+W/sf+cPVnc
	Bokmj+GFYA6/l6BA==
From: "tip-bot2 for Aaron Tomlin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched/debug: Protect lockless rq->curr access in
 print_cpu()
Cc: "sashiko-bot" <sashiko-bot@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
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
Message-ID: <179421383948.2093942.3760277571390016856.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     cb51497df6bd677c3a7cd5dc8ac657b7eb42f165
Gitweb:        https://git.kernel.org/tip/cb51497df6bd677c3a7cd5dc8ac657b7eb4=
2f165
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:04 -04:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Mon, 09 Nov 2026 09:39:57 +01:00

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

Fixes: 02968ccf7b80 ("sched: add /proc/sched_debug file")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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
