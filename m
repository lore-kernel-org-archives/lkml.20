Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41675445AD1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770348; cv=none; b=VKHsCOvGy3wCtKZcGaYcsW3BX3SfJ4bcw3dJ+VbNBBlBMJGYek/UP8LaVUhy41qVwW4V3RNGAhsqLXT/tVrRlmqLJxMXmaaIDwiXpIv3sgOcOhhdNCuOwCnghvMTW+QqBEpdHq4SkhcChL2XgsVmnGQyO1k5Fx9ihDRz3kqTarM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770348; c=relaxed/simple;
	bh=Tm/d84wF7MfOvBgEC1xVi9lvNiCMRhmX1lrFGxn/CV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gc4UtvyzBpGM+xK9hB+s20GZ2IeU1Su9QISbU+yGaKcwwLGbatzCWShfoY08vhF5JqjfVvmqZ6kc0L/YXSBrWHQ/DR59CfD7ayt6kpioEZK7FZmyMSBqrK4mI6k4wYclMmg4RenzZ9021lMfT7N/wxkmHs+xyZT+3wFB8QpRNLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bf9466867cso1348741e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770344; x=1789375144;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2br8BvQg9DJFd3H4ITYFtxQrEUyvo1i3TJw/l6L1bw4=;
        b=s4hXoxWf2tJLu4aIzdv9YOctbrv1CEDvAw+myGozeT99SFYEMD+eRump0rnO5ZOb7H
         WKvGEGhh8qhpOElsZ4YBgPiWr3YfzUoZp3BqESnVngfAtwtfMRDE5Y37pLZTyV90M/cg
         +oKZkSrz4IGMRNiplumCUMFYWY2w8hINsmmsbWHNYzzgRqgbr4KOTCI+bgEQc47sbEuZ
         lBXqKIDOhd6RzHr++xaC5G0drf1/xJ9o6hiVg2OnFo/r86feJEp6u03F+x79jtd3kpQ4
         vGIoA8XZwPl86oKN7nG+RNU/D2dEb97uVFBCPhRL3nI7UVqh4Xq+JuPeacE+mc8+6/iK
         s6qA==
X-Forwarded-Encrypted: i=1; AKwUvByYNBN/Na5zYZusIgstSZMTprDcfjtfVag8iFH87llRueG+EGt4PMZwfkbUFG+WaY2g7ofHx+mYe+m1uvI=@vger.kernel.org
X-Gm-Message-State: AFuF++nD6eEYsARTFeiedaU9zSHm1i5qg9Qq9cFcUd7+7d3uz2FqO7H6
	HRbXbOtBEOs2W1Mf9/LW7QnGQZfOK64rVfYNBApPKB38q9kpfgf6CdajLEaDgqj2
X-Gm-Gg: AYBFou3L63+zABiUQSdxyAWTWwbIzULjzvjIzofK94GHVJ6Aa4UCzxlUHxM1dNrCexF
	4hJxORk66KMnfJZdMED6goLxyD0sKCkt39Tx0/C4w2TOf+sSrwVy//tPiAjOZwA67t9wpez9oVW
	T5lgyvSyaFmU9NRtPPydl6USUd5yu+GqxB3MfGyVZ2Bh+ppDfW7sxdxRmh6Prif+MhEABF8ccCE
	CUslwVFGUm7WeYRCY1KkXAyZjoB/DImzoglhfCWgrz5cZpVYPq/CJo/IIUF09dJZzXXL6UAri5O
	st3hcH4jsIuq4COFQL+YtzD+E8br8hJ+3ZZYoZfklRo/DzlJo1uAnnbEK7K4jyk4YKiifP1KTER
	soLAjoQEe1MF2OcQ+vSglBTaTQlFok9ZhKXQo12BSWGa0YrPG5XzSDqHKHsnWuPADEXjxew1RGO
	6/61WxQa5/ws0JZO82LP7IKbxDqsFXCwBi2SrP2SrtK70dX8vLPUtSIyUHwsj0QgQg9A0Nd3EN3
	0/Ao35eOmLs+bNDasZzq/yl3A==
X-Received: by 2002:a05:6122:4f83:b0:5a1:fbbd:6bd0 with SMTP id 71dfb90a1353d-5c7ed45ea59mr8666802e0c.5.1788770343773;
        Mon, 07 Sep 2026 01:39:03 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1097e5sm7408012e0c.2.2026.09.07.01.39.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:39:02 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-74ab6c88052so925997137.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:39:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxECBuPumN0AkQ33dK0iU5GBYLqcnd0xlNDFtEzjhIScmK0rCV6bKpmpPC7oXfS06AikIzku79g/HHnQfo=@vger.kernel.org
