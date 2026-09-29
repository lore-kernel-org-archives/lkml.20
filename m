Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AB43ED5B6;
	Tue, 29 Sep 2026 12:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683204; cv=none; b=WgUL/laMSVOaeihTseMXDVgj4z+Q+QHSu6MWm2VOogNCVWmjVyWmy5Aq1iPbOEVNCtwMAwV0+jHjc4stN5zqfwwbX61UUHvEPqP9MkmUQZ304Omp/bgjB0qNzHKuB3j9XIcRnwKTDuPO7MRFbKc9en091+PfkgB1zx6UlPqlX0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683204; c=relaxed/simple;
	bh=oE2nDJoYPaF3EIF/jrJhJjHeCJ61YnNCdjyPE7i14Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYinTQuZWJ47RM/R/9SlEQE8U/i1/gZdKHVie3fx3296/rmEJPxzkkRkfPULgcz+JILEJKOppNHl8tbO7rPxNHWrdVmdK3taqpqAUeh4VFMYCIZR34/iNLB0Qnpzh9pKOl6eckzwXpuXChvmBaB+hhdycplePKrXo1yXOPIcDkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXm5nwq5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXm5nwq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790683202; x=1822219202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oE2nDJoYPaF3EIF/jrJhJjHeCJ61YnNCdjyPE7i14Es=;
  b=AXm5nwq5NhDnE/1v7M33kS+xVbqJO1WxMgS3E1clXVs5+xt3mZSr0MWm
   nxv6isI88ZwWAEzEiXjvb3wZDR+UHXnmdt1yuTPLpmFvnlDRjGUJRIu1X
   H37faqYEv30SY3JU3fvPtfcAfRXw6nHSCQQ2MrQsdCFfmS0tWNGT2mBp6
   zX2JmJLwMjeCJ/aL/9ue4RVhKNAlxfOHV7TUw1EqTAHEAcg4q9xNScAan
   Fqrx2UbXgIFLknlhaQiCiLiztu0qU7SABfGTLNlJ5XiotipT0Dg8WVWT4
   0Ynh9jo0zl6wOc7qH7ZB4TItMic8z6UWIdgLsziWQcSVAqVsIxEXFGohB
   A==;
X-CSE-ConnectionGUID: 9UicNoSoTVeHZonsrQRgIQ==
X-CSE-MsgGUID: bTkXa3JnRQiRjz+HicKA+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90351395"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90351395"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 05:00:01 -0700
X-CSE-ConnectionGUID: ZwNi5KCDQ2+pD5ZB1WFTIA==
X-CSE-MsgGUID: WvwUBb0hRRe69whW8H9a3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="303314509"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.223])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 04:59:58 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5F4AB121840;
	Tue, 29 Sep 2026 15:00:02 +0300 (EEST)
Date: Tue, 29 Sep 2026 15:00:02 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: David Carlier <devnexen@gmail.com>
Cc: linux-media@vger.kernel.org,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: ipu6: Fix ipu7 firmware context leak on
 stream start
Message-ID: <aruoQnh5HUeUenIk@kekkonen.localdomain>
References: <20260927201631.153126-1-devnexen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927201631.153126-1-devnexen@gmail.com>

Hi David,

Thank you for the set.

On Sun, Sep 27, 2026 at 09:16:30PM +0100, David Carlier wrote:
> ipu7_fw_isys_init() runs on every first stream start, but allocates the
> firmware context and queue configs with devm and never frees them, so
> each STREAMON/STREAMOFF cycle leaks them. Use kzalloc and free them in
> ipu7_fw_isys_cleanup().
> 
> Fixes: 9ab793dbc176 ("media: ipu6: Add ipu7 fw isys ops")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> index aee9227fd66c..19e063b22a15 100644
> --- a/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu7-fw-isys.c
> @@ -34,6 +34,8 @@ static void ipu7_fw_isys_cleanup(struct ipu6_isys *isys)
>  	}
>  
>  	isys->fwctx = NULL;
> +	kfree(fwctx->queue_configs);
> +	kfree(fwctx);
>  }
>  
>  static int ipu7_fw_isys_open(struct ipu6_isys *isys)
> @@ -67,8 +69,7 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
>  	int ret;
>  
>  	/* Allocate and init firmware context. */
> -	fwctx = devm_kzalloc(dev, sizeof(struct ipu7_fw_com_context),
> -			     GFP_KERNEL);
> +	fwctx = kzalloc_obj(*fwctx);
>  	if (!fwctx)
>  		return -ENOMEM;
>  
> @@ -76,10 +77,9 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
>  	fwctx->num_output_queues = IPU7_INSYS_MAX_OUTPUT_QUEUES;
>  	num_queues = fwctx->num_input_queues + fwctx->num_output_queues;
>  
> -	queue_configs = devm_kcalloc(dev, num_queues, sizeof(*queue_configs),
> -				     GFP_KERNEL);
> +	queue_configs = kzalloc_objs(*queue_configs, num_queues);
>  	if (!queue_configs) {
> -		ipu7_fw_isys_cleanup(isys);
> +		kfree(fwctx);
>  		return -ENOMEM;
>  	}
>  	fwctx->fw_entry = adev->fw_entry;
> @@ -111,7 +111,8 @@ static int ipu7_fw_isys_init(struct ipu6_isys *isys, unsigned int num_streams)
>  				   &fw_config_dma_addr, GFP_KERNEL, 0);
>  	if (!fw_config) {
>  		dev_err(dev, "Failed to allocate isys subsys config.\n");
> -		ipu7_fw_isys_cleanup(isys);
> +		kfree(queue_configs);
> +		kfree(fwctx);

Instead of releasing the memory here, could you add a few labels for error
handling?

Doesn't ipu6_isys_fwcom_cfg_init() suffer from the same?

I think it could also make sense to keep these allocations around until the
device is unbound, but it's best to fix the issues first in any case.

>  		return -ENOMEM;
>  	}
>  	fwctx->fw_config = fw_config;

-- 
Regards,

Sakari Ailus
