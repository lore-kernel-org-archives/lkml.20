Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883215;
	b=q/TGv2vUonbFoZlAA4d+Lj5FWQO1q8JT/4CfihaGPyQ0YJfG2TFo7R3TBWqKTc6ZHNuX
	 G61vePPXnzwFSzVRDQJTac57A080ZEA2zxkhOt+s2sZIWetZU2yx+iJIOITdDdFd0oaPI
	 Y/mkw8B9TIivFe2rQ4URW/YkXs9jbOUG+T6hnREO3a52LsS3KsX1rOASf+Q7nZCvhat/M
	 draN8i/txnHJAk8u+L4REsYk5Z+G/xblC9odfIzwHFnUu3mWQsNsSHL6goUkCIV7b1YgW
	 /1gmBMhFRX0gcnpYOQt8XKmLt7/miun0OWPnhyWE0z580X1ZGV4MBOBRB+KXA/HfB9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Mj/IlOlFiVg3XOKyCX4qOu3ZEou8sRwfHozl03ktwdA=;
	b=p3wMZhZ167TEpSrBIOlkxR8UVYORmiu9N4skFw7wazCOQp3MEivjiM0rWhJ6Ibdd38Ry
	 mLHr0GjgHTx86pJoPGZZuZRWbxB7G0Nm2MztK/3V+CA2XatkD+eQDkOpzMsMF+Ut8Qnoy
	 BRbuTtA1XqiRjF93QIamP02YO/uD28pyx3gOjIbq4g7RUFpg6Jidbzz59EMvTNeUIIdlu
	 5n+a0+5Qfim8oltduVt4GSOIMHvCH+2X5+DtJ/gc6e8JM19pGnCYDQVDB8HJ/WxUo65fp
	 C7cwzc0iy/qzvPfzXwS6xKIeocK3T6H0h9QaNeeCcRfwq3ZpP8dWvLBX5qi6Ckoof4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mjChOsJS;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AC6606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73AC6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mjChOsJS
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c315869241fso234534766b.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792883214; x=1793488014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mj/IlOlFiVg3XOKyCX4qOu3ZEou8sRwfHozl03ktwdA=;
        b=mjChOsJSBKyxYdudhgBUdrwXDZGnRq7mzjLe4b896IiV9ScSlVs3nf+OdHOnuR+1+2
         5aNUB0kHa3/MgRYtn8QeLa8NCE4u0Z2G++vMIRh5j1wAwJF5i1Vkmg1Zv6Qdrjs5r5dG
         IWWojEH5bOTcWiUWjGAtZlSR9l6mtGnF6YPrxxpQ5CEvwo6lLHjUKuxvzFGALlyFIxN1
         w8kmicB2OGO7O9l88oR0+LZ/qjZjm9YHj4K2myOmdiIavK3SMx+uSqPu0cPs9HgztFEu
         rbVwqsnvWeoiJulYX1P327B7wf9oE0X2Uk66Ft1WGTE4DvpcQMBjLtemfNKuWEizxfkz
         v33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792883214; x=1793488014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mj/IlOlFiVg3XOKyCX4qOu3ZEou8sRwfHozl03ktwdA=;
        b=j1mRQ4hPDSFFucqkmoybxmhsVgW7XUzNTx5pCoc4qM+swGRtdlFVjEYIBRAsouxn2C
         iQvOAvdNk4Xo8PmTbwy4o87QngZhucZlj9htbr1dzr9VbpFPCXuEgkpWHTN3CAv3V2ly
         NXs+Z1TK6CQjqs9txOBg3M7rQrRAqjoqPYlw8yINoQuV6KE0bXK/IY99+jk9U2n1sNcx
         EhYJZV0hZ5t4sB2GHmjz5IBfG4O0zZINJJWcrzpZadJUCDuz2uKpbrYioFHJL+nkXOdF
         c6RXFernL2+5OV8EBJXOlGc5mQ1Apc4sVIOZUHagevz2hU+VgVXdZPSxaWGeei7VOh84
         23Ww==
