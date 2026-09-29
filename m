Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AADC37CD33
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689836; cv=none; b=PJPs0X6v2UvNv0b8Ef2IxNWPjJD9aTzL4fJO++Xidt9Z77ZNRPrDMZW/kEZh4CHScN8/U7BseWvMoGnHm/5cNwgRBix++TbhkwLEQk9S+/C5IgpzHY9cPEILnMQfcgph4eU7wXeDG2tN/+x7NmfsYP9Ahln9EWfWs3KIvIrTSnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689836; c=relaxed/simple;
	bh=pkAjWq2qsb19Kk+6tfhOQNlRNmYwaVCv5Tvkoq23pbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPljJXHzT+Ia3DjhdDegy5LTpKM+9L9doCgPvJYA0v/8tuU73A9g+Gr7uoD+z0GVJvjNnn0JnpifRGswvxcXt5E9EPkPe7OSM5r7McPkvXxM2WbaKySito2MPjHg3EJ/vGu8iIGc+QXedBqD6qKSqw2RjT2xrnYpEQmHiGMWGeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SyacP3nW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SyacP3nW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53AC21F000FF;
	Tue, 29 Sep 2026 13:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790689834;
	bh=d138TUO/Ve/2vyNV5jB3KW2+RQ5rrXezbHRlOxWZDsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SyacP3nWMNBV1SC6yyhzxJ+HX5GPxeyKX0jmfrqPjjF0bkiowzwoPsABDbSAwzJZV
	 XQgmhmMjUPrRhBFmHuWC0mQ725Qg72Da1bZ4aB+39lB+Uq9nxgvVJCZIC6sU2hW3wo
	 Ode8YQaH74wF9w1RTS4yI/ZMxe5SXenH5d9IG7yI+brD82yZQQtXy5PxUrZwuOdt5s
	 B6nKHxsQvZZJJVK6QSuHFAbntn+9e0nqZykWOvYeu0m8npDJ/j/kvg+k6tftE1kSdr
	 Vpls2MRHNiHjmg5Zn532+cnVOYTu966sZzDE5f9MX6pOoxfBxqCbW4unRSajZo0urG
	 WYr22xJw6Azhg==
Date: Tue, 29 Sep 2026 15:50:31 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Ahmed Shaltout <ahmedshaltout.payment@gmail.com>
Cc: tglx@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] /proc/stat idle time exceeds wall clock since v7.2
Message-ID: <arvCJzz35oBW3AjY@localhost.localdomain>
References: <E76BE609-83E4-4FB6-88B8-191F7816EFD6@gmail.com>
 <arJ6NjfdHUPjN2Kc@localhost.localdomain>
 <CAORRHKj1EUum3O6ToGek0A-tuUf7HsCUwFHiXUc+53ZLKOrSFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAORRHKj1EUum3O6ToGek0A-tuUf7HsCUwFHiXUc+53ZLKOrSFw@mail.gmail.com>

Le Tue, Sep 22, 2026 at 07:53:23PM +0400, Ahmed Shaltout a écrit :
> Hi Frederic,
> 
> Le Mon, Sep 21, 2026, Frederic Weisbecker a écrit :
> > I can't manage to reproduce that, neither on latest mainline nor on 7.2.7
> >
> > Can you share your whole .config file?
> 
> Attached: config-7.2.5-1-default, taken from /boot/config-$(uname -r) on an
> affected node. It is the stock openSUSE Tumbleweed/MicroOS package
> kernel-default-7.2.5-1.1.x86_64, unmodified, no custom build. It differs
> from
> config/x86_64/default in openSUSE:Factory/kernel-source at the 7.2.5 source
> revision only in toolchain-detection and build-metadata lines (CC/AS/LD
> version, LOCALVERSION, MODULE_SIG_KEY, CC_HAS_*), no functional option:
> https://api.opensuse.org/public/source/openSUSE:Factory/kernel-source/config.tar.bz2?rev=4dabae0b715184e35b05b9a168bde6b7

I fear I still can't reproduce with the config in attachment.

> 
> The unaffected control box runs kernel-default-7.1.8-1.1.x86_64 from the
> same
> distribution, also stock, same VM type, same command line. Between the two
> configs the only change among the scheduler, tick, accounting, preemption
> and
> RCU options is CONFIG_SCHED_CACHE=y appearing in 7.2.5.
> 
> Environment, in case it is what your test box does not share:
> 
>   - Every node is a KVM guest (Hetzner Cloud, QEMU, "AMD EPYC-Rome
> Processor",
>     8 vCPUs, one with 4), clocksource kvm-clock.
>   - No steal-time accounting at all: there is no kvm-stealtime line in the
>     boot log and the steal column has read exactly 0 on every node for the
>     75 hours since boot, so the hypervisor does not seem to expose the MSR.
>   - CONFIG_VIRT_CPU_ACCOUNTING_GEN=y, CONFIG_CONTEXT_TRACKING_IDLE=y and
>     CONFIG_NO_HZ_FULL=y are built in (SUSE default) with nohz_full= empty,
>     so the CPUs run idle dynticks, not full.
>   - CONFIG_HZ=1000, CONFIG_PREEMPT_DYNAMIC=y, psi=1 on the command line:
>     BOOT_IMAGE=/boot/vmlinuz-7.2.5-1-default root=UUID=... rd.timeout=60
>     rd.retry=45 quiet systemd.show_status=yes console=ttyS0,115200
>     console=tty0 ignition.platform.id=openstack security=selinux selinux=1
>     psi=1

I ran on KVM too, overcommiting the vcpus like you did (16 vCPUs on 8 CPUs)
and still nothing wrong.

I'm wondering if this is specific to opensuse somehow. Can you try to build
the latest upstream kernel?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
