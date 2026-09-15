Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9A4470EA0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466513; cv=none; b=D6WN3pNo5F9CHqfWQY/2s06V750LI5D1qi5PF3EnLop1Cd7hlF9rkgeYmU4wNEarMrP24ERZnA/o9TdQDRHerHw4yxWOEV/SxpiwR7FAnfRybnJUXxHqzoxtkORaMekVnatsvhoDQ3dbZClGFD5bEyDTcEXxDsSPXbKqEK1W4C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466513; c=relaxed/simple;
	bh=y9XYLztJ6FYFNTl+LwcbVqc6y4YcqNIT0VXfgbo7iLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eOcoxO93Pbtn+g5EmFUMCVWG/pYjOYWQJdnxVrJdKz1fxGGbwoZtb5zgkysAMoYJ1FfdKpwH1EQBm5hhUPuKcafReJoHAhaJ+BXTAgf575N/FDjYlItIMgrmJbaOvOS4MK6VQ6yPQsKk4cIUBq0Pn8lJQV9j5RZi7whnGtvTaXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Y0Hc2vNx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Y0Hc2vNx"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A10E91477;
	Tue, 15 Sep 2026 03:01:47 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.2.198.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D1313F86F;
	Tue, 15 Sep 2026 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789466511; bh=y9XYLztJ6FYFNTl+LwcbVqc6y4YcqNIT0VXfgbo7iLo=;
	h=From:To:Cc:Subject:Date:From;
	b=Y0Hc2vNxxcRUPZKkK8eHnF1jgFm9z1xT0buNyeP6oihCccbXR1U0lcJWHsQX06tCm
	 f/mPojkFtkyJUmw967ChujyH70nX/NcWkMG0lKh+eiVCU5IxxI/GYX9jMqFv9SJVFP
	 ZLiILo5xNVzSGcdTqFl4K5FeSyw4/9pr27DtU7CE=
From: Ryan Roberts <ryan.roberts@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Rio <rioo.tsukatsukii@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Date: Tue, 15 Sep 2026 11:01:38 +0100
Message-ID: <20260915100140.3631650-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Netconsole registers with CON_NBCON_ATOMIC_UNSAFE, so its write_atomic()
callback is only usable during nbcon_atomic_flush_unsafe(). Previously
this was only called by vpanic() if panic_timeout=0 - i.e. if the system
was configured not to reboot on panic. So if the system was configured
to reboot on panic, netconsole would never receive the panic logs.

Move vpanic()'s emergency_restart() call to after the call to
nbcon_atomic_flush_unsafe() to solve this problem. The downside is that
potentially unsafe operations are now performed prior to
emergency_restart() which could theoretically reduce the chances of the
restart succeeding. But we are already in a panic situation so it could
be argued that everything is best effort already.

In older kernels (v6.19 and earlier) netconsole is able to print these
panic logs while the system is configured to reboot on panic. So from a
user perspective this is a regression caused by commit 7eab73b18630
("netconsole: convert to NBCON console infrastructure").

We have automated test systems without BMC access, which rely on these
two features working together.

Fixes: 7eab73b18630 ("netconsole: convert to NBCON console infrastructure")
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 kernel/panic.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index 213725b612aa..473dc7d13b23 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -732,32 +732,22 @@ void vpanic(const char *fmt, va_list args)
 			mdelay(PANIC_TIMER_STEP);
 		}
 	}
-	if (panic_timeout != 0) {
-		/*
-		 * This will not be a clean reboot, with everything
-		 * shutting down.  But if there is a chance of
-		 * rebooting the system it will be rebooted.
-		 */
-		if (panic_reboot_mode != REBOOT_UNDEFINED)
-			reboot_mode = panic_reboot_mode;
-		emergency_restart();
-	}
+	if (panic_timeout == 0) {
 #ifdef __sparc__
-	{
 		extern int stop_a_enabled;
 		/* Make sure the user can actually press Stop-A (L1-A) */
 		stop_a_enabled = 1;
 		pr_emerg("Press Stop-A (L1-A) from sun keyboard or send break\n"
-			 "twice on console to return to the boot prom\n");
-	}
+			"twice on console to return to the boot prom\n");
 #endif
 #if defined(CONFIG_S390)
-	disabled_wait();
+		disabled_wait();
 #endif
-	pr_emerg("---[ end Kernel panic - not syncing: %s ]---\n", buf);
+		pr_emerg("---[ end Kernel panic - not syncing: %s ]---\n", buf);

-	/* Do not scroll important messages printed above */
-	suppress_printk = 1;
+		/* Do not scroll important messages printed above */
+		suppress_printk = 1;
+	}

 	/*
 	 * The final messages may not have been printed if in a context that
@@ -767,6 +757,17 @@ void vpanic(const char *fmt, va_list args)
 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
 	nbcon_atomic_flush_unsafe();

+	if (panic_timeout != 0) {
+		/*
+		 * This will not be a clean reboot, with everything
+		 * shutting down.  But if there is a chance of
+		 * rebooting the system it will be rebooted.
+		 */
+		if (panic_reboot_mode != REBOOT_UNDEFINED)
+			reboot_mode = panic_reboot_mode;
+		emergency_restart();
+	}
+
 	local_irq_enable();
 	for (i = 0; ; i += PANIC_TIMER_STEP) {
 		touch_softlockup_watchdog();
--
2.43.0

