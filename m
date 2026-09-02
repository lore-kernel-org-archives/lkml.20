Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E6D4A385B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360032; cv=none; b=ErFAQg0oTQabgPaJ3PejrwrYuVXaYUbQaU+c2jP4dAgdBd2xV6Z+XKiGFRj7xWD8sjPasSmeJ1v3RpxPmbRQzXawVLDz2PsI76QKEh17P/Hsv9SjLFXI8aMwj+j4JTXvsQYnYiV4g73/cdXRBjblhTSjw5f7+CtOvU54PtLCrAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360032; c=relaxed/simple;
	bh=PGPV8PnvETwJ8x5UFE1NNCMMuNSjJwtF9qxgAEozccI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b5baFAp9BSB4pm/VyDYsVdWC5o/jjbLN0FijCGXjTSMnl7TMnaP8PEgvWtqKPyhEWVZXuDWYqt3vi78FLFoJjUMPBn7eG6tOSphPp4TekQYijSEeUzkuVWzRyZiFjJIXOd/jO3vzNpvqri/ir2MH0fA2J4uBs72FdwECfCfrGsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qXdvV+N0; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qXdvV+N0"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90cdffe8e3eso11775296d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788360029; x=1788964829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xp8kJNejkxTEYeNjUZC5PeSk6vljIo0WGI5C64Q9RE8=;
        b=qXdvV+N0Zebmgb1J6+T9QrwO6Xg3Kt9lQCEn8zTu5P8tYLA7Tab+f7aSYFsGtY9Vg+
         tlMdXwTaPWB2MVtBU+KlkpkK+zZF5RYYrHMSfJM2rrNxy7ZksLvePYXHNQtTw4Rdk6+u
         zNmHxiQFefRGyRiTlRYLSzqn1kwZPuo4a7uXPAHykQ8XEbtR2qSuHW119IpqM2xZfcX7
         PbbwYAVGCuV0MCHaYMH8rLZRYMy6oZZGnb2h7U/nOrTLCqidGwhVSeU7R46WEEJ4EblN
         I3k8M/+SL2/uqhF4h221e0rCZYrmXXBq4mqNXswIdCtz9Z3BDa0WVDv6EU0ao5d4vqKK
         NueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360029; x=1788964829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xp8kJNejkxTEYeNjUZC5PeSk6vljIo0WGI5C64Q9RE8=;
        b=STH1FpaW15Xs1konI8D17KbEMNZmSQXsblBpjZ3Ln8CvPhF/gomhzEBTjt9EUuArzS
         htTkaM/p76pebUDH5noH2I54IlRkQgQoxoIoPztiK7kOTgfbJ6NcKWFNf2EPNu2hjqBm
         IVYeFaHWLSc3RATsWa0owW/Qejka/49B6POWAM8FrL0SbJlOIGeg60Kx+pA5BbiuXo1I
         95BciHd1gV5vJ1QME61dRLEmEE95DHxKrhIsL/gSqU26B6OIlbFTgDaZCdlEYqpKyzdU
         ErotijsuSqIjX2Fir8KrjjNw/E9+6FIun7ilvHVfvpj3uIy1BkRrNdD2XofTMnRapBk1
         cRgA==
X-Forwarded-Encrypted: i=1; AKwUvBy0rWCZyAWVzcAEwXCT6jmRipema2AMiARqDyP8654Z6WImTeGR1e0ivWMQAZVkMvXWZIhGRFrc2H3q0wE=@vger.kernel.org
X-Gm-Message-State: AFuF++kUWTtWtvu6zB3Hd8Upqw7Db9IKhz6LIPC+gvj55qQGSPP7CwVj
	nCrWfX9kgNrK9LNni9sMgj9emQMgP0ihHboqgjg2nnjYTakngs6rmA3MXVoKyie5EjMI4uYxq+b
	fWzY=
X-Gm-Gg: AYBFou0NIgfkJ8CrVYk4n+P0BHg/1R8KtncYZMf+bMrCO3kq2aSuoZQl346m/3Smnzj
	4jbkgrRH8caG8dYHuC5DyiDp953Zw2AjDXDBm9hB4tk6YMeotQUL9zIVFu9XjM1qA/brCL2FA24
	4ifoXD5bPww90k4IDovj1XseFRSuQSOqw6j6kLfwUX8gj31JuxOdDBHYud9gjfK+tu2UtRKTXAs
	ujuiZveyn9WQGeMdT1Dd6Q5cB0CDGBEe/eIf+Ad26+k2Cja5i/kHtBu5Lklt7QVsrTCCrR+aJBd
	aLPohJOeXt4Jr9frZNE1+sk/jShqSQoqULBb94sd8LSsIz6ImlaaQvwhsHiuEp/IwY+YZdiRi0L
	RdfdQ3Dzcc7loJnTXONhW64Hlqipst4RYhyOsYU07TRCvgd5DqgHy5D3vY2ZB0OFTNmYcqXVfWx
	juP4naq7AgGSnOJU4h5HcNf9lbhJ8ngnBKIc9w9vDPTjt4yohYbHLOcHzRBaTJFh5iFanJxSSQf
	+UgfGM=
X-Received: by 2002:a05:6214:4909:b0:90e:8f4b:df24 with SMTP id 6a1803df08f44-90eb529e08cmr81307666d6.14.1788360029094;
        Wed, 02 Sep 2026 07:40:29 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9f0d998dsm19026046d6.9.2026.09.02.07.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:40:28 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:40:26 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v1] USB: gadget: Fix UAF on refcount inside
 gadgetfs_bind()
Message-ID: <319c395e-ba10-4fa3-ad3a-716a97cda27b@rowland.harvard.edu>
References: <20260902052137.3824591-1-rafad900@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902052137.3824591-1-rafad900@gmail.com>

On Tue, Sep 01, 2026 at 10:21:37PM -0700, Rafael Alejandro Diaz Cruz wrote:
> The UAF is triggered by the syzkaller reproducer which
> forces kmalloc failure inside of usb_ep_alloc_request().
> 
> This will cause the following error path to execute:
> 
> if (!dev->req)
>         goto enomem;
> // ...
> 
> enomem:
> 	gadgetfs_unbind (gadget);
> 	return -ENOMEM;
> 
> In normal case, get_dev() will be called to increment
> refcounter from gadget->dev->count but in error case,
> this increment is skipped and gadgetfs_unbind() will
> decrement it via put_dev().
> 
> Going down the error path leads to a refcount imbalance
> which will cause UAF in close()/umount() operations
> due to refcount dropping below 0.
> 
> Fix this by moving get_dev() above the error paths so
> that refcounter is incremented before the put_dev()
> call.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
> Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

But same comments as for the first patch.

Alan Stern

>  drivers/usb/gadget/legacy/inode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index 3e2bce7543d4..181b19e7fc2f 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -1679,6 +1679,7 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
>  	}
>  
>  	set_gadget_data (gadget, dev);
> +	get_dev(dev);
>  	dev->gadget = gadget;
>  	gadget->ep0->driver_data = dev;
>  
> @@ -1696,7 +1697,6 @@ static int gadgetfs_bind(struct usb_gadget *gadget,
>  	spin_lock_irq(&dev->lock);
>  	dev->state = STATE_DEV_UNCONNECTED;
>  	spin_unlock_irq(&dev->lock);
> -	get_dev (dev);
>  	return 0;
>  
>  enomem:
> -- 
> 2.43.0
> 
> 
