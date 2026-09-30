Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F5944F543
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760080; cv=none; b=uOVWX9/KEW0AQxqpqLg8dmFGGGlE7u/t/Iil9wG7Sh4UCYVKK7Xu5onZScxGNNYCi6DelzfRxWXe/MDv9jboePKwahGiVSta2E+aPTdeWlhJ0QYya0BfV7q92umqSSyUMUPkl5QQGKHQOis+XZb/YG9l7fA+kkSemJMnKG+lBP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760080; c=relaxed/simple;
	bh=lVsLiKAy7p7IfcJvewv6s5URcHOvXIRkgJmZf7dJ0vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EuuEazIHMDTlrVCu4oM81JZ8StsVBkUJ0ax7tTLccnVK6fok8lEoyIBifljfbDCyZvb1rpAiB1aCLvRUFz/6rGGXCcUo/eS2bTJus6zrJjTLpdXpHpV8oyB9TAdZGoJMuX8WMX4J6h8uwklHcBbdlZpwxsESyaJGeBQcH0MoeRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H78vh1Us; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H78vh1Us"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso1878914a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760078; x=1791364878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4uFxrRSZblzhovR/kIrS1Ft+xK7V+IoAvsNqkY5KOFo=;
        b=H78vh1UsHHvDkLnqWQaWKgrgilL+Ix+rRtAtY3PXgeRcf+T3A5x6sQ1WsxA105Vmum
         hRasGejg8dQ0qRd+LgFP+ZTKvAzaocn+NW84m3THPwnRRBwPyNqgdCinNb41pdKguwDW
         k52Gwvnfccw9/21tfQM1EZCccJxu1KMDUJ+JV+mz6Iycs6XFQD4PBAgxotQyGHjcJbkv
         KPcSwNv0aFQ/XtngGA/RiDn6Bzb8UItti/McVFD77klN9Elk8XjxK5aIQtAQwORBWGW4
         F89Hgr5FzEKko3v5a4ivGDXJpNNqgeeaj7Vmxi6AQzneDYEYR1F7+FYVGu/bgECHLRdo
         QeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760078; x=1791364878;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4uFxrRSZblzhovR/kIrS1Ft+xK7V+IoAvsNqkY5KOFo=;
        b=BUVlmy9w0rJShqVj3kpxz9UzCFC5qxteR8NlDa+1rwxvUJDX2091rWSmb4RxSxHlVl
         rzh8eYpRHwvdnhtKgfiqUmhmdl6rZu8jhnghwb/7NMgG7aoZ9X36fny9wdUNU0/77ntU
         OGwn5DxpUGId5oF4uHqbbYZMKPaWZ+iHXm/afE+C8oohzWjVwhXfPSdF+yvBQWKxtyfS
         XIHTew2Z98ClyoRRag3NIiWngZ5t5M70WCl8ZXIRjrE5LBuS66/WKhzLv5vN6xC/SSmy
         ToFXz8ig1VAa5t2Fmslfx3OZBTSwPKvPLBgOCxSK+Hgy9LqdyhW/lZMn1hjPC2I1uHB1
         sLDw==
X-Forwarded-Encrypted: i=1; AKwUvBxDRanem8MQb8djSjC8Tgfacxyv2VJ1LflcuUAeplnxJkqHYLxvhNGSrfTjXOnqZjsmoBR+9XeBHLXNYkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3ASd7Sl5RyCYlgMIcfNmO4bueFOE4QypXMrL/QP5aHeaXbdSn
	wFaFX3mpd7Qo7qLFI32Y/SmEktPeBi/9x4W7TkzJNpyM7fDxw6nVUgCTwU4rvP95
