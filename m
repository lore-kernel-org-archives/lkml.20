Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916434;
	b=mDyn3xJZMRSsUMpc1ZqJCWrWLXidI2c3wCRfkeWk7xWJPFCd1Mg3gCsAbt6FOhp/1V7S
	 TPDyzunuNIchJuwiKw7EXM/q3y4rmKlmCDoy/9vE3Wi2QlL3AJszK6QRA9djFPzhXa/68
	 1OPSNsPfhLuupduhC37KKmjEH/+Id0fD+Not1vtRe4E56JCl7/fjUSPAcMdJJT+FFT1GN
	 3hf1dLkvAn2AqRKdLdy0+xZIWtvszR+Oi9v99VMG+L8zT+JnYOUm0raNHe9WBth6LDeQB
	 MEEVoE7ZvxePpYzRTTxFanb7aaXv5g1/o8YoXMpvEcusPLD48XVpaVmIqgSGw5S6o3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916434;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=fCqZ0Zd4HVCI/jRgXBSCy8S8OFyXtFOLF3BsI1zh8Sg=;
	b=0Id8jgaSsEcJ0aWzWxlUgWOgybelyLqmuIURe+749FJa224kmWBo7YudIZjDLUH6l5ln
	 kWduGjpuEjpYdTkDDFx9w97iCOSVOLBsN+XdcWVIdMxY+Z75uAAt5sGQ67bzHB0XUv869
	 WpOZNiFAlOyPcEnKkdY22sPSKsFE9BecLbqeOAJnt+p4JWfb9vwT0siWMQVJ9MOn/ama3
	 iriNGRZe9AY0Oe/QIQY6Zk6PjvMZNv/ZfkA1OXER0VkSmEC1S9b6DzcK3dkKNw5D640+a
	 zRK8x4fXIA86oSSXY07MP10FMdFgQk/nDZGWotANrZEyMjMe1+9vRlRXqR6RcfqYoRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC4D606A33B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFC4D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so3547859241.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:53:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916433; x=1795521233;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fCqZ0Zd4HVCI/jRgXBSCy8S8OFyXtFOLF3BsI1zh8Sg=;
        b=wVBMqCXTNgmL8NsN6IO6jywK/y5tZq7yk4xlNQvD7GvY9QZcyWcNlI6BoJ3XRb6ea2
         W1MZACCaG1NHI8juDK9ShxNW0La7wBJp28DynaD4FDh8JaTzuz8Zj8gGtR/EuGL7TaG3
         Uop7hhT7/I2+vSMWWzd43JbuKYLVZCgEYCbyYBMMHJD/TovojuK0hOSorrpuru8AhYgE
         Lge9XiULhFlwKkaNsRvh25JRKdlFn+S0VDkNaah8so1XeE0sNF5Zc6E/VdMW6D7qMfIu
         l8YN4omKLLmFUFZhxOO4HcFXvNXN05bcVkURQF9aiH2MPlXYLs5yEs0UfYpHNlIZOdJn
         3FBg==
X-Forwarded-Encrypted: i=1; AL+hErGQ6Ib+9DfPA7PFIKQnQpw66UXeoBaaoSO5nzqwLL+4tUmcNcBt8b4DS55qxCKTubfSbv+Dxvn7r+FTVUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WSx66ouxOtI/1Cq9aEqSFu4kQGTVHPHw3Kb1O7//7wiEAKthv
	ufs5Pa9lKVM8rmoCnKD/uqz7NtiPMrUlRrNumlMvGvFCFuDyEcJHKlq/P3ifke04
