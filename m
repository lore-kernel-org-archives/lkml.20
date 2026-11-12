Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500089;
	b=Le0kztb0GVjq3OoFmvywW+FKzw/hkufC2pjRcYx1UO6McyzcXeGbYeuoAYIvPsummxts
	 niNHbvYdkL7eaH8D5LCQHvBsxx24GqM4Z1xG4q3aX5lJhTj6p0Nehk8mriGmaLpbuouAY
	 jHjaMqTiL9UgfyZkMMbUhRo46L+W5CF57uON7zvqU6XTFkYqDdm4Ldop0/XicXrDfbAsl
	 ZxcUGttvstM38d4imOa+s04pfALz1j152ywi6qBf9N5MOopMkFnjcVwEuCTTCwpdU0vhX
	 u/WlPsPptyk+qMwXcfIdYhjNPZ/PtDnbmLivc6BImS4X2H4Fns9wAqboFLnkKoV8Enw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500089;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=ukWikVJElZCBqR5bD/qtuuJkXnyU4/mK68AbGnGGZZg=;
	b=XvJ1kurtIOD09IQtaAhz5rkJAAHWossDS/j2IYGfPMtWrfVLbYveYmtafEaUY8Qa3bs4
	 yR7aX4x3Mwz11Xr+NJK+UVm44QkF3f+lGX50p51dj8ouepY/L4tuThU9ACajKxRAexbJw
	 GQzgJebIBJWkipMm+I8Bdn83ansAkm2juXIL9/+FQXMhHc/KE26GGOOXLcTHEKMiZ94km
	 TxqadgTfJk5O4WkBssdlTRROVZSN/y7yvp9YJOkUB45EjQxDw9lbmDr/rJ9xDAlUqwE7/
	 3Fncarp8khD5DVdyHaMoKBlecQ9bvDLSzXogBWNuN2P5it0WWLWMHmrAACUiAe136mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZoOyIESw;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=k5KUHA9a;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B136E606A31C;
	Thu, 12 Nov 2026 16:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B136E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ZoOyIESw;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=k5KUHA9a
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794500084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ukWikVJElZCBqR5bD/qtuuJkXnyU4/mK68AbGnGGZZg=;
	b=ZoOyIESwyA8V7dXrKpBvb3fXCZECeVgwhEiygKHhajCOIn4x55M/kuEkAAreOKAxZtyeVw
	GXasUq8HSWenyqrQvk7fALwZE8dgZ1WxxRQB22bfWuG7qPK370+QhJ6KB/mYaHMkC3uzRV
	tGgR2WtQkxiCbDAGpEOVyeWj9If87P8qZUmzh8sp/PVTsOs2G2Ad+FaouFCdF4yU/vuCBs
	ICEPErHGYLSwLYCvTadq/K4LU/pg7WRJnCDIrstwUSy/YkdG+CXvOYbQ4RdVIHQbmIG9lh
	++Okg0V08AyoG6w5qs8ibXy1X+lr0mhyLm0aM6AnLZctyX90qlzjQot1c2g+cg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794500084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ukWikVJElZCBqR5bD/qtuuJkXnyU4/mK68AbGnGGZZg=;
	b=k5KUHA9ahaWTVMgiChBlgtjPgWV5EF/yG2cWbHAzdOna9Z+X1WQcRk3jsBCMBINZrvrYpW
	hM5GWNAw0SPj0yDQ==
To: tirthendu.sarkar@intel.com, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/time: Enable HPET under ACPI hardware-reduced mode
 with hpet=force
In-Reply-To: <20261005075550.463089-1-tirthendu.sarkar@intel.com>
References: <20261005075550.463089-1-tirthendu.sarkar@intel.com>
Date: Thu, 12 Nov 2026 17:14:43 +0100
Message-ID: <8733t6t4b0.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Oct 05 2026 at 03:55, tirthendu.sarkar@intel.com wrote:
>  #include <asm/vsyscall.h>
>  #include <asm/x86_init.h>
> @@ -72,6 +73,25 @@ static __init void x86_late_time_init(void)
>  	 */
>  	x86_init.irqs.intr_mode_select();
>  
> +	/*
> +	 * ACPI hardware-reduced mode unconditionally stubs .timer_init() to
> +	 * a noop, on the assumption that no legacy timer exists. Some such
> +	 * platforms do provide a real HPET, so let "hpet=force" give it a
> +	 * chance to come up.

These platforms must advertise the TSC/CPU frequency and must have a
reliable TSC and a working APIC (deadline) timer.

So why on earth would they need HPET enabled. Just because some hardware
guy deciced that it's a brilliant idea to stick an HPET in such a SoC
does not make it useful. Nothing uses it, so why do you want to enable
it?

> +_     * Only hpet_enable() is wanted here, not
> +	 * hpet_time_init(): its PIT fallback and legacy timer interrupt have
> +	 * no hardware behind them on such platforms, and registering a PIT
> +	 * clockevent whose interrupt can never be delivered also fails the
> +	 * local APIC timer's calibration cross-check, disabling that too.

OMG. On a platform which advertises the TSC/CPU frequency the APIC is
not calibrated by anything. It uses the firmware/CPUID provided
frequencies. You try to support Frankenstein's hardware monster which
does not exist in the real world.

> +	 * This also covers hardware-reduced platforms that install their own
> +	 * .timer_init() rather than being stubbed (e.g. Intel MID, which
> +	 * sets up the local APIC timer only). None of them enable the HPET
> +	 * themselves, so it cannot end up registered twice.
> +	 */
> +	if (IS_ENABLED(CONFIG_HPET_TIMER) && acpi_reduced_hardware() &&
> +	    hpet_force_user)
> +		hpet_enable();

TBH, that's a horrible hack.

In the unexpected case that you can come up with a sensible and
convincing rationale why enabling HPET on these platform is useful, then
this has to be hidden in a reduced platform specific timer_init() and
not glued into a random place.

Thanks,

        tglx
