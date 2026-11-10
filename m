Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794314236;
	b=inHAzPSlG0+qkusnWJaPoBCFggy33JsITAjiR7iPvsng9ICwqgyPzRoY0B2/dLOE8QxC
	 FPmnApn84EWkkBPaWQABs8sKperQn134gYCnbmas7Ypf9PLbcO3LoAf7KZadrRC/Ahvpy
	 2zkdh9b3AsFSp9bbGV2INUah1bH5Itgszse/J+FxcGWevL0i798sigd3asBiOKnM3S+2T
	 1boyudiYACQ6AHhFi/f/3oHhEjrDl2S5iUnAZrtT2nYrVsseb6J/KFmFN9zniqHXVTA4H
	 RyhkJbggoFphH/QhMSuYvN9jvWlnOz4hSxOTDFyXxDO1OlG25QOB40LVHjyvr/hygRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=87rulhgJfiv21qEaTxseqV/cAge3CoEQMJ20JUEXXlI=;
	b=JIyZP2oKrF5hWke3iCxXEMNe/She8dkWwmPsFszRxe9okgrWmp4QDrZCL/5AfHf7ID1W
	 +NyZtbPQ1qOkWMqvfKRjF2fyvVg6RpOOjsTwezKQzlw5iWSYanQ9AjafkaJzH1tNDnl27
	 R4fBU9aDMtyfxDRBRE0nTYPqXp7+nlwk6dOYZ/meG/gTGLiXC264/T26xZ444DmO4GYnJ
	 R+Mv7SeVGmln2UtDXSnbrz0BDqbVNk+PyCn6sos3suH+RpVn0QEtZ0kSft4LtOWkk6PnA
	 filBu1+eZJurwr68W8BZToSqJuZSW9nbDwNURXNow0dTqh1iC05WCb4/Zt5b1jFo0GA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaxtLhML;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0B4606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QaxtLhML
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4d58c50743so105211466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:37:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794314234; cv=none;
        d=google.com; s=arc-20260327;
        b=MUh8wUC4PNyFOi7b83KApcAcUYtmrf5j1i03A2SMnZhxTGvhjhiDvx4R8CC4v22VTK
         nCdzLxo3TB42Ajocl2F2jW5o3RJNFHxFqWdSKiGiR/QEFlK/ifuFXCJMcTX2hHgPCK7W
         B7ue1YOMLTEWxIc9tQ1P+i+i7AJWdUxa4c/Vf1D0sd9qP058koEGCezivDliNA9o7+HN
         WniqB/hN+pOUtjcvnd1Ac2UuLcWutR2QGc4d/l2mEy0RDQSUu1mrVXGJYiwMLle63YV+
         zjZqZBeXL0AWXW7XZQKvC9bW1X4g0B9+I7AhI8s+/XYmgTlr5/bwHckyZv5c30gG+HeV
         Eiag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=87rulhgJfiv21qEaTxseqV/cAge3CoEQMJ20JUEXXlI=;
        fh=B925MP+OBwtOYn59NNAVIKZaNUZnYFGh5LMG52vo+ac=;
        b=qTgzR8ZABZ6AbLwfilhEoJUisR6iKAlM28KuUkBOetgsvIqCs+56BdVYLmNfbhsgxb
         V/hz6MAdLDzPyGMiKEyEgTzIrhCFzD/MwuvX2+dV9jydwa3LUepPwmgYKsWo40Av/7ff
         qINt4WYuMpY2AJiu1z8ZtjQ4HEGCVG/NiH1W8SmXYOqTzlFJkDxe2v3vIgWc2yqbDkd6
         uPRwttsmegtuN3xpXcTNrcM4Zn9x2RmqdRp/XVnQJ226wC8H2NnSA6GVdf3i38Rp6mzC
         Jk//miKtS2Xhp5SbHghRfL7kKi89SY/kQgSn1qefDfbV+Qt6hLeWBD6hP0wycPgt9OW6
         M12w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314234; x=1794919034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=87rulhgJfiv21qEaTxseqV/cAge3CoEQMJ20JUEXXlI=;
        b=QaxtLhMLzna2DqFnl8rF0kzUuQU4IXhwXr/jgqsxFsK029Wl0NXvyNa3kBQTnhNlew
         meP8pvjnlMfYi4qcE8fCHtuwCV33S83R56oo8Dz5kufwGjs/nfQkCkYD+W5vAjxXYWLH
         drlGFjUqr3CrE/ddqO3eZNxUKm9z+6r15U+DwhqkKgoJUucg5+hesGYXy3t373HHvxHI
         KWKqWfbo481m0UFJzbAeQqX806D/S/Sl9lLyqUMeXCsHONVEvI9ABrEU4p3Co0Jz7YbY
         ry/8kz88NHnyvl5G159qP4/d2DX0izhVLbcZckPIuTyC411wBprFPKPDpSTE99Tg7QaD
         w+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314234; x=1794919034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87rulhgJfiv21qEaTxseqV/cAge3CoEQMJ20JUEXXlI=;
        b=SPPHuouFam8mFqrc9Pok9Hlp+WSdOXqHgzAedWz//p9ttAr0CsgZiI/c9W6gaQ44bm
         cTGi/h2KrQCU17TwsCBBaQwzw4Nunz8r9UpLeTVRV5wkrE+BIroXvwpcoprn4dpD7Mlk
         0eBd6CEP6g+2U5ARn6GnKBS4r8cd2K+TO+gA3HbgLRFkQJq4i+nkwmMCa0jZzI/JS2UE
         qRoFf8QwBTs9k0Q/0YHcgZaBjli7ifs9F2ZGjOjLpdZ96Su1UIma+Rt2vivU0iGECO3C
         kb39Mn9s6mCxm6ZwpYtkLiCLn/c5ply50ptgJHGQlP+/Ejbiib+irxZJdvWCA5fDkZ28
         mMkw==
X-Forwarded-Encrypted: i=1; AL+hErF0tWHoZR76Y/m3FMUSL88AsvEsZWMIp86wP8o80KMfCsNZkdXTyVztZUc5rVTl6KBJV8h5c9MXx6cB/ww=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dtV5Ikc8UCXNOI3J45YAndbZnupnySs/7nO4yiUxiDBjCTybu
	Ydd/bG866zeDMtv9CnrCf0ynymIPslHTL9bmUZ1Rjfy/5XZD+qt8ZvdNH3Q/1qJ+RY05u+AwsQc
	XcWp9wWdjgUPAsColB+J+pnd5uaA750g=
X-Gm-Gg: AYBFou3yteJa8GLN7VXZpGFNMX7bcibcXLmG0a+r9/B+/OtHOd+C0InzL4S4z2Fh5gT
	52QXtDiMVy+UZTTTXKtOYHEUApnRyshLwD7yoItBZu/2I8DJDEmHWlaR1d4gkK5LM5GgXnqDpBf
	Qc17/4d1nh9ikZtxd1XZ8mmDdwKJhag/ceJuDz93F3Bdtd1ITMvY6/NylYeA4F3Sa5qpA64V6hf
	1dXUUCivdS9SWF7Bla/7EqHKuvGpUxzWD0p2W5oo+pZ89hPAtcZoKHtIF7RUrWRSemohh83KkEV
	uloSKyX9mZ3Hvx4+gK9cw0IrJpBdlniDWsJC0JSD7LLNkAo331QHFiz0kLM5YOOoyTn3nPG4DYU
	DrD687U6hiW/CtdNkVtR6jQ/qCO6sg8si72qjJC7Yg1NzlgnNdXIcOKbTqnaC01rzwnzpjCFX/q
	DIlxWzgZomXBOEVj+Z54s=
X-Received: by 2002:a17:907:843:b0:c46:645f:cedc with SMTP id
 a640c23a62f3a-c50496efa2fmr206469866b.46.1794314233766; Tue, 10 Nov 2026
 04:37:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031210922.323-1-drifabdelmalekmohamedsaid@gmail.com>
