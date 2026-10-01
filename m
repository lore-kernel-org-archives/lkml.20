Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2D84718C9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 23:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790898606; cv=pass; b=pu74af1CJuyh18TMMQDKiYE3fcl94tE8bup5qMgqCRlOazbpKIcgl78nvm47vHcA9UPvcUes3JJQaYWrqRkdsVH+6kw9Gh0lRXjDozwRCOkAKi/3aZMAq9tlnS2yL6x1ITbJrVv8wWIglzxRblRFHDhigYm/sLc1CWOS3hcUSsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790898606; c=relaxed/simple;
	bh=tTc9z7FYsgGlwJPZrMfkGMhg4VwSkixsGCk/z8dgvNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhSV7LNsVcLAac6w6zy9AM49OLggjD7Ien5BlVUqGN4GjdPISLiZi0eh9oneBdEi4MFQIMNGS4fDQuhWHLS01jFAL5Dz7yTIm7sI2HGk56Hu10gD/txIQ51xaGAktky9L+wmcdnBLFbKq729tfG2hD6zx1K4gZ1SVsbJIaaMqCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc; spf=pass smtp.mailfrom=nextdimension.cc; dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b=g/MoVTUx; arc=pass smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nextdimension.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nextdimension.cc header.i=@nextdimension.cc header.b="g/MoVTUx"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4f3fe94887bso666059b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 16:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790898601; cv=none;
        d=google.com; s=arc-20260327;
        b=ADutAk+6zFn1slqPJVttkE+frnBkrjWkQHw/SBjz9+O4MgfATRg/jBVBsW07Z+yCDN
         51s69EEJ71UVqg+1DxuatOEsOTN/+90GXUDVFLhtO9lwxd/T6haVZPAHwvhIkdxDtpkh
         ureqlHGFadWFg43qt2F6sjxcpPKFtkYPBTaXt7c34IJ9RVmVgmn8lzLU4rQbvCBGepd/
         CqhgxVB2Pja9aUZhsfqAcC+dIJItTacmPEVI44TLPZvgijh6Uw9waalfEGQ9kwpQzsEk
         24b8dFyeOwtdJHChJcDNyui68JYO0BdRUismPeKC4qmqxsln1z+04iV3j8WxhPefh3f7
         25dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MKY9cPJJozKGHFrfmhUD53rTouOcT3tjSvoX5iN+R5Y=;
        fh=7T3+RFuD7vbFGhVCJUF05qoqReZGTsPu/9d0iAEzfUQ=;
        b=C/pNTGCm4dApgEKrtX5p0eDsqMI0+HZEtqYRwGwH9P7ozZVDTtLjvQwtiQIZ0rwluh
         lKXnHumNeSt6zs7fUolFE/o3++05iMOBBYzKJScnJHikFGl+FFUmX8Ifzo6v5LudRaiR
         lzsgi7+SU6JwZjMN4Bb2V/JCWgfIVSjIaaCHbDF2+HJpT/1baOSjiEnAv03kRClnICpk
         aDfocctYPVoOm6ERJrY/tGkp/jJfJSrMZbQXPA5keZlPWoG8BBLFcBrHfz1aqsU5xl9K
         Ta6QRbXK5csLlwvFLLPNRvcRKImZc86zQLV8LBTekAd5oqT6oGM+PTsBB4N5WCpe4Dmb
         7vKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nextdimension.cc; s=google; t=1790898601; x=1791503401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKY9cPJJozKGHFrfmhUD53rTouOcT3tjSvoX5iN+R5Y=;
        b=g/MoVTUx8H/5A9Jwk/t2momBlaXQpJJpMPN+UMkr52+EaCMHlrmXNLEIJleMz+CUST
         Hj+a/RV4spFrb149E+HBsJoyDeAMiY/uaU4P6/yXEuR4nF+XrioSvvPSafTCJNjf27oj
         k68WkbThAPHEK6X+mKE7vRnOhokFE3yTFirqfW6uh6SHDp9MoWBJLoBMY3l5kbohkoJ4
         1lsArFB7FzjIEclfk/REv8+tvKQU/TtMX+VD2addalWm6tuUFzpz2juyGuhECm3mxTvJ
         UlauTj+RH94dmf4t3g0S9FgEkHgt95szXah6liCjRoDus9bAvHvEuFBQdLgcGSuSTp3G
         /45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790898601; x=1791503401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKY9cPJJozKGHFrfmhUD53rTouOcT3tjSvoX5iN+R5Y=;
        b=lkzSJOzgW8XVyF0Iseu7b6AeJX62cbqJTXyx4UPJu0I91LR9X14HGUigpqRLsiiLzU
         2YzFBVR/bTs/3v+Lk66XNVK+sh6Zd/dgPe7FDDFvG4QhQAV9HXcyJRmkAv3tOyDIfz/G
         i4Pn50supcRn1sQgq9JhJo89uqU6K/Dk8kIwk5HXcM/9lm/ji5zsQKLtWBlSBPMo4QFo
         2/YeoSFuxhTPhDGD1taFTT+mqJLAjG8N9FH/TbUE46pgAUGKvDEb4vU4PoEwLF3HaXrD
         RIH7BAsRFnr4UkbGAjHMMlmeqYU/gRGvqFC3QgSqQXh5+MK+ey522j5L+LXf2piv4xEC
         Ks8g==
