Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914393;
	b=cs9H+6fvEirlrCuO+WY6cDnmBVRsId/tTdjBh+yDPYGThg2B2SZpCqRMV0ShebaYfZZh
	 QMf+q3296yeTD4KXP2Yxgpft6tv1sV4pYM2WGqPlcJNRh4fg1OAFfexvzrbeXCG6peM86
	 Io6aW6NrZCJwI9U94WTx0AFWUvrky/xq+EGRc5jpwfiBOoDpOncgiQZr8uyHleycBeFuK
	 +L4EzLmxt+PhCm8toR47zgWbfJcTH1k6+M2KymgW2qRAJ84xONTFoxcFe48i+gECEF7tb
	 mZaYm2rJSfeqzguxEWl2TzkduQk+gFrq5yDgHcLtCNw9w6s0H+Aie5PSTPDKKolI/dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914393;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=J3D5X9whr4CuICRWtOTLXhbuJoZ16bdz2KO7jQpTW6I=;
	b=beMsH0EYufPA8PeMLv/ev8O71jQnk5I4koIjiSsn7TK5VULXNnKJMFUNCHEu9X+8fa8C
	 RqKcL2u9BlC6vKrRfX9ubmnGn+z7VeYEQ10FGirTCnZbne+aZdOO4fbCVIzk3k3MPnbQG
	 4rkb8p3W0PJeDZ/XZHRgex51+dz5QN2AMFqfEui9BSc+M7ksgpYYkvNeh2v2CqVY2XbI6
	 kIBTgT3o2XULky8JjN5QKSa7KUYixYbTZwDjFltLynO+Iqpr0HWwmRV6G1+fd5Dwc1h6j
	 j/8FCuzRxrsbLhM8iY9moDVM8njPsRYBMzhupx07VsDJfC86iyGGy2MDJ1SAzZu2UcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TWrqv8a2;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABE2606A886;
	Tue, 17 Nov 2026 11:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ABE2606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TWrqv8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794914391; x=1826450391;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kDTwPyTQqXQY+QlQDSQh1XOk2yJFdM0AYsZ+EJDMvEo=;
  b=TWrqv8a2jjeSLi4XgQhvSzczb7JdUNIAix1tpkj9XaDaeZHn0qoC9XBR
   XJd+OHQHjNR/hpMCDm3UXJIVU3TCKs57wzq4zmkKGWOU2nWC3NQfrejfK
   Fu4ysV4w4cK0oCV1LbtSLxv7j0KxOfOY98YqN78RFdYKjH0Yex702Xkal
   NH4R2O8P0WMsMf0PzaNbHySe2ZRLbaqbWKo6cKcT2sOP5ykWw1lNu93Nq
   l5rjjWXbmoBDB62OyC3X32XQNYb1B+DUrafXWzx2NbJvDXdhq0kfhK/q0
   fF+me4O4EFzdBpD4A657SjpoBjXaB0TDDFEvCySptqh7JJSe9LRnE3rQA
   Q==;
X-CSE-ConnectionGUID: Q8Uax0odQJmwuej62E7/+Q==
X-CSE-MsgGUID: pA70B/83STi0StekqAHLAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3718478"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3718478"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 03:19:48 -0800
X-CSE-ConnectionGUID: /773YfFXSBe/CQyzRBqquw==
X-CSE-MsgGUID: nQMrnzpiRBmYETnaUUYjtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10171978"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2026 03:19:45 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 785AC99; Tue, 17 Nov 2026 12:19:44 +0100 (CET)
Date: Tue, 17 Nov 2026 12:19:44 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Keisuke Tsukuda <tkdkei@outlook.jp>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: roles: wait for role callbacks on unregister
Message-ID: <avw4UE8H7t0Ybq6_@black.igk.intel.com>
References: <20261112024101.83321-1-tkdkei@outlook.jp>
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
In-Reply-To: <20261112024101.83321-1-tkdkei@outlook.jp>

Hi,

