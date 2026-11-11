Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421188;
	b=yBHF71t1GQTdb5Zuc6+FVvsPex8P8x+7hofwR+7Wq3leBOiHmrPBeaXAKWG+Ymy+nalw
	 DESa7jpNZuVLfrcD0MIT425yRYlVixr2orlZ2lPv3861U/kb7jaO7TmUT3w7n1GAcZ9mw
	 uN2g7MfwzFq9nF6kt2jULmnTd3idGqkJu2kQ8sW0vNrTt9UHqwDe7C8hcD3VXqx3Y3map
	 yF7JzgrqhJR6LisCNNiu6AuvOjwz081qZZw4RmJ5tDzL4l+VwaahyLBytGySh20+3Pp5R
	 1If874ZSHDl3mU8KWzfZXg3El5/pzlRDTG/uBPI2d5zoR/FRxv5D69ZfSxHpgD1MgrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421188;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+m45dLpdN3Ib0q1RcEQ066eCMtnPdAtMb0sBqi7Wa50=;
	b=aaaKQzRMCVYO4uYa73TTg2drpHTmaXiRJxHqJ4UAuWnKFtm3s0mX/er5DcA0SFNpoKbt
	 RM/7E2TBCjHRlf/kgKGpvYRV2ktW1dZ26HX07hLY4FybPQ46NGzipz9eu/BWSOGf1BjJq
	 QXcOSVQ4Lkqgx9T0Eu0ktA1sPrwAYDDQh/Ua+BP9Cx93N5VG9SysIe3JnRltSSFnQ+gJH
	 Mw9vtd6PToFJZ/Xu66LezIWv+T4phzMOoPdhCD3Db+oI3MGR6kS0IJCNZXJXKo85nHlnI
	 zN+XwWdXWXD12Lj9zlwZLeZYchZSFTh+49QicdkWCwA+CBWCxaChYnGVsrj95QYfKeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qOM3ZVBy;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b="XWIfJ/AU";
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E6606B78B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F3E6606B78B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qOM3ZVBy;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XWIfJ/AU
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794421186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+m45dLpdN3Ib0q1RcEQ066eCMtnPdAtMb0sBqi7Wa50=;
	b=qOM3ZVBygZm/1aaa78Y25bDNNLmuGwyhZ+RTg5JEW7vGu8cZDU29+H/V1ajAzSeUT8PMl2
	WZTFxUuBryMCpPIT3CLWoNgdbh1PNyqbtq12jGe6yo90AlPze+v9MPiPyablGNZOLWg0ef
	RJ6bbE0E5E+Gv4yVwfhQn5njace9lN+KUj+yWuIsk7ezYs9qFTYbYXklLAXi0ZVn9gRhUo
	iM7/EFvDjFj0WSb/YZ6c35ied88Z6kM0+Ntpbp7P9hwglAcBlodA5edKPn1PB/Hl5U5v59
	u9AEvzjNqE274d4gd/pnX+93XKh2ZF9uhxrLKvNHV2zGG0ce4oWGAhlsbME1Ow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794421186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+m45dLpdN3Ib0q1RcEQ066eCMtnPdAtMb0sBqi7Wa50=;
	b=XWIfJ/AUNheY3A9rwbjOTfeW+L6AZcglnHuUjztCkVgH2+Uh0YohTsFlWVNm6OXbNcgVHu
	32HjRq50X5iWgLAQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Rio <rioo.tsukatsukii@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Alessandro Carminati <acarmina@redhat.com>,
	Pnina Feder <pnina.feder@mobileye.com>
Subject: [PATCH printk v2 4/6] printk: Remove nbcon_atomic_flush_unsafe()
Date: Wed, 11 Nov 2026 19:25:20 +0106
Message-ID: <20261111181942.593695-5-john.ogness@linutronix.de>
In-Reply-To: <20261111181942.593695-1-john.ogness@linutronix.de>
References: <20261111181942.593695-1-john.ogness@linutronix.de>
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
index 711bd280d1c2f..fd012871322c0 100644
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
index 32286365d4fee..4020ad92ab141 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -765,7 +765,7 @@ void vpanic(const char *fmt, va_list args)
 	 * Explicitly flush the kernel log buffer one last time.
 	 */
 	console_flush_on_panic(CONSOLE_FLUSH_PENDING, PR_FLUSH_HANG);
-	nbcon_atomic_flush_unsafe();
+	printk_trigger_flush(PR_FLUSH_HANG);
 
 	local_irq_enable();
 	for (i = 0; ; i += PANIC_TIMER_STEP) {
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index d4d2fc51f2aa7..972c1174619ef 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1743,18 +1743,6 @@ void nbcon_atomic_flush_pending(enum pr_flush_reason reason)
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

