Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889A7448D14
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 20:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788553612; cv=pass; b=OhF5z4XDzbEE5zJw/HfqtyJsERVG0VGTgJWwFjoadJmjjnYD15NE/DiU/mcwMVQ0hHms/ZUUE4CaPFf6m+0UPh/XAB4MpnwuiCXEyH38UypyNIvQyEnTkHcoVM+88rQFjjB7S/AF5pxH0BUpNWZkyVIkKPsVB2Slwjm5T6sGbd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788553612; c=relaxed/simple;
	bh=apsCJPAEvIxcNPrv06lf8gEHanZVwcDw0wrGmMSJ0Og=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ESNnUmEehfTCAsiQsHfTi1d3zOcDjuZs0ws1e+JDtPdY/mI9saSiEuOV8C1f2/MczRE2itecL1vMuaxwG0I6XJypTZMN2Fva2b8WCOBIyX2OKeZzTAmvrqAeucKNrNnYVU+Ax1es2SAgpLTHwM0HObNU6aL0Vok5fYtWcm/WEuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=haSTrzaW; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="haSTrzaW"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c20e70a0962so186699366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 13:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788553606; cv=none;
        d=google.com; s=arc-20260327;
        b=jbJKK6lBMkO9W77rvpiFRyCfoF8Y78XKHKXQUoX3ljGrRc0SGoXVAxHhd9obys71yb
         DaTivTWO5l5WoHEyk1b9yIcYX3EfOYx6ys4qZxni/oS0xKTACxrheA9uXerQxcJXQIoD
         TvYLh6pgts8T1By9F3q+mzLqXQ9adaJ63O6vDM9V2QFuwgHkauapwaM9i3ynmera16zL
         1CW4tQT3e1NaT7XDOHTzbGT1aSHXRDrkoAf1tqpjRbpMkrIUtoteLq0+l71df1miptgZ
         oEgVhpwoVX1k4kuprmUHa+Gg7pirHCOALztIHl8PURcODlJHMSi12+yQTvQtTgeUX5at
         DPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=uC9g/nTRfwFfgs5BRRrEUydMiSWINf/QbLL9mGYRBG4=;
        fh=P2ylUAa3YFxqLcLOiHcz2TYNSinzJcggetMz4tYbQt0=;
        b=ZXiPhzs17DXwAeT9ZN9r347ptczoS4sUmIkrbqxREgXLpWlagHEKcOXmolFnU5zk1X
         g30HcLpPNqWCeIXhYU6Dd0Xk+gqgngbmikSj+QHIbTE/nRiQahfgOkcr02wvxg2CcDeC
         kNgVpKx3t9IVJA2ebCkdSI9U8bydUuBthOgV7Ur7ZZ4e9vZZ9qIlEgUjzD4c/1dOs6GH
         ZH82k3oem0/3d2XAtireQCMlus5QOVsGXzQvIXvFW61f3o5iPQgYPXnolXuDeui9PCCD
         o9oWVpFdpuIYOzUao9fdAHCwJttnMSy1/fVKt/JqixPaYo7C1byN8MZ4dl5VGKVJXfix
         P1Fg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788553606; x=1789158406; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uC9g/nTRfwFfgs5BRRrEUydMiSWINf/QbLL9mGYRBG4=;
        b=haSTrzaWX5OJ04nXMEULYY0HKzjqkZgR04cImDdjtwUipEAEcdqRFwnzfNBoKJIUnQ
         p80NTflIJHwoySN4WuvJdtljR6Z3LU6/P9WgRxB7BI6zlhvfCTUMkKAOCFsTvr61HGNk
         cwaqZmdU6TW1H/AGStz7Sr8znLLY72y5HwpRCS0N0WJNkAA5E0m5TkWWqMAlnbbqFJic
         jxd3djtAa5GyQfK9+h0Zynju+QWPS/JepG+AvTY6auJzHueDTB622iy8CwtRdYvk5CoI
         437cGXCsF02dsrdcyRFei6r8KMCR324/D6UNqynZCBsiCvbAWHrPAuBH9hvU/bbROq3m
         cxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788553606; x=1789158406;
        h=content-type:cc:to:subject:message-id:date:in-reply-to:mime-version
         :references:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uC9g/nTRfwFfgs5BRRrEUydMiSWINf/QbLL9mGYRBG4=;
        b=SZWLRcQ0ovi/NjirV6kSACMgvRglPYRkTE0jLMpGvHAJeJpTdhK2gZ0fGnq+TJIhCy
         UyayYteFIDs+iIlyqrJkblbqW9i3kL1a4VnSfjNV78hoaMsdhDDR2HpjGdxsNjfnZ+AI
         wkTusVtXinpHBARpxTVJKe63g2CC9dr6vJq3TPoVFJuQet9q94DLRw4g9lKuj1XjqNe8
         0/pQsVENWeGIYDkE3Wyyi9bccC3bYBhdAL0qs0gKxs16JalC68jEqvMiMraw6fiZC+QZ
         800gl+TOQSd6CRLKJZFdm3i0p1X1xlsTyGnO/zu1KWP1O9sKatooX8fh+hHgTG0iaBj4
         55rw==