X-Gm-Gg: AYBFou0NUAXLdRJYMSI3apNez4y5jc2/URcIGI8cmWKKlimTOuCmorrP+0/ghZiU4cF
	dlKrKm2w6kdAKQ+A7dZ/RMiaJ7utW2ye0RIOzTRMlcvXzY6j9dKMDtJDTMDrXh5fLEpHj8NTZzC
	9W88vBle94s4cwm/bArgPAxVc1yIhPkmZ7k/ukvLCWyilcCRWmyZUMWVjIsi4ue3LDgOUgw47fS
	lMBS99udRVufieCQ7mFT/mN9fA2zulG1uHOkoEc9IpNSGoPSUu6rZdC4f/aRmXjq9D5ZrKW32jj
	ZV/3Cbu4G7tGwKRv4tOYdPDVVQwHy30o3LFWa1yBEnKOSYCSbpH5ZmoflaPou2TZVnayPkX0mRL
	y/TltAnO6yRmmr3DGUvwX08bbH/r8EUCmDHd1eflTndAYeIvmEJwZXmE2GEIfQhSVIHZ6kDkhNW
	hjmQ9QL0qG3/aADh+TLv0Da0dvTw3tUp20ODsC1o3OfQpEJ+PF1HSvrI/OCbeTXNMQgyr4
X-Received: by 2002:a17:90a:f944:b0:39d:f08e:e6e7 with SMTP id 98e67ed59e1d1-3a4d0f038e8mr414812a91.9.1790760077844;
        Wed, 30 Sep 2026 02:21:17 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ca7810d6sm3182760a91.6.2026.09.30.02.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:21:17 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:21:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rhys Tumelty <rhys@tumelty.co.uk>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 4/5] phy: core: Add managed phy bulk data helper
 functions
Message-ID: <arzSkE1kY_u4jJWT@inochi.infowork>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-5-inochiama@gmail.com>
 <arzITUCmgUp3uiRn@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arzITUCmgUp3uiRn@ashevche-desk.local>

On Wed, Sep 30, 2026 at 11:29:01AM +0300, Andy Shevchenko wrote:
> On Tue, Sep 29, 2026 at 04:52:34PM +0800, Inochi Amaoto wrote:
> > Add device managed variants of the phy bulk helper functions. So
> > the driver can benefit from automatically managed phy handles.
> 
> ...
> 
> > +int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
> > +			     struct phy_bulk_data **phys)
> > +{
> > +	struct phy_bulk_devres *devres;
> > +	int ret;
> 
> > +	*phys = NULL;
> 
> Why?! In case of error we modify the output, this is usually not the best
> approach as in most of the cases the expectation is that whatever user
> provide (including a garbage) should be left untouched in case of an error.
> 

This is something I think this is wrong and I need to removed.

> > +	if (!np)
> > +		return 0;
> 
> Same here. On top why do we even care about np like this? Interestingly that
> some other APIs consider this as np == dev_of_node(dev) case, and automatically
> propagate that.
> 

After a deep recheck. I think you are true. We do not need to care
about that, just let the internal api decide whether it should be
an error is better. I misunderstand that it should check it at early
stage to avoid some bad use in the following logic. Now I found it
is meaningless.

> > +	devres = devres_alloc(devm_phy_bulk_release_all, sizeof(*devres),
> > +			      GFP_KERNEL);
> > +	if (!devres)
> > +		return -ENOMEM;
> > +
> > +	ret = of_phy_bulk_get_all(np, &devres->phys);
> > +	if (ret > 0) {
> > +		for (int i = 0; i < ret; i++)
> > +			phy_add_device_link(dev, devres->phys[i].phy);
> > +		*phys = devres->phys;
> > +		devres->num_phys = ret;
> > +		devres_add(dev, devres);
> > +	} else {
> > +		devres_free(devres);
> > +	}
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> > +static inline int devm_of_phy_bulk_get_all(struct device *dev,
> > +					   struct device_node *np,
> > +					   struct phy_bulk_data **phys)
> > +{
> > +	if (phys)
> > +		*phys = NULL;
> 
> Same as per above.
> 
> > +	return 0;
> 
> Why not an error? I do not see the _optional word in the function name.
> 

IIRC get_all it a special optional meaning: treat not existing device as
0, this follows the same meaning like clk. Vladimir has a good explaination
on this in the previous version:
https://lore.kernel.org/linux-phy/20260907124318.6q4rr2huxyehm3zs@skbuf/

> > +}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
