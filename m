Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489890;
	b=mXAJqLsVNG6G0V0xRn32mWKKLFHR5c+JPJ+GhnU9J4YKA3OcizFJ72nKgV4JA9o6GHsR
	 iOSxKi96Hk2qp359G9Dj8m/IT7aOyaB7w7VTsj4yj+NPpU0Yo6bs8De5mYqCbSupNhIbD
	 P0qmRhYTWRcAHPlHLN7Pjg/YhjuPkPCkmND0XSQb6+ilrwo+1sLDhV1k0h1q92iTkV/fj
	 GVMAJ0PvH56PIUPu0HMkgVAuhOqxh8nj+usGX0vbRNTstrnbjRwS4oqboZ8il5X8Npddr
	 nk+x7STOshav4R0ZB1iGSkR9AVxBh0ZsgKHvo93QU53LfVVAcE8UAu79924LT+T2LpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489890;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=b0GOq+NQPY9m+Vb2+uqd0Y00ldqSHDELh5UHvIeUi8I=;
	b=S9n+5m6SHSIabiOZmHTuUNTFH7gu/bJgy0vskreMZvHj7/m9v9ZnytjXRyoN5TO5ARMn
	 6I0OIP51S+S52ykyC+V02ET9le4u5vvwiwE8ZHkSXPsk21woV+yIEMtuhbWndXquFalwX
	 Np79NfI4vm2v6IMvlcbiLVQuBYXCyInT25ftz8SMhyksKzm0UIj+HpKDIlnGn2D3Mq2gl
	 EdsplPp7sDpHKC6+ARpB/1YBJqkkyz0l7xSlPSNpDSx+CIGmtADHcLjuHW3rLJvuIajPb
	 EFIYHHXisNCPkk/1skn/0c2SZ7o4O5fX52p/pzpJpqG+jr14oH88OX1Sjn4pwVg0nog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8A5606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA8A5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso884280e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489889; x=1793094689;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b0GOq+NQPY9m+Vb2+uqd0Y00ldqSHDELh5UHvIeUi8I=;
        b=YfByJ72LCUriE4Qj9ZzYLYlSLpAQnfBhUekLaKOBl3JrYwEyH7kNul8UqnIdZm4Vcn
         Tw5XnekcsTDQzbuS9hIqzfwi74z19aHNf1HHz+c10S/cmACJg6XQ8tqmOR72ObwoKbiP
         hRafWopbB9k9wLzEcvlyDy2lITLkReBOqTtoEpVUdftXaWEumGs4u/mBEIhiZpun2kjF
         eUKrpx8Yv30JURDhkWFleIVpm12NrOp5Bw4c3nDrVCEDeeJPi0a87SD+naJL81OT7GGl
         b75CqoOF3kvHbfzI+Zq8eTOwMcEOAiU+oaPAk0NdKhUSc6ulwE2RFNDSq94Ni6pZ2iGD
         Unqw==
X-Forwarded-Encrypted: i=1; AKwUvBw5nKloE46C2JBuQb1VjO5THe8mJBTM4ucQcmZ0dGtOgXLuYlDIidbmZxDHmjklJSOmFhskGN0JJwTGOUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcTg6Iw2d/Ptz8qB3z4AnTS9/j7v9UxnwGWDkiCRnHoX3dNHDT
	QNatjyq2gJWecu/dgkfOr1GmIcU0w1pB2m8cRy/JYtCg+Jj298xKmhZx9u4UDLLzq2Y=
X-Gm-Gg: AYBFou2pVY1d2CFXu8b1HG8HwGwQ2TW7SYIEclzAxTMcxrUReGKMjLzr81AQJZPuPSO
	JuZn0n0JsLAINKtJKQOd2w4lTNfUfTJEKGdig+iSkC4JQEPYzlqy7ngkZ5KCjz/Ki8VJ+B5uC6x
	yTGniK2vxibiHqNqE6wFEVxl/V+fuJhQ4nX8EE42T9lvE+OajRo43FbyAAM7L+JdImhW8wTmmo/
	Xou7OQ7zzSVjsQ8i4QolMuXfEwxGAerCSJEuWPqxIgtY4l3q8DfJZatLwsgdPY7DS5lQgksgYeV
	Lpydfvo+3XEyqgyy7u/dEsWeWcIZuC592UfyRkIzMnDLHg7ed9qhOczco1wXU2w+DWVTeSeiTo7
	uVsqU9yvw4RHypU61GN3GE4hNRRIF2Iiwc+7pr/PZTKwj6PtLh/2jAkxbXa3gS0Yx9TKDRhYTCJ
	gZ7nZkE7QgahAMIJA92GDdR4HqZuivS0osf+t68cEok3zkZhOHm0+xpYgNuW3GtGGVRvg15Eesi
	iZGeLdPp4v0J+F92jMZqypZ9f0rmZxcH0Ag
