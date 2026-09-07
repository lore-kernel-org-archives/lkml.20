Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105182D12EC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 22:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788819639; cv=none; b=uustwSfWPo25sZzp2dEZBGv3CLPC27wVdkCZhw0RFmLv4bOr+6OzDMw68Wk5TVtm13MGYvXkp2H0MASMXQmmjhRVu3kOecm8+kZ5vfJIILJsx8a5wcuXu7PX9UAJR+XaZn+UBeoExGrGI6n5Zepd8NpaAnXcYrMu6pRlYme1nj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788819639; c=relaxed/simple;
	bh=SRF5iYrQY0Qhg3gzem9X/jmCrj9ysqaOZji/FpMI5As=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oejyWeAnONV+dGLFsZxEjpiHw1Brl5SygBjlKcUpx6EYbMyuHd5TQDVURFXFLsKg69c4rp3JpoKCOcGxRcsW2jG8Uz0verEEVTORvzU6cEB5kdJl31CbKl9kpHp6UNtZ0TVLfKEkAozaEPNvO/uPSYg1FJkMu7HP+QMaEoKSBCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljQRD56Y; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljQRD56Y"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8525efa7274so2615162b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 15:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788819637; x=1789424437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w3uMI72I/xhLGwFiurXv4VQZSEIckFSObSIhl5Xmf68=;
        b=ljQRD56YgqHms/xLEAXwNJNKEFpbo5x8icI9PgWrEHeLutOuqFqwiRo65gmtBmHRE5
         dU+Qm98T0YbQa6yR3JapSj5cgGqlgkhqMlaJAIt8WY9dBQYLI35Ga7Ai3J7haR7JFq+s
         25gnunwpGjjVjx8rEcGX/fNQBxxugOrLz5ysXa0Cd5IOPURPU03VQoqLO3jiqJTLFyRw
         Bt7yD9kUqTWLntphPzj5hpJflDqWuTwFkQnvZoC+z0L5bHjoWtfz527Fh49Lbo4bjlj0
         QMnXDLablXNHh81+A4ELaFTBerw5ohbF3xI+/jfZL9ykxrrQHjo/1F2vi2dtGOlVxpph
         qEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788819637; x=1789424437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3uMI72I/xhLGwFiurXv4VQZSEIckFSObSIhl5Xmf68=;
        b=YCzQ/aFrG8Hi5SvdzcbNqq0c+dbl0SJTVfTFkbcKc1D4CCeOOcRqd3OkroQZlDV2/k
         1vYbNxSm0/tlg5bbjxkTb92YH5roxu0QWDiyVS8cM594smFtURz38cO2WDkDzfZeOs43
         RYGeMaBfRImB46qZ3nc4iuqSTNLGjYoBC1kp+tJU+XZcWafZRx65kxCp1wwLoSgXR9cg
         le92q7ydh0TCkXbyryLS2rUU3DyDPZZjMjTqCl3JuYAvt/LBxU1RNdSYFxQl3SeZID5i
         BBsOJTl/OfE52VAGaH4OTEzLdrJ7UPBcXV8ne21exLNtwHhhaM4gijWv1xFCih3JNXJU
         csow==
X-Forwarded-Encrypted: i=1; AKwUvBw1IH78fmTwZC9qUBurL+AMahstDzz5pTkJVDeeGbD6EY5D8AnmI4t7u/yt21dkG5YIEegc8mYCzKBIlts=@vger.kernel.org
X-Gm-Message-State: AFuF++kakg0Gp+YRIve0Z56jN6kSVyTwa9Hl43FAI8BqybadvW2NwpCy
	d2Wy9Lg5jhO49rQMvegd+qShNuBT7abdwiCRY5WNSBT/roYtgKWEOYYW
