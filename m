Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA921443C0A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123891; cv=none; b=updhfbb85gnxq6/C+iTJwvY72Z+rDFduceCQLwdHO/aBrQ03YIwyvZ6hlkeZUwo8OE7Bdjv+GCvXlR3+gS9yT3rlWdCzGEiJdJ4qULPmIbf5cwvl0wCCe3WML3/kkwQ2pjS/MfNW2E/uuFMtS/1rU4ty+enUS9JB//092sMdgls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123891; c=relaxed/simple;
	bh=IQpJE3RZmdNgSQD3n6D0YXAXeTf6qpImDl/9LYyhJj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KLSklTrMaoIuztE4OD3qPUlEK2XrZ6vgS899fHhY/S1eUcsQ5vk2OQt1HeQfla1vEinS+iuWkO7A52KWaY2qu+KQCBZMEAXmbS+XGQ4zjFWCiuqIu30FpsUgA1d6WImKnONKKelaGN8nxrdyhJqK13T0nWtZfnBW7JMEcsBaskc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e7A7+eyw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UkfuQ8Jo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e7A7+eyw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UkfuQ8Jo"
Date: Fri, 11 Sep 2026 12:51:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789123887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=eSJnet9XQNAWsVk90MunccOTXviqb/KTAit/ZAd4LFg=;
	b=e7A7+eywuyKogfMToYBOE6eKb8EHOFil2bbHIF7lxn+Or6+YxJxLJY9d93nGadL17lUsEY
	PMgJ2io5rAr89kUkTY5DtEBtuNU3EdHzjom2YXJsFSMdSii1e3cqTqAqeylgrTrSMbiZtX
	UG47/DAn/a3KHoBliXGDo8/whUDIFxzCMSjqruKIqZhyxmN209sf5+l/VNPT8ZdVUoUiy6
	ae4/reTgRx3wz69//Dnz4oMcs/U4Mc213ukFd7xqQwFbMB7Psx908e3cSLp0kRimev+OPE
	3If2Ue0URrTZjxTdpZGq4jrbRr2M8Boh71+ytTdtpQOHhKtKp2b2DG/rZGZpXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789123887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=eSJnet9XQNAWsVk90MunccOTXviqb/KTAit/ZAd4LFg=;
	b=UkfuQ8JofSlcSVVqqdvIyZN6h8dI2+ykJSo8I/aWAMN5t6+JuRTxs+n5s8lZ3H/OW0P9yD
	40MVLj/KwoBAMSDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] printk: Remove preempt_disable() from __wake_up_klogd()
Message-ID: <20260911105126.aPCuP2jV@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

I was puzzled why there is a preempt_disable(). Turns out it is due to
the per-CPU usage of the previous irq_work, as introduced in commit
74876a98a87a1 ("printk: Wake up klogd using irq_work"), where the or and
enqueue must happen on the same CPU.

Since we don't have this anymore, it can go.

Remove the preempt_disable from __wake_up_klogd().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---

I'm sorry, I noticed this after starring at it once I sent the patch. I
could resend and merge it into the previous if it is preferred.

 kernel/printk/printk.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 7c5a220e84323..0fd6c37e2b333 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4623,7 +4623,6 @@ static void __wake_up_klogd(int val)
 	if (WARN_ON_ONCE(console_irqwork_blocked))
 		return;
 
-	preempt_disable();
 	/*
 	 * Guarantee any new records can be seen by tasks preparing to wait
 	 * before this context checks if the wait queue is empty.
@@ -4640,8 +4639,6 @@ static void __wake_up_klogd(int val)
 
 	if (val & PRINTK_PENDING_OUTPUT)
 		irq_work_queue(&pending_output_work);
-
-	preempt_enable();
 }
 
 /**
-- 
2.55.0

