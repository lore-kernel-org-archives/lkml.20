Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227493;
	b=tlEVPlumnQ2JmWs0zhYBG6xlBkCyNDwlmZ9VaNGa9XnXd+NAUuDXmbPAQuBZJEiQz4Kx
	 5iQy3behkQxjEOPmzfcA91MY9WSbPaDpvZznjM3azCEXLBsmQzDkvNSOxXcbkGSgXLxVn
	 Rf/i4UKvWtoJjasLkPR0dtMkhISPyNGfcG79SMP2vcGQx1V6QlFB8lz/x8gc/3eTZJGb2
	 AEqKqKNkMiCsj1nZ3MLvSBo2dWBleEgCmvhB9t9cOodZI4RLmL55gP8JRFnZUeGAhgysJ
	 tNIcGNwVhsO53mqg4ol9SKRfvE3cH8ghBVFqm1eXZxFd3FLWbJCW9VHC6Jc3nNXydfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227493;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YgqgqGDehFnsb3++oZaHhGGEKE5uuo1rNwYJ7COxNO4=;
	b=hrWmZ6bbo8quudms6KQlJBSpbaoR3/TfXt9GGUecsHXAwpjpmfdPnp/E70IBJu1vBMpF
	 3ikOMwy++U2s0DbSnjnOCSkjG34670ulQ4UK/PceNTQPzF/shRzn34tLDhWk9Ub0huImV
	 JgnyZspMUXV2bDKD7WTW2kysJA/cbfn5VBAkoIUDlnbTMH3Q8Rc4t3H8JJovfI3fxRm/W
	 rcY6JhlE2LjS8CSfCycB/DtwzQSiRYvlHP3tpVIhXT5X2vfOkjxcgdQrmTEwqpl3wDrx4
	 lVgyBz+8X20xggYraarnmUSVeLIhr+fRykI26t6jkghoLZdLdMkxKDBH+h2OKYWFDZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="BQ/93bE9";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E9jdT9Eo;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC54D606A33E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC54D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BQ/93bE9;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E9jdT9Eo
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794227491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgqgqGDehFnsb3++oZaHhGGEKE5uuo1rNwYJ7COxNO4=;
	b=BQ/93bE90EfHq2wmgAC1q5DwDvupQa0evB356ytCfB5ApZbfOFxwsaseHl8YMomQx0OIvi
	2gNzi1zefTiIlloJg0RW1+HcAgGe+NngaBE/p3fIDrOJH61PqmuYh20rFgn9q9NrHvv2xg
	FmL7rLo9vzeG9zq0RjwlK/VHJFL+WaJoegTlAx3wPMwHgq7YJDLKip6ijg8asU6r2fHQS0
	S2yviA5e1aI2qoRfUsxTdSq4zMKG6Fl76W/HnXNyBTCec/hJg+R8ROc6O7OOLqU927vSyP
	akD+N8QLv3Vs6dBFi/6yZWvFbgZ79GMoKGnZ0bbxX5+JvRcJ0mtyIzKqCkk5vQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794227491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgqgqGDehFnsb3++oZaHhGGEKE5uuo1rNwYJ7COxNO4=;
	b=E9jdT9Eowk8x6Q4wC9gv5s0ipmamOZpOZopFQc3JCerr+LyHRkav4V3enNncI5tBMOgEmx
	t0su7f8L2jprMYCg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Rio <rioo.tsukatsukii@gmail.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Bradley Morgan <brads@mainlining.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alessandro Carminati <acarmina@redhat.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Pnina Feder <pnina.feder@mobileye.com>,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH printk 4/6] printk: Remove nbcon_atomic_flush_unsafe()
Date: Mon,  9 Nov 2026 13:37:21 +0106
Message-ID: <20261109123127.489676-5-john.ogness@linutronix.de>
In-Reply-To: <20261109123127.489676-1-john.ogness@linutronix.de>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need for the special function nbcon_atomic_flush_unsafe(),
which is only called at the end of panic(). Its functionality is
replaced with printk_trigger_flush(PR_FLUSH_HANG).

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 include/linux/printk.h |  5 -----
 kernel/panic.c         |  2 +-
 kernel/printk/nbcon.c  | 12 ------------
 3 files changed, 1 insertion(+), 18 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index c669497bd3378..1c8947fc46411 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -225,7 +225,6 @@ void console_try_replay_all(void);
 void printk_legacy_allow_panic_sync(void);
 extern bool nbcon_device_try_acquire(struct console *con);
 extern void nbcon_device_release(struct console *con);
-void nbcon_atomic_flush_unsafe(void);
 bool pr_flush(int timeout_ms, bool reset_on_progress);
 #else
 static inline __printf(1, 0)
@@ -336,10 +335,6 @@ static inline void nbcon_device_release(struct console *con)
 {
 }
 
-static inline void nbcon_atomic_flush_unsafe(void)
-{
-}
-
 static inline bool pr_flush(int timeout_ms, bool reset_on_progress)
 {
 	return true;
diff --git a/kernel/panic.c b/kernel/panic.c
index a4dbb6b8cd2bf..7c03a17ba1288 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -765,7 +765,7 @@ void vpanic(const char *fmt, va_list args)
 	 * Explicitly flush the kernel log buffer one last time.
 	 */
 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
-	nbcon_atomic_flush_unsafe();
+	printk_trigger_flush(PR_FLUSH_HANG);
 
 	local_irq_enable();
 	for (i = 0; ; i += PANIC_TIMER_STEP) {
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 513bfd399858c..0c832e33a8f2c 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1739,18 +1739,6 @@ void nbcon_atomic_flush_pending(enum pr_flush_reason reason)
 	__nbcon_atomic_flush_pending(reason, prb_next_reserve_seq(prb));
 }
 
-/**
- * nbcon_atomic_flush_unsafe - Flush all nbcon consoles using their
- *	write_atomic() callback and allowing unsafe hostile takeovers
- *
- * Flush the backlog up through the currently newest record. Unsafe hostile
- * takeovers will be performed, if necessary.
- */
-void nbcon_atomic_flush_unsafe(void)
-{
-	__nbcon_atomic_flush_pending(PR_FLUSH_HANG, prb_next_reserve_seq(prb));
-}
-
 /**
  * nbcon_cpu_emergency_enter - Enter an emergency section where printk()
  *				messages for that CPU are flushed directly
-- 
2.47.3

