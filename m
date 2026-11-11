Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421187;
	b=OhWymi1ihnyJ2flhft5utRzBBnQSjjiM0fI4VFZ3T+Fi9hvc0EbpwqqikA6qE/vLGe19
	 kD6xmIrw7hKITo5zpb9MQijsbu8cDEsP5sgPrURrCuezLugFtsdK7tW2z/83KX0zPRKEA
	 U6FBN5ELatBQ8rogIFQlmMwXEv6SJoNrSY47YeHa1eOPK12vqVfwDWka+GJWKvhc64cMx
	 lOn8qFUN4NKLeTygvNXChfgTrwrE+CurjpWcE7LT9bKKnFqMU4SYSmFeYelwCaPlfjM7B
	 qXD1+N1nvnpIZVtnwztq9JvUrnlxdiqHCBQi1o2mX1hDUnba+mgfxLRybQiLsMeXPEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421187;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i+EbupCfsSP6uNTyx+Yg+x0WtMoSnSzdXJZtzaNFuoE=;
	b=1vxy62uXp0sIoQnP0WVu0uAASWCPvPyR0YMze9Dn5hoIi0P9fodxsEyCma/PgSqqtIdF
	 AthosWoJcdVRFkqdL0LD+dnmHO6QB4DzLkRLYfwpRK64rSmnvcALgn/KlrG0Ix2qi13Du
	 5Xjy8zLIKBYbjv8SJCmMf5ezZaKGBRiLb6EEpIYELH4c71Oh+tKHXDGPnwN8QLBqOeOjQ
	 TjHSSLNLEGCtwNwuR/dxofE8V2k+velunWWbV+U52V6ClPvyyAIK/2HhIOhzB21GuSW2M
	 EPJRRDzLP5bAAVh9m/s4g8SA0TAFWdd78AMX4iAumrV+A6MKXzaPFLAGQRaDDRzZIeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=R2uf6J7R;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uIIpZ2EJ;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12497606AE2A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12497606AE2A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=R2uf6J7R;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uIIpZ2EJ
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794421185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+EbupCfsSP6uNTyx+Yg+x0WtMoSnSzdXJZtzaNFuoE=;
	b=R2uf6J7RjRUwjW/8h0XC6sqsYvzmWfSGc9+4pFKlEqKxqcthjXTTrCzu/G668bsaQavt2x
	DXm58dH2K/2q9ob9x2IhwL70IhBqkjAtpg6YuRirH+MN5GvI96PStnwWfRX6YPemDZgE9U
	3ksar9Vwwj3/aE7+bRa19XGpbnn5rYJxueXrPLOxrNPIQ59Y54zxTPRyjPHL14EBSNNwAI
	o3aJeJIINVtqA2PKvyEB585RZjp/0NvvK8LZSBJY+8hrXWcjUWAzJq1V2uiQkh1wMNLlXf
	xudOTcOiNF1Myjxpas+07OJa3JsADw/9dxtF4JcucVYOLVlfyftMq50y6LXSng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794421185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i+EbupCfsSP6uNTyx+Yg+x0WtMoSnSzdXJZtzaNFuoE=;
	b=uIIpZ2EJnZRV9J9mRkPxO8tC2BoTDd4BFypkS9NTAYA44lgSETzFPp7SVAie9TsWxdrcw1
	K5ZZLj1KkddUu7DA==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH printk v2 3/6] printk: Evaluate flush policy in nbcon_allow_unsafe_takeover()
Date: Wed, 11 Nov 2026 19:25:19 +0106
Message-ID: <20261111181942.593695-4-john.ogness@linutronix.de>
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

Currently nbcon_allow_unsafe_takeover() is a hack, relying on the
temporary setting of a global variable @panic_nbcon_allow_unsafe_takeover
as a gate to determine if unsafe flushing is allowed. This hack works
because unsafe flushing is only performed at the end of panic().
However, this hack is _not_ sufficient if unsafe flushing is to be
allowed in other contexts.

