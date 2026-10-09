Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBBE483814
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536889; cv=none; b=n20ak2Vs2UF2v/pdZkUQgdLFLN4HxJHbgOIx9rziTOIZo9lzukemyZfgEplbxRNT+SEjlpEI28HoxPdkemvnle3XtRmWSlQimKPPQxfPZRs1pPpwzRsE3AfyXwmf70To8cspCv/eQJJctMCxWtFFRxNWUZX48ofGrie1OuRwr1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536889; c=relaxed/simple;
	bh=uk0elzQS6aEHDqwpozLvtile1CgZAFMOdGyMhqru6p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nw+WSrgvMxXrqBXY/DzdHqZ/cKWx1ELVOBfudTPL5+RKcmKhLNKialeXPdOfvGuEpWGXI4sNj5u7J9RrQ5xu3RNgwpfZnnQSwI55ZhCASWVxli2tIUGh8+gHDQ3hIfV37hfw5Q0TYU3VsMwp02LMndnB9mP9vj7InDGPn/CAJsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LILy1ZRg; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LILy1ZRg"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso1154825f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791536885; x=1792141685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bl2cLmiuxOzi+05coo7dR8aiO+wStMo8Oq/b6vZtrGQ=;
        b=LILy1ZRgQXCA0AKwtPcSGG3LpYakaGkq3OUp5BWiEfCH5GcY9N6oB/OdWuPfUZnz45
         QTUJL/f33DBCdC3KwdYQ5aN2XPqTmYboSvJePoIZuMN8Hyl3iiy/NwG1imlB9yhs1KcV
         ZmgxMKPwBeWsE4eiBCfNZ3yxzQUK+Oj/V80P+a/Kxo31feJs8JWdrmXJtvIMwyJa1+QL
         btkhKy/Km9OYGfHRln4TDn7YF8wjZYSEIyfvmZ7lZkZVZ1A0stBset+rvAJ/RdK3oDsY
         qPeR96j7xwnLcacGXC6dmTlrJ80M67bLf1hZlYxWViEpgnZRt12vTV9D+sZwvN6HVML+
         mo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791536885; x=1792141685;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bl2cLmiuxOzi+05coo7dR8aiO+wStMo8Oq/b6vZtrGQ=;
        b=ilhTj0kYIilZsIL5kq6c6Xz83wYKSJlllGXlvRqC5Ua6Faf3Znt8kr4qncU54v27AG
         Zqtj+uQTCYy0JOu098U5IDdtXosnMZBJvBFgp7J2twSRb7Quxo5xIZTwgVmgvhj0s9Bs
         1xTj7Oah+bha8PskW0odw2UalxY6x3Iigf82IpdtvzESp7CAvPqcNgAHCEpKSyyifteM
         6Iom0Gh3xdKuBONGucyKhZwDRx+Qpu/NPZVjkV2RpfiAVRZE4UIzJKV8yY8mBOWIdW6M
         kKPLDBVCSGUAu8Lzlsm7eusS0OJVl/uCNyPy9uLtY8UxJ5wFZxkIKTwtRsbV/yZ9uoRR
         TGnA==
X-Forwarded-Encrypted: i=1; AKwUvBzlTwA2pdl2bUxt7yHdovTcny8TUM80SXVgOZI1qHjCNhvSB3i/nsWqK56ANL+cqWYebCBVZdV11Oyh3RI=@vger.kernel.org
X-Gm-Message-State: AFuF++kTvrFh8XiTozieBjmhEurGc+9qLtJd6uIeclU03VO9up5W00ih
	i3OBiSd4d86VsPSOVKurILP14A4sz8xg29yJvd8vrDvXVev1GgDCwHsI562Qzb4KsiM=
X-Gm-Gg: AYBFou2F4o+aSBpqv1FOtuWOFTL3CNzWIPdTv6IDLWVlyAkDQTJM7Rkh0fwwRPPPugm
	Lke8PeF2GXUgku9Kdh1CXJXeYySbvFnrLT6GTLFo6sfguLXykRZw6GZ8TTH6jXim7gRmSS3RJBq
	xY4n1SzxbCUUMBf16AWakt7VEhKsPqwoOuav1q2HaQZ08RoMMRebkj0aSDTf4F5JABRM/VNKfJQ
	bjZRBcmrMYxCCbWtOLFWprdxXHw7YlrmW3MJtPxSXCK+PJOm0lZCGTqiuUWK6MD3opHDt+AxlwS
	TPyVT4FVEY/qBpIgiT747vobXBrGZqC8fxsAQrz9XMbnAEc4e+9BZ2+mRGZd4CgbPSoooFYQDE5
	qg5uxF0ggixlUrxEY0tn/VKuQbn51BXxXWg18iLhPcZhc27vKKTSBv26B7PxdagfOlHpOC0ZNJN
	l4jdatXdRznHxwUNkfxkt0n5q2bpWZvkP4TMT8r87qj8Nu3FwCxaknvAYBqBv9Fp5H2WLMGX1r
