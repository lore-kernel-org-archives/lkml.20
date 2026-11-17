Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922649;
	b=5dvPwqWcxQzh9Kj9hh1fC7zvjRQwZ0U++TMZnoYGUPGIRSy3lfRBLOYiCtJ+DvEaeKzg
	 hWew92W/FlpdCRSy3ryfJjlwF9mm6XzACLXv7wj2bSwetnN3Qx8kVoX5ikP/aoeMxm4BK
	 gKDnxyOMqABkYGl3jBknJA+zh9I/D0k8eLu0ZH9kTx/XBZxtN0Ug4TFU4QZs3hBc2Oc5J
	 2p5YnVZB39TjnWdDXSOGuRYEohTwfHSucmux6mq0X9NpufKTxximF6JDWHo7YUEWUQSEx
	 JOZO/6iDjAH3FyeciD5gNlJoz9TGyxbMJOasVz5lH057ulmaT0V7AnDi+MuMmevEB/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922649;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GQMB73RxuOHTpuYWjR8iMEauPzSd5J7bLH+J7TDo+H0=;
	b=1iTei4KamYCpGHO9y8qn9cfjRacYdhzkSl0Z/Fx02EQSEKpY8WOZ5WFgwJv6yo+ypFSz
	 w3daOjnQNiqVLHUvsqkupkUQ1HrDf++y4ToU2GcvNZZEPKRqv677jfKEwY+2WBN/GI+QE
	 lNa6h73hbAgfH2Wh4npO8dozkFIiMG2qDHbNWrpah4Cn1+XcwIFACbwB018Ig5O6QXmmd
	 a3Br89dYbpnNPHdJ2/f/EWw/TixpRh8s/svBOr1LsrGWAavl5q09ddHuOJJAm51gsGNn9
	 z/QgbDV8lPi1PG/ke3/19Q0yqrUEaVSTl4f82xguVEXXGO3jStAF7ja/oKhpqVFMqjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D8izTNTC;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58663606A333;
	Tue, 17 Nov 2026 13:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58663606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D8izTNTC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794922648; x=1826458648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x3SfXTYdtUfQJKZ+hYBSRGgPVF6ssBauyC1ZZE5q3a8=;
  b=D8izTNTC1YNwSjnbryRz2A+TfTGm/bw01sewpwHIXCqf3Z3jn8UtqlbN
   PrCVWOWdUUFJERLQhjEuONMbxr/X+/o0AZcSA2dOf1UIC8M6b4zWE06TM
   dcpAKXl9BxFxJYUaycaAOyu8SK4tFq/NcpyuRk0rQlOjLzhqJB6wX1Shc
   N8r8heqHvAPCsLBvIeq1V2JuxnUrP6ntBQjT2WCkMtXHWXjJJUir5nWUI
   tfthhET67iBX4mtQVcS9q5xc9QIm3jv5T8+xWdhW9YEdOl3WxPdWViSLZ
   +m7fQ4B/ravlSh3vpBfjlZyg4n55oCp9FRjRwd+Vr7KY/DMHFw/qW2Zvd
   g==;
X-CSE-ConnectionGUID: Zw/omBWYTPu/vIHvsNINLw==
X-CSE-MsgGUID: RKK4wV7ERIiPWAeWz/VQrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3595407"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3595407"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:37:28 -0800
X-CSE-ConnectionGUID: aqW3z2QIT6GM5LBbuv/Ysw==
X-CSE-MsgGUID: qMr2Qd1hTBuDAqjch8tZug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9903302"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2026 05:37:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9022199; Tue, 17 Nov 2026 14:37:25 +0100 (CET)
Date: Tue, 17 Nov 2026 14:37:25 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 6/8] usb: typec: fusb302: move gpio_int_n into function
 local scope
Message-ID: <avxYlYH2fjWipNzd@black.igk.intel.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-6-e5c65a8c58c8@collabora.com>
 <avxVoLitepTkqAnE@black.igk.intel.com>
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
In-Reply-To: <avxVoLitepTkqAnE@black.igk.intel.com>

On Tue, Nov 17, 2026 at 02:24:48PM +0100, Heikki Krogerus wrote:
> On Fri, Nov 13, 2026 at 05:42:42PM +0100, Sebastian Reichel wrote:
> > The driver only cares about the interrupt and the GPIO itself is
> > device managed, so drop the reference from the device structure
> > and only keep it in the function scope. While at it cleanup the
> > error handling by using dev_err_probe.
> > 
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

I'll withdraw my tag for this patch for now.

Thanks,

> > ---
> >  drivers/usb/typec/tcpm/fusb302.c | 21 +++++++++------------
> >  1 file changed, 9 insertions(+), 12 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> > index 1b3ee5715a74..76851e2b9ce5 100644
> > --- a/drivers/usb/typec/tcpm/fusb302.c
> > +++ b/drivers/usb/typec/tcpm/fusb302.c
> > @@ -86,7 +86,6 @@ struct fusb302_chip {
> >  	struct work_struct irq_work;
> >  	bool irq_suspended;
> >  	bool irq_while_suspended;
> > -	struct gpio_desc *gpio_int_n;
> >  	int gpio_int_n_irq;
> >  	struct extcon_dev *extcon;
> >  
> > @@ -1646,19 +1645,17 @@ static void fusb302_irq_work(struct work_struct *work)
> >  static int fusb302_init_irq(struct fusb302_chip *chip)
> >  {
> >  	struct device *dev = chip->dev;
> > +	struct gpio_desc *int_gpio;
> >  	int ret = 0;
> >  
> > -	chip->gpio_int_n = devm_gpiod_get(dev, "fcs,int_n", GPIOD_IN);
> > -	if (IS_ERR(chip->gpio_int_n)) {
> > -		dev_err(dev, "failed to request gpio_int_n\n");
> > -		return PTR_ERR(chip->gpio_int_n);
> > -	}
> > -	ret = gpiod_to_irq(chip->gpio_int_n);
> > -	if (ret < 0) {
> > -		dev_err(dev,
> > -			"cannot request IRQ for GPIO Int_N, ret=%d", ret);
> > -		return ret;
> > -	}
> > +	int_gpio = devm_gpiod_get(dev, "fcs,int_n", GPIOD_IN);
> > +	if (IS_ERR(int_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(int_gpio), "failed to request interrupt GPIO\n");
> > +
> > +	ret = gpiod_to_irq(int_gpio);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "cannot request IRQ for GPIO\n");
> > +
> >  	chip->gpio_int_n_irq = ret;
> >  	return 0;
> >  }
> > 
> > -- 
> > 2.53.0
> > 
> 
> -- 
> heikki

-- 
heikki
