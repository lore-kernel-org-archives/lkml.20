Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E132B2D9ECA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153624; cv=none; b=jodZjVY6w0zA0rlNHc8402LdWxhlFCiKa7xciPcmJZQ8SmvjAC/0jRExtjdq8FtMFu6d88TKPE7qsRNDisuGI3jok/bPzg7kgQYPJgXzP6WKELAGHgElrW0MaQww3UWgiz156EJJ1Ts6JiLNZHUw9lDoRS2wt1FPY6AsepPpoEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153624; c=relaxed/simple;
	bh=98ecSyrkO17ZqCtnhH8e84mWBDe5ugw9lqXvEjXRHKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNWmusLEeKVOh4dyUzKASHXYzvD+y4Y8/UfDCSCPZQZ48S0uEiD5JjwhmUyuW5iz/Y9S07zeBj4BekVKmFKo9CixY0VOfW4ht1W0p2/ksuK31nE6xc0uEDKGWDynMlpIyGQSB0hRm2WdC7b+oJ2bIWNLXGPl5WeVfu5gqakwlJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=b+2k1yRi; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="b+2k1yRi"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4f66bb2ab57so2618386b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1792153622; x=1792758422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4kk3k2LAPaVpQXPqXdPSS2vKhVQ1RIeU8ENmgowXRu0=;
        b=b+2k1yRiwqqYvx9KvyWNuExEgWtZusSznhBwUW6ANIt7k0wILOGc/eq6FrhjhiEOC7
         FcNpNA97YgXZTZO4fUEu2vABkLNO5s/KWj+wFbPSRAE6Meo6hBIvpEgX0M9SuIgEUJAL
         FuM3+JpRhpolIZH3WDxwaAJ1WNvusZbWOoJS1CUZz/dYXWWV7lMogSYX9WxfHsJxn6ng
         cAoBUb1okF/mRaZMpq7vO44PHh1FV9oEnE4NPKDh9W8efEsEaugdaFms4tRkuHJ2oKFp
         jlT3hx+/7jNYBt/OliEIspOhsAI334oQWdpmrpVhhqFPt3zdRfyR0/hYST0C9v/+1Qmi
         5E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792153622; x=1792758422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kk3k2LAPaVpQXPqXdPSS2vKhVQ1RIeU8ENmgowXRu0=;
        b=ikKuqZVbCv0pnTolQJcs/jaBpaxqJXl8W0Kl0fzWjvlZykjQYqUCt0hS0LEDA5yLFU
         hKoUmBVBf6u9iZR3oU41c0OwXNT5AXpeSDXYiEPrD8vPd5DTwKaoEZDjpx5tClfhEAiL
         EJ6eFF9NV2hcUmhJLL81L/IMouAB+5/G7NjHPkPROlcfIkxUIQ/j5ZzhMIl07VuUwc7d
         p9uWv5PT+fV6uNghISXebLtIHt2L1UZa+i5b1ugYBtZEboMdL/I3QTWwgTyfuq24t1wT
         Z1Sos5QFCW/4kxOpwHzgG1E+rasoDLqY2UJHWUsI69areZRSSvVu85L6xqVhZ5fRjk+Z
         yPJg==
X-Forwarded-Encrypted: i=1; AKwUvBx0dC+wFdCFwVJ0T76thhNS0eXDc8D9Zuwi4j5ILex1lT3O7KJ9RRmbyYNuY4+drl9OVacJ2bPVAR8nNkI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+ApZw/7twVZtbd3FVWz9ZXKwI+gY1GuuiSbyYfds1vTujdvPm
	x1zENUV3HflUZzDacilDwewTQlFsrXiHL+hTpT1l658l/MBqzw0K+z6nfxUtIzLxk+M=
