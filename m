Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794750784;
	b=Rh5rZ5F+1QhmdHFGzZAEPJoFhBViSWWXoFcP+iajLtPKjtOSz8GFwV0/GwKX9ZMp0SFI
	 5YjeGG8DJIy3nwmupXOqIdyVVdiTcBVzXVjXigWMG8VCfYPPwmtAAFvI2LL0TW0F+Eby0
	 LRdSOd5dGbjRQTpXH9v8KHE/Je93Vq78CWI6JHTqOIvHSAYanwhdcxiVOi5b3vPmz/SsJ
	 DDaGc5jXIhO1xaKIBmQIyqTsA87d3AGSi6gc+R2PXnA/flkh1mYVQ3osoOgnExOWTAizN
	 O5bQFhyqcB2ORaSrPEDmznZmesXHES1kOvw2Ydobx6geDcVs76iLFUrV5ABzTcZFkBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UCRCbto+itoVVCJOHQCm5Fub/7/mLHD7BiTv/5zNwUQ=;
	b=4RFEXeEGgLei3wT3h4gnIw5b7M5CvQ1wgiBi/i2oJfJD9UOf0UMWiA0b4ZPLpsDYXLvh
	 13aDnVEEw27nT+2KlHIRoYZ1wnKjHAh3rW3FD58GRMNAKhA4mL5S0PEzcH31cbLySSY9l
	 /t+Y09oNLW2/P/X23cDQWeDbJkexkv+vMQHNq2XGUL8Csgx+4rgT6rUl7gT6ciVPvnTPz
	 nksX/HKYqHKVS7NNY3Wr6I9mnVthupYoR0zxnRr/SjK0r4PoERrW6QSIZg8rxLfhXO03z
	 uaWiTE9djJOF7diqghk3wSt4yOAgT9BzZemvMZz9b/bGBGZ4M17sPUC5oHxqRyLsYWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHISzKQC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072CD606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 072CD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xHISzKQC
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67da7d18f2fso739846d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:53:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794750783; cv=none;
        d=google.com; s=arc-20260327;
        b=ktOGoetMx71O1Kky1rhxeoLVQ0N1uZBr7Q4ny6w881HJiC8CbZ9iWY1olf731Q3x6O
         OdcXbyYka3rkfsiSpW3FMKwWZcQ+yOogb/lbAeKNCFA7s8jPvml0i4H6SxNW6URpbljf
         VS1v9vsiPaoYz3jkN+J6k2I9zCsPYF09pWquwerBMgylaEaWWEeyt89GNVT+caGKSokJ
         q9WuPKKO8JZquB1DNW3WMiumPJWy0ZYH/EBAbMee9Zsjb4OIMrL0SKMb+2nfUH0ckgPD
         Yc//xva2VyNZSzWOashGmWotaTOM4qKGVYEMqTxjojpHK64lCkhQwJwl44rbHkFo2IMa
         2B7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UCRCbto+itoVVCJOHQCm5Fub/7/mLHD7BiTv/5zNwUQ=;
        fh=znykLB9OBIHlsY/CF+IYuhjD9tXOad/oJ9zzYGfTkzA=;
        b=YS2ZH3rn1fFdb3eAToYG5GD0T+dPLguXIPCYtjcH8kw5MAMB9b8jyFoinKL5tubG7d
         00Pu8K7Gajvg0I8qGFUswO6OTQHdIXPH73AvdhMRgp0OVWBzSzs10pOBgTT/dGwBe5w3
         jwdUM5IIhO+geTFYxdXAtjo3R8fe4nnwKDT0dxeD1E4WRmqK4sQOeZsxxYTcBsrr0tL0
         uY/EqpA89NDlYdKW8b8BUnNly6/UPvSalpjXFBFFoRj30gdBJLUbTWAp1QVHp7C2EoUU
         wkdybgqK9MXRbut5dxFUMAJ+ahGpQEopC4c9dugUPCG8adnGA7KvymLm97RH9GdJrif7
         dj9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750783; x=1795355583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UCRCbto+itoVVCJOHQCm5Fub/7/mLHD7BiTv/5zNwUQ=;
        b=xHISzKQCob2MIC/7fwGbxd6mATX6RYCkrBRP+jtK7R5lDt25TB+5vsuMqnOz8+yf/7
         LMvSyZrkL+3u/c5PNGEPJQhkyHe4qWTJNg4o3pVw2NKl63Pz3/eCpMPATs4YPxE3L3LR
         M51XJDF8+WcZkiD3QeOWNbEW4ZtwIEyRgSe7HXSwkbXp4BpPbPVNzt9DxO2XbCm3VhpU
         rbGNXcP1IkomRozddP/pAiMJ4TYdzyi4JieBGA5CMnAc+QNv9yMMKohDNskULX2ZK1F9
         wFs/mOWviYCK3ktAY+IrhBaZ9mkfsACOOhN0U1CZrvJryoIVG+VQqW4KqljT5j6zgD04
         Ku9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750783; x=1795355583;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCRCbto+itoVVCJOHQCm5Fub/7/mLHD7BiTv/5zNwUQ=;
        b=MByjl6PYfshUeVjzeu5c0BeYCk+RixjVgYhrA5LXtwpR0VxxhTxF9wsqtC8zqNghGN
         K2oih8c4zvySjiVkYWjba11XO4Tn1w4JxECZ8nNmVcI91fqHK8NzMiKYE8VDTCEmwXI6
         SfQh2lAp1q14tzz1tkVpLel2z3THjzUNXzV/dgf3mi0gGcQ+gVixQSdcD0z0g58E6RQJ
         8g8N7/pTdWhRWTvQA/8qG7sM0ViJINnaevKF5VE2UzHpILymS2hnQCx1qOI/UHOuVxZU
         0cm+87CyBckfiPpUzrYg5v5MZm1dpp47jEheQuR7odyJmc5HyAS1eRoQMtiU86oo3fkH
         NeXA==
