Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1032637CD2C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790133827; cv=pass; b=mOZ/NuZUNwMMzV2y43MlFFOFtlaXzAN5NLV2811KbdAUBWLhxhWF8jplbxjPYSIDaeWkjIAFyavwRlL0/PHItlEuD3BJJ57BRLYCgaBLJjqd4PVMmWcZEtGWSBVbhGrZIMKBCSncRlRrPzD1yL30C4Wm1vXnk7OyUQArmqxSDlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790133827; c=relaxed/simple;
	bh=hTaa0ekNdm0ClfdmyzHYT7ItvbWXA3cvQZ7wVxy2Cl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mh6iIf2BzpWbkGI6OHy/a1GH2tg9fZX1SeO5HcDJU3oMVoGsPG1TsakSW29QRrE/qdSdxq/hFBNrbXcWqtK7TMbfVHtASjK8v/GWZ33/0EMCjp6pL3mM2qvNub7OAd77pUAvzyrCHKXprMUk1a6EDvcu61UgV375rHKhyKFVy6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHuJqe0n; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHuJqe0n"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aa8e6bbso246452d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:23:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790133825; cv=none;
        d=google.com; s=arc-20260327;
        b=ecQYZAb82FcWDesvZisGGhTh3dyxXkZ21InzVmPWB4OXOIbE4Q+sGh9Zn1jTsSostg
         kkl678vgrVazcLr4m4h0y7IG2cRC72ItyYq4fGYrMvf810vyGi3rGia5+uBRanbH8o8w
         SWsD/yCDrMv8BHLi5mB97A7XdthJrbthsoRIrNKvV3t7jVdqF67RkjHrsAbw6zQt7rBW
         YlYuCGMt6+RUq8BL7URturXRVX8DvRobviLbblKoxFDzoK8vQ7vsm7czdkA1k0Blrw58
         RrfNVp/OIOToNIsSkgUss3C2kHX7nLmLzqDh320RGEomwYM5MhBfI7Ux3xri4B8Kv3qi
         8h4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2d+jrvEZexjVenG78loJJdYCjfuKeXtpLvBaz250Jnc=;
        fh=gfNF6KN4bh0kRLNzqnEaFDtP5AeEclFkYtvP3oFyQZY=;
        b=MGXP57E3kgkCx978r78pdJ85D9RQRypdChZxwm6q3gFZXf4dVLuKoaOH3Q97HCTbfE
         qo3NL+qjSmkLrsgGIWkYtACkXtW0ONd6b7icgtmzuwojxX8Nfji01/Z0r4pjTg6wsc9g
         kSA7vdY1w78FnuEU3boirMOc1/rYyIYQ32iTC36NQqjT06LPel8ETtFCG7m71WINrLqJ
         XW7wRibedvNle1NDy9noHDSt6Ooz3Y0EAtjz4yK51QIlrqpFuhDMEwRPxKSowb+CJI1M
         Omj895K2mG1g0nKA0CQiUC4kNriU3tTnj/eUHco0f7GsHJFDpgPo+bdrZ/Cw95COEmkx
         KX7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790133825; x=1790738625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2d+jrvEZexjVenG78loJJdYCjfuKeXtpLvBaz250Jnc=;
        b=XHuJqe0n5TsE8C2Ostezgf45VbBTckyRjNr+SZTPaLMNVZ9vc6aH9N6CnMgncuRfUa
         B+xavvqPcbtXr/D6wymkmW0GqUueX7yGWUnSnCU3OLM6gT2t4QtxH9RjePjulpmRgYqy
         yDzKRXFj3BZNMBYE1lx3rV71/TQL04szVFInva/ZsRPCTWDNZ/d8AGN29b009a4nVsQf
         2B8PxcajE1SuqSD5pc54xioTn4uDnC0WyTfBC2isWNikKwCAwxjZTB9UxwJ/mwW5I3Ud
         ZF4oxkYdvuMLkbRGsWBe/JgxZAalU4oDPyo5neKLR300aL8w9Dx4MNFNGiTFbp70KOp2
         ytXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790133825; x=1790738625;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d+jrvEZexjVenG78loJJdYCjfuKeXtpLvBaz250Jnc=;
        b=EBL4G3g73o1mTRQfSbslYkueakQPW3dtZRSWTlxwo9O2MyxneMr5tbi9TLXEyaF8UQ
         j7b71aJVUULdSAp59rMB/wiyzjJOFKcUS7sfNoWnoIXf/RclgJyBiUaQeWb3cJGBIPRf
         2ns7IdH2fyPYutuFtxeA28ab/ho9pAYcP01M4Rqy29XPcIt4cZVCpMlWBAh8Q7GRCLK0
         fuW/ZQYwDcAsJoaY4syWI6w39NW1Pnt5Cqy8oHgmEkyNzOwEAvSI19FYQhb+uxQ8ihB7
         2uTJle7cxrmlgUtu8qw9AX2ZieBqJLzowVWW3HBLUrnB3tu8jkWkysCeWxSLPbX4ipZb
         5Dbg==
X-Forwarded-Encrypted: i=1; AKwUvByizDUT4fX62y8wN2v6nnTjYDpsyzf4DXzX2jCtwGxrQOXGaz/xJB2EGBEV+gFSco/nNa2P/3jQDgbdwl4=@vger.kernel.org
X-Gm-Message-State: AFuF++mI8mhVSB5oAtnZxwkw2+O0Q9xyyqJ5D7AxRlcjK8lRyPaqUKEy
	nK1vzyezvAvDUp5uKTNwk0iMYzao9SwuW2R85ZKcIstZIIW7VDIMagQQu0q0UR7po8ui9qjO4ct
	jSkw6QNABf6D7GOJflfOMB4CRXDd6KRs=
X-Gm-Gg: AYBFou0bvHp2UR5fbzueyUNhzVROVmpwuKr+Y//JdeviMrOoo5/dqLZoUI4mUozM6zT
	hFmckmh5TgIPsGaMOYY8SnukUCpmzCrMmnO9K0ZyJ/2yWXltiG/na2+ZlmsBZ099rtFxKqDL4pw
	5r7neMliDakqmtVa9qJmkOqor34a546x4zYzWyrZhRQqGKCEAXxZCDNG9IzUVlazFjPdgjdPSO9
	iYzGfFNuxsWZh64M6yz/Pa8SB+EZOgt+HnbPiT813WDMOrRv6tsKIp8WPfQG7krxlHa7Rgs9eD6
	hWQypc+4H7Mom5bEI4htR8wtLpW/wC+yxXaT/CpoY9d1o0xKk97tXBoqccJi7kniLV8/RF0Nkxk
	XNDwpXvV66Vyv8yCbRIyexL1k4Lmp2aEsJeQtiAfxtgYH91IZKHQdSg==
X-Received: by 2002:a05:690e:4887:20b0:671:40ee:ddf4 with SMTP id
 956f58d0204a3-672d5a672f5mr517247d50.48.1790133824920; Tue, 22 Sep 2026
 20:23:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260912035306.13130-1-kartikey406@gmail.com>
In-Reply-To: <20260912035306.13130-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 08:53:33 +0530
X-Gm-Features: AcwNN1V63Mvj_g22-PUgvs2G9LwXk08boBIvwUHModkUD8SqmI6fT1lk081aeSE
Message-ID: <CADhLXY5Rg5EAtfJ=+SyTWNp9-s7RVMdyZThJT5yC15GYh6X-2g@mail.gmail.com>
Subject: Re: [PATCH] Input: sur40 - fix use-after-free in v4l2_release on disconnect
To: dmitry.torokhov@gmail.com
Cc: kees@kernel.org, oliverburns.kernel@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 12, 2026 at 9:23=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> sur40_disconnect() unconditionally freed the sur40_state struct
> (which embeds struct video_device vdev) via kfree(), even while a
> userspace process could still hold an open file descriptor on the
> video device. video_unregister_device() does not wait for open file
> descriptors to close before returning, so if a process closed its fd
> after disconnect() had already run, v4l2_release() would dereference
> the already-freed vdev, resulting in a slab-use-after-free.
>
> Fix this by giving vdev a real .release callback (sur40_video_release)
> instead of video_device_release_empty, and move the v4l2_device
> unregister and the kfree() calls into it. This defers the actual free
> until the last reference to vdev drops to zero, whether that happens
> during disconnect() (no fd open) or later when the last open fd is
> closed.
>
> Tested-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
> Reported-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D34957180b0ed2581edaf
> Assisted-by: Claude
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  drivers/input/touchscreen/sur40.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscree=
n/sur40.c
> index 09d8c5f8d09f..bd8d9f6190fb 100644
> --- a/drivers/input/touchscreen/sur40.c
> +++ b/drivers/input/touchscreen/sur40.c
> @@ -179,6 +179,7 @@ static uint gain =3D SUR40_GAIN_DEF;
>  module_param(gain, uint, 0644);
>  MODULE_PARM_DESC(gain, "set initial gain"
>         SUR40_PARAM_RANGE(SUR40_GAIN_MIN, SUR40_GAIN_MAX));
> +static void sur40_video_release(struct video_device *vdev);
>
>  static const struct v4l2_pix_format sur40_pix_format[] =3D {
>         {
> @@ -750,6 +751,7 @@ static int sur40_probe(struct usb_interface *interfac=
e,
>         sur40->vdev.v4l2_dev =3D &sur40->v4l2;
>         sur40->vdev.lock =3D &sur40->lock;
>         sur40->vdev.queue =3D &sur40->queue;
> +       sur40->vdev.release =3D sur40_video_release;
>         video_set_drvdata(&sur40->vdev, sur40);
>
>         /* initialize the control handler for 4 controls */
> @@ -820,6 +822,16 @@ static int sur40_probe(struct usb_interface *interfa=
ce,
>         return error;
>  }
>
> +static void  sur40_video_release(struct video_device *vdev)
> +{
> +       struct sur40_state *sur40 =3D container_of(
> +                                               vdev, struct sur40_state,=
 vdev);
> +
> +       v4l2_device_unregister(&sur40->v4l2);
> +       kfree(sur40->bulk_in_buffer);
> +       kfree(sur40);
> +}
> +
>  /* Unregister device & clean up. */
>  static void sur40_disconnect(struct usb_interface *interface)
>  {
> @@ -829,10 +841,6 @@ static void sur40_disconnect(struct usb_interface *i=
nterface)
>
>         v4l2_ctrl_handler_free(&sur40->hdl);
>         video_unregister_device(&sur40->vdev);
> -       v4l2_device_unregister(&sur40->v4l2);
> -
> -       kfree(sur40->bulk_in_buffer);
> -       kfree(sur40);
>
>         usb_set_intfdata(interface, NULL);
>         dev_dbg(&interface->dev, "%s is now disconnected\n", DRIVER_DESC)=
;
> --
> 2.43.0
>

Gentle Reminder. Please let me know the status of this patch.

Thanks


Deepanshu
