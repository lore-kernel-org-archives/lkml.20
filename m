Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B4F41F7F2;
	Thu, 24 Sep 2026 08:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239497; cv=none; b=TPXLyiGaWznrj5oAmJc8zPHGVF1cat6vjwia1kBDP7+hiulWxT8nO8OU9ZgJxrgHSlov8Kdbxko/oYMLW6EWK0xNFjJvWZLumcjA68OCo3y191Z0DZpS2OPOYGEWBmhOzHPfFGNBo+sjqiIBWaoTPK/5F4jY7QWUoFPMJNb8piQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239497; c=relaxed/simple;
	bh=pSpPADVmadQw7d7a1yT6RCT8aJK8LlP8QwHZjORjtNk=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=PaaCl1BAJhxeEBAo0Ut+a1uiSSZWnYOT0f77sVxDCXTTwmxFrRsDTTzBkF6ImA4mVmtn62iPotjQC+lHskLcGXoI9gApSfFt7HXk1V0ICHgodOGSlr9jdm50QvBJPeIx4mboQbed+jt4jXjFcvxX0IkZiCb+E34yp+qf9422Ldc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vlVjy4hk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6MSOa1o4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vlVjy4hk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6MSOa1o4"
Date: Thu, 24 Sep 2026 08:44:46 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790239488;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7KykWM+H/kwQRcx5m13wwLC16zgENzepqhHeOFH9CNk=;
	b=vlVjy4hkHcNmfIID26tR9ok89Z3ChbhkKWPEEy2VnP7DOwgJEdLic0VfjtBj3iFKcjZAq1
	dJiddECzzlfMPaYtRLTe4xJHYb5pPFEq4OeP83GTxMPJBI+61mwWk+vpc1RRNieLL56Tx7
	bFj2RGZgEgRdrAeSkh1B5QBa+YDs9NTv5jUcmRawo9+f3Q7sx2zPZ02JQanMkKuwguFnrS
	1hNdvGxyelJV8vcZ6rKHlhItRUpHBBAYad+lxmwJZDA7g4KlyJz8h5c1aYUcPx4C57IP2L
	UlBOOL5MpzRFXwoUm6WUWp1wrwA1x9s43IlzFW7BIGWtgQQ6N5nE/wUvIQ2g0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790239488;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7KykWM+H/kwQRcx5m13wwLC16zgENzepqhHeOFH9CNk=;
	b=6MSOa1o4t1M1zLv+x32RPNuFyHo1waWJOyOsbxDyPnXh6NIGyhEQItgmCPj3VbJiGaplW1
	mYnuPktF0SBhXCBQ==
From: "tip-bot2 for Zhan Xusheng" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: sched/urgent] sched/core: Account PSI IRQ time to the execution
 context, not the scheduling context
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260918132915.1236312-1-zhanxusheng@xiaomi.com>
References: <20260918132915.1236312-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179023948637.2819794.12313762270570794420.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/urgent branch of tip:

Commit-ID:     a0bb6fac53fa7cf1cadb487b43d4c9276a6b82e3
Gitweb:        https://git.kernel.org/tip/a0bb6fac53fa7cf1cadb487b43d4c9276a6=
b82e3
Author:        Zhan Xusheng <zhanxusheng1024@gmail.com>
AuthorDate:    Fri, 18 Sep 2026 21:29:15 +08:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Thu, 24 Sep 2026 10:32:50 +02:00

sched/core: Account PSI IRQ time to the execution context, not the scheduling=
 context

psi_account_irqtime() has two callers which share rq->psi_irq_time, and
they disagree about the context: __schedule() passes the outgoing rq->curr,
sched_tick() passes rq->donor.  Under proxy execution the donor is blocked
on a mutex while rq->curr burns the CPU.

The tick charges PSI_IRQ_FULL to the donor's cgroup and advances the
timestamp, so the call from __schedule() then finds delta <=3D 0 and charges
nothing.  The delta is not counted twice, it lands on the wrong cgroup.

Pass rq->curr, which is what the call read before commit af0c8b2bf67b
("sched: Split scheduler and execution contexts") renamed 'curr' to
'donor' across sched_tick().  Without CONFIG_SCHED_PROXY_EXEC the two rq
members are a union, so this only changes anything where that option is set,
and it depends on EXPERT.

Fixes: af0c8b2bf67b ("sched: Split scheduler and execution contexts")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Link: https://patch.msgid.link/20260918132915.1236312-1-zhanxusheng@xiaomi.com
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0b846a1..1fe40de 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5798,7 +5798,7 @@ void sched_tick(void)
 	curr =3D rq->curr;
 	donor =3D rq->donor;
=20
-	psi_account_irqtime(rq, donor, NULL);
+	psi_account_irqtime(rq, curr, NULL);
=20
 	update_rq_clock(rq);
 	hw_pressure =3D arch_scale_hw_pressure(cpu_of(rq));
