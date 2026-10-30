Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389691;
	b=dIZApQ9cFP4poVwXfBNVvD4140FgEbd6vivvmPWYzQVnLvfmywG0WPm52VwUtVBB3aPA
	 r0aCtznJndOROJ8NlPc0yEJHtKOMskjLQkFc2ni8Iqj+/ZOuUY5yIN9ZjcozmXswtTWzW
	 lutmtT1rxp1GWI457fVmpkZdbND2hE+I1BruiRyZM36j1HFh+Q0CxLYOLuaEo6hbkVofa
	 mohwkfv4eT+eBEDI2Upv74c6tT9GHE/BxxYOUdre2y+AUKAkUL7WFUxXVKnjmOsHo0Jqa
	 mvb6pUfwlOfyS+OCDeeTB/r9psvxrnzXaB/d/fslffPSkWPsHdFCX0YNlF0uKk9Zwtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389691;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Scanned-By;
	bh=HAGv6VW/lw4AQE+/a0S6+lE4SlVbr6F85axaXVII348=;
	b=truC8VaOR9V2W7A+VwklFRi0oRdN9IYdvs9dsF7MZUYN5dMRTR9p6RXH00Q+XqwKqUiF
	 5gRbWupwoFAUgqH8oztmwStyIg/Xhv5/BLvWtYqME9tDktVkXUyWJ1sJL8glogEAxdMDw
	 Jz5M54QFVrGYPBoomYRj7PZ+mz+OjRGcg77gSr0KTB0/4GcF0EsJG1HdNddva8juNvdQ3
	 tD5tHcvI5kOQ78UKXNMVaS6vd8rK99NXIOS7ER3Br+NzDQdCtimpkk9OBrH3NsE6oF374
	 29IPw7iGek/066L2d+c1GmfoNvQByRtkwIuPs5xUyihxiW0/VVctT6R6O1z/hw1u2vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gpxMVrZo;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9559A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9559A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gpxMVrZo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793389689;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=HAGv6VW/lw4AQE+/a0S6+lE4SlVbr6F85axaXVII348=;
	b=gpxMVrZoDkdADkMb2/8YVSCZ82uDQpWa0cTsxeQkKDLTlIweEcjA0hlCmRdU5UGtLHakOZ
	8hUERUzM+srJx1orWIE3LrNfDxYVZYknkkBl93bvNUkkeEIynf3El1MnV7BjSR8Yqn8v3+
	X1VmBZzOoUm+nd2M8sm4wLBdaBeP+OM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-546-wlnmTvnbMJeBhWJPu5EAyQ-1; Fri,
 30 Oct 2026 15:48:07 -0400
X-MC-Unique: wlnmTvnbMJeBhWJPu5EAyQ-1
X-Mimecast-MFC-AGG-ID: wlnmTvnbMJeBhWJPu5EAyQ_1793389686
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3460C180034C;
	Fri, 30 Oct 2026 19:48:06 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7F0E21800586;
	Fri, 30 Oct 2026 19:48:05 +0000 (UTC)
Date: Fri, 30 Oct 2026 15:48:04 -0400
From: Derek Barbosa <debarbos@redhat.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, printk@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH printk v2] printk: Avoid multiple unregistration in
 unregister_console_locked()