X-Gm-Gg: AYBFou0SWlPW68ZG3dRNmCcK4GBuaZ4LstTkaEdGodh6tiQR3+Z55ZKPtyWp9UgbwvW
	XsWPM9NRUYkDpvKeIWrgU2ZKJgg2rwPEVaZX/ue95BN/ge71t4hy7UukyNmpRPzlhiNZo801g5N
	9sbOBktKn6FizXceIOGk0YyWQ57iUlAE2CFGPpYJo6qk3hKP7LzO4Mtif5DExHwNvIboTwqJmEC
	wwSm4Ylvb2xn9Csqj8e0lcmAMmoTWtTcGGkUeawFBzVcX+zq9kKBzYxE2bmmGJ/u7uTavbx1ZvA
	Vbiv0EYL7pR0lw2s72CMIqRd5uv95TunMPaWlgDsV82qhqAnBKLywEO/T7fcIESz9TYHy7PSMwh
	Y+TEc3mx1x0D5/sm2hdHG9XMTR6kG6y7a4cvLojguPdrbGL4GsUq+lpxQQHstjINTEG5EXndDmJ
	JclAlwyquy2jphXrxxNOWHXfv/Epu/fxz98X1OqHacueiWddLY0X2xNTx7RtJOxbzvJ7aFqf7Wl
	ctrPQfCc9WM8H/Otgi7Oje2R+DNNqhstjcRHv6y0rgWzWMR1sUhrva7bYOLmUmqhGCAA7aRAiYw
	YIWlcFg5qyFd/bS0hg==
X-Received: by 2002:a05:6808:309c:b0:53b:11c7:2da0 with SMTP id 5614622812f47-53b11c76e54mr477729b6e.21.1792153621529;
        Fri, 16 Oct 2026 05:27:01 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:e18c:88fa:219f:261])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388a928ab3sm1366174b6e.3.2026.10.16.05.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:26:59 -0700 (PDT)
Date: Fri, 16 Oct 2026 07:26:53 -0500
From: Corey Minyard <corey@minyard.net>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Donald Shannon <donalds@nvidia.com>, linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH 11/11] ipmi: Add NVIDIA LSTP IPMI BMC driver
Message-ID: <atIYDWk8CNlWOUZk@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-11-aambrozewicz@nvidia.com>
 <as1MyFx8Ih_I9BGX@mail.minyard.net>
 <20261016081917.1958681-2-aambrozewicz@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016081917.1958681-2-aambrozewicz@nvidia.com>

On Fri, Oct 16, 2026 at 11:19:14AM +0300, Adrian Ambrozewicz wrote:
> Hi Corey,
> 
> Thanks for the review.
> 
> On Mon, Oct 12, 2026 at 04:10:32PM -0500, Corey Minyard wrote:
> > Can you name the file usb_lstp.c, or something like that, to match
> > the other BMC side devices?
> 
> Sure. Would lstp_bmc.c work, next to ssif_bmc.c and kcs_bmc.c?
> Otherwise usb_lstp.c it is.

Either name works.  Just want it to be consistent, and your suggestion
is better than mine.

> 
> >> +static DEFINE_IDA(lstp_ipmi_ida);
> >
> > Wouldn't you want to assign the numbers in the device tree so they
> > always have the same number?
> 
> I'd rather keep them out of DT. The binding rules ask not to add
> instance index properties or custom aliases
> (Documentation/devicetree/bindings/writing-bindings.rst): DT describes
> the hardware, not how Linux numbers its device nodes. Our out-of-tree
> driver used to take the node name from a "label" property, and we
> dropped it for that reason.
> 
> A stable name comes from udev instead. The node's parent is the
> channel's auxiliary device under the USB device, so a rule matching the
> USB port path and the channel can add a symlink with whatever name the
> BMC userspace expects.

Yes, that's the right way to do this, since udev has something to
differentiate the device.

> 
> > It seems a little strange to set this up here and then register it in
> > the next section.  Why not set it up right before the register?
> >
> > The breakup of the probe function seems a little unnatural.  Not a
> > bit deal, but it makes the code a little harder to follow.
> 
> Agreed. The next version fills in the miscdevice right before
> misc_register() and folds the init and start helpers into one probe
> function.

Going a little higher level, I'm wondering if there is any advantage to
having this in the kernel.  Since it's USB you could do this all in
userland.  There's no kernel subsystem that this would tie in to.

I suppose the big advantage is it looks like the other BMC interfaces.
But you can maintain it more easily if it's in userland.  I don't know a
lot about USB, though, and how all that works.  Just something to
think about, perhaps.

-corey

> 
> Thanks,
> Adrian
