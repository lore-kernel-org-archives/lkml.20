Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A04D46EF77
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771733; cv=none; b=PJQpJfl0ZVxb1dh7U9BMyjax8tK6DDbD//02H2rKhGiVUlfCRNtiQztQCKceGZdqLBPYhAix1TlaKloGSWDs7Wi4nw5H8JcP5ID2PD5sj5K7S5VsAZngAs9TGqrXW7Oq0Jn33Wmf9EFvLQAaPDCGTJCLUmqWQCig547+XPrNKEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771733; c=relaxed/simple;
	bh=4huWralsfV4AfbjtuhCg2J03M9q36P2FjKzM3w6FbF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqY/42APDWTg2+gX8rvubjYUJIvNboLAdZiT0dsi5Ytk8z5nuBhAGp02SnBKvuo4ZR/rUF2x3fbGWTn+3x07NqD9pIIpzqT8tVW3HSxkCIe/ICYva4fVsVvfHBQNJI9q7IjGmXlVqxHDAjpN5PwVlyGslv544Ox0nm0Jl5srkZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XaUKpHQF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaUKpHQF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D5561F000FF;
	Wed, 30 Sep 2026 12:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790771730;
	bh=IeIToCYRBjKqb/V7kHKJdVR7NGJpP5rLkdkyZOqFo1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XaUKpHQFULlLLcW7jRBEoGTq1rIzt1kZ8ff90LmPrrr8jXpgiXecZx3RzmKh/xRwS
	 aZzi7DYYb94zZBQ1SKqRf4Rvc7Ea8Ny+r6by/vZCe7WXmy2mumwKHTkReWYU553IaS
	 pmRBl4RXX+VzjsUHcdgybqZEI+bJd2X1/yqyfnniU0Xlu4oFHe3d10wyoX1m7mte6K
	 6PMEa4BAsHqOM8vUCVDE4A0DjsoYPZJz3Y3Gp4svGytXrWRzQfmLcD4jgxpn86wZWI
	 0nefPEfRNl3zNiaxVySb/t9PH5YU8E+lbgZXwiSgZdq2TpcviIL5izya6uQ0QbPPup
	 SjCIrPJIuCIiA==
Date: Wed, 30 Sep 2026 14:35:27 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Ahmed Shaltout <ahmedshaltout.payment@gmail.com>
Cc: tglx@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] /proc/stat idle time exceeds wall clock since v7.2
Message-ID: <ar0CD5n8yhJ2V1R_@localhost.localdomain>
References: <E76BE609-83E4-4FB6-88B8-191F7816EFD6@gmail.com>
 <arJ6NjfdHUPjN2Kc@localhost.localdomain>
 <CAORRHKj1EUum3O6ToGek0A-tuUf7HsCUwFHiXUc+53ZLKOrSFw@mail.gmail.com>
 <arvCJzz35oBW3AjY@localhost.localdomain>
 <CAORRHKi+LauVxEaKopniK361qE18rV6j-3zdpKENvCWkRaE-HA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAORRHKi+LauVxEaKopniK361qE18rV6j-3zdpKENvCWkRaE-HA@mail.gmail.com>

Le Wed, Sep 30, 2026 at 08:58:50AM +0400, Ahmed Shaltout a écrit :
> Hi Frederic,
> 
> 
> Le Tue, Sep 29, 2026, Frederic Weisbecker a écrit :
> 
> > I ran on KVM too, overcommiting the vcpus like you did (16 vCPUs on 8
> CPUs)
> 
> > and still nothing wrong.
> 
> >
> 
> > I'm wondering if this is specific to opensuse somehow. Can you try to
> build
> 
> > the latest upstream kernel?
> 
> 
> I will, but first one difference that may explain why your guest stays
> 
> clean, and a hypothesis that fits our numbers.
> 
> 
> Attached again is the 7.2.5 config, plus the 7.1.8 config from the control
> 
> box. Both are the stock openSUSE kernel-default files from /boot,
> unmodified.
> 
> Among the scheduler, tick, idle, accounting, preemption and RCU options they
> 
> differ only in CONFIG_SCHED_CACHE=y (7.2.5). All seven affected nodes run a
> 
> byte-identical config. None of the openSUSE-specific patches on top of
> 
> upstream stable touch tick, cputime, nohz, cpuidle or /proc. Going by their
> 
> names, they cover lockdown/secure boot, kABI, a few drivers and packaging.
> 
> 
> 1. There is no cpuidle driver on these guests
> 
> ---------------------------------------------
> 
> 
> On every node, affected or not:
> 
> 
>   /sys/devices/system/cpu/cpuidle/current_driver    none
> 
>   /sys/devices/system/cpu/cpuidle/current_governor  menu
> 
>   /sys/devices/system/cpu/cpu0/cpuidle/             no state* entries
> 
> 
> So cpuidle_idle_call() takes the cpuidle_not_available() branch and calls
> 
> idle_call_stop_or_retain_tick(got_tick). On the first pass through the idle
> 
> loop the tick is retained, and it is stopped only after a tick has fired in
> 
> idle. What does your guest report there? If a driver's governor stops the
> 
> tick at idle entry, that could be the difference.