X-Gm-Message-State: AFq9FYI6oH3RuVZLqJOEmPe2ftX9jrnYM8V7BEMpRXyIFHslsNIP/+Z0
	DfMXva99uokG5BwlFvMoRwHJPgwoR+/x7pJn4mONneE/kX+qI/+e1B3q
X-Gm-Gg: AYBFou0zzy+IVFi587yMJjeRotBkCkRN2krgHFM8jxJW7aSGRTyTyB/3vbbTs87RT6F
	MYzqjPG3m41iwUK1kvRTvGY3UspErl/Pj65Y0uZpRc+ChktgFgaGpDjzxyk3rurNkAMitT8pOjI
	paKxtPh4mmUEa6ug5LCsl4uOSsr0r2LKCDHs2VhRFUoFk5XKYHSQE99wmqfN3Nw9FbwWPMruRm4
	dUhlmOjxBBbsSqoC6115npRyuZhcwUrPRzxjlsBJJLbEPlA76IhrbKGeR4komMwnASw0puF8WMB
	czHXFGL5PJJt//v9MwU/w8B4iz0eE609ejwHIVdbx6iFJXmcjYKXGe7OrHepCyHVeiP1LkKR5oK
	W3cLZ2/ZLqTdXRkbKywinAbG5v5/cfwc1Z8AiD+5Wixt7dhJ8E1WjaDM/anpe6pcnQyGZ9yyY5y
	OZNVG/FfSOEqxrviwvxO/ochQlDZlMT9A52aCub+RenWKBlrdRcr2K/ZHV5ZUQSwnZcoGw2hrxv
	FtEcBpEVLaINoHp8sWEXOzQL4IQQidH+OlmnMOxffNN9U/gJwVKGIRmc4CNS2aLrSjFqIkJCWNN
	4A==
X-Received: by 2002:a17:907:96a1:b0:c46:75e7:25af with SMTP id a640c23a62f3a-c46bdd6feb2mr358195166b.11.1792883213773;
        Sat, 24 Oct 2026 16:06:53 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:46::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd5206dasm137287266b.33.2026.10.24.16.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 16:06:53 -0700 (PDT)
From: Sam Crossley <samuelcrossley@gmail.com>
Date: Sat, 24 Oct 2026 16:06:03 -0700
Subject: [PATCH RFC 1/2] printk: add per-console replay helper
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-netcons-replay-upstream-v1-1-9613f38496e5@gmail.com>
References: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
In-Reply-To: <20261024-netcons-replay-upstream-v1-0-9613f38496e5@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Petr Mladek <pmladek@suse.com>, John Ogness <john.ogness@linutronix.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paolo Abeni <pabeni@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, Sam Crossley <samuelcrossley@gmail.com>
X-Mailer: b4 0.16-dev

console_try_replay_all() rewinds every registered console, which is too
broad for a caller that needs to resend records through one console.

Add console_try_replay() for that, sharing the locking and flush logic so
existing callers are unaffected. A NULL console is rejected, since the
shared helper reads it as "every console".

Like the existing all-console operation this is best effort: it does
nothing if the console lock cannot be acquired immediately. That lock is
global, so unrelated console activity can cause a replay to be skipped.
Records have not necessarily been printed by the time it returns either --
consoles served by a printer thread are only woken here.

Signed-off-by: Sam Crossley <samuelcrossley@gmail.com>
---
 include/linux/printk.h |  6 +++++
 kernel/printk/printk.c | 67 +++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 56 insertions(+), 17 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266bfd4..9cd06a67e7c83 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -203,6 +203,7 @@ void show_regs_print_info(const char *log_lvl);
 extern asmlinkage void dump_stack_lvl(const char *log_lvl) __cold;
 extern asmlinkage void dump_stack(void) __cold;
 void printk_trigger_flush(void);