X-Forwarded-Encrypted: i=1; AKwUvBwHkOwaSh+j6PWvri0zIrBRJlZquMb/Evm4sleiMGKwu41z9tlKfybyGxT4iySidjIL8bRgB4eMjD+rC4c=@vger.kernel.org
X-Gm-Message-State: AFuF++mkyDCajNXUdxNuZemPoe0uyCfOHOcEQ37U5tGkBxBncGvkJmC3
	ZRrizBF8gtANTc3gHdprxwpGKaXUf/1FdKcun/1Q9C+caKCQ8+yVlnGV4pDz3IgxfYWksVOt6db
	9ugwoKR8ppDtOXjS+h1M7tzOo386UIDSWf8BFQi6vsA==
X-Gm-Gg: AYBFou1Jhm18Uo8tLgsJnE4Y9pPu3gBpe45LIl3R5fRvBRdvWLrOMHeIS9XE7dDcrXn
	A0XdOcB1tiiJUxhQ7jlovkWa9igRJzZ9aAhmq5UPwjj+FBUkNU8v9AqC+1Zr383od4gWlj2gy0U
	bw5FSvk6wL+f+BWdKMpiKrY+raY52UaRKvkz0L8vLU9t7VP7Z5McdYbyKy4M3VuPaktwh4PwElP
	b76uO8AGPT8h2JIZro+SXiXlaOuNzKhGHBW8szY4US0Bb4QaAezhsgCLN3r1NR9vacF0woMaCIF
	VIbIfZPGY1o18sXjv3e68ljwZTGXLBbKEXteGRbpIgSTYRx4aHLDSm7Y3g==
X-Received: by 2002:a05:6808:6f8b:b0:4f3:e98f:fa27 with SMTP id
 5614622812f47-4f529c28115mr654041b6e.16.1790898600864; Thu, 01 Oct 2026
 16:50:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930020010.85250-2-chris@kode54.net>
In-Reply-To: <20260930020010.85250-2-chris@kode54.net>
From: Bradford Love <brad@nextdimension.cc>
Date: Thu, 1 Oct 2026 18:49:49 -0500
X-Gm-Features: AclHuK8gO8mr_tN_8askeYsS8qGi_AKhcozyXpVKRtdSd-d60e84_diX5L1-c8s
Message-ID: <CAA0YaJRW_q4HhSaMR0WzmHiRzLvNtNfUcruT7qZnHFHVb5VVLA@mail.gmail.com>
Subject: Re: [PATCH] media: em28xx: fix inverted tuner capability check for
 VBI device
To: Christopher Snowhill <chris@kode54.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

Just a couple days ago I plugged in one of our products with video/vbi
and no tuner and saw this message. I had not gotten around to fixing
it though. Thank you for catching this and submitting a patch.

Regards,

Bradford


Reviewed-by: Bradford Love <brad@nextdimension.cc>


On Tue, Sep 29, 2026 at 9:01=E2=80=AFPM Christopher Snowhill <chris@kode54.=
net> wrote:
>
> Commit 8e53399c63c3 ("media: em28xx: Add support for Empia em2828X
> bridge") changed the condition for setting V4L2_CAP_TUNER on the VBI
> device from "dev->tuner_type !=3D TUNER_ABSENT" to a check of the video
> device's capabilities, but inverted it: the VBI node now advertises a
> tuner only when the video node does not have one.
>
> On boards without a tuner (e.g. the MyGica iGrabber, card=3D105) the VBI
> device's device_caps therefore contain V4L2_CAP_TUNER, while the shared
> vidioc_querycap() correctly omits it from cap->capabilities. This trips
> the sanity check in v4l_querycap() whenever the VBI node is queried,
> for example by udev's v4l_id on every hotplug:
>
>   WARNING: drivers/media/v4l2-core/v4l2-ioctl.c:1119 at v4l_querycap+0xff=
/0x110 [videodev]
>   (cap->capabilities & (vfd->device_caps | V4L2_CAP_DEVICE_CAPS)) !=3D (v=
fd->device_caps | V4L2_CAP_DEVICE_CAPS)
>
> It also leaves the tuner ioctls enabled on the VBI node of tuner-less
> boards and disables them on boards that do have a tuner.
>
> Restore the intended logic so the VBI device has V4L2_CAP_TUNER exactly
> when the video device does.
>
> Fixes: 8e53399c63c3 ("media: em28xx: Add support for Empia em2828X bridge=
")
> Assisted-by: LLM
> Signed-off-by: Christopher Snowhill <chris@kode54.net>
> Cc: stable@vger.kernel.org
> ---
>  drivers/media/usb/em28xx/em28xx-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/=
em28xx/em28xx-video.c
> index c418add65bb5..cdf1dc692b08 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -3001,7 +3001,7 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>                 v4l2->vbi_dev.queue->lock =3D &v4l2->vb_vbi_queue_lock;
>                 v4l2->vbi_dev.device_caps =3D V4L2_CAP_STREAMING |
>                         V4L2_CAP_READWRITE | V4L2_CAP_VBI_CAPTURE;
> -               if ((v4l2->vdev.device_caps & V4L2_CAP_TUNER) =3D=3D 0)
> +               if (v4l2->vdev.device_caps & V4L2_CAP_TUNER)
>                         v4l2->vbi_dev.device_caps |=3D V4L2_CAP_TUNER;
>
>                 /* disable inapplicable ioctls */
> --
> 2.55.0
>
