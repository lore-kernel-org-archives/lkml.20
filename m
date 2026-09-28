Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF5336B91C;
	Mon, 28 Sep 2026 08:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585978; cv=none; b=HfRdjvuieEls/KIFwVZkOdBkQm9BbwNQC8fJ5oYL5k8I0VGqa6NHbq1TYgItQFWQAxFZCrPBYgEOpvk1EMK6egrqHwiw8LRI5HvV3WdAH6hqQ3AXD0T8cgwzP0hPh/WoLp4bp+e5lH9H6CM7zKT4uGRxi2OAv0wiq8WstAbPguE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585978; c=relaxed/simple;
	bh=PLEGBtKzcmgBApbEY91eHyKAXFDhNXbJ0jMBrRglUA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9pxmBvZ1CDH2FGds+k7SvzjrDrLU4rwzZDrp03lRIqkGkrqYP2jrPorJRwLs7Vvu1jTjxlYqAnlECUcbrv5i67guBCNok3nXtq3IP8TVgFbx2mbCIxe0keZ+5EETgr1z8zX+1XlnfXQXVkGgeVhdmYA3JgtET0L2UqegGjmeyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JB5c5h41; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JB5c5h41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790585977; x=1822121977;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PLEGBtKzcmgBApbEY91eHyKAXFDhNXbJ0jMBrRglUA0=;
  b=JB5c5h41kRM0WFqwu/1qnCE0GQTZK2L/p2knULackv+yA3v4lFnGCHkk
   /5J95o3FTkXUyAQ85p7FP99HBK/a2Go344hE6uRaRQGC7WjBa8UYS0pD8
   dqLpum8L4ZJiH9Y9FT6gL/LhGDrsalfpq+hMUYIytpx/qtbb7+rlw8EJi
   LK52/kyo9CjrBkW3Efx2kyhFONMGSNghe/GzBkVrmmTbGRw99XTONfV+f
   fW/jhu7qcyhTsBRdoGjTXz3zTvgn/Ju4CJHBN8bsTKZEFXkCIYiGBqxlR
   FlTv47TVVU74jhuldVsMko84+dEA+rheUkHrv0mppDY2Fra+cBtovB9kp
   g==;
X-CSE-ConnectionGUID: Cy1MHKHaRQCL+Z9jCS7dPQ==
X-CSE-MsgGUID: ZoimNwGRREGnEAjOqayN8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90322418"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90322418"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 01:59:37 -0700
X-CSE-ConnectionGUID: PRVHibLnRfK9oFEvRtuuMw==
X-CSE-MsgGUID: CnxizhdoSza8QKl8n0S4MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="272791669"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.42])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 01:59:34 -0700
Date: Mon, 28 Sep 2026 11:59:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: shengjiu.wang@gmail.com, xiubo.lee@gmail.com, lgirdwood@gmail.com,
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	festevam@gmail.com, nicoleotsuka@gmail.com, error27@gmail.com,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: fsl_asrc: fix second front-end channel check
Message-ID: <aroscgugYoeB-HKM@ashevche-desk.local>
References: <20260927000738.10105-1-bolin.liu@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927000738.10105-1-bolin.liu@seu.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Sep 27, 2026 at 08:07:38AM +0800, Slavin Liu wrote:
> Commit b045248399d0 ("ASoC: fsl_asrc: Replace dma_request_slave_channel()
> by dma_request_chan()") made ->get_dma_channel() propagate error
> pointers, so the !NULL check added by commit b4136c0d69ea ("ASoC:
> fsl_asrc: check the second front-end DMA channel") no longer catches
> failures and the error pointer would be dereferenced at
> tmp_chan->private.
> 
> Use IS_ERR() and propagate the error, keeping the release of the
> previously acquired persistent Front-End channel.

...

>  		/* Get DMA request of Front-End */
>  		tmp_chan = asrc->get_dma_channel(pair, dir);
> -		if (!tmp_chan) {
> +		if (IS_ERR(tmp_chan)) {
>  			dma_release_channel(pair->dma_chan[!dir]);

>  			pair->dma_chan[!dir] = NULL;

> -			return -EINVAL;
> +			return PTR_ERR(tmp_chan);

I believe this has to be left untouched as it might leak to user space.

>  		}

...

I also wondering why Sashiko hasn't pointed that out during the original
submission...

-- 
With Best Regards,
Andy Shevchenko


