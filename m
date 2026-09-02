Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56573264C2;
	Wed,  2 Sep 2026 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335706; cv=none; b=TdLfCvMKBkTjvbF9enfSk9aSKM7ISZBy0t7iHZm98GyzyqViIywXCMACtZwXC2TGYX7Dj5K0h91HNmAAkkiOtGmJQwoCoidL8kZ356p7EycbKYr9k0IckO7Gxz3LcglspW6wTr8JhBUbxjhfZleEZ5UoGlieBiYz/L1q3cGRmUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335706; c=relaxed/simple;
	bh=ctWmEy1xO1UEdX0yw2QEztr4ucgpLFQNJhNusb6R3xo=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=tZSeVJN6aby0gXAzM6/OMLIS0XVgttcflkGy1FsCKK6brxx+rKFNVb1+Vt+oZNMFiU3n4atjYT/sv8kTXLsT+ybS6Rv11hw5AlenZUqHGniqC7S2vDrrP/Cp2StjZASCyG1ezTZ/TC8OuOSzfSabY+DoYGbc+7G3ABys3Hgfiz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k+GHnlzg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M4wx7SUt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k+GHnlzg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M4wx7SUt"
Date: Wed, 02 Sep 2026 07:55:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788335702;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VW2cF828LsYtS8pNr+KCqC819mot+UZ4ZFYX9sBnUI=;
	b=k+GHnlzg23sLgzN7fyXGq5Uc+fnWGdAkOiAdYRnE+yXQPkWGPaldDELmOaGMXDUZEVU+xb
	VGnSm6KDMHyzAl/NT8XsgZWgnw//vxQlV/TlZVMEC/3yp7CJ8KVOFF07/3vwo/9f2bLbRw
	qy6v06SZAxe4gBAataolmFaZRQ0HZwMRuPwz/W19WN/TdORv3rt/S8h4D+dJtgT5/XF4rG
	AHJHgKH+HIfpmdHNGIKBZo8gcbZxo0iM3SxPMJppGKbg4erEfOyF4/RHPl3iJAZS7g6PUp
	HyM0kneDCnDRX+jOMIismtrtXzOeuyLnQJAND1CXDvNG0JImj9l25LwNzWCrtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788335702;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5VW2cF828LsYtS8pNr+KCqC819mot+UZ4ZFYX9sBnUI=;
	b=M4wx7SUtQ26B7YVkLLP+sr7Qe8z0fSnuA/3VcAbgpt1PkU8NZiNT3JEzAapf2EuW5wHw16
	SPWDzMbk15XGQTAA==
From: "tip-bot2 for Vasily Gorbik" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: sched/core] sched/core: Don't proxy-exec unmatched cookie lock owners
Cc: K Prateek Nayak <kprateek.nayak@amd.com>,
 Vasily Gorbik <gor@linux.ibm.com>, John Stultz <jstultz@google.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260807035232.1881495-5-jstultz@google.com>
References: <20260807035232.1881495-5-jstultz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178833570081.3717435.3704284797033521352.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the sched/core branch of tip:

Commit-ID:     09351db90a28ee6a82dc873609edfde02da5415d
Gitweb:        https://git.kernel.org/tip/09351db90a28ee6a82dc873609edfde02da=
5415d
Author:        Vasily Gorbik <gor@linux.ibm.com>
AuthorDate:    Fri, 07 Aug 2026 03:52:10=20
Committer:     Peter Zijlstra <peterz@infradead.org>
CommitterDate: Wed, 02 Sep 2026 09:37:20 +02:00

sched/core: Don't proxy-exec unmatched cookie lock owners

Core scheduling chooses a core-wide cookie before __schedule()
installs the next task. With proxy-exec enabled, that task becomes the
donor/scheduling context, and find_proxy_task() may then replace the
execution context with the runnable mutex owner. If its cookie differs
from the selected core cookie, running it would bypass core scheduling's
cookie selection.

When the final mutex owner found by find_proxy_task() does not match the
selected core cookie, stop proxying the donor. If the current execution
context is already in the blocked chain, fall back to idle like the
existing proxy-exec retry paths do. Otherwise deactivate the donor and
let __schedule() pick again. The mutex owner can be picked later under
its own cookie.

Fixes: 7de9d4f94638 ("sched: Start blocked_on chain processing in find_proxy_=
task()")
[jstultz: Added tweak to ensure we deactivate donor, not runnable owner]
Reported-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
Signed-off-by: John Stultz <jstultz@google.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lore.kernel.org/lkml/10282ce9-f4ae-498f-9b57-f4e1e61fffbc@amd.c=
om/
Link: https://patch.msgid.link/20260807035232.1881495-5-jstultz@google.com
---
 kernel/sched/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0f06f8d..0e6306d 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7046,6 +7046,14 @@ find_proxy_task(struct rq *rq, struct task_struct *don=
or, struct rq_flags *rf)
 		owner->blocked_donor =3D p;
 	}
 	WARN_ON_ONCE(owner && !owner->on_rq);
+
+	if (owner && !sched_cpu_cookie_match(rq, owner)) {
+		if (curr_in_chain)
+			return proxy_resched_idle(rq);
+		p =3D donor; /* Deactivate the donor, not the runnable owner */
+		clear_task_blocked_on(p, NULL);
+		goto deactivate;
+	}
 	return owner;
=20
 deactivate:
