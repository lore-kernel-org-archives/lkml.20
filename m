Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F712390CBE;
	Sat, 12 Sep 2026 11:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789213674; cv=none; b=AF18PEAYaF8oKllhs48TKVKYcwHXcvLHRCE2J/o8XVlKXoNV2DJBBc9k/ed5naZBtsWPHjIcQmpD+ASJo14NMbUwpm2+1vu/IEUqu84TJLnSaf2Drm7u3CZO0pm5mRJ+3gQiOtTl7UJ+FeV+8YHnhqlTXMtCWgsiTO+kD+YPyL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789213674; c=relaxed/simple;
	bh=3X6dEV24yH9mLcYAeMRhh3slUxfFXhRuPH5sUwN08Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=siG+tQicqz1yYLSSWNPNbEeb45Eitz/mwK7+VR9L9D+Ny+XcylOzaGtXcFVEviP7htP7ZCwKvQjXg/F+ohwiq2mFDBlCwiD845LitS7Ebggx0WCg4OfKtJ+NEtXdIHoNCNfhpmLJzloEuFlDjeoSLmtZwBA4StdHYdfgTyZoHNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XEZG//MH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XEZG//MH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789213673; x=1820749673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3X6dEV24yH9mLcYAeMRhh3slUxfFXhRuPH5sUwN08Rw=;
  b=XEZG//MHfAJkEOA/oSy3i7H853w/n5ySHdx+Et9zKCWRKDnQsKdVhfe2
   M/JTvWTb53Kjm/tDI5x8hJkN2NtIB6RwjRetT9w9kU3QZwB9g0l0ixQIA
   43y6GqQWvJksaS1FisCoqJWhk2gp9SRcxvqrkjzUF1ooY5fwSLE8RGlf3
   1lbjAUBG7kxBZKsUsQ4wqAGtY2+R/ek8VjYPeIc0qRat1LGfbfSmjDOEh
   KC50PChDJ5fnecjUMJ3Wt6AnqzMCIUMmmmp4snE6nqr+lmebSfVfkjtak
   kI0snS6aczYBmIoBreF+jwgXG2kVTwJXxFhcIpdGFFb+/EbEK8vqwWkQW
   g==;
X-CSE-ConnectionGUID: qSdwN8TITLWACQHMOGNvKw==
X-CSE-MsgGUID: MN9RwsOjRdGd9540i6Op7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="101176436"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="101176436"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 04:47:52 -0700
X-CSE-ConnectionGUID: CsUZZu1TSKasNDqLO6rOag==
X-CSE-MsgGUID: momP4OePRKSrm0EETY3h+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="277423628"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.238])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 04:47:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EDDA8120EA9;
	Sat, 12 Sep 2026 14:47:52 +0300 (EEST)
Date: Sat, 12 Sep 2026 14:47:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Philippe Baetens <philippebaetens@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: mira016: Add driver for Mira016
Message-ID: <aqU76D0njKfZyd1O@kekkonen.localdomain>
References: <20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com>
 <20260904-mira016-v2-2-1dcf7b3a807e@ideasonboard.com>
 <ap3M0h2S6EFpuC2T@kekkonen.localdomain>
 <ap5n7OyZrI0KzzN-@zed>
 <ap-1tDtGCWGc9Hvs@zed>
 <ap_DfdHTa0cQe1LH@kekkonen.localdomain>
 <ap_TUa3D0-ZGnrXy@zed>
 <ap_fLLHSEmw0J8yN@kekkonen.localdomain>
 <ap_kY7s1545jn1xz@zed>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap_kY7s1545jn1xz@zed>

On Tue, Sep 08, 2026 at 12:34:00PM +0200, Jacopo Mondi wrote:
> > > > > > > > +	/* TODO: Implement D-PHY configuration to support continuous clock. */
> > > > > > > > +	if (!(ep_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK)) {
> > > > > > > > +		v4l2_fwnode_endpoint_free(&ep_cfg);
> > > > > > >
> > > > > > > Instead of callind v4l2_fwnode_endpoint_free() here and above, I'd add a
> > > > > > > label for error handling.
> > > > > > >
> > > > > >
>                    ^
>                    |-- Here ?

Yes, please.

-- 
Sakari Ailus