X-Gm-Gg: AYBFou1xxtfT+Gz0783YQ7eQZt9KLeSuQG5EkdaFoacKXbVYg9beeW394rSiepuJI22
	Dv0NfeEaZ9cCocZBVQVrRsQvDufstd1ULA5aDwgK8uBN5BqAgY+SFrdJwIMHiUzD/tJXgaRgY3F
	84dyH8toa017knjaUb0clXJg+yDyl+Z/3xo6r5SXZfFjU7jdb83EQ11aTRYq2S2+5hT/KmC5EAV
	qsFWL9H5RjejC/4Wj5SRF7cVlXRsviCRK4wY/iO/bpROvyIUQISepFHW6GtnTNhXklhbVjc3NVi
	7XBzEfxUg//yDqqh3w3RyOJ5YPpQWntz7nyu7MPrUbgIPOcGBpFdchI9yCouQ+S6TuSNeYiieuI
	gbHUvWZnJrRXFWTe1hHSMftwOTlMXDral9xZ+iCYOnvjuDeLWuxckAOuw3HGdsHNsahF1tXhkdI
	OfzOI6j7viQf1BIJM1BYNaL37l7RDtO9Q6fnWwaY2JlFNptJczbh51NSE6mM4=
X-Received: by 2002:a05:6a21:7983:b0:3da:7140:da35 with SMTP id adf61e73a8af0-3da7140ddebmr15960630637.15.1788819637220;
        Mon, 07 Sep 2026 15:20:37 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc455451b46sm4424962a12.18.2026.09.07.15.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 15:20:36 -0700 (PDT)
Date: Tue, 8 Sep 2026 06:20:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/4] phy: core: Add phy bulk data helper functions
Message-ID: <ap82-cuyTD4yNxKY@inochi.infowork>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-4-inochiama@gmail.com>
 <20260907114837.2y55l7dfqqrgcka2@skbuf>
 <ap6or7kpWUj1wBI4@inochi.infowork>
 <20260907124318.6q4rr2huxyehm3zs@skbuf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907124318.6q4rr2huxyehm3zs@skbuf>

