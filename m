Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04363B813D;
	Fri,  4 Sep 2026 06:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788504502; cv=none; b=UQVe21sVp3ND27I2KEmXlZI3hdee5THXXy0fomF+DOK1Jb/bfnv5K6iZ0AsR0oMID9D09yCv8Bp7YyXSv3oBYYf0ZhM0+f1a8l4suuse/4pR/nQqr9uGFwv5AgBGs5Wd4EyXvqUVXkwhTmObPEBBE+xPOFOl6l52a8IG72Tx/lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788504502; c=relaxed/simple;
	bh=Dm84Y1fS1cTRpyRUvJ6aXygOUDS1+ltdlZT7LXedda0=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=agLM08Iki4eXXOilK/HpGziwKkseq310hRClUGjwaDiTVV0OSGs2gcPByCCALyfUBOEr1e27JhiZXFZ4VyUI0eWcOHLLc86ymRvQO3dZmK/J9hdgIgYto4ZYGPQ2WJ1QEYmqVj1iUsIJZc/ecrNsd63d4I8UC+EOv+c/sMIlP4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Cz6mKLF8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D+2rKGaK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Cz6mKLF8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D+2rKGaK"
Date: Fri, 04 Sep 2026 06:48:16 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788504497;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCHGNUAgNWRRMu1OYt9+eo67yD+XxKa/F9EkMT2leB8=;
	b=Cz6mKLF8H1j1GZCVOMEmu0T3os8SS5eROG+q6JiBNd8BcdJPNYpDLsR4997oCVeuNZJPUy
	wwHlgMv03TPLxDnikJXEdFqyS9G5EXTPla278Hr6fmCMWi+XdqweHptkt2lYEjyIjPkK2f
	SXofg/lqv+G7YI3yblsd5UCVThblLHgyMC7hCtEL205O7jLi52es0f4upEAeggBg2yElZL
	t7Y1O/OpN0XPz6tx6dG4P4+4akEryXZfH9T6B8MfHTlPvQjncItl1LxBHwfsNB/80aAhkQ
	wQEXPplV3wnzDAaj6gWEj3ArOglR19HKOrBb+6SLUVKkyWqwFiVNbi6SxiP3ug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788504497;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCHGNUAgNWRRMu1OYt9+eo67yD+XxKa/F9EkMT2leB8=;
	b=D+2rKGaKaB1vH+wCw3EHzG2wuwXZZWGmQM9ZB3kHhPY+RYBy4IJ98p9UF9zadN3jXRqZbp
	UovgKJccusyf74CQ==
From: "tip-bot2 for Enlin Mu" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/core] softirq: Remove redundant h->action from
 preempt_count mismatch error
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Enlin Mu <enlin.mu@unisoc.com>, Enlin Mu <enlin.mu@linux.dev>,
 Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, maz@kernel.org
In-Reply-To: <20260825011509.8505-1-enlin.mu@linux.dev>
References: <20260825011509.8505-1-enlin.mu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178850449605.3717435.10744522318261630112.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/core branch of tip:

Commit-ID:     67f399a9ac7f3001cafc0cb1b645e3e5760779d2
Gitweb:        https://git.kernel.org/tip/67f399a9ac7f3001cafc0cb1b645e3e5760=
779d2
Author:        Enlin Mu <enlin.mu@linux.dev>
AuthorDate:    Tue, 25 Aug 2026 09:15:09 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 08:45:56 +02:00

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
Signed-off-by: Enlin Mu <enlin.mu@unisoc.com>
Signed-off-by: Enlin Mu <enlin.mu@linux.dev>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
