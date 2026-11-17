Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933544;
	b=AZFe6FEtEZciJ40KlZsu0fXEdjucy6mbHjP9N8Yp+tJhBKKXvWiKC967O6LmR51aeEfT
	 SmXuPLqFXpOhbtpaMTHs7CW2IopmEgbJ5XwPZKc25W0mUM3O+KkjC1CIea1jpHMgDWAhc
	 /OT4hjrmnk8HoT3NCH/dMRp9rtkmlwosL5M9r8Auev4l4DVKc+O2Q8bKpgiV96tYHAJkK
	 xLZ/eeyXaYjDjBNiLRSwZrlsFgO0f0yhznWvlP0sQUYmJtfdReW7LE6EyRJrUAunYapLs
	 mRfRQqh8wWRCwVNO6OtzMz+nNBpyISGB8XlLRlqAiCKVUilmnpoQPOAC4hpkFYcLefw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933544;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Z/XV0mK39zFS7JOXvDWInmC0g759RMa7DDlWP4M3P5A=;
	b=ZqZjCqC7IMZWKNOJcq/k40omxO7gS1H4Yz1DnWdN5DKzOB03/FTqPUi6J0xJg5wrT/x+
	 p53uE/zHBYZbsjCmOB53Qmh5Oc3y4RCqufZM9gnNiB/oJAPeX4SiPyZ/zK8ZJKsERXLII
	 QqdeJxNdpYB0Eg7PjiSidoIBEMmvDYIHfdHOsg15sPesZID0kb1GF2Fj+fHHBTIgQaqGE
	 lLa9cqOG/DoVazc4Ogx+EZ3S3hmfenRP/bhRbuUc4HCkPjHoyOvNn/O7F8GkwDAjNw3w7
	 V0v5fQKDfGYJgb6Mq5UFD7yXZP0UOHkL9wEDAWOZLPup9W4mhFzmsqFEq5lPcSldGyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7355B606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7355B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so1522641137.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933542; x=1795538342;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z/XV0mK39zFS7JOXvDWInmC0g759RMa7DDlWP4M3P5A=;
        b=n0pHm8bI+AqToKJZYPUkOC4Cv2gcG+rwKAi2NNToUaqCZcUWqErRPGeOsgkxJTETBW
         T76ADCom9BqR332batGwODiy66HgDFf0yHj0F46klSxJdOiILyEDhjG8kl/ZPId2V8oy
         MFRN7WPDroRcRk6+7owSWIczFMQ/3fzAGTh3KbyZefGml5EGV4Rjl5loyZxNX8Pnvbyi
         kjnjiMh/Z/QESchFyilGIffihzm2NavysXxZPkBNMzrOttD3uezjJPn6uHHAsJjLZiyq
         l9UqKRaKyJNrqj5pp/J4WXH/YWp3KsTWTfXuXDW6quk0NykO4JmOKIxUPIL13tw5/PbO
         OPCg==
X-Forwarded-Encrypted: i=1; AL+hErE8aLfw1eUbWr643cxO5KuQOsj2Z2AImHnAlGhGG0T/o7K3+Cx28f8tLi12zKTF8jcT3zD+unc4fmoHoC0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CSgPRBkQi3Gu1KvNalq8cI9MLnjKdylTOaM2Cpn2FAcv8E0rY
	c3onrE2y5BO30dlc7GyqOicVCuMjI/NbSgGe1zT/9YD3tquFGQV6xbwSBANRcCh4
X-Gm-Gg: AYBFou2cRJqbTv9EIF5y2oZIz1prx4v5Bl1GctG44X6vMEXV6n1ZU6EJxgYTKFbtd0/
	lNINQdcx3O6PgU182lIkmPlSbh25lpW++30IbAwcS5NUcdQfgRsyc5iGi0rEh/C4QOzV2xroyl5
	5DOE9cptUuCmoX4OW1hb+I/7dswXnQzMYET5g+VSgKlhDBFL9Ba8XKz7lzL7nY1V+IwFp2Niwek
	ya0kFKpU9doonPJntx7PCbiu/RD4V8nKXKtNL108IS+jqVlfDPW8/zMY3D7R3XCigZuoc7abgTN
	oZsjTIO6BlfeRPARZnZvbA8guK88k6m9lL0QNr03mHZrSDqJXpwgwkZwHpBaxb1/6P3nDXVy8to
	BPZ29oP3GA56UNS5gqGX23AfLI2Wsbf3mR/qfSXolXhAXucyZ6IziejSEdD4JP1KwYJY9F79PA0
	Vbz59B+z0JCHMh48kbuCt7Z8kGhZ/qlJzG8t35jx8b5yd0IfUlN/CHuKegZ6iPnUAKm6/fFaBwu
	zY+GJrDyrJ6NpICPioUXRnq3bzNLvv/pOCRr6tmt0zXOq/f2pZ6XWJw5fJJGR7qCFEfZBHHdHcO
	gf1vRudG9EkKfkTRXBcFE8o9pIVcyiBZF/HJA4K3jKtu3GHJs9LdCIlGrTEuvNYostJlB9Ivz3g
	eJhuJGE6HWRBo
