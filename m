Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216526;
	b=uni05KjxLKOcgtlHmd08Do4JbHLZKhJN1ytBDoDEAVnHip9onssTE+MRdv06x+Y1r5A7
	 NuBOAS5Z/QRy76VPVeFf7J5TRy8FibOF7vlZS3pfjNXE78vZjMmvex4tZ3/jh/MtV3GIL
	 6j41DHQgoJglcScUV1nUtIDrKEJC+KmX0iSM74lPnkzOEmPx29JMTZ0L8EesNZ07Ss3c6
	 WNs+EbtoBZZ/exYZ+eIjtJQT7Nb9W2u5LNCaWYsuyAx3k9m1Ue2+31TrGm3AwniFMTYht
	 3wCJkv13b8VoclK1QqwUgjn7UgwOLMapvNjNQ2CClGGIDyBAXE8nWrcfiAT4NsSXkGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216526;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=T//cb49fUAGQ2XOHkNPOjViUgyxP2TwcYbrLYr4BLtk=;
	b=dEtRtQ6WnNZDUhIEjz2c79YSGGzSqkxfPrGEf+VIhE9dWumDA9SusIAQKKmahHovImOC
	 gJlOTTx/tvLnf+CrwmjTK3IR1H6BBw2oLOWIURCS9kfeHN3zweGwyRwVhO2uWOHnShQRH
	 wTTadz8yaiTHEZGJJyDmlRF2k8kTP+LFnuHIEE+cbDg4VI7yoXfJf3ILULHyxjO9BDKqY
	 jNJx+oPHm0npvYLN9jDnEYmkROJzufVXJfrnt492XY03nKXi/pSOk0Ceikc7xKSBnKWe6
	 DDOWbG1eNJDDY4uWZ0T58X+3Szj5LpQska8hMuZFux0v9QSTHnsBtWqwmBmE+axB7dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0Q3N43ND;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vnlQxDAA;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98173606D832;
	Mon,  9 Nov 2026 09:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98173606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0Q3N43ND;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vnlQxDAA
Date: Mon, 09 Nov 2026 09:28:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216524;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T//cb49fUAGQ2XOHkNPOjViUgyxP2TwcYbrLYr4BLtk=;
	b=0Q3N43NDIVp0yo2e+02ijcnPoHIFVvAtpiGhwOUZmy1adfEXIXg0pGu7UF6t1G8/JcBGiQ
	vo6nKqbqCkCUaO0+CbeCcMidEDqYmjBvZ0Hcp6eZ2h492x0Sm4UW9jafP7HCyVfJUrDwUJ
	3IrOdEosepoGKFgVhwiFXldHOKlliY/C0eIzBjhCtl5+ImkalsO4cWbYnQDlGwIELRjTcz
	w9s9oDNIhLxC5sA1iEHp155rW+TjBu20YnP49+wX5SZxidEvcWIgl+5kf+qSbBzlyMrYZa
	ZAVm/7EMiutJD6/eDh0ucP2SbImf1UlmBcegxRt7URAVCWg/FrusHZDe6o6O9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216524;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T//cb49fUAGQ2XOHkNPOjViUgyxP2TwcYbrLYr4BLtk=;
	b=vnlQxDAAm+Tx/mE/UaJOOlcG+GM2ACSQ7ssJiON9Mgf7xH3mDCSMSjtSYTdU5/JAWAfLuR
	t4OYvkGO5IgjdyDA==
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
Message-ID: <179421652257.2093942.16454292958547793774.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     5bb5768ef4680edf119dc7ced1d1faf7fbd0bcc6
Gitweb:        https://git.kernel.org/tip/5bb5768ef4680edf119dc7ced1d1faf7fbd=
0bcc6
Author:        Aaron Tomlin <atomlin@atomlin.com>
AuthorDate:    Fri, 30 Oct 2026 11:13:05 -04:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:23:57 +01:00

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
index be886ed..a22d646 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -1389,8 +1389,10 @@ void print_numa_stats(struct seq_file *m, int node, un=
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
