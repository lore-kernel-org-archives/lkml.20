Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD1341DDF0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155298; cv=none; b=rft9LxOrdwRZtTKt5gVT3J42Tauqgs2PNnIgQrhzqBRfjOg74wVNywCrAkcsoy2mQxSfviIsg/K75JeMVeHLG6fDaP201i1e8DWDDrPj46kh3lkxgVM/aNBiE1uVxNpPFdKlVu6q1oMt1DBKGhmazl5yGaOC8JW/P08BW8OqVS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155298; c=relaxed/simple;
	bh=O8EHRjoDlCUPx+LbUdYaNEZDq8LsdL7LV7bELfpfJa4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l/VKSCfFtGFvHN6Wgpdlz5a9lA2fT1Au2Rqem4UGfMYctMFxnLbvz6nitXp/uhPu7/OpZhYeZ5p/e2DkMdz+cRbavKjbZC3kEhqYadJ8Kdc5pv9LyJN0kL5hX6zY7QMjkg6CyqmqwKAKKyOZ6EqsZLKFDakwFESFN8x3M2RDMhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YxHVBxC3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O/Bg8KWo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YxHVBxC3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O/Bg8KWo"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792155294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JrGQsSQtYGPxXD0wiV1FdcPQWqzWe+qi8VeEQWcvOKg=;
	b=YxHVBxC3PTIAcHGk5o65KPT3OPu19p4j6tA+Ee7V3IM2f/TrdV69fJDg+vqUzU0hvNfQt0
	sFEyrc6nKXBYPbDqxDP8V4BYpGMC71kX1PpLt4eVrANZoMZpc+CJ465r0FFA3EkhJPO+iv
	zev6wHpEq16usWhpwrRQDmLW61Os3wrkzZlucBmAXzJ7LKxwvIP5mUZ0ZvfsaduA6UIL+I
	6mlrPo6WNMIRuTA9XoT+IpF8eygrO2Rz37rV4rT5D9esSQZOzw3X9cKMKG+a6FHAXcIXyH
	VKDnE24POWXXaZ82N3lrBlUXY2HS+u1RQc4CcL/RsKuQ7R03RJ2Nz5ACkMXNKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792155294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JrGQsSQtYGPxXD0wiV1FdcPQWqzWe+qi8VeEQWcvOKg=;
	b=O/Bg8KWofOwWeiOf6pd4dIHU38BrNg3gOOBRmoVIBl6VSc8xAbALbFQ/qhfko6a0P6l/h3
	LsSb8SufrUzWI5CQ==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt
 <rostedt@goodmis.org>, Derek Barbosa <debarbos@redhat.com>,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH printk v2] printk: Postpone kthread startup
In-Reply-To: <20261016085441.857695-1-john.ogness@linutronix.de>
References: <20261016085441.857695-1-john.ogness@linutronix.de>
Date: Fri, 16 Oct 2026 15:00:54 +0206
Message-ID: <87ik31iz4x.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On 2026-10-16, sashiko.dev wrote:
>> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
>> index 0ed86b5e8b160..9a205f94bfac7 100644
>> --- a/kernel/printk/printk.c
>> +++ b/kernel/printk/printk.c
>> @@ -3864,7 +3864,7 @@ static int __init printk_set_kthreads_ready(void)
>>
>>  	return 0;
>>  }
>> -early_initcall(printk_set_kthreads_ready);
>> +subsys_initcall(printk_set_kthreads_ready);
>
> Can this delay expose a regression where a use-after-free occurs
> during failure paths?
>
> If nbcon_kthread_create(con) fails, it calls
> unregister_console_locked(con).  This unregisters the console and
> recursively calls printk_kthreads_check_locked().
>
> The recursive call restarts iterating over console_list and may
> unregister subsequent consoles, including the tmp node held by the
> outer loop:
>
> kernel/printk/printk.c:printk_kthreads_check_locked() {
> 	hlist_for_each_entry_safe(con, tmp, &console_list, node) {
>		if (!(con->flags & CON_NBCON))
>			continue;
>
>		if (!nbcon_kthread_create(con))
>			unregister_console_locked(con);
>	}
> }
>
> kernel/printk/printk.c:unregister_console_locked() {
>	...
>	/* Changed console list, may require printer threads to start/stop. */
>	printk_kthreads_check_locked();
>	...
> }
>
> Because hlist_for_each_entry_safe relies on the tmp pointer, the outer
> loop will later process the already unregistered tmp console and call
> nbcon_kthread_create(tmp) on it.
>
> If this succeeds on the retry, it spawns a zombie kthread for a
> detached console. If the detached console is dynamically allocated and
> freed by its driver's exit routine, the kthread and the outer loop
> will dereference freed memory.
>
> Can the loop in printk_kthreads_check_locked() handle the recursive
> unregistration of the tmp pointer safely without resulting in a
> use-after-free?

The case Sashiko presents is possible (even if unlikely). I would not
associate it with this patch though. It is a pre-existing
condition. Probably the cleanest fix is to pull
printk_kthreads_check_locked() out of
unregister_console_locked(). Something like this:

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0ed86b5e8b160..0a87f49b3908a 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -4322,9 +4322,6 @@ static int unregister_console_locked(struct console *console)
 	if (console->exit)
 		res = console->exit(console);
 
-	/* Changed console list, may require printer threads to start/stop. */
-	printk_kthreads_check_locked();
-
 	return res;
 }
 
@@ -4333,7 +4330,12 @@ int unregister_console(struct console *console)
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
@@ -4471,6 +4473,9 @@ static int __init printk_late_init(void)
 		}
 
 		unregister_console_locked(con);
+
+		/* Changed console list, may require printer threads to start/stop. */
+		printk_kthreads_check_locked();
 	}
 	console_list_unlock();

I can submit an official patch after the 7.4 merge window.

John
