Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9954D178D;
	Mon, 28 Sep 2026 13:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603337; cv=none; b=Tq1yp0XGZwK1eaCRzcN6PWjfbwzyzaXuuR/n62Dm6wl1RPJv2t7cb2srw5GMb2dKl14qyyrsG4ovzke1ZbigVju2xS99d8x1y4faDqZxXZXbKPm9c4yyo1JaE9quHxSb54b4Bgob+gQzg3b6QurIca+xB2bLnuYiW/GEsNlOBvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603337; c=relaxed/simple;
	bh=My8qhm/R/I48nMduRq6Y3Wb0wDF0efpQI6u7GWjSksQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f87MKfJQL18zUnaHU3U+WJNf8vjGLwSjKqJ5ZlTohR6bF8Wc5iEaphu+/E2quxodjyf2ADteO3ondk8JGD2dXzZTkAAO4jBIh7n7UwnQ09q8qHql5UY5Sf1LdBFhURF6P/jEGNR60lwn5EyUaI8epgouyTxdVzEhVvvbjQ1htks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMmPCd9o; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMmPCd9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790603335; x=1822139335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=My8qhm/R/I48nMduRq6Y3Wb0wDF0efpQI6u7GWjSksQ=;
  b=FMmPCd9owmfBc+s7HMPf6h3BQAcM13jiwySDOFjclgxchrmKvkpTDSVf
   0aqRaIQQggekf4mVADyrFREvJ4aKc3VBS7O65Zh9kil0yunSiPXEvZcT/
   30yfSj7agYA+1LhD2Y2G/d9gu0bvOyrWqFStv29yTMV/kseiElSLwgoxz
   PGqE0Y0eEr/cHvV4DwZKLGBrbiU384o8BL/TjYV4n3Xjj+LIxYk0IAB11
   n8O6bNT1+zDiD7VJRASVIMacWcU/wrcaC0b+kXXXOEQr5NWAqe49BtWzs
   D5BFaZN48O2MLSimV3YyT/dyVcgw6C4fBJkJhur90zdHY4nrB96FphPUM
   A==;
X-CSE-ConnectionGUID: Zr2KtBIFQ2ax+3JDsBcwHA==
X-CSE-MsgGUID: XYLupU8bTWGX2CJG0kffbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101470488"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="101470488"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 06:48:54 -0700
X-CSE-ConnectionGUID: OVMnR9oLSDmhCKU2ZPh1Vw==
X-CSE-MsgGUID: g55aoMfMT/qL24203sLozw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="278870188"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 28 Sep 2026 06:48:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9827699; Mon, 28 Sep 2026 15:48:49 +0200 (CEST)
Date: Mon, 28 Sep 2026 15:48:49 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: david@ixit.cz
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH RFC 01/12] usb: typec: tcpm: qcom: Release the connector
 fwnode reference
Message-ID: <arpwQaOfCXHrp4m3@black.igk.intel.com>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-1-31adc19f32c6@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926-typec-v1-1-31adc19f32c6@ixit.cz>

Hi David,

On Sat, Sep 26, 2026 at 02:40:20PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> device_get_named_child_node() returns the connector node with its
> reference count incremented, but the port probe never drops it. The node
> is only needed for the VBUS regulator lookup, so release it right after.
> 
> Assisted-by: LLM
> Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the connector node")
> Signed-off-by: David Heidelberg <david@ixit.cz>

I think this should be send separately. Cc stable?

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Thanks,

> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index bf985efe1cd6b..f8308d66b9d67 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -5,16 +5,17 @@
>  
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
>  #include <linux/usb/tcpm.h>
>  #include <linux/usb/typec_mux.h>
>  #include <linux/workqueue.h>
>  
> @@ -723,16 +724,17 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  
>  	connector = device_get_named_child_node(dev, "connector");
>  	if (!connector)
>  		return -EINVAL;
>  
>  	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
>  								   to_of_node(connector),
>  								   "vbus");
> +	fwnode_handle_put(connector);
>  	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
>  		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
>  	if (IS_ERR(pmic_typec_port->vdd_vbus))
>  		return PTR_ERR(pmic_typec_port->vdd_vbus);
>  
>  	pmic_typec_port->dev = dev;
>  	pmic_typec_port->base = base;
>  	pmic_typec_port->regmap = regmap;
> 
> -- 
> 2.55.0
> 

-- 
heikki