On Mon, Sep 07, 2026 at 03:43:18PM +0300, Vladimir Oltean wrote:
> On Mon, Sep 07, 2026 at 08:15:04PM +0800, Inochi Amaoto wrote:
> > On Mon, Sep 07, 2026 at 02:48:37PM +0300, Vladimir Oltean wrote:
> > > On Fri, Sep 04, 2026 at 04:37:07PM +0800, Inochi Amaoto wrote:
> > > > +static inline int phy_bulk_get_all(struct device *dev,
> > > > +				   struct phy_bulk_data **phys)
> > > > +{
> > > > +	if (phys)
> > > > +		*phys = NULL;
> > > > +
> > > > +	return -EOPNOTSUPP;
> > > > +}
> > > > +
> > > > +static inline int of_phy_bulk_get_all(struct device_node *np,
> > > > +				      struct phy_bulk_data **phys)
> > > > +{
> > > > +	if (phys)
> > > > +		*phys = NULL;
> > > > +
> > > > +	return -EOPNOTSUPP;
> > > > +}
> > > 
> > > Why do the stub definitions of *_get_all() return an error?
> > > I would expect these to have optional semantics, i.e. 0 PHYs are not an
> > > error to the consumer.
> > > 
> > > For reference, I am comparing with clk_bulk_get_all() which returns 0.
> > 
> > This is the thing I am not very clear to. I found the clk_bulk_get_all()
> > return 0. But something in the reset return -EOPNOTSUPP for non optional
> > get (I reference __reset_control_bulk_get, as reset does not have an
> > API that is the same as this). I am not very sure whether it is best. 
> > 
> > Since you think we should follow this optional semantics, I think it is
> > fine for me to change this to 0.
> 
> I am only talking about the *phy_bulk_get_all() functions, which have no
> num_phys argument, and which as you said, have no reset_control equivalent.
> 
> The optional nature of *_get_all() should come specifically from the
> fact that the consumer isn't specifically asking for "this many" PHYs
> (num_phys). So the core can return 0 and say "that's all", and technically
> not lie. Not a fatal error to the consumer; the bulk API supports other
> calls with num_phys=0.
> 
> > > > +
> > > > +static inline void phy_bulk_put(struct device *dev, unsigned int num_phys,
> > > > +				struct phy_bulk_data *phys)
> > > > +{
> > > > +	if (!phys)
> > > > +		return;
> > > > +
> > > > +	while (num_phys--)
> > > > +		phys[num_phys].phy = NULL;
> > > > +}
> > > > +
> > > > +static inline void of_phy_bulk_put(unsigned int num_phys,
> > > > +				   struct phy_bulk_data *phys)
> > > > +{
> > > > +	if (!phys)
> > > > +		return;
> > > > +
> > > > +	while (num_phys--)
> > > > +		phys[num_phys].phy = NULL;
> > > > +}
> > > > +
> > > > +static inline void phy_bulk_put_all(struct device *dev, unsigned int num_phys,
> > > > +				    struct phy_bulk_data *phys)
> > > > +{
> > > > +	phy_bulk_put(dev, num_phys, phys);
> > > > +}
> > > > +
> > > > +static inline void of_phy_bulk_put_all(unsigned int num_phys,
> > > > +				       struct phy_bulk_data *phys)
> > > > +{
> > > > +	of_phy_bulk_put(num_phys, phys);
> > > > +}
> > > > +
> > > > +static inline int phy_bulk_check_disabled(unsigned int num_phys,
> > > > +					  struct phy_bulk_data *phys)
> > > > +{
> > > > +	if (!phys)
> > > > +		return 0;
> > > > +
> > > > +	for (unsigned int i = 0; i < num_phys; i++)
> > > > +		if (phys[i].phy)
> > > > +			return -EOPNOTSUPP;
> > > 
> > > For consistency with the individual API, I believe this should be
> > > -ENOSYS (not that I know why we would be using this error code).
> > > 
> > 
> > In fact I think -ENOSYS is more suitable, but I found almost every
> > subsystem use -EOPNOTSUPP for such a blob.
> 
> Why do you consider -ENOSYS to be more suitable? In include/uapi/asm-generic/errno.h
> it says "/* Invalid system call number */" which makes it pretty use
> case specific.
> 

I said it is more suitable as the phy subsystem already uses this, so
use "-ENOSYS" will have the same view of the existing code. But in fact
I think -EOPNOTSUPP is a better option as it provide the right 
information.

> > So I think it will be
> > good to follow a generic -EOPNOTSUPP. In fact I found nothing about
> > why the phy subsystem use -ENOSYS for this, maybe someone can
> > answer it.
> 
> It's been that way since initial commit ff764963479a ("drivers: phy: add
> generic PHY framework") with no explanation.
> 

Yes, this is something confused me. I see nothing for this.

> > 
> > Instead of switching to -ENOSYS, I think it could be more proper to
> > change the existing blobs to -EOPNOTSUPP?
> 
> Personally I have nothing against this, though it depends on how deeply
> you want to go in.
> 
> If you want to make this change, watch out for the following callers
> which explicitly check for -ENOSYS:
> - drivers/ata/libahci_platform.c:374
> - drivers/usb/dwc2/platform.c:246
> - drivers/usb/dwc3/core.c:1591,1608
> - drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1363
> 
> Only devm_phy_get() / devm_of_phy_get() return codes get parsed this way.
> For the runtime consumer functions, all consumers seem -ENOSYS-unaware.
> 

I think I can have a try by sending another patch. I think I should do
some search before doing a change. Thanks for this reminder.

> Though after seeing how some drivers treat -ENODEV (for an absent PHY)
> and -ENOSYS (for the disabled Generic PHY framework) the same, I think
> it might make more sense to return -ENODEV from the stubs.
> 

Actually, I think this could be aligned with non stub code. I found some
of them return -ENODEV in some case. This could be make sense in some
case.

Regards
Inochi
