Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B190C3644A4;
	Thu, 27 Aug 2026 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787831955; cv=none; b=NXRmSDGfjtQyWfQDnIdDp93VKbYs5DLM6sew3dkimkE/2hYAdUw73r0/QvL3GL/9cKJ8hS84MJuq7ENPKKZ1UrkfN1/cUlwgIe0k/+axfy47V+jTQoSiVyjnaFaB6p/3u+uUH2oK3aZW+uXMCoozA4D6knal+w3+BjNSjutduFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787831955; c=relaxed/simple;
	bh=gl7Ypggdt6+OInYK5seGvYHZ3ns4wQAaeLb/KQCSOfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pk8OETrGbV6KdnTBWiI/SWcviIrUh6F9Cqc2NFgTPjLV/L1brK9lDR8VERenNc9lNeE9iK27GF6H4+DOyxEjuuJXkrOFgdAgL4ih1vnUJw3UkaVessM0ZSwnEvh6I8v+2BCeP5FewfKKn7pr+GGNG7xx5nYRHEr/dWB9psNlxDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMCare4E; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMCare4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787831954; x=1819367954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gl7Ypggdt6+OInYK5seGvYHZ3ns4wQAaeLb/KQCSOfw=;
  b=mMCare4E9c8zGSJW0bzv6f3tESo0YDlEOgs+PpKt9Vg7PXK6xLIgePMg
   CB3UQNFnPM+J1FrhqFxEA6ekTSlsd+D657J+2YsxbPdDDWZ0w2jVK9Ksd
   wM+2R+2cLC7gmVwPUiJKvFdE4M/htAQTf904ix/rLBBDoWrU3m1ZSJagI
   uqMPIZYAhK7mH1qEAWvE+KLZ/hhud43EpwaEGaY7eqHvgktpUIEVKyH8C
   EUxyACMOEF6bEMH+rs35LEKz2PFEuEcwCz477vRDLS7jt8xqmerwlifSm
   VrqjM0AVDWh0y01jE3BttcPFKfl/x8CWT8PE0o3hph48RSgph95j4CcWA
   A==;
X-CSE-ConnectionGUID: ufvTOtf9RCmNxgJxhrDbVw==
X-CSE-MsgGUID: KO58nqLlRYOR19eg5CeztQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105704515"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="105704515"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 04:59:14 -0700
X-CSE-ConnectionGUID: T5mZF9iCT9KzrcrE8fY1yQ==
X-CSE-MsgGUID: eAYSQsFJQgm/QV5Io8v0Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271652792"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.174])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 04:59:10 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F28C7120DF1;
	Thu, 27 Aug 2026 14:59:06 +0300 (EEST)
Date: Thu, 27 Aug 2026 14:59:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] media: ov8858: support 19.2 MHz clock and CHT gain
 setup
Message-ID: <apAmisduSqFoTrpG@kekkonen.localdomain>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260826132256.3343451-2-mauriziocasciano7@gmail.com>
 <apAGGD27ZUFHQ6Aa@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apAGGD27ZUFHQ6Aa@ashevche-desk.local>

On Thu, Aug 27, 2026 at 12:40:40PM +0300, Andy Shevchenko wrote:
> > static int ov8858_init_ctrls(struct ov8858 *ov8858)
> 
> >  	struct v4l2_ctrl_handler *handler = &ov8858->ctrl_handler;
> >  	const struct ov8858_mode *mode = &ov8858_modes[0];
> >  	struct v4l2_fwnode_device_properties props;
> > +	u32 digital_gain_default = OV8858_LONG_DIGIGAIN_DEFAULT;
> > +	u32 digital_gain_max = OV8858_LONG_DIGIGAIN_MAX;
> > +	u32 digital_gain_min = OV8858_LONG_DIGIGAIN_MIN;
> >  	s64 exposure_max, vblank_def;
> >  	unsigned int pixel_rate;
> >  	struct v4l2_ctrl *ctrl;
> 
> >  			  OV8858_LONG_GAIN_MIN, OV8858_LONG_GAIN_MAX,
> >  			  OV8858_LONG_GAIN_STEP, OV8858_LONG_GAIN_DEFAULT);
> >  
> > +	if (ov8858->xvclk_rate == OV8858_XVCLK_FREQ_19_2MHZ) {
> > +		digital_gain_min = OV8858_MWB_GAIN_MIN;
> > +		digital_gain_max = OV8858_MWB_GAIN_MAX;
> > +		digital_gain_default = OV8858_MWB_GAIN_DEFAULT;
> > +	}
> 
> Instead, use 'else' branch so all assignments are close to each other.
> Also possible to avoid adding local variables.

Or better yet, put them into an array and pick and index based on the
frequency of the clock.

-- 
Sakari Ailus
