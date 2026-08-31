Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131454C6D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161224; cv=none; b=dNV9wE11x2YAHukQ4ojlSsStw0vWoVgYQV6lWwtdTeu4TIonoXZxKjpe1l/lmQRb9FXQLcNBZxNzSb963LfG7MNnd7AO5tI4GqQY3wgpMlk8IgfiBwdC8gIJJf3RITo3t1pBxfi0ykaydGhuAWEjLPPSC54gew0A67BSV6ZoE+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161224; c=relaxed/simple;
	bh=NJSjNKxk7UVV5IkXZUW1icC4wugzqjTWkRjzeCpiY/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s7A6L1A24P4CKjTdr2IEUA0V4sdA/rB/AG94RFeeeAdbaAsYG8j1Dx4Su8aMK/6ip53thn4BqJDrA306tfjU2Vjmf2kdOwzZXTfgeoBW14uQVnIx6tWYfpsvd7Dk+KnbHWnwobhxFuwfZIr44MEQQsZTJGMtj+PKW5crIZ7Uahg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5c655961faaso2166127e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788161221; x=1788766021;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pcgoboI+Bb0AHIqjcsWKmhJCOrwEFYSWyvEil53/SRU=;
        b=rLbn/Fejye4JiLgtdHnq+buGvtuC953jfPQUNqvHIlAJWPCsteqFlfxbJ9aVgU9hFV
         LhNBTI8X/ZH3kw9cnk8S/khkf3ONH2WUGWpvgTfZNdfMk6zm6aF+GJ4DHGWKsXXNaIgm
         5Nsn8fRwg7FEViaJE5fB2JxxqlDFk0OFOvBegHNdzTXqdDnXJMYHUKHCHv77MGTcDhZ7
         20/NTWbc/lq7lKxfkjGinYHRtItq7iNa9TwjFGCwGNbzFcH4F/vG3tyVtaAiQ9gXexuu
         y180H2f9V4yXCWcOJG/zpGmNWnvZ3jPmDE9qJRDVddyrc2iVPOUO+kUrQ7DScLN5NMXC
         NqCw==
X-Forwarded-Encrypted: i=1; AKwUvBwBSQ18vhDi2U/fxmEgesXvGfxfynXEbbvrZuRMpXkdbGHvRyvm4ZOAVcbUROMeLB6Z2vsVFb4mJOJmO88=@vger.kernel.org
X-Gm-Message-State: AFuF++lFfZHPD7fh5omrICgh5gqgTqvgft8/aHPcIS2/SADk5tBjPLtt
	3gIigPGlbJw0FSy0GDHPHVKcI00l8iCN2z+uFnwGtioGp/Wuduyz6uImJg/yXCt1
X-Gm-Gg: AYBFou2hvXIWClMCD3W87x9T2swkwgso5fFClQNIidL99TQKiAJq1kyuL1V0a6X2yMo
	qkHsjgLHTWBUHjzc7XhCT9ErRLHycl1nFJSFRRJq6VfVG9sg9YcpuBqJ2WErK08cuc5tzlh8c4C
	+PTX+GS2D5tjSB0XarOQ2LqOnZbkDbH0/hUIceMm0RPgciu5l6wJ4YP+AIHmAjnUoNP4tOYJHIO
	Y47+IFvYHeIbmjLbMvOKsY45URPriOZfApLrFasBKQfaBs0tDO1K/XDf3pKBpd6yb7YkIX5M9Qt
	wWrEjfOmyKkcG+gdqp1Zoc179Y/X7qauxfKZKxOMORVf37d1y14WemuBKC1uQUG4S3m5ICcNqA7
	SLFcbRF0EItp+9tpJKZ/OoFD+kkfQFRnrRN6Z5mFlh+nnjD/mVQezNikaSxbtsSNBFISInHrGBR
	jQrjxwx8lI+9WuJo8gnL7dlxxGd0ENCzIGQN4qRDhD7BxlNhIB6bxcCU91gVjnxB+AI6FeNJ41l
	4afF1ZozaK/6uETMlWI4bAGdA==
X-Received: by 2002:a05:6122:88a:b0:5bd:8c84:59aa with SMTP id 71dfb90a1353d-5c681777357mr11640291e0c.8.1788161220888;
        Mon, 31 Aug 2026 00:27:00 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c71ca1de95sm7437073e0c.4.2026.08.31.00.27.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 00:27:00 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-746d77537f8so1901253137.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 00:27:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoyjlWna1pmz+ISoTiHM9aWAR9IzqNFrp2D01xU5HRy36sTGp7HxkMc0KN4rdAgqI0luNoWAcoam4vLruw=@vger.kernel.org
X-Received: by 2002:a05:6102:f9b:b0:77f:7df:ddd2 with SMTP id
 ada2fe7eead31-785972e710emr9393256137.1.1788161220080; Mon, 31 Aug 2026
 00:27:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829195105.4173953-1-joshua.yeong@starfivetech.com>
In-Reply-To: <20260829195105.4173953-1-joshua.yeong@starfivetech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 09:26:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_3WoqOv_gsFnTpC61A48bQsmO_9FMT6PVAZ4bduedtg@mail.gmail.com>
X-Gm-Features: AcwNN1VNpwApm_cNNaV5_gp-0ahi5LN4GtBUOfohdJ4zOMTErKzIMnHRgt2jJ5w
Message-ID: <CAMuHMdU_3WoqOv_gsFnTpC61A48bQsmO_9FMT6PVAZ4bduedtg@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Honour pd_ignore_unused in the sync_state power-off
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Heiko Stuebner <heiko@sntech.de>, Hiago De Franco <hiago.franco@toradex.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

On Sat, 29 Aug 2026 at 21:51, Joshua Yeong
<joshua.yeong@starfivetech.com> wrote:
> The pd_ignore_unused command line option is documented to "keep all
> power-domains already enabled by bootloader on, even if no driver has
> claimed them". On an OF platform it no longer does.
>
> Powering off unclaimed PM domains used to be the job of
> genpd_power_off_unused(), which bails out on the option.
> Commit 002ebddd695a ("pmdomain: core: Restore behaviour for disabling
> unused PM domains") stopped that late_initcall_sync from clearing
> stay_on, so it can no longer power off a PM domain that was found
> powered-on at initialization. The only remaining path that clears
> stay_on is ->sync_state(), and it never looked at the option, so an
> unclaimed PM domain that the bootloader left on is powered off there
> regardless.
>
> Honour the option in the sync_state paths, for the PM domains that have
> no consumer attached. Those are the ones the option describes, and once
> genpd_power_off_unused() has bailed out they have no other power-off
> trigger, so they stay on as documented.
>
> The stay_on constraint is dropped either way, leaving the lifetime of
> the constraint unchanged. The PM domains that do have a consumer
> attached therefore stay under the control of runtime PM, which the
> option has never covered, and a PM domain that gains a consumer after
> ->sync_state() is not left pinned.
>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>

Thanks for your patch!

I did something similar in "[PATCH/RFC] pmdomain: core: Support
pd_ignore_unused with sync_state"[1], and Ulf responded[2]:

   "Right, I think it's time to consider removing it, unless people still
    find it useful ofcourse."

[1] https://lore.kernel.org/1cfa86b72b2a5aa2ade92f247dd318c9cb6ef2a1.1771267504.git.geert+renesas@glider.be
[2] https://lore.kernel.org/CAPDyKFq2it5TAEBBKBh+q+UiRsGYaORar0Q_42LCuxyKRLYj0A@mail.gmail.com

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
