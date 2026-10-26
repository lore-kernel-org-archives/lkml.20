Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793029789;
	b=yEP8UNNCvwq0K3doWRRvAXh1I2QWEHIx9xnK40IWzLpNtIO+I2rs8heHsykX8KXBKPkK
	 JXX1XhvL3E2sE+wuDTmwqznEfDJpPaxvnN+DzoUrjOD0riL1lodPvyFg9ZpbiSMFrfBsp
	 vkoB5txvgBSjzh5Mb+L7GJql/qB1CvgwWLE+VTE6Iib9DM4EpQ5m9dA9U7xKS//7TfIKd
	 nZzrJotaXEnaAuQBW/Rfo5DSEWvV8rE3qkpvuUBmzMga7KluaKuzjHR5ijsHJutq+lw25
	 pHwVQqt8hPRRTSqaASYnVukU/xXFWJfnivhtIC+VRonnjvQPC9k8Z2X9IeFQ/0UXqfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LuKCUhjbeOX3G6yTs4pSwfb4wNEV8f8KmzUas8xg7eY=;
	b=ARVbt1t37V3AHbZhp4IsU3YVW3OM4GaxkeP5BgV/HttppPukDANht6R/9hm6FsgggW5M
	 Lt0pr3ex+4UgXmc7WtgjsN967uk9i2zWrYTgtYLLex8sYMKrJsbgCPSWl/2VA722JkeKQ
	 glHuRjFH8sdbXH9H0FDLn/stw48vw/D+pT4dHuW0g93RLP5WudR7YYp/sLhyiylb/3J2q
	 JbF7FJfhe/RPNJBjNDk4T7IscQ3kmp+LznI4rH+WNHlyh65+DKZ8VAImH85BiLk+1CN0P
	 Sfosv/1sYByy9/9DNw6ReE+qZXOuiPRMbL2+r0H/hlrv4nd+cuV0lyHwQwqUZWGDBVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O6D8gvKx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D512D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D512D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O6D8gvKx
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c315869241fso399665166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:49:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793029787; cv=none;
        d=google.com; s=arc-20260327;
        b=nKAIPK6whTcePXDg9EDAwQ0MLGn/8Trz5OxnAeJmVNWaLZX6o+mlMOaVX8e/MWw9iV
         1Wz+O+LfCTP9Iunwg2zQs+yoHNYSOFzHAGLbdlAtu2vSY0HWdjyRAf3fVmYtF1FtMctK
         tiRPX27HAl6UGrLlsq9sCTiOloOlKLJGHHltPyCPydpWDl7oWOTclSiSeZKIV3kHXbbS
         8Lb9V6wSY+iRTGWIt9nRZt1VDMuG4sP1/5wvJ2MS18pEv5OCTztHuEm9CPkvu46AUgfe
         4iOsLQXa3eV+pYrp04IXIRQGro7LV1czK4ztkYa8qNKwuwk49vch0hQ0K2uk2hHoDL4o
         hpvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LuKCUhjbeOX3G6yTs4pSwfb4wNEV8f8KmzUas8xg7eY=;
        fh=pFre8XSTLYGIH9XlY/gAnLbscF0+mq5Iuk1mD/vc5DU=;
        b=rmbSO62biN/i91iDV47xQuDDbAVx5qB7K3JuyOerHOGdc37mG+058saIQwm+9SzDm2
         4rfU5OkO+M5YBMwrTchsBVptnzhZm1gUMNUHTz98imQ7rG2yr1C8AVpQhYg09avFQJIt
         ZMmj/VX5A9+/sKRxmBLrVJQ5Rsb31BS9Q/4rADR4B+PiFsBDnyuZ1PcPHsYAMjmfn7JQ
         UkKXOoCeSiQ9F8zuZmqYVD/j5aP04e32oXyjwYrTeaQiVPYJfLqLFhBlnPfXwWeFh0kl
         E1PQKAbAOWM+pZ9N9okHaBpb9KIlGEeq/cHriBm5cZqX42uflGOihWfE/C7gQadj4MIX
         QS8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793029787; x=1793634587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LuKCUhjbeOX3G6yTs4pSwfb4wNEV8f8KmzUas8xg7eY=;
        b=O6D8gvKx54v4dsR8YAYGcxK+85DcAY5IABfprIRSDaATYpabq/fGfJEstJa+Ox/+VB
         HBAWLPqKQDB1eFEj2Ejjf7wf0f9TZWM98TjPDICVP5x37jTjCoJnNd61EWVVIQ7dTvRD
         9hooDZ99yAsxtojQZCawm/wClyEpXpcfe1bwB1NWbqn1yD6KSBhNvlks38B0b73kMff8
         MChRmMf+M+BJkvAWWEV+QQe5iOJ8LZPGeIIoNBh3lu5UU84fs8XWhIOT9rA8ZvVEad5I
         7/CJU41asmw26M8hAdsxB2S1cQ/zKlM4Rps0HWvDncmPMgI4zHaSe0EhcwSHdK620pWb
         0vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029787; x=1793634587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuKCUhjbeOX3G6yTs4pSwfb4wNEV8f8KmzUas8xg7eY=;
        b=zkbtRLDR5pspT2mwABlFKi4IjrhtwiRtsAcDQEFqIiMuof5EPgBQBZCQxroP4lEifc
         4PG6gVTRjgO0crJEpzn49FKh7/bk62UZ+pArNV2kuMQLv6WTz14Hkxk0Bf8i7UM5WvLf
         F8mNeF0ry1DKKkAsD7EDyI7etGYORNL7zcchulwf82trV3unWQtXNFjKEJvqYAs73Vam
         PiRMWHO+1Di+VrBC5yqEmaSjlrSalXHw5Z35eIWNubriWsjG58vQS2FKqOXncrK7cHKR
         H3lxln9xNo4Wr5pFlqFX47g7MSWzYXTh1WVImPFMn6g9AaH6cYn70NbP/igfIQS7Ou0t
         pUJA==
