Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D754756DD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781724; cv=none; b=SkNrxbMYDwt+WtEVgD9c956SFr0JutLJTUdeDqILEbsmuM+KoY6fPnqsGpfiOq67ggBNQHxwbZDOTiYBrlXhfCaVYUXoYBqEqhErLf9kqe+hv5kNzeJZaV/fM9luLN5W3CcnsZLKfO4DpWgODiBfZFMlZ2iMg9P//JL6eoQipuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781724; c=relaxed/simple;
	bh=DsHrNP/7VjhM++iNFYItZM6mtvnTP91HMNeJCieE/bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOOvjS5+FKY9fxOUqocTvl/qIIzyp4YDKQ/DXRK43DLRVcNqlLA9ZswUk2SW5Bw/vrgRX5SLTHreX5+H6B10SOWiFmWVEYvjEUQyMO5VeIpTGAIPNR1S85q1eddqiyQbw0Eohf/obKW108Qia4IZbwFowfixBYLWSebrNoNXs8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FoDrpI8e; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FoDrpI8e"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cfbdac7a1so814705e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781720; x=1789386520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sCcumiqt++ngk8+8ZsfaJMliyV3ADBkSY4R1nZtHDbI=;
        b=FoDrpI8ebOPonjxnc04BXC8wULSLyf2eqV91rM53BVvHBS9wtZMK635I5GGA0O3gin
         WeaGI7EUbXqV7t6wMLRwZ5O88PM8uThehvQ8h56nMHg057LQOqerxyvbm9SxH0mBOFNz
         3AhDIxdBfGFWDcBR1+AB87WCk7A4LQ/lB72skDoVbuOBqOcpdXcIVwIR4GS6m28Rn+Z/
         QiMz7zO5ajiL+UmV8rtF9s1JSs3qmBLuoSWee/rGW70xRu3d0rWAqOBI4V1/7Ig3f4Ql
         QZvtTxbRpUmV5IeF6viwqa2KwjNuxmkSQQMxZmr1rdDXhqpXM2A3vRaEm42zvKbm0JgO
         qf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781720; x=1789386520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCcumiqt++ngk8+8ZsfaJMliyV3ADBkSY4R1nZtHDbI=;
        b=ZP+Dtm9+OIWtomK845Xfje2D3NQlN5rRmxUBvNXKBiUvBfiGLcahx+ar1CsNsASiaD
         8DUCQgSY0rFXQQ9IcHEdOONVbnymAIVtN+OaXkqa9VOd++0CN8DLDqal+LXPIrOtfk4S
         Kc4kADp7mH0zC/6HYhhApfpzxDZjSJtJZ1rDtriQUjRcLjLHsC26JM6UOaPOMewJ6KHu
         tGOEXqZ7WXZ2aIDUbwWUza3j8mezIlVlr2S8j7XPC+l0Lz63Hw1hHUyTlItec7ADXS4d
         jxSnwAUq8JgO+9E5ndNGDDpAJJz+YU0WXyIosoABKpZGjPW29isiOr2Rdypvle+QoLk2
         xFLg==
X-Forwarded-Encrypted: i=1; AKwUvBy5XdhQFYqIyRpQfHiJEj9L3VYxlPtSViIxu16ngfRXhwP9naImUP3sda4isLQxci1ZN4OIsxMEPRkYH+0=@vger.kernel.org
X-Gm-Message-State: AFuF++kj+NI7t82qxfwY8Jppag3cB3eAfBOabJpDkdqa4I52VQCNXC/P
	YLtqlPLOesxZnTAhmRGaesHExLT71/2+XThMzEZ1zUWP4IFXBu+jSJ2O
X-Gm-Gg: AYBFou3O74oTxqQAOttdJgoerktz/BsWf+LzA3qcVGi/kDfBkglpL61Uh0uf+6GXZjj
	klU+a10PeZ2vS8khgKHozwZBetVt7z92rWM8cEHp4bY92IVFzrOaUi6myvYBiH+MREAlgdcuQOk
	F2/ZYLeQrxVyv84FurqSEX3i8kGiSyACfW5gXR1pi0WaX4Uhk7dJ3oy7vNCIdxN7XCag1OAaFmY
	b7X5WYe11prjbsdboSu2cHoTQfaKcfxPzSKlZImvozcDAYHHeljERknjmKH5yTyubYFFZycT7a4
	ccli+ysWmgVFIzLm5Egg8qDg8qziMcYfiXAM4uavLirobDawqG6IFiKD1c6QrNVsX3uOUDrIcVG
	4pcPX0oMfsE2LRUuVO3mBSzOo3OAr4XjrvvGfw9m1LBku/0fgX8k4cSSUaSYfqo0Rul50sB//EV
	QfKVYamxRi+usdmJazIMMq37ArqfBhynITQq5+r6/9RaWsfkj4qA==
X-Received: by 2002:a05:600c:8485:b0:499:5b0f:72b with SMTP id 5b1f17b1804b1-49d01dcc32cmr132422645e9.1.1788781720257;
        Mon, 07 Sep 2026 04:48:40 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d006:ef01:8e86:58dc:206e:83a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm823780485e9.0.2026.09.07.04.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:48:39 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:48:37 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/4] phy: core: Add phy bulk data helper functions
Message-ID: <20260907114837.2y55l7dfqqrgcka2@skbuf>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-4-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083709.425893-4-inochiama@gmail.com>

On Fri, Sep 04, 2026 at 04:37:07PM +0800, Inochi Amaoto wrote:
> +static inline int phy_bulk_get_all(struct device *dev,
> +				   struct phy_bulk_data **phys)
> +{
> +	if (phys)
> +		*phys = NULL;
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int of_phy_bulk_get_all(struct device_node *np,
> +				      struct phy_bulk_data **phys)
> +{
> +	if (phys)
> +		*phys = NULL;
> +
> +	return -EOPNOTSUPP;
> +}

Why do the stub definitions of *_get_all() return an error?
I would expect these to have optional semantics, i.e. 0 PHYs are not an
error to the consumer.

For reference, I am comparing with clk_bulk_get_all() which returns 0.

> +
> +static inline void phy_bulk_put(struct device *dev, unsigned int num_phys,
> +				struct phy_bulk_data *phys)
> +{
> +	if (!phys)
> +		return;
> +
> +	while (num_phys--)
> +		phys[num_phys].phy = NULL;
> +}
> +
> +static inline void of_phy_bulk_put(unsigned int num_phys,
> +				   struct phy_bulk_data *phys)
> +{
> +	if (!phys)
> +		return;
> +
> +	while (num_phys--)
> +		phys[num_phys].phy = NULL;
> +}
> +
> +static inline void phy_bulk_put_all(struct device *dev, unsigned int num_phys,
> +				    struct phy_bulk_data *phys)
> +{
> +	phy_bulk_put(dev, num_phys, phys);
> +}
> +
> +static inline void of_phy_bulk_put_all(unsigned int num_phys,
> +				       struct phy_bulk_data *phys)
> +{
> +	of_phy_bulk_put(num_phys, phys);
> +}
> +
> +static inline int phy_bulk_check_disabled(unsigned int num_phys,
> +					  struct phy_bulk_data *phys)
> +{
> +	if (!phys)
> +		return 0;
> +
> +	for (unsigned int i = 0; i < num_phys; i++)
> +		if (phys[i].phy)
> +			return -EOPNOTSUPP;

For consistency with the individual API, I believe this should be
-ENOSYS (not that I know why we would be using this error code).

> +
> +	return 0;
> +}

Can you update Documentation/driver-api/phy/phy.rst with some terse
references to the bulk API and its intended use? Not much, just say
what it's for (like multi-lane protocols, and why some operations are
missing: phy_validate(), phy_set_mode_ext() etc). I guess they are
missing because currently they have no user, which is OK, but the rest
of the world should be on the same page w.r.t. the future of this API.

Thanks!
