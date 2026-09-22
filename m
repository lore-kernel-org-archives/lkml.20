Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BE2539789;
	Tue, 22 Sep 2026 11:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075004; cv=none; b=Z7NbfXfjFG3DiDrpW3eeoi9tvtHAZRD90LhYMNe0ZvE5QljjjGtp/CuZg5VLhM9PNwJfe3SaU/Z9w4Z5tXtJ5FRVM/yF4D5Rd9V42tRH9nlJFBMFdSEdhDncTas8vCoet+GhxgMbwyvdM/DR8/pt9V/qC+QSArpd8sdwDJZhMvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075004; c=relaxed/simple;
	bh=ik2TSWWSMDSo+wj+TTDCw/82I6ainBJxGpgZm7BMKIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hnmxo97XlEVsgxRgVG1K31P/sUTKcUZwz6iTomJjVZMmjrsYwI153XgMTkfyjYQ7GvQjandIcM/r+50PakZSjI5gXg/1zRiWAYPyn/G3RGy7GfCM9A67QWSOtvsj6U2+mbo6GpKj4ubKHO45CSPzo/XJ6yaPiW7qkvyW/FO0gqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xyulv73U; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xyulv73U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790075003; x=1821611003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ik2TSWWSMDSo+wj+TTDCw/82I6ainBJxGpgZm7BMKIo=;
  b=Xyulv73Uptw/sqmR5n7WY2wgvwPg6DLkWYFgyNFjlPMyPLIqMkMg/TWd
   Pb1vsbcacT0DnAjyFibbSScRgNcyJun+LYPV8Xx7iwqsE5StW9GxMeNIu
   AWVOsYGijRHePz+VJu1lG8rJxBeARtPtc035yTzAnCyU1FVoX0kf0svgF
   zgw7QH3I/NhXrFmFX4FhIg6dbq6lXQDUIQUUmAp3bCwLL37wtPXNNLljn
   8VyY0ccIF+b6jXOLrCaAm4dgrrQ/lXDeHJPXLIfK8d1OyH3t+lPYki5qi
   2pJaTqD5HebFpLvARreWwb9enGCMVYv2Kj2QUbPknzvde845qFzx0+1FL
   g==;
X-CSE-ConnectionGUID: zfHVlbbWS2+Jwwc1xEFVow==
X-CSE-MsgGUID: /fHXh1uiQmaAWqTQYno1xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="116189874"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="116189874"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:03:22 -0700
X-CSE-ConnectionGUID: jYNSqwELSaymLJSVygnpkw==
X-CSE-MsgGUID: JY29+J1BTgifCjMru4fGdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277871181"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2026 04:03:19 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 1DC5D99; Tue, 22 Sep 2026 13:03:18 +0200 (CEST)
Date: Tue, 22 Sep 2026 13:03:18 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Amber Kao <ite_pd@ite.com.tw>
Cc: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>,
	Yaode Fang <Yaode.Fang@ite.com.tw>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: ucsi: itepd: Add DisplayPort
 alternate mode support
Message-ID: <arJgdmA9cWLMQpzV@black.igk.intel.com>
References: <20260918-ucsi-itepd-it527x-v2-0-7b2d9437cc72@ite.com.tw>
 <20260918-ucsi-itepd-it527x-v2-2-7b2d9437cc72@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-ucsi-itepd-it527x-v2-2-7b2d9437cc72@ite.com.tw>

On Fri, Sep 18, 2026 at 06:03:44PM +0800, Amber Kao wrote:
> Add support for DisplayPort alternate mode. The driver retrieves
> the current alternate mode from the PPM, configures the Type-C mux
> and retimer accordingly, and reports HPD state and HPD IRQ events
> through the DRM auxiliary HPD bridge.
> 
> Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
> ---
>  drivers/usb/typec/ucsi/Kconfig      |   8 +-
>  drivers/usb/typec/ucsi/ucsi_itepd.c | 404 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 400 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> index 0f10dac9b34b..c5eaf4967e4e 100644
> --- a/drivers/usb/typec/ucsi/Kconfig
> +++ b/drivers/usb/typec/ucsi/Kconfig
> @@ -105,11 +105,15 @@ config UCSI_HUAWEI_GAOKUN
>  	  called ucsi_huawei_gaokun.
>  
>  config UCSI_ITEPD
> -	tristate "UCSI Interface Driver for ITE IT8851/IT8853"
> +	tristate "UCSI Interface Driver for ITE IT885x and IT527x series"
>  	depends on I2C
> +	depends on DRM || !DRM
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
>  	help
>  	  This driver enables UCSI support on platforms that expose an
> -	  ITE IT8851/IT8853 Type-C Power Delivery controller over an I2C interface.
> +	  ITE IT885x or IT527x series Type-C Power Delivery controller
> +	  over an I2C interface. It also supports DisplayPort alternate
> +	  mode, including HPD notification through the DRM bridge.

Please split this part into separate patch.

Thanks,

-- 
heikki
