Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792468414;
	b=pXuG4yVWs6fg7r49T+YEHMv2UlnJ9N4SJaKqDzQBdcCKe4X33IuXQfnCwvnl7gwbFONM
	 N5wVNP+umwGE1HVRwJpPyp/7If17mOxjXLUoFDRW3UjnnGsdj4ZsSBz0R7KPZostCjyEr
	 U5SftdVPiHlEPPCG7xchVOL4L6m0w54z6QjTY0/48DZEz5ikHa4VnzDdNkh3AC977tVAZ
	 7+S87bragy5xBOrHi6XsMmKROFuJ+vEEgocsrVcYINCXDf7JnJI9KecFttdRDA5Pe5/tH
	 ha0wRsxfRUQXyqQhAsPsQHkyoEXGdTbLSrorkfP8Fwji42ii6TWnwfY/5NJyeL/M1ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792468414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=B8x7QIi4yGr+7efbbM83ajwXkFKzE+lcxp1Y5FQsBMY=;
	b=giCcI+dvxf3nFEjPsxfFFQu6cn3ea/7y3rxuVKwZI4l2QOM4DDieob0/xGJX8jCNFOex
	 vx5QjPVXb15eywn7QT6mIh/OU2srDPwCJq/JEiMdt4AbrbPb+sABQepQuaRSwjEQi46Wo
	 zx+SSeLgIrL1BW57PhZspleAQKLNLfOALt2aVcpZ50icnCo1Ua4sBsMqKP9K2ubpeFOsS
	 fPvv0QW2zoDr63z452e+Tc+LA2QutTY0Zve82JmuxmApb65Whj519Akmtz2xND+xAy9jJ
	 93eeXEdP2vct4CL747XwKKtUj+X0WJV+OIT6CNDsfeARHq1bU+QIX85B28ZtVWrTNUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="E/1d89xz";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75E7606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D75E7606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E/1d89xz
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9909e82513fso211329241.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:53:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792468413; cv=none;
        d=google.com; s=arc-20260327;
        b=WhBEsRve+/sjWL/vY+K3TVDwM/KFK95L9uL3jcsgad0kvs3u2MbOaVsKmnu9S00nE3
         BHagCmXD4w54jjQAd40mGXM7h8jH2MGyvXibTWGmygMqNfsvuU7hj8ms5qASO//0oRm1
         O6ziydlSqOHXiLBmAI+1zPIlEirVn/cb5wxjdbf82fIsTj88ynmWQ9ahnvblRODg3G6h
         E/xjpX4W7oSvLs8RZGKtDnlGlBiOMQcO564GtM4eXAokmJ7B+Ekk6zeTzp/LpyJ5Qcn4
         pgnVnI/+DemkFm8vug0lVbaPYn4QNCfDyEAAsqPtxdi9sa+gL7gtBVd5uSgWVXuhvLby
         Wscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=B8x7QIi4yGr+7efbbM83ajwXkFKzE+lcxp1Y5FQsBMY=;
        fh=pv8sdwnxouyetVgszTvdbytFw1OdVt51C/1xD3rXqKg=;
        b=ffi0ATlMmVBX8iNUONYZmu6CiiA3CFsvz4dA1CyQPLvfTQzxUqG/xuCuxD/9ydtKYQ
         R2n/wPH2/C2YfuuUdfk4Oj4KGA9h1BcjjowcySQCw4Ei43dM6XgULlcZOS7oMHdMwjsK
         0E90JRENzA042XMplDzlyqzA3bfgcDovqyY25kjD3kMUf66z0b148LkIgLRvt5GjHIDk
         p4OI5znoFX3T1HiCdVFsGdRxXU7y22DECzKUlrqhz64LxmLb2NxHJFpTOmgDO7ePuYIf
         2IrwUNKmW9CyHkFnWLkfhrJ0ugrChMeFHxw8NttqKzv60b9C78bB/ke/OC5efVI3EHHG
         qowQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792468413; x=1793073213; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B8x7QIi4yGr+7efbbM83ajwXkFKzE+lcxp1Y5FQsBMY=;
        b=E/1d89xzJd3uN6v8JmRj0qc1lnhhREM+ULZHcPaOOMv6guII5/oSZCYJ4nLHNRI8I7
         GNSQB1akrERgKLxg9Lj8dsWGPizgqaWAQ+ClxdZKJ/Q/qk9FLaimQXifDqypOtleo5OE
         X3+6WDdOVOZ/MtTaTgUvNS1iS87Yp7H1tWIN2pGduCTt0Zdvrd7E57QNBEtrXrouW+do
         STmVpeWqtzdMCO6QjTVRdgszrMyE9oLvw6gXQcQE4hmJzMOPJ14khsagqj6iKZnCQUnz
         1NwMQiwJZBVr3tNFp7pkmeUJWr2v7MWzwibVnNvXmPIJIpVyP3HG4jqm4UIN99TnXA1T
         Boqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792468413; x=1793073213;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B8x7QIi4yGr+7efbbM83ajwXkFKzE+lcxp1Y5FQsBMY=;
        b=wfxbqEDHdKLVaP8azFK1OR0l8geRTy5c3+X+aGF+LZCz+V9RDbExCLoOmWkA25z/81
         Dgz0rMy5SH8QlOlnx6pQo4/ItPVjuXJP5hSskZfBACqoTPd0wuziQX8WWkz/Avrv2F0S
         CAvTMH6UbMldkG3qIWIS1Xx2LbfvGUlTofwLaEmLEJf15rI4U08pafLMeKnpy/Xf5FJh
         125Kj6seFizAoPFlE2/S52kgHgwZ6nE9LAClRgt9CsksJQs6ls6g52vfAFeoggFTO0fM
         aQ0GuNC2yhGaqRCgmMkMA3fmKNefTJjSlxm6PY6Vz4Iip0Nkc3xUVSLIIlhOtnOKU3s7
         SUGA==