Message-ID: <auTu9B8HTScgX0nA@debarbos-thinkpadt14gen5.rmtusma.csb>
Reply-To: debarbos@redhat.com
References: <20261030135802.663893-1-john.ogness@linutronix.de>
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
In-Reply-To: <20261030135802.663893-1-john.ogness@linutronix.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Fri, Oct 30, 2026 at 03:03:55PM +0106, John Ogness wrote:
> unregister_console_locked() is called from within
> hlist_for_each_entry_safe(console_list) loops. This would be safe if
> unregister_console_locked() only unregistered the specified console. After
> all, that is what the _safe variant is for.
> 
> However, unregister_console_locked() calls printk_kthreads_check_locked(),
> which can unregister _multiple_ consoles if kthreads fail to start. This
> could lead to hlist_for_each_entry_safe() use-after-free scenarios because
> not only was the list entry removed, but possibly the following entry as
> well (the @n temporary storage of the next entry).
> 
> Move the call to printk_kthreads_check_locked() outside of
> unregister_console_locked(). Add comments to both functions to clarify
> if they are safe to be used in hlist_for_each_entry_safe(console_list)
> loops.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/lkml/87ik31iz4x.fsf@jogness.linutronix.de
> Fixes: 76f258bf3f2a ("printk: nbcon: Introduce printer kthreads")
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
> v1: https://lore.kernel.org/lkml/20261029152454.638952-1-john.ogness@linutronix.de
> 
> changes since v1:
> 
> - In printk_late_init(), move printk_kthreads_check_locked() outside of
>   the hlist_for_each_entry_safe(console_list) loop.
> 
>  kernel/printk/printk.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 9a205f94bfac7..5dbcf8a9909bb 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3792,6 +3792,13 @@ static struct syscore printk_syscore = {
>   * If appropriate, start nbcon kthreads and set @printk_kthreads_running.
>   * If any kthreads fail to start, those consoles are unregistered.
>   *
> + * Called after consoles are registered or unregistered.
> + *
> + * This MUST NOT be called within an hlist_for_each_entry_safe(console_list)
> + * loop because it can unregister multiple consoles if any kthreads fail to
> + * start. That would lead to use-after-free scenarios within the
> + * hlist_for_each_entry_safe(console_list) loop of the caller.
> + *
>   * Must be called under console_list_lock().
>   */
>  static void printk_kthreads_check_locked(void)
> @@ -4230,7 +4237,20 @@ void register_console(struct console *newcon)
>  }
>  EXPORT_SYMBOL(register_console);
>  
> -/* Must be called under console_list_lock(). */
> +/*
> + * Unregister the specified console.
> + *
> + * This can be called safely from within an
> + * hlist_for_each_entry_safe(console_list) loop because it unregisters
> + * _only_ the specified console.
> + *
> + * Afterwards the caller should call printk_kthreads_check_locked() since
> + * unregistering a console may require printer threads to start/stop. Note
> + * that printk_kthreads_check_locked() cannot be called safely from within
> + * an hlist_for_each_entry_safe(console_list) loop.
> + *
> + * Must be called under console_list_lock().
> + */
>  static int unregister_console_locked(struct console *console)
>  {
>  	bool use_device_lock = (console->flags & CON_NBCON) && console->write_atomic;
> @@ -4322,9 +4342,6 @@ static int unregister_console_locked(struct console *console)
>  	if (console->exit)
>  		res = console->exit(console);
>  
> -	/* Changed console list, may require printer threads to start/stop. */
> -	printk_kthreads_check_locked();
> -
>  	return res;
>  }
>  
> @@ -4333,7 +4350,12 @@ int unregister_console(struct console *console)
>  	int res;
>  
>  	console_list_lock();
> +
>  	res = unregister_console_locked(console);
> +
> +	/* Changed console list, may require printer threads to start/stop. */
> +	printk_kthreads_check_locked();
> +
>  	console_list_unlock();
>  	return res;
>  }
> @@ -4472,6 +4494,10 @@ static int __init printk_late_init(void)
>  
>  		unregister_console_locked(con);
>  	}
> +
> +	/* Changed console list, may require printer threads to start/stop. */
> +	printk_kthreads_check_locked();
> +
>  	console_list_unlock();
>  
>  	ret = cpuhp_setup_state_nocalls(CPUHP_PRINTK_DEAD, "printk:dead", NULL,
> 
> base-commit: 647ef123d19695b5d8c79e03c86fb17c558e30b7
> -- 
> 2.47.3
> 

Tested on an x86_64 machine with 16550 UART (console=ttyS0,115200) with patch
applied on top of commit:

d89e1d186ec9271bf78e62771779e9fc03bf0fc3 ("Merge tag 'fscrypt-for-linus' of
git://git.kernel.org/pub/scm/fs/fscrypt/linux")

Machine information:

    Dell PowerEdge R660

    Architecture:                x86_64
      CPU op-mode(s):            32-bit, 64-bit
      Address sizes:             52 bits physical, 57 bits virtual
      Byte Order:                Little Endian
    CPU(s):                      96
      On-line CPU(s) list:       0-95
    Vendor ID:                   GenuineIntel
      BIOS Vendor ID:            Intel
      Model name:                INTEL(R) XEON(R) GOLD 6542Y
        BIOS Model name:         INTEL(R) XEON(R) GOLD 6542Y  CPU @ 2.9GHz

Tested with qemu_kvm, console_blast, and printk_kthread tests. [0]

[0] https://gitlab.com/debarbos/printktorture

Tested-by: Derek Barbosa <debarbos@redhat.com>
-- 
Derek <debarbos@redhat.com>

