Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB2849CF36
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003309; cv=none; b=Xc69VLzxXXyCww9FJZfztVGrgilrt91xDk8lM+g7DPb8mb8fXhmwFC+mxzCeYz1tcO7inCtSnOy9349TiIX6uONWhJfwFGJ34VLVEBjYq0PwznQ9EpgQsPbNSskKCVIelOg88gV2wZF/PpZUeyKW+pQ4ONssYwm7sMYyvMUHx4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003309; c=relaxed/simple;
	bh=fCwNagdtC+xERup0Duo928kSAFipPyTqeVZkicCq3Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZADfU2O4yRVqUfDMjFz8Ecq4JAnVS76eJTOyk0aoSYkJ+rXWXnM0Y6K/Ty59VWjbZEhazKH5XZgPUhyM7x8TsO4QcCHt3AzBrgd4Ux+HW2uK6Hbcm6AR3fAfMCGRV8DbJmTxDjzXSV2oNLNwZawUEV1XkdNXpYH4YCHcS8NyoQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuILohad; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuILohad"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so2087387a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003307; x=1790608107; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DrCsmsL1F3ijYyM+yKS8GEyh5q7PmZK50G+TP1F0Yl0=;
        b=kuILohadCCbbVPonCn+2mtTtdRwx0XPIyBwiGf8Yz3h9aYb3vOnRCuZmVbNb/33ItF
         Xr7fzCNj2bm3vAjNRvEpekzVjT0rShmVFy02/DnA3JmOz7oy/Yc1eBIYMiZ7CQQCkhR1
         KZkIPIujfriukXrLphXMKToelkRnUW/3ZJYGEiPJqBzayE5SfMaL+UvXe+nXCqf8ydqY
         J1T4r5C7t3Noe55qr6L8LhlGCRfhS86Ht+bOAhDwD1x7VrX7RUoZbHB+j5b+c5E055Z/
         sx0I7nY2t8A70O9YghongSdUL9b7BhN5FPmrOXhu7v1M7P3ak2N/GlBR2BAEGGvU8ctH
         tl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003307; x=1790608107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DrCsmsL1F3ijYyM+yKS8GEyh5q7PmZK50G+TP1F0Yl0=;
        b=W8VOu83T/ng39HyVehGpv8AE7NkZWrS3tsnRGcdse35GucV1b0vObYsHVada+TKU7R
         DEH4CNjvEQG9xTtZeuP9gq2uIWLPcI0AjeT7U8h+KMd8+6XtiaGd5etsNjcwSUUWb1KK
         0zuxJ6wOpVyRzZnYVdTERdpWmm3XNMXM0FyO0BTnsIO6e054E1pNMhsLOER2AiYRgHnj
         h1XGOI0Meyp+7srD/vq7df4muuQVQYBgt0fS0TpIsgGcDFK5NwUBdwxgAWyM72rKxh2r
         PfeoGTm6FkO5JY8wQZE2XVqeWwAH+1uLhzSjshztI2xe6DKuGrd42x5JZlJQLKx+yZaX
         U9eA==
X-Forwarded-Encrypted: i=1; AKwUvByB0akbxDLkfO7sbbjSCwSoXHfOunfSAzRG73KqK1zryrng2cf10X57a4GzNg+WUx9dpy5rr2jgfcxqDRs=@vger.kernel.org
X-Gm-Message-State: AFuF++msOH3tDHGijZP3HR5Wkp2SRJmLlZvlQyMKGXG+Jy8b70+nWxrd
	UWT5d3WMlRf9kG+khBUaXj8Iv2hpKDhxqgrNvZKAERHG+nWMKXL7C/rM3qocnHq7
X-Gm-Gg: AYBFou15Vdi9+TM4QG0M7HhDIkBg2ICKX12Dukq9hqr331I4g4k4xPSqZP1OqGuMMFP
	1qPGFygBf+4urcs37exiAfqfXLy0OMikcjudK3V5kaSEEmo1IVvh5SDGGkYdTX/v5EhfsfT3ABZ
	pnEu36b4pJd4nZjzEDtBh1U7FzFFdn10BrMJU4D3HBg+9DXzwrH2VELo2YJ9VC5wHYLlxSFRYnR
	hSgVAZ74G2q+aQK5GFNR6cCctHoNPVxBVuBHlZ1+e0jp0dC1gOYYuLSrts9JiwKc2VThNV2sVUs
	nfgVJOnU/cQRsMQEIkNLlTalhJA5qzW937wUIzQ2Lm70rfH6xAGYWAcJBV5LhT/s0M6KMNouSi+
	+Rlmp0+DZ7XousK4KmhcNPliJ3VXHd7KCXLEAh6a+YXPTTFwxzH0KJYt0owKKwG2rbbA58vlZXO
	40NxHwsO2w8qbk2c3h7NakduBzG9YkWDRXHcvm0oSTFnQboHDLf18jqw/wiP/R6kJ+NPQUiW0Bd
	G35MAUZywRuKizzagQ=
