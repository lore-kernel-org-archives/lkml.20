Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403277;
	b=06Nsd0u/kWQ5nmZUJ4zDWmcxIUHFHe7xDCaergibunRhon6Md8MSdQRkcFqnATW6Xsk3
	 qag6A7jkN2ZQbsgawv3JG68FZv0aPoqnT7PuJlubdU7uw8ncercyHsW/no9fJGrNHf0Ve
	 SLhOV7yqPo/+nlDjEhx7KSLm59s2S4AaF00OsWqcsTJzV0cPFHj7/ekBeqwYOfKFBWkcz
	 d5ryH5a2RY6HWXT8YnP2k4yaZXJWnVM3FHmliItUVQdnjY77+dHIoSlMuOUyheko3RwMc
	 uAX5FWa+4KjjU2L1JGObp9JuWEiYYoQU5HlVHExZ8fPqjBXcWhwjequ7VpfPUa0ICzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403277;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=faR+AM5LoZfmSFnZk94Dt55jVgN8hAhB0JG7Du2sxQE=;
	b=kG0xIglj3aTXIEfLtew7TizoFjO/EorVxjg6US31WpATLPqa02wRAnMbeKWIDvy9fMHg
	 ME02T4fzn/0GLaOGuzFs+gMeC/jRFfoVUKPiJ2hFscdNItInvSG2XvHkuBAUzHDoyPGPe
	 ZNrzB1kR798KcKiWVWJM/bTMdVnrZA0wao7vkxuHPV2SHz71/1kKq9ThifWIPWijjsdOn
	 wNBOh25NjUlMoAv7TsnMYYonpxCzXeZQb9iprgafyPUwDWJh0IcOWVBZQB59rkwx+l+UH
	 VF7C7ZsVM0MUxPaWYpWq8ghlypZmOLSvVjQ5ZFDBld5kPKGphUoBtNxu2sOnTxd5VAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mtIV5JRr;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E819606A31C;
	Wed, 11 Nov 2026 13:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E819606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mtIV5JRr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794403276; x=1825939276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fmnuHV7s3V8QFgBzuq9PWMbEezm4U+6aBthUv9THvgc=;
  b=mtIV5JRrta7BBkCn3q06OiEr66Sgzliixvc+qKB5F4znjNJLaMX/NciX
   /zyYZK0wl0PwFRxa7qqHvLl5zDXlMEN+YPK3yyPg6lWzW+dJgboYPcBZ0
   Ky45Rzli8VlRo/Y4vaC7KCjFZL05jBKM9Z8EVwBSawo9F+iNs3t8akpJ1
   Ax0PAV4f8suK2esg84OCC9ACU31SS1SN5nSMdZb0GX+HLkO9JjOD25pP1
   LR4KamVcmbVsMQ172/q3QNXyS9Xi1b95/K+7koVco6pjETVIfDwyXRgRo
   O4X4qKUgJ3HoyMZz3x6QIyHvVVL/XMAeJrfgOPzDnaSCxc64Fj7nQp9ao
   g==;
X-CSE-ConnectionGUID: +jYHSFaCQq2YoknsqVfJCQ==
X-CSE-MsgGUID: ZeSPju5wQvCLlA5TxUQwMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3074693"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3074693"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 05:21:15 -0800
X-CSE-ConnectionGUID: OMc5+uTaR4GEC8NOBKFqZA==
X-CSE-MsgGUID: KllFoN/mQYG+vYTG7eULcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8493397"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 11 Nov 2026 05:21:13 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 85B2B99; Wed, 11 Nov 2026 14:21:12 +0100 (CET)
Date: Wed, 11 Nov 2026 14:21:12 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: westeri@kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Enable runtime PM for the Ice Lake router
 with the software CM
Message-ID: <20261111132112.GI259790@black.igk.intel.com>
References: <20261111130851.62101-1-dev@deq.rocks>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111130851.62101-1-dev@deq.rocks>

Hi,

On Wed, Nov 11, 2026 at 02:08:51PM +0100, Andre Eikmeyer wrote:
> The firmware connection manager reports RTD3 for the Ice Lake router.
> On Apple systems the software connection manager takes over and enables
> runtime PM only for USB4 routers, so the Ice Lake NHI stays in D0 for as
> long as the driver is bound and the package does not reach deep C-states.
> 
> Enable runtime PM for the Ice Lake router as well. The Ice Lake NHI
> already has runtime suspend and resume callbacks.
> 
> Tested on a MacBookAir9,1.

Cool, does it also wake up if you plug something to the TB ports?

> 
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  drivers/thunderbolt/tb.c |  5 +++--
>  drivers/thunderbolt/tb.h | 12 ++++++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 418ad0a61a..139ef49b49 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3044,8 +3044,9 @@ static int tb_start(struct tb *tb, bool reset)
>  	 * implement the necessary router operations.
>  	 */
>  	tb->root_switch->no_nvm_upgrade = !tb_switch_is_usb4(tb->root_switch);
> -	/* All USB4 routers support runtime PM */
> -	tb->root_switch->rpm = tb_switch_is_usb4(tb->root_switch);
> +	/* All USB4 routers support runtime PM. Ice Lake also supports RTD3 */
> +	tb->root_switch->rpm = tb_switch_is_usb4(tb->root_switch) ||
> +			       tb_switch_is_ice_lake(tb->root_switch);
>  
>  	ret = tb_switch_configure(tb->root_switch);
>  	if (ret) {
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index e86845762e..eff4a342d6 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1011,6 +1011,18 @@ static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
>  	return false;
>  }
>  
> +static inline bool tb_switch_is_ice_lake(const struct tb_switch *sw)
> +{
> +	if (sw->config.vendor_id == PCI_VENDOR_ID_INTEL) {
> +		switch (sw->config.device_id) {
> +		case PCI_DEVICE_ID_INTEL_ICL_NHI0:
> +		case PCI_DEVICE_ID_INTEL_ICL_NHI1:
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
>  /**
>   * tb_switch_is_icm() - Is the switch handled by ICM firmware
>   * @sw: Switch to check
> 
> base-commit: 13527afe5f15c60b82920fe9915f3cabf1315302