X-Received: by 2002:a05:600c:3c89:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a18e49105cmr18363015e9.7.1791536884998;
        Fri, 09 Oct 2026 02:08:04 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4a3b4asm66087725e9.5.2026.10.09.02.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:08:04 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:08:02 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-serial@vger.kernel.org, oliver.sang@intel.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nbcon/reboot: Flush nbcon consoles synchronously on
 reboot
Message-ID: <asiu8orjDvRJMKuX@pathway.suse.cz>
References: <20261008150852.8286-1-pmladek@suse.com>
 <20261009065152.udyfFRHx@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009065152.udyfFRHx@linutronix.de>

On Fri 2026-10-09 08:51:52, Sebastian Andrzej Siewior wrote:
> On 2026-10-08 17:08:52 [+0200], Petr Mladek wrote:
> > NBCON consoles emit messages in a dedicated kthreads when the system
> > is working properly. printk() tries to flush them synchronously in
> > explicitly marked emergency context and in panic().
> > 
> > Another situation where printk() could not rely on kthreads are the various
> > reboot and halt code paths. They can be detected by the `system_state`
> > variable.
> > 
> > Let's default to NBCON_PRIO_EMERGENCY for the post-running states.
> > printk() will automatically try flushing the consoles synchronously.
> > Also do not rely on printk() and explicitly flush the consoles
> > after these states are set.
> 
> while this seems okay, didn't we have pr_flush() to flush the output on
> shutdown/ reboot?

Good point! We should clean this up.

Anyway, IMHO, we should switch to NBCON_PRIO_EMERGENCY for the post-running
states and flush the pending messages immediately. It is more
reliable. It is easy to find the locations when system_state() is set.
And all follow-up printk() calls will try the direct flush so that
they won't rely on an explicit flush.

An ideal solution would be to add an wrapper, e.g.

	void set_syste_state(enum system_states state)
	{
		system_state = state;

		if (system_state > SYSTEM_RUNNING)
			pr_flush(0, true);
	}


Another thing is that printk_trigger_flush() is an overkill.
It tries to wake kthreads even via irq_work but we are
interested only in the direct flush.

I am not sure why neither me nor John used pr_flush().
It might be because it originally did not flush atomic consoles
directly. At least I had an outdated mental map.

Also the timeout should not be needed because all consoles should
be flushed directly. But it can be solved by using zero timeout.

In fact, we should block the kthreads to prevent seeing more
incomplete/interrupted messages, see the commit c41c0ebfa1e0eb
("printk/nbcon: Block printk kthreads when any CPU is in an emergency
context"). Something like:

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index d8f8ec836eea..1c21c1e65b00 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1187,13 +1187,14 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
 		return true;
 
 	/*
-	 * Block the kthread when the system is in an emergency or panic mode.
-	 * It increases the chance that these contexts would be able to show
-	 * the messages directly. And it reduces the risk of interrupted writes
-	 * where the context with a higher priority takes over the nbcon console
-	 * ownership in the middle of a message.
+	 * Block the kthread when the system is in an emergency, going down,
+	 * or panic mode. It increases the chance that these contexts would
+	 * be able to show the messages directly. And it reduces the risk of
+	 * interrupted writes where the context with a higher priority takes
+	 * over the nbcon console ownership in the middle of a message.
 	 */
 	if (unlikely(atomic_read(&nbcon_cpu_emergency_cnt)) ||
+	    unlikely(system_state > SYSTEM_RUNNING) ||
 	    unlikely(panic_in_progress()))
 		return false;
 
@@ -1249,10 +1250,12 @@ static int nbcon_kthread_func(void *__console)
 			return 0;
 
 		/*
-		 * Block the kthread when the system is in an emergency or panic
-		 * mode. See nbcon_kthread_should_wakeup() for more details.
+		 * Block the kthread when the system is in an emergency, going
+		 * down, or panic mode. See nbcon_kthread_should_wakeup() for
+		 * more details.
 		 */
 		if (unlikely(atomic_read(&nbcon_cpu_emergency_cnt)) ||
+		    unlikely(system_state > SYSTEM_RUNNING) ||
 		    unlikely(panic_in_progress()))
 			goto wait_for_event;
 

But wait, this might cause regression on netconsole which sets
CON_NBCON_ATOMIC_UNSAFE and is not able to flush the messages
directly a safe way.

A possibility would be to use con->write_thread() when pr_flush()
is called in task context. It should be safe in most shutdown
code paths except for the emergency_restart().

And we need an explicit pr_flush() even later in the halt
and maybe even some unsafe flush later in emergency_restart()
code path.

Sigh, this is getting complicated.

Best Regards,
Petr
