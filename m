Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793383009;
	b=vjERWWnHWWAAUvkRyu0u94/P5Uf2EnzZIgew/xAcc1OzMYY78ewvJLZhZp8tWKp8foFb
	 vKEcnEoiz/BXKqemsgssM6sUS92bE/5734Qwc1d5d3XGTZQhZYaXVygybPcevpC+hNu+X
	 S8Sv5ytBLE35oPjzXb/T/GHvfRaadEHExaAsPFIYp46UpIybl2qPpxlhOBshk8+CrI3+N
	 rzSK2FsVIJ5LLEPt76FBm6+iWcMccEpu3buRutali3y3qna7Yf8TkQE6cW86YKFJhgvMb
	 8AjFM4UF08VOY+On7QjhxSUcz9ynbjA7zqRyj2h9/sSflbAiOyq2vjQ+OtmZ/EViTQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793383009;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=Op8zYICo7i9fAwJ8jq9C2vD08V0xXkb4Jiz2z/hRrBg=;
	b=TBY5NljiWfDwSKZTvjxZxpsav/Buu/iuJcfkN2VMAqn03oOIQd0IHxdIKmP9LbmWG9Jk
	 /S4mP45bqoe14xOJPQ+pAgcR0i7SYao3fzQrNCcRVYIy9hmDEqo3o9WZY7DHdUbr1pVum
	 LBaoxMmagkbzAJ6UfwvQcrkCQKivsEtmAnxqxp89K4n1p452uTJY2TWNcWTwHTSMfiYwk
	 dHoQAiBqyUYgFiZjmEkwGVNmwCyZfr491ZsztH7B6V9Tjht5u9PGmAlzVSimgj0weqE+K
	 G0nYCGpQ6l6tJZzD3LcClDH08vYREQ9xheJGZ3Odkyu6hR8Ik1S+5hcKlz7vTlOFN7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=G6PWqMxi;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEDA606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEDA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=G6PWqMxi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Op8zYICo7i9fAwJ8jq9C2vD08V0xXkb4Jiz2z/hRrBg=; b=G6PWqMxi4jsmH5Jmt1koB2PRbH
	CJmtvp/QsyZp1Py4Fw1bQDLMWX8L1Q4+Q58qIZhmMKFMe97ImY+4spFsxYAKLEkH0CvdbYkDkyAXr
	CBmON8dtGncsFFNuPfVvJ0yHLFcyK3IIgsuSXmH/UtoXzr9kz8GTps9roS4js82RklYy/m6WWHjQz
	xz7F4o52wiRW3F4Ruqw0B3qYhqM1nzG+JQ4w6girSz8qAzm5ipxypxarXFhVHVfHYMeZS9PHB4iX/
	qM9/ToHoRZk2oIkwC4rUjYX+nXck2OIzju5RCn5KEcANoNyGIJ6N/tu1rOlPE4FJwhU79h8tqOnqL
	TGKjKqTQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMqqG-003zno-26;
	Fri, 30 Oct 2026 17:56:41 +0000
Date: Fri, 30 Oct 2026 10:56:35 -0700
From: Breno Leitao <leitao@debian.org>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, 
	Ryan Roberts <ryan.roberts@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <auTaBZlNbpm3jgvb@gmail.com>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz>
 <87bj8kkfwk.fsf@jogness.linutronix.de>
 <auHNz09oyGFJPTKg@gmail.com>
 <8733tphow9.fsf@jogness.linutronix.de>
 <auI40MZlSYO0oAAS@gmail.com>
 <87a4nwyiaw.fsf@jogness.linutronix.de>
 <auMmQjcy1A6E0eUm@gmail.com>
 <874ie4y5mw.fsf@jogness.linutronix.de>
 <auNaD8LELWok3LOF@pathway>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auNaD8LELWok3LOF@pathway>
X-Debian-User: leitao

On Thu, Oct 29, 2026 at 03:37:03PM +0100, Petr Mladek wrote:
> Another question is where to call it. I guess the it should be called
> in two code paths:
> 
>    + __crash_kexec() likely after stopping other CPUs
> 
>     + console_flush_on_panic() after flushing safe nbcon consoles
> 	the safe way

What about something like:


commit de57403441b601af01d92bc03bf0625338d39c80
Author: Breno Leitao <leitao@debian.org>
Date:   Fri Oct 30 10:08:01 2026 -0700

    panic: flush unsafe consoles before reboot and kdump
    
    netconsole registers with CON_NBCON_ATOMIC_UNSAFE since commit
    7eab73b18630 ("netconsole: convert to NBCON console infrastructure"), so
    its write_atomic() only runs from nbcon_atomic_flush_unsafe(). vpanic()
    calls that right before its final busy loop, after emergency_restart()
    and after __crash_kexec().
    
    A panic that reboots (panic_timeout != 0) or boots a crash kernel
    therefore never reaches the netconsole target. Neither does an oops that
    goes to kdump through crash_kexec(), which skips vpanic() entirely.
    Before the conversion, netconsole was a legacy console, flushed by
    console_flush_on_panic() ahead of the reboot.
    
    Add nbcon_atomic_unsafe_only_flush(), which flushes only the
    CON_NBCON_ATOMIC_UNSAFE consoles and allows unsafe takeovers on them.
    Call it on the panic CPU once the other CPUs are stopped, leaving the
    consoles with a safe write_atomic() alone.
    
    In vpanic() it runs after the safe flush, when
    panic_other_cpus_shutdown() has stopped the other CPUs. In
    __crash_kexec() it runs after crash_smp_send_stop() and before
    machine_crash_shutdown(), the order panic() already uses with
    crash_kexec_post_notifiers.
    
    The call does not go into console_flush_on_panic(), because kgdb_panic()
    calls that before the other CPUs are stopped. It does not go after
    machine_crash_shutdown() either: on TDX guests tdx_kexec_finish() zaps
    the shared PTEs there, and netconsole on a virtio NIC would touch that
    memory.
    
    A write_atomic() that hangs now keeps the machine from rebooting or from
    reaching the crash kernel.
    
    Fixes: 187de7c212e5 ("printk: nbcon: Allow unsafe write_atomic() for panic")
    Reported-by: Ryan Roberts <ryan.roberts@arm.com>
    Closes: https://lore.kernel.org/all/20260915100140.3631650-1-ryan.roberts@arm.com/
    Suggested-by: John Ogness <john.ogness@linutronix.de>
    Suggested-by: Petr Mladek <pmladek@suse.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Breno Leitao <leitao@debian.org>