X-Forwarded-Encrypted: i=1; AL+hErH+n4+I5FJSANI/oKfY59f1WqF8PXzjaBS+tCUxhz0VWAGQQIL/eko9BRUhAge81J/HcnhRyT9nLtMthVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0YzMEXYzOI/jQHKWe4VfE6qM3OgQMaPEgxPtaFhQFbqn89/gk
	gDafoDGYL9ocYJieRfkW5m9qkDN6zXTdkk891fPYrJQoOKm3I9C7iF5s2E5l+OtXypNVUl7vUCs
	jbJs5i+wvGJza0/6/gRFQHxWju1qhm6Q=
X-Gm-Gg: AYBFou3Q0nb5Oqvqxm6k2GkbXaAd85Fi85sheVfab6rjRa2bwOcje16NJBDE+HjWypK
	ODDFXKrY7OIaGelSEPSdYyswn3VeEgnlsaEBmuAAr8zNS6Pb+WAV3KltPgAUAnDfn5DNZkUQJu8
	YXaLj2v+sO00CAjptm8hEGdP5m4hR/8e5OtVc54wSFKww6WTbpGAgeB0ip1HKS2K+mzQFhFgEiX
	oc+WYLwH+cHGnyG/R9YqnBuMR5kyk2tp8RW8zQ0Q+joBbFnnQTFdTduh0gBCoHKpApEprkhb+jo
	zqvDnpe1CxyFOqE7sdYwPDAocpfVZeUnQsDxUjKW+OZNaEp/4oNtmT0KegGWhJEOksZ0jRN68bT
	xGcN44TxZ3eAJiWi9TbfmpKxThDiG4zAJL6Kt4kFmo63UTn9W9FFqPxH95pMdVlHGFP0yYYAdb1
	fTrTyO+bei3PXp1oTuab071gqxcBbb9i0urH4jHX8M8iAanohxfTdkoRRG01+rDC8Rt4xARE/bf
	RPh/d+T/6NY
X-Received: by 2002:a05:690e:4009:b0:67d:a565:a57f with SMTP id
 956f58d0204a3-67da565a809mr1759360d50.6.1794750783006; Sun, 15 Nov 2026
 05:53:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260912035306.13130-1-kartikey406@gmail.com> <CADhLXY7UbSmK0aXs9SSM+k+MbYcWHxHSy4_8NOKb88Ys8SbLQQ@mail.gmail.com>
