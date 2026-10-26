Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793032005;
	b=VbW/rXLyg8WowjveP//Hg1TA6J+GXFK4A9VmDP6j2AH36yLZK3qNhenbHrA3TTERXvvT
	 HhPYIXUCNbBCQgVlvwOd8RWCp0M0GbVQb9Kxn5EBFKPUozG0N+xtKUYc9bc5pfGKYlq2i
	 WJnDIiwo75CedyOlbl3AY/fsOBlF8TVJkVK5+uPnDYa/3yK1sh3k0CkE92MSek8NnJTPI
	 ff7GDuhYO6qHek/OKuh9uZvkuwdAoqsHE+RHzcmQb/h6Cgge/VzxkjPX09CKn3OD2kYty
	 lBSePKDT7qV3uVtLDIQH7VJo0JEnQGTZ681j6WYiBq84UgFHTt7hG0M35cvAWizOVeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lW187BX7pvnv89/fgKm/N1OWRtkvU+9tvFLWWwcKajk=;
	b=WSn2dAeVgclo0DUwCD8d1EyEColoh8sTA9KqyU2DxzFHgniYUp6qG4LQyQI4HyrJ+F7T
	 js7nO6gQfEPhu2zrmbaWGaxHiXJTHsKHG8sqIB7A2q9yRjx9hfUfxgs21VUoOs0vkmIZF
	 C5FnODYTh7l9wMENkjL3GPiFuL33Zgc4J7QMjxPsIUzLGGTgpgBXK67CrGzF6VWzO7JAH
	 hbJGJnd8XC7UkYjUINwwjQKrsrgwwDveVQBpva0XJ+im13dzFPJg6xyxp0UZcp4luOQ3r
	 eUJ+aymU/Cz6qx9dy3wRKnUAw0KzViYDWYga1JI9IgMMFk5TUeQuX9q52bB3VY3J1eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MUOvYbUG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1E7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D1E7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MUOvYbUG
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so4669675a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793032004; cv=none;
        d=google.com; s=arc-20260327;
        b=TugZbQyxOUcao822ahme+6zJGhPFndPGjY16kmN7I000+UZyhlVPvoA5amUXIixzUU
         JI26/t0gWYTIOE8ruYsFsaEhZZoY1Ry+aAwSKrtXEc8xlC2aHs5p6a1+64R4JrR+NlfF
         bLnWrWDH1BOesn6sdBRRv5nk7/RHz76fPP12dxIKuIGlC7nIN/ghQEbaGlyqumMwb5vG
         kcYZNcB7HW6r2ibY/9rw8cSkO0O213KlJY8tBLyD4RJ53TecktRfiPxzfD8kJXP4wli1
         /S+DlM9MLBZN2DR8MALOk8lawI0ynlyqCD8cEjZvomAiEp3neYfLmIHR9H8nYqqpgQ2O
         X1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lW187BX7pvnv89/fgKm/N1OWRtkvU+9tvFLWWwcKajk=;
        fh=AIJiEmH3v6GgzlplKayuQA0j11j/CjY454D1hHc3toY=;
        b=cESZze62zj4jOwHb0zTsWpZHaxdarCV5LxXFUbtcSHkySr/329Lnj2kbGAu84pbJgB
         5ow6dwgN4SBUwpGqC2FwS9rdtJHx/UhqW8Kix7zdTs1wQ9Ut9R8HDkvj7T0/aQWnhv3P
         MuBe6KBRoHALD6P/Hf4Ak2HX2Wf1PIIdW7RYOlO2b1lzYbf4TK8aISON+NtQ2LMGOp2h
         x3o+Q0sEp32b4zAgxuC6VYbpkal/Znwrhon5+0ipuWO1UiEbm9YJqTwD/2F+yQyzOVLs
         krwuwMsoDtfQaqJM6qkdxO6ch3A+53bTxTD6PKpGtBe8vM1cbSQlfPKKxvy3UrtAm368
         MFIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793032004; x=1793636804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lW187BX7pvnv89/fgKm/N1OWRtkvU+9tvFLWWwcKajk=;
        b=MUOvYbUGJvLRY+4ozSTJAEYhkO+CViDCgDR/3HRZ2ZWklhcxdU68sVei8SZjibc+9J
         J/ZNuFm8p9TkB2fxCuz3OVOlpf2qJp2bkWOYL6xSqXJ86bQpdYp+2R+NuOF3onvlTqMA
         Je20QgRQFsAlFNpoRVlKQx/997AKY43XUf9v7WKQD5FKqoZM//oU3SRUwQG2FwMcct48
         FPWtM84uU9h6uUcStZ5/AMLizASUvfEq+/F9MQT9uXBPbHezFapVQJANiRTyQ1zgykLO
         +TstMVO6d3IdV6JbtXoZLedXzaQgSP4HKjde5q+zJ2c8iK3D6Wtb0C/VG7RPtmcKiKA+
         ejWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032004; x=1793636804;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lW187BX7pvnv89/fgKm/N1OWRtkvU+9tvFLWWwcKajk=;
        b=DhuYlarmidigahkALFPJulzNA3OhRLmJcOV0xmfG9V81lyNboPHKte4UBEJsk0kuLw
         YPUwo+lu57SlqQ4uAW1A5f0eIPTVahJJ4QgiePs3JTB5pvr+iGCCYVI7a0FvK0wjvZbO
         TlsbPRQUYLGyaY7AF7V0Q4VIH5ijQZEgwi9dyGyV+b458l/E1uwrOH27gmZkGempcGcA
         pZYM5yTzPlhEMEQ3xRDsTQtXxUlpI/0hkeHfnipDSqMvcFPUvVyb+rauHaNaXqGW8ttH
         6z2mG+1+w0jQ1fyyDa5uvDpBg2aM9I3mDZnnPuV+JeQgDNbS8BCeeebiHC4ngBKLSYlj
         sA+g==
