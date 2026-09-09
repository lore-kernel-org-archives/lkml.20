Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FB1496906
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947771; cv=none; b=daBsOnBBJz+mtXcOJOLtFSGpYj8G2psIJLv6g3ciEs1DtM33HopoG6t360XQqz803gJUotMMOtZAovURqQzkMmh1ocZE/FPN299tcBIFl2oZ6CJT3HHTpY2E8sB7VrvsWXVust+kQ+I9BJIwS05MPu+dKqisf5z8ZnTaXwQvW48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947771; c=relaxed/simple;
	bh=lUJ9L06590/2jdFCYXfF6JprQdpPxzATSh+yDDIS7is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mYD/4F/ptpTzs8u7JIE5Lh4TIGOmhtx1Fiil5MCyKWt78JIUAX5z8af6R5h+bgF27jQBybz5KRZUemlbCIpf/RGSmCgtg7AwpI05pqcAml9k0sa+liZD2wPfN6qbfG0D/ks/52kOslJmAlRIKM/caYOYACvrEA3c5sVe+KZh3CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZpSXxYg6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZpSXxYg6"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-485850cbac3so3666566f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 02:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788947768; x=1789552568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bOt85NqG6eLv2ewOn/5B93abH+tm1JdXRGsj802YkUU=;
        b=ZpSXxYg6P91r9wKM/pnbySGVBYWXS9yf2lXZcrJ0bqVhHfUiiYvduhssZlYpQdgdYJ
         L+8ENCjkiKbhbdjYDE0CQSjnvccvlCmN1aCKzxnAr19hAPHJNvrSwJWo4TPmCaQUf3ZQ
         ps4uECFRNCwDBMdNyV5Z85HTgToF16nSIXmcMze4QDmStcXGeRETzb0ynexyacsvJpzZ
         HNTyV5KvAJuceZVQGHnQkcNchaQhIPZ7KERVipiWaVHRjYA6RkOoKKx3ZxBFJyFvwwMy
         zzrVczEDNpkzjJ7emQnHWKKhVf+SxfWul3cxYErkIoot2W/FUPp+mEzkCVzlppDkIKqs
         D09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788947768; x=1789552568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bOt85NqG6eLv2ewOn/5B93abH+tm1JdXRGsj802YkUU=;
        b=TNsqDn2xbnzX5rtlA9bhXsgnlhmgJCBlu0XsujzYskA2fwcSlkQgM7tF0W7krCbQ6B
         ki9lwEvLwwVlC0PVK7IdVMuYVm26iu+KalbupLEDZwDCyUWjuGJDjJMzcp4+0ApAN69J
         H00aoOk+ZDzO3mU7W1yO+kS4iBZGTT8EN65qk72Q/wneZd6IxlubgN2hc1T9/IpYUAeX
         bXJgjx7sM/6cATz2WqO9AOwuI2hezt73OgvqqqWPbECgR4JCgJ0r8zxMQsgr6OFOsXQJ
         IQK7q/bkT/CXvSD7B3fm6c6w2rCJhBi54JV2fzy1Tr5Irh6cxEaEgVmQNH9FlGPpJzZf
         PkPQ==
X-Forwarded-Encrypted: i=1; AKwUvByNq//McNyp6qagt5zI0z85qNj6kgzOvG57EeIFtBdmjyALNk/yhrJ23wRhs9RhX6gWNvOfhMmfwyekQWo=@vger.kernel.org
X-Gm-Message-State: AFuF++l4whLBel6TyQPVVMT4Qt6neGM4jMREgo/7zv9lcRYFCkNEbQiA
	NqEniaHRycF2iB1vkh+MCbAToVij7DNGaRAhXp7mniyUesf51UvD9aAyAZDBWqVpiGo=
