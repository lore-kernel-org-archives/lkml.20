Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CB534752F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780677; cv=none; b=NFxwQO7ePKDwaR1lDSR1w9PpLTtsZDpOQUyrafLopdRNmHxz+kbqOwLYQWg0dmrQ/nfuiTDToiYugkWBmYlaOGY7jFRFh6YoAOjRqOYBkD3eU9aZp9IxpRfTSD4ZhnRci4BC5/IF7i4Xe8NmbIXONFmtJAY4yXB3cgOZgUkMxPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780677; c=relaxed/simple;
	bh=hk5+9dv4IkJKO3LReZ9dgwZvWjRUep/6b8z6jsKh/OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkVpQRdkceNy+Ibcn/y4I9l+aBPT8XPn0i5yBZPwzwSfYW4mfWgX6+k4pZZUNODT8LsRys/SN8k1MIvri+NCy7KQYXjcVFnnidTC1t3FNUcUHtjkS2N0LPttZn6R4bgBnFUOMqLl8XihABWdlMdxgMl5jOlUVSe5JcvzF9bXqto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHjA6/nN; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHjA6/nN"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d91518a63fso24550795ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780675; x=1789385475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EGym5Igy1VmQiAX5TVELJlk0ohvxnDxKp7lmlY7ezN8=;
        b=FHjA6/nN8H19zUMIamyO7dZBq4M+E4mZw8ECMZSgKgr9yDktr21SBCwFJRUos7yGxd
         wcWCdboa3gSqtX9L9hIpfSdbTuE2JIfmepX4YxpD2mvTGM3OpTFNZdInGHUpOIn8OlHz
         Vxu0AmMtyTNRBpX8dQDcpUhmMNptvvy6TgnV4wv4HJzSthwIuD3sXBnoW4DMgawqD/Fu
         UXi+YU8X1Lty6HG/k42h7FlbmnUjmaKIdNBO6tmNKuRBPDBIGOqF1R80+WO0/jxlL1Tw
         6VQMzusNBkXiqMIAwKMmK3QFTV9TUY5JCqHH4hweHcGVy4daX1Si7i6cXT+wLXvBSdO1
         L7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780675; x=1789385475;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EGym5Igy1VmQiAX5TVELJlk0ohvxnDxKp7lmlY7ezN8=;
        b=nfjs1Yadi2EzuElT/F6GvBkCxCjThqg17S11VrBsvsY3nNB4FK/mRgrWQ5S7y4pD3J
         SMOjzQ/WZ4IhA72uIBW625PDfKluRW4q11vvJY+SXKN+zjVpObFw3tpdye3VJxAFRwYO
         EhuQAk3lNAVCTdH94+E3cpEa/WJ5pADV4J2/UCMyGYT6ySxOw58DlFglALUxW37xiB8G
         J8Y8eFdRGbrt/OEj9ITlH2mRisr3YAf2iEm/kqAQlfJaB3UNW/3q3TILfi1SkpqzZTYV
         9LwNawnLvk5C9pDTybCnP18YmLtIgl1iAm3xnMJXezw4Zmy3poEBRS8pQf+hF+NBIaMi
         0dbw==
X-Forwarded-Encrypted: i=1; AKwUvBxuyR/smlddgpRoap3krBX0+Oxoax6A3n6fvow67g+Za8u9yGCDpKr/tgBmiQ9iG+GHjEdlt5j13AgMXzc=@vger.kernel.org
X-Gm-Message-State: AFuF++lmof/Y6BWEe66NTPd5xHvtQB7WUu50Elkw1NqSHd6wt7eGATSI
	AdMxPVtkSG/fFfkySJ39UiGTOrVRYcQAsq92EKMhuGpCsF6Gwx6Re4HW
X-Gm-Gg: AYBFou1hcHMBKy37EBhGY7mAd/u35iNEe50Pm2/RpcM2n5Sf1mkkl9M1po/nYxnwxqw
	6GN2hWVvWS4BqnWEsgbx1j9fJsd76lKDghnwIj+ZW4cS2hAbZdmcw+v5dXdnMlPGkvmXqsDXqgq
	sC6v6jmvzpUTW+Q0Rf87DKdMpduE9TihgQG6kRXz6tyGLutkFqXKRE+me8TPr3mTVX9xxJHS7EP
	uNU+sOV71PJpsmBk1heW5xnYPrMwH+laf/i7Z5PNjlGNeBNP665Hy8c2keeOP87ZacxWQFfh9JX
	RZZfIb4/aGOQc6tqHDWo4lx9iTgZxvUGNGmBSRQpj/TLPKTrT22dQ+CcfvO15ms4sjBkb/gQNKw
	ulUbm4PVCpFiwUTjQ5zAVrdMjaVYdYGi+TXe074jtnMUFXLUR0gh104ZPpMVpQ7GmtFb2PwbjNE
	gLKJ+PdL+dRTBw0w2Kpk02CXhEuwAyG6/AgYgKJ3qVUJjxDBiVs2amRXfqzo8dtaNOZ6TvFA==