X-Forwarded-Encrypted: i=1; AKwUvBwqa473sJap5LWamaRXqgZMNCR0AEdTzitSO1FAnuOb7z3ymwqv6lkIURlU0nXeFALyey9Vvyg9vn/fuzc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0Z/Bhnw3y1Pm18Fw0uISN+4HaB/4YrDOaj2TNK2FlNHRlKRjU
	0Un/zf3+rTHBrAbENWoIIEbURCXe9t/zG58vNaQxBXxeltQtDDBeDJKp4cL+qSv8wG5zq0mJcts
	piukKStGCUMIG1eJ+CpkRKdrQgHHLKZ8=
X-Gm-Gg: AYBFou2kWekx5VuCioVZGuwxd12lY9bUtQ0IdtaKlWIXDW8MARQpJXrLc3iwW1bsle5
	S1wGwxDKU97nunBs2ITDUbYMuB9Fi/fk79SRp6JftVaqYJltEaFLZvScLZzpMRrhHBqnGyzjeFi
	zIKo3SIlPOO0tMYEsCQZATOQahx2PrXmI/TuTA9fjUgsxA90K254KJvQpSUNvYrFFK4MLOPmkLj
	CCrQmj3ycw+wu+nyQjHzoAq7CF8uP2ohA7Ck6yfQdGo6cAZe4F0s8PWNBQRrnTa8Pk109N+sfls
	0gtjQq+xHjcInRwoGZaneeBH1Kb38prbbOFVYwjtnDS7O11u8J6lugG1+lIi0vIebkAA
X-Received: by 2002:a05:6102:8645:10b0:7a9:e680:efd5 with SMTP id
 ada2fe7eead31-7cc7bca6de0mr171865137.28.1792468412768; Mon, 19 Oct 2026
 20:53:32 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 19 Oct 2026 20:53:32 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 19 Oct 2026 22:45:49 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <9a1b8caa-c260-469d-8b0b-6a2ca29226d0@collabora.com>