X-Gm-Gg: AYBFou0K8JutCLk9gAlLAhue0enshVLjeTOywhNWe9N/4zErDBhmxxpgFTG1mepWcX3
	4C6wQBrkzkf+wYOCp0RwjU7q7AQBunoyRgayRGyrFSrHjk2poWX72MdVI8LkcXEmSSzTHBJ8v8T
	PTYVnSp1TxQb6SqkgUu+Q31VZ3bBnGvb8jODRIgcruQ7TPYQlV3bTdiNRRuvXS0Xltff0amABt4
	7m2URCdcFYPb/mlpiz9fKlqRHD7pTG/cbBCpilXzuxxMo/Scn/Zl00bqqajmTWNOSjA7c6NEt+o
	iFfVzQVqAaN4BQgAiUzXQoxixUFsJY/XafZVrsoo1nhqkhTAILeZmeS+rj5lZqtY7Or9OhIs6sR
	9tviWWvftti85m02YGIA5P6fEXFVQiTbfTmtJiY4iuRoGYlGXm8fpEyli0cJX6S/dFJ0io1feET
	psX6IB9R7QJ0MXyRdnlWby8H4vBHY/wmxOKGHfT79g8byyblRa7G+3opG92cWjNvnE0o7pf+2C/
	mjAoX9N2BREdoBsyKx2Crs8PA==
X-Received: by 2002:a05:6000:2506:b0:485:9227:6bc8 with SMTP id ffacd0b85a97d-48592276c5dmr27126894f8f.24.1788947768082;
        Wed, 09 Sep 2026 02:56:08 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858bcefd59sm36726984f8f.19.2026.09.09.02.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 02:56:07 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:56:05 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aditya Chillara <aditya.chillara@oss.qualcomm.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] printk/stop_machine: Defer legacy console flushes
 while a CPU runs a stopper callback
Message-ID: <aqEtNaR0EI3fzTCx@pathway.suse.cz>
References: <20260827-defer-legacy-console-write-on-multi_cpu_stop-v1-0-3b9f6bb4679f@oss.qualcomm.com>
 <87o6emy69n.fsf@jogness.linutronix.de>
 <4aa6f4d0-20f9-490b-8625-f4af5ad0dbfe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4aa6f4d0-20f9-490b-8625-f4af5ad0dbfe@oss.qualcomm.com>