In-Reply-To: <20261031210922.323-1-drifabdelmalekmohamedsaid@gmail.com>
From: DRIF ABDELMALEK MOHAMED SAID <drifabdelmalekmohamedsaid@gmail.com>
Date: Tue, 10 Nov 2026 13:37:02 +0100
X-Gm-Features: AclHuK-L9Xy9_jIPCQDlfmK_CNn6002vmZtvxWl3lyu2iMFsjY1T0_prMJR207g
Message-ID: <CA+xk8n_CwetRPVJtQRQLehqXFJstwb-hYPDyP2ZGyPiYOXFacA@mail.gmail.com>
Subject: Re: [PATCH v2] media: em28xx: fix v4l2 use-after-free after failed init
To: mchehab@kernel.org, hverkuil+cisco@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org, 
	syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
Just following up on this patch to see if anyone has had a chance to
review it or if any changes are needed.
Thanks,
Drif Abdelmalek Mohamed Said

On Sat, Oct 31, 2026 at 10:09=E2=80=AFPM Drif Abdelmalek Mohamed Said
<drifabdelmalekmohamedsaid@gmail.com> wrote:
>
> em28xx_v4l2_init() publishes the new object in dev->v4l2 before the
> video device is registered. If a later initialization step fails -past
> v4l2_device_register-,  the error path unregisters the device nodes and
> drops the initial v4l2_device reference, but previously left dev->v4l2
> pointing at the freed object.
>
> syzbot reported:
>
> BUG: KASAN: slab-use-after-free in v4l2_device_disconnect+0xa4/0xc0
>                 drivers/media/v4l2-core/v4l2-device.c:78
>
> em28xx_v4l2_fini() is called later from USB disconnect. It reads
> dev->v4l2 before taking dev->lock, and on the failed-init path it owns
> no reference. The last close of the video node can therefore drop the
> final v4l2_device reference and free the object between that read and
> its use in v4l2_device_disconnect(), causing a use-after-free.
>
> Fixing this by clearing dev->v4l2 under dev->lock in the init error path
> before dropping the initial reference, and read it under dev->lock in fin=
i.
> This makes fini see NULL after a failed init, while the successful path
> continues to hold the initial reference until fini is done.
>
> Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
> Reported-by: syzbot+1e71765881a6fc43185f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D1e71765881a6fc43185f
> Cc: stable@vger.kernel.org
> Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gm=
ail.com>
> ---
> v2: added unlock in early return in em28xx_v4l2_fini
> v1:https://lore.kernel.org/all/20261031204723.1415-1-drifabdelmalekmohame=
dsaid@gmail.com/T/
>  drivers/media/usb/em28xx/em28xx-video.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/=
em28xx/em28xx-video.c
> index 84424284d486..924a3f7977c9 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -2414,7 +2414,7 @@ static int em28xx_v4l2_open(struct file *filp)
>   */
>  static int em28xx_v4l2_fini(struct em28xx *dev)
>  {
> -       struct em28xx_v4l2 *v4l2 =3D dev->v4l2;
> +       struct em28xx_v4l2 *v4l2;
>
>         if (dev->is_audio_only) {
>                 /* Shouldn't initialize IR for this interface */
> @@ -2426,13 +2426,17 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
>                 return 0;
>         }
>
> -       if (!v4l2)
> -               return 0;
> -
>         dev_info(&dev->intf->dev, "Closing video extension\n");
>
>         mutex_lock(&dev->lock);
>
> +       /* matches em28xx_v4l2_init error paths */
> +       v4l2 =3D dev->v4l2;
> +       if (!v4l2){
> +               mutex_unlock(&dev->lock);
> +               return 0;
> +       }
> +
>         v4l2_device_disconnect(&v4l2->v4l2_dev);
>
>         em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
> @@ -3129,6 +3133,9 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>                 vb2_video_unregister_device(&v4l2->vdev);
>         }
>
> +       /* matches check in em28xx_v4l2_fini (under the same lock) */
> +       dev->v4l2 =3D NULL;
> +
>         mutex_unlock(&dev->lock);
>
>         /*
> --
> 2.43.0
>
