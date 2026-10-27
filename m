Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793089922;
	b=yZmUaqFieD2+fB2b6BetrZjf/wXASHKb2qVCD35fi2ZnUrO9mjrF7PTpRMhJOfo+0gaa
	 Rt8pnjxQHk6RtSY1cfaJT1psp1ifJETJfU8M5jAu4E7GuSyQBfToRMdAgN4ueEX4FgjQA
	 MLBP2ojVvbNnwaQVybcgThVrz70FZyDXzY68uoy4CEJtT812AoAJRARByFinQyaFUc6T7
	 qGpm3rbmslwQXGARb8P9gwRfmMsPuXs1w2held8i+Bps0b0zY/+Wb4ej/xJZDLyUcyNza
	 jnEDj8TzRwQ30mIrs5hQcZzeVmVbXjKI4UJMBI6eO9KqaPSd6bij+71+Pk7PZXG2edQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UynfW7iNvibXVGme9+4+y50qRrX7DGhKBqz5uurKF50=;
	b=YYAvl1qnMTZe4oPIbGMuMGZHOmm9zk+TfMrxIIr9O6a3WuZMdFrRJODkw7yfWmUuueBy
	 a7RBGdPrs4sPlgYLCsDWY3D91/YPUaeFjsHE4V4mlvIBZ2/kW9ct1ABjVwP8XCooFaM+k
	 I6mSq2vXWnMLxheqICWv8PuUWvnmM6tfnXoaz2dQ1dNzt7IYVbLjwyVSBLnfxnIejiq2D
	 BuisPQ6o+op5VoKn7xesgkzQKuGxxkp8vhLmx2TWtogSEraJZa2wt6A/Lpx9veZxPX0uU
	 h9Co4r/LbKdlKrlRkuTAjvNmFA7JjyCkaMQvw4b7KGxay9yv6sbM5jZZkslFX9QRJsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BsP2BtHE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD15606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCD15606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BsP2BtHE
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1846bc43c28so4397058c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:32:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793089921; cv=none;
        d=google.com; s=arc-20260327;
        b=hRVPJHw8mtlroq0LD9n0GKRm6GBPcJg3yuQ1djvCVXKIn6p4gKsdZBXAUcVHcdNBAe
         ceOaa8BufnjrJ70jx7UB8dNGLlQwGN0As6mEWygaESci1fdJNUkDQrYxb7D8ZAAShqD0
         Ww/u8IHYeYM/CEJPffrWE27rLnba3YMvN5mcKjJQBvK4hnIK6yBTNoFz0UnQWj7FR9Kc
         xgsU4NGWjQ1r6x4+rhnQtgoPPkMVeRz0TnmxC+RE+eT7dI0D1aj1aWeLo8ScjXjarsYD
         LQ0rvCTd8+X/j2vDz9XEb1G0mMjUfDP8xrFS9/s+xwJioNrW+bt9JU0dw47c7yXMZ3OH
         U9jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UynfW7iNvibXVGme9+4+y50qRrX7DGhKBqz5uurKF50=;
        fh=YIhWsqr1djnQ31OWLc2hUW5fa8FmQLOgnxkTC+5w930=;
        b=VZq4DuDXLtKvf14A/6f1/6kWqoouYovSXVrhXRoEdJGmc+i2Es5d44Orx6nRAPnznD
         0wIWX2v7Gnsnq/TAkJtAfQiumaO3KRhHcxRsNfJcTtR/4rUpyXZnjRztH39vAekzZFny
         ovVM77J7v2HL7xihJRME4VPpyXwB6fW67JxbdRq9/b6mIiolqvV2sThHxnVUbYMDnjC5
         VQ1IoA//ESgYs3rPpTyMS4Fm1ZU5G0WAfRThP27MaHJ4Znw+k8GgJ/c0qB+kpWlg9jmc
         VspvQn/iW+7e8xLy1FkocunKn3WiToIGn09zJAf5T5KSx4FYd4zNFVL+Zv93LVkq8Ztb
         cOpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793089921; x=1793694721; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UynfW7iNvibXVGme9+4+y50qRrX7DGhKBqz5uurKF50=;
        b=BsP2BtHEv0wXTPACcvoDY2idUZIDQOphHgDfe3DrH70XbaArBHqSgI+rwn0A+Pk1Ap
         2wZSkAPH3wDoJzdLXVIe9emBW+ugoYWV5ntAzIOuYe/GgRGNRgc7UH0z9lmJou4disZP
         k8URLHsDR5BO+ycsPJhhoUX2UG5QLu1GI0wmFb1NW7jMLI3fVnuDiMAaDKIqKZRW8Gup
         LzdI2yBHZv+Sk50ZCl+N9D3GRe3QZPu8BygMWqaOoNMj86kzXvwYEvZR+0elEyz7Wo84
         EUOpx7WGDb7hKf50BepHtsdYotLV+CejhSSJKX/b2HmsTgVuUbE5J/crIfEe+GdvAH2F
         IRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793089921; x=1793694721;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UynfW7iNvibXVGme9+4+y50qRrX7DGhKBqz5uurKF50=;
        b=O2IwqxNq5rtiqVE5VPHLALrvr0aeSOP5s7yAaI7ygxOY9SKZZL1rJ3WPjWRfPQjMxM
         FT1mk4ZBAf9K/1WKbWSgIsrozggZPphGD4qahW6zHlsZiYBnXxHeEjZAaI9ZH8aiEJbR
         8Ybl+0XDSh8ai63k3sYpwVbY+xK9RAEd+4UBnqmnuSEu2Na276xQ7tVKBtmdU87Msr15
         0G2NyzMT7bsNlC3as64m+uJozW/ZGKrYNNfdKRIj2vIgn7BHMMgAqiU/h0YbNiCuSceo
         amhX8a2U7oLW3rzZlyuCzFjduQ0uNimShiSFDT9wjE/p57sukHEYz27+x8ugrX7n0zHJ
         jXgg==