X-Forwarded-Encrypted: i=1; AKwUvBwUkJozopEWPpq3FsdsAv8BlenmoYbCCXgexx8MBUc2T7NQDDbXKc1IE/QvTFraVcvsXCeWTJJVVeni8cs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLW4QD+ZtbbQCSysfSxlmo0PZAe3DxjGO8kZ21UWDY6LqOHrgvI
	3MKR++l/4yGsAL8Wjz7eiLzLVRXIH89iiM4RneplVmSd/o6WcuIKYn4tEZh4BaFzIhl2GnjNmpf
	lD7LiRYQ0g1YXQ4P1NG32mFW9gxX/FQgSy6+fERUUavzY
X-Gm-Gg: AYBFou2B4c2zqMzTTMwKqegj9GW0fDGVYUDPBFjKSpQ04DDf+rVM8NrrbyNT1vroA8l
	ZlPUBl83r+gqilCicmreYg6G8Nkoi0jZB1JmGQllBdb4Lt8WrwqLqnRrtb9/AgIP8rCYcbFTMNF
	y+/J8M3C2AIglumyLi/yNdldaOq8puXAFMpXPVxD/uMM/5tWHRPAGyYUW7q6+AkDJpZ9cCpaEvj
	C4rkaiEG+xiV5RwJO5/8o3z33vLMG8ypVRB2SZbwj3jjNR6ZxcGddERDmmjmNpIwy/ahjx5qAoL
	MROZ42KMntlQAabTbbgNGb4BcfwKpx5XVytFWsJP0I/Xl/zTk/V0lMnl7GVEK+PrdPkReXZOGoz
	8ku63scDN+wnHEBdNiPK79UUHcXqkLT6nYozSsIKa09Q1bxODwHCCQc8e56NRgKmzyqgbAA==
X-Received: by 2002:a17:907:961a:b0:c44:14d:d95d with SMTP id
 a640c23a62f3a-c46bde35b78mr860710466b.23.1793032003455; Mon, 26 Oct 2026
 09:26:43 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026154604.579823-2-bestswngs@gmail.com> <2f8371e4-ea8c-45d4-8a42-e1a616915b61@gmx.de>
In-Reply-To: <2f8371e4-ea8c-45d4-8a42-e1a616915b61@gmx.de>
From: Weiming Shi <bestswngs@gmail.com>
Date: Mon, 26 Oct 2026 09:26:07 -0700
X-Gm-Features: AclHuK8xJMkjzycsM_PGDEWxDNP3nAsGNewoI6y1CFU9ObUj4hzqU8eQ9FVmawY
Message-ID: <CANgPUi1WDS4aK9+7LO+O4D1JDvGd3isWVWps_W-ocD_fT39HAQ@mail.gmail.com>
Subject: Re: [PATCH v2] fbdev: vfb: Validate framebuffer geometry and memory size
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, co+b0df61d49532b2ee@bugs.sh, 
	Xiang Mei <xmei5@asu.edu>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Helge Deller <deller@gmx.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8826=E6=97=A5=
