Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6204A0F15
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186579; cv=none; b=ErIlDwyem/ctNn948UGSlwevvlANm1Lq/Jk1Zzha0UqrBcLs0X6RZB2EKOHxQAb6hIARutiIV4JQlmi3WIpXnm4gQRwuZ5njS2oEouqTmbUIMXtch6w6A1zVpAhCh8NqEzm8p8f6hXdbaM/mxY81ymQRc4AcaosN4aaJf2v3+7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186579; c=relaxed/simple;
	bh=RPR33GxPQHSItHo82FqbEf/NyQxI5NsnoXWmQL5G4qM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oBCTO0kZHhoyqiMVqpm4WnpsRXodIRN+zlYoBuEbUg88T0t/05mI84m5kAYhPX0U7JE7AsWxZwg+m+YVHtZVwC0gcOMJRSNHztmoYPss3gacfyTN7T93+LOs8DbVz2b+Mv/yCOiE5NHLyTPzQP8pN3ItxI6nB2SZvWbbiAgYzy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bfb5e20a90so3351668e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:29:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186576; x=1788791376;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ksVP1R1aJY4wwigQq/KzUEGcqO0GsuFhcM7cmpdx+Uc=;
        b=h/09S6O9UsgsxBLgPGKSNsMeiOqHm9r59SWjuaUO7qfZhQqTuhP3MvRCuorV/mPpLi
         P8c4QcNe7GFc1BRHGDheRncA0qlTfnKdkjqePMySb+kKodVfPdXlsv2oRHsu0wg2kA1M
         vhB/1XqfGdco1qK5BZ90HKCEQwZ850CxnBYj0cGLpnbCWLJpAMm0TxCd8FNZERpzTfLy
         znZiS87VMbhvdPTI4tHbnAZlS+xGuAEfaXREhOAxPQ6jX5VOuN83uvpvIVVzr2MAIaeX
         C3CfYOlmhrRfEqWm7mKScR82cY0aNsnCj7G4coFTKYEFduqmTPAfJ1o8zyT9nHLVzhg6
         LZEg==
X-Forwarded-Encrypted: i=1; AHgh+Rqa2uuHfWuuVmIGc+LU66N/I8TuEOxy5yHOl5KagF5SPkuX+XnHMvzs0QAt+q5wsxRuL3AOSEUmNixDuow=@vger.kernel.org
X-Gm-Message-State: AFuF++nciNRXO/E0P3HCbs2R9BdD1ziWLMo+IBY5Qfmr9wjy42SKIoQN
	vLbzB2mHlZA48t7gdIgN/5X3nGdE7d7R6yIY5InZLKfqXfQ+zJwNb66wZ8BCD7ZU
X-Gm-Gg: AR+sD12r5rHbt55BcqSUWet6yu54oI0dkqjjw4wMLtz+cOW/Du8vPdkw83uAp5O5CUM
	tb/oWNxthAcPco37PL5qWBGI0LmApIAsxpMWENTM0a+q43xdoYkivjHi+rN69cWsxuH6Z0WChAh
	1FOy+M4LvtPh/Dic03j+wYHYfnCza6lB8A3DQ/5xKZuSjPZEiJDPjfMdlkj3qK2zjwRYmEfoVpn
	+K0CYyiIzGuBSihzTXVc4ghMRtzvjNl08mBlf2ufNiJT0zpCD2FAkiYywkJZQdtOw8BZipCePvp
	LxG33L/TbXuIEvOs2BTIM4OmX9/lGSHK3t04BgqZUZbRr68j2dAK/E2UMAZ6rjSTmXzDsRseRIs
	974fsxAVuctA2B1XtORdhbX4Oh8bP7xDyfvnxm2M6WR0u7YDR7smg0Vq/ee9bujE5RtAaT9ARTv
	KFtPvsv3sML1xq45kzcVG6CFBCJu3/jTQpHrivAz67D80WkG1el7fdusbfYaZtRJNPyILMim8dY
	yaeAmxXbW7ujdMEvKV1YHQCSks6lQ==
X-Received: by 2002:a05:6122:4fa2:b0:5bd:fb77:842a with SMTP id 71dfb90a1353d-5c6814a1cc0mr11876503e0c.7.1788186576368;
        Mon, 31 Aug 2026 07:29:36 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e97e4411dsm5137574241.5.2026.08.31.07.29.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 07:29:36 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c66eefc868so2877372e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:29:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqGmljBn2sGPix6ajoxP2yqJdq0YxTt3htwYrBH0iu06BP8+RFY93z8NHMlo8sbllbv+pLz/vxYg2XmZM4=@vger.kernel.org
X-Received: by 2002:a05:6102:149e:b0:785:5a17:739b with SMTP id
 ada2fe7eead31-785939481a8mr10534569137.0.1788186575735; Mon, 31 Aug 2026
 07:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7145ead76cf7cf399eb4e1e6039f51cae07b49b4.1786009079.git.geert+renesas@glider.be>
 <20260826100848.12eaf40e@pumpkin> <CAMuHMdWDcfrUM4tKGOO3fHJQ3FnYBu-tPG61BY_069Yv_TxXKw@mail.gmail.com>
 <20260827093502.23b6b062@pumpkin>
In-Reply-To: <20260827093502.23b6b062@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Aug 2026 16:29:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWvezFSy3y8mwQvTxxp0C-Pr3YuSEuHGm4P+7kR80+nA@mail.gmail.com>
X-Gm-Features: AcwNN1WrA0LJc3E7Pmm6z-RChoTsHk8VLRlDThciUMhyoUM5dOE0CAn_TRbkqD0
Message-ID: <CAMuHMdVWvezFSy3y8mwQvTxxp0C-Pr3YuSEuHGm4P+7kR80+nA@mail.gmail.com>
Subject: Re: [PATCH] issei: INTEL_SSEI should depend on X86
To: David Laight <david.laight.linux@gmail.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vitaly Lubart <lubvital@gmail.com>, 
	Karol Wachowski <karol.wachowski@linux.intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Thu, 27 Aug 2026 at 10:35, David Laight <david.laight.linux@gmail.com> wrote:
> On Wed, 26 Aug 2026 16:03:11 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, 26 Aug 2026 at 11:08, David Laight <david.laight.linux@gmail.com> wrote:
> > > On Thu,  6 Aug 2026 11:46:55 +0200
> > > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > > > The Intel Silicon Security Engine is only present on systems with Intel
> > > > Lunar Lake CPUs.  Hence add a dependency on X86, to prevent asking the
> > > > user about this subsystem when configuring a kernel for a non-x86
> > > > architecture.
> > >
> > > Should it be X86_64 ?
> >
> > I don't know. Can you still run 32-bit kernels on these CPUs?
>
> You should be able to, but there is no need to support new features.

FTR, INTEL_SSEI_HW_HECI (which depends on INTEL_SSEI) depends
on X86, too.

> > > > --- a/drivers/misc/issei/Kconfig
> > > > +++ b/drivers/misc/issei/Kconfig
> > > > @@ -2,6 +2,7 @@
> > > >  # Copyright (C) 2023-2026 Intel Corporation
> > > >  config INTEL_SSEI
> > > >       tristate "Intel Silicon Security Engine Interface"
> > > > +     depends on X86 || COMPILE_TEST
> > > >       help
> > > >         The ISSEI (Intel Silicon Security Engine Interface)
> > > >         subsystem provides a communication channel between the host and the

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
