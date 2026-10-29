Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261405;
	b=dkDogCdVEr+s11HwvT9glXLShQRtGsWDqGmlnMQmEzxE2YWOAebpjXBM4aUp1SZWF6Oy
	 2AWVSfi5Spq8qOlUpzljtgrGpQ0QnbEC7dJkMyxxTa9Di+glw6gFBhHq01gEkl9Ck9rXo
	 E37aMPHuiGVua6auqO5Er5XT1047g9Hgh5KDDTjy+9H5igEic6doLqs4sIUqVQyZQRvuL
	 O3IJxt1hwy48dtaudUwTU4Kd4MDSEgnA1zXcYi4w8CxChmciLrS5j1U1PqIjj9ZRkwFS1
	 cffYcM9cSdZCnJMActJJF+zWcf0CnbClo5IfzQxqxlKwQpn3rEa6EkffdoDtnUaeSeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261405;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=j1N3C4wGR9ui6A1aTKEotaU/WbKyfzJohGbZeH+69Ss=;
	b=A/BpIT1Kcz1tGWSyQwrq8WTMUydrqL4zyvwftXKLJ+YZTsouGS5837bUeNl9K4caC9mu
	 D8Gef+ug073zqotziGKngFEqY7veGPbuzA46HDFbY1rHi/8l7POzHsbpe4QvtcJt2r3PI
	 lx70xnSGzHxgb5sQoaxUTYJnoiYvSMlGHLEsEPge/8zvZXOrvJvckXdyjVzb2oY7zEid3
	 YS/Lcs4TdV6tpxKGFmxk/KDJscEW3TGD/pWY5FRmywcrSSFfBNgSdZpL615hj4LfbBGTu
	 oGPGxNAguGHH65ML3Zd5hGAL43Ip3xt3TS+OGkXNf5a8mkb4G9dsb4vpsHmhnqDpSTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.52
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E91C606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E91C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-98c78660542so1461373241.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:10:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261404; x=1793866204;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j1N3C4wGR9ui6A1aTKEotaU/WbKyfzJohGbZeH+69Ss=;
        b=GuMY6wn5ippztAknbq4lAqxfqcIotHUsdv0cVRXNsZwS9xQTb0/Nv6xdT4Csa/B7Gp
         GV5Zv51SOoUJ3oL30jYMGrohRUV6i1HGG7yie+voNGTqbHbGgWHXbBMcVYIAR9cU0sf7
         mRNDE5oJLz21OHDmBApS1YuTM5dwwFq0CvWZllxam1GfgEZf2gMM7jD5v/QRE8dVPXrI
         UG8sch61zDWSf/QYoqT7TvEWWu6IZzgvDoGsPrxeWbHru4i67zHhhIipBEWMPDmMzl9t
         NtrH2VzjMKz+Laa5UizJIt6KUCjnP/Y2qu7AsfSa5s0le2Dvi0N1ZNKw4Prm2qr4kgox
         quJA==
X-Forwarded-Encrypted: i=1; AKwUvByKbXmsJia4c84LnKIb3mTnnzhJlylyORCVikPJ7o5QNJXZ7aPD24JiNw+qsAneQr83U8/qt7EQ83OcYfk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLgh2dBvoacjybHaxE9IykTdjeo+ALtY9M8OO3xh++nQARUuZw9
	aXXg33h+M49LBR7OqJPKQY+9bRE7g2xwhHD4DnocJUzMKJdJY8KiuUj/nWY6DYv1
X-Gm-Gg: AYBFou2iWYAh6BuHZ6Pb0vVqo0NSEQeuiWK15TGszpHNz7C0obq1+0TehmDcJNWaX9R
	VZFb5TyisbP6XJpYljEvuElVFIDj67nQyLr1JYVRO88ckhoFMPdAUqCbAJY17Y+YG5dedcLDUPg
	CwZvKtlh0ymhoDcnaA9WTMXtta475YJ070OwCFFV0iSSBTrUas7VAW3BYw0hfB//5i4AAGCjcnp
	AOcgRJFwmXkwNyKoJ0Q0Sa7EVCQEMOeIPJ9w0i0SSriCdSqnwG6MRdGOt+dRKyNzuCj5/QEn/F6
	RbbtdYVO9uazjoXXy4svYJdiBGBlFKAxcWMGcsmahczD2h48nxUM6h+Aq0IBeXkpxYgfkH59R8k
	MxzFkRNsUavWuqTFcRI6/+n51q0mJ5BkuOoJbbJvy4VOGlR/4V1+xQ049a77V6TcbJTzVbueu+n
	kQmHryRu2qM5KaKdMcBqlz3Ebqc6FgHPJxnz7AgINgSebcUCkNKhUxXOcjUw93CPtMTqN0FGX3H
	7NG6sn4YtoVZiR2DZeCyX20x3oC84KGvqzWyMM5UQDaJdNWlbSDLxqGWIqupfKQcXL+q7pSH4X8
	9AxrFtUPUheE5V7D0C1hnw7LPe1QFzJIijvVvN+WuI7dWn2zd09xRKfaG/nW+keuPjs=
X-Received: by 2002:a05:6102:f8c:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d03a2c25a8mr2324674137.1.1793261404376;
        Thu, 29 Oct 2026 01:10:04 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3c44ee7sm8256352137.6.2026.10.29.01.10.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:10:04 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-98febe968deso1417353241.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:10:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByENYgY33/z72uvUS5UFvemjubqKGkOO8I0MiQcJpLPYXVz6tqXIlHVJ4zsjcQymGhRBCucb/I1t+abHhA=@vger.kernel.org