Allow unsafe flushing in other contexts by modifying
nbcon_allow_unsafe_takeover() to take a console and flush reason as
input and, based on the unsafe flush policies of that console, determine
if unsafe flushing is allowed. This also allows the global variable
@panic_nbcon_allow_unsafe_takeover to be removed.

Remove the hard-coded policy for CON_NBCON_ATOMIC_UNSAFE from
console_is_usable() and implement that policy logic within
nbcon_allow_unsafe_takeover().

Note that this changes the flushing flow for CON_NBCON_ATOMIC_UNSAFE
consoles. Rather than console_is_usable() reporting that the console
is not usable, __nbcon_atomic_flush_pending_con() will report that it
is unable to acquire ownership.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 include/linux/console.h | 11 +----
 kernel/printk/nbcon.c   | 91 +++++++++++++++++++++++++++++++----------
 2 files changed, 72 insertions(+), 30 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index beb1ee04535b7..b5024a879b96a 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -179,7 +179,8 @@ static inline void con_debug_leave(void) { }
  * @CON_NBCON:		Console can operate outside of the legacy style console_lock
  *			constraints.
  * @CON_NBCON_ATOMIC_UNSAFE: The write_atomic() callback is not safe and is
- *			therefore only used by nbcon_atomic_flush_unsafe().
+ *			therefore only called when allowed by
+ *			nbcon_allow_unsafe_takeover().
  */
 enum cons_flags {
 	CON_PRINTBUFFER		= BIT(0),
@@ -637,7 +638,6 @@ extern void nbcon_write_context_set_buf(struct nbcon_write_context *wctxt,
 extern bool nbcon_enter_unsafe(struct nbcon_write_context *wctxt);
 extern bool nbcon_exit_unsafe(struct nbcon_write_context *wctxt);
 extern void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt);
-extern bool nbcon_allow_unsafe_takeover(void);
 extern bool nbcon_kdb_try_acquire(struct console *con,
 				  struct nbcon_write_context *wctxt);
 extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
@@ -670,13 +670,6 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
 			/* The write_atomic() callback is optional. */
 			if (!con->write_atomic)
 				return false;
-
-			/*
-			 * An unsafe write_atomic() callback is only usable
-			 * when unsafe takeovers are allowed.
-			 */
-			if ((flags & CON_NBCON_ATOMIC_UNSAFE) && !nbcon_allow_unsafe_takeover())
-				return false;
 		}
 
 		/*
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 935fd6b86bac7..d4d2fc51f2aa7 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -557,10 +557,6 @@ static int nbcon_context_try_acquire_hostile(struct nbcon_context *ctxt,
 	if (!ctxt->allow_unsafe_takeover)
 		return -EPERM;
 
-	/* Ensure caller is allowed to perform unsafe hostile takeovers. */
-	if (WARN_ON_ONCE(ctxt->prio != NBCON_PRIO_PANIC))
-		return -EPERM;
-
 	/*
 	 * Check that try_acquire_direct() and try_acquire_handover() returned
 	 * -EBUSY in the right situation.
@@ -1453,24 +1449,60 @@ enum nbcon_prio nbcon_get_default_prio(void)
 	return NBCON_PRIO_NORMAL;
 }
 
-/*
- * Track if it is allowed to perform unsafe hostile takeovers of console
- * ownership. When true, console drivers might perform unsafe actions while
- * printing. It is externally available via nbcon_allow_unsafe_takeover().
- */
-static bool panic_nbcon_allow_unsafe_takeover;
-
 /**
  * nbcon_allow_unsafe_takeover - Check if unsafe console takeovers are allowed
+ *					for a specified console and reason
  *
- * Return:	True, when it is permitted to perform unsafe console printing
+ * @con:	The console to check
+ * @reason:	The reason for the unsafe takeover
  *
- * This is also used by console_is_usable() to determine if it is allowed to
- * call write_atomic() callbacks flagged as unsafe (CON_NBCON_ATOMIC_UNSAFE).
+ * Return:	True, when @con is allowed to perform unsafe console printing
  */
