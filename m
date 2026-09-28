Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E628023394A;
	Mon, 28 Sep 2026 12:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600170; cv=none; b=q+7hw+nNVNT0iqvMZAoYOrzhBJeXR2ct1j094Zyfob3pgwqv7xmnuciBe1q0zUCgAGjaobAV7YS1j5lKUiAbZUgA4sE+GygXa+RVsHFlCYVMsBwm1DhOYxW6jTfHGdrA9ZALZ5jL6MFSPCpe5nW3bDXETX1Y+1PUOJAx9B37iBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600170; c=relaxed/simple;
	bh=tqLJfY7pY3vlH3m3lHxCKrygabEuCfg+II+xqOyLmx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsP3n19y7r3Se2g7weEaKGsWXBMJ8sQ6r3Y94KefSFC8+2EibrdS9QzTyCpa6IO45IKZshbTM3W628D+epb3sCTSMKI8gVySk49ui6DeL5gxDS5FwOIw9rOo7gd5hvOc5c9wqyn6mMytTDgKRKNlUDSolpL3eO77/VvU8dhfkq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYcksAkI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYcksAkI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790600169; x=1822136169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tqLJfY7pY3vlH3m3lHxCKrygabEuCfg+II+xqOyLmx0=;
  b=RYcksAkIu4r+gli2amJpHWtkKum2cG1ynyUDMUtuxbTrVmpKmvns6zUX
   oojp/urRD878saYe2+Xn5cieHACMC1hR0YB0MNZHT2+BgTpQRRsuoERZQ
   1yLaaa81VXGvXLdcW+YpqUZ4jCyMPBpIo8XtB9BuZ1Bwik60xU9i0OHat
   rgNg/dnLsfxmGeNApPQngPxf0wnLBEeHy0jO6mY3QvEdSkhWaONjqQKLF
   C5dLoCN7x0itpNDoD0qvenox1Xf94pTW/YYAOrENAkc00clIkNequnHZZ
   1y5qmXYmUVHPBjTBgb03q43pZME/vZ18mNApRZa1D3idG6uERub46w/DV
   g==;
X-CSE-ConnectionGUID: YyiHMks3RBCpnHemAvcV6g==
X-CSE-MsgGUID: /RXBUNmbS0eBr+COLoLyxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90063779"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90063779"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 05:56:08 -0700
X-CSE-ConnectionGUID: CnfWhjjKQmWpFpWp7zNU2Q==
X-CSE-MsgGUID: zejW5/j6Q/6sQhZiZArpQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="273649793"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2026 05:56:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id E9FCD99; Mon, 28 Sep 2026 14:56:04 +0200 (CEST)
Date: Mon, 28 Sep 2026 14:56:04 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Amber Kao <ite_pd@ite.com.tw>
Cc: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>,
	Yaode Fang <Yaode.Fang@ite.com.tw>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: itepd: Update descriptions for
 IT885x and IT527x series
Message-ID: <arpj5IBEMYoXWBM7@black.igk.intel.com>
References: <20260924-ucsi-itepd-it527x-v3-0-a7392aa087f5@ite.com.tw>
 <20260924-ucsi-itepd-it527x-v3-2-a7392aa087f5@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-ucsi-itepd-it527x-v3-2-a7392aa087f5@ite.com.tw>

On Thu, Sep 24, 2026 at 05:56:37PM +0800, Amber Kao wrote:
> The IT527x series and the IT8855, IT8856 and IT8857 run the same UCSI
> firmware codebase as the IT8851 and are handled by this driver through
> the "ite,it8851" fallback compatible. Update the Kconfig prompt, help
> text and module description to cover the IT885x and IT527x series.
> 
> Signed-off-by: Amber Kao <ite_pd@ite.com.tw>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/Kconfig      | 5 +++--
>  drivers/usb/typec/ucsi/ucsi_itepd.c | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> index 0f10dac9b34b..5e32ff20ebb5 100644
> --- a/drivers/usb/typec/ucsi/Kconfig
> +++ b/drivers/usb/typec/ucsi/Kconfig
> @@ -105,11 +105,12 @@ config UCSI_HUAWEI_GAOKUN
>  	  called ucsi_huawei_gaokun.
>  
>  config UCSI_ITEPD
> -	tristate "UCSI Interface Driver for ITE IT8851/IT8853"
> +	tristate "UCSI Interface Driver for ITE IT885x and IT527x series"
>  	depends on I2C
>  	help
>  	  This driver enables UCSI support on platforms that expose an
> -	  ITE IT8851/IT8853 Type-C Power Delivery controller over an I2C interface.
> +	  ITE IT885x or IT527x series Type-C Power Delivery controller
> +	  over an I2C interface.
>  
>  	  To compile the driver as a module, choose M here: the module
>  	  will be called ucsi_itepd.
> diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi/ucsi_itepd.c
> index 50a9eae656ab..5b39ba286db7 100644
> --- a/drivers/usb/typec/ucsi/ucsi_itepd.c
> +++ b/drivers/usb/typec/ucsi/ucsi_itepd.c
> @@ -353,5 +353,5 @@ module_i2c_driver(itepd_driver);
>  
>  MODULE_AUTHOR("Jeson Yang <jeson.yang@ite.com.tw>");
>  MODULE_AUTHOR("Amber Kao <amber.kao@ite.com.tw>");
> -MODULE_DESCRIPTION("UCSI driver for ITE IT8851 and IT8853 Type-C PD controllers");
> +MODULE_DESCRIPTION("UCSI driver for ITE IT885x/IT527x Type-C PD controllers");
>  MODULE_LICENSE("GPL");
> 
> -- 
> 2.53.0

-- 
heikki