In-Reply-To: <CADhLXY7UbSmK0aXs9SSM+k+MbYcWHxHSy4_8NOKb88Ys8SbLQQ@mail.gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 15 Nov 2026 19:22:50 +0530
X-Gm-Features: AclHuK9wBrH_chg0fK25v0wArr17Inps9k5_5Hwct0maENlMAwuq3wRoG1IN54Q
Message-ID: <CADhLXY4zo1m1s_YS_VoLxQb5bdSq+HP-ZiiFyY6SN0Y6W1dggQ@mail.gmail.com>
Subject: Re: [PATCH] Input: sur40 - fix use-after-free in v4l2_release on disconnect
To: dmitry.torokhov@gmail.com
Cc: kees@kernel.org, oliverburns.kernel@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 4:23=E2=80=AFPM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> On Sat, Sep 12, 2026 at 9:23=E2=80=AFAM Deepanshu Kartikey
> <kartikey406@gmail.com> wrote:
> >
> > sur40_disconnect() unconditionally freed the sur40_state struct
> > (which embeds struct video_device vdev) via kfree(), even while a
> > userspace process could still hold an open file descriptor on the
> > video device. video_unregister_device() does not wait for open file
> > descriptors to close before returning, so if a process closed its fd
> > after disconnect() had already run, v4l2_release() would dereference
> > the already-freed vdev, resulting in a slab-use-after-free.
> >
> > Fix this by giving vdev a real .release callback (sur40_video_release)
> > instead of video_device_release_empty, and move the v4l2_device
> > unregister and the kfree() calls into it. This defers the actual free
> > until the last reference to vdev drops to zero, whether that happens
> > during disconnect() (no fd open) or later when the last open fd is
> > closed.
> >
> > Tested-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
> > Reported-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D34957180b0ed2581edaf
> > Assisted-by: Claude
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > ---
> >  drivers/input/touchscreen/sur40.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscr=
een/sur40.c
> > index 09d8c5f8d09f..bd8d9f6190fb 100644
> > --- a/drivers/input/touchscreen/sur40.c
> > +++ b/drivers/input/touchscreen/sur40.c
> > @@ -179,6 +179,7 @@ static uint gain =3D SUR40_GAIN_DEF;
> >  module_param(gain, uint, 0644);
> >  MODULE_PARM_DESC(gain, "set initial gain"
> >         SUR40_PARAM_RANGE(SUR40_GAIN_MIN, SUR40_GAIN_MAX));
> > +static void sur40_video_release(struct video_device *vdev);
> >
> >  static const struct v4l2_pix_format sur40_pix_format[] =3D {
> >         {
> > @@ -750,6 +751,7 @@ static int sur40_probe(struct usb_interface *interf=
ace,
> >         sur40->vdev.v4l2_dev =3D &sur40->v4l2;
> >         sur40->vdev.lock =3D &sur40->lock;
> >         sur40->vdev.queue =3D &sur40->queue;
> > +       sur40->vdev.release =3D sur40_video_release;
> >         video_set_drvdata(&sur40->vdev, sur40);
> >
> >         /* initialize the control handler for 4 controls */
> > @@ -820,6 +822,16 @@ static int sur40_probe(struct usb_interface *inter=
face,
> >         return error;
> >  }
> >
> > +static void  sur40_video_release(struct video_device *vdev)
> > +{
> > +       struct sur40_state *sur40 =3D container_of(
> > +                                               vdev, struct sur40_stat=
e, vdev);
> > +
> > +       v4l2_device_unregister(&sur40->v4l2);
> > +       kfree(sur40->bulk_in_buffer);
> > +       kfree(sur40);
> > +}
> > +
> >  /* Unregister device & clean up. */
> >  static void sur40_disconnect(struct usb_interface *interface)
> >  {
> > @@ -829,10 +841,6 @@ static void sur40_disconnect(struct usb_interface =
*interface)
> >
> >         v4l2_ctrl_handler_free(&sur40->hdl);
> >         video_unregister_device(&sur40->vdev);
> > -       v4l2_device_unregister(&sur40->v4l2);
> > -
> > -       kfree(sur40->bulk_in_buffer);
> > -       kfree(sur40);
> >
> >         usb_set_intfdata(interface, NULL);
> >         dev_dbg(&interface->dev, "%s is now disconnected\n", DRIVER_DES=
C);
> > --
> > 2.43.0
> >
>
> Gentle Reminder. Please let me know the status of this patch.
>
> Thanks
>
> Deepanshu


Gentle Reminder. I have been following up this patch for long time.
Please let me know the status of this patch.

Thanks

Deepanshu
