Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921891;
	b=iMK9ZapocWyS+071/a8iJMiN80KsKOxjMzp1Uh2CFhWMFA9dTrwGxsYoyjgEKnMcnmPr
	 vGBz01Woxc7h2IzuErNk7P+FNss9EbF48TrfrDc8ZMYOzBNia5OvwXxsi+I62HCu4r0BS
	 /YJs83aoXFq/R6NRApMAcNBLH6HYh1YPuQcknQy7MEhPif5//zUNS+CE9T/xMN9LLIz/H
	 Q1oSQURYr1IItHKlD47fJHLaGLBFsfSVE49Q65HadBW8baqWXJR3ZEDEmFHQqkgx0Wa8p
	 SEjMYew6sAofVDb0SptJm6Kw/zNtHHLiMFwRFsE1Ks3c/RiywHOPsF/yZ2Iho/Ln6DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921891;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TSh22ezXGHRLL6p9Q0uV00TEiBcMEaPjIBSi8aOWR34=;
	b=fiYEqiCHV7PuWnhPg+vJQkrd2k9auTnbPRfGlaauvVMGnJi+cqu3TAqyKbSvvRbn6yZA
	 fJl7XcZNVvbLEeNl3tIDDnlXwdWd9TDG09lPgvX1QGqD+2LfYtdu70P/7NB43uvSaCQaF
	 xIqwZSaBB0tgDUjj34X3FIyHrM3waISRoOwDtS7oALFKp3J+O/wWeMFh80wvsn+4qecWJ
	 LqUqxQW7xbSYfH0YiU80WENhpwikY/pa8f8VBOBlA2YqnvpDgLBJnBirvr1xp5IvF33D6
	 z/nWR4Rho7tJ6bSjKMbxP4lKq4+Ia24Wh9cFfNNtJa3uQWxXx3vlAJzBLqGu7sBZ5Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cRV9fD4u;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB1E606A333;
	Tue, 17 Nov 2026 13:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB1E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cRV9fD4u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794921890; x=1826457890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cx25pF1Zg5JZ34f7d3pdaTETlUg3rSJZZzkOLMRlzh4=;
  b=cRV9fD4uva+OhW98ot/mpl8LtjLltKacbPWwpATBLHU0dDyVKI6yoK69
   TCmXR10etRss6EnCS4B+DoCXwd68IOxkIK45/VO4uETXNxUL8AGaldKYn
   RnJWRxe4LjyxmM5fI/vn98qWnXKFdPXwtIY8fOj1nZY+vm8A8tcMyQPXO
   2J3y73O7PNcpPVNtgCm9yFN5ymhI62KumsP0fiNVU9ZBMRrVyuRdoodeP
   IM9UjnSwkXymWTkuS0I6VgGX/pR5VZ7BVdI2KjwfoBX0/iEQhRNtCB1lv
   BHZwl2NiV7V2AS80sOeNJvP396+ipvnIknRytpQI4bqPT95m+H47vAmC9
   A==;
X-CSE-ConnectionGUID: 2td71YnCRD6SAX5HXP8nKA==
X-CSE-MsgGUID: B+P8vTxSTr2R5x8vQQVBjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3585957"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3585957"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:24:50 -0800
X-CSE-ConnectionGUID: Mum/vH3SQ4i65ZlQ3tkbYQ==
X-CSE-MsgGUID: 4TANd09NT1OVA5bTVAdiWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10155146"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 17 Nov 2026 05:24:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 1A0B499; Tue, 17 Nov 2026 14:24:48 +0100 (CET)
Date: Tue, 17 Nov 2026 14:24:48 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 6/8] usb: typec: fusb302: move gpio_int_n into function
 local scope
Message-ID: <avxVoLitepTkqAnE@black.igk.intel.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-6-e5c65a8c58c8@collabora.com>
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
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-6-e5c65a8c58c8@collabora.com>

On Fri, Nov 13, 2026 at 05:42:42PM +0100, Sebastian Reichel wrote:
> The driver only cares about the interrupt and the GPIO itself is
> device managed, so drop the reference from the device structure
> and only keep it in the function scope. While at it cleanup the
> error handling by using dev_err_probe.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 1b3ee5715a74..76851e2b9ce5 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -86,7 +86,6 @@ struct fusb302_chip {
>  	struct work_struct irq_work;
>  	bool irq_suspended;
>  	bool irq_while_suspended;
> -	struct gpio_desc *gpio_int_n;
>  	int gpio_int_n_irq;
>  	struct extcon_dev *extcon;
>  
> @@ -1646,19 +1645,17 @@ static void fusb302_irq_work(struct work_struct *work)
>  static int fusb302_init_irq(struct fusb302_chip *chip)
>  {
>  	struct device *dev = chip->dev;
> +	struct gpio_desc *int_gpio;
>  	int ret = 0;
>  
> -	chip->gpio_int_n = devm_gpiod_get(dev, "fcs,int_n", GPIOD_IN);
> -	if (IS_ERR(chip->gpio_int_n)) {
> -		dev_err(dev, "failed to request gpio_int_n\n");
> -		return PTR_ERR(chip->gpio_int_n);
> -	}
> -	ret = gpiod_to_irq(chip->gpio_int_n);
> -	if (ret < 0) {
> -		dev_err(dev,
> -			"cannot request IRQ for GPIO Int_N, ret=%d", ret);
> -		return ret;
> -	}
> +	int_gpio = devm_gpiod_get(dev, "fcs,int_n", GPIOD_IN);
> +	if (IS_ERR(int_gpio))
> +		return dev_err_probe(dev, PTR_ERR(int_gpio), "failed to request interrupt GPIO\n");
> +
> +	ret = gpiod_to_irq(int_gpio);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "cannot request IRQ for GPIO\n");
> +
>  	chip->gpio_int_n_irq = ret;
>  	return 0;
>  }
> 
> -- 
> 2.53.0
> 

-- 
heikki
