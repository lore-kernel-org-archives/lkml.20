Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C19371887
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789053819; cv=none; b=hMplHCbxf8zwzcRkpOdwumRPMkGj7oJ5tqEVH7h9fqYkFkipLMQi616QtAqjKQ8f4IROt64adkDbee/XJXPy6ClwjrU1kek4K5jCHbuKlWoTeOa/ffWEjW0m0YTfwf9lJVfpFoVVGEaD3SslClZqwwwDeoZn5UgJNVoc1zkvTls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789053819; c=relaxed/simple;
	bh=3UXIgY2VMu2Psax40JU5hcW/duHCra7g2zxDa61hMZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPn6vw5u7HE6aTyb3qh3F/QvwbOrREKUC6qT3cVPUvwTlnwWTVjfDhj6XGemyN18GhbNIDMuUKjdEOkTTDpKFenhSZgPzhFrpc3mNI+qc2tBoJjsMrwzgWMV8Ry94DBf1jHaoamM4VQc0q3EESMzdh8+FijtpgBIvHdFjaTGCEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmtBFD4I; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmtBFD4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789053816; x=1820589816;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3UXIgY2VMu2Psax40JU5hcW/duHCra7g2zxDa61hMZI=;
  b=dmtBFD4IC1L58J0Klj4qd9d/WKOV4kJB2GY2KThruAan9fgvUyfKTtXr
   176DFW7yhQyWis6odvB+j0o/8Uum39VHdaxgMBCKXavzw0o6Lh/lHbDRr
   X9eD/Q9PLIyie7FJuV9fO0igqz1FxWM8yOFsZzzZQTX15ZJ0BlbvRoZjW
   4IPDRvvKnMNJnzrl/AQDGShknVbT+f1YvT9r3k15vZhMy4psKIrbWTfWy
   n4F26TBUZVoqOSmGh5+fEEpPrMqjR91J7G4AW6NSX/hRyoAYkB6THDN8d
   Vq/WBHjAu2MatOrdNLI1V4TlWr7KVIchVtfmv8+N7FLv6fyauvfUdqsiY
   A==;
X-CSE-ConnectionGUID: XMQTU0f1R6meQ8RMipZKgQ==
X-CSE-MsgGUID: Mh+HsCv6Tia9vKfLNrh+xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89379072"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89379072"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:23:35 -0700
X-CSE-ConnectionGUID: mvVqUiWCSGyGN0oZ5FZ4+Q==
X-CSE-MsgGUID: PDr6RW/VSDiVB+3PJKmakw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="268378830"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO [10.125.111.208]) ([10.125.111.208])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 08:23:32 -0700
Message-ID: <5a09dd3a-7e14-4649-af53-f1da19343fab@intel.com>
Date: Thu, 10 Sep 2026 08:23:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/apic: Switch to x2apic driver early if x2apic is
 enabled
To: Grzegorz Jaszczyk <jaszczyk@chromium.org>, tglx@kernel.org
Cc: linux-kernel@vger.kernel.org, dmaluka@chromium.org,
 vineethrp@chromium.org, chuanxiao.dong@intel.com,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>,
 Melody Wang <huibo.wang@amd.com>
References: <20260910090512.1197517-1-jaszczyk@chromium.org>
Content-Language: en-US
From: Dave Hansen <dave.hansen@intel.com>
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20260910090512.1197517-1-jaszczyk@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 02:04, Grzegorz Jaszczyk wrote:
> During early boot, the generic x86 kernel defaults to the MMIO-based
> APIC driver (apic_physflat). However, if the kernel is booted (e.g. via
> kexec) when x2apic is already enabled in hardware, the MMIO interface to
> the APIC is disabled.

There's also some new hardware that locks the hardware in x2apic mode. I
wonder if it has a similar problem.

> Normally, ACPI MADT probing would install an x2APIC driver early.
> However, if ACPI is disabled (e.g., CONFIG_ACPI is not set, as in
> crashdump kernels), x86_64_probe_apic() does not run until late_time_init()
> via apic_intr_mode_init().

Is this "default_acpi_madt_oem_check()" that uses apic_install_driver()?

> This creates a window between local_irq_enable() and late_time_init()
> where interrupts are enabled, but the APIC driver pointer still points
> to apic_physflat. Because check_x2apic() detected hardware x2APIC mode
> and set x2apic_mode = 1, init_apic_mappings() skipped mapping the APIC
> fixmap. If a pending interrupt (e.g., left in IRR across kexec on
> secondary CPUs) fires during this window, native_apic_mem_eoi() is
> invoked, which attempts to write to the unmapped APIC EOI register,
> triggering an immediate kernel page fault (#PF).

Long-term, it seems like reducing the use of x2apic_mode would be really
nice.

> To prevent this, check if x2apic is enabled in hardware during early APIC
> call setup in apic_setup_apic_calls() and switch the default APIC driver
> from apic_physflat to apic_x2apic_phys immediately. This ensures that any
> early EOI writes use safe MSR-based accesses. The driver can still be
> upgraded later during the normal APIC probe phase.
>
> 
> diff --git a/arch/x86/kernel/apic/init.c b/arch/x86/kernel/apic/init.c
> index 821e2e536f19..c48323f725e7 100644
> --- a/arch/x86/kernel/apic/init.c
> +++ b/arch/x86/kernel/apic/init.c
> @@ -82,6 +82,8 @@ static __init void update_static_calls(void)
>  
>  void __init apic_setup_apic_calls(void)
>  {
> +	x2apic_phys_early_init();
> +
>  	/* Ensure that the default APIC has native_eoi populated */
>  	apic->native_eoi = apic->eoi;
>  	update_static_calls();

This seems a bit ad-hoc.

>  apic_driver(apic_x2apic_phys);
> +
> +void __init x2apic_phys_early_init(void)
> +{
> +	if (x2apic_enabled()) {
> +		apic = &apic_x2apic_phys;
> +		if (apic->x2apic_set_max_apicid)
> +			apic->max_apic_id = x2apic_max_apicid;
> +		pr_info("Switched default APIC to: %s\n", apic->name);
> +	}
> +}

This seems to be a subset of what apic_install_driver() and
apic_x2apic_phys->probe() do, down do the pr_info().

Even if those are overkill for this, it would be nice to use them for
consistency if they function.

It also seems like some of the more obscure apic drivers depend on
x2apic_mode. They also seem like they might be selected by the MADT
search. Could this end up overwriting those?

Maybe this is too much work for the task at hand, but this does seem to
show that there's some information missing from 'struct apic'. Say
apic_physflat had an ->initialized() that was false until its MMIO was
unmapped and apic_x2apic_phys->initialized() pointed over to:
x2apic_enabled().

apic_setup_apic_calls()
{
	// Search for an APIC driver that is initialized:
	for_each(drv) {
		if (!drv->initialized())
			continue;
		
		apic_install_driver(drv);
	}
}

Basically, I'm wondering if it's worth continuing to special-case x2apic
handling or whether it should just be a part of the apic driver
infrastructure.
