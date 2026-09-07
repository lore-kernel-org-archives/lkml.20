Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D79363C50
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783336; cv=none; b=RLxhvCwj6c358jn/B37qjkeCW2BJMFE3m+tA7aHIFgsZjkhqkFwhWkbJsb2zsBCfqlRxUB0hhUCTO/Z2+fi7i6GjuuD/mSukiIfy9euBx0pOPVqMJk1TumaYWxbbfj2Zt+/V9imjNAGHFhmmXUmFu3ZN43BDClvYOms98w5RQW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783336; c=relaxed/simple;
	bh=pdHarL4UOoKQHpERdD3/+5Qs0jABXs+oWD2w3ScGvnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=riMwkxguZDIekbE4QMtSYcLNhEpMHpEGgfxJgnm9QPvnt8vkHDXoDfFUP/Ii0cwCmL67c7y10QJ7akfitPDnVdBLfMGqvkSOBCj9s6gPKAD7fSC7WSIJLm8L11r7QpkES+SkJkoWmHlYj7KFofouigq5GwY9WuOqp3UZWs4rKwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEYR8tNo; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEYR8tNo"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2db18e5cb56so31405235ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788783334; x=1789388134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uXPQPcM6Co9Pv6uvVSmI8m5rkwob2bI+bnvsiN0S4hk=;
        b=UEYR8tNoL5kjjuEvResHG49sIuytLPs9dK92ePrNDALfVHukJgOb/F6uq7Vp+EhYwP
         mkZuV1wASIPhMxS3ji3Y0P1/9Ju4qQHyqFEU/rReJfZRHILzmqc3sbO52MLbuzDsBcux
         I36fb9aX/nzmO8ueO7wA4DKUzsUbuBai1Br3Fs0u97qREZEPGjuCJeU4zzuzEbbsCanq
         bWV1Q56/w9byg7J/BJ5huvBCRthhsfUg+2SDTGCrrNt13GPdBjvVVJ4HygukL5jAB7zt
         2f0dz0fW5Bw+87obuSt4OqZ46RB+3CbG2rtiBP408rvTwcUDRDL5LUI2pT2n70Nmhuyf
         wgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783334; x=1789388134;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXPQPcM6Co9Pv6uvVSmI8m5rkwob2bI+bnvsiN0S4hk=;
        b=AErRw7KwbaFJO6UNvwTgeudrk7VRAQYbNTXN0yKbiMXvtLmSgBQG4jpgLIO7gme4u6
         ck9QS3txqpNFW3WPx0hM+S3XEovxumtIrqhS//wM4Afl9JTnofsvokJiUrXKQvMTV9CZ
         AUYyPhbU6e1UUTXpfGjClDxHJ9WEMofcm30r0k5ai0RqTKAqFzeK1FDpeVhJOsnSkR1V
         P+9ewAbFiC+speaPIQe/UR/DrTkQtQnQ/wCa8EPX+eAlp2Vu9aBaRppAgkuGP+rYeEKg
         PQ9gb7y8/ROC+6GkT7DrCyYkfURMX5N+/LKp0nf2NX/zDf+Nr2y3Ia2WMtsYmVQPdpRR
         De7A==
X-Forwarded-Encrypted: i=1; AKwUvBwIOMvWe7WltfK3NEQesP+gwUSpwwM52EUQk5+Pb12M/o0/47pg6458/lBpxaPr6UXTVVS19q+uxD/0V34=@vger.kernel.org
X-Gm-Message-State: AFuF++kQqdtoYv9Ri6NaG62YxWcA/ptVmXBAHKEoZW3/pyBKtHqfGbXt
	Ge7/cWHHJtNSSWBUEmeBV2NGDbx9zQndxCawc+2f/PyQANNadGM2Y8q6
X-Gm-Gg: AYBFou2m6GbPiv7/uD1LuD1MuwZfKMghHUF6zwnBOCLIehHpEqQECgipBuATBh4qUMa
	PHV4AbCEX4bzHSigufKc6oZt0eyCOpkEbqHvxQ1wGD5j+5pnIs5GDMClFIH+xjqYZmVmwfA8WPV
	Et1ZsMUlhUArJv45N8DW3Beq9M4I5txV1hSc1KkxCsowCHvCzAM+c67d6c/cGUAblJnP5Lk3Z1F
	Oip/WBvFgvqZU/R9jU8GIoc/H5h4rcVXbh7LDJEbXHU56i6mJTED8LSCgRmHnTBIICa+DiqqKww
	0gkolYAvRCwZ5yE/5ArVqd64gDoMKL7DZn/R0UiSZh+2Z3rFidCiOgeYUIiBGeB5kwP9pfl/wB7
	5lnwGuEc0fIgm+Ydk4FbFwArew49MtX8CtSlWBX1iLMOhQlJlh3OP1AEbiJQYSLO/mkTzmrGQlZ
	Wsbr7+JEx6NltL2VwkMxKzM0fsvL/Ui2Vi+61aWzZOwk4ya7j8j8iAv0Hmf1meH2lib4wYIQ==
