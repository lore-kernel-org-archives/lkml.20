Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5549E37419B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816693; cv=none; b=r10+zcjn/YmDo+1N+AJhShYm/UszRbvuIdXbQgxRHczQPja+FGu8lzIagXAx4N5WBMRVJHrhHHMJq8k8PYo8U3oCPmVKMYaKDPc8yVS7AXRrqfM8GRqRPK3vc8pM7BR3YMycx05XpkQIj+cVAPBFa4/QAoTiOjHwfXDLZjjaU8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816693; c=relaxed/simple;
	bh=ggU062oNDv6dCZRK0WhK9Rj3itfFVRSGgrnD6N2LKKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AZjItKZ6ap5mk8au0v5NAvcrB0Qq6ZNfr2aYS4tKmsULb0L4DATVHBhcaZH3/bzkJXsSmiGekkx5yI8XsMQ8dwUdHhSN7GqvzaldwVNA7yjqXAeBUUyRHx5pAv51ncdGXp0xoDPzHa9+QKLGDB5+UiYe452gztT07rqQvqm3IL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-782e0fc1e55so593015137.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816691; x=1788421491;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TAq2mnIxXFzO957tO9XR1Q6W7W89hYvIMjgxkFCKtOc=;
        b=PWBalC6mArXp4Nh/eUBBnykvnZAfrkG1KbcsJ97TVAey9cnTnWjGH4/foTZRWA3tot
         oWySP1a9/UU1TCH9bsqXPLTQQG1RNg7zoX8AhZ/gQv6C3OzImTQvwYdFUDc1vqxJ5ryp
         OZqx56hhCiOeNMq1DAIl+75u8oGI6rfcQPa0WlHjSyR/4ITth9XfxcvvL2Xz5fOgpq6j
         Hfrats11bqfd0AyJ/ExPP5YAwD1NIwxw5ne3gQwhje7aS216WRWIiEpzSrDLw8FNoPkC
         hmO55hfPSXyCITvmsnnegXFm7u8vVaGjH/hy51TABkOMirV+Qk0+CAoXVoxffP5ER209
         N/vg==
X-Forwarded-Encrypted: i=1; AHgh+RqFVjrXcCrLzmGxI6e2HT1owjKJwZ7Ix7rPSbuvfZ2csrFxG8MPP8p83uw8ZhypYi1tzgj64/BybflwdY0=@vger.kernel.org
X-Gm-Message-State: AFuF++mHTJhINSjx/SiZKKTyGODW8UfAdiNTGrUdbniTP9Br6m6hx1xf
	pA/EmX6wY+R1Sj2nPd9lB7JPsR/fxHOE60p9+IqBzMf6fc+JeVJL8Zwuu5UWLJGz
X-Gm-Gg: AR+sD13LcZ7otR1/Y97nn6aWrG6gnP9D1FBL/Pahi9k2/53MzF/z7AJkeFxW4LURpCC
	l0uMvqjdOCrJK1YIzAU49VMoP8hiW+JfzZMIBuA+G9y4EPhagMXVMo6XiVTt73YflanXZrlo1oh
	/TZuROht59/ZHHSnmFg3K75EFVOcnvowfoqCMzVtDYkQzTXEtcbQ/McTj+xxovzlLCuv3FrV0QW
	WYRpfu44yWgiwURHI5Lq2o3095r0G+qOeCbzVCsWdsU+IP9HX4CLZJk0Q62/wrOlSWZowYlGhgS
	dCFJ3j/23Kk6JLApswuFNq0pBKQvc3lPq5FjtfsyxU/wZ3xGljDm7lzXyFtQk/O1dT6WeLxK1Bk
	NrtWrarSkQn4uvEqfkHe4PcwCDxHmg8NoIByovBMqzT1r/7wVCxZFdvaPhHCJncDSs1ZGCwVLRk
	41npxLsWmJtyc8mdRz4BcYACoy4rKEo45UZV3vK2KIfNPtpOd6phw2k7cN+N44QvlAy8SpWP9Za
	u26l6gOzxtf6UYia6EDSxtrHKmnNM+4oaqZ
X-Received: by 2002:a05:6102:510c:b0:784:94dd:5389 with SMTP id ada2fe7eead31-78494dd7348mr718177137.13.1787816691050;
        Thu, 27 Aug 2026 00:44:51 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97ccc0f4963sm2261037241.12.2026.08.27.00.44.50
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 00:44:50 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-782e0fc1e55so593008137.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:44:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoIYXPfuumFrKofM3R+ehhBwLtiDOUAp9teAj2hwB5X9bNPGQ+cRwge7PlPecnezxB9asxa8uk41Bc3UdQ=@vger.kernel.org
X-Received: by 2002:a05:6102:50a9:b0:778:9e3c:5760 with SMTP id
 ada2fe7eead31-782c1a00971mr4010623137.11.1787816690046; Thu, 27 Aug 2026
 00:44:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1e519fb24aa5521788d69cc7980665ccbc227b14.1787584184.git.geert@linux-m68k.org>
 <ao1hIejAdBPKUHFW@kniemiec-mobl1> <CAMuHMdWuG_s3Rm-gLc2KNw9Z0bptQjdDDGH+9YawEMEsFZZ6Nw@mail.gmail.com>
 <ao8Fc8DWbsxMtSRu@kniemiec-mobl1>