References: <20261018-fix-imx415-vblank-exposure-sync-20261018-v1-1-920383f39185@gmail.com>
 <9a1b8caa-c260-469d-8b0b-6a2ca29226d0@collabora.com>
From: Iron Berrington <berringtoni36@gmail.com>
Date: Mon, 19 Oct 2026 20:53:32 -0700
X-Gm-Features: AclHuK9XNMAuACY9V_8Ap8NkrnCzm4l0f59JyBZIo7KA_7HpUs6PKGbdATumTtQ
Message-ID: <CAF2O-sNE3bKxuZrYvkBJ=-4sgSrPanzbKfcHJ0kVgFqwn0G9Sg@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: imx415: Use target vblank to calculate vmax
 in s_ctrl
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael, hi Dave,

Thank you both for reviewing the patch and for the Reviewed-by tags.

Best regards,
Wenqiang


On Mon, 19 Oct 2026 22:04:36 +0200, Michael Riesch
<michael.riesch@collabora.com> wrote:
> Hi Wenqiang,
>
> Thanks for the patch!
>
> On 10/18/26 14:54, Wenqiang Zhao via B4 Relay wrote:
> > From: Wenqiang Zhao <berringtoni36@gmail.com>
> >
> > When setting V4L2_CID_VBLANK, imx415_s_ctrl() writes the new frame length
> > (format->height + ctrl->val) to the IMX415_VMAX register, and then falls
> > through to case V4L2_CID_EXPOSURE to update the electronic shutter register
> > (IMX415_SHR0 = vmax - exposure) so that exposure is preserved across frame
> > rate changes.
> >
> > However, in case V4L2_CID_EXPOSURE, vmax is calculated as:
> >     vmax = format->height + sensor->vblank->cur.val;
> >
> > Within the V4L2 control framework, sensor->vblank->cur.val holds the
> > committed old vertical blanking value, which is not updated to the new
> > value until s_ctrl() returns 0. Consequently, when VBLANK changes, vmax
> > is calculated from the stale vblank value:
> > - If VBLANK increases, SHR0 is computed using the smaller old VMAX, causing
> >   the actual hardware exposure (VMAX - SHR0) to jump by the blanking delta.
> > - If VBLANK decreases, SHR0 is computed using the larger old VMAX, causing
> >   the actual hardware exposure to drop by the blanking delta.
> > - Additionally, ctrl->val is clamped against the stale vmax limit.
> >
> > Fix this by using sensor->vblank->val instead of sensor->vblank->cur.val,
> > which holds the target vertical blanking value currently being applied.
> > When setting V4L2_CID_EXPOSURE directly, sensor->vblank->val equals the
> > current vblank, keeping behavior unchanged.
> >
> > Fixes: 3bcae55ab96a ("media: i2c: imx415: Add read/write control of VBLANK")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Wenqiang Zhao <berringtoni36@gmail.com>
>
> LGTM!
>
> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
>
> Best regards,
> Michael
>
> > ---
> >  drivers/media/i2c/imx415.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> > index c3b22b238..e5aa741fc 100644
> > --- a/drivers/media/i2c/imx415.c
> > +++ b/drivers/media/i2c/imx415.c
> > @@ -729,7 +729,7 @@ static int imx415_s_ctrl(struct v4l2_ctrl *ctrl)
> >  		fallthrough;
> >  	case V4L2_CID_EXPOSURE:
> >  		/* clamp the exposure value to VMAX. */
> > -		vmax = format->height + sensor->vblank->cur.val;
> > +		vmax = format->height + sensor->vblank->val;
> >  		ctrl->val = min_t(int, ctrl->val, vmax);
> >  		ret = cci_write(sensor->regmap, IMX415_SHR0,
> >  				vmax - ctrl->val, NULL);
> >
> > ---
> > base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
> > change-id: 20261018-fix-imx415-vblank-exposure-sync-20261018-967b008cf3fb
> >
> > Best regards,
> > --
> > Wenqiang Zhao <berringtoni36@gmail.com>
> >
> >
