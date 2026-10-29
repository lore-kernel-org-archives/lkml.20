Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287503;
	b=x0r2nY60qUZJm5JrBZUaOSJowC0cDYDez1J9UcDzB0UnoIZLy+wSg7IZHnmToOxDDPVS
	 zhTseuJzg5SohJGJnUyIHbX976IzAXMZ5HC1VBcJscilQ+wMFUvpx0INcpzttVvMwZ7I3
	 AKdelvhWjupw3Tk5dZUxTpg3JeeiujADtIIujOhERdqv2G6sr8CtADiImzFPZnLuoXbff
	 CLJ4z7/yo8Ua4lyF9R5AVEfz7LUR1/qWU+Lgd3paiWhzTXrNLH2wMfjFjcX+efUcueTnF
	 nVrsE9S9bq+4Oel7G/QQVxrfCA8T/g000WcUXkAvr7PGiMMO1YlVD989fa+MmtsuNPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287503;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=WfkhECj8RpgIEg1mAdJFBYesIxj92sswKXixF226hyk=;
	b=PRDC3SwvXWezPk43dQn6kRPkYcS+Jrcbey5g5JUxJlpTNnE0j2SZ7SBw5yP2BhLAmcEj
	 K1QBfcwv6wlufob6jJ0OaocBvo3hFbuo0eT5HCfHp7oAI47IGEyXfd8OczDTOesndt1jC
	 /MT/j7s68KkOmBCl9b/I9I6cftwCsP+zW9r3hT+UVvyJs8L140MelKZKrQOrcmjp5loAv
	 CkuHGvjmix68U15bKGsLqj6nHiIWm2k+WQIsRvZ2BjcOF4xnOHwqPnRcyQP0DVtCop6jm
	 SlaIagYu8thanChNbghuFEXpmvbuuh8eZY56LjzlGVeZ8eEwd2Hy61LSAr/t12wYMKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="EP/6jJOI";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aJGrNqKX;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFF8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDFF8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EP/6jJOI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aJGrNqKX
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793287495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WfkhECj8RpgIEg1mAdJFBYesIxj92sswKXixF226hyk=;
	b=EP/6jJOIHkbgwa0pWPpBWJkCik1ObkwXyQKppiryZ7VuWedra6pTgiD2B3SlYi/qMfnJIS
	hNvz+yqEFFkhzU3Z4GdFtUeVGoH2TWTlS3mp9afaTIZF50gfXGLxPfKf3yRNqwkMS1jcZP
	QjMoiZDBWzADujJrl9jImFhP7OGS+mSJlM1Jh3Eqnmn1O/oOkjD/ZDM1bDEIi3eDEdioVK
	b8Dlz1721fQGI2AQJzGLBRnMOYUuC+E9N8hrmIDsFr/7+sGjm/QQVz12AbcSnOZtFAsw6+
	/hZ7dQHo9u84zdoy7YLm9QCjCa4+0kis/0o3Q/wZ5Wl0YlAEg8AjXXmMntwpeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793287495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WfkhECj8RpgIEg1mAdJFBYesIxj92sswKXixF226hyk=;
	b=aJGrNqKXp5qsKClPzoQh1FOehcWEJApRzSGriT4INAQAhNpyOShuHmP41IV8AXH29KMT6A
	gmzgPG59yVCHRSDg==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Derek Barbosa <debarbos@redhat.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH printk] printk: Avoid multiple unregistration in unregister_console_locked()
Date: Thu, 29 Oct 2026 16:30:44 +0106
Message-ID: <20261029152454.638952-1-john.ogness@linutronix.de>
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

unregister_console_locked() is called from within
hlist_for_each_entry_safe(console_list) loops. This would be safe if
unregister_console_locked() only unregistered the specified console. After
all, that is what the _safe variant is for.

However, unregister_console_locked() calls printk_kthreads_check_locked(),
which can unregister _multiple_ consoles if kthreads fail to start. This
could lead to hlist_for_each_entry_safe() use-after-free scenarios because
not only was the list entry removed, but possibly the following entry as
well (the @n temporary storage of the next entry).

Move the call to printk_kthreads_check_locked() outside of
unregister_console_locked(). Add comments to both functions to clarify
if they are safe to be used in hlist_for_each_entry_safe(console_list)
loops.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/lkml/87ik31iz4x.fsf@jogness.linutronix.de
Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/printk/printk.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 9a205f94bfac7..d7763a7269918 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3792,6 +3792,13 @@ static struct syscore printk_syscore = {
  * If appropriate, start nbcon kthreads and set @printk_kthreads_running.
  * If any kthreads fail to start, those consoles are unregistered.
  *
+ * Called after consoles are registered or unregistered.
+ *
+ * This MUST NOT be called within an hlist_for_each_entry_safe(console_list)
+ * loop because it can unregister multiple consoles if any kthreads fail to
+ * start. That would lead to use-after-free scenarios within the
+ * hlist_for_each_entry_safe(console_list) loop of the caller.
+ *
  * Must be called under console_list_lock().
  */
 static void printk_kthreads_check_locked(void)
@@ -4230,7 +4237,20 @@ void register_console(struct console *newcon)
 }
 EXPORT_SYMBOL(register_console);
 
-/* Must be called under console_list_lock(). */
+/*
+ * Unregister the specified console.
+ *
+ * This can be called safely from within an
+ * hlist_for_each_entry_safe(console_list) loop because it unregisters
+ * _only_ the specified console.
+ *
+ * Afterwards the caller should call printk_kthreads_check_locked() since
+ * unregistering a console may require printer threads to start/stop. Note
+ * that printk_kthreads_check_locked() cannot be called safely from within
+ * an hlist_for_each_entry_safe(console_list) loop.
+ *
+ * Must be called under console_list_lock().
+ */
 static int unregister_console_locked(struct console *console)
 {
 	bool use_device_lock = (console->flags & CON_NBCON) && console->write_atomic;
@@ -4322,9 +4342,6 @@ static int unregister_console_locked(struct console *console)
 	if (console->exit)
 		res = console->exit(console);
 
-	/* Changed console list, may require printer threads to start/stop. */
-	printk_kthreads_check_locked();
-
 	return res;
 }
 
@@ -4333,7 +4350,12 @@ int unregister_console(struct console *console)
 	int res;
 
 	console_list_lock();
+
 	res = unregister_console_locked(console);
+
+	/* Changed console list, may require printer threads to start/stop. */
+	printk_kthreads_check_locked();
+
 	console_list_unlock();
 	return res;
 }
@@ -4471,6 +4493,9 @@ static int __init printk_late_init(void)
 		}
 
 		unregister_console_locked(con);
+
+		/* Changed console list, may require printer threads to start/stop. */
+		printk_kthreads_check_locked();
 	}
 	console_list_unlock();
 

base-commit: 647ef123d19695b5d8c79e03c86fb17c558e30b7
-- 
2.47.3

