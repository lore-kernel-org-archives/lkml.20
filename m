Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C9C43DA2C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778995; cv=none; b=nLTon6vjJLsLsUOgIoaHiUnA+FeDq6nHEVXXhZJW3tt5aB/+GG16/citVIZcIKaBLbG+cmbdA/i8C+R00ubAsEE8eeSx2UH63HHBBYXmSIbtUa6SunVAf0O6k7V0X0lleSQejnFwY6KYJqokqoRgEk+8Lk5YH1AXMQDoeNhmaGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778995; c=relaxed/simple;
	bh=fS5S938jkTunO3Ox3e+gghbNNmkK63bS3U/mLvTeqg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALZ8doiHQEdjRf9Im4RxILXRUxEo2P5BGA3+8yCMweAB7KyLM6LfX2YgAbg7MfO144zDvqjY3zaaY1Tkuu25b2Lo4XQ+1L5oWmDMh+EcQVQehCtGcz/NtGeEkYVvN7/rM2IQm8o0T5jEPVwHVI3abGlJ7APBaF+9X6AEjBHt6TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=at7zGCNA; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="at7zGCNA"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485843116d2so229878f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788778991; x=1789383791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yrOFvk8LiTwCYdGDX8xwU9E5M6RcniQn7yTDoguvCrI=;
        b=at7zGCNAw06lPgrzzMJQl67yIuZbeEMtCQioPRgCRze5EbpM417bQp0XVuXWOh7kAf
         FCNlJIWctnCM7HHKWq5n8YrHb6/WvrX7bTHDGW7eKIVsyWRfV6pkQRgiNgYRuthlz6KG
         c8sK59eDY2lswIPJPwGCA2TVEtL8vMhS04CuU6iD/tUyz8AddC7pUOfYGrb5CkbMe6sU
         E3/j2WYs1WPUCvlPU7a3WBRP2WjC8BIbc8zCdi6PZ5un+/2roj1YpH1EhQZco9GjEfUi
         bKDG+28+KLZGal7cDnqKBgP4oe5YlnfkYt1MkmPMAXyvhMPyGlzXrT7X4+joPyObUEqU
         QBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778991; x=1789383791;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrOFvk8LiTwCYdGDX8xwU9E5M6RcniQn7yTDoguvCrI=;
        b=c40hYv83FKH9ybJKBMAOinLB8Sc62hOMA61IF/WTFxjWon4bERO0j9WfUC0Fs8iled
         Fd/dUXGE2UoEdrVAiq2hPCJihPTqI0J6SfJLT5nREX8NECdNZu9cRm9aKqMkUYFN/tM/
         cmhuQXJQcBukOXTUmP5CI1dJlZT9vNPu4yx9C0BY1my3FL/bLphvJGRphMQZu6YBBJn3
         H1aBmlsU0aX1GG/S4KTHwcsqStIFZVStahVC3GYauRRZW7otJ5DMXOmjKVpycpdk7Ndt
         V/OoJo67/PRoU7VJvc+tnHkeLg+JLp8NmmSR/qfs/Pc5L5ZxwLMM/U7sm22VfgmjNoGC
         L6wg==
X-Forwarded-Encrypted: i=1; AKwUvBx7QySM9TWt+YNqTd3fVzAhnOyOjs6KuuPKpgdzO7eZbTVf9bR5estUx/hdlx5DIaUhqFuwHpR8h64BRxo=@vger.kernel.org
X-Gm-Message-State: AFuF++lj8XRBEWa3f1Ccvb2+s0dVQWyGpE3MWM2b9f9lSs+2Bp6GbyV0
	vIAJZclOtcqQv/wH1unLX2iUw1Yf0cFAh1kctSMuQAJbIMFgaS9QGLk0
X-Gm-Gg: AYBFou0u5V+JivDugRZ9xZLPfOJwikHuDJfnwMLN7BNInyvinV1snqQATUl0CXWEUWU
	weHTUX8SRmAYS2T7cccu2Aea0Osg6sSXMQQ7BpGHePbujuOMRMO/sKtaFizQ9YDxDq2q694zr4l
	eu1Bw7SApXcrnod99kiwHo9+GpvjD6iYI0NAWnW5YAdPNjJlmzeYGxRERDvZsQjqBuLTYq4YDfP
	2vs5cJf6SMvMpD1EDUwgXJjL88lCq9qHjJrMArFiVeSKhJz2RKJk/D1FvqGgaKvyjTEJspV7fay
	JKJGP/PN017YCvAn/noM9JOaF3iNCmZBDzKVVibfF71otMFl3UGJEHiLKyl6nQYnTrGBbAmnJdI
	jiaGGIurZ2nDRT13kPs5znIC90Ls4ngrvfC9LaCs7hoaM5j34HEhCdkBimHDVAG3U8CAz+WO+fC
	OKfd6DUhzRx7AE+kZr325GPKVUFkKXVbLoqZRctUYM0kC7rGl9xN0=
