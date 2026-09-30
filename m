Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE09B476CFD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760238; cv=none; b=sfJJI7EnhXREJk1nVG0/cR6HFaxZ4ghYKFtz5cl/pEko6vOuDdmgGPx5AFHO12xAZu76p4nld1hqqvngzCJmEaImkHbSXaBn93LQdVxL+awaaSMU2B/xoHSdZhVfOKBcVn+eGTQLzu90gaPLh/gI38fmfsJZ3qtgD9X+cmv4syA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760238; c=relaxed/simple;
	bh=JRHA927Cm03tbqjIo2Ike/wuxqNO3aopZs4h5USPtNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyMaCxu3UMBWJ3vDLFcDSmkIMEaDzEB4V395Z5cX0TFB5ZKGpxlUO3KsPMlHXjLSN6BID2GG0Eg6/+J4n5LTAx/OJUOAN6LnaFvAQGi/aFMp59DFezo8WjZ4UxSviV9hH+UVVTBh2NQEwfnK/koou14RYgHGfHTF2/UBCJmRUJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eily2dx0; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eily2dx0"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so1961794a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760236; x=1791365036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/L4XHSUdBohZKJ1UYQ2m/Jl2xTbitdNZU3UCx3w2VvM=;
        b=Eily2dx0q34Ho8unkOJaFE59ip5ODy1a6T78gv4EDBq7zKVey6yLDwh0hDMrX9+6RC
         ZBsms85FxN38ndJS4w7QCxOYyf1kOrnMessV8wDbLo3kxrepV42JpTIooGRr02DOpXbD
         nAOeePkQCh4SdLurJ4n5X0AM95S8eKHHORZ7LPtXD6LTgjK37E1agpmM5lG1nZk0itQ9
         i+5Vq6tSU9V+X8NeGhOwQMbK3K80EWjYyi7na52hO5FEXJxk1pFQzYHry2j47b6Yha6+
         m6nuFGX+b6N0MCLXA7jEj5/WosUCITalFoPdWrff3Paev26yKRog32ZWmSPmLwt9QH5q
         t5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760236; x=1791365036;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/L4XHSUdBohZKJ1UYQ2m/Jl2xTbitdNZU3UCx3w2VvM=;
        b=ooiDfpw3ybYoXxl47/CBlBKwWhMSpnSTTH6Bcs8QhJHgWtgJBxmHPQM7AmW/MF/CZV
         LWe75X5Y/Uqg+p+UML3CTuDEcOyxempiLL5UpT2oeYS7FBILRHxr66mL53LTtiKcj84+
         C/IZxlvFAQEp/Pdn3Af3nAVc9uelTfUyQ2NE3Q6IDLOx4Y6PifXqY/XYW3BDjM0ED/37
         7g5Ab2eScxywMwih0jL75upwuhvnQnXNVon/+ZEInz+yi2tzY7PzYmFsziAJWXcx7HNK
         r60MFyXJb30ukiGGOlBKOtHr6mwtdSSfsocOppmzy/iJ68/9xR4/9uhlhvVc8mTXl8sp
         mqYg==
X-Forwarded-Encrypted: i=1; AKwUvBy7XjrpeSHT6ITdV6co8SCeILvHZNSP8UtmrOrOi5txh+Q8aKgzpWnCrsNjEKoQup7CGuL9KGGLDCJSaJc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMbBaN6YiOCho6Egdv/3Kr+BFn7+fCyicvrHs3r+s6j+NUil3r
	LGgpKioCZ5hURZO6C0qOx45OkucWMzTigk2QcFTpjnXUPQmysoUHAiFc
