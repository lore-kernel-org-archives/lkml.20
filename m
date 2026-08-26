Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97E137E5D4
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787753008; cv=none; b=T+g8sPcryayQT2sfg22st4t1mFOqbxerybRuepO4HoDLkWcM11NADPz7n0mzBqoogMC52gkwaKvlmE50opVInCpEB5Dmt64fp2Yu7dDVLmcTu56f/mq1z+EinOJIsHw7OatTyog6mCFcwJd8JFdGPj/2a0Wuk25iPpVWlcsONLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787753008; c=relaxed/simple;
	bh=NEj1wBpueTKUwKE4BOyJDqWJ0yCEDK8tW0sQEx4ysdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAg2xDyJnLzltIf7oZ5L0jR9NJcxH3386/TjQTOw43BIza0QZsilGTq7ouctc2fWQngcy+/y5WsP8LzCWnyWPm2AyN8MOxokO6r74diQItDfty1//uojdjhHfYVmNK+tFaVpdo1h06LzBbs2waYKDk9EIiR63GzWx0zVi+XwdyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97c940ef65cso561640241.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787753005; x=1788357805;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DRI6b+smWItF+/Qa8bvA9LOZ3A02m1PCXMac+pb6uJs=;
        b=iUxtvfA0E0Ylrv5M3inGnRQf+brH7WKG6c/cIhLYT3MWQeNY/nJ1k+KpGnj7iqxSuU
         d9+RrMQdy0B+bEHUU1nG05p5MmsAu1awXnEJcucDqqUTw7bTegWwDFCtHClo8G3WWFKP
         BN19Wnhax0zdDr/9RsAd0TnsUuSdpjCjoT2LuTvgolZ71SIWxS0hK9uK3cFEZbKACdIu
         R26cKBODMXYDp7bXHEdD4yDSJecDmsozfqRXpdVwzu2xmBOMzG0IGwW3edJ4FeHW5Msx
         FP5BMghB9q5bBRW1rPz2J6vehGawCyeeyzpTnNgEY7X02pxpNNO0A2uUSY9tL9J06nEa
         QpAQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAhmYIaMLGRkn6X/zNIgpBWtMikmglywJj8QqSh9cC9Chio0eTGhdkXi/YMoYllAY/MyF5LB2MUPkuCOM=@vger.kernel.org
X-Gm-Message-State: AFuF++noOBL73mVYxRA255Ckxz89nt/DqJRxbQe0pT7Vp4IPef60vffr
	/9sD3bJpsusmN3pLzxkQYAjX+42bIE765BnnUG7fUJQ1nHyqVXgcxK25OeV5rhWxW1o=
X-Gm-Gg: AR+sD10zfG3Lah0rr+tYhVAR9vc2bPpWglKUXWhtUAHsRsFQDq8Jk92pYzMrSf4iVTt
	CBUrjg82/4yQDpXREir2gpwaru2eZhG+UH3S9oOMgIW5OWANRxq78SIlkZdV5Hcklwm0rgXIEQL
	nEPMZmp+mZBPWrv1/kf5nU9T7N93j8oVkkIv8dHL6rsfBOaWF/UCTNneG03LzrPhKTPdPcog9nh
	mD26BJOn6N/oVcKoR9xTEHKNTgC4ZGMg4AwII6RpSU8tu1NU+3j2EbIBPARJCcH+owCKxxUcQ7X
	uiernk7xmcxcw54A9SUJdHPLb/zrCfS5c7VuYLiTdnfw18DEv3aFjh28KxbBOFua8uiNTEl48Jn
	OVNVKca/JyBjFAUTJyJWKdEOiEYBlmUsxZIBHQBg4p+1+7NpVOJC5FCzzetKPzYcSF424hC8nFh
	Hr008suj7oZf4Uhzb1Wz87gxWMDy6Ri117BwZsyJSwP+6CveIP3pvuE2aXBmETvQ7uRG4DIfs5/
	JFyD44zYZK7AQqxSuhgn9Eq+t6K3hJfq/9x
X-Received: by 2002:a05:6102:441e:b0:780:811c:fd79 with SMTP id ada2fe7eead31-782c26f35e0mr2787119137.13.1787753003995;
        Wed, 26 Aug 2026 07:03:23 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbe084c1fsm1859049241.1.2026.08.26.07.03.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 07:03:23 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-782df51b4c1so640108137.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 07:03:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrPsPuPV30l5k9cIvu2913Js4u6hmDbY+IBFzUjYrQQThrPQMt8FtlqntOXCpfcUSm0KWuCammBNNWiR5w=@vger.kernel.org
X-Received: by 2002:a05:6102:448a:b0:77b:4751:76aa with SMTP id
 ada2fe7eead31-782bf9b9609mr2892018137.2.1787753002941; Wed, 26 Aug 2026
 07:03:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7145ead76cf7cf399eb4e1e6039f51cae07b49b4.1786009079.git.geert+renesas@glider.be>
 <20260826100848.12eaf40e@pumpkin>
In-Reply-To: <20260826100848.12eaf40e@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Aug 2026 16:03:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDcfrUM4tKGOO3fHJQ3FnYBu-tPG61BY_069Yv_TxXKw@mail.gmail.com>
X-Gm-Features: AcwNN1UVL3zze2s7xYM5Fh9Lg8Fd64Ehna0joiMvRv2jsJqFTO3ym_wLjkK4Xp0
Message-ID: <CAMuHMdWDcfrUM4tKGOO3fHJQ3FnYBu-tPG61BY_069Yv_TxXKw@mail.gmail.com>
Subject: Re: [PATCH] issei: INTEL_SSEI should depend on X86
To: David Laight <david.laight.linux@gmail.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vitaly Lubart <lubvital@gmail.com>, 
	Karol Wachowski <karol.wachowski@linux.intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Wed, 26 Aug 2026 at 11:08, David Laight <david.laight.linux@gmail.com> wrote:
> On Thu,  6 Aug 2026 11:46:55 +0200
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > The Intel Silicon Security Engine is only present on systems with Intel
> > Lunar Lake CPUs.  Hence add a dependency on X86, to prevent asking the
> > user about this subsystem when configuring a kernel for a non-x86
> > architecture.
>
> Should it be X86_64 ?

I don't know. Can you still run 32-bit kernels on these CPUs?

> > --- a/drivers/misc/issei/Kconfig
> > +++ b/drivers/misc/issei/Kconfig
> > @@ -2,6 +2,7 @@
> >  # Copyright (C) 2023-2026 Intel Corporation
> >  config INTEL_SSEI
> >       tristate "Intel Silicon Security Engine Interface"
> > +     depends on X86 || COMPILE_TEST
> >       help
> >         The ISSEI (Intel Silicon Security Engine Interface)
> >         subsystem provides a communication channel between the host and the

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
