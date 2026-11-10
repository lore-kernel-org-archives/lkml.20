Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278825;
	b=jXHxzT8u84ALym4x8cno9yNS4VV3mzBUj53FJEQ1dxgdiE2jB7qK1ZakpVFgzWOu6B9/
	 Y+7X8j5fWLCvw5EhaNVFZJfxktaY1VmHciNYhjU5gzspf6xs73WO3JbJf6ZY1rNvErhhV
	 BNRCMJBRbQDtkLIUJGX+XqNKrrgDxmGUY7Tny2JLoSIcPl65cpL+d0wy3HQ5oNSon6V1V
	 hbLV1GGYkfgb5rlhTBWiH38+P8guAj+SqzSRJRPTEOUn8A6YITuyDTkoWxwEyt7Ppv8SA
	 VpS1QPP5QAaWPuatqh6aGOhiuCzavwLh5OFJdZs0q2ZWgPZKLF7niH3Ge0zFytLmBzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278825;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Wr08ML3Rij0GWlEMxlionTZbgmIcPOoLHTVZ3u5AxBY=;
	b=hNzIuhn5kFW/mxHEzSVJ7YZUIcFSQ7jg3IzXSXPNJQeSMAhaaRGZQrr05gMlWnJUiAox
	 Q1Y/gdf+Vl5E8hepk51YfanT37attc3xS8hCGmwZikl/CVE8TZnM70ZTW7I/RtruiAF7b
	 HqTcSV/Eepnn58kKfEeHN/WrmldmsC6vpgVmYeKJpuv6iwJ2+IrPJHq3PhqElNODERcPT
	 lcOOCjrp3iANy9gTLfNW8uTG/IHbQ7NmvTR+AKpQzih8KP9gtY9X0KmnkkDfoPLrIoROU
	 y6AAlazfxslQoVDwjAFmI6k9MOmGrdTDjFkbt4PLMFrcSXVpL3PuUByPtk9b11A3n4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=koHBjNFN;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A34606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A34606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=koHBjNFN
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 31F4240E04D0;
	Tue, 10 Nov 2026 02:47:02 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OI2spkjCGtsn; Tue, 10 Nov 2026 02:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794278818; bh=Wr08ML3Rij0GWlEMxlionTZbgmIcPOoLHTVZ3u5AxBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koHBjNFNAdAygyyatnZ2Fg3iHhIPml1922KYf07hGnYn4kdvLHoSBxPJM3UqTtvXL
	 Ou35UCk3BFKN60CAV2hkAEIpzIeTA01TKK5vmSEKeKywAfIjdMjIvnwUH5faaS/s1V
	 yEo13Yuyh2WNEBrDwWb9mpW1/kvIYiosBHeBJJEwlRfvB0ZYsVFQqeyjT5FS74EbvF
	 IE5nmnE54YJc6MSlN998RNsmLhgTU7Wp5s6CWxcGlSUBlGS2O8+XNkaw9lMdJFxj/r
	 vPVpbq49zXgFGkLWiEbS3g6eQ0WNqnm5K6nQUGGick/Z770/zOQdpNCsnpXjQ0HODY
	 W6mLl2gnj5VEvbMEkKTYnfu87Pc6U4EKVRFCXtdMeyoXFveJlQf41TeOEqsRA8M8p7
	 vlcFwwYXO5kLO0tgCl9DDgPY/gv8/IHH4W/I5o8F/fUoienucD0eGqhquN8jBbNSba
	 244pPbIxFc7KwXgYEBr7nOjV86CpfNJ+o63ofeGWGDr9iM6Jt12t4Crugnjk22nvdY
	 JLqiPekLZOfK+y2g5SJtOYVVui+X4uVx1nchmTo7DMil4Rls/aiV1e9a0DaG1vyPhX
	 13LV3pL1aan/7nQ3RVv0EDGMshhfSrPaUMRkyNg2md/dR+MVKBGeyzYSyL6pBG97SS
	 yws83ao8toTRxXaP+QfBApOA=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7CA4940E015B;
	Tue, 10 Nov 2026 02:46:49 +0000 (UTC)
Date: Mon, 9 Nov 2026 18:46:46 -0800
From: Borislav Petkov <bp@alien8.de>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, tglx@kernel.org,
	mingo@redhat.com, dave.hansen@linux.intel.com, peterz@infradead.org,
	david.kaplan@amd.com
Subject: Re: [PATCH v4 2/9] stop_machine: Add NMI-based execution path
Message-ID: <20261110024646.GGavKFllskPQiLrNOK@fat_crate.local>
References: <20261104182322.578066-1-chang.seok.bae@intel.com>
 <20261104182322.578066-3-chang.seok.bae@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104182322.578066-3-chang.seok.bae@intel.com>

