Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516E84825B8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790881100; cv=pass; b=A3/bKS3oF5vkUoLzaOjvvKUUQSPpjvnMXXPU5Pr5ok9VvG3xGobLKHHeHTV0zv7milYifbgt7QNvBzocVIBb5wy5ObL3m8niHXXMs0IFsX4SJqbUlo8fBWD10ibTGpgQfuhKyrh4xw0iKnGtG5N/RZQHlXer17f/auVsIBEIz6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790881100; c=relaxed/simple;
	bh=ZBhMOmtdPtm2ewznb0I6h4e/lc4ZNSuv3xrzaOINis4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HnAQgAHu+VPqlZ6v74nyQ0kvcjXU0iIIY9Rr6HLvSCKF1TqgVTD52dDGG6d1EhDuxPVgLPFVyEgr7bovf+EPZD9fcQy8uRzDP+1Pgi1lQUCD7I31KwBS4Gvd62+i+hlSqlEqzMNd/wjy5UPIYSE5M5czgf6grMDBAwBG4MhGUFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XehcVlCD; arc=pass smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XehcVlCD"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acb8b78d6cso5155620a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790881097; cv=none;
        d=google.com; s=arc-20260327;
        b=N0Akq5W0mbpAhP5VqFIskMh3Oq/oXedqvBKQNQaSsUIO5Cwn9DODuyV7YUE5q4zKSq
         oGYGVnPFhwp9eCicQyBl7wThXvIKjHdwiTz7P0fcKfiPslyzHOzivkHEcQgwT7+UlNzV
         Wo/Z+i6qGjTxKTugOiFmpM4E4r6PDFSZ2IQCtAsuo+xOzBt27DCct/VgP/4So+VmpOsI
         wmIqImAgqOLpgq2HgM+23E7y7JlhlRY3Q6VPhrWuvglqV3uUdvLQXsIdFNFSEO7UjSUc
         b6Ix6dRYH3lioCSfxGY7va01W64l26hDB3JQ8UJg+8ap/3IgiyBxQH8Xu50a/imhXq/T
         QCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+gdBCcya7Jd9eS7uFOMyWkhA5NDxvi9ClIG0tBCXyRE=;
        fh=SoQ+Lq8TuuepKNMUI0Q6wRk/iNtwrDocStNZ2EJ6ehg=;
        b=ETS58WQe7BFwIfH+BZvJRs9yyQveDEBOMc2cgzNWNjzHpCoenlyuBqjVoQukECkMN4
         P++WH5EwJeqwTT4gkgw/HoV3sshhB+Ay+z42UBCBCCaNiSxz2CL4wUDX6ETX15AEO3b2
         omzf7GyhWiZ2k5qkOpXxDC6+8NvyxMbx59jfjsQwRKMfNm6Drzk3QINZI1F9IIJWwjoN
         E4p5bHEdLzZj+rZKLDkVQt7iyh3+jOZHQxXU3zgo+EajmvX9UwCMdAZEMuFEaTUVgItZ
         jsTxU9z2wx8CU1mu2viXak191DsgSFv6/O5+P+0JanG8T1gY0thEymPHV9rYaLrembmt
         K55A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790881097; x=1791485897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+gdBCcya7Jd9eS7uFOMyWkhA5NDxvi9ClIG0tBCXyRE=;
        b=XehcVlCDrWzmlinD4tVaUcORuE1PKauvKECaWQ1Xtr2Fo/3ypZ/ajABHfjEmKrndhO
         1JpWtIscNLvjAeASkCgzUQIjpnrS0IJw8YOZHn55qXxae3qI1MQQCJ6Pg4yQKDJl88+i
         m5PRW2L7Cfef3z3QWSqqL9xDFZLCKcyoZs+ZvQWAaROSNgT7j+CFthyMttlT0pYdlmVU
         ApUQaX2gJwoCsC1iqf5rCAUJ7A0V3ysbc79HqdEe0oStr08zWcbTxmLAoTajnRvbdx+U
         hNhrkGZ25XPs5cdTxRmW2RQ1H8cBbjsgpSmzxTc8qZGmJrrb0Rzx43O0EajuBYlvam8b
         MwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790881097; x=1791485897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gdBCcya7Jd9eS7uFOMyWkhA5NDxvi9ClIG0tBCXyRE=;
        b=FZvqoVwgOOQkmU9h9YsHBMz3leKVpKEQ5/HmL6DSFT2TVPr7WZ8F8N59hcHaHGCqOy
         CPkXwX1WuxToth/Cp6wm+8EfftLWDq+akfW8+ZQlDiNWFeG+9KUttoCiMPNMhltWcmuc
         b+IGfNYkMM9KAWwfVS5m2+y27WZ3/ioLuWWh39IMtxQfgeHiU1Hm+NUbDE7ukoCne7Zi
         PV9sSeEb2IRwRM5o5OLaDU9IFslB5BM6/jcCDG6g0bALshRNNLOdtlND+Cvs7EZHBwaT
         QUOggnWrXnbpHVHsMTMFOS/UPXZZt/2sBukT/3/BgO86uvnI9x2cBYIUe3XcuMAIQjiI
         EBYA==
