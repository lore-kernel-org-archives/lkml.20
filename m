Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50DB453A57;
	Sat,  5 Sep 2026 19:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788634807; cv=none; b=M/Dsb4tdX9EXLUxF3tdryHNMQVgoDaTDgdudlwUalRPr+E4j3HfbwOu9Q77Of/70690gNhGXK/EGlKLb4IRqLtWJXylFNh5jTLtef61HjWuSTXDyNFwf/6/P4fNGaPz1IqlUOp7yxoQ95+YeWe/yo3+kMaTKqdm7vUffb6o+xtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788634807; c=relaxed/simple;
	bh=0re+RL3TXAr1v6sBEYuYzFqLuuCNYJhUyA4gJJGm8qA=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=nlfzAsRvjWrmUFU6wBa+VeuKQaE0THw9wXq0zSUQggs6aLNw8+FSt1G81qdRwwihxVtcUyCt6fnwYYP3kw66gVx+T3BISIjle4TjfEHyoSevl87tk9F5XHurRoLuVm3Ixn/K9oiM4o2AMUhqMmyFCbLq+FQBF1Ha0Z1Vs34aIMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=g2tsCof+; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uh9Sibek; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="g2tsCof+";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uh9Sibek"
Date: Sat, 05 Sep 2026 19:00:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788634802;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ozl1WxTECGA8UW4XwvxdTc+gq1ncREK76dnOZLxVZI=;
	b=g2tsCof+5eUL01VNkSXQ5zlr3BCD46xbu5W2AEnDQ7AB47mOAOxceBLaRYKV6Jzx1WVOSz
	W6bYKTZkHUHgtD/bGmtlFBjmOI5D8SFofKQJyMBxWSw3CdvUlvwZQC52pYVQt88C6bFkDr
	RkKhnYpj+14tR3sys+eaDsm3A2H7C5InJpmSdcdOLUoP2mWrMsuAEAtr7V0Z7fqbye3rjP
	WvZ7gigEMET7tRDyj8KxmQV9irKgIKTj2SNzdDIk5pZeNXhSPK4Fk6GeegSKVs1dafVZob
	l9m7RX8NYPbXwiwK4nErpNTVh87sKyBrmWqBHnQbMONRZU9XFcOiei5nMdoqOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788634802;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ozl1WxTECGA8UW4XwvxdTc+gq1ncREK76dnOZLxVZI=;
	b=uh9SibekDjdgn63wmvVx68i7VBjCJ/MUtqaZ+iTxNP8ysaL76atSEGAyaXoayiyUzKTxVa
	2/4Hk/obm76/FnAg==
From: "tip-bot2 for Enlin Mu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/core] softirq: Remove redundant h->action from
 preempt_count mismatch error
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Enlin Mu <enlin.mu@linux.dev>, Thomas Gleixner <tglx@kernel.org>,
 Bradley Morgan <include@grrlz.net>, x86@kernel.org,
 linux-kernel@vger.kernel.org, maz@kernel.org
In-Reply-To: <20260825011509.8505-1-enlin.mu@linux.dev>
References: <20260825011509.8505-1-enlin.mu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178863480086.623050.12464885106905159266.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/core branch of tip:

Commit-ID:     a0e1fdb96578ea562a03c487f70673d228824d0a
Gitweb:        https://git.kernel.org/tip/a0e1fdb96578ea562a03c487f70673d2288=
24d0a
Author:        Enlin Mu <enlin.mu@linux.dev>
AuthorDate:    Tue, 25 Aug 2026 09:15:09 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Sat, 05 Sep 2026 20:52:12 +02:00

softirq: Remove redundant h->action from preempt_count mismatch error

When a preempt_count mismatch is detected in handle_softirqs(), the
error message currently prints the softirq action handler (h->action).

However, as Thomas Gleixner pointed out, the action handler for a given
softirq vector is always a known, fixed function (e.g., run_timer_softirq
for TIMER_SOFTIRQ). Printing it provides zero diagnostic value. The real
issue typically lies in the functions invoked *within* that handler, not
the handler entry point itself.

Therefore, as suggested by Sebastian Andrzej Siewior, remove h->action
from the print statement entirely to clean up the error message.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Enlin Mu <enlin.mu@linux.dev>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Bradley Morgan <include@grrlz.net>
Link: https://patch.msgid.link/20260825011509.8505-1-enlin.mu@linux.dev
---
 kernel/softirq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/softirq.c b/kernel/softirq.c
index 7980a4a..800d81c 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -645,8 +645,8 @@ restart:
 		h->action();
 		trace_softirq_exit(vec_nr);
 		if (unlikely(prev_count !=3D preempt_count())) {
-			pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited wit=
h %08x?\n",
-			       vec_nr, softirq_to_name[vec_nr], h->action,
+			pr_err("huh, entered softirq %u %s with preempt_count %08x, exited with %=
08x?\n",
+			       vec_nr, softirq_to_name[vec_nr],
 			       prev_count, preempt_count());
 			preempt_count_set(prev_count);
 		}