X-Received: by 2002:a17:90b:586f:b0:39e:6a81:f34d with SMTP id 98e67ed59e1d1-39e6a81fcedmr11166715a91.39.1790003307043;
        Mon, 21 Sep 2026 08:08:27 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a063c1994esm523953a91.17.2026.09.21.08.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:08:25 -0700 (PDT)
Date: Mon, 21 Sep 2026 23:08:16 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2] gpio: cdev: fix kernel stack leak to user-space in
 error path
Message-ID: <20260921150816.GA103369@rigel>
References: <20260921-gpio-cdev-stack-leak-fixes-v2-1-3307c4320352@oss.qualcomm.com>
 <20260921133505.GA90171@rigel>
 <CAMRc=MeeVLALF6DU70DMwg7=F6d0kVdWEz=ugYJFt2dOR2T9YQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeeVLALF6DU70DMwg7=F6d0kVdWEz=ugYJFt2dOR2T9YQ@mail.gmail.com>

On Mon, Sep 21, 2026 at 10:51:42AM -0400, Bartosz Golaszewski wrote:
> On Mon, 21 Sep 2026 15:35:05 +0200, Kent Gibson <warthog618@gmail.com> said:
> > On Mon, Sep 21, 2026 at 02:56:58PM +0200, Bartosz Golaszewski wrote:
> >> If we fail to acquire the GPIO chip guard in gpio_desc_to_lineinfo(), we
> >> return immediately before zeroing the info struct we'll end up passing
> >> to the user-space later in lineinfo_get_v1(). This may leak the kernel
> >> stack contents. Make gpio_desc_to_lineinfo() return int so that the
> >> -ENODEV returned on failure to acquire the guard can be propagated to
> >> the callers.
> >>
> >> While not strictly necessary: move the memset() before trying to acquire
> >> the SRCU read lock too for good measure.
> >>
> >> Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
> >> Cc: stable@vger.kernel.org
> >> Reported-by: Sashiko <sashiko-bot@kernel.org>
> >> Closes: https://sashiko.dev/#/patchset/20260912123529.7951-1-tzungbi%40kernel.org?part=3
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> ---
> >> Changes in v2:
> >> - Make gpio_desc_to_lineinfo() return an integer return value so that
> >>   the error code returned in case of a failure to acquire the guard can
> >>   be propagated down the stack
> >> - Link to v1: https://patch.msgid.link/20260917-gpio-cdev-stack-leak-fixes-v1-1-2bb52879e49c@oss.qualcomm.com
> >
> >> @@ -2521,7 +2533,14 @@ static int lineinfo_changed_notify(struct notifier_block *nb,
> >>
> >>  	ctx->chg.event_type = action;
> >>  	ctx->chg.timestamp_ns = ktime_get_ns();
> >> -	gpio_desc_to_lineinfo(desc, &ctx->chg.info, true);
> >> +
> >> +	ret = gpio_desc_to_lineinfo(desc, &ctx->chg.info, true);
> >> +	if (ret) {
> >> +		fput(fp);
> >> +		pr_err("GPIO controller that generated the line info notification was removed\n");
> >> +		return NOTIFY_DONE;
> >> +	}
> >> +
> >
> > Does resolving a race warrant an error?
> >
> 
> I guess not, we can just not do anything in this case.
> 

You could log a debug rather than an error, but I'm not sure that adds anything
- I have no problem with quietly discarding the notify if the chip has been
removed.

> > Also, compared to the kzalloc_obj() error path earlier in the function, here
> > you flip the order of the fput() and pr_err(). Is that significant?
> >
> 
> No, if anything this version is more correct as we drop the no-longer-needed
> resource before printing a log. But with the above it's irrelevant anyway.
>

I was thinking the same, and wondering if we should flip the other case, but
small potatoes and not part of this patch.

Cheers,
Kent,