In-Reply-To: <ao8Fc8DWbsxMtSRu@kniemiec-mobl1>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Aug 2026 09:44:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWCF0=P4XGYuM1c1+KZckJYw9KuaoUZOF8-EOOqtqsWyQ@mail.gmail.com>
X-Gm-Features: AcwNN1XzEY3I1YHBaPGvpKk8MVWoRxkSmhwGS1lNUFejWW4kN8mjsnYoKG8va7I
Message-ID: <CAMuHMdWCF0=P4XGYuM1c1+KZckJYw9KuaoUZOF8-EOOqtqsWyQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: GPU_BUDDY_KUNIT_TEST should not select GPU_BUDDY
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Karas <krzysztof.karas@intel.com>, 
	Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Maarten Lankhorst <dev@lankhorst.se>, 
	Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 26 Aug 2026 at 18:39, Krzysztof Niemiec
<krzysztof.niemiec@intel.com> wrote:
> I got unnecessarily annoyed/angry in my previous reply, I'm sorry for that.
> It clouded my judgement a bit then but I still have some comments now
>
> On 2026-08-25 at 14:15:34 +0200, Geert Uytterhoeven wrote:
> > On Tue, 25 Aug 2026 at 13:39, Krzysztof Niemiec
> > <krzysztof.niemiec@intel.com> wrote:
> > > On 2026-08-24 at 17:12:30 +0200, Geert Uytterhoeven wrote:
> > > > Enabling a (modular) test should not silently enable additional kernel
> > > > functionality, as that may increase the attack vector for a product.
> > >
> > > What vector? What product, exactly? As far as I know buddy allocator code is
> >
> > Any product that uses DRM and has CONFIG_KUNIT_ALL_TESTS=m, so
> > developers can easily run any relevant test when the need arises.
> >
> > > currently loaded when a) loading a drm driver (which would need that code
> >
> > Not just "a drm driver": very few DRM drivers use it.
> > Hence one can have a product with DRM that does not need the buddy
> > allocator.
>
> And the buddy allocator was moved out of DRM in anticipation of a
> possible non-DRM driver that wants the buddy allocator. So there's no
> implication between DRM and buddy in either way anymore.
>
> Currently it's only DRM drivers that actually use it, but there's already
> scaffolding in rust for it that does not depend on DRM, and once
> there's a non-DRM driver that wants to use the allocator it would have
> to undo the dependency added in this patch anyway.

Then the dependency can be lifted.  There are hundreds (thousands?)
of Kconfig symbols that will need to get heir dependencies updated
one day.
However, missing dependencies means more questions for all users
configuring kernels.

> > > > --- a/drivers/gpu/Kconfig
> > > > +++ b/drivers/gpu/Kconfig
> > > > @@ -1,14 +1,15 @@
> > > >  # SPDX-License-Identifier: GPL-2.0
> > > >
> > > >  config GPU_BUDDY
> > > > -       bool
> > > > +       bool "Page based buddy allocator for GPU memory" if KUNIT
> > > > +       depends on DRM || COMPILE_TEST
> > >
> > > What's the justification for COMPILE_TEST here? It might be needed but
> > > you didn't explain why or mention it in the patch description at all.
> >
> > It is customary to add "|| COMPILE_TEST" when adding dependencies that
> > are not strictly needed for a successful build.
>
> I can't tell if this is something so obvious it needs no comment; I feel
> like it should be documented explicitly in the commit log.
>
> If the DRM dependency would be dropped would the COMPILE_TEST have to
> stay? Because then we're forcing a non-drm user to enable it if they want
> to use the buddy alloc at all.

If the DRM dependency would be dropped, the COMPILE_TEST can be
dropped too.
If a (not always enabled) non-drm user appears, it can be added to the
dependency list.

> I think just leaving the "if KUNIT" part would check all the boxes,
> since the tests are actually runnable with KUnit via .kunitconfig
> without building an entire DRM driver, GPU_BUDDY also won't be randomly
> enabled with KUNIT_ALL_TESTS on systems that don't care about it, and
> we're not forcing anyone to enable DRM on a feature that was explictly
> made independent from it.

There are systems that do not use DRM, but still want tests enabled.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
