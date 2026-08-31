Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5E83E1D1A;
	Mon, 31 Aug 2026 10:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170883; cv=none; b=mRp9ptuZAiuTD9UhE18C8SqjHjcZ+mUmVEhFs/89TSaSI1BgIHS5cA+jEXQLFJsFQl2wcam0AAdjyXrO4sF7V0PYlZmced/77hpLcVvGxdOvyh7JTz7d77+NLKPzHiA4GXboSWnq8IQzXJ2+xgOJd2Nub+nV4ajnBkBl30DjPa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170883; c=relaxed/simple;
	bh=gdC8+zZj8xqksi8xV2M9KEoqdzn/PVKaelTTjmIIjbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VxVpBWM8G9GAHOMoX4ttGyX/8xBtoQoB3JBXKWsVzDZsmHaOSCdME5BAQnRqWKPoZLOOXuRGZEn7dnHgNCgoYM8gML96Mh/LgN5zu5sWaNP0I7PgvwuIuQsw0GX6a5f7cGkSOrecTRdDZHo7sV5Sos0qaWnEvXlX3ps8xkMs9kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maRehGDK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maRehGDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788170882; x=1819706882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gdC8+zZj8xqksi8xV2M9KEoqdzn/PVKaelTTjmIIjbc=;
  b=maRehGDKYhzXK/p1quUTRi8aRF5s26ZQmUyAYUGeddlujzuyjZP/KMtZ
   KUo6U2EwfjrUTM35InI9rDSCfY7uKRg4I12R4UFH4Q/tnfDHEOhdbtPmo
   MpCel6tGo1x+InLnMcQH0T1qiMUPFopy+6Hb0n7Wv5K0efAnF1Yf9BfD4
   6fVcAKFNmEjRqN9rEQDP5jw0RdRiIcfyQ+jh+5/tHMYkWgBKbO78CbmFA
   pkoITSL1nnOtU8jFAdM2dcZBaDbKyMMY4llJJqBiiBQ1Oehh6Xa5NqY5E
   1P/dW3ykIjGxkQhOTzsHYnTTlgutwN/MWHC2hvTHmyeni/TWPoesufMGV
   A==;
X-CSE-ConnectionGUID: UefWSWEXSveFF/IYnK3wPQ==
X-CSE-MsgGUID: OnSwjWwqSU60qaX7f5yzyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92385487"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="92385487"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:08:01 -0700
X-CSE-ConnectionGUID: jm0IokuQR32G/UH55DpHHA==
X-CSE-MsgGUID: 72RwjEvERj+fA3hoAivfNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265513815"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 31 Aug 2026 03:07:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id BC48C99; Mon, 31 Aug 2026 12:07:57 +0200 (CEST)
Date: Mon, 31 Aug 2026 12:07:57 +0200
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
Subject: Re: [PATCH 2/2] usb: typec: mux: gpio-sbu: enable when only used for
 orientation
Message-ID: <apVSfbfIDbkx3eCT@black.igk.intel.com>
References: <20260825-usb-fusb340-v1-v1-0-2191179b0661@foss.st.com>
 <20260825-usb-fusb340-v1-v1-2-2191179b0661@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-usb-fusb340-v1-v1-2-2191179b0661@foss.st.com>

On Tue, Aug 25, 2026 at 02:54:24PM +0200, Fabrice Gasnier wrote:
> When used as orientation-switch only (no mode-switch, e.g. no altmode),
> the optional enable gpio remains disabled.
> Enable it from the switch_set() routine, in this case, when the
> orientation is set and the enable-gpios property has been provided.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/gpio-sbu-mux.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux/gpio-sbu-mux.c
> index 1834f1a2dd9d..4151d78e3b8d 100644
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
> @@ -40,9 +41,13 @@ static int gpio_sbu_switch_set(struct typec_switch_dev *sw,
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
> @@ -125,6 +130,8 @@ static int gpio_sbu_mux_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, PTR_ERR(sbu_mux->sw),
>  				     "failed to register typec switch\n");
>  
> +	sbu_mux->mode_switch = device_property_read_bool(dev, "mode-switch");
> +
>  	mux_desc.drvdata = sbu_mux;
>  	mux_desc.fwnode = dev_fwnode(dev);
>  	mux_desc.set = gpio_sbu_mux_set;
> 
> -- 
> 2.43.0

-- 
heikki
