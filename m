Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733F81C5D72
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 05:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791350271; cv=none; b=jk6jQMptJ+El6afVuPDS9IkTm92nSH8RR4l1meM4ZMyjLzqNPhX377IdI4NBifdCZZC/prhe6daAAOk6uuHFR+bvLHBmelefXQu1e0xzfXcfcv5cFg+t8HKbroARi5ej/Xp3xhXSW7BnFmsy7VrRxWoDTU5WOSLhW8lQim2jIW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791350271; c=relaxed/simple;
	bh=rQLU/LyG+UFoHLdbgVC3uOx2o+nd1kU8t3rrzSmPWbs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hma51izZR6AYIakEdzhsdtBmkJK6G+PLtvo7v0/rkwrap7EETBhL3Tv+FQSVnZMPGdMS7vuoF0Z+rnXWU8Tyqh15wOaAOwww2bBsfkApUOWriat8cpFLtrTEoeuJwvWPYhtpxdB7GwkglZfKOlYC4hvv57yCf6niB2bRfj7unG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqGbjY9z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqGbjY9z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4611F0089B;
	Wed,  7 Oct 2026 05:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791350270;
	bh=OFVGyapdcWbHcxlPQND9dw5kXqmPIHpkOr140zO7XvE=;
	h=From:To:Cc:Subject:Date;
	b=lqGbjY9znaYx7t3t6YLFSt9yf5BwsXa3nD12qUyl2Fv8Lbrz74qEhw2Pd+U5Jto+E
	 I3hjBPwBb0Oq92eehvm69011rK6Mg1Vj/RKbuEujHxWmT72eks0smFvOoCyWi5RiDq
	 T62By71rZt23SEGQ1KaS0dCdwOTC5FK+WbhaVee4nMnU5KRUxZswFO1b2KbvkMPvDo
	 qSW2PBGQ7AwxHZOfulunyAiEO7F+QFuDtbbMW1vO7gj9OTU4O4QZ22Pl7yD0etWPMO
	 6tPDrjViGijkFVpZOeLx68JCR4sXVf8yCAe5OOSnSlWGV+d4L/hr/t78Q+ldh3UHJo
	 cDXNgsoywpxvQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Petr Mladek <pmladek@suse.com>,
	Douglas Anderson <dianders@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH] watchdog: Force console verbose when reporting lockups
Date: Wed,  7 Oct 2026 05:17:26 +0000
Message-ID: <20261007051726.4154849-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a hard or soft lockup is detected, the watchdog prints a header at
KERN_EMERG (<0>), followed by diagnostic details (modules, registers,
and backtraces) at KERN_WARNING/KERN_DEFAULT (<4>) and KERN_INFO (<6>).
If console_loglevel is quiet (<= 4), the console skips those <4>/<6>
diagnostic messages before vpanic() has a chance to call
console_verbose().  With the buddy detector, this leaves only the
detector CPU's panic stack on the console and nothing about the locked
CPU:

  <0>[ 1535.991833][    C6] watchdog: Watchdog detected hard LOCKUP on cpu 7
  <0>[ 1535.995960][    C6] Kernel panic - not syncing: Hard LOCKUP
  <4>[ 1535.995970][    C6] CPU: 6 UID: 0 PID: 0 Comm: swapper/6 ...
  <4>[ 1535.995997][    C6] Call trace:
  ...
  <4>[ 1535.996063][    C6]  watchdog_hardlockup_check+0x1e0/0x288
  <4>[ 1535.996075][    C6]  watchdog_buddy_check_hardlockup+0xb4/0xc0

Similar to commit 168e06f7937d ("kernel/hung_task.c: force console
verbose before panic"), call console_verbose() before printing the
lockup report so the diagnostic output is not suppressed.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 kernel/watchdog.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index e5134ad7b663..64da2e500144 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -255,6 +255,9 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 			return;
 	}
 
+	if (hardlockup_panic)
+		console_verbose();
+
 	/*
 	 * NOTE: we call printk_cpu_sync_get_irqsave() after printing
 	 * the lockup message. While it would be nice to serialize
@@ -880,6 +883,10 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 		/* Start period for the next softlockup warning. */
 		update_report_ts();
 
+		thresh_count = duration / get_softlockup_thresh();
+		if (softlockup_panic && thresh_count >= softlockup_panic)
+			console_verbose();
+
 		printk_cpu_sync_get_irqsave(flags);
 		pr_emerg("BUG: soft lockup - CPU#%d stuck for %us! [%s:%d]\n",
 			smp_processor_id(), duration,
@@ -901,7 +908,6 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 
 		add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
 		sys_info(softlockup_si_mask & ~SYS_INFO_ALL_BT);
-		thresh_count = duration / get_softlockup_thresh();
 
 		if (softlockup_panic && thresh_count >= softlockup_panic)
 			panic("softlockup: hung tasks");
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

