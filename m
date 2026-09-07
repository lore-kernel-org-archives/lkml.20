Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D64E4A92CB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785011; cv=none; b=V7ungBrS8NX3XcQb02RxQUAmzOpKZ4j73KZIARs1gSmS+eA456i6S0555cLeyDJeIf1rqbnYbjdU3xnERR9SxlWZvWiCK16Mpif7dTN6su3gm5KC51D/vXkMwk7BCKpB1W6rFd/71ul80YpMx3QId2smoJHlxDkNNPj34aZfM1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785011; c=relaxed/simple;
	bh=uIPX6vCptdN5ZaOfsVL/qCBdAkjMQhWAdO+59lzECyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyPwAa9ae+i2yveEmT0i2/23Y7K0uHIRaafid/LETbE6eQbkjp2yV4pSsWB2S7139u/Wpeov1G8MKE31XSPanvptD33kWxCW/iT6lCXzGeSvjDhBPDOwpRJZIsistqE+6hmRPj/pna32CPTidgz/NBoTSKw0Fu5a2nJdDZg33hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yhm9mXSj; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yhm9mXSj"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cb7d44so285507f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788785002; x=1789389802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IABNEZ66YDQycQF2YzhlynFWVYVh8lX87+mEaozzsWQ=;
        b=Yhm9mXSjUskUWfIhqZrGNA4BfoeD/moonBtC1+bHVVYu2RPuEaaXF9lmmr8W5pkLog
         nScOBsr4wRmIq4PbsOSpGjvDOnaOY5DrBxAf9g1mUdOZclCZf+Ts3pw0R5bqSYb9wFTd
         oYup2M80+8HljRNR67lvtTCpYs8AVSn5jIW0mOh8oWupwB39tDQQSm3vtplPqlh5kFbl
         u//MiudB5I7UKdIE4kVHF9/A2CGn6VbymdT67VR4Scuzc/6rXqL27GuxbcmYmIGKIPx9
         GOI/uzhndoPFTkuFxp5boEAovt1QrSMDgFvLq0yvcjTaiEM5gRl2CNsnHlAbrFaYACdO
         aPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785002; x=1789389802;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IABNEZ66YDQycQF2YzhlynFWVYVh8lX87+mEaozzsWQ=;
        b=SVSmQLzUldH2cTmC3u1h9xN5KgyoEiJjuzoOZf9j57amoga+sWPX6PxkusDHu+SAUV
         OeE824Cru/FoQNzIR2/tEGu4dAGj65HxloB6/0HnqydQJMuJ2uMUYHf3vBnPsjYB5WXW
         S9XMImNoUyYYZSx15rPcb+AjsRZWqiHZcPtmdqrcorRb2MeHnD0yM6+Dq7gWI7Fs6E5U
         wo+qfY21tYvd0EIGgxBFhYfa390duokzZvwtvMDoJFG3aGCBRSzfZoIhJLgGizXVTGRS
         4VYq5urXTdpE78RbOyo+t7mL9qM5HFb0HjuzilgukE0u60ShWIfAUd3NtNPbIT/NuoIO
         c0PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbxLHG5DtwYST0hLlsoF60YOFRlvpw94o5QRrE8y2/5TJCBgd8hXcVKzJMuPLTKDkl30wWxjW81yGh4Oc=@vger.kernel.org
X-Gm-Message-State: AFuF++nsJ2nRGzoyRe5BIgXnh6kENFteP9QJI9Ul/VWi5I9r2QRCMVjR
	zIzR8CaSvQBsaZCpGHcFfwVaV4DPYk3E6KrJIZJo6eOTQVvQI1IrHeiY
X-Gm-Gg: AYBFou00ENe3UxqTjMjvNXBPu97hHYu9jeD5yjQQJl0Qsg1X/DdT5HEgIB5qZ3zFilY
	VpIULwdJGF1iNFzF6a9L/oVRQc968E1TijpapIMjffVQlScrMxhs1lfmUWJYQiP4cnOyvxqYsnI
	7N3msZlqHeqWoy66nV3ytCjxZXQOPme8EulYF0Lll59lClZMv+LUNS/rExXePD4fh5wJs7aNXl/
	tVNzpjnhnQPuHFwvY8J8rK9zt23lUdd7dvv1Osry9CXnHvGMgcMZAWzgILsw4ZUufcQ99wc3Cg/
	6YkxlcC83UlftZmNT6vyrxzEcgED0eVV4Ncu0wN0aHPqyKcxJBB6y2rv7YzH4jKr7LY8KugizxJ
	E+RaQGoyw4H2OwDat+YHR/aK42TeirkG/0LvdqcaJQFQ2SLu7zNTY6TD9BjSSSQwzVb5Rdmy5YR
	Xsaf6q7GtSaEewEZU2wCWZqxIPtRV6xZY5IdlOxxtw9F8+yPp6OQ==
X-Received: by 2002:a5d:5e0a:0:b0:484:3310:f393 with SMTP id ffacd0b85a97d-485908001bdmr14755495f8f.5.1788785001630;
        Mon, 07 Sep 2026 05:43:21 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d006:ef01:8e86:58dc:206e:83a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm23348581f8f.9.2026.09.07.05.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:43:20 -0700 (PDT)
