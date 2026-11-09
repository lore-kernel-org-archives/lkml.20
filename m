Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218529;
	b=m+9Q3R80WLeEroXXixyods6x2HV5KNlkJYaoKr4Z+Eb+TQpY/hOW5/7ZSvfwnY5liDlq
	 MFqtwI4OCtHe3XDZKkKpxQ62s+V6toEgOOC+5u9vDas7rAih7wvHZh8/7/Ay8db+QI4mu
	 dwXo6aY6Bv4wyI/V6rC3a52dXNlKI4NAgSh004ZlOMeLp42kDPnvN73/Do4uF58rdMbqk
	 V1bA+7g4a0Jieb+q8muh6PKoAXzxgiG2E60iMi91+QUsRBzT0GMu/ByWpzuX973G9UEOi
	 in1TDWuKUAPmhjhyT0K4jlqeVbGZTwKnr8l0Ds9Iol+odNz0e1uK3CeVq72OAe+6B/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218529;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=/COcM1Qnfoy81+ff3K0ikS6QX+2mmSzl+1BKlYLYPAc=;
	b=A0sYEL6HEKnN/tmMkSYEDBcEjOfsF/QH+8zMsgz0DHsNBh77tEfmnsTQa9GjBrJylVBp
	 yHJKlltERvD9T7+hTzoSqc4kyWaIUvJFS/MJd0GE2xuEodIL7K9SNIhoz6s75qJUYtrJu
	 sA1hFs5apgPP99T6e70HJqi8oBXmyg1TPmTmrcZEnc+/UcczweGPldWnz8bcMDchTgiHB
	 Uze+eJFRgTuyWzoFGzHIXh/qxuk8n3yjwAM8zMzyPs6wFo7FjRjm5aKEUB+6NaVf79jt2
	 RmGQgcWjdSqrvCFI4AwizA9YiMjztRaDyBUp07SZDXCuUfJokaT1t8cjh5sCnm+DYMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=atOvHDJf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ElYN7Utc;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170E4606D803;
	Mon,  9 Nov 2026 10:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 170E4606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=atOvHDJf;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ElYN7Utc
Date: Mon, 09 Nov 2026 10:02:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794218527;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/COcM1Qnfoy81+ff3K0ikS6QX+2mmSzl+1BKlYLYPAc=;
	b=atOvHDJfrTkjFHI3w6kDbC3s/xzOmm71dQe4hrMwjVl6UsQ/xnXrusSG/xivhUUKfUFME9
	f1Y+FF9B65KF3CL48hn9NLTbKBx3sGVbcnAJYUQ9XwsqDf9W4E86+ZLxzEdKufecflg/qv
	dg1MKzUUIn5hSK8sxXZchjqK7Sux5lL2/2ouj33dmtyDZQlA/gF505fi7t+NNh8W26IaWy
	JIBzTG6wmSjFbrGwV67w2+jc7QsoxNJ57AN2vRnO4Z9zAunvv0+/+lysXu38KHTYz/TDpi
	LRJ0pin+HYeLUcv7e3kHZrJ4wvdWW2V+QEZjBEC1fw70IKJvsIMP7TNHGqPapg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794218527;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/COcM1Qnfoy81+ff3K0ikS6QX+2mmSzl+1BKlYLYPAc=;
	b=ElYN7UtcvkXQoLW3UB/RACeLwjcy+wmnj+ZtNIcfjk3n2XBSRAhJ4QdbLTByJPRMcjyM1l
	UvA5lvU85XVdpsDA==
From: "tip-bot2 for Aaron Tomlin" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/debug: Protect p->mm access in sched_show_numa()
Cc: "sashiko-bot" <sashiko-bot@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030151307.768523-5-atomlin@atomlin.com>
References: <20261030151307.768523-5-atomlin@atomlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421852593.2093942.6295441252422226671.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     cdce2de5c26cdfdc531c0a19182b91f3d36faab5
Gitweb:        https://git.kernel.org/tip/cdce2de5c26cdfdc531c0a19182b91f3d36=
faab5
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:05 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:57:41 +01:00

sched/debug: Protect p->mm access in sched_show_numa()

In sched_show_numa(), p->mm is checked locklessly and then passed to the
P(mm->numa_scan_seq) macro. This presents both a time-of-change to
time-of-use race and a potential use-after-free vulnerability.

If a task exits concurrently via exit_mm(p), another CPU can set p->mm
to NULL and call mmput(mm) to free the struct mm_struct. Dereferencing
mm->numa_scan_seq without holding task_lock(p) can access freed memory if
mmput() runs immediately after the check.

Fix this by wrapping the p->mm check and macro dereference in
task_lock(p) and task_unlock(p). In exit_mm(), current->mm is set to
NULL under task_lock(p) before mmput() is called, guaranteeing that
p->mm cannot be set to NULL or freed while task_lock(p) is held.

Fixes: b32e86b4301e ("sched/numa: Add debugging")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261030151307.768523-5-atomlin@atomlin.com
---
 kernel/sched/debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index ba383be..f3eb877 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1388,8 +1388,10 @@ void print_numa_stats(struct seq_file *m, int node, un=
signed long tsf,
 static void sched_show_numa(struct task_struct *p, struct seq_file *m)
 {
 #ifdef CONFIG_NUMA_BALANCING
+	task_lock(p);
 	if (p->mm)
 		P(mm->numa_scan_seq);
+	task_unlock(p);
=20
 	P(numa_pages_migrated);
 	P(numa_preferred_nid);