X-Forwarded-Encrypted: i=1; AKwUvBykdJucovfxLKkjAtprqs8kBgXYDILmVNCGIV0/Dg0sZTWSiVfsYXInu5HDh2/WjI/BtdSfkwNinH2yLhc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfZy/f+h6u03liCezt/7UpIYWhNv9vQCJMkq1M5G8XhGfIXtoi
	f7LvlM+7tsJZL/PQtgeQ/CJZB++2IN4UhjUzLKEmTSQ8G00idBPLxmAt8BG6PVPyfgaAJ3L4mf4
	yyH0igXMFUYPvPv7jiIHmb9d2OovQBso=
X-Gm-Gg: AYBFou08pjJV5HBJKMX85kXdDOxCD35yJZSIawnWxZe0KuAKsm3QsfwVhHhlMA/wy+o
	tdCoy7AHM4LIvgTOmByXVq7L15eUqLRif8NIFaiZ3lGsH2G81Bkc44/AIa90bdWBIkcTjlKpEm7
	u8a0ayGAFhBvBuR3HcB99waf2rWnIsU7H/MgQ1XM8pliOLO3sVss5rKkzurPWGhOiGCEmZRDXEc
	phWlIeciz1uz5NLUQ2hVTMd2BefFEwr6IsQwaik7JGhbIzupoltkjOFB7cq+z76ueCLcSUi0jmQ
	tJwh9G/dOYavAqQVfC174LwmlrF5HBbAzfW0nL+IxPxU8s94VqztbDQPWEJTTx2F+Y1Tkk9LNIL
	ilNzrmoyqP6lnfI1Wz053NApOtgcqFxwWr08Ct1pjew3hfk4J8gbsgcMfTOOCE52NdjnXevP7pj
	1LODVXxpfN2zDVmZUuhLS7wIBAlghMNSspR1yB6lFe24MXGlsBnHPYXeeAbkfBZfFhQA==
X-Received: by 2002:a05:6402:320a:b0:6a9:ae86:bb1b with SMTP id
 4fb4d7f45d1cf-6af9e03ded3mr104018a12.5.1790881097207; Thu, 01 Oct 2026
 11:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925183050.56839-1-rosenp@gmail.com> <2026100129-unrest-cleaver-6528@gregkh>
In-Reply-To: <2026100129-unrest-cleaver-6528@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 1 Oct 2026 11:58:05 -0700
X-Gm-Features: AclHuK96Et8-MkZL9LMhD_ijnC8Z5TWGJ6g5yJxUOPLdgKxS1Jb9-JO48yVLGLI
Message-ID: <CAKxU2N8Z-CSxki5mWQvJCEiQDmy00WLJqPEMgujOA0LQzbHHjw@mail.gmail.com>
Subject: Re: [PATCH] serial: arc_uart: Use platform IRQ helper
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, 
	"open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 1:42=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 25, 2026 at 11:30:50AM -0700, Rosen Penev wrote:
> > Avoid calling irq_dispose_mapping() by letting the platform_device
> > machinery handle it. Also enable possibility of handling -EPROBE_DEFER
> > and other errors. Handle as early as possible to avoid doing unnecessar=
y
> > work.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/tty/serial/arc_uart.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc_uar=
t.c
> > index 3988e5958896..b46b057a181b 100644
> > --- a/drivers/tty/serial/arc_uart.c
> > +++ b/drivers/tty/serial/arc_uart.c
> > @@ -30,7 +30,6 @@
> >  #include <linux/tty_flip.h>
> >  #include <linux/serial_core.h>
> >  #include <linux/io.h>
> > -#include <linux/of_irq.h>
> >  #include <linux/of_address.h>
> >
> >  /*************************************
> > @@ -571,12 +570,17 @@ static int arc_serial_probe(struct platform_devic=
e *pdev)
> >       struct arc_uart_port *uart;
> >       struct uart_port *port;
> >       int dev_id;
> > +     int irq;
> >       u32 val;
> >
> >       /* no device tree device */
> >       if (!np)
> >               return -ENODEV;
> >
> > +     irq =3D platform_get_irq(pdev, 0);
> > +     if (irq < 0)
> > +             return irq;
> > +
> >       dev_id =3D of_alias_get_id(np, "serial");
> >       if (dev_id < 0)
> >               dev_id =3D 0;
> > @@ -607,7 +611,7 @@ static int arc_serial_probe(struct platform_device =
*pdev)
> >               return PTR_ERR(port->membase);
> >       }
> >
> > -     port->irq =3D irq_of_parse_and_map(np, 0);
> > +     port->irq =3D irq;
> >
> >       port->dev =3D &pdev->dev;
> >       port->iotype =3D UPIO_MEM;
> > --
> > 2.55.0
> >
> >
>
> You forgot an Assisted-by: tag here :(
No LLM used here.
