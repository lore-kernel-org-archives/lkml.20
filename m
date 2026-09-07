Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2CD36215B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780853; cv=none; b=akZhvfxNFBiZV70dZ0LJpWFPXEVbi4FMZIftxh20ReY4aVHrifTmemOkJNh/6n2S8tDy+4De9K0+7AzqGU1YFwZic+hF3lAMNHSft0v/BVfDmIBSTG5dXvDb58q3XRa10pcVgrvACjYITb2DNvTT3VkonsSpoHYN2oQ4JIyBM3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780853; c=relaxed/simple;
	bh=cHfUoX8k2mK1GryRLRcJEHVXfhFzIuMZZYl3kpa33WU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jllz3b8I+p5TrRpj3GLx2AkCWIJzFwLCERGKF4cWIVXWx86SutFACejLAgvIBQJsQy23t9oPqyvxuxUmsM4D/FjH8tF79tfZcVPlZi7KnLP6FhJcx+zxR40ubZ+sK8bKH1YkP1N+0D1UWdhvg1V3zT0FnfBMInGfnirsh+gufuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zbaszc60; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zbaszc60"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceab75934dso32856205ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780851; x=1789385651; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b0HO00FFYat2iO5z4XYKUwvadSW1KbkDr8EJUWfNwQM=;
        b=Zbaszc606d5lKdJzo7218MZITkckMab+blFgtD/uufbwR8cKM5hinuF4X9wCft0IZr
         SRZ9f0KJsXBnXJUch0kISPllVe07mxUiPULayV6TDB962YFmzsFn4BCnjmrCJPx2evwG
         sibuGVfAkY+8jSkQ1WO0CLXRAfIjYzPqnGICMagj8lODe1kCjZ0NdwISShMRlAOcy5uU
         aJX+euY7NMuil0cczJ4VR042vDDhD4jalCi+ljlARBWPCu+lAgeozXHZKRLmaOnZsHr0
         xEN81/2nhqsWKuKHhGe5i9JVHmu76RJ7h0Q4uCO2yFqtk30qnvPZxtvROM0ZKiyZUprj
         TxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780851; x=1789385651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0HO00FFYat2iO5z4XYKUwvadSW1KbkDr8EJUWfNwQM=;
        b=SLDJRa8IjdkwGZ/8zpKn6xiS3RdNTqAunXgciEXzWEKZvpAHboNieauU1nP4/Rmi+O
         jyBcfA8zQg7Sqb1RHzcg3/EYTSVh3Nbe5MUNpqRLEqDYeKyAx+DtNGMbRlsrAWiAymyi
         B3/1qQQqJaBeLAUl65pIcvefjm3q+0Go5WTCoy0ElMjQxz+5BxswzbLhpg4AvEl7pYQT
         nJVjoB5FvdSPBUeoXKox8SgBtAKbYl1VTK+WF+KYGQ2lHBXdX0y0914Y+Se23UiLxUmf
         iB0uA4xulTuhQeXB8WU0QdsRlEx9IhXobOn0L05oqxu3x6a0s7HaMJ4n8JYpmQnN1nJr
         f//w==
X-Forwarded-Encrypted: i=1; AKwUvBwk/WJwCtcXtjXWCIpy4IVFgYU42oRarcEo3GGvNUou11AO9RKQv8nyfduoXOHxy2260S5S3zRejyrpZu4=@vger.kernel.org
X-Gm-Message-State: AFuF++mAYHXgalbQ7XHLtNBOSzO597wbbL1JQTFC+m5CBl5Futvdq3hM
	iF4MxJoPup6jfET4arO53+r+FHJ29slrzyOqzBdQTalYbmcQt3Twvvh4
X-Gm-Gg: AYBFou3dwzPdqCxgrL0G5+UGqBq5aRp+vU0ME2nPZEe66Jl5di7v5hkz6XI1HpzDsBo
	4pAywSeFj8HZPBEXwhiGolmXVogsd3MqAhAiVOcPts4Yfh2cvEugnRB0PtGy1zYZ1uH7CvpYteh
	K8eJk72uzluLTUPMNy21ec3YJmNkBRmR6hxy/hynq92YL1OO9ALBO0Mbh4gG8RgzGAUXOsLvKSO
	sWnLbSIJ3gmwnIup3kJuCE2d2xL+8ZM7KVTGZKq1ggESwosFGmmpQAZX0YcjFgx3V+YecpuAUIH
	OZO5JZ1ZDQU6QuDu1dMpW+/jP26CSNhmoQNlOktp8xnzVv5qcWS2FMmDu0aZBc24JjE/zgWgSLQ
	sf4nsdKrKmE7vGgMHeOQ7Iv30Ai5hE6xRBe+Syle0jab6Na6HUEhpfNS1aiv3q8PsBbdZ818499
	XHDqkgDc36AYxz2BKP0ZU9EUGquQoLwrVwQi5DTMfcsHGMzLBGp8BmM3pSsA4=
X-Received: by 2002:a17:903:2ca:b0:2d9:3850:2741 with SMTP id d9443c01a7336-2db12255f7bmr330259655ad.0.1788780850921;
        Mon, 07 Sep 2026 04:34:10 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497d9ddsm43944095ad.31.2026.09.07.04.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:34:10 -0700 (PDT)
Date: Mon, 7 Sep 2026 19:33:41 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 1/4] phy: core: Add common helper to add phy phandle
 device link
Message-ID: <ap6g-SwI6vvmdnB6@inochi.infowork>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-2-inochiama@gmail.com>
 <20260904083709.425893-2-inochiama@gmail.com>
 <20260907110121.hfrblphv5vhzobj7@skbuf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907110121.hfrblphv5vhzobj7@skbuf>

On Mon, Sep 07, 2026 at 02:01:21PM +0300, Vladimir Oltean wrote:
> On Fri, Sep 04, 2026 at 04:37:05PM +0800, Inochi Amaoto wrote:
> > It is very common for adding a device link for phy phandle
> > for device managed phy helper functions. So add a common
> > helper for future reuse.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/phy/phy-core.c | 38 +++++++++++++++++++++++---------------
> >  1 file changed, 23 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > index 21aaf2f76e53..ea79913fbb87 100644
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -606,6 +606,26 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
> >  }
> >  EXPORT_SYMBOL_GPL(phy_validate);
> >  
> > +/**
> > + * phy_add_device_link() - Associate the phy with the device
> > + * @dev: the device to link the phy
> > + * @phy: the phy to associate
> > + *
> > + * Associate the phy with the device by using device link.
> 
> I guess it would be good to specify somewhere "consumer" device, because
> there are multiple devices involved.
> 

Reasonable. I will update this comment. Thanks.

Regards,
Inochi

> > + */
> > +static void phy_add_device_link(struct device *dev, struct phy *phy)
> > +{
> > +	struct device_link *link;
> > +
> > +	if (!phy)
> > +		return;
> > +
> > +	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
> > +	if (!link)
> > +		dev_dbg(dev, "failed to create device link to %s\n",
> > +			dev_name(phy->dev.parent));
> > +}
> > +
> >  /**
> >   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
> >   * @np: device_node for which to get the phy