X-Received: by 2002:a05:6122:62a8:b0:5ea:c36d:dc5c with SMTP id 71dfb90a1353d-5eac36de167mr1718599e0c.20.1792489888630;
        Tue, 20 Oct 2026 02:51:28 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b536ccdsm12251487e0c.13.2026.10.20.02.51.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 02:51:27 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9906034086cso873639241.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:51:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzjE46YBkfKcrK8OLhEuN9HzftLIp+i2UcxvZ7bbgJ/6iBQruausqI50QMwTkVq/RHZb82+dvaUpqUmquY=@vger.kernel.org
X-Received: by 2002:a05:6102:448a:b0:7cc:2cd0:e74f with SMTP id
 ada2fe7eead31-7cc36a85157mr2299343137.30.1792489886360; Tue, 20 Oct 2026
 02:51:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <7145ead76cf7cf399eb4e1e6039f51cae07b49b4.1786009079.git.geert+renesas@glider.be>
 <20260826100848.12eaf40e@pumpkin> <CAMuHMdWDcfrUM4tKGOO3fHJQ3FnYBu-tPG61BY_069Yv_TxXKw@mail.gmail.com>
 <20260827093502.23b6b062@pumpkin> <CAMuHMdVWvezFSy3y8mwQvTxxp0C-Pr3YuSEuHGm4P+7kR80+nA@mail.gmail.com>
 <CY5PR11MB6366EC84A3D4511C5217A1EDEDA92@CY5PR11MB6366.namprd11.prod.outlook.com>
 <PH3PPFE241D7F1486A6B879134C0FE43F3FED982@PH3PPFE241D7F14.namprd11.prod.outlook.com>
In-Reply-To: <PH3PPFE241D7F1486A6B879134C0FE43F3FED982@PH3PPFE241D7F14.namprd11.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 11:51:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUr7_460y_h+BfDeYAFx7iC_wkFKT1U-BMAOOdivpcUBw@mail.gmail.com>
X-Gm-Features: AclHuK_ruPEcMZFttlwT7RYBlT8UqxEq2sx3rToK0pDCb1c40iHpM5xPzA8Y_kw
Message-ID: <CAMuHMdUr7_460y_h+BfDeYAFx7iC_wkFKT1U-BMAOOdivpcUBw@mail.gmail.com>
Subject: Re: [PATCH] issei: INTEL_SSEI should depend on X86
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: David Laight <david.laight.linux@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vitaly Lubart <lubvital@gmail.com>, 
	Karol Wachowski <karol.wachowski@linux.intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexander,

On Mon, 19 Oct 2026 at 08:41, Usyskin, Alexander
<alexander.usyskin@intel.com> wrote:
> > Subject: RE: [PATCH] issei: INTEL_SSEI should depend on X86
> >
> > > Subject: Re: [PATCH] issei: INTEL_SSEI should depend on X86
> > >
> > > Hi David,
> > >
> > > On Thu, 27 Aug 2026 at 10:35, David Laight <david.laight.linux@gmail.com>
> > > wrote:
> > > > On Wed, 26 Aug 2026 16:03:11 +0200
> > > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Wed, 26 Aug 2026 at 11:08, David Laight
> > > <david.laight.linux@gmail.com> wrote:
> > > > > > On Thu,  6 Aug 2026 11:46:55 +0200
> > > > > > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > > > > > > The Intel Silicon Security Engine is only present on systems with Intel
> > > > > > > Lunar Lake CPUs.  Hence add a dependency on X86, to prevent asking
> > > the
> > > > > > > user about this subsystem when configuring a kernel for a non-x86
> > > > > > > architecture.
> > > > > >
> > > > > > Should it be X86_64 ?
> > > > >
> > > > > I don't know. Can you still run 32-bit kernels on these CPUs?
> > > >
> > > > You should be able to, but there is no need to support new features.
> > >
> > > FTR, INTEL_SSEI_HW_HECI (which depends on INTEL_SSEI) depends
> > > on X86, too.
> > >
> >
> > INTEL_SSEI_HW_HECI is related to specific HW, which is x86, in theory
> > INTEL_SSEI is HW agnostic.
> > But in current state having only one HW implementation it makes sense also
> > limit
> > INTEL_SSEI to X86.
> > Not sure what benefit we'll have from X86_64 thought...
> >
> > - -
> > Thanks,
> > Sasha
> >
>
> Look like it is stalled and I prefer this patch in the original form, frankly.
>
> LGTM
> Acked-by: Alexander Usyskin <alexander.usyskin@intel.com>

Mean while Greg applied a different patch, not supporting
compile-testing, cfr. commit a8af929e9d751a85 ("misc: issei: Fix issei
architecture deps") in char-misc/char-misc-next.

> > > > > > > --- a/drivers/misc/issei/Kconfig
> > > > > > > +++ b/drivers/misc/issei/Kconfig
> > > > > > > @@ -2,6 +2,7 @@
> > > > > > >  # Copyright (C) 2023-2026 Intel Corporation
> > > > > > >  config INTEL_SSEI
> > > > > > >       tristate "Intel Silicon Security Engine Interface"
> > > > > > > +     depends on X86 || COMPILE_TEST
> > > > > > >       help
> > > > > > >         The ISSEI (Intel Silicon Security Engine Interface)
> > > > > > >         subsystem provides a communication channel between the host

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
