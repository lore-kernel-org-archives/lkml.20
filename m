Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFBA476CCC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778888; cv=none; b=ZYJlKcConXWggNFHTzpo1lvpmiLoH0Z4u3zWlvwQ6kvw8uJjrVAsl53nax7v4wWMNinWvG2wt7wAqE7TZUIt9rqNBYZzwWteFHoEgPBdz+REUHTHn2hFVa52rMaPzDcCBj0GihiXya3CEzF2i6+4qQaDo3tSFRDkvhfT4IFl/DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778888; c=relaxed/simple;
	bh=XibBSg31sYhIfm9WILqIX5SvAFSJu4FQUUdGCpnT4H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n6AsniqRFWT5dB4DKgaGx6ZoSF9KUmOx/gGvks+bgbzY50Pcf2swdIotbzxE7iyRA6xOOp1MFukQoZcHKvXX9aB1e6HqI7CnBD283F15Pouvu0N2v8vfpbvug7LRAcpej1WOiMe/5E9sDp4eUE986vAkLQQjmROYW6bLVBYlIEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T11HSpV1; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T11HSpV1"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1a5b5eso676425e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788778885; x=1789383685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hmQkGxTXpbepXYDRQ84g3dgJxZsX5xz0ouxxoFxBPoQ=;
        b=T11HSpV1nGW+Gb+zKZ6ehZQU5einRXbQMi+gPUCKJkxc/P9FPyxUq8kFRFziumkteJ
         2aBDU85rvWg6OadekmLqF/pnVtxJ72aU3+dXEEalhbg+e04PxiGGbWSlPBmEt7vVacCN
         r0IymrRikrMRyq23bvzWdutYfUy9HisZgBRLho38YmRdlCyS1n31RO5BPBHFx7ycWS6U
         BNBJVjKKqSrAoPi3vABPpOoYeBh62jDQkbCpyCRRQToETnUio62lqSrGo9XJS9+laC6d
         6mNqHY5Yxohy7xLEoFhdhwe2KgpJmbFssTefLmKAet5regwIii7r7bjL2wqo1wZENKZa
         ZB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778885; x=1789383685;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hmQkGxTXpbepXYDRQ84g3dgJxZsX5xz0ouxxoFxBPoQ=;
        b=PMivB2/hMEJnz6ynqFG7OwXRAw9xPR2NulRQ55euPcsn8RjJorFVq5B5X1LBkgm3nJ
         YjwAjOHwHmfv6DGjUso5z43ik4M/NrguvCZE74SxN4IsOJku9C8pna08EhNc0isEyxTi
         9hwe0Epa4/0a6mIfmbe9ujRRV8sQ1JArBjnBpoIH4xqH4/jN+N/p4e4GJ25MqYRMVy/l
         oIHW6hDXNwxNvk46GN6gBGLAAhsBKoDRZHCjVuyAt65b+yphISDJ27XjH9SZ/MjnYNER
         iW3i9/UMWQ4BFvc3/jQ0Y1m8rD/SR1aXpWIHrzSz6NsB4QAeEtBcf4nnyRvT803ZmQBk
         cx6g==
X-Forwarded-Encrypted: i=1; AKwUvByBBEt5eAPSWBCkg8odU39nITRTen1AdEA4mCA9ZSxdn1KW2WjdqwjIF0p3wLcRq19yPWwpEwd4PztG6xc=@vger.kernel.org
X-Gm-Message-State: AFuF++ke1Z2PPvusTtDxXRjI27oDmicVweT36wM9Vt40zsoosdocdRIf
	/oCTqbLhWJorkk6GKBp4ReNF+EZZRehK5YEcmZ04EMkEHQkI8/H08Ipj
X-Gm-Gg: AYBFou3ejA2pCTEQyS/ahoXX1JfUUdY8HUBSyDgUO9JEFccxMeDHZk301sYfjEZGiG/
	1/LXgwtJzeaJduTF+7mvzr+E5EMrk6Vdw5X9NP4/XIaY/IilW6ZJjmgNQC18jA7LlXxUm/314li
	74KoqdkKp1ph5PqMjamVI0oXaHo+aPQUKxmD9YwvNSHM6XqoiiqNSQE9oFrqlVWljYgHF+76JQC
	h/PpTY2DawU/YEM8+UB472Zf0l1AooZV0JDzMRl3YryRct/GXfRG+VU1oWPUy5a1774VR2XE5wW
	QdSGv5gh9XNp3rYw1UXRu0u5HWEzmmCDc1Jg5JhTn7Gz7vqjrrhkedffXcREK/Tnwa2mSPnpgkZ
	iRShUSAAF+AC+8A8its3lnaiIx3lc6ro2G2B0Iz0qJsApWPVSGVeCVnTEvDzGcNQCYTFQh2ddsu
	y4m2cniYEsaQ/QZ0Kpe7QCxTjPWBfMo1FWoLiDQVqetomeB9U+4w==
X-Received: by 2002:a05:600c:a012:b0:49c:eac2:ddad with SMTP id 5b1f17b1804b1-49d01dc0137mr124980435e9.1.1788778885385;
        Mon, 07 Sep 2026 04:01:25 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d006:ef01:8e86:58dc:206e:83a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm27074419f8f.32.2026.09.07.04.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:01:23 -0700 (PDT)
Date: Mon, 7 Sep 2026 14:01:21 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 1/4] phy: core: Add common helper to add phy phandle
 device link
Message-ID: <20260907110121.hfrblphv5vhzobj7@skbuf>
References: <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-1-inochiama@gmail.com>
 <20260904083709.425893-2-inochiama@gmail.com>
 <20260904083709.425893-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083709.425893-2-inochiama@gmail.com>
 <20260904083709.425893-2-inochiama@gmail.com>

On Fri, Sep 04, 2026 at 04:37:05PM +0800, Inochi Amaoto wrote:
> It is very common for adding a device link for phy phandle
> for device managed phy helper functions. So add a common
> helper for future reuse.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/phy/phy-core.c | 38 +++++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 21aaf2f76e53..ea79913fbb87 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -606,6 +606,26 @@ int phy_validate(struct phy *phy, enum phy_mode mode, int submode,
>  }
>  EXPORT_SYMBOL_GPL(phy_validate);
>  
> +/**
> + * phy_add_device_link() - Associate the phy with the device
> + * @dev: the device to link the phy
> + * @phy: the phy to associate
> + *
> + * Associate the phy with the device by using device link.

I guess it would be good to specify somewhere "consumer" device, because
there are multiple devices involved.

> + */
> +static void phy_add_device_link(struct device *dev, struct phy *phy)
> +{
> +	struct device_link *link;
> +
> +	if (!phy)
> +		return;
> +
> +	link = device_link_add(dev, &phy->dev, DL_FLAG_STATELESS);
> +	if (!link)
> +		dev_dbg(dev, "failed to create device link to %s\n",
> +			dev_name(phy->dev.parent));
> +}
> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy
