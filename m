Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E803E0C66;
	Mon, 31 Aug 2026 10:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171108; cv=none; b=DsxOzvK0AijRUGolpaqiNbg8svCG60+eqVmNkUZix5as1vS46Jf7saP6cJG+1yjSUbb6Q6ZhpViXimeYLF2f8Rno/CSCYjbf5Fla8bNWxKt1vmZRwgdmprjs0Q9Lt/rinxFMCQD+TaO/N6hYucC0RbWp80Bc0KQwnyKgUd8fhQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171108; c=relaxed/simple;
	bh=R6i1b3kmagfcuP2WEJQ9jGBoNwBsUHK51DBR877oN9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvJ/tE9NY6osvKXdQ7BmDkzHJYQ8zxwvDbZimdRkQQlOLpOMtfucEmu1+aHosNRMmuxRn/DZA9WD0JOQC454JA/tHviE9wwwjTKR9LEoLHwG27exOmse3EhrFml38j5SHFHNj9CHswM63LvLozEe5WD4+Y4RCIaQon0zOGyHV/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyLUO7ci; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyLUO7ci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788171106; x=1819707106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=R6i1b3kmagfcuP2WEJQ9jGBoNwBsUHK51DBR877oN9I=;
  b=QyLUO7ci53ttsXjjamYy60mAljTVLLtqJdHd90bPY1S9vqezPFl0LsU+
   PptC7u1vudUqwbMlEG1mJ6e5f/5WST0IKkeHLLq5dk/5x1rgNGhH6dPmS
   CZMAtcfyCns825z1Eps5Gpfeg7hL+2vjRfMBMRqZ54IfNpTlf+mc4sngf
   kSRQsPIfdVTryvETJljd/y/mR3UM25bt7p7al/E6efD9J8CpZ+wB4+YpB
   DFoz5BEDCR1i2eyTflh6ZB7S4nGoty0d6V/vic2UvO07godUisy0dEJO8
   pAA5Vk5cO6DY+jlESWdw+hURJjQgeWkMr91XgSZAM7oEJkcq/mUJRmh+w
   A==;
X-CSE-ConnectionGUID: FPg7hfwKTay71Ver5SyCNw==
X-CSE-MsgGUID: oFyPD7bTRIa1DkHzlmif6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92385744"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="92385744"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:11:45 -0700
X-CSE-ConnectionGUID: NQiBLmBJR0SITzkx3RqqNA==
X-CSE-MsgGUID: HsdZcrEOSFuKRd3NEqvn+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265515034"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 03:11:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 456E499; Mon, 31 Aug 2026 12:11:42 +0200 (CEST)
Date: Mon, 31 Aug 2026 12:11:42 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Marek Vasut <marex@nabladev.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 2/2] usb: typec: mux: gpio-sbu: enable when only used
 for orientation
Message-ID: <apVTXnBDf20PcLgo@black.igk.intel.com>
References: <20260826-usb-fusb340-v1-v3-0-11927682504d@foss.st.com>
 <20260826-usb-fusb340-v1-v3-2-11927682504d@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-usb-fusb340-v1-v3-2-11927682504d@foss.st.com>

On Wed, Aug 26, 2026 at 02:16:36PM +0200, Fabrice Gasnier wrote:
> When used as orientation-switch only (no mode-switch, e.g. no altmode),
> the optional enable gpio remains disabled.
> Enable it from the switch_set() routine, in this case, when the
> orientation is set and the enable-gpios property has been provided.
> Move enable GPIO configuration after the swapped configuration has
> been done, to avoid possible glitches in case both signals are changed.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v3
> - Fix missed v2 update on probing mode-switch property.
> Changes in v2
> - fix issues reported by Sashiko: probe mode-switch property before
>   registering Type-C switch, to avoid possible race. Configure enable
>   GPIO after swapp GPIO has been configured, in case both transition.
> ---
>  drivers/usb/typec/mux/gpio-sbu-mux.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
> index 1834f1a2dd9d..b1aa976aca24 100644
> --- a/drivers/usb/typec/mux/gpio-sbu-mux.c
> +++ b/drivers/usb/typec/mux/gpio-sbu-mux.c
> @@ -17,6 +17,7 @@ struct gpio_sbu_mux {
>  
>  	struct typec_switch_dev *sw;
>  	struct typec_mux_dev *mux;
> +	bool mode_switch;
>  
>  	struct mutex lock; /* protect enabled and swapped */
>  	bool enabled;
> @@ -40,19 +41,24 @@ static int gpio_sbu_switch_set(struct typec_switch_dev *sw,
>  		enabled = false;
>  		break;
>  	case TYPEC_ORIENTATION_NORMAL:
> +		if (!sbu_mux->mode_switch)
> +			enabled = true;
>  		swapped = false;
>  		break;
>  	case TYPEC_ORIENTATION_REVERSE:
> +		if (!sbu_mux->mode_switch)
> +			enabled = true;
>  		swapped = true;
>  		break;
>  	}
>  
> -	if (enabled != sbu_mux->enabled)
> -		gpiod_set_value_cansleep(sbu_mux->enable_gpio, enabled);
> -
>  	if (swapped != sbu_mux->swapped)
>  		gpiod_set_value_cansleep(sbu_mux->select_gpio, swapped);
>  
> +	/* If both enabled and swapped transition, set enable GPIO after to avoid glitches */
> +	if (enabled != sbu_mux->enabled)
> +		gpiod_set_value_cansleep(sbu_mux->enable_gpio, enabled);
> +
>  	sbu_mux->enabled = enabled;
>  	sbu_mux->swapped = swapped;
>  
> @@ -120,6 +126,7 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
>  	sw_desc.fwnode = dev_fwnode(dev);
>  	sw_desc.set = gpio_sbu_switch_set;
>  
> +	sbu_mux->mode_switch = device_property_read_bool(dev, "mode-switch");
>  	sbu_mux->sw = typec_switch_register(dev, &sw_desc);
>  	if (IS_ERR(sbu_mux->sw))
>  		return dev_err_probe(dev, PTR_ERR(sbu_mux->sw),
> 
> -- 
> 2.43.0

-- 
heikki
