Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F384DD6F5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164011; cv=none; b=hfw6wzxQTWhJG8bcFL/Yar5cAnv5SoV6x87Qeal9Ux0G9iCpP8YrIwuLwHYV2p/r1dzla2ggDMvIftjA7wZAZQ0e4+EU7nlZIIPo9zjP3y2+iWjSYxMFx3QiHIPvK1Uy2XYbYGDolc+rui+mT7gYVYEIAszr3hIp6uipOXTCQfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164011; c=relaxed/simple;
	bh=5+nNn0jefcVQxAVYD3jy1Si6PfI6dKYknyYWta2gJIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Peo+hmUAWFQJCaumLFxfGOmSzfIn+pB8A9lK8M5PmtZ+iO/fHKwP8KKB5luVnLr+gKrVX3x7q5hjfRnfIfgo7p8jG9xjMwIgNQzce5D0cf21HigyZPK3rXf4Lo07QxPwrQ19N6/Xa8AguOCDu+vGvY44S+hUpVHopRWM9XRGt60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kjFoP3zo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kjFoP3zo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792164010; x=1823700010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5+nNn0jefcVQxAVYD3jy1Si6PfI6dKYknyYWta2gJIE=;
  b=kjFoP3zoOhIcMhIxvF+lhUAeMmSdLsB0aE8CGRnhI/rC6cylswQlJGIX
   Iila7s2VTT9W6kYF0X4JV8Pfg5B6iGGoZHvOnRJMXOULtSHuQEMNLOWdQ
   L8hiIr1u8XtdyIPmnF2Rak0BQcwghVMS1K4QitREPPXBiETgizr0IOW9j
   C4kIJYk/M3jz3skorOZ5McT5F+ID/rVHlywZRkeTE2QKbXVNsgMEhcKft
   oF/3LFho8CBARp1jRuUoFEanrfgKSG5rfwhEyyfXDEJWIFTRd9CHBrPYu
   DDTI2prStjFFKeBa54F0/998GQQaLokrds+NDpoeh0Xfhr+DkB3t1sdHh
   g==;
X-CSE-ConnectionGUID: gcLV1JggSdqQilsv6wqhMg==
X-CSE-MsgGUID: wkgdPLDCTJu4A1RFJHSvaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="814801"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="814801"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 08:20:09 -0700
X-CSE-ConnectionGUID: ddZo41uQT4KIlC4cRw1qSQ==
X-CSE-MsgGUID: gDkoODRcR0GKe/FBZ8N/XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2333231"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.56])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 08:20:06 -0700
Date: Fri, 16 Oct 2026 18:20:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hugo Sales <hugo@hsal.es>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	jfalempe@redhat.com, javierm@redhat.com
Subject: Re: [PATCH 0/2] drm/client: Keep larger modes in connector->modes on
 fbdev hotplug
Message-ID: <atJAora2ehsbYz90@intel.com>
References: <20261015212545.1989962-1-hugo@hsal.es>
 <atIYd0dd6ynXulwQ@intel.com>
 <20261016131652.483525-1-hugo@hsal.es>
 <atItSgRj26x60ACf@intel.com>
 <20261016144013.1014546-1-hugo@hsal.es>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261016144013.1014546-1-hugo@hsal.es>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Fri, Oct 16, 2026 at 03:40:13PM +0100, Hugo Sales wrote:
> On Fri, Oct 16, 2026 at 04:57:30PM +0300, Ville Syrjälä wrote:
> > Connectors aren't probed before something actually probes them.
> > Typically that would be fbdev.
> 
> I think I may have misspoken before. fbdev's first probe already uses
> the device's limits: __drm_fb_helper_initial_config_and_unlock() passes
> max_width and max_height. Only drm_fb_helper_hotplug_event() passes the
> framebuffer size, so the list starts with every mode and loses the
> larger ones on the first hotplug. This series makes the hotplug probe
> match the first one

Right, forgot about the initial probe. And I think we definitely
want the initial probe to use the max size because we don't want
to keep the BIOS framebuffer if it's tiny. A long time ago we
kept the BIOS fb no matter what, but that made the console pretty
much unusable (due to being too small) on some machines.

> 
> Are you suggesting a different approach?

Nah, I guess what you're doing should be fine.

-- 
Ville Syrjälä
Intel
