Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921661;
	b=xjGmMklpbkczWWmb1oQeSUKAGQg2dfL5SUkKk7SsXQX7TqJXJrI+XeGhJa00EDpjmB/m
	 N5/sB9eZ0qvsXl1Hw41LvjdwiFE10V8rr8ZRe44KXXDejBAr7MuWTPnM4EPg1fJeSmLYX
	 surGQNHfxEfSw2DX7EDo8xlND3fl/a6RpAsC+2rWhElEFizASgnA8Q2ik5XTmTL8gb8b+
	 GpNX5orbtgXSTwarteIgGNM8+3Kpx1R75sIfiBgTIQG26iESsuOGjwjxO8GD5Uw0q/MA7
	 TVgg+hxxaWf0XVPuqaRXjbYFPys0cEykxjX9GBUdpt1WNlg4VrFreVoomPgYntHBc5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921661;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=1MJZEmnPkg3PfNut+uhmRt34A9/3ciDGB9XpmeSdI4I=;
	b=pdtvJjNQ1P6b7/d6xcj5MzKoOJ/qNo4eu7Vg0qfywz6D14UtPJn0OJGFtfZv23k9jlJx
	 Vq/TkqPIR25cuHjWmwukWHpZQDmyGMClf6e2tT1vmXW4Xli9oyvuPcAKWmrAq0lZgx554
	 bBPvdz/xQ6XbcQ4nHRJrv5LyUhWvLhI38441xOuRzoNePVipTEeiGRTjtgZme282AlLx8
	 +RmwHzmEkk51p1XJULyHZR0G1ae/2NC8G/V9akSSZJPtRg+Til3N17pbrpjLP5zosq49q
	 Yg9pS4zA0jiFBS9HVMV3mkmxTZods/aFCTkqSPDQj1J9Ba0/w6zXsEN3qND+6B1Be7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F3sdAHbN;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85674606A32A;
	Tue, 17 Nov 2026 13:21:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85674606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F3sdAHbN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794921661; x=1826457661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LZdAxXxoEX2S+cUugFvf30hnqpsL5DEW9EMmpqb9nRc=;
  b=F3sdAHbN4CqSxDsisaTbTP2AjueP53MxgaWGmO+xZRCtTXcdQgNqi+0R
   jcy+3ZE/PM4Z4oyRoRMj5MF6l3gHvu/PlsMHw90Q2B765XBG7ujtxfvJd
   2a0sG6IwQ/p1xh5ELnH1cHJLWMXmm8sUyeQRn9DBe6uteTvMcChvuqZZL
   uFiM2R4VVlG4nueQi2UNIBm1xHD5U4fomkEPVgNMQmjPoDIjF6ogxXMgx
   2tFbj8iVRhH1B8WreIKvylfQuKukSNDLsaXB/WgasqrjrFgG57VeZl9i+
   nnGtyRp+mhLmps7w7WrxNHcbrYyxQoUADy6KZST+GoLl8hlYZYs/xGFc2
   A==;
X-CSE-ConnectionGUID: RqEJ1FI5SkiokK9N4W9U4Q==
X-CSE-MsgGUID: u1bav/q0RtOMtxJ0sDpGmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3581888"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3581888"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:21:00 -0800
X-CSE-ConnectionGUID: Eq+kvBPcTBaRq7VRq2CZPQ==
X-CSE-MsgGUID: LurWnyOSTaGeSUIR4Zw7qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="11569901"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa012.fm.intel.com with ESMTP; 17 Nov 2026 05:20:58 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8B6C899; Tue, 17 Nov 2026 14:20:57 +0100 (CET)
Date: Tue, 17 Nov 2026 14:20:57 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 4/8] usb: typec: fusb302: switch to devm_pm_set_wake_irq
Message-ID: <avxUubGaIXH2kIqk@black.igk.intel.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-4-e5c65a8c58c8@collabora.com>
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
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-4-e5c65a8c58c8@collabora.com>

On Fri, Nov 13, 2026 at 05:42:40PM +0100, Sebastian Reichel wrote:
> Use the modern device managed wake IRQ helper provided by the PM layer
> instead of directly calling the interrupt wake enable/disable functions.
> 
> This results in the wake capability only being enabled once system suspend
> is entered as its not supposed to be set while the system is running
> normally. Also it now properly reacts to device_may_wakeup().
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index a7a1dce6cf86..8b83414c5819 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -19,6 +19,7 @@
>  #include <linux/mutex.h>
>  #include <linux/of.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/proc_fs.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/sched/clock.h>
> @@ -1804,16 +1805,11 @@ static int fusb302_probe(struct i2c_client *client)
>  	if (ret)
>  		return ret;
>  
> -	enable_irq_wake(chip->gpio_int_n_irq);
> -
> -	return ret;
> -}
> -
> -static void fusb302_remove(struct i2c_client *client)
> -{
> -	struct fusb302_chip *chip = i2c_get_clientdata(client);
> +	ret = devm_device_init_wakeup(chip->dev);
> +	if (ret)
> +		return ret;
>  
> -	disable_irq_wake(chip->gpio_int_n_irq);
> +	return devm_pm_set_wake_irq(chip->dev, chip->gpio_int_n_irq);
>  }
>  
>  static int fusb302_pm_suspend(struct device *dev)
> @@ -1870,7 +1866,6 @@ static struct i2c_driver fusb302_driver = {
>  		   .of_match_table = of_match_ptr(fusb302_dt_match),
>  		   },
>  	.probe = fusb302_probe,
> -	.remove = fusb302_remove,
>  	.id_table = fusb302_i2c_device_id,
>  };
>  module_i2c_driver(fusb302_driver);
> 
> -- 
> 2.53.0
> 

-- 
heikki
