Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C35B45038
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 06:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788675043; cv=none; b=isqx4UlbMG/ldLRs7JwYqczNrWwVcCbTHf2mD+5NPXG0/T8JSr6eagm4keFHehUZvCsmeD6fLtm24RKpHUhdKpz5CtZ/6E0sfMoBDL46DaFXPEOxcVAtvMZ6IH05fKZlKigPGR3sXqoa7vll+sLaC1n/xi4oj8WLK7J+YcKClTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788675043; c=relaxed/simple;
	bh=ZMOTvPoZkDMTnpRW8UoWrVoBptoH6M8ExtNLgIKSWb0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ff/qz0GhL+SOHPWZ5JrjeTRf9PdLN8OgjeE69yT0WmLQ3ly/7S9UMXq5BdrKI4yo0oCbLcI4CyLmPSYOyJ+GwbmJXryxuB2x4jd4yTCOP63X/EiipfuyMFW/BO+jko/UOTsQInNBIIpsEdYN/zXka8XOeb9cJCZWvm6TUYPPXlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a9OdSPcr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a9OdSPcr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso19115705e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 23:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675040; x=1789279840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qRhq9LvKSjm2wQX4fbwj/VHHkEqthQPhEZsZ9yJlX8I=;
        b=a9OdSPcrmzVoJwnsl2NYisZtNw0PsBVjf+PGjkja4urc38SogXFMqIS+yPOvMtwCzI
         BlBLGgpDMW8e0bFbuEf5Tpyn3u4g0fcS8V59+GoqIMUVu7PWUW5bjkMqI2/2+FNIZaku
         CkkhEv8iD5aa9331GbYA/cnz2tz61AUwAeEk6l1SoLVNxZSWCgW36IUZyrOMTn+aDFeK
         fBl6lhbRRdn8qhiheE95YppN64nX2TQaRHm68czrMWIQJwu19sTr2rMyVRGDb/Pv36xt
         HkukQ0dfCyLUd/avJJzYgzKTuGv5G0U0Sp4/0LgcWtGz4lOROs6+i1mHbaxXsfDdE5vo
         n/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675040; x=1789279840;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRhq9LvKSjm2wQX4fbwj/VHHkEqthQPhEZsZ9yJlX8I=;
        b=Nd2vQBpgpZibGfovWXi5NE/+3Rx4I0hzGE14unWDmNLZTlcjcTiEJMNqhRsNBptYeu
         GHfrJkuWLJg56Ek4c/mp3SFC3CLNzP1X9Whu7dCHvSfW+gOfdiTGze5ezabQSH1DV/Ft
         uDpGYb96cuZn0VzMEKfgo12JLFoggV7NCGBUqrtDjkAB8yutP8aZQdeY/ZbGaCfUkV7f
         dWzGpOLGpVQx2/A/9e3/CoZI9N/XbTtuhIbLb7TwCuuJGqV5kEZG4uVBRyIcXX1lDLCA
         PPRQ3+/NteXh0hm+xhXDa5or0s/LFcpQpPT7hlvJ2NjRbW+1hJljW1YHPu7eIa0g76pf
         42Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxT6j3Czn4xoFTboWYTt5a7ritrqNvqCbmmbpwI8eYoaDkdbbS2fbxx3nbBH+vqPLT8vsSgAm6/k5sAieI=@vger.kernel.org
X-Gm-Message-State: AFuF++khhvcXABWdu/O9Ran9ADuCHO+uGGJf+rif8tLrpOXY7cNMphxh
	LZqHPUwisBSF0cusZBIlPaOMEYcrBN2DDjBGRdnt5OoVv+26oj41Xeko