On Wed, Nov 04, 2026 at 06:23:15PM +0000, Chang S. Bae wrote:
> Currently multi_cpu_stop() executes the stop function in the
> MULTI_STOP_RUN state. But NMIs can still preempt the execution. For use
> cases requiring stricter isolation from them, provide an option to run
> the stop function from NMI context.

If that were the case then we should not use stop_machine(). But
stop_machine() prevents NMIs indirectly by simply not running anything else on
the CPUs, thus leading to no NMIs. Well, mostly. We can't do anything about
firmware gunk and so on.

David's original justifcation makes a lot more sense to me:

https://lore.kernel.org/r/20260125014224.249901-2-chang.seok.bae@intel.com

> Then, the NMI stop function must be built without instrumentation, as
> exceptions may re-enable NMIs on return via IRET. Annotate the NMI
> handler entirely with noinstr.
> 
> However, objtool cannot reliably determine whether the indirect call
> target is located in a noinstr section, so it may emit false positives.
> To avoid this, temporarily lift the instrumentation restriction around
> the indirect call site and document the intention.
> 
> The x86 microcode loader is currently the primary user for this.

> But other architectures are not expected to use it.

This does not belong here.

> Add a build option to make it opt-in.

Also drop all text that explains the patch. Audit your whole set pls.

> Originally-by: David Kaplan <david.kaplan@amd.com>
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/lkml/20260129121729.GRaXtP2aeWkQKegxC2@fat_crate.local
> Link: https://lore.kernel.org/lkml/87wm0zl8p2.ffs@tglx
> ---
>  arch/Kconfig                 |  3 ++
>  include/linux/stop_machine.h | 16 ++++++
>  kernel/stop_machine.c        | 99 +++++++++++++++++++++++++++++++++++-
>  3 files changed, 117 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 1163736de1f9..a4b62f83efb6 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1824,4 +1824,7 @@ config ARCH_HAS_CPU_ATTACK_VECTORS
>  config HAVE_ARCH_GET_SECUREBOOT
>  	def_bool EFI
>  
> +config STOP_MACHINE_NMI
> +	bool

What is the real point for that ugly ifdeffery introducing, yet another
Kconfig option in the zoo?

>  endmenu
> diff --git a/include/linux/stop_machine.h b/include/linux/stop_machine.h
> index 84e7fb627ba4..b53b028296e0 100644
> --- a/include/linux/stop_machine.h
> +++ b/include/linux/stop_machine.h
> @@ -20,6 +20,12 @@
>   */
>  typedef int (*cpu_stop_fn_t)(void *arg);
>  
> +/*
> + * Stop function variant runnable from NMI context. This makes the
> + * noinstr requirement explicit at the type level.
> + */

I don't see what the point of that comment is.

> +typedef int (*cpu_stop_nmisafe_fn_t)(void *arg);
> +
>  #ifdef CONFIG_SMP
>  
>  struct cpu_stop_work {
> @@ -186,4 +192,14 @@ stop_machine_from_inactive_cpu(cpu_stop_fn_t fn, void *data,
>  }
>  
>  #endif	/* CONFIG_SMP || CONFIG_HOTPLUG_CPU */
> +
> +#ifdef CONFIG_STOP_MACHINE_NMI
> +
> +void arch_send_self_nmi(void);
> +bool noinstr stop_machine_nmi_handler(void);
> +
> +#else
> +static inline bool stop_machine_nmi_handler(void) { return false; }
> +#endif /* CONFIG_STOP_MACHINE_NMI */
> +
>  #endif	/* _LINUX_STOP_MACHINE */
> diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
> index 8dcd5be67b85..ad01b7c5266c 100644
> --- a/kernel/stop_machine.c
> +++ b/kernel/stop_machine.c
> @@ -23,6 +23,7 @@
>  #include <linux/atomic.h>
>  #include <linux/nmi.h>
>  #include <linux/sched/wake_q.h>
> +#include <linux/delay.h>
>  
>  /*
>   * Structure to determine completion condition and record errors.  May
> @@ -175,6 +176,15 @@ struct multi_stop_data {
>  
>  	enum multi_stop_state	state;
>  	atomic_t		thread_ack;
> +
> +#ifdef CONFIG_STOP_MACHINE_NMI

I hate this ifdeffery.

> +	/* Used in the NMI stop_machine variant */
> +	bool			use_nmi;
> +	/* A separate function type to highlight noinstr requirement */

What?

This is the function that stop_machine_nmi calls. Pls keep commenting to the
point and at minimum.

> +	cpu_stop_nmisafe_fn_t	nmisafe_fn;
> +	/* cpumask of CPUs on which to raise an NMI */

Kinda obvious from the name, right?

> +	cpumask_var_t		nmi_cpus;
> +#endif
>  };
>  
>  static void set_state(struct multi_stop_data *msdata,
> @@ -198,6 +208,8 @@ notrace void __weak stop_machine_yield(const struct cpumask *cpumask)
>  	cpu_relax();
>  }
>  
> +static int multi_stop_run(struct multi_stop_data *msdata);

