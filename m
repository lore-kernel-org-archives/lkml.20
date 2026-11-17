Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922507;
	b=KBVZPEt6RZGDiqxWX67ZYW9abocBB1xTiVc/QwmqECY79kWjZdgQwXIUePqqsmUNIMvT
	 a0MzWmCUI1l6cOoydx2QK6lGCACxhAKsQWtvzvJ/ZwMBWT3qx4U2IvmR9hy1uPmzo9TvD
	 ntwKPRpzO+q3zSB68nsB6bhmgAanNaWe/598Q90ecI7CRF09ddTJkHW42ztHQSj0cu1og
	 7/i2Si5+4jo6JKhAbhKRruEzgknolAmijbYzP/nrhD8KYdHo69FU3EJaBtoPQt1vBTzY0
	 B/rDrgpZZNwHRbucy3YztrQO3Y5gt1S/TY4OGUtXhVWy7kcpsOXX2yK8C/6YESD7R6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=i+BFDNL7i4hgEPfGFThGwLCtNaracNjrr21qTOWajH8=;
	b=LOzZM8iQQ1iSTQYGgzLTiXQqzR43ZWd5PEOITgJ4nju1HyXY1DN/YKaQaVZFXRnkTURz
	 KmHFq0zUZ/EvQSOWHyCEHgb5iCX9aaIPIvAF/xjzl9ALTI9GI0GTvS+6HKPsIPW78xPn9
	 Yu3OkdHuCxCyJRJqGRFGTF44KjjZsbMfTJhZdhslcIzIeeN9B+qyFRmsykTUYE2eV4TNb
	 GZTEruYQZqrtrhccAIoarE/EIVNvRQRhPvKiv9oRbePCoZSZ4chODpYj0qBcK3134W7iH
	 6WDH0joU+ID0QLD/JQZJ+wS2RBbyIiuFfxc9PuTD8ARP2Pigk3hKuk1M9scvYQezy6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NbxMBOU3;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB72C606A330;
	Tue, 17 Nov 2026 13:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB72C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NbxMBOU3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794922507; x=1826458507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hPL1dAQGLHD1UvhHIpxl+Y5siEbxzeilMshvgFX8FQE=;
  b=NbxMBOU3u/ZZMJOLDlwnqLLhMDM8tJpm+4DophJCCi0dvcgswPAa9OOj
   jZ/hUvONFtMYWoq3uS8X0a1ols5ZPqom4Drj5qfq4M/7FuDajJwSMGKEt
   wLDu0IPCdRbgGzpH2TOjCKO4AtKhsRlVy7M4cJbJeQ0+AT3MzOTKhWi2T
   MqKSjnNw62RR7ZJEm9sqTA98ddQOOeMmo/sl7c1yqA0vfzro91hI+Xi1E
   lCFChY+9+JO57NRms2nwGpJyRa0aZ/+9Jth3817D+Oo+2QEFy2llB9izF
   XoNr6sOTsj5rrbTUg55Cd032Ghe2nSQurx/22IY0YDCItYmL2+5AlTnxD
   g==;
X-CSE-ConnectionGUID: nZaP2LGeTpu2C7FF6L03oA==
X-CSE-MsgGUID: gUuf29+dQ06a9IWo4W1jhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3595236"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3595236"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:35:06 -0800
X-CSE-ConnectionGUID: yXjUY8Q0T6Sg2SMEUDIlFg==
X-CSE-MsgGUID: ZfeFLr+ETce1LMF0GnzsoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9804237"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2026 05:35:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id C28DF99; Tue, 17 Nov 2026 14:35:03 +0100 (CET)
Date: Tue, 17 Nov 2026 14:35:03 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 7/8] usb: typec: fusb302: rework gpio_int_n_irq handling
Message-ID: <avxYB5S9_V2wy5Wh@black.igk.intel.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-7-e5c65a8c58c8@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-7-e5c65a8c58c8@collabora.com>

On Fri, Nov 13, 2026 at 05:42:43PM +0100, Sebastian Reichel wrote:
> Improve the code readability, so that one does not need to jump
> into fusb302_init_irq() to understand that chip->gpio_int_n_irq
> is guranteed to be initialized.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/usb/typec/tcpm/fusb302.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 76851e2b9ce5..6105f09f96aa 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1656,8 +1656,7 @@ static int fusb302_init_irq(struct fusb302_chip *chip)
>  	if (ret < 0)
>  		return dev_err_probe(dev, ret, "cannot request IRQ for GPIO\n");
>  
> -	chip->gpio_int_n_irq = ret;
> -	return 0;
> +	return ret;
>  }
>  
>  #define PDO_FIXED_FLAGS \
> @@ -1752,13 +1751,13 @@ static int fusb302_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
>  
> -	if (client->irq) {
> +	if (client->irq)
>  		chip->gpio_int_n_irq = client->irq;
> -	} else {
> -		ret = fusb302_init_irq(chip);
> -		if (ret < 0)
> -			return ret;
> -	}
> +	else
> +		chip->gpio_int_n_irq = fusb302_init_irq(chip);
> +
> +	if (chip->gpio_int_n_irq < 0)
> +		return chip->gpio_int_n_irq;
>  
>  	chip->tcpc_dev.fwnode = fusb302_fwnode_get(dev);
>  	if (IS_ERR(chip->tcpc_dev.fwnode)) {

I think this is okay, but I now think that gpio_int_n_irq should be
renamed. It's a bit confusing. The irq is not always gpio.

And that said, I'm now wondering if fusb302_init_irq should be
something else after all. Maybe fusb302_init_gpio_irq, or something
like that?

Thanks,

-- 
heikki