X-Gm-Gg: AYBFou2oJRR4D4VDCa+kDM6AWuY2osx4no3n/gCA2h8EdqzLSYNDe6dYcFHIrSTwTjz
	uHxWgiDcrD3KJaFP4w/O5p5EyZ+EE+vzKFlf2lxsxD4Eeg1Ce/B0roYcykiYtIBgp3i7uH3A/ix
	UV0uEahiGxVu6kJwLbkt50HHof6mNIYV43qiH+B4nm9HyI3ng68hh8vWqhTcpIRgdq5TzYw9V9u
	TWto7mI5MjO0gystwvfHogIbllQCDNBBp1xn4scc608xGrSo4pFYrbEwCoHzlf8Cje0xx6/DdoN
	r1OKhRXOFcm15cjA4vCKemiYyTZrJKLDuY2aKKrjSsEtbpVTw01/G3JBXmHnTuFdu9TUD6bYfMg
	zKNwEeFPhkWafvTEuRtIjAxlrigzSikugvBgPGQH6J2dWY2gfme98yzeQjZvURQVlQuxm/o5whP
	4JYKhmPXSxoM8RvAAUi0NPemFdQoE01fmplSLKvjOtwdxteKPVXIWGL9vmMGkqfGspWTq1uTDa9
	ktLXl2/RINOVmSL9Dyjtc6D8/uE0UvCbsaozll8T77KY0UZagO50qRHbtcxdmY3roVav7qRKt46
	LYK7UzgfP1Cx4O4bF8iwuf5ZmBlihN/3DohOkTOhp0uA7bzkOcdar7RelZlz87aptzc=
X-Received: by 2002:a05:6102:3585:b0:7cc:21cd:9b68 with SMTP id ada2fe7eead31-7d64d6f17a3mr5266082137.15.1794916432791;
        Tue, 17 Nov 2026 03:53:52 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69dfddcebsm2003774137.5.2026.11.17.03.53.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 03:53:52 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7d2b25786d9so3196973137.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:53:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEMdyyEQEGD/WTUj2r9SqBaZzRdl6eQ1dyeJV62qk4i3fUbnCVvXIObezIfRbwdILKmbfH/aXwbM65LBAg=@vger.kernel.org
X-Received: by 2002:a05:6102:578c:b0:7d2:c786:5a95 with SMTP id
 ada2fe7eead31-7d64d69dc95mr4808481137.13.1794916104363; Tue, 17 Nov 2026
 03:48:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com> <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 12:48:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com>
X-Gm-Features: Aa3M54o4xtj3bYccvEv51xwUP0A3vPBfjxtiJtpZqQUGyQco56wW9LsC221L5Po
Message-ID: <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] platform profile: Extract the core from ACPI
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: rafael@kernel.org, Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Armin Wolf <W_Armin@gmx.de>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jack Wu <jackbb_wu@compal.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel,

On Sun, 25 Oct 2026 at 00:56, Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
> Platform profile providers already use device-based callbacks and do not
> need ACPI types. The core is nevertheless confined to the ACPI build and
> refuses to initialize when ACPI is disabled.
>
> Move the implementation to drivers/platform/profile and introduce the
> firmware-independent PLATFORM_PROFILE symbol. Update all provider
> selectors. Keep provider-specific ACPI dependencies and the
> platform_profile module name.
>
> Isolate access to the legacy ACPI kobject in an optional compatibility
> object linked into the same module. Retain the legacy ABI on active ACPI
> systems, and initialize the class even when ACPI is absent or disabled.
>
> Use subsys_initcall_sync so the class is ready before built-in thermal
> and CPUFreq providers, but after ACPI has initialized its compatibility
> kobject.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Thanks for your patch, which is now commit 699041135f75b13a
("platform profile: Extract the core from ACPI") in pm/linux-next/

> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -1,4 +1,20 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +config PLATFORM_PROFILE
> +       tristate "Platform profile support"

I guess this can be invisible (perhaps "... if COMPILE_TEST"?), as
you have updated all provider selectors?

If not, I guess this needs a "depend on X86 || COMPILE_TEST", so people
configuring kernels for different architectures do not see this option?

> +       help
> +         Provide a common sysfs interface for selecting platform power,
> +         performance and cooling profiles. Platform-specific provider drivers
> +         map their operating modes onto standard profile names, independently
> +         of the firmware interface they use.
> +
> +         The core exposes per-provider controls under /sys/class/platform-profile/.
> +         A provider driver must register before profile attributes become
> +         available. ACPI is not required; on ACPI systems the legacy system-wide
> +         interface under /sys/firmware/acpi/ is also provided.
> +
> +         To compile this as a module, choose M here: the module will be called
> +         platform_profile.
> +
>  source "drivers/platform/mips/Kconfig"
>
>  source "drivers/platform/loongarch/Kconfig"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
