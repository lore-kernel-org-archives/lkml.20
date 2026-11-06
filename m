Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793927815;
	b=pv8NkEckM8g+lGkZldB3WvOOWNG6taeSbUMLOIKvwrxWSL31Yd9pqduOwqZQSytuyXNd
	 UQ0yKon8+y8mP2SRhhmc3KeFtaggk21FAGAoyR5duTSw6joZFKVD3zPIa9R0iQB+pEFvv
	 JrcTm3PiseQuYXix2EF2GUUU+ojGwKTxtldBm8MAHme+WlrfwMk8OZxSCBmI2inS0wnNG
	 v9RSR4crlMqOou4tn/A001QV3Nubt2a7itycbw+nFlLcrX78fcJyUmIbdrxC4RkG3bR+A
	 OxgJng4KjP7pR8f4QKUR9jZBqf7jma8TGY+ooqWQk37/cahTPE3fjG215tnlr+AW/+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793927815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YOv+CJ4ODBOeaz8mbjoHLIxOl6OLVvC283CBSMIj7LY=;
	b=KTl33ZPKNbQ2w9Oa8RDYRWy2pUoN6ILI5wddxATjPGmHpbZbmb9QDSKHVAgqMCPB7ohU
	 hDWIPqerX/5tjyQ0HQZT8xFj4dlUomJheCBIvZADWKgsagfq6E18KNOfQvpWZCaJuXviK
	 Rc8JdDvKIL3SHG+o21F4J2tK1f04y16yIavjE2KejJsFTufRhfQln55bWZEpsCWMdkFDF
	 FnCBlLd1ZuGoQkR15yMPkKnvPL9Bf1yoYReAaLVRBbd1O5JaIiY+aZws5z7pDzb9d4XH5
	 Sau9/ksBI5i1vUdQg6FaGzCgsOydRMT6mdepQBx+hSTAE9r05uLZmzQy6zMKsFOs2dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nJ580VF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEACA606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEACA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nJ580VF
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3accd1ff4c3so539881fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 17:16:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793927813; cv=none;
        d=google.com; s=arc-20260327;
        b=hkLCRwKQH79d1dGd3wO9txBYh+/Jq24RQaclzf3bsdALzjRSOKyVQ1mqoiPU63cBu5
         shpAc++qaSPQ5VSGS4eIDvonD1boC5aowXDjaBhnfP7Z0Yiu1vWbX65qTfff1hfZwqWj
         xOKg3nAWwhG61WeOR3Tp4F9HB+aXD2GgfQJGmDSuvlcXH5uL102kOWZ0l/HMqDNJn9H3
         YEuBvLkBk+kjdazux+sPeCIaM6TYaQQvjl9zcRqyh+m6oGjgCepFi14dE0cBxoosIzIi
         EnuE9rNrUnsUSgHjx6NmkJTFV6X++hWN5LlDEX4eu26YBqyr5aNMurWBIfxFnNq1CDoP
         HM0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOv+CJ4ODBOeaz8mbjoHLIxOl6OLVvC283CBSMIj7LY=;
        fh=m+nnESpxPz5MOirTH8jTaXfOqJnra2txvwxe+wvaaB8=;
        b=ZuP8j6a8EwU66577D8ldRcxdKyjNJtIgChovz3Mjk/Fkc5W8SFBL9kk9Adb+UN3v8R
         snhIjx5a+719NpQQ8VHBq9/0aaRfUDnM2ExJg8EC0V6879GkW9rKXOfNxD/WpCY+fyNO
         +/yG+fv+2HuLFB+HMQF3eHZ5IYlZK4VXlKCu18+0UuMfpHNUjfgF01ym4bAigrR7FLvC
         +1Hxh1bpb7AAJLSiNAxQXBLxzo5yqH07clNdmASeMvEb6Nl5ZOr5ao40MgFEFhc8toUQ
         vpBLlC4GKR/YL87chY8qWgC0Gh1FJExcDi77NuZ4QHFSF170+2Mr5BIRTDBaCgwz0Njm
         +H4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793927813; x=1794532613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOv+CJ4ODBOeaz8mbjoHLIxOl6OLVvC283CBSMIj7LY=;
        b=0nJ580VFUJ0WToayAnzXs2gbZ4rmp6d/1Fz42RO7ef1leazRXcK3dag/2IqWHEercb
         k1c8snUTkR9Guw7Uocu+FaD4pNWeipPXpbbGMybvhQ31vS8SLNvvHBMr942EzA8lQYEh
         nSJHN0+v8sK54f7w3X+bFVgmXEGE/lzSwWFvob1n9Z3V0kY5AHXleODyQ1xUOfpGo1kg
         mkktpJHCqkdSGo70aZCMyQ5FPEBOIG5d92j1mux83ixMwFHOGwf/wv9HfUQKRa2ywIKP
         2w5abB1IeiBMBHjFMSqXkLA3oE4rj9c9HTvO/0cdOy55fLQXAPMciv75iZFh6iyGDewa
         ikjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927813; x=1794532613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOv+CJ4ODBOeaz8mbjoHLIxOl6OLVvC283CBSMIj7LY=;
        b=IgLGoTCQ/yVSFi50QYac/zbOIjbQnZjPYAPYm1ism1GvJqo1P7dFxSQAYrnALFYES/
         kCYRYGTgtRZPyHRmTqjES69QpqOJBtNXpElOpq/aqSlhcCFTV17xnSNEtw4geGlh0XR8
         cObsl/YEEDh/OZs1XEPX4wA/iSAgblRDzJzEWc28Jqg2QwsUglJjoC6GfEFLdLcSwrX1
         JI/JE405s0hAgFIDdA3p7SO0jQ6uN95XTEXnPNJrYB67zUuX+FcJDgenl4zrQYh2rChv
         TfA0KE3JCsA6Y5dvBk/thY2cjX8KqYAYkTXwa2bOXaPBZnhoKLRvN8Jye4dRKFPGSZCU
         jB+g==
