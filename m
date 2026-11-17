Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921807;
	b=jPiiXTbKaB8aUXJO2zc4ASiODQEiHiA9tIwJ8ThozfqauqZaDKqZ8T5OiBeUhK0jxIPB
	 z8832T8QyAZETJPo/2g2vgAsDlXudsObK/JPWhaQ5+DDhfqdh6NP7KPTW3toUy5xFYOZB
	 FtKFone7BhnYcvhzBFDWEcqA3Q3OsjP8+/aUUvACbycdYM8T0XXNIWke8p/n4k9oig7en
	 V+u58OXCYhqfzWKQtMMN82F2IGONBu+FTELrPYT9z5+4bAnmPrb/T4oRG/xcAIBuPi4ck
	 agGJtOeZyxXDw/vPORuqd8D+2+iLnbqYzE/C1CWv3rXKsf0XS4vvWZV6I0nhxEE8H0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921807;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=bHye11SljU0CTblMVV+dGe7UaBkik9RQ/3RvKoUkhTw=;
	b=2vsGLVmSn2DL64AulDBmdM+XuqE19GOyTxL4npmEQPu/zSV7gnJwkld5UlwbI023bgnF
	 r+TUHcDVh84mtyYYARGGmuxydE3AiNq3iSNdp3hRfwMcHmfa9YrnrL544kdTfSCxLc6e+
	 rtowfimJV6+mT5G+BHnGzAwbz3h7GYMTPNW+xY9u51MyQIx/HCF84FpIqZwQ9DzIlO0Zt
	 olvTTvoiFouy1JRUHlwudNMsikmMG0E3JzAA4w4HzMzLGZ5HUNqCnfHgL5ba197CzaEml
	 NnU+vVVEeJuJFUobrD/N3TnpWRiU2Agsc1gQEUELLvgkulsqXYNC5s7qhJU0rJbqXzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HtbidBu6;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35D606A31C;
	Tue, 17 Nov 2026 13:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E35D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HtbidBu6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794921807; x=1826457807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nWZsoWQiD9DkZ9oDbWhANBwW5uKYv89tof8m6UfjJlY=;
  b=HtbidBu65CyhnxnZ/u0Hyozka3Vwn6LwikzFeSARypbjPnfLmYwXt/Ed
   HbKPDpuZR5j3SCWAyjRxsY0eGIwlNOpYHfSByj854dm+29cbqkByNSng9
   tbNfpRmr7sZXWYSYrwSaLzGL0r8YiZ+2jZZE6qSBL9t99g+YtcGFP/5iL
   FgeZ4w/pyW6zw6K2UeEqrqqMPxwPlv40gySc8HA7Wwux37ByT8cE8Vces
   IYG7iGRgKZum+bp07HJFMjNoP735Hu3wVXPGvmv1EM7N9zSjbvv82q+Ga
   6byXy7iH33SnR+S2U7ZZD1HvpEwMD9ejRW5gECHEuetLJr6gSeWH2KV7M
   w==;
X-CSE-ConnectionGUID: kXNcPGq6T22WusHjVUbCbg==
X-CSE-MsgGUID: dDjxG1CARiu/n0odOrcJMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3680693"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3680693"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:23:27 -0800
X-CSE-ConnectionGUID: nGParcY4RTeYyEpmM+g0cQ==
X-CSE-MsgGUID: +hmwJ46cTLa2ppJ/tTiEzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10232372"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 17 Nov 2026 05:23:25 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 6BB0C99; Tue, 17 Nov 2026 14:23:24 +0100 (CET)
Date: Tue, 17 Nov 2026 14:23:24 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 5/8] usb: typec: fusb302: rename init_gpio into
 fusb302_init_irq
Message-ID: <avxVTBLViL7LMmgY@black.igk.intel.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-5-e5c65a8c58c8@collabora.com>
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
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-5-e5c65a8c58c8@collabora.com>

On Fri, Nov 13, 2026 at 05:42:41PM +0100, Sebastian Reichel wrote:
> Add the fusb302_ prefix to init_gpio, since it is used by all
> the other functions and allows easy figuring out that it is a
> local function.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 8b83414c5819..1b3ee5715a74 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1643,7 +1643,7 @@ static void fusb302_irq_work(struct work_struct *work)
>  	enable_irq(chip->gpio_int_n_irq);
>  }
>  
> -static int init_gpio(struct fusb302_chip *chip)
> +static int fusb302_init_irq(struct fusb302_chip *chip)
>  {
>  	struct device *dev = chip->dev;
>  	int ret = 0;
> @@ -1758,7 +1758,7 @@ static int fusb302_probe(struct i2c_client *client)
>  	if (client->irq) {
>  		chip->gpio_int_n_irq = client->irq;
>  	} else {
> -		ret = init_gpio(chip);
> +		ret = fusb302_init_irq(chip);
>  		if (ret < 0)
>  			return ret;
>  	}
> 
> -- 
> 2.53.0
> 

-- 
heikki