On Thu, Nov 12, 2026 at 02:41:24AM +0000, Keisuke Tsukuda wrote:
> usb_role_switch_set_role() and usb_role_switch_get_role() check the
> registered flag before taking the switch lock. If a provider is
> unregistered during a role request, unregister can return while its
> callback is still running. The provider may then free memory used by
> the callback, causing a use-after-free. A caller that passed the check
> can also enter a callback after unregister returns.
> 
> Move the registered checks under the switch lock and clear the flag while
> holding the same lock on unregister. This waits for active callbacks and
> rejects callers that acquire the lock after the flag is cleared.
> 
> The Apple DWC3 remove path currently holds its private mutex around
> unregister. Its role callbacks take that mutex under the switch lock, so
> waiting on the switch lock in unregister would reverse the lock order.
> Unregister before taking the Apple mutex.
> 
> Fixes: fde0aa6c175a ("usb: common: Small class for USB role switches")
> Signed-off-by: Keisuke Tsukuda <tkdkei@outlook.jp>
> ---
> Tested on ARM64 QEMU with Linux 7.3.4 and mainline 7.4-rc2
> (067c5c24cef2), with KASAN and lockdep enabled. Synthetic providers
> trigger KASAN use-after-free reports in both set and get callbacks before
> this change. With the change, unregister waits for the callbacks and
> neither test reports KASAN.
> 
> A lockdep test modeling the Apple callback/remove lock order warns for the
> original order and not for the new one. Apple DWC3 hardware was not tested.
> 
>  drivers/usb/roles/class.c     |   18 ++++++++++++++----
>  drivers/usb/dwc3/dwc3-apple.c |    4 ++--
>  2 files changed, 16 insertions(+), 6 deletions(-)

If you get this reply for the second time, then I'm sorry for the
noise. There's something wrong with our SMTP. I don't see all my
replies on the usb ml.

Please split this, one patch for the class and another for dwc3.

Also, don't forget to CC stable. This is a fix:
https://docs.kernel.org/process/submitting-patches.html#select-the-recipients-for-your-patch

Thanks,

> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -79,10 +79,11 @@
>  	if (IS_ERR_OR_NULL(sw))
>  		return 0;
>  
> -	if (!sw->registered)
> -		return -EOPNOTSUPP;
> -
>  	mutex_lock(&sw->lock);
> +	if (!sw->registered) {
> +		ret = -EOPNOTSUPP;
> +		goto unlock;
> +	}
>  
>  	ret = sw->set(sw, role);
>  	if (!ret) {
> @@ -90,6 +91,7 @@
>  		kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
>  	}
>  
> +unlock:
>  	mutex_unlock(&sw->lock);
>  
>  	return ret;
> @@ -107,16 +109,21 @@
>  {
>  	enum usb_role role;
>  
> -	if (IS_ERR_OR_NULL(sw) || !sw->registered)
> +	if (IS_ERR_OR_NULL(sw))
>  		return USB_ROLE_NONE;
>  
>  	mutex_lock(&sw->lock);
> +	if (!sw->registered) {
> +		role = USB_ROLE_NONE;
> +		goto unlock;
> +	}
>  
>  	if (sw->get)
>  		role = sw->get(sw);
>  	else
>  		role = sw->role;
>  
> +unlock:
>  	mutex_unlock(&sw->lock);
>  
>  	return role;
> @@ -423,7 +430,10 @@
>  {
>  	if (IS_ERR_OR_NULL(sw))
>  		return;
> +	/* Wait for in-flight set/get callbacks before unregistering. */
> +	mutex_lock(&sw->lock);
>  	sw->registered = false;
> +	mutex_unlock(&sw->lock);
>  	if (dev_fwnode(&sw->dev))
>  		component_del(&sw->dev, &connector_ops);
>  	device_unregister(&sw->dev);
> diff --git a/drivers/usb/dwc3/dwc3-apple.c b/drivers/usb/dwc3/dwc3-apple.c
> --- a/drivers/usb/dwc3/dwc3-apple.c
> +++ b/drivers/usb/dwc3/dwc3-apple.c
> @@ -487,9 +487,9 @@
>  	struct dwc3 *dwc = platform_get_drvdata(pdev);
>  	struct dwc3_apple *appledwc = to_dwc3_apple(dwc);
>  
> +	usb_role_switch_unregister(appledwc->role_sw);
> +
>  	guard(mutex)(&appledwc->lock);
> -
> -	usb_role_switch_unregister(appledwc->role_sw);
>  
>  	/*
>  	 * If we're still in DWC3_APPLE_PROBE_PENDING we never got any cable connected event and

-- 
heikki
