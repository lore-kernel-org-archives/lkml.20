Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12701559CAB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957423; cv=none; b=dMubTZS+fgsiEtTm35frELeIa7MgwHxLms0J3Cw2xB/chOfaPWP75sL1kr7X8ww0XWWB+5Z5rTHeqIFeWUQ5wZO+i9JQONuipScLrbN61GU22d1SZKDrVmdUAjoLpdGMBRiV1sCTT9aTHITYkp2pqgsPAAtGXxuUEYVltZxF7hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957423; c=relaxed/simple;
	bh=hzkyidTZn0frPGQyURwsWDb22YJiSdj3NnXQtBPy6gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GvCKfNs6XzctTwRM3lQ3DsgoFBxvf1w23eD937QS0+70o9zEdoBO9JCszfJ3ishJ99B3+LddwwWXTTY+HDgcfrXLTc2jfTYH0dJYkmCkJI5nqySSWmOjXIOAvmJLEhol+/N2hQ7vXEtU+1TG9+N3AwvyDsOqEwC2sO1b4Iu43Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4/1pmTA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4/1pmTA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F2F1F00A3A;
	Wed,  9 Sep 2026 12:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788957421;
	bh=KbGwZADL5Y87oVCXzEkLYxGUDy1vvUC8dlGfMGpBVDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S4/1pmTA5TeeJmbyHhM3d6gQdjVAJmfXI+A6HeJrf+afK7asfVmvlItVWZEFGDBQg
	 71eUFp6E0mq0/e1RMn2MgswsOK5xn0rrxmzaSRZasThhE2d6/hK8gdHc4/mqo4jwjY
	 5Gtw0m/xY9mu5COxp4wtvTKdk6Q6OCz9RSNjzmyMoj2uxIJ+n0g3rDkykvUI7YbpIA
	 IbPfM5rQghACN+rECUcOzXzw2jwAjOBp3xlRGkUGu1o0x6E07SFnKuoctsGqtIEsel
	 oPbtusK8tUXl6ORQd9Bj/1jze3/5eigC6uGb3nz9w6iLm/En1mhwJEZF4kagb+YDof
	 5tjONB8OAYbjA==
Date: Wed, 9 Sep 2026 13:36:55 +0100
From: Will Deacon <will@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 09/19] arm64: smp: Defer RCU registration during
 secondary CPU bringup
Message-ID: <aqFS58mJ4GJNrbZ2@willie-the-truck>
References: <20260907164024.17164-1-will@kernel.org>
 <20260907164024.17164-10-will@kernel.org>
 <45c37592-f05d-4b1c-812b-0cb38d1c3e24@huawei.com>
 <ap_hR1mntzm-TZOP@willie-the-truck>
 <f01fc59e-5254-484d-adf9-8dd1c2e58d91@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f01fc59e-5254-484d-adf9-8dd1c2e58d91@huawei.com>