+void console_try_replay(struct console *con);
 void console_try_replay_all(void);
 void printk_legacy_allow_panic_sync(void);
 extern bool nbcon_device_try_acquire(struct console *con);
@@ -301,6 +302,11 @@ static inline void dump_stack(void)
 static inline void printk_trigger_flush(void)
 {
 }
+
+static inline void console_try_replay(struct console *con)
+{
+}
+
 static inline void console_try_replay_all(void)
 {
 }
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 9a205f94bfac7..59e6df8a57de2 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3494,13 +3494,14 @@ void console_unblank(void)
 }
 
 /*
- * Rewind all consoles to the oldest available record.
+ * Rewind a console, or all consoles if @target is NULL, to the oldest
+ * available record.
  *
  * IMPORTANT: The function is safe only when called under
  *            console_lock(). It is not enforced because
  *            it is used as a best effort in panic().
  */
-static void __console_rewind_all(void)
+static void __console_rewind(struct console *target)
 {
 	struct console *c;
 	short flags;
@@ -3511,6 +3512,9 @@ static void __console_rewind_all(void)
 
 	cookie = console_srcu_read_lock();
 	for_each_console_srcu(c) {
+		if (target && c != target)
+			continue;
+
 		flags = console_srcu_read_flags(c);
 
 		if (flags & CON_NBCON) {
@@ -3557,7 +3561,7 @@ void console_flush_on_panic(enum con_flush_mode mode)
 	console_may_schedule = 0;
 
 	if (mode == CONSOLE_REPLAY_ALL)
-		__console_rewind_all();
+		__console_rewind(NULL);
 
 	printk_get_console_flush_type(&ft);
 	if (ft.nbcon_atomic)
@@ -5047,6 +5051,48 @@ void kmsg_dump_rewind(struct kmsg_dump_iter *iter)
 }
 EXPORT_SYMBOL_GPL(kmsg_dump_rewind);
 
+static void __console_try_replay(struct console *con)
+{
+	struct console_flush_type ft;
+
+	printk_get_console_flush_type(&ft);
+	/*
+	 * The console lock is global, so the replay is silently skipped when
+	 * an unrelated console holds it. A trylock is what keeps this
+	 * callable from any context.
+	 */
+	if (!console_trylock())
+		return;
+
+	__console_rewind(con);
+	if (ft.nbcon_atomic)
+		nbcon_atomic_flush_pending();
+	if (ft.nbcon_offload)
+		nbcon_kthreads_wake();
+	if (ft.legacy_offload)
+		defer_console_output();
+	/* Consoles are flushed as part of console_unlock(). */
+	console_unlock();
+}
+
+/**
+ * console_try_replay - try to replay kernel log on a console
+ * @con: The console to replay the available records on
+ *
+ * Try to obtain the console lock and replay all available records in the
+ * printk buffer on @con. Does nothing if @con is not registered.
+ *
+ * Context: Any, except for NMI.
+ */
+void console_try_replay(struct console *con)
+{
+	if (WARN_ON_ONCE(!con))
+		return;
+
+	__console_try_replay(con);
+}
+EXPORT_SYMBOL_GPL(console_try_replay);
+
 /**
  * console_try_replay_all - try to replay kernel log on consoles
  *
@@ -5058,20 +5104,7 @@ EXPORT_SYMBOL_GPL(kmsg_dump_rewind);
  */
 void console_try_replay_all(void)
 {
-	struct console_flush_type ft;
-
-	printk_get_console_flush_type(&ft);
-	if (console_trylock()) {
-		__console_rewind_all();
-		if (ft.nbcon_atomic)
-			nbcon_atomic_flush_pending();
-		if (ft.nbcon_offload)
-			nbcon_kthreads_wake();
-		if (ft.legacy_offload)
-			defer_console_output();
-		/* Consoles are flushed as part of console_unlock(). */
-		console_unlock();
-	}
+	__console_try_replay(NULL);
 }
 #endif
 

-- 
2.53.0-Meta

