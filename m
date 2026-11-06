Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960391;
	b=bS9wBZf12VxE6Y2cl5U+lvlRyT9QwWtUCerNSquWQcnnspaRrDDb/IcuNlfvlU7OYIrI
	 yLc8LW/KpaVzuGMDpJOCDTJtmelLwlNfAKoujvnX+HO6lV9QTn/8MqLTs6LDd1zymtJH+
	 eQxpwNVTZxiptjNZHJEtEBkyk4247oYtdNChEWm9CdDjcgOR3uVDq0yLuov5rvLEr1P+C
	 Rzsvn4QMJj/WoRo3PI/fhu3CbUkfXrn0+mZZcN6Qb5acM2/FIWPDkiveieUF8GHNNHqh7
	 nFd2KcZxCBtAsQhEfQeBQ5Q2Ng2Yck/l0lZ7nD220+ho6sX2wbH6ZLHrCq+CMNJqCew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960391;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=GFNlZgRP13IBZuiKBZMBO0d3Ilfk/5CdZkXEcGlEUuo=;
	b=Hv81bnSpx8UwVO4AulYT/ruwnrwIUHAzQaRvWNk5STEeLJVOe7m73rfWBoFtFjN1pJVf
	 UQ0MJmW5qe+BiUJyq5nHnR0rk4ny1YnhIDwJnVKWZ1ewlAKb2gxUKRHPl2dIOupQPul2L
	 ukmqG20ZrewEAWt8japVi3VCROBAjrQc9i0XX5LAffm1AG3I1ShUo/mFoiO2ct12kHKT5
	 7d8K6IstkwHW3Tia73esxDxnb0vR2NsnFMLdduD+4ti+3NaoDmDCMSUYuslZD57lJI4dG
	 vsjSK3W+7tJze5s6o2CYC2KCPQMMFBMAb08lff1bAYGS6qXky6HXYXN0+9SWte/M/ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=eqBkmIgG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GhtTusHk;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D02606EEAA;
	Fri,  6 Nov 2026 10:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80D02606EEAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=eqBkmIgG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GhtTusHk
Date: Fri, 06 Nov 2026 10:19:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793960389;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFNlZgRP13IBZuiKBZMBO0d3Ilfk/5CdZkXEcGlEUuo=;
	b=eqBkmIgGe1l/8fn6EQ75hHXiiSO24LzDf+TrPMFdRmE69rHlVonVATFOA+psZO7lzMjbDU
	sk8cq8g83F45epXL9+hZSU+ST5O/d2RJjgsqQSsj1J1Hm1mrh48FoxBfDeIU7wmgGpLtnF
	nzjnq/fG11n684j3Hxl+8WMQogTo0nfN1/w+v+E5Ej2SZXlKqYEyREwS2rpGhYhgOHdZVK
	BiUa+8J+HZOy701J5mLBONxPJP+zyzuJyoZS8HgOuQSrmlG/KofBO7Al23F2BVML+6AXvv
	2VqS8AML8sRN20an8R5E5yzDEVZJOxnkMg52LtFYk7Cxwtd0WsybAESzN9Giag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793960389;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFNlZgRP13IBZuiKBZMBO0d3Ilfk/5CdZkXEcGlEUuo=;
	b=GhtTusHkkgIFie5lXiwKk02qLDs7Di+uenajMth/MVpUq3EOl/EnETuHN4A9bUe7PpmI0f
	IeZoZwAjp5SDxXAA==
From: "tip-bot2 for Zhuangzhuang Wang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: locking/urgent] locking/lockdep: Fix inverted "on"/"last" CPU
 label in lockdep_print_held_locks()
Cc: Zhuangzhuang Wang <3050681779@qq.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261030-lockdep-fix-cpu-label-v1-1-96875c74b15b@qq.com>
References: <20261030-lockdep-fix-cpu-label-v1-1-96875c74b15b@qq.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179396038726.1009794.9880369297652053678.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the locking/urgent branch of tip:

Commit-ID:     aa63c0df79920f6abe1b66e1f8b6443ad2d62d0e
Gitweb:        https://git.kernel.org/tip/aa63c0df79920f6abe1b66e1f8b6443ad2d=
62d0e
Author:        Zhuangzhuang Wang <3050681779@qq.com>
AuthorDate:    Fri, 30 Oct 2026 07:07:27=20
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Fri, 06 Nov 2026 11:16:04 +01:00

locking/lockdep: Fix inverted "on"/"last" CPU label in lockdep_print_held_loc=
ks()

Commit 051f5d223dfc ("lockdep: Enable the printing of held locks of
remote running tasks and print task CPU") added the task's CPU to the
"locks held by" line. As the comment above the printk() describes, a
running task should be reported as "on CPU#N" and a task that is not
running as "last CPU#N". The ternary has the two strings swapped, so
the labels are inverted.

Swap the strings so the output matches the comment.

Fixes: 051f5d223dfc ("lockdep: Enable the printing of held locks of remote ru=
nning tasks and print task CPU")
Signed-off-by: Zhuangzhuang Wang <3050681779@qq.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20261030-lockdep-fix-cpu-label-v1-1-96875c74b1=
5b@qq.com
---
 kernel/locking/lockdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index c3dc84a..fdae495 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -811,7 +811,7 @@ static void lockdep_print_held_locks(struct task_struct *=
p)
 	 */
 	printk("locks held by %s/%d: %d, %s CPU#%d%s\n",
 		p->comm, task_pid_nr(p), depth,
-		task_is_running(p) ? "last" : "on", task_cpu(p),
+		task_is_running(p) ? "on" : "last", task_cpu(p),
 		depth > 0 ? ":" : "");
=20
 	for (i =3D 0; i < depth; i++) {
