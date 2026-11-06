Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987055;
	b=EOW/oGRMTOygwHxsL8LBi3Rq0/pQFnFdBr3DLtoO1sIzX8TGRdEEyLUEscAOziF1KNHE
	 k0FxTCJ3oXLS1RiNMdetlhdKeETubd1Go9VKItpcVmnx9yp7gUZdYy+r7NVtDe4GYjmEs
	 kubf3tG4dZEFw046JPoWWQcppoBI/g0OQU2v8t2lrK+NF+5EvbXnzqGehAz8+l9HQpFXL
	 8nlcb/ZfUJaK49E4JhFebr+ZnOWOwE1fthrZjnFbu1Ddu6Aa5bHnXQnnf3do0xBiLeEt3
	 ZaoBETi4cosW4mAj1CvOUp5XbJMNl2sl8OzaDwSrBAZp1Wf+l1DbuM1VpCNn2lxKzLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8lY1lf/ALSFACzs3R/fk17f4eRgsj/Rgpm1oAwZPuC8=;
	b=b37ty7/vOc3xEQkzgIJBb9CJtALIsrUUFSEM2un5NKN5KGyx9N4sboERlbyU+VWnEUKA
	 XwVFvFUlXSB1+tJMeExQGmvzUbI5EoZ0ywSe1eKMIl3uyS0eksZd3OOo1EaeHmw62A1ls
	 QdFTnmJlewKU/kMW3KQ5F10C129wzIcK/g4POTzOQCPgKSXg556jnoZ6P4fmpds9W/B7G
	 ehTC2ZrlyJHulG2jdHts3kjjYOvhXdElkPqSLXyrNnBBsfLGmRu9bt7pK9e5pPrQs02Fe
	 eFOdK6BPtKsiCITHjf1NhOZO7GSNHRoFbILwTPndy/uaf6Qtl3fO9kVfaoS4qNYNLZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D3sAEnu6;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354B5606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 354B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=D3sAEnu6
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so8905525e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793987053; x=1794591853; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8lY1lf/ALSFACzs3R/fk17f4eRgsj/Rgpm1oAwZPuC8=;
        b=D3sAEnu6ob8itCe7vatu/Da3KrliNbRIEC37/WuAz9dXgrB/EKD2YGJjyZkRORcD8l
         Xww4Y/GCQQ8TpAcMjGTOOsZm3aKKqeonWh4otc57NhFOHx+6KWZyd6IYDyahRndxvNKS
         WkClHYt9O5WS+QRNTiB7u5W0IGXZh6Ni/tfTuevREZTxblyX+bIA47tvEfIsh+8chpz+
         3JA+M027PlKMgyrXq1wx7ognVynrOTB04VqS8jiAFht9tU6/R/CSnYHVMpgzfgwYYJw0
         ip0Ng1170Pak5pmaHthy1T/Kp8kDa0tmfdiEothpjgCyAhbF9HkEs7fhPpbP54Ho4U5S
         pnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987053; x=1794591853;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8lY1lf/ALSFACzs3R/fk17f4eRgsj/Rgpm1oAwZPuC8=;
        b=ZQCYqUY8W67rqijL8MnYZgq+Af/Szr3QeS22jVG4v3FLb0syPesG1oLLTM6rVLLlKC
         M4/H+OBfjl83szZeWT0M4CGFlY8+1mhvJW7csrbFRviya/Px3mEus/rCrmE7s6zf7k8A
         BSb/9LYNUZwVNvVnYtUdx3tbgvLQMrd82K+U7m4hYULpXaJ5vVe6dWeLGK95Udg1B7g+
         Di1V7bqrf1vWKuRurhn680DXm+ibgPYr7MegZY8vUmccLcWydu9CHwrtDptsoFZGgabr
         bJT4X+GjbDh+vgSW3I9rYLOxr4bx8J4g348duH8gzHm25WHg6/nuyappGtNkrtdRCxG9
         VV4w==
X-Forwarded-Encrypted: i=1; AKwUvBwhpnbDQn534hapWXsrLMDLlqLlWOqviCr7HIyNZAgXcdO8LfZ3XqDWLuvdnkexFxBt9LsdZRpn0XIG6H4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oQdWX86656J4VPH0qIaDP/1Hg/gtM3srkcg7mVNC0w9U/z95L
	4t4Km1K2RNUOYy6A7/javXZOV44NbgulVv+p8usOi7gHr5f1nCMYhNpt/hwL/hFSErg=