X-Forwarded-Encrypted: i=1; AKwUvBy1wE4RcIPoj24M6D5QDfNPl2TxLUFjrtxCzsaKgIxEcbe0EZQxQG8Pcyhabpcqiqeqyleq6qhn+ly99TM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAoHujDSuFLJCc19hDDXQ8cIOJ2feukDY59yjVUR6HXVbJo8m/
	V8jPN289W8ATFnvhP5Cxob2AMj/673A5FoOnwi+gkMNMoyUHmQWUWz3YNKATMYe0nzBCiJw8lNm
	Q4yk6nY8FMKFjjNCpmGxL/bbrfMzN0Nk+8jODlgSb
X-Gm-Gg: AYBFou0mudpc4CkvMDg3Hk7A+b2kNiTI9671M/LQbv31+SPW8+UMvx2LyOB6KUbJns0
	1EzsFXYIbyDgYVzHcBrqMExZudMz7ZD4wWT+CimezOWlGvK1hE++4+XT/ROcBFw6IiACP29NpX0
	viHRj1fDFGYxIew+E37elyBiHPcWbaBJW6EzIIOy9gvMXU/smiz8Cynqpz6mtvJVyN4GMoVcSkp
	TeOgUA6bFCvKj3Uz89aEaTvTZMvE6pkrtmIqS9I7/tqxwzXVP8yQQCHSUbwRecpdfeAjDg/0tp5
	B7DdKyqONA0pSaoSRWpboGPQ5ANcfxmmQscpveNJ+CP6irxs8TfMUmhPqTosp2khSNRFl5sFHCZ
	pjrfPY/aEe5HUt22CbTijgjmzl1s+ya+MOA+550xdbUxmtQMCdkqVC6NJ8u/0qUO086U/
X-Received: by 2002:a05:701b:2719:b0:14c:c947:6afb with SMTP id
 a92af1059eb24-1993505eb6fmr12920689c88.15.1793089920040; Tue, 27 Oct 2026
 01:32:00 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <auA7FdubFEDVPB7v@chrisdown.name>
In-Reply-To: <auA7FdubFEDVPB7v@chrisdown.name>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Oct 2026 09:31:23 +0100
X-Gm-Features: AclHuK9Z31j2srRPq0cvI1MA14RltVYpiKhG7tlR1MRKpnbY3pyvJ0pGLxERO2E
Message-ID: <CANpmjNMunLgXHRqXgW3LnniCX50CLbLYsE3DpY7h=cuvu2vSkA@mail.gmail.com>
Subject: Re: [PATCH] kfence: Allow selecting static keys mode at boot
To: Chris Down <chris@chrisdown.name>
Cc: Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Oct 2026 at 06:48, Chris Down <chris@chrisdown.name> wrote:
>
> KFENCE can gate allocations by toggling a static key for each sample, or
> by leaving the key enabled and checking an allocation gate. Static keys
> mode saves a load and compare per allocation, but sends IPIs to all CPUs
> twice per sample interval.
>
> Which tradeoff makes sense depends on the host. For example, on machines
> with many CPUs or latency-sensitive workloads, the IPI cost can outweigh
> the saving in the allocation path.
>
> For this reason on some machines we prefer to have static keys, and some
> we don't. However, today this is configurable only by
> CONFIG_KFENCE_STATIC_KEYS, so this means building and shipping separate
> kernels. It also for that reason makes comparing the modes on a
> particular workload more cumbersome.

On which systems have you found static keys to provide a significant
improvement? Can you share benchmarks?

IMHO, I was thinking of deleting the CONFIG_KFENCE_STATIC_KEYS mode,
because on most systems, it's not worth the complexity for the small
(if any) performance improvement anymore.