X-Received: by 2002:a5d:5d02:0:b0:484:398f:2c7e with SMTP id ffacd0b85a97d-4859796277fmr7950614f8f.0.1788778991318;
        Mon, 07 Sep 2026 04:03:11 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d006:ef01:8e86:58dc:206e:83a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858dd90e1fsm26506671f8f.28.2026.09.07.04.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:03:10 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:03:08 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 2/4] phy: core: Add common helper for get phy phandle
 by index
Message-ID: <20260907110308.nc3jwwoyv7j2mlxp@skbuf>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083709.425893-3-inochiama@gmail.com>

On Fri, Sep 04, 2026 at 04:37:06PM +0800, Inochi Amaoto wrote:
> Several phy helper use index to get phy phandle of a device node,
> add a common function for the future reuse.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/phy/phy-core.c | 51 +++++++++++++++++++++++++-----------------
>  1 file changed, 30 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index ea79913fbb87..a7d7acb5d3c2 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -681,33 +681,49 @@ static struct phy *_of_phy_get(struct device_node *np, int index)
>  	return phy;
>  }
>  
> +/**
> + * of_phy_get_by_index() - lookup and obtain a reference to a phy using a
> + * device_node by index.
> + * @np: device_node for which to get the phy
> + * @index: index of the phy from device's point of view
> + *
> + * Returns: the phy driver, after getting a refcount to it; or

Not driver, but device.

> + * -ENODEV if there is no such phy. The caller is responsible for
> + * calling of_phy_put() to release that count.
> + */
> +static struct phy *of_phy_get_by_index(struct device_node *np, int index)
> +{
> +	struct phy *phy;
> +
> +	phy = _of_phy_get(np, index);
> +	if (IS_ERR(phy))
> +		return phy;
> +
> +	if (!try_module_get(phy->ops->owner))
> +		return ERR_PTR(-EPROBE_DEFER);
> +
> +	get_device(&phy->dev);
> +
> +	return phy;
> +}
> +
>  /**
>   * of_phy_get() - lookup and obtain a reference to a phy using a device_node.
>   * @np: device_node for which to get the phy
>   * @con_id: name of the phy from device's point of view
>   *
> - * Returns the phy driver, after getting a refcount to it; or
> + * Returns: the phy driver, after getting a refcount to it; or

Same comment here. You are changing this line anyway.

>   * -ENODEV if there is no such phy. The caller is responsible for
>   * calling of_phy_put() to release that count.
>   */
>  struct phy *of_phy_get(struct device_node *np, const char *con_id)
>  {
> -	struct phy *phy = NULL;
>  	int index = 0;
>  
>  	if (con_id)
>  		index = of_property_match_string(np, "phy-names", con_id);
>  
> -	phy = _of_phy_get(np, index);
> -	if (IS_ERR(phy))
> -		return phy;
> -
> -	if (!try_module_get(phy->ops->owner))
> -		return ERR_PTR(-EPROBE_DEFER);
> -
> -	get_device(&phy->dev);
> -
> -	return phy;
> +	return of_phy_get_by_index(np, index);
>  }
>  EXPORT_SYMBOL_GPL(of_phy_get);
>  
> @@ -957,7 +973,7 @@ EXPORT_SYMBOL_GPL(devm_of_phy_optional_get);
>   * @np: node containing the phy
>   * @index: index of the phy
>   *
> - * Gets the phy using _of_phy_get(), then gets a refcount to it,
> + * Gets the phy using of_phy_get_by_index(), then gets a refcount to it,
>   * and associates a device with it using devres. On driver detach,
>   * release function is invoked on the devres data,
>   * then, devres data is freed.
> @@ -972,19 +988,12 @@ struct phy *devm_of_phy_get_by_index(struct device *dev, struct device_node *np,
>  	if (!ptr)
>  		return ERR_PTR(-ENOMEM);
>  
> -	phy = _of_phy_get(np, index);
> +	phy = of_phy_get_by_index(np, index);
>  	if (IS_ERR(phy)) {
>  		devres_free(ptr);
>  		return phy;
>  	}
>  
> -	if (!try_module_get(phy->ops->owner)) {
> -		devres_free(ptr);
> -		return ERR_PTR(-EPROBE_DEFER);
> -	}
> -
> -	get_device(&phy->dev);
> -
>  	*ptr = phy;
>  	devres_add(dev, ptr);
>  
> -- 
> 2.55.0
> 
> 