X-Forwarded-Encrypted: i=1; AKwUvBw8wM4epIdrd0Id9zA7Th/J4J+40ZlJvj19JRFywYQsuST24MKkmsloXtfpD4Ot7FBGGmxSGZWUuTm3JkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8nqXgVUEhKXxWOZsszXQnm53934hwQD6Bcx04qGt/CU1OhQZcA
	kqtqr8VTUA/nbEMvhn4EvI5whIlRi0NFgf0CCi+E4NDHxw8EaxH83Y6wZ7be0Q5hVCty/bdXSGl
	ImfYgjv6g8cE4xOqwti9DfVHZDqb6V0I=
X-Gm-Gg: AYBFou2HXtvRf7+mmjcBZYcwCAUbVCk5menjVgR6GGtDlrfJNQYiw79dttIVj349GJj
	UdZNmlJ7mIriTwKDavCAzx3y3YysuAAl4/xuxLAhKbdNSDXH1PrGyOzd3Ty+McgxWkHxEWdIFF+
	2IFbRc4BoaX0eJXqa3TQpHLKDA+LVMIECVFTas0kkC7nuBUWElcrx/HPwTLNdPgYjJ+FbLoWndP
	m66Qxux/X60xj0WQgCJyDDKNTvUM1yWySihMDqyhzDeJCM4jOs0bSz5mDBxiuCgyASL5+0iwND2
	tE3xqlC2wgGcOikOlRZcS88tck/vNVynet6gBhZnFezDZIndtm4GphCiO3t8HvgWLsoTl1Khat6
	E5I9RK4sbDlNEX4LIlkT1RPHwXnhzG4ktqGwO8B9xA83GP+7qP+D2xLVqwx6/MzGdb7pEikYbNB
	rdalLqEIhuoXKuFmG0