X-Received: by 2002:a05:6102:3eca:b0:7c3:f07c:f49c with SMTP id
 ada2fe7eead31-7d03a503c53mr2112556137.11.1793261402712; Thu, 29 Oct 2026
 01:10:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027160914.3787276-1-bestswngs@gmail.com>
In-Reply-To: <20261027160914.3787276-1-bestswngs@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Oct 2026 09:09:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBAFGH-YoF5iTSXuX=tFjXXQhXYyxnT=-XJ6qEGym7PQ@mail.gmail.com>
X-Gm-Features: AclHuK98HJBR5jB_yT7cph-_YLUIP8WBWM3UvHpqvO4YtLNQFtBwwRQ_iZsfTT4
Message-ID: <CAMuHMdUBAFGH-YoF5iTSXuX=tFjXXQhXYyxnT=-XJ6qEGym7PQ@mail.gmail.com>
Subject: Re: [PATCH v3] fbdev: vfb: Validate framebuffer geometry and memory size
To: Weiming Shi <bestswngs@gmail.com>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	co+b0df61d49532b2ee@bugs.sh, Xiang Mei <xmei5@asu.edu>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Weiming,

On Tue, 27 Oct 2026 at 17:16, Weiming Shi <bestswngs@gmail.com> wrote:
> FBIOPUT_VSCREENINFO can supply a virtual width large enough to
> overflow get_line_length()'s int multiplication and bypass the
> video-memory limit, allowing fbcon to write past the framebuffer. The
> offset additions can also wrap, while an excessive videomemorysize
> module parameter can be truncated when PAGE_ALIGN() is assigned to
> unsigned int.
>
> Cap framebuffer geometry at 8192 x 8192 and video memory at 512 MiB,
> keeping the stride, framebuffer-size, and generic fbdev drawing
> calculations within their destination types.
>
> KASAN reports:
>
>   BUG: KASAN: vmalloc-out-of-bounds in sys_fillrect
>     drivers/video/fbdev/core/sysfillrect.c:24
>   Write of size 8 at addr ffa0000001671000 by task poc/198
>   sys_fillrect
>     drivers/video/fbdev/core/sysfillrect.c:24
>   bit_clear_margins
>     drivers/video/fbdev/core/bitblit.c:247
>   fbcon_clear_margins.constprop.0
>     drivers/video/fbdev/core/fbcon.c:1410
>   fbcon_switch
>     drivers/video/fbdev/core/fbcon.c:2261
>   redraw_screen
>     drivers/tty/vt/vt.c:994
>   fbcon_modechanged
>     drivers/video/fbdev/core/fbcon.c:2693
>   fbcon_update_vcs
>     drivers/video/fbdev/core/fbcon.c:2732
>
> Cc: stable@vger.kernel.org
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: <co+b0df61d49532b2ee@bugs.sh>
> Suggested-by: Helge Deller <deller@gmx.de>
> Assisted-by: LLM
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>

Thanks for your patch, which is now commit f93dd31db3e23e61 ("fbdev:
vfb: Validate framebuffer geometry and memory size") in fbdev/for-next.

> --- a/drivers/video/fbdev/vfb.c
> +++ b/drivers/video/fbdev/vfb.c
> @@ -31,6 +31,9 @@
>       */
>
>  #define VIDEOMEMSIZE   (1*1024*1024)   /* 1 MB */
> +#define MAX_VIDEOMEMSIZE       (512UL * 1024 * 1024)

Is there any point in having a larger limit than 256 MiB
(i.e. MAX_XRES * MAX_YRES * 32 bpp)?

> +#define MAX_XRES               8192U
> +#define MAX_YRES               8192U
>
>  static void *videomemory;
>  static u_long videomemorysize = VIDEOMEMSIZE;
> @@ -142,6 +145,10 @@ static int vfb_check_var(struct fb_var_screeninfo *var,
>                 var->xres = 1;
>         if (!var->yres)
>                 var->yres = 1;
> +       var->xres = min(var->xres, MAX_XRES);
> +       var->yres = min(var->yres, MAX_YRES);
> +       var->xres_virtual = min(var->xres_virtual, MAX_XRES);
> +       var->yres_virtual = min(var->yres_virtual, MAX_YRES);

This violates fbdev API rounding rules:
  1. If a value doesn't fit, it must be rounded up by the driver,
  2. If a value is too large, -EINVAL must be returned.

>         if (var->xres > var->xres_virtual)
>                 var->xres_virtual = var->xres;
>         if (var->yres > var->yres_virtual)
> @@ -159,6 +166,9 @@ static int vfb_check_var(struct fb_var_screeninfo *var,
>         else
>                 return -EINVAL;
>
> +       var->xoffset = min(var->xoffset, MAX_XRES - var->xres);
> +       var->yoffset = min(var->yoffset, MAX_YRES - var->yres);

Likewise.

> +
>         if (var->xres_virtual < var->xoffset + var->xres)
>                 var->xres_virtual = var->xoffset + var->xres;
>         if (var->yres_virtual < var->yoffset + var->yres)
> @@ -434,9 +444,12 @@ static int __init vfb_setup(char *options)
>  static int vfb_probe(struct platform_device *dev)
>  {
>         struct fb_info *info;
> -       unsigned int size = PAGE_ALIGN(videomemorysize);
> +       unsigned int size;
>         int retval = -ENOMEM;
>
> +       videomemorysize = min(videomemorysize, MAX_VIDEOMEMSIZE);
> +       size = PAGE_ALIGN(videomemorysize);

Perhaps return -EINVAL, too?

> +
>         /*
>          * For real video cards we use ioremap.
>          */

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