X-Gm-Gg: AYBFou3zUb1EIruaMrhYMNGHSnJdOXkU9urcMRx0CdkWwi2nb2ACGu6xNlH71cEB+kN
	uKkIjIK+VYq4K+e4OwgBZPEtZ3kIqpEcjBfZslE+cDjChfzR/r87Tnoe483MCWhwqNJoBOZtsxr
	shrxTj95W4dcgY76NZ4X/uH3LwyuUCxDJNUzHkxTmVbi89uhWM1CfuKwj35ZO6XxF3yGkamaKMt
	s7sJqjAjzJ0hC5bwCaJBRpOwY42Oag4jHKybHVsQgsuCComLBYAuZvAkESSM/4uJS04g9OyV2Lr
	Vycime7r5fqJeCib3Ja5jzM+PdGwg9wF9WjsJnFrn5wBO6zZl4nzcXaXr/5r9phWtOftvMxzsbw
	KiOCH/XHg0AkmrPSihHsx4/k2qqLP6DkFIBPjavfPbbu5nr+L/OHalHeWoxJjeXE1k9mQ1N+V/c
	6jqX9dGBvi/uSJaQyz4bYR4gAwEZknAqw0t3OjUAB2M/nfS4ZVofmu7TbhefaMnwnoi6X/RQb5l
	yNKdp94Omda8XK+t/B8DulL3wwJMslvXMdRJ1jDUnJCps9Qur1o1O3JVw94Fuirheo5AC2hEdSf
	cCtYHeCcxzVjzlzwb0NKawze0+tMbZo=
X-Received: by 2002:a05:600c:1c08:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4b6df5eac1amr63450615e9.21.1793987053573;
        Fri, 06 Nov 2026 09:44:13 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.107])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76d83e539sm8359915e9.1.2026.11.06.09.44.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:44:12 -0800 (PST)
Message-ID: <bfe8f403-06c9-4e93-9bcb-738c9128c557@suse.com>
Date: Fri, 6 Nov 2026 19:44:11 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] stop_machine: Add NMI-based execution path
To: "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, peterz@infradead.org, david.kaplan@amd.com
References: <20261015211426.49114-1-chang.seok.bae@intel.com>
 <20261015211426.49114-3-chang.seok.bae@intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20261015211426.49114-3-chang.seok.bae@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 16.10.26 г. 0:14 ч., Chang S. Bae wrote:
> Currently multi_cpu_stop() executes the stop function in the
> MULTI_STOP_RUN state. But NMIs can still preempt the execution. For use
> cases requiring stricter isolation from them, provide an option to run
> the stop function from NMI context.
> 
> Then, the NMI stop function must be built without instrumentation, as
> exceptions may re-enable NMIs on return via IRET. Annotate the NMI
> handler entirely with noinstr.
> 
> However, objtool cannot reliably determine whether the indirect call
> target is located in a noinstr section, so it may emit false positives.
> To avoid this, temporarily lift the instrumentation restriction around
> the indirect call site and document the intention.
> 
> The x86 microcode loader is currently the primary user for this. But
> other architectures are not expected to use it. Add a build option to
> make it opt-in.
> 
> Originally-by: David Kaplan <david.kaplan@amd.com>
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/lkml/20260129121729.GRaXtP2aeWkQKegxC2@fat_crate.local
> Link: https://lore.kernel.org/lkml/87wm0zl8p2.ffs@tglx
> ---
> V2 -> V3: Address Sashiko review
> * Avoid instrumentable functions:
>    smp_processor_id() -> raw_smp_processor_id()
>    cpumask_test_and_clear_cpu() -> arch_test_and_clear_bit()
> * Remove `done` tag to avoid false setting. Instead, data == NULL as indicator
> ---
>   arch/Kconfig                 |  3 ++
>   include/linux/stop_machine.h | 16 ++++++
>   kernel/stop_machine.c        | 99 +++++++++++++++++++++++++++++++++++-
>   3 files changed, 117 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 45c657772362..afa564261e1c 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -1878,4 +1878,7 @@ config ARCH_HAS_CPU_ATTACK_VECTORS
>   config HAVE_ARCH_GET_SECUREBOOT
>   	def_bool EFI
>   
> +config STOP_MACHINE_NMI
> +	bool
> +
>   endmenu
> diff --git a/include/linux/stop_machine.h b/include/linux/stop_machine.h
> index 84e7fb627ba4..b53b028296e0 100644
> --- a/include/linux/stop_machine.h
> +++ b/include/linux/stop_machine.h
> @@ -20,6 +20,12 @@
>    */
>   typedef int (*cpu_stop_fn_t)(void *arg);
>   
> +/*
> + * Stop function variant runnable from NMI context. This makes the
> + * noinstr requirement explicit at the type level.
> + */
> +typedef int (*cpu_stop_nmisafe_fn_t)(void *arg);
> +
>   #ifdef CONFIG_SMP
>   
>   struct cpu_stop_work {
> @@ -186,4 +192,14 @@ stop_machine_from_inactive_cpu(cpu_stop_fn_t fn, void *data,
>   }
>   
>   #endif	/* CONFIG_SMP || CONFIG_HOTPLUG_CPU */
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
>   #endif	/* _LINUX_STOP_MACHINE */
> diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
> index 8dcd5be67b85..ad01b7c5266c 100644
> --- a/kernel/stop_machine.c
> +++ b/kernel/stop_machine.c
> @@ -23,6 +23,7 @@
>   #include <linux/atomic.h>
>   #include <linux/nmi.h>
>   #include <linux/sched/wake_q.h>
> +#include <linux/delay.h>
>   
>   /*
>    * Structure to determine completion condition and record errors.  May
> @@ -175,6 +176,15 @@ struct multi_stop_data {
>   
>   	enum multi_stop_state	state;
>   	atomic_t		thread_ack;
> +
> +#ifdef CONFIG_STOP_MACHINE_NMI
> +	/* Used in the NMI stop_machine variant */
> +	bool			use_nmi;
> +	/* A separate function type to highlight noinstr requirement */
> +	cpu_stop_nmisafe_fn_t	nmisafe_fn;
> +	/* cpumask of CPUs on which to raise an NMI */
> +	cpumask_var_t		nmi_cpus;
> +#endif
>   };
>   
>   static void set_state(struct multi_stop_data *msdata,
> @@ -198,6 +208,8 @@ notrace void __weak stop_machine_yield(const struct cpumask *cpumask)
>   	cpu_relax();
>   }
>   
> +static int multi_stop_run(struct multi_stop_data *msdata);
> +
>   /* This is the cpu_stop function which stops the CPU. */
>   static int multi_cpu_stop(void *data)
>   {
> @@ -236,7 +248,7 @@ static int multi_cpu_stop(void *data)
>   				break;
>   			case MULTI_STOP_RUN:
>   				if (is_active)
> -					err = msdata->fn(msdata->data);
> +					err = multi_stop_run(msdata);
>   				break;
>   			default:
>   				break;
> @@ -713,3 +725,88 @@ int stop_machine_from_inactive_cpu(cpu_stop_fn_t fn, void *data,
>   	mutex_unlock(&stop_cpus_mutex);
>   	return ret ?: done.ret;
>   }
> +
> +#ifdef CONFIG_STOP_MACHINE_NMI
> +
> +struct nmi_stop {
> +	struct multi_stop_data	*data;
> +	int			ret;
> +};
> +
> +static DEFINE_PER_CPU(struct nmi_stop, nmi_stop);
> +
> +/*
> + * Instrumentation may trigger nested exceptions such as #INT3, #DB,
> + * or #PF. IRET from those would re-enable NMIs, which opposes the goal
> + * of this NMI stop-machine facility.
> + */
> +bool noinstr stop_machine_nmi_handler(void)
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
> +
> +	raw_cpu_write(nmi_stop.ret,  ret);
> +	raw_cpu_write(nmi_stop.data, NULL);
> +
> +	return true;
> +}

I think this function should be moved over to patch 5 and by having 
moved/subsumed patch 4, Patch 5 should become patch 3 really so related 
functionality is introduced in subsequent patches.

<snip>