X-Received: by 2002:a17:90b:3c05:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-39b26106c44mr34397361a91.10.1788783333930;
        Mon, 07 Sep 2026 05:15:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26155324sm19914915a91.17.2026.09.07.05.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:15:33 -0700 (PDT)
Date: Mon, 7 Sep 2026 20:15:04 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/4] phy: core: Add phy bulk data helper functions
Message-ID: <ap6or7kpWUj1wBI4@inochi.infowork>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-4-inochiama@gmail.com>
 <20260907114837.2y55l7dfqqrgcka2@skbuf>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907114837.2y55l7dfqqrgcka2@skbuf>

On Mon, Sep 07, 2026 at 02:48:37PM +0300, Vladimir Oltean wrote:
> On Fri, Sep 04, 2026 at 04:37:07PM +0800, Inochi Amaoto wrote:
> > +static inline int phy_bulk_get_all(struct device *dev,
> > +				   struct phy_bulk_data **phys)
> > +{
> > +	if (phys)
> > +		*phys = NULL;
> > +
> > +	return -EOPNOTSUPP;
> > +}
> > +
> > +static inline int of_phy_bulk_get_all(struct device_node *np,
> > +				      struct phy_bulk_data **phys)
> > +{
> > +	if (phys)
> > +		*phys = NULL;
> > +
> > +	return -EOPNOTSUPP;
> > +}
> 
> Why do the stub definitions of *_get_all() return an error?
> I would expect these to have optional semantics, i.e. 0 PHYs are not an
> error to the consumer.
> 
> For reference, I am comparing with clk_bulk_get_all() which returns 0.
> 

This is the thing I am not very clear to. I found the clk_bulk_get_all()
return 0. But something in the reset return -EOPNOTSUPP for non optional
get (I reference __reset_control_bulk_get, as reset does not have an
API that is the same as this). I am not very sure whether it is best. 

Since you think we should follow this optional semantics, I think it is
fine for me to change this to 0.

> > +
> > +static inline void phy_bulk_put(struct device *dev, unsigned int num_phys,
> > +				struct phy_bulk_data *phys)
> > +{
> > +	if (!phys)
> > +		return;
> > +
> > +	while (num_phys--)
> > +		phys[num_phys].phy = NULL;
> > +}
> > +
> > +static inline void of_phy_bulk_put(unsigned int num_phys,
> > +				   struct phy_bulk_data *phys)
> > +{
> > +	if (!phys)
> > +		return;
> > +
> > +	while (num_phys--)
> > +		phys[num_phys].phy = NULL;
> > +}
> > +
> > +static inline void phy_bulk_put_all(struct device *dev, unsigned int num_phys,
> > +				    struct phy_bulk_data *phys)
> > +{
> > +	phy_bulk_put(dev, num_phys, phys);
> > +}
> > +
> > +static inline void of_phy_bulk_put_all(unsigned int num_phys,
> > +				       struct phy_bulk_data *phys)
> > +{
> > +	of_phy_bulk_put(num_phys, phys);
> > +}
> > +
> > +static inline int phy_bulk_check_disabled(unsigned int num_phys,
> > +					  struct phy_bulk_data *phys)
> > +{
> > +	if (!phys)
> > +		return 0;
> > +
> > +	for (unsigned int i = 0; i < num_phys; i++)
> > +		if (phys[i].phy)
> > +			return -EOPNOTSUPP;
> 
> For consistency with the individual API, I believe this should be
> -ENOSYS (not that I know why we would be using this error code).
> 

In fact I think -ENOSYS is more suitable, but I found almost every
subsystem use -EOPNOTSUPP for such a blob. So I think it will be
good to follow a generic -EOPNOTSUPP. In fact I found nothing about
why the phy subsystem use -ENOSYS for this, maybe someone can
answer it.

Instead of switching to -ENOSYS, I think it could be more proper to
change the existing blobs to -EOPNOTSUPP?

> > +
> > +	return 0;
> > +}
> 
> Can you update Documentation/driver-api/phy/phy.rst with some terse
> references to the bulk API and its intended use? Not much, just say
> what it's for (like multi-lane protocols, and why some operations are
> missing: phy_validate(), phy_set_mode_ext() etc). I guess they are
> missing because currently they have no user, which is OK, but the rest
> of the world should be on the same page w.r.t. the future of this API.
> 
> Thanks!
> 

Yes, I will, this is something I missed. Thanks.

Regards,
Inochi