X-Received: by 2002:a05:6512:32d3:b0:5b6:4ae:5b7c with SMTP id
 2adb3069b0e04-5c003ae038cmr231798e87.26.1793927812513; Thu, 05 Nov 2026
 17:16:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024183727.42339-1-igorpetindev@gmail.com> <20261024190758.2526-1-igorpetindev@gmail.com>
In-Reply-To: <20261024190758.2526-1-igorpetindev@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 6 Nov 2026 02:16:40 +0100
X-Gm-Features: AclHuK_n_guQRphuA-wSEpJbT2qllDa-fjtEwFRlUhJ0P-awQ2oQVZEVC8osNvI
Message-ID: <CA+fCnZdOtx2TPN9jsAoMOkq-UXEpQ-tS8QYoPbjdmkgDjHgQKw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: raw-gadget: fix double-free race during UDC
 unbind and rebind
To: Igor Putko <igorpetindev@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 24, 2026 at 9:08=E2=80=AFPM Igor Putko <igorpetindev@gmail.com>=
 wrote:
>
> raw-gadget defers endpoint disabling, request freeing, and descriptor
> cleanup to dev_free(). However, dev_free() is only called after
> dev->count drops to zero in raw_release(), which happens after
> usb_gadget_unregister_driver() has already returned.
>
> Once usb_gadget_unregister_driver() finishes, the UDC can be immediately
> rebound by another raw_gadget instance. If that new instance enables an
> endpoint, it assigns its newly allocated descriptor to ep->ep->desc on
> the shared UDC endpoint. When dev_free() from the old instance runs
> concurrently, it calls usb_ep_disable() and frees dev->eps[i].ep->desc,
> which now belongs to the new instance. The new instance's usb_ep_enable()
> subsequently fails with -ESHUTDOWN, and its error path frees the descript=
or
> again, causing a KASAN double-free.
>
> Tear down active endpoints and requests synchronously in gadget_unbind()
> before the UDC can be bound again. Keep the descriptor pointer inside
> struct raw_ep and clear ep->ep->desc on error and disable paths so no
> dangling pointers are left on the UDC endpoints.
>
> Reported-by: syzbot+b7534c9b380f81a3b4be@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Db7534c9b380f81a3b4be

Please also ask syzbot to test your patch - it has a reproducer for this is=
sue.

> Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> Signed-off-by: Igor Putko <igorpetindev@gmail.com>
> ---
> v1 -> v2:
> - Keep ep0 request handling in dev_free() to avoid any lock recursion.
> - Synchronously disable and clean up active endpoints in gadget_unbind()
>   to prevent use after UDC unbind.
> - Update endpoint cleanup in dev_free() to free raw_ep->desc.
> ---
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 30 ++++++++++++++++++++++----
>  1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index 4febf8dac7ca..a6b42679acc7 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -141,6 +141,7 @@ struct raw_ep {
>         enum ep_state           state;
>         struct usb_ep           *ep;
>         u8                      addr;
> +       struct usb_endpoint_descriptor *desc;

Why do we need this extra field? Why is ep->desc not enough?

>         struct usb_request      *req;
>         bool                    urb_queued;
>         bool                    disabling;
> @@ -223,7 +224,9 @@ static void dev_free(struct kref *kref)
>                         continue;
>                 usb_ep_disable(dev->eps[i].ep);
>                 usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
> -               kfree(dev->eps[i].ep->desc);
> +               kfree(dev->eps[i].desc);
> +               dev->eps[i].desc =3D NULL;
> +               dev->eps[i].ep->desc =3D NULL;
>                 dev->eps[i].state =3D STATE_EP_DISABLED;
>         }
>         kfree(dev);
> @@ -328,6 +331,20 @@ static int gadget_bind(struct usb_gadget *gadget,
>  static void gadget_unbind(struct usb_gadget *gadget)
>  {
>         struct raw_dev *dev =3D get_gadget_data(gadget);
> +       int i;
> +
> +       if (dev) {
> +               for (i =3D 0; i < dev->eps_num; i++) {
> +                       if (dev->eps[i].state =3D=3D STATE_EP_DISABLED)
> +                               continue;
> +                       usb_ep_disable(dev->eps[i].ep);
> +                       usb_ep_free_request(dev->eps[i].ep, dev->eps[i].r=
eq);
> +                       kfree(dev->eps[i].desc);
> +                       dev->eps[i].desc =3D NULL;
> +                       dev->eps[i].ep->desc =3D NULL;
> +                       dev->eps[i].state =3D STATE_EP_DISABLED;
> +               }
> +       }

Any of the other things dev_free() does need to be repeated here too?

Also, if we release/free all these things here during unbind, do we
still need to do the same during dev_free()?

>
>         set_gadget_data(gadget, NULL);
>         /* Matches kref_get() in gadget_bind(). */
> @@ -886,6 +903,7 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev, u=
nsigned long value)
>                 if (ret < 0) {
>                         dev_err(&dev->gadget->dev,
>                                 "fail, usb_ep_enable returned %d\n", ret)=
;
> +                       ep->ep->desc =3D NULL;
>                         goto out_free;
>                 }
>                 ep->req =3D usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
> @@ -893,10 +911,12 @@ static int raw_ioctl_ep_enable(struct raw_dev *dev,=
 unsigned long value)
>                         dev_err(&dev->gadget->dev,
>                                 "fail, usb_ep_alloc_request failed\n");
>                         usb_ep_disable(ep->ep);
> +                       ep->ep->desc =3D NULL;

usb_ep_disable() should already do this for UDC drivers that care
about value of ep->desc for disabled endpoints.

>                         ret =3D -ENOMEM;
>                         goto out_free;
>                 }
>                 ep->state =3D STATE_EP_ENABLED;
> +               ep->desc =3D desc;
>                 ep->ep->driver_data =3D ep;
>                 ret =3D i;
>                 goto out_unlock;
> @@ -962,7 +982,9 @@ static int raw_ioctl_ep_disable(struct raw_dev *dev, =
unsigned long value)
>
>         spin_lock_irqsave(&dev->lock, flags);
>         usb_ep_free_request(dev->eps[i].ep, dev->eps[i].req);
> -       kfree(dev->eps[i].ep->desc);
> +       kfree(dev->eps[i].desc);
> +       dev->eps[i].desc =3D NULL;
> +       dev->eps[i].ep->desc =3D NULL;
>         dev->eps[i].state =3D STATE_EP_DISABLED;
>         dev->eps[i].disabling =3D false;
>
> @@ -1010,7 +1032,7 @@ static int raw_ioctl_ep_set_clear_halt_wedge(struct=
 raw_dev *dev,
>                 ret =3D -EINVAL;
>                 goto out_unlock;
>         }
> -       if (usb_endpoint_xfer_isoc(dev->eps[i].ep->desc)) {
> +       if (usb_endpoint_xfer_isoc(dev->eps[i].desc)) {
>                 dev_dbg(&dev->gadget->dev,
>                                 "fail, can't halt/wedge ISO endpoint\n");
>                 ret =3D -EINVAL;
> @@ -1096,7 +1118,7 @@ static int raw_process_ep_io(struct raw_dev *dev, s=
truct usb_raw_ep_io *io,
>                 ret =3D -EBUSY;
>                 goto out_unlock;
>         }
> -       if (in !=3D usb_endpoint_dir_in(ep->ep->desc)) {
> +       if (in !=3D usb_endpoint_dir_in(ep->desc)) {
>                 dev_dbg(&dev->gadget->dev, "fail, wrong direction\n");
>                 ret =3D -EINVAL;
>                 goto out_unlock;
> --
> 2.47.3
>