On Fri 2026-08-28 15:36:48, Aditya Chillara wrote:
> On 8/28/2026 2:24 PM, John Ogness wrote:
> > Hi Aditya,
> > 
> > On 2026-08-27, Aditya Chillara <aditya.chillara@oss.qualcomm.com> wrote:
> >> A device using a legacy UART console (console=ttyMSM0,115200n8) hit a
> >> watchdog bark/bite about 40 seconds after boot.
> >>
> >> stop_machine() (used here for kprobe text patching) stops every CPU by
> >> running multi_cpu_stop() on each of them, through the per-CPU
> >> "migration/%u" threads. These threads run at a higher priority than the
> >> msm_watchdog thread. At bite time, all eight CPUs were still spinning in
> >> multi_cpu_stop()'s MULTI_STOP_PREPARE state, where interrupts are left
> >> enabled.
> >>
> >> Heavy SELinux denial logging had built up a large backlog on the
> >> console. One CPU took an interrupt while spinning in MULTI_STOP_PREPARE.
> >> Handling it eventually led to a printk(), and because the console was a
> >> legacy console, that printk() synchronously drained the whole backlog
> >> over the slow UART. While the drain was still running, the watchdog bark
> >> interrupt hit the same CPU, found no recent pet, and escalated to a
> >> bite.
> >>
> >> The captured stack for that CPU, innermost frame first:
> >>
> >>   qcom_soc_set_wdt_bite
> >>   qcom_wdt_bark_handler
> >>   __handle_irq_event_percpu
> >>   handle_irq_event
> >>   handle_fasteoi_irq
> >>   generic_handle_domain_irq
> >>   gic_handle_irq
> >>   do_interrupt_handler
> >>   el1_interrupt
> >>   el1h_64_irq_handler
> >>   el1h_64_irq
> >>   console_flush_all
> >>   console_unlock
> >>   vprintk_emit
> >>   dev_vprintk_emit
> >>   dev_printk_emit
> >>   __dev_printk
> >>   _dev_err
> >>   btspi_sleep_timeout_handler
> >>   call_timer_fn
> >>   __run_timer_base
> >>   run_timer_softirq
> >>   handle_softirqs
> >>   __do_softirq
> >>   ____do_softirq
> >>   call_on_irq_stack
> >>   do_softirq_own_stack
> >>   __irq_exit_rcu
> >>   irq_exit_rcu
> >>   el1_interrupt
> >>   el1h_64_irq_handler
> >>   el1h_64_irq
> >>   multi_cpu_stop
> >>   cpu_stopper_thread
> >>   smpboot_thread_fn
> >>   kthread
> >>   ret_from_fork
> >>
> >> Every other CPU stayed parked in the rendezvous the whole time, since
> >> their stopper threads outrank msm_watchdog. Nothing could pet the
> >> watchdog until the drain finished.
> >>
> >> This was observed through multi_cpu_stop(), but the hazard is not
> >> specific to it. Every cpu stopper callback runs in stop_sched_class,
> >> above msm_watchdog and every other thread on the CPU, so a slow flush
> >> from any of them (including single-CPU callbacks such as the migration
> >> and task-migration stoppers) can starve the watchdog just as well. The
> >> fix therefore covers all stopper callbacks, not only multi_cpu_stop().
> >>
> >> Fix this by having the cpu stopper mark the CPU active while a callback
> >> runs, and having printk use that marker to defer legacy console flushes
> >> until the callback returns:
> >>
> >>   1/2 stop_machine: Track when a CPU executes a stopper callback
> >>
> >>       Add a per-CPU flag, set in the stopper dispatch path around the
> >>       callback, and an in_cpu_stop() accessor.
> >>
> >>   2/2 printk: Defer legacy console flushes while a CPU runs a stopper callback
> >>
> >>       Route legacy console output through the offload path instead of
> >>       flushing it directly while a CPU is inside a stopper callback, and
> >>       flush it once the callback returns. Emergency and panic output is
> >>       unaffected.
> >>
> >> Reproduced and verified with an out-of-tree test module that triggers
> >> stop_machine() with a queued console backlog and a printk() inside the
> >> rendezvous, paired with a kprobe-based script that flags any console
> >> flush happening while a CPU is inside a stopper callback.
> > 
> > Generally speaking, we are not taking the whack-a-mole approach to
> > workaround all the known legacy console problems (there are a lot of
> > them!). However, if there are problems that occur during normal usage
> > (as opposed to crafted tests), then we can insert workarounds.
> > 
> > For workarounds of known legacy console problems we have the deferred
> > enter/exit functions. These only affect legacy consoles and literally
> > exist for these purposes. I would expect the following patch would also
> > solve your problem.
> 
> Yes, this fixes the issue.
> 
> > 
> > John Ogness
> > 
> > diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
> > index d085ba1f4b44e..31f7af41249f1 100644
> > --- a/kernel/stop_machine.c
> > +++ b/kernel/stop_machine.c
> > @@ -507,7 +507,9 @@ static void cpu_stopper_thread(unsigned int cpu)
> >  		stopper->caller = work->caller;
> >  		stopper->fn = fn;
> >  		preempt_count_inc();
> > +		printk_deferred_enter();
> >  		ret = fn(arg);
> > +		printk_deferred_exit();
> >  		if (done) {
> >  			if (ret)
> >  				done->ret = ret;
> 
> Tested-by: Aditya Chillara <aditya.chillara@oss.qualcomm.com>

John, are you going to send it as a proper patch, please?
Or would you prefer Aditya to do it?

Best Regards,
Petr