Get rid of this.

> +
>  /* This is the cpu_stop function which stops the CPU. */
>  static int multi_cpu_stop(void *data)
>  {
> @@ -236,7 +248,7 @@ static int multi_cpu_stop(void *data)
>  				break;
>  			case MULTI_STOP_RUN:
>  				if (is_active)
> -					err = msdata->fn(msdata->data);
> +					err = multi_stop_run(msdata);
>  				break;
>  			default:
>  				break;
> @@ -713,3 +725,88 @@ int stop_machine_from_inactive_cpu(cpu_stop_fn_t fn, void *data,
>  	mutex_unlock(&stop_cpus_mutex);
>  	return ret ?: done.ret;
>  }
> +
> +#ifdef CONFIG_STOP_MACHINE_NMI
> +
> +struct nmi_stop {

If you already have "multi_stop_data" then this is "nmi_stop_data".

Please try not to come up with weird naming willy nilly.

> +	struct multi_stop_data	*data;
> +	int			ret;
> +};
> +
> +static DEFINE_PER_CPU(struct nmi_stop, nmi_stop);

static DEFINE_PER_CPU(struct nmi_stop_data, nmi_data);

> +
> +/*
> + * Instrumentation may trigger nested exceptions such as #INT3, #DB,
> + * or #PF. IRET from those would re-enable NMIs, which opposes the goal
> + * of this NMI stop-machine facility.
> + */
> +bool noinstr stop_machine_nmi_handler(void)

stop_machine_nmi()

> +{
> +	struct multi_stop_data *msdata = raw_cpu_read(nmi_stop.data);
> +	unsigned int cpu = raw_smp_processor_id();
> +	int ret;
> +
> +	if (!msdata || !arch_test_and_clear_bit(cpu, cpumask_bits(msdata->nmi_cpus)))
> +		return false;
> +
> +	/*
> +	 * The indirect call to @nmisafe_fn() is indistinguishable at
> +	 * post-compilation. Temporarily enabling instrumentation avoids
> +	 * objtool false positives.
> +	 */
> +	instrumentation_begin();
> +	ret = msdata->nmisafe_fn(msdata->data);
> +	instrumentation_end();

This is just silly. We should fix objtool here.

Peter?

> +	raw_cpu_write(nmi_stop.ret,  ret);
> +	raw_cpu_write(nmi_stop.data, NULL);
> +
> +	return true;
> +}
> +
> +static bool wait_for_nmi_handler(void)
> +{
> +	/* Conservative timeout */
> +	unsigned long timeout = USEC_PER_SEC;
> +
> +	/* The handler clears up at the end */
> +	while (this_cpu_read(nmi_stop.data) && timeout--)
> +		udelay(1);
> +
> +	return !this_cpu_read(nmi_stop.data);
> +}
> +
> +static int nmi_stop_run(struct multi_stop_data *msdata)
> +{
> +	/*
> +	 * Save per-CPU state accessible from NMI context and raise a
> +	 * self-NMI to execute the stop function from the NMI handler
> +	 */
> +	this_cpu_write(nmi_stop.data, msdata);
> +	arch_send_self_nmi();
> +
> +	/*
> +	 * Ensure the handler went through before reading the result.
> +	 * Otherwise, make no stale state left behind.
> +	 */
> +	if (!wait_for_nmi_handler()) {
> +		this_cpu_write(nmi_stop.data, NULL);
> +		return -ETIMEDOUT;
> +	}
> +
> +	return this_cpu_read(nmi_stop.ret);
> +}
> +
> +static int multi_stop_run(struct multi_stop_data *msdata)

Call it what it is:

	stop_machine_callback()

or

	stop_machine_fn()

or so. Naming is very important.

> +{
> +	return msdata->use_nmi ? nmi_stop_run(msdata) : msdata->fn(msdata->data);
> +}
> +
> +#else
> +
> +static int multi_stop_run(struct multi_stop_data *msdata)
> +{
> +	return msdata->fn(msdata->data);
> +}
> +
> +#endif /* CONFIG_STOP_MACHINE_NMI */
> -- 
> 2.53.0
> 

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