X-Forwarded-Encrypted: i=1; AKwUvBx4maJjLx+Yt4bSkhHWa2xVcTHkDT2ybJOQruzvItjR4vApDGTQFfM5groeRTr1BDOx0fWtJEBT3AECTE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa5596zHZxbFRVHrLi1BrgMqK77TLfEEIMdALMRblsqtrYDbjR
	thBGUyVBBOo+9y++zg8bHhPi2SixIDyRQwrRIggi6ZQcdFZFU3zveClA65AvzLGNpYHNkDInbmm
	ogGXaloSqn5BqjTbS4aboKw9c4j4z9QM=
X-Gm-Gg: AYBFou0Q5zFB5x2k0OBjRW+OtpYryS8TdrQXjeH8YVdmS+HfqTYCSSLivbD0M4NKJrX
	7EnvBhkHSE0FMcvvbLggG3NcbY2sqa/T7BPcRxfsQnWwB8hJvkPUyorvlk2HidOY9n3gXPlynQo
	pTIJ1CqTR//ppMy8Wbr68L96tCI+U+JDcJEw8Bdqd34JT4IUIma+q//C5Bj6/dg2+YzSxYvY/lC
	8dTriYlQSlg4XNMpGVPrksVeC2ywMhjhczvZiQf+GkoY2TfBDkSbZi1eAat/HPv53jrvAmi0z9h
	bP4YglFLRJUUDj8olm6ZVBpmNvxS9pNyhvvhsvDABiAsGyPNoN7kQt7VXPbupktWzCPUIUgQQRZ
	zRFEXWY+Q2XcsTkkQuOTwajMKzMTvG89BjRd7PXJE+8bqx0BzM5ay0HKEMP57saGfgRMjHg==
X-Received: by 2002:a05:6938:e081:20b0:c45:b99:f282 with SMTP id
 a640c23a62f3a-c46c19961d9mr554911866b.7.1793029787038; Mon, 26 Oct 2026
 08:49:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023175128.4127122-2-bestswngs@gmail.com> <f5a860e9-7b8f-400c-8d30-44f62e5129b8@gmx.de>
In-Reply-To: <f5a860e9-7b8f-400c-8d30-44f62e5129b8@gmx.de>
From: Weiming Shi <bestswngs@gmail.com>
Date: Mon, 26 Oct 2026 08:49:10 -0700
X-Gm-Features: AclHuK87d0T070FMTlQKiyTb8NOFRveqVBojRHsTQZkg5N_7T-c0np5SCvqWpSI
Message-ID: <CANgPUi3MF6j-K+51MVFtZ39Ve9sUT801Jyewqn8i0hKDSEw86A@mail.gmail.com>
Subject: Re: [PATCH] fbdev: vfb: Validate framebuffer geometry and memory size
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, co+b0df61d49532b2ee@bugs.sh, 
	Xiang Mei <xmei5@asu.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Helge Deller <deller@gmx.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8825=E6=97=A5=