=E5=91=A8=E4=B8=80 09:06=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10/26/26 16:46, Weiming Shi wrote:
> > FBIOPUT_VSCREENINFO can supply a virtual width large enough to
> > overflow get_line_length()'s int multiplication and bypass the
> > video-memory limit, allowing fbcon to write past the framebuffer. The
> > offset additions can also wrap, while an excessive videomemorysize
> > module parameter can be truncated when PAGE_ALIGN() is assigned to
> > unsigned int.
> >
> > Limit virtual geometry and offsets to 8192 x 8192 and cap video
> > memory at 512 MiB, keeping the stride, framebuffer-size, and generic
> > fbdev drawing calculations within their destination types.
> >
> > KASAN reports:
> >
> >    BUG: KASAN: vmalloc-out-of-bounds in sys_fillrect
> >      drivers/video/fbdev/core/sysfillrect.c:24
> >    Write of size 8 at addr ffa0000001671000 by task poc/198
> >    sys_fillrect
> >      drivers/video/fbdev/core/sysfillrect.c:24
> >    bit_clear_margins
> >      drivers/video/fbdev/core/bitblit.c:247
> >    fbcon_clear_margins.constprop.0
> >      drivers/video/fbdev/core/fbcon.c:1410
> >    fbcon_switch
> >      drivers/video/fbdev/core/fbcon.c:2261
> >    redraw_screen
> >      drivers/tty/vt/vt.c:994
> >    fbcon_modechanged
> >      drivers/video/fbdev/core/fbcon.c:2693
> >    fbcon_update_vcs
> >      drivers/video/fbdev/core/fbcon.c:2732
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Reported-by: <co+b0df61d49532b2ee@bugs.sh>
> > Suggested-by: Helge Deller <deller@gmx.de>
> > Assisted-by: LLM
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> > ---
> > Changes in v2:
> > - Limit virtual geometry and offsets to 8192 x 8192. This retains 8K mo=
de
> >    support while bounding all generic fbdev drawing calculations.
> > - Cap videomemorysize at 512 MiB.
> > - Keep the existing arithmetic types now that all inputs are bounded.
> >
> >   drivers/video/fbdev/vfb.c | 17 ++++++++++++++++-
> >   1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
> > index de137b2bd..de40ba8c3 100644
> > --- a/drivers/video/fbdev/vfb.c
> > +++ b/drivers/video/fbdev/vfb.c
> > @@ -31,6 +31,9 @@
> >        */
> >
> >   #define VIDEOMEMSIZE        (1*1024*1024)   /* 1 MB */
> > +#define MAX_VIDEOMEMSIZE     (512 * 1024 * 1024)
> > +#define MAX_XRES             8192
> > +#define MAX_YRES             8192
> >
> >   static void *videomemory;
> >   static u_long videomemorysize =3D VIDEOMEMSIZE;
> > @@ -159,6 +162,14 @@ static int vfb_check_var(struct fb_var_screeninfo =
*var,
> >       else
> >               return -EINVAL;
> >
> > +     if (var->xres_virtual > MAX_XRES ||
> > +         var->yres_virtual > MAX_YRES)
> > +             return -EINVAL;
> > +
> > +     if (var->xoffset > MAX_XRES - var->xres ||
> > +         var->yoffset > MAX_YRES - var->yres)
> > +             return -EINVAL;
>
> Instead of returning EINVAL, I wonder if we could simply
> cap the resolutions at MAX_XRES/MAX_YRES?
>
>
> > +
> >       if (var->xres_virtual < var->xoffset + var->xres)
> >               var->xres_virtual =3D var->xoffset + var->xres;
> >       if (var->yres_virtual < var->yoffset + var->yres)
> > @@ -434,9 +445,13 @@ static int __init vfb_setup(char *options)
> >   static int vfb_probe(struct platform_device *dev)
> >   {
> >       struct fb_info *info;
> > -     unsigned int size =3D PAGE_ALIGN(videomemorysize);
> > +     unsigned int size;
> >       int retval =3D -ENOMEM;
> >
>
> and here maybe
>         videomemorysize =3D min(videomemorysize, MAX_VIDEOMEMSIZE);
>
> that way the driver loads even if the provided too big value?
>
> Helge
> > +     if (videomemorysize > MAX_VIDEOMEMSIZE)
> > +             return -EINVAL;
> > +     size =3D PAGE_ALIGN(videomemorysize);
>
>

Yes, that makes sense. I'll cap the geometry and videomemorysize as
suggested and send a v3.