X-Forwarded-Encrypted: i=1; AKwUvBwmA8qtmTEqcb5QJQhjmqJUNf3vS5o45ujjjUAm8FI85NLapI/oALaVf9M0fQUCqEVrQV1gGaSjzg09gWk=@vger.kernel.org
X-Gm-Message-State: AFuF++lHdbr5KZ+wRiFjvk0krcpI/M81xwPlKLyNM5b+sz9klU7stl6V
	/GWHvlGp5JSmGirqoBOCINLYs+xLvOS4zem0Ct3QhHt3fsaAx5gSOkSlJ6Prl+vtmDdxDQ/vjtJ
	Iw8ArFhQltB6A67+OkPV6Itj5CEAfFx8Putou9TtwAw==
X-Gm-Gg: AYBFou2GvClX1XE25AY5RNW2iP4/8FcVkRR5O0k4WYipcYk4YhPfW+Ro17jehq4QvlH
	2G8BWU2WTqBXEXV6r1EJugTIjh/p4It24dX2eUpx94C2YXpaLPGB3J5VRAyoHiFFEV/v2kfGQi0
	W+A/pAZhjXTW+u5GLV9Qazu8S99xqu+fWb2VLxWSHMIbUNtxAT5JrITs/MeYjrJ5Y/xIf5bbwf3
	q+u7RTiX4C8oX9QcPugm09etHMF1EO3uAUXfWF9WB0k4L4RDuvtjmMxAwZ6gpZw/SIfeZBc3Ksz
	b1rmenKWW/C10B0HXayjc8P1avO4JbKwAqRigq5s9g==
X-Received: by 2002:a17:906:ba82:b0:c19:5572:d234 with SMTP id
 a640c23a62f3a-c260c6a0ea0mr658955066b.1.1788553605796; Fri, 04 Sep 2026
 13:26:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Sep 2026 15:26:45 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 4 Sep 2026 15:26:45 -0500
From: Angelo Dureghello <adureghello@baylibre.com>
References: <20250121-coldfire-global-pool-v1-0-382a7235c2aa@yoseli.org>
 <20250121-coldfire-global-pool-v1-2-382a7235c2aa@yoseli.org>
 <Z5h0vvL0B5ktd3sM@infradead.org> <ba7ea0f0-be38-49a7-b416-3dc62c7e7425@yoseli.org>
 <Z5h70TL6lSWzGA4f@infradead.org> <8b453664-13b6-430c-a865-9675edcdf369@yoseli.org>
 <Z5h9ZySKFwHRjg0O@infradead.org> <44398a86-cf85-4c7b-85f1-de9beedc72fc@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <44398a86-cf85-4c7b-85f1-de9beedc72fc@yoseli.org>
Date: Fri, 4 Sep 2026 15:26:45 -0500
X-Gm-Features: AcwNN1UeHDiIoMnhpwFKK6XEr1ozLUIj6HzYctMfqmwrWSoz_rKyl2uviZtEeDg
Message-ID: <CALSJ-wBWQQMWnex9=bhdtdg1QM4KJ6eRvHNOi54ZtTfznQ8SjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arch: m68k: Add DMA mapping operations for Coldfire M5441x
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: Christoph Hellwig <hch@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jean-Muchel and all,

just asking if this job is in progress, since i have the same
dspi issue open, and need dma eventually for other drivers.

I can eventually help on this, i have hardware for testing.

On Wed, Jan 29, 2025 at 08:32:52AM +0100, Jean-Michel Hautbois wrote:
> Hi Christoph,
>
> On 28/01/2025 07:47, Christoph Hellwig wrote:
> > On Tue, Jan 28, 2025 at 07:43:23AM +0100, Jean-Michel Hautbois wrote:
> > > > It really should not be hard.  The dynamic mappings already work fine
> > > > as m68k is using the generic code.  So the only thing you want is
> > > > to dip into the glonal pool for coherent allocations. For that you
> > > > need to select the DMA_GLOBAL_POOL config option and fill the pool
> > > > with dma_init_global_coherent().
> > > >
> > >
> > > Isn't it done in patch 1/2 ? Or did I miss something ?
> >
> > The point is that this is all you need.  No need for new dma ops.
> >
>
> Indeed, I tested it and it works fine.
> I have removed the test in fec_main to be certain, but I think it would be
> better to change the COLDFIRE_COHERENT_DMA conditional ?
> What sounds like the most efficient way ?
> I can' do:
>
> - #if defined(CONFIG_COLDFIRE) && !defined(CONFIG_COLDFIRE_COHERENT_DMA)
> + #if defined(CONFIG_COLDFIRE) && !defined(CONFIG_COLDFIRE_COHERENT_DMA) &&
> !defined(CONFIG_DMA_GLOBAL_POOL)
>
> I suppose it would be better to modify it in the Kconfig, but I can't find a
> nice way to do it without having a circular dependency:
> arch/m68k/Kconfig.cpu
> @@ -555,6 +555,7 @@ config COLDFIRE_COHERENT_DMA
>         default y
>         depends on COLDFIRE
>         depends on !HAVE_CACHE_CB && !CACHE_D && !CACHE_BOTH
> +       depends on DMA_GLOBAL_POOL
>
> =>
> error: recursive dependency detected!
>         symbol DMA_DIRECT_REMAP is selected by M68K_NONCOHERENT_DMA
>         symbol M68K_NONCOHERENT_DMA depends on COLDFIRE_COHERENT_DMA
>         symbol COLDFIRE_COHERENT_DMA depends on DMA_GLOBAL_POOL
>         symbol DMA_GLOBAL_POOL depends on DMA_DIRECT_REMAP
>
>
> I will send a v2 with the global pool.
>
> Thanks !
> JM
>
>
Regards,
angelo

>
