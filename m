Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDBD46DFF2;
	Wed,  2 Sep 2026 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346773; cv=none; b=lhghaKho9wVxbNfr5BScKBXOinHimh1IVcLTXEcsumAbDfKoHrnwZ3J3wWxweyPtvP300+17uR071imPB3tLr2KsWx+vEFekRK4DbDl11JD6OAE7O2Ov2XUkjKNGNA4n+kkHyXkzcEekXCAxSdeVnSdHOt9CKhMdqgI1C30vmFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346773; c=relaxed/simple;
	bh=pg0LYMIyU+sE7DDwn0sMAkqi37VFHBxypuTEOrZ453M=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=OND6smRaOYp6YOzVRXt8TtqAnOSjPkJf8/+yN8ZCtCBX0XihXEUarYevARyb1r5lWsWo60pz1mZTymveF45SA8bu5uLE0dAeSX1bh0ppKElznjJ7iNtc4Qx9ye7uJmPs6A7ro+Y+TiQgu6zPI4a1M5XiyQbMRZRuJ+nfScq/sFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XiRRLWam; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ywP97OOx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XiRRLWam";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ywP97OOx"
Date: Wed, 02 Sep 2026 10:59:27 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788346769;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hz7EINkdLTJpbuAz07w+kzRNZ91yn9rQHUTydAFsWmQ=;
	b=XiRRLWam/BdKIqGz4Y+O0cJenj9Ktp6gkASG+d5r4XyoWCjyN0TEkq10plil7AdEfqHkbO
	49O3khK6ecHes7kjlXgZgyP9W7N7vkwJ5mNRlMeLoIDr6EVKR9lryjQtTtJ/+t5VMwummZ
	bxiyX1e8MYD8n26HcYmsL+zWJBb8LgpXhIm3ipIWPKw41vlgy/8+5Ojn4CMIE/UCqZhxQX
	0rUIB0RPZnSxm3daC9i+5inQFbytk3xBwI9HlmCfMpe2iE7MXfTlETAyUz8Z0icF+bEdJM
	dXT4xN7zGYZTFCpa7uVRyJ1XDW1+h0DhyceSZaIdWljRaurp4Bg9KJlQCeZBrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788346769;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hz7EINkdLTJpbuAz07w+kzRNZ91yn9rQHUTydAFsWmQ=;
	b=ywP97OOx+e7h8gVRD+THlwc0zsXDz5QbXEfIcAEWpMWUStSxxwTJWcok3o0g9HHVQ81aPD
	5OIOlJgDaE4ZdwDw==
From: "tip-bot2 for Mark Rutland" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/core] sched: dynamic: Fix preemption model strings
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260902101637.232129-1-mark.rutland@arm.com>
References: <20260902101637.232129-1-mark.rutland@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178834676769.3717435.18409512288803533130.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     ef9293b3b797228fead10b55ed6bfb99bb7976b4
Gitweb:        https://git.kernel.org/tip/ef9293b3b797228fead10b55ed6bfb99bb7=
976b4
Author:        Mark Rutland <mark.rutland@arm.com>
AuthorDate:    Wed, 02 Sep 2026 11:16:37 +01:00
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 12:54:21 +02:00

sched: dynamic: Fix preemption model strings

We recently removed the enum values 'preempt_dynamic_none' and
'preempt_dynamic_voluntary', but forgot to update preempt_modes[]
accordingly. Due to this, preempt_model_str() and sched_dynamic_show()
produce incorrect output, with the wrong preemption model string in
backtraces, and empty output for /sys/kernel/debug/sched/preempt.

Update preempt_modes[] to account for the removed enum values. Given
that CONFIG_PREEMPT_DYNAMIC now depends on CONFIG_ARCH_HAS_PREEMPT_LAZY,
and given that only 'preempt_dynamic_full' and 'preempt_dynamic_lazy'
remain, sched_dynamic_show() no longer needs to skip any model strings.

Fixes: 9650ce11f2e3 ("sched: dynamic: Simplify preempt model accessors")
Reported-by: Jinjie Ruan <ruanjinjie@huawei.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260902101637.232129-1-mark.rutland@arm.com
---
 kernel/sched/core.c  |  2 +-
 kernel/sched/debug.c | 10 ++--------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 545f494..5a61650 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7960,7 +7960,7 @@ static inline void preempt_dynamic_init(void) { }
 #endif /* CONFIG_PREEMPT_DYNAMIC */
=20
 const char *preempt_modes[] =3D {
-	"none", "voluntary", "full", "lazy", NULL,
+	"full", "lazy", NULL,
 };
=20
 const char *preempt_model_str(void)
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 9883e4c..fda10b3 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -280,16 +280,10 @@ static ssize_t sched_dynamic_write(struct file *filp, c=
onst char __user *ubuf,
=20
 static int sched_dynamic_show(struct seq_file *m, void *v)
 {
-	int i =3D (IS_ENABLED(CONFIG_PREEMPT_RT) || IS_ENABLED(CONFIG_ARCH_HAS_PREE=
MPT_LAZY)) * 2;
 	int mode =3D READ_ONCE(preempt_dynamic_mode);
-	int j;
=20
-	/* Count entries in NULL terminated preempt_modes */
-	for (j =3D 0; preempt_modes[j]; j++)
-		;
-	j -=3D !IS_ENABLED(CONFIG_ARCH_HAS_PREEMPT_LAZY);
-
-	for (; i < j; i++) {
+	/* Stop at NULL terminator */
+	for (int i =3D 0; preempt_modes[i]; i++) {
 		if (mode =3D=3D i)
 			seq_puts(m, "(");
 		seq_puts(m, preempt_modes[i]);