-bool nbcon_allow_unsafe_takeover(void)
+static bool nbcon_allow_unsafe_takeover(struct console *con, enum pr_flush_reason reason)
 {
-	return panic_on_this_cpu() && panic_nbcon_allow_unsafe_takeover;
+	int unsafe_flags = con->unsafe_flush_flags;
+	bool in_panic = panic_on_this_cpu();
+	bool allow = false;
+
+	switch (reason) {
+	case PR_FLUSH_RUNTIME:
+		if (in_panic) {
+			if (unsafe_flags & NBCON_PANIC_PRINTK)
+				allow = true;
+
+		} else {
+			/* Only when the kthreads have been shutdown. */
+			if ((unsafe_flags & NBCON_NORMAL_NOTHREAD) &&
+			    !con->kthread &&
+			    system_state > SYSTEM_RUNNING) {
+				allow = true;
+			}
+		}
+		break;
+	case PR_FLUSH_RESTART:
+		/* kexec, reboot */
+
+		if (in_panic) {
+			if (unsafe_flags & NBCON_PANIC_FLUSH)
+				allow = true;
+
+		} else {
+			/* Printing kthreads not reliable. */
+			if (unsafe_flags & NBCON_NORMAL_NOTHREAD)
+				allow = true;
+		}
+		break;
+	case PR_FLUSH_HANG:
+		/* Always unsafe flush before hang. */
+		allow = true;
+		break;
+	case PR_FLUSH_KDB:
+		if (unsafe_flags & NBCON_KDB)
+			allow = true;
+		break;
+	}
+
+	return allow;
 }
 
 /**
@@ -1515,6 +1547,14 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
 	ctxt->prio	= nbcon_get_default_prio();
 
 	if (use_atomic) {
+		ctxt->allow_unsafe_takeover = nbcon_allow_unsafe_takeover(con,
+									  legacy_flush_reason);
+
+		if ((console_srcu_read_flags(con) & CON_NBCON_ATOMIC_UNSAFE) &&
+		    !ctxt->allow_unsafe_takeover) {
+			return false;
+		}
+
 		/*
 		 * In an atomic or unknown context, use the same procedure as
 		 * in console_emit_next_record(). It allows to handover.
@@ -1572,7 +1612,12 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, enum pr_flush_r
 	ctxt->console			= con;
 	ctxt->spinwait_max_us		= 2000;
 	ctxt->prio			= nbcon_get_default_prio();
-	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover();
+	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover(con, reason);
+
+	if ((console_srcu_read_flags(con) & CON_NBCON_ATOMIC_UNSAFE) &&
+	    !ctxt->allow_unsafe_takeover) {
+		return -EPERM;
+	}
 
 	while (nbcon_seq_read(con) < stop_seq) {
 		/*
@@ -1707,9 +1752,7 @@ void nbcon_atomic_flush_pending(enum pr_flush_reason reason)
  */
 void nbcon_atomic_flush_unsafe(void)
 {
-	panic_nbcon_allow_unsafe_takeover = true;
 	__nbcon_atomic_flush_pending(PR_FLUSH_HANG, prb_next_reserve_seq(prb));
-	panic_nbcon_allow_unsafe_takeover = false;
 }
 
 /**
@@ -1976,8 +2019,14 @@ bool nbcon_kdb_try_acquire(struct console *con,
 	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
 
 	memset(ctxt, 0, sizeof(*ctxt));
-	ctxt->console = con;
-	ctxt->prio    = NBCON_PRIO_EMERGENCY;
+	ctxt->console			= con;
+	ctxt->prio			= NBCON_PRIO_EMERGENCY;
+	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover(con, PR_FLUSH_KDB);
+
+	if ((console_srcu_read_flags(con) & CON_NBCON_ATOMIC_UNSAFE) &&
+	    !ctxt->allow_unsafe_takeover) {
+		return false;
+	}
 
 	if (!nbcon_context_try_acquire(ctxt, false))
 		return false;
-- 
2.47.3