X-Gm-Gg: AYBFou3N+xq6l8uo3oSxHAweNzEAcEo1FQ8W6LvD0BoDGtUKEgaKI2lER9uXgDc/EAY
	1yViU9lv9ZffO3J8Oab3leWsbxqkTvET3bwtlJ1QA0IidPeQ16NVTY84U541P22RzcyN6JtwLkB
	+18DDQr3EhgooUXFjDP60vpTc2JBDEzB5nmNHNQcC6W0gYdSSGj3bcRMZuRvQUn2YivGaKVnWZa
	8jyquyf1x2oVR8HVJCBAzMqvGvMT4JftFVpQ5i5DCECqkwvacCem7i9qFWAcEbOr9eulv0nalu9
	DO1iNvo+58Nm5utcjdqdwRLxADPUJ7EL/Ql+5yw6bg6DwA0YlvZKzUSm1KbrdUo+wbVmhrrXNxp
	IwHbrQqbvCdfGLZmfkEpBzcp71kMzacz+3M83rKk1L/fAXUBZYQpfUDv5xnHJtKsHNkbL/CYXSn
	CTqu8tggMq7ITyaiB4dXq5KjultsxA1hScHBAGG5dlt5sg/of4ftl4GPqYeya2FMkGpT3mVg==
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49cfc6ea7b4mr128812815e9.24.1788675040143;
        Sat, 05 Sep 2026 23:10:40 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm127478645e9.2.2026.09.05.23.10.39
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 05 Sep 2026 23:10:39 -0700 (PDT)
Date: Sun, 6 Sep 2026 08:10:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Ayush <ayush37735@gmail.com>
Cc: Thomas Winischhofer <thomas@winischhofer.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Subject: Re: [PATCH v1] USB: sisusbvga: avoid initializing device in open
Message-ID: <20260906081032.5ef81315.michal.pecio@gmail.com>
In-Reply-To: <20260905193634.160600-1-ayush37735@gmail.com>
References: <20260905193634.160600-1-ayush37735@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Sep 2026 01:06:34 +0530, Ayush wrote:
> The USB core holds minor_rwsem while invoking a USB character
> device's open callback. sisusb_open() can currently initialize the
> device while holding sisusb->lock, and that initialization performs
> synchronous USB I/O.
> 
> High-speed devices are already initialized during probe. Treat a
> probe-time initialization failure as a probe failure instead of
> retrying initialization from open, so the open callback no longer
> performs blocking device initialization.
> 
> Reported-by: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3bc656a9271e7c8a5c6b

Does this even fix the repro? I see no syzbot test requests there.

It seems that even if you delete this code, sisusb_open() will simply
wait on mutex_lock() before it even reaches this point.

The root cause is isusb_init_gfxdevice(), called by probe() and from
here, taking 10 minutes to complete on nonresponsive device. This is
the second time (that I know of) syzbot ran into this recently.


Thomas, do you still have this HW and a will to improve the driver,
or test / comment on patches? I suspect that those timeouts and retries
in the init routine are vastly excessive.

> Signed-off-by: Ayush <ayush37735@gmail.com>
> ---
>  drivers/usb/misc/sisusbvga/sisusbvga.c | 29 ++++++++++++--------------
>  1 file changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/misc/sisusbvga/sisusbvga.c b/drivers/usb/misc/sisusbvga/sisusbvga.c
> index 3e75a7c24828..6723a65b12b8 100644
> --- a/drivers/usb/misc/sisusbvga/sisusbvga.c
> +++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
> @@ -2223,20 +2223,10 @@ static int sisusb_open(struct inode *inode, struct file *file)
>  	}
>  
>  	if (!sisusb->devinit) {
> -		if (sisusb->sisusb_dev->speed == USB_SPEED_HIGH ||
> -				sisusb->sisusb_dev->speed >= USB_SPEED_SUPER) {
> -			if (sisusb_init_gfxdevice(sisusb, 0)) {
> -				mutex_unlock(&sisusb->lock);
> -				dev_err(&sisusb->sisusb_dev->dev,
> -						"Failed to initialize device\n");
> -				return -EIO;
> -			}
> -		} else {
> -			mutex_unlock(&sisusb->lock);
> -			dev_err(&sisusb->sisusb_dev->dev,
> -					"Device not attached to USB 2.0 hub\n");
> -			return -EIO;
> -		}
> +		mutex_unlock(&sisusb->lock);
> +		dev_err(&sisusb->sisusb_dev->dev,
> +			"Device not initialized\n");
> +		return -EIO;

Not sure if we really want to log every failure to open some device.

Not sure if EIO is the right code to retun from open(), particularly
after probe failure.

And really, are we opening the device after probe failed (see below)?
Seems weird...

>  	}
>  
>  	/* Increment usage count for our sisusb */
> @@ -2880,9 +2870,16 @@ static int sisusb_probe(struct usb_interface *intf,
>  
>  	if (dev->speed == USB_SPEED_HIGH || dev->speed >= USB_SPEED_SUPER) {
>  		int initscreen = 1;
> -		if (sisusb_init_gfxdevice(sisusb, initscreen))
> +
> +		if (sisusb_init_gfxdevice(sisusb, initscreen)) {
>  			dev_err(&sisusb->sisusb_dev->dev,
> -					"Failed to early initialize device\n");
> +				"Failed to early initialize device\n");
> +			sisusb->present = 0;
> +			usb_set_intfdata(intf, NULL);
> +			usb_put_dev(sisusb->sisusb_dev);
> +			retval = -EIO;
> +			goto error_4;
> +		}
>  
>  	} else
>  		dev_info(&sisusb->sisusb_dev->dev,
> -- 
> 2.53.0
> 