X-Received: by 2002:a17:903:11c8:b0:2d8:d4de:fa80 with SMTP id d9443c01a7336-2db1235721dmr306706525ad.4.1788780675312;
        Mon, 07 Sep 2026 04:31:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1cdb4acesm40477485ad.4.2026.09.07.04.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:31:15 -0700 (PDT)
Date: Mon, 7 Sep 2026 19:30:46 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 2/4] phy: core: Add common helper for get phy phandle
 by index
Message-ID: <ap6gVPncPzdcNWAa@inochi.infowork>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-3-inochiama@gmail.com>
 <20260907110308.nc3jwwoyv7j2mlxp@skbuf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907110308.nc3jwwoyv7j2mlxp@skbuf>

On Mon, Sep 07, 2026 at 02:03:08PM +0300, Vladimir Oltean wrote:
> On Fri, Sep 04, 2026 at 04:37:06PM +0800, Inochi Amaoto wrote:
> > Several phy helper use index to get phy phandle of a device node,
> > add a common function for the future reuse.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/phy/phy-core.c | 51 +++++++++++++++++++++++++-----------------
> >  1 file changed, 30 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> > index ea79913fbb87..a7d7acb5d3c2 100644
> > --- a/drivers/phy/phy-core.c
> > +++ b/drivers/phy/phy-core.c
> > @@ -681,33 +681,49 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
> >  	return phy;
> >  }
> >  
> > +/**
> > + * of_phy_get_by_index() - lookup and obtain a reference to a phy using a
> > + * device_node by index.
> > + * @np: device_node for which to get the phy
> > + * @index: index of the phy from device's point of view
> > + *
> > + * Returns: the phy driver, after getting a refcount to it; or
> 
> Not driver, but device.
> 
> > + * -ENODEV if there is no such phy. The caller is responsible for
> > + * calling of_phy_put() to release that count.
> > + */
> > +static struct phy *of_phy_get_by_index(struct device_node *np, int index)
> > +{
> > +	struct phy *phy;
> > +
> > +	phy = _of_phy_get(np, index);
> > +	if (IS_ERR(phy))
> > +		return phy;
> > +
> > +	if (!try_module_get(phy->ops->owner))
> > +		return ERR_PTR(-EPROBE_DEFER);
> > +
> > +	get_device(&phy->dev);
> > +
> > +	return phy;
> > +}
> > +
> >  /**
> >   * of_phy_get() - lookup and obtain a reference to a phy using a device_node.
> >   * @np: device_node for which to get the phy
> >   * @con_id: name of the phy from device's point of view
> >   *
> > - * Returns the phy driver, after getting a refcount to it; or
> > + * Returns: the phy driver, after getting a refcount to it; or
> 
> Same comment here. You are changing this line anyway.
> 
> >   * -ENODEV if there is no such phy. The caller is responsible for
> >   * calling of_phy_put() to release that count.
> >   */
> >  struct phy *of_phy_get(struct device_node *np, const char *con_id)
> >  {
> > -	struct phy *phy = NULL;
> >  	int index = 0;
> >  
> >  	if (con_id)
> >  		index = of_property_match_string(np, "phy-names", con_id);
> >  
> > -	phy = _of_phy_get(np, index);
> > -	if (IS_ERR(phy))
> > -		return phy;
> > -
> > -	if (!try_module_get(phy->ops->owner))
> > -		return ERR_PTR(-EPROBE_DEFER);
> > -
> > -	get_device(&phy->dev);
> > -
> > -	return phy;
> > +	return of_phy_get_by_index(np, index);
> >  }
> >  EXPORT_SYMBOL_GPL(of_phy_get);
> >  
> > @@ -957,7 +973,7 @@ EXPORT_SYMBOL_GPL(devm_of_phy_optional_get);
> >   * @np: node containing the phy
> >   * @index: index of the phy
> >   *
> > - * Gets the phy using _of_phy_get(), then gets a refcount to it,
> > + * Gets the phy using of_phy_get_by_index(), then gets a refcount to it,
> >   * and associates a device with it using devres. On driver detach,
> >   * release function is invoked on the devres data,
> >   * then, devres data is freed.
> > @@ -972,19 +988,12 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
> >  	if (!ptr)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > -	phy = _of_phy_get(np, index);
> > +	phy = of_phy_get_by_index(np, index);
> >  	if (IS_ERR(phy)) {
> >  		devres_free(ptr);
> >  		return phy;
> >  	}
> >  
> > -	if (!try_module_get(phy->ops->owner)) {
> > -		devres_free(ptr);
> > -		return ERR_PTR(-EPROBE_DEFER);
> > -	}
> > -
> > -	get_device(&phy->dev);
> > -
> >  	*ptr = phy;
> >  	devres_add(dev, ptr);
> >  
> > -- 
> > 2.55.0
> > 
> > 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

Ok, I will fix them, thanks.

Regards,
Inochi