X-Received: by 2002:a05:6102:6d6:b0:737:783d:1916 with SMTP id
 ada2fe7eead31-78a4aa56803mr7111444137.11.1788770340448; Mon, 07 Sep 2026
 01:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827093948.2825531-1-lilinmao@kylinos.cn> <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
In-Reply-To: <e4a2ba2e-c533-04d8-0795-e3d43caf47b9@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 10:38:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOc-_hgWvu84EW7tyQx6WzPtabnBUJ1T0uoxa1QZA94Q@mail.gmail.com>
X-Gm-Features: AcwNN1Wp_1PImUP-cNgneasiw6HMISUs78c56UfOAI5vNGTS0l_4VrpE9irLY4c
Message-ID: <CAMuHMdVOc-_hgWvu84EW7tyQx6WzPtabnBUJ1T0uoxa1QZA94Q@mail.gmail.com>
Subject: Re: [PATCH] fbdev: atafb: Restrict SuperBlitter to supported formats
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linmao Li <lilinmao@kylinos.cn>, deller@gmx.de, linux-fbdev@vger.kernel.org, 
	miro.kropacek@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

CC linux-m68k

On Sun, 6 Sept 2026 at 03:49, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 27.08.2026 um 21:39 schrieb Linmao Li:
> > The SuperBlitter operations derive an integer byte count per pixel.  The
> > accelerated fill path handles only one-, two- and four-byte pixels.
> > However, the operations are currently installed for every external
> > framebuffer in SuperVidel RAM, including planar 1/2/4/8-bpp and 24-bpp
> > truecolor modes accepted by the external video parser.
> >
> > For 1/2/4-bpp modes, the byte count becomes zero, so accelerated copies do
> > nothing and fills fall through to 32-bit stores.  Planar 8-bpp uses an
> > incompatible memory layout.  For 24-bpp modes, fills also use 32-bit stores
> > despite advancing addresses by three bytes per pixel.  These cases can
> > corrupt the framebuffer beyond the requested rectangle.
>
> I believe 24 bpp mode can be rescued using something like this (entirely
> untested):
>
> --- a/drivers/video/fbdev/atafb.c
> +++ b/drivers/video/fbdev/atafb.c
> @@ -2463,6 +2463,11 @@ static void svblit_fillrect(struct fb_info *info,
>          case 2:
>                  memset16((u16 *)line, pix, rect->width);
>                  break;
> +       case 3:
> +               memset(line, pix, ((rect->width * bytespp) % 4));
> +               line += ((rect->width * bytespp) % 4);
> +               memset32((u32 *)line, pix, (rect->width * bytespp) / 4);

This uses unaligned writes for the largest part.
You can avoid that by doing the memset32() first.

> +               break;
>          default:
>                  memset32((u32 *)line, pix, rect->width);
>                  break;
>
> Can't test this on hardware, and would need Miro to confirm it works as
> intended.
>
> >
> > Enable the SuperBlitter operations only for the layouts they implement:
> > 8-bpp packed pixels and 16/32-bpp truecolor.  Keep the existing software
> > operations for all other external formats.
> >
> > Fixes: d463633d63e6 ("fbdev: atafb: Add support for SuperVidel's SuperBlitter")
> > Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> > ---
> >  drivers/video/fbdev/atafb.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
> > index 5bca34c45cef3..c3011b61a94b9 100644
> > --- a/drivers/video/fbdev/atafb.c
> > +++ b/drivers/video/fbdev/atafb.c
> > @@ -3360,7 +3360,11 @@ static int __init atafb_probe(struct platform_device *pdev)
> >               memset (screen_base, 0, external_len);
> >
> >               /* framebuffer in SV RAM: enable the SuperBlitter */
> > -             if (external_addr >= 0xa0000000) {
> > +             if (external_addr >= 0xa0000000 &&
> > +                 ((external_pmode == FB_TYPE_PACKED_PIXELS &&
> > +                   external_depth == 8) ||
> > +                  (external_pmode == -1 &&
> > +                   (external_depth == 16 || external_depth == 32)))) {
> >                       svblit_regs = ioremap(SVBLIT_REGS_PHYS, 0x100);
> >                       if (svblit_regs) {
> >                               svblit_fw = svblit_rd(SVBLIT_VERSION) & 0x1ff;
> >
>
> Otherwise, LGTM.
>
> @Geert: can you remember if pixel format or bit depth of an external
> framebuffer can be changed at runtime using fbset??

I am no Atari expert, but IIRC all external framebuffers rely on
being fully set-up before Linux boots?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