diff --git a/include/linux/console.h b/include/linux/console.h
index cb8be9ea4a767b..ebfa259633761a 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -183,7 +183,8 @@ static inline void con_debug_leave(void) { }
  * @CON_NBCON:		Console can operate outside of the legacy style console_lock
  *			constraints.
  * @CON_NBCON_ATOMIC_UNSAFE: The write_atomic() callback is not safe and is
- *			therefore only used by nbcon_atomic_flush_unsafe().
+ *			therefore only used by nbcon_atomic_flush_unsafe() and
+ *			nbcon_atomic_unsafe_only_flush().
  */
 enum cons_flags {
 	CON_PRINTBUFFER		= BIT(0),
diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd41..95da3904c0d30e 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -208,6 +208,7 @@ void printk_legacy_allow_panic_sync(void);
 extern bool nbcon_device_try_acquire(struct console *con);
 extern void nbcon_device_release(struct console *con);
 void nbcon_atomic_flush_unsafe(void);
+void nbcon_atomic_unsafe_only_flush(void);
 bool pr_flush(int timeout_ms, bool reset_on_progress);
 #else
 static inline __printf(1, 0)
@@ -322,6 +323,10 @@ static inline void nbcon_atomic_flush_unsafe(void)
 {
 }
 
+static inline void nbcon_atomic_unsafe_only_flush(void)
+{
+}
+
 static inline bool pr_flush(int timeout_ms, bool reset_on_progress)
 {
 	return true;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf8990b..d00a8ce5cb618c 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -140,6 +140,13 @@ void __noclone __crash_kexec(struct pt_regs *regs)
 
 			crash_setup_regs(&fixed_regs, regs);
 			crash_save_vmcoreinfo();
+			/*
+			 * Flush the unsafe consoles with the other CPUs
+			 * stopped, before machine_crash_shutdown() tears
+			 * down what they may need.
+			 */
+			crash_smp_send_stop();
+			nbcon_atomic_unsafe_only_flush();
 			machine_crash_shutdown(&fixed_regs);
 			crash_cma_clear_pending_dma();
 			machine_kexec(kexec_crash_image);
diff --git a/kernel/panic.c b/kernel/panic.c
index 91e48d33b7dbbd..e14b1b60828130 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -723,6 +723,9 @@ void vpanic(const char *fmt, va_list args)
 		panic_console_replay)
 		console_flush_on_panic(CONSOLE_REPLAY_ALL);
 
+	/* The other CPUs are stopped, flush the unsafe consoles too.
h /tmp/puf_post.sh kerneltest001.31.atn1 6791 atn1a &); (sh
/tmp/puf_post.sh kerneltest005.19.atn2 6792 atn2a &)
/
+	nbcon_atomic_unsafe_only_flush();
+
 	if (!panic_blink)
 		panic_blink = no_blink;
 
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 5f8afaca886650..a43143eca1a015 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1653,8 +1653,9 @@ static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
  * __nbcon_atomic_flush_pending - Flush all nbcon consoles using their
  *					write_atomic() callback
  * @stop_seq:			Flush up until this record
+ * @unsafe_only:		Flush only the CON_NBCON_ATOMIC_UNSAFE consoles
  */
-static void __nbcon_atomic_flush_pending(u64 stop_seq)
+static void __nbcon_atomic_flush_pending(u64 stop_seq, bool unsafe_only)
 {
 	struct console *con;
 	int cookie;
@@ -1666,6 +1667,9 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
 		if (!(flags & CON_NBCON))
 			continue;
 
+		if (unsafe_only && !(flags & CON_NBCON_ATOMIC_UNSAFE))
+			continue;
+
 		if (!console_is_usable(con, flags, true))
 			continue;
 
@@ -1688,7 +1692,7 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
  */
 void nbcon_atomic_flush_pending(void)
 {
-	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
+	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
 }
 
 /**
@@ -1701,7 +1705,21 @@ void nbcon_atomic_flush_pending(void)
 void nbcon_atomic_flush_unsafe(void)
 {
 	panic_nbcon_allow_unsafe_takeover = true;
-	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
+	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
+	panic_nbcon_allow_unsafe_takeover = false;
+}
+
+/**
+ * nbcon_atomic_unsafe_only_flush - Flush only the CON_NBCON_ATOMIC_UNSAFE
+ *	consoles, allowing unsafe hostile takeovers
+ *
+ * Like nbcon_atomic_flush_unsafe(), but consoles with a safe write_atomic()
+ * are left alone. Meant for the panic CPU once the other CPUs are stopped.
+ */
+void nbcon_atomic_unsafe_only_flush(void)
+{
+	panic_nbcon_allow_unsafe_takeover = true;
+	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), true);
 	panic_nbcon_allow_unsafe_takeover = false;
 }
 