X-Received: by 2002:a05:6102:a50:b0:7cc:118e:7bfe with SMTP id ada2fe7eead31-7d64d7a95c4mr4371251137.19.1794933542329;
        Tue, 17 Nov 2026 08:39:02 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a400ff8sm61055241.12.2026.11.17.08.39.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:39:01 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so1522618137.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:39:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH7//ducz7mIVGp81Ff1k98KWtIHIsF/cnOCGesidvMiOpxWONw+MShzdvSLXavqzrjcHRvpXfDAxqyQeM=@vger.kernel.org
X-Received: by 2002:a05:6102:50a4:b0:7cc:1ace:fd06 with SMTP id
 ada2fe7eead31-7d64d7a9d5amr4459124137.20.1794933540494; Tue, 17 Nov 2026
 08:39:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024223501.1420953-1-daniel.lezcano@oss.qualcomm.com>
 <20261024223501.1420953-2-daniel.lezcano@oss.qualcomm.com>
 <CAMuHMdXJOpcC3a6wMXF_m=uNjuqSO1Z3kyM7Az1uP_2GBurOvA@mail.gmail.com> <0de1444a-a0ba-4e16-a480-74a39c865ab6@oss.qualcomm.com>
In-Reply-To: <0de1444a-a0ba-4e16-a480-74a39c865ab6@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2026 17:38:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWfH+_4ijxko=LS_P6b1Y76WWDc8m4xL6qW1H+qKRQ98A@mail.gmail.com>
X-Gm-Features: Aa3M54oLa7UUmy4CFc0JRC-Lz0IWxEH7iP1kR67WyO7NUNvhNNuybpNvCvDbePk
Message-ID: <CAMuHMdWfH+_4ijxko=LS_P6b1Y76WWDc8m4xL6qW1H+qKRQ98A@mail.gmail.com>
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

On Tue, 17 Nov 2026 at 17:03, Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
> On 11/17/26 12:48, Geert Uytterhoeven wrote:
> > On Sun, 25 Oct 2026 at 00:56, Daniel Lezcano
> > <daniel.lezcano@oss.qualcomm.com> wrote:
> >> Platform profile providers already use device-based callbacks and do not
> >> need ACPI types. The core is nevertheless confined to the ACPI build and
> >> refuses to initialize when ACPI is disabled.
> >>
> >> Move the implementation to drivers/platform/profile and introduce the
> >> firmware-independent PLATFORM_PROFILE symbol. Update all provider
> >> selectors. Keep provider-specific ACPI dependencies and the
> >> platform_profile module name.
> >>
> >> Isolate access to the legacy ACPI kobject in an optional compatibility
> >> object linked into the same module. Retain the legacy ABI on active ACPI
> >> systems, and initialize the class even when ACPI is absent or disabled.
> >>
> >> Use subsys_initcall_sync so the class is ready before built-in thermal
> >> and CPUFreq providers, but after ACPI has initialized its compatibility
> >> kobject.
> >>
> >> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> >
> > Thanks for your patch, which is now commit 699041135f75b13a
> > ("platform profile: Extract the core from ACPI") in pm/linux-next/
> >
> >> --- a/drivers/platform/Kconfig
> >> +++ b/drivers/platform/Kconfig
> >> @@ -1,4 +1,20 @@
> >>   # SPDX-License-Identifier: GPL-2.0-only
> >> +config PLATFORM_PROFILE
> >> +       tristate "Platform profile support"
> >
> > I guess this can be invisible (perhaps "... if COMPILE_TEST"?), as
> > you have updated all provider selectors?
> >
> > If not, I guess this needs a "depend on X86 || COMPILE_TEST", so people
> > configuring kernels for different architectures do not see this option?
>
> The goal of this series is to make the platform profile firmware
> agnostic so it is available for all architectures

Sure... Are there any users of it on these architectures?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