X-Gm-Gg: AYBFou3FGCTuXx+D5Aa/d46UrUiWhOBCC7k7SyvS9GC4LVZtwDFN18Uxl+5CtRjW6P3
	CNGYutXDx1mL6arki71L/cThMZG5pt8r1WRDMNxGolZXwfaVADJXrd0g0OGGU2Z7gb9qv09g8ko
	DDKCUFNNrBlg2rHBoVJRvsHF5P1ylqILaw45324AziXuK35QtYTguvPAnDDuPRN1w/ymBNuxuPr
	LmPlXIFIqdngMT6OK74R2R/EbNl9XuifMiscPb8l/mt8PlUAuZXjDN++hRrTiWbjFB3B8nGFMp2
	PvVptAqWvoffdIaXex49a6wNkSlOygJhNYlsX7BHnfwaHDyM5Xhwf6MjWrmWpQR8gvq9IOpNxLZ
	ICPDUzfCUcXx9ogx6pX74K+7DcBHJ8N+Jlb0bIaLCJvu7KaCJFQo53OOjajZdubCXKWTF2riEMT
	k0RjeOsERUd964X8yWpW2nItlAKidPWXdHGgfJHwUuvVLhI4pCkCMXveZ+3IWh6nBd4rup
X-Received: by 2002:a17:90b:4d09:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a4d18c0f59mr733608a91.49.1790760235777;
        Wed, 30 Sep 2026 02:23:55 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce40a6d5sm2319062a91.15.2026.09.30.02.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:23:55 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:23:47 +0800
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
Message-ID: <arzU-dIIxrHt-wW7@inochi.infowork>
References: <20260929085235.469515-1-inochiama@gmail.com>
 <20260929085235.469515-5-inochiama@gmail.com>
 <arzITUCmgUp3uiRn@ashevche-desk.local>
 <arzSkE1kY_u4jJWT@inochi.infowork>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arzSkE1kY_u4jJWT@inochi.infowork>

On Wed, Sep 30, 2026 at 05:21:08PM +0800, Inochi Amaoto wrote:
> On Wed, Sep 30, 2026 at 11:29:01AM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 29, 2026 at 04:52:34PM +0800, Inochi Amaoto wrote:
> > > Add device managed variants of the phy bulk helper functions. So
> > > the driver can benefit from automatically managed phy handles.
> > 
> > ...
> > 
> > > +int devm_of_phy_bulk_get_all(struct device *dev, struct device_node *np,
> > > +			     struct phy_bulk_data **phys)
> > > +{
> > > +	struct phy_bulk_devres *devres;
> > > +	int ret;
> > 
> > > +	*phys = NULL;
> > 
> > Why?! In case of error we modify the output, this is usually not the best
> > approach as in most of the cases the expectation is that whatever user
> > provide (including a garbage) should be left untouched in case of an error.
> > 
> 
> This is something I think this is wrong and I need to removed.
> 
> > > +	if (!np)
> > > +		return 0;
> > 
> > Same here. On top why do we even care about np like this? Interestingly that
> > some other APIs consider this as np == dev_of_node(dev) case, and automatically
> > propagate that.
> > 
> 
> After a deep recheck. I think you are true. We do not need to care
> about that, just let the internal api decide whether it should be
> an error is better. I misunderstand that it should check it at early
> stage to avoid some bad use in the following logic. Now I found it
> is meaningless.
> 
> > > +	devres = devres_alloc(devm_phy_bulk_release_all, sizeof(*devres),
> > > +			      GFP_KERNEL);
> > > +	if (!devres)
> > > +		return -ENOMEM;
> > > +
> > > +	ret = of_phy_bulk_get_all(np, &devres->phys);
> > > +	if (ret > 0) {
> > > +		for (int i = 0; i < ret; i++)
> > > +			phy_add_device_link(dev, devres->phys[i].phy);
> > > +		*phys = devres->phys;
> > > +		devres->num_phys = ret;
> > > +		devres_add(dev, devres);
> > > +	} else {
> > > +		devres_free(devres);
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > 
> > ...
> > 
> > > +static inline int devm_of_phy_bulk_get_all(struct device *dev,
> > > +					   struct device_node *np,
> > > +					   struct phy_bulk_data **phys)
> > > +{
> > > +	if (phys)
> > > +		*phys = NULL;
> > 
> > Same as per above.
> > 
> > > +	return 0;
> > 
> > Why not an error? I do not see the _optional word in the function name.
> > 
> 
> IIRC get_all it a special optional meaning: treat not existing device as
> 0, this follows the same meaning like clk. Vladimir has a good explaination
> on this in the previous version:
> https://lore.kernel.org/linux-phy/20260907124318.6q4rr2huxyehm3zs@skbuf/
> 

s/device/property/.

> > > +}
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> > 
