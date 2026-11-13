Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571530;
	b=ptNhdyZUbscTzYjAhJ66y10slF80wxx/0WLXAlrUEwCOPyodKjQHLkIuEFlJOX71dst6
	 A42Txoqr4IHWnNdUlJlNuhaqlWWW6evR7RLAt9ooXEEsB3doE0K+bVSYD3BmH9xjnMV9Q
	 Qv5ixjg6rYftsc/SMW7NIwg+qi2H/K6Awi7Ck1V4/x7VTTQmTYC9ujPA6hqE76dPsIlTl
	 4uBIkW7vocnN2H4+u0nuVgVa3/9ifOMM/6fC6oClJ5sb8JPi9GTSXZVC1wKR3Bb5Eyir2
	 LrV950eiomTBrNeZzFgBlE1YgmCwnmaw4boJerf8rFs15s+arYaJeZcK+pXUl0s6SMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571530;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=JCyADuE7MAyHJhJI3+8pvWzlvXz5TnZK+HIgXhrnClU=;
	b=R7tACoZ1rqjs58cfPidpf38S9t9QhiP9obSVQoUIj1NMHKFL3mS72LXblBnViv1FNISz
	 xupYeVbQ3/yzoxmOOclxidBECuG/fs+c2qllJaHslpHtBWBhSOCwvzsDTB0MXFapAkPrA
	 TqzC1MPWBQf9vRbSLaGF9145FZFYFZrTa/rn7u9Z6UJqH058orzAoX0K/QqVYKyrkfA1v
	 ou4uTFB3JOlOG+3iu0CZz2Ongd+Id+h9I4b+X1thR/KDW/iKK4y5E+Sdly8qB81cd2FDG
	 2TnWHJ233Hsl/5lI57+akXfpu/3sPd0tujMNP5MQtXpIeUSXHpSfTwcvxCr5q1Fhc3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PQ+E46Xc;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FE1606A8F9;
	Fri, 13 Nov 2026 12:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75FE1606A8F9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PQ+E46Xc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794571531; x=1826107531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=stDOacIHpZsQKcozLdna80o9rydyKM8XxSmzyeGn9PU=;
  b=PQ+E46XcMan/e8voQGQPKry7UpWKlBzhIc/JV5+ziGqmEUluYVAma8Dc
   vBz3GS0LzzNBx8KIbEokcS2YmSfNWcQCqqxIl8odKvBB20xVOtTtXsXmW
   hZOf0Jvj+/xp01xSm12To0e8UYWuiCIald7z4Usevhxeytx+WUjvnsQr3
   uTTctwlVuzTeYD6E8qn7vHQsiVHDYUhTngLQaZwindwomgV2I5Z3SePFD
   d5+W9Bz5469Z0WdYm47vIZlqHtbvm1tFX3oaQ56Q2gwn3WIwSOlywdxhH
   AY0yMxGpMSo/anV1yQDKVHkJ6XgcNs+mHpjSgED+3cU4DH4/elZrnaYUI
   g==;
X-CSE-ConnectionGUID: GHaD37YyQbmo7906bwqjFg==
X-CSE-MsgGUID: AP8KsE/SRR+tbtlGIY4QLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3264210"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3264210"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 04:05:30 -0800
X-CSE-ConnectionGUID: dGo70yMbQiOj77x0eMxSJA==
X-CSE-MsgGUID: 8cEgRXuDQIm1sQfBQO+jgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9067875"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 13 Nov 2026 04:05:28 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 1A93299; Fri, 13 Nov 2026 13:05:27 +0100 (CET)
Date: Fri, 13 Nov 2026 13:05:27 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: qcom: Release connector fwnode after
 regulator lookup
Message-ID: <avb9Bwr_VSkB56rP@black.igk.intel.com>
References: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>
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
In-Reply-To: <20261112021836.1851-1-laixiangwu@cmss.chinamobile.com>

On Thu, Nov 12, 2026 at 10:18:36AM +0800, Xiangwu Lai wrote:
> pmic_typec_port_probe() looks up the "connector" child node with
> device_get_named_child_node(), which takes a reference on the
> returned fwnode.  The node is only used for the VBUS regulator lookup
> from the connector node and the reference is never dropped, so every
> probe leaks one fwnode reference.
> 
> Release the reference right after the regulator lookup, mirroring
> the parent driver which already manages its own reference on the
> same node.
> 
> Fixes: 506927b6bf29 ("usb: typec: tcpm: qcom: prefer VBUS supply from the connector node")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index d3523435f..084e8e9a8 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -733,6 +733,8 @@ int qcom_pmic_typec_port_probe(struct platform_device *pdev,
>  	pmic_typec_port->vdd_vbus = devm_of_regulator_get_optional(dev,
>  								   to_of_node(connector),
>  								   "vbus");
> +	fwnode_handle_put(connector);
> +
>  	if (pmic_typec_port->vdd_vbus == ERR_PTR(-ENODEV))
>  		pmic_typec_port->vdd_vbus = devm_regulator_get(dev, "vdd-vbus");
>  	if (IS_ERR(pmic_typec_port->vdd_vbus))
> -- 
> 2.50.1.windows.1
> 
> 

-- 
heikki