=E5=91=A8=E6=97=A5 12:38=E5=86=99=E9=81=93=EF=BC=9A
>
> On 10/23/26 19:51, Weiming Shi wrote:
> > get_line_length() multiplies two int operands before assigning the
> > result to u_long. Setting xres_virtual to 0x8000000 at 32 bpp therefore
>
> A xres_virtual value of 134217728 seems quite unrealistic IMHO...
>
> > wraps the product to zero and bypasses vfb_check_var()'s video-memory
> > limit. fbcon can then clear margins with a zero line stride and write
> > past the vmalloc'ed framebuffer.
> >
> > The xoffset + xres and yoffset + yres calculations can likewise wrap,
> > leaving an invalid offset in info->var after fb_pan_display() rejects
> > it. Subsequent fbcon drawing can then access far beyond the framebuffer=
.
> >
> > Finally, PAGE_ALIGN(videomemorysize) was narrowed from unsigned long to
> > unsigned int. Values near or above 4 GiB could therefore allocate a muc=
h
> > smaller buffer than the size used for mode validation.
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
> > Reject video-memory sizes whose aligned value is not representable by
> > the fbdev metadata. Check the offset additions for overflow. Compute th=
e
> > line length and framebuffer size in u64, reject unrepresentable line
> > lengths, and check the total-size multiplication before comparing it
> > with the allocated video-memory size.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Reported-by: <co+b0df61d49532b2ee@bugs.sh>
> > Assisted-by: LLM
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> > ---
> >   drivers/video/fbdev/vfb.c | 31 +++++++++++++++++++++----------
> >   1 file changed, 21 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
> > index de137b2bd..84b0a937c 100644
> > --- a/drivers/video/fbdev/vfb.c
> > +++ b/drivers/video/fbdev/vfb.c
> > @@ -101,11 +101,11 @@ static const struct fb_ops vfb_ops =3D {
> >        *  Internal routines
> >        */
> >
> > -static u_long get_line_length(int xres_virtual, int bpp)
> > +static u64 get_line_length(u32 xres_virtual, u32 bpp)
>
>
> Instead of trying to extend to 64bit, I think we should simply
> limit the maximum allowed screen sizes to e.g. 4096 x 4096
> (or some other realistic values).
>
>
> >   {
> > -     u_long length;
> > +     u64 length;
> >
> > -     length =3D xres_virtual * bpp;
> > +     length =3D (u64)xres_virtual * bpp;
> >       length =3D (length + 31) & ~31;
> >       length >>=3D 3;
> >       return (length);
> > @@ -122,7 +122,8 @@ static u_long get_line_length(int xres_virtual, int=
 bpp)
> >   static int vfb_check_var(struct fb_var_screeninfo *var,
> >                        struct fb_info *info)
> >   {
> > -     u_long line_length;
> > +     u64 line_length, size;
> > +     u32 xres, yres;
> >
> >       /*
> >        *  FB_VMODE_CONUPDATE and FB_VMODE_SMOOTH_XPAN are equal!
> > @@ -159,17 +160,23 @@ static int vfb_check_var(struct fb_var_screeninfo=
 *var,
> >       else
> >               return -EINVAL;
> >
> > -     if (var->xres_virtual < var->xoffset + var->xres)
> > -             var->xres_virtual =3D var->xoffset + var->xres;
> > -     if (var->yres_virtual < var->yoffset + var->yres)
> > -             var->yres_virtual =3D var->yoffset + var->yres;
> > +     if (check_add_overflow(var->xoffset, var->xres, &xres) ||
> > +         check_add_overflow(var->yoffset, var->yres, &yres))
> > +             return -EINVAL;
> > +
> > +     if (var->xres_virtual < xres)
> > +             var->xres_virtual =3D xres;
> > +     if (var->yres_virtual < yres)
> > +             var->yres_virtual =3D yres;
> >
> >       /*
> >        *  Memory limit
> >        */
> >       line_length =3D
> >           get_line_length(var->xres_virtual, var->bits_per_pixel);
> > -     if (line_length * var->yres_virtual > videomemorysize)
> > +     if (line_length > U32_MAX ||
> > +         check_mul_overflow(line_length, (u64)var->yres_virtual, &size=
) ||
> > +         size > videomemorysize)
> >               return -ENOMEM;
> >
> >       /*
> > @@ -434,9 +441,13 @@ static int __init vfb_setup(char *options)
> >   static int vfb_probe(struct platform_device *dev)
> >   {
> >       struct fb_info *info;
> > -     unsigned int size =3D PAGE_ALIGN(videomemorysize);
> > +     unsigned int size;
> >       int retval =3D -ENOMEM;
> >
> > +     if (videomemorysize > U32_MAX - (PAGE_SIZE - 1))
> > +             return -EINVAL;
> > +     size =3D PAGE_ALIGN(videomemorysize);
>
> same here.
> There doesn't seem to be a maximum limit for videomemorysize.
> Maybe adding a check and allow a maximum of e.g. 512MB ?
>
> Will you send a revised patch?
>
> Helge

Thanks for your review. v2 sent.