On Tue, Sep 08, 2026 at 07:25:54PM +0800, Jinjie Ruan wrote:
> 在 2026/9/8 18:19, Will Deacon 写道:
> > On Tue, Sep 08, 2026 at 04:55:36PM +0800, Jinjie Ruan wrote:
> >> I think we need to handle the printk problem before this patch as we
> >> discussed earlier.
> >>
> >> Otherwise defer the rcutree_report_cpu_starting() will trigger a
> >> false-positive lockdep"suspicious RCU usage" splat during early lock
> >> acquisitions as commit ce3d31ad3cac ("arm64/smp: Move
> >> rcu_cpu_starting() earlier") pointed out.
> > 
> > Sorry, I meant to mention this in the cover letter but forgot about it.
> > I'm not sure that ce3d31ad3cac ("arm64/smp: Move rcu_cpu_starting()
> > earlier") is still relevant with the latest printk/console/lockdep code.
> > I tried quite hard to trigger lockdep splats manually, but the only way
> > I could do it was by using the "%pS" specifier to print the name of a
> > symbol in a module, which would cause an RCU walk of the module symbols
> > in the kallsyms code! Manually calling WARN() or even rcu_read_lock() /
> > spin_lock() did _not_ trigger a splat.
> 
> Add "dyndbg="+p"" in cmdline, CONFIG_DEBUG_LOCK_ALLOC=y,
> CONFIG_PROVE_RCU_LIST=y, we can reproduce the warning as below:
> 
> I believe there is also a problem in the RISC-V code itself here as
> store_cpu_topology() is common for RISC-V.
> 
> [    0.335162] smp: Bringing up secondary CPUs ...
> [    0.345495]
> [    0.345513] =============================
> [    0.345523] WARNING: suspicious RCU usage
> [    0.345621] 7.3.0-rc2-00010-g2311ba2cd56f #500 Tainted: G        W
> [    0.345637] -----------------------------
> [    0.345646] kernel/locking/lockdep.c:3845 RCU-list traversed in
> non-reader section!!
> [    0.345659]
> [    0.345659] other info that might help us debug this:
> [    0.345659]
> [    0.345680]
> [    0.345680] RCU used illegally from offline CPU!
> [    0.345680] rcu_scheduler_active = 1, debug_locks = 1
> [    0.345725] locks held by swapper/1/0: 0, last CPU#1
> [    0.345743]
> [    0.345743] stack backtrace:
> [    0.345834] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Tainted: G        W
>          7.3.0-rc2-00010-g2311ba2cd56f #500 PREEMPT(full)
> [    0.345885] Tainted: [W]=WARN
> [    0.346077] Call trace:
> [    0.346102]  show_stack+0x20/0x38 (C)
> [    0.346153]  dump_stack_lvl+0xc4/0x150
> [    0.346176]  dump_stack+0x18/0x28
> [    0.346194]  lockdep_rcu_suspicious+0x170/0x238
> [    0.346217]  __lock_acquire+0xf08/0x1818
> [    0.346237]  lock_acquire+0x1e0/0x450
> [    0.346256]  _raw_spin_lock_irqsave+0x70/0xc0
> [    0.346277]  down_trylock+0x20/0x60
> [    0.346293]  __down_trylock_console_sem+0x4c/0x118
> [    0.346316]  vprintk_emit+0x2d8/0x3f8
> [    0.346333]  vprintk_default+0x40/0x58
> [    0.346350]  vprintk+0x3c/0x80
> [    0.346366]  _printk+0x64/0x98
> [    0.346386]  __dynamic_pr_debug+0x90/0xd8
> [    0.346406]  acpi_get_cache_info+0x140/0x1a0
> [    0.346430]  init_cache_level+0xec/0x110
> [    0.346450]  detect_cache_attributes+0x74/0x7c0
> [    0.346473]  update_siblings_masks+0x30/0x300
> [    0.346495]  store_cpu_topology+0x70/0xf0
> [    0.346515]  secondary_start_kernel+0xe0/0x178
> [    0.346535]  __secondary_switched+0xc0/0xc8

I was about to say "don't do this" but then I realised two things:

1. update_siblings_masks() can trigger lockdep splats outside of
   pr_debug() if RCU isn't up and running, e.g.:

    [    0.524042]  show_stack+0x18/0x24 (C)
    [    0.524519]  __dump_stack+0x28/0x38
    [    0.524546]  dump_stack_lvl+0x64/0x84
    [    0.524562]  dump_stack+0x18/0x24
    [    0.524576]  lockdep_rcu_suspicious+0x134/0x1cc
    [    0.524591]  __lock_acquire+0xee8/0x2cb0
    [    0.524606]  lock_acquire+0x11c/0x2fc
    [    0.524621]  _raw_spin_lock_irqsave+0x64/0x84
    [    0.524641]  of_find_property+0x2c/0x8c
    [    0.524659]  detect_cache_attributes+0x1c0/0x6d0
    [    0.524676]  update_siblings_masks+0x38/0x288
    [    0.524692]  store_cpu_topology+0x4c/0x58
    [    0.524706]  secondary_start_kernel+0xdc/0x1c8
    [    0.524722]  __secondary_switched+0x120/0x124

2. This code is running _after_ cpuhp_ap_sync_alive().

So for the next version, I'll reintroduce the call to
rcutree_report_cpu_starting(), but move it immediately after the call to
cpuhp_ap_sync_alive(). I think that will solve these issues, without
causing issues with the concurrent part of early boot and also without
reintroducing the early call to rcutree_report_cpu_dead().

Cheers,

Will
