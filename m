Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368685;
	b=ofn8hR7mn1WizWGx3GoGuiKpQ+tdXpYyBhPbvUZPba5zDcW/viiK5O4F8p5iWcWtXm0h
	 xFlKkXl4pUCENaeq9hYwaTeqr8ESgRVfqH44jZiHjsg25yTZuyd2DcbHC0q9WB2E1xCmJ
	 eMdMeNl3F+9n58T3EB9Oxc7v2lTBMKgJ/lFUDGNWHUNIGmcFThmkdJIvLdnP09/mhoEwI
	 O+6hBs9ighdISmlcPez3fsRgBK4AD0z5/Tk/50eISQlu6VzfuSXE+spmqjIN2hGlkq/hi
	 tYZaeKq81aFe+ebQSPPPCtQL+3xwGyqhScDP1A/sl52HYzuG4rhzH5bZHEEO6mzM1AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368685;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding;
	bh=kEdtKFjfjrs6u0tdOBxpHnrmoGHrLQkf7eHyg54/lso=;
	b=SoRIQCAo3GEzAg7xGMmrxBwy0RvbFKOp09DaimcpLVNFNpqQeQbeBO7P5FmznrbdB+Dt
	 EdQxKnTiBRQse9VaAmtd43bex3qGTbsaQweRa238hhSlNbVuqkOCj+sPXPt6+UafsxZFJ
	 th5vIzpXaS3ukFHACZk0HWe5uQltspnC07imAmxaYBesoWcjfeTeE7WDWk3fONzMcOyyN
	 c58oVOTM8+zoApZI9xeirE4KP84tBCPmieM2Tqa2X3+uzylK9RoMdkDGfAo9AofPIVDls
	 xxd5bfjlpx5dkXN898kj5fdwAX/GU7VMJhWLillWkVBTKYI8oLVxlsOj6dAOr8gVKbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Noz+TIYd;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=04bz13Hg;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24256606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24256606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Noz+TIYd;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=04bz13Hg
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793368682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kEdtKFjfjrs6u0tdOBxpHnrmoGHrLQkf7eHyg54/lso=;
	b=Noz+TIYdPcNQAYb9WW8G24HP3zSPmZiN8Gm2cX1updNnOCXZMUlB3wmzYyb97ZQCPxudjr
	XpBLNJ/w/Va0IXksNMN9tKF6/wVeAsAn/iLfGdyIqhpPtgwGk7VeuOsKlAE9qHLqKU6XLm
	hkMb9nfFdTzl0lR1jMARU2i247J9wgv4FTNlEPk4jj65nnjr6cFdF8dPxlU/3/sUcbZeWD
	H9rUFDiBtREgSE+nYp45OweF/GwyfEIsmjjynBzTivvss4HzOGG9K9Uf+u5id8qzO4VYhn
	DhAqQapThg8+c+dwKKaXOrSYvoBKk/5EfFJZkli/cjaQH0gykkh/xVDa1zpgIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793368682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kEdtKFjfjrs6u0tdOBxpHnrmoGHrLQkf7eHyg54/lso=;
	b=04bz13Hg2tM9r7CWtofMzExkXSB5Xd+9++0W8qMI8RKuOn+NyqsrPb2agU4Opp9eW5l5gQ
	IR6ftrisSYALSwBQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Derek Barbosa <debarbos@redhat.com>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH printk v2] printk: Avoid multiple unregistration in unregister_console_locked()
Date: Fri, 30 Oct 2026 15:03:55 +0106
Message-ID: <20261030135802.663893-1-john.ogness@linutronix.de>
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
v1: https://lore.kernel.org/lkml/20261029152454.638952-1-john.ogness@linutronix.de

changes since v1:

- In printk_late_init(), move printk_kthreads_check_locked() outside of
  the hlist_for_each_entry_safe(console_list) loop.

 kernel/printk/printk.c | 34 ++++++++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 9a205f94bfac7..5dbcf8a9909bb 100644
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
@@ -4472,6 +4494,10 @@ static int __init printk_late_init(void)
 
 		unregister_console_locked(con);
 	}
+
+	/* Changed console list, may require printer threads to start/stop. */
+	printk_kthreads_check_locked();
+
 	console_list_unlock();
 
 	ret = cpuhp_setup_state_nocalls(CPUHP_PRINTK_DEAD, "printk:dead", NULL,

base-commit: 647ef123d19695b5d8c79e03c86fb17c558e30b7
-- 
2.47.3