I have the same cpuidle configuration: menu with no drivers.

> 2. Hypothesis: the tick after a dyntick-idle window re-counts part of it
> 
> ------------------------------------------------------------------------
> 
> 
> This comes from reading v7.2, not from a test. Take the case with no cpuidle
> 
> driver:
> 
> 
>   - The retained idle tick is charged to CPUTIME_IDLE by
> 
>     account_process_tick(), since kcpustat_idle_dyntick() is still false.
> 
>     Its irq exit sets ts->idle_entrytime. The window then opens there via
> 
>     kcpustat_dyntick_start(ts->idle_entrytime), so the start is seamless.
> 
> 
>   - On wakeup, tick_nohz_idle_exit() closes the window at "now"
> 
>     (kcpustat_dyntick_stop). tick_nohz_restart() re-arms the tick at the
> 
>     next jiffy boundary. That first tick charges a full TICK_NSEC, although
> 
>     the part of that jiffy before "now" is already in the window.
> 
> 
>   - The over-count is the wakeup's phase within its jiffy, once per
> 
>     window. Up to v7.1, /proc/stat read get_cpu_idle_time_us() for online
> 
>     CPUs and ignored tick-charged idle, so the two never met in one counter.
> 
> 
>   - When a governor stops the tick at idle entry instead, the window starts
> 
>     mid-jiffy. The fragment between the last tick and idle entry is then
> 
>     never charged, which would roughly offset the end seam on average. That
> 
>     might be why your guest looks right.

IIRC it seldom stops the tick at idle entry because it needs to wait for one
jiffy if this is a not short period.

> I have not verified this on a patched kernel, so please treat it as a lead
> 
> only.

Ok it's possible but why then do you reliably observe an excess when I never do?
 
> 3. Measurements, 60 s windows taken today on each node
> 
> -------------------------------------------------------
> 
> 
> These are the per-CPU cpuN lines of /proc/stat against /proc/uptime's first
> 
> field, and .idle_sleeps from /proc/timer_list over the same window.
> 
> "sum/wall" is all eight modes divided by uptime x nr_cpus.
> 
> 
>   node         cpus kernel  sum/wall  excess ms/s/cpu  sleeps/s/cpu
> ms/sleep
> 
>   cp-fsn1        8  7.2.5    1.100        100              351        0.285
> 
>   cp-nbg1-pps    8  7.2.5    1.080         80              268        0.299
> 
>   cp-nbg1-waa    8  7.2.5    1.072         74              245        0.301
> 
>   cp-hel1        8  7.2.5    1.081         83              278        0.297
> 
>   cp-hel1-b      8  7.2.5    1.076         76              255        0.298
> 
>   worker-fsn1    8  7.2.5    1.063         58              200        0.292
> 
>   monitoring     4  7.2.5    1.093         95              282        0.338
> 
>   staging        8  7.1.8    0.985        -14              263          -
> 
> 
> - Across nodes the excess tracks the tick-stop rate at about 0.3 ms per
> 
>   .idle_sleeps event. Within one node it does not: a CPU with twice the
> 
>   sleeps shows the same excess. .idle_sleeps is incremented on every
> 
>   __tick_nohz_idle_stop_tick() call, including re-stops after an IRQ inside
> 
>   an already-stopped idle period. So it overstates the number of windows on
> 
>   IRQ-heavy CPUs. These guests stop the tick 200-350 times/s per CPU. A
> 
>   near-idle test guest would show much less.
> 
> 
> - /proc/stat idle and /proc/uptime idle still agree to within 0.02 s on
> 
>   every node, over the same window.
> 
> 
> - The seven affected nodes were on older kernels on the same VMs until
> 
>   19 Sept: five on 7.1.8 and two on 7.0.12. Their daily all-mode sum read
> 
>   0.979-0.993 of wall clock. Since rebooting into 7.2.5 it reads 1.04-1.10.
> 
> 
> 4. Corrections to my previous mail
> 
> ----------------------------------
> 
> 
> - Not every node is AMD EPYC-Rome. cp-hel1 reports "Intel Xeon Processor
> 
>   (Skylake, IBRS, no TSX)" and shows the same excess (1.081), so it is not
> 
>   vendor-specific. All nodes are the same Hetzner cx43 VM type, except the
> 
>   4-vCPU one (cx33).
> 
> 
> - cp-hel1 is tainted W, from a boot-time "CPA detected W^X violation"
> 
>   warning in __change_page_attr. The other six are untainted and show the
> 
>   same excess.
> 
> 
> - I wrote that 7.1.8 sums to 0.992-0.997 of the ceiling. Over the last
> 
>   three days it is 0.983-0.985, so 7.1.8 slightly under-counts rather than
> 
>   matching wall clock exactly.
> 
> 
> If the cpuidle difference does not let you reproduce it, I will boot
> 
> openSUSE's kernel-vanilla (Kernel:HEAD, currently 7.3-rc5, no distro
> patches)
> 
> on a VM of the same type, with 7.2.5 and 7.1.8 on the same VM as controls,
> 
> and send the three results.

Yes please! Thanks a lot!

-- 
Frederic Weisbecker
SUSE Labs