Date: Mon, 7 Sep 2026 15:43:18 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/4] phy: core: Add phy bulk data helper functions
Message-ID: <20260907124318.6q4rr2huxyehm3zs@skbuf>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-4-inochiama@gmail.com>
 <20260907114837.2y55l7dfqqrgcka2@skbuf>
 <ap6or7kpWUj1wBI4@inochi.infowork>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap6or7kpWUj1wBI4@inochi.infowork>

On Mon, Sep 07, 2026 at 08:15:04PM +0800, Inochi Amaoto wrote:
> On Mon, Sep 07, 2026 at 02:48:37PM +0300, Vladimir Oltean wrote:
> > On Fri, Sep 04, 2026 at 04:37:07PM +0800, Inochi Amaoto wrote:
> > > +static inline int phy_bulk_get_all(struct device *dev,
> > > +				   struct phy_bulk_data **phys)
> > > +{
> > > +	if (phys)
> > > +		*phys = NULL;
> > > +
> > > +	return -EOPNOTSUPP;
> > > +}
> > > +
> > > +static inline int of_phy_bulk_get_all(struct device_node *np,
> > > +				      struct phy_bulk_data **phys)
> > > +{
> > > +	if (phys)
> > > +		*phys = NULL;
> > > +
> > > +	return -EOPNOTSUPP;
> > > +}
> > 
> > Why do the stub definitions of *_get_all() return an error?
> > I would expect these to have optional semantics, i.e. 0 PHYs are not an
> > error to the consumer.
> > 
> > For reference, I am comparing with clk_bulk_get_all() which returns 0.
> 
> This is the thing I am not very clear to. I found the clk_bulk_get_all()
> return 0. But something in the reset return -EOPNOTSUPP for non optional
> get (I reference __reset_control_bulk_get, as reset does not have an
> API that is the same as this). I am not very sure whether it is best. 
> 
> Since you think we should follow this optional semantics, I think it is
> fine for me to change this to 0.

I am only talking about the *phy_bulk_get_all() functions, which have no
num_phys argument, and which as you said, have no reset_control equivalent.

The optional nature of *_get_all() should come specifically from the
fact that the consumer isn't specifically asking for "this many" PHYs
(num_phys). So the core can return 0 and say "that's all", and technically
not lie. Not a fatal error to the consumer; the bulk API supports other
calls with num_phys=0.

> > > +
> > > +static inline void phy_bulk_put(struct device *dev, unsigned int num_phys,
> > > +				struct phy_bulk_data *phys)
> > > +{
> > > +	if (!phys)
> > > +		return;
> > > +
> > > +	while (num_phys--)
> > > +		phys[num_phys].phy = NULL;
> > > +}
> > > +
> > > +static inline void of_phy_bulk_put(unsigned int num_phys,
> > > +				   struct phy_bulk_data *phys)
> > > +{
> > > +	if (!phys)
> > > +		return;
> > > +
> > > +	while (num_phys--)
> > > +		phys[num_phys].phy = NULL;
> > > +}
> > > +
> > > +static inline void phy_bulk_put_all(struct device *dev, unsigned int num_phys,
> > > +				    struct phy_bulk_data *phys)
> > > +{
> > > +	phy_bulk_put(dev, num_phys, phys);
> > > +}
> > > +
> > > +static inline void of_phy_bulk_put_all(unsigned int num_phys,
> > > +				       struct phy_bulk_data *phys)
> > > +{
> > > +	of_phy_bulk_put(num_phys, phys);
> > > +}
> > > +
> > > +static inline int phy_bulk_check_disabled(unsigned int num_phys,
> > > +					  struct phy_bulk_data *phys)
> > > +{
> > > +	if (!phys)
> > > +		return 0;
> > > +
> > > +	for (unsigned int i = 0; i < num_phys; i++)
> > > +		if (phys[i].phy)
> > > +			return -EOPNOTSUPP;
> > 
> > For consistency with the individual API, I believe this should be
> > -ENOSYS (not that I know why we would be using this error code).
> > 
> 
> In fact I think -ENOSYS is more suitable, but I found almost every
> subsystem use -EOPNOTSUPP for such a blob.

Why do you consider -ENOSYS to be more suitable? In include/uapi/asm-generic/errno.h
it says "/* Invalid system call number */" which makes it pretty use
case specific.

> So I think it will be
> good to follow a generic -EOPNOTSUPP. In fact I found nothing about
> why the phy subsystem use -ENOSYS for this, maybe someone can
> answer it.

It's been that way since initial commit ff764963479a ("drivers: phy: add
generic PHY framework") with no explanation.

> 
> Instead of switching to -ENOSYS, I think it could be more proper to
> change the existing blobs to -EOPNOTSUPP?

Personally I have nothing against this, though it depends on how deeply
you want to go in.

If you want to make this change, watch out for the following callers
which explicitly check for -ENOSYS:
- drivers/ata/libahci_platform.c:374
- drivers/usb/dwc2/platform.c:246
- drivers/usb/dwc3/core.c:1591,1608
- drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1363

Only devm_phy_get() / devm_of_phy_get() return codes get parsed this way.
For the runtime consumer functions, all consumers seem -ENOSYS-unaware.

Though after seeing how some drivers treat -ENODEV (for an absent PHY)
and -ENOSYS (for the disabled Generic PHY framework) the same, I think
it might make more sense to return -ENODEV from the stubs.