> Let's add kfence.static_keys= as a boot parameter so that the mode can
> be selected per host. The default still comes from
> CONFIG_KFENCE_STATIC_KEYS.
>
> Testing with the unoptimised branch layout showed no obvious changes in
> performance across allocation sizes.
>
> Signed-off-by: Chris Down <chris@chrisdown.name>
> ---
>  .../admin-guide/kernel-parameters.txt         |  6 +++
>  Documentation/dev-tools/kfence.rst            |  9 ++--
>  lib/Kconfig.kfence                            |  4 ++
>  mm/kfence/core.c                              | 47 +++++++++++--------
>  4 files changed, 42 insertions(+), 24 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index e75344f4e0cd..cda98e1b0b68 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2989,6 +2989,12 @@ Kernel parameters
>                         Format: <unsigned integer>
>                         Default: 75
>
> +       kfence.static_keys=
> +                       [MM,KFENCE] Whether to use static keys to set up
> +                       KFENCE allocations. Ignored without CONFIG_JUMP_LABEL.
> +                       Format: <bool>
> +                       Default: CONFIG_KFENCE_STATIC_KEYS
> +
>         kgdbdbgp=       [KGDB,HW,EARLY] kgdb over EHCI usb debug port.
>                         Format: <Controller#>[,poll interval]
>                         The controller # is the number of the ehci usb debug
> diff --git a/Documentation/dev-tools/kfence.rst b/Documentation/dev-tools/kfence.rst
> index b03d1201ddae..15212ea1047d 100644
> --- a/Documentation/dev-tools/kfence.rst
> +++ b/Documentation/dev-tools/kfence.rst
> @@ -259,10 +259,11 @@ SLUB) returns a guarded allocation from the KFENCE object pool (allocation
>  sizes up to PAGE_SIZE are supported). At this point, the timer is reset, and
>  the next allocation is set up after the expiration of the interval.
>
> -When using ``CONFIG_KFENCE_STATIC_KEYS=y``, KFENCE allocations are "gated"
> -through the main allocator's fast-path by relying on static branches via the
> -static keys infrastructure. The static branch is toggled to redirect the
> -allocation to KFENCE. Depending on sample interval, target workloads, and
> +When using static keys mode (boot parameter ``kfence.static_keys=1``, which is
> +the default with ``CONFIG_KFENCE_STATIC_KEYS=y``), KFENCE allocations are
> +"gated" through the main allocator's fast-path by relying on static branches
> +via the static keys infrastructure. The static branch is toggled to redirect
> +the allocation to KFENCE. Depending on sample interval, target workloads, and
>  system architecture, this may perform better than the simple dynamic branch.
>  Careful benchmarking is recommended.
>
> diff --git a/lib/Kconfig.kfence b/lib/Kconfig.kfence
> index 6fbbebec683a..2b2ad21aa36c 100644
> --- a/lib/Kconfig.kfence
> +++ b/lib/Kconfig.kfence
> @@ -70,6 +70,10 @@ config KFENCE_STATIC_KEYS
>           enabling and disabling static keys invoke IPI broadcasts, the latency
>           and impact of which is much harder to predict than a dynamic branch.
>
> +         Sets the default for the "kfence.static_keys" boot parameter.
> +         Selecting the other mode at boot adds one extra jump to each
> +         slab allocation's KFENCE check.
> +
>           Say N if you are unsure.
>
>  config KFENCE_STRESS_TEST_FAULTS
> diff --git a/mm/kfence/core.c b/mm/kfence/core.c
> index 55d5c114eadf..cfbefca5b78b 100644
> --- a/mm/kfence/core.c
> +++ b/mm/kfence/core.c
> @@ -119,6 +119,9 @@ module_param_named(deferrable, kfence_deferrable, bool, 0444);
>  static bool kfence_check_on_panic __read_mostly;
>  module_param_named(check_on_panic, kfence_check_on_panic, bool, 0444);
>
> +static bool kfence_static_keys __ro_after_init = IS_ENABLED(CONFIG_KFENCE_STATIC_KEYS);
> +module_param_named(static_keys, kfence_static_keys, bool, 0444);
> +
>  /* The pool of pages used for guard pages and objects. */
>  char *__kfence_pool __read_mostly;
>  EXPORT_SYMBOL(__kfence_pool); /* Export for test modules. */
> @@ -845,7 +848,6 @@ static struct notifier_block kfence_check_canary_notifier = {
>
>  static struct delayed_work kfence_timer;
>
> -#ifdef CONFIG_KFENCE_STATIC_KEYS
>  /* Wait queue to wake up allocation-gate timer task. */
>  static DECLARE_WAIT_QUEUE_HEAD(allocation_wait);
>
> @@ -878,7 +880,6 @@ static void wake_up_kfence_timer(struct irq_work *work)
>         wake_up(&allocation_wait);
>  }
>  static DEFINE_IRQ_WORK(wake_up_kfence_timer_work, wake_up_kfence_timer);
> -#endif
>
>  /*
>   * Set up delayed work, which will enable and disable the static key. We need to
> @@ -897,17 +898,17 @@ static void toggle_allocation_gate(struct work_struct *work)
>                 return;
>
>         atomic_set(&kfence_allocation_gate, -kfence_burst);
> -#ifdef CONFIG_KFENCE_STATIC_KEYS
> -       /* Enable static key, and await allocation to happen. */
> -       static_branch_enable(&kfence_allocation_key);
> +       if (kfence_static_keys) {
> +               /* Enable static key, and await allocation to happen. */
> +               static_branch_enable(&kfence_allocation_key);
>
> -       wait_event_idle(allocation_wait,
> -                       atomic_read(&kfence_allocation_gate) > 0 ||
> -                       !READ_ONCE(kfence_enabled));
> +               wait_event_idle(allocation_wait,
> +                               atomic_read(&kfence_allocation_gate) > 0 ||
> +                               !READ_ONCE(kfence_enabled));
>
> -       /* Disable static key and reset timer. */
> -       static_branch_disable(&kfence_allocation_key);
> -#endif
> +               /* Disable static key and reset timer. */
> +               static_branch_disable(&kfence_allocation_key);
> +       }
>         queue_delayed_work(system_dfl_wq, &kfence_timer,
>                            msecs_to_jiffies(kfence_sample_interval));
>  }
> @@ -956,7 +957,7 @@ void __init kfence_alloc_pool_and_metadata(void)
>
>  static void kfence_init_enable(void)
>  {
> -       if (!IS_ENABLED(CONFIG_KFENCE_STATIC_KEYS))
> +       if (!kfence_static_keys)
>                 static_branch_enable(&kfence_allocation_key);
>
>         if (kfence_deferrable)
> @@ -967,22 +968,29 @@ static void kfence_init_enable(void)
>         if (kfence_check_on_panic)
>                 atomic_notifier_chain_register(&panic_notifier_list, &kfence_check_canary_notifier);
>
> -#ifdef CONFIG_KFENCE_STATIC_KEYS
> -       register_reboot_notifier(&kfence_reboot_notifier);
> -#endif
> +       if (kfence_static_keys)
> +               register_reboot_notifier(&kfence_reboot_notifier);
>
>         WRITE_ONCE(kfence_enabled, true);
>         queue_delayed_work(system_dfl_wq, &kfence_timer, 0);
>
> -       pr_info("initialized - using %lu bytes for %d objects at 0x%p-0x%p\n", KFENCE_POOL_SIZE,
> +       pr_info("initialized - using %lu bytes for %d objects at 0x%p-0x%p%s\n", KFENCE_POOL_SIZE,
>                 CONFIG_KFENCE_NUM_OBJECTS, (void *)__kfence_pool,
> -               (void *)(__kfence_pool + KFENCE_POOL_SIZE));
> +               (void *)(__kfence_pool + KFENCE_POOL_SIZE),
> +               kfence_static_keys ? ", static keys mode" : "");
>  }
>
>  void __init kfence_init(void)
>  {
>         stack_hash_seed = get_random_u32();
>
> +       /*
> +        * Without jump labels a static key is just another dynamic branch, so
> +        * static keys mode would only add the cost of toggling it.
> +        */
> +       if (!IS_ENABLED(CONFIG_JUMP_LABEL))
> +               kfence_static_keys = false;
> +
>         /* Setting kfence_sample_interval to 0 on boot disables KFENCE. */
>         if (!kfence_sample_interval)
>                 return;
> @@ -1175,10 +1183,10 @@ void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags)
>         allocation_gate = atomic_inc_return(&kfence_allocation_gate);
>         if (allocation_gate > 1)
>                 return NULL;
> -#ifdef CONFIG_KFENCE_STATIC_KEYS
>         /*
>          * waitqueue_active() is fully ordered after the update of
> -        * kfence_allocation_gate per atomic_inc_return().
> +        * kfence_allocation_gate per atomic_inc_return(). There are only ever
> +        * waiters in static keys mode.
>          */
>         if (allocation_gate == 1 && waitqueue_active(&allocation_wait)) {
>                 /*
> @@ -1187,7 +1195,6 @@ void *__kfence_alloc(struct kmem_cache *s, size_t size, gfp_t flags)
>                  */
>                 irq_work_queue(&wake_up_kfence_timer_work);
>         }
> -#endif
>
>         if (!READ_ONCE(kfence_enabled))
>                 return NULL;
>
> base-commit: bae9a042b03b27924c6fd5bdc00a20d6a44d6041
> --
> 2.54.0
>
