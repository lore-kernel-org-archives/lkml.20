Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54C23DDDD9;
	Fri, 25 Sep 2026 11:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334937; cv=none; b=ucU3yRMwy2aTGldEY23xuYVEYHlQXeqZrQuRkc6WAN/wglLVTUL8TNxqEcX+ar1bFsBn3brLlLq+0XQGuur/kKT5zOvLHOeiyDTOMvr1y86CcuYfYE90jW9WrSIM++MQ/AMPI0bI6WZnulD/X7evqzwnpvc1LpVE9DNc8I1ZDZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334937; c=relaxed/simple;
	bh=4zgb92s/QocMqoQkiJ8G8wvlY4vHzR1EEvPhto4Q1z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOqxupz5Dqts4pT8qc/46pBKoyY1N17rqFi9xyvPTizI4QNjUmI28OFPwhKbK4T+pr2s4PrAh2/jOqGm4nwV2nzn7OFku+qrFHBF5iW3Qvc08BMjd2+gX/H4AmUg/V4m4lSKmVmW7npdjzm4cqFDJ2eDfkF74boR5DRYxzsrYk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDNlF7ay; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDNlF7ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790334936; x=1821870936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4zgb92s/QocMqoQkiJ8G8wvlY4vHzR1EEvPhto4Q1z4=;
  b=MDNlF7ayOMOAnlRtHuz0Wnb013NJ02u27mllmJQ2CKWOCMrclpgj5/2S
   72dlUSPVtYkz+2CwfrJpMe/4r4RZpkzkizfX3srfF9zs20VwQALoT8ZVI
   zTbTMAp6FELV3dKcIGFQUSJRfOJ9HUxqTRITVsOSI/7x98ugc4JV0wCsu
   vzKO26rcmRxkxjk49Fny6NbvX+MA/P8vLr7EE6xvx53VxgC7O0N6FIXea
   NokUcDxAqrObln/FpgUhBdLsh4FhVhjiI0HyIzdIDJQPPRROrl9qbpYS3
   mrw8xvw6qDPt7JLtmhMpGEmmdspz3cQ3CDf4WEAznl2G8MwLlKnXUSp1q
   Q==;
X-CSE-ConnectionGUID: cI+0BHOqR9OoIn6X9x+B9A==
X-CSE-MsgGUID: Y66tVN/bQt64LSrI9PjuFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90982754"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90982754"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:15:35 -0700
X-CSE-ConnectionGUID: IkjMGtf+S5GafoTcw/Hf3w==
X-CSE-MsgGUID: biVK1pBrQmuqnYIaBfed2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273542074"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.84])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:15:33 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 94D75121BA9;
	Fri, 25 Sep 2026 14:15:33 +0300 (EEST)
Date: Fri, 25 Sep 2026 14:15:33 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: =?iso-8859-1?Q?C=E9dric?= Bellegarde <cedric.bellegarde@adishatz.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] media: v4l2-async: link ancillary device runtime PM to
 the sensor's
Message-ID: <arZX1fhR_hvg0nfM@kekkonen.localdomain>
References: <20260922-sensors_pm-v1-1-05adf2098b5e@adishatz.org>
 <arNzDkG8JmIWedwF@kekkonen.localdomain>
 <179014670130.2497080.16248724869350735374@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179014670130.2497080.16248724869350735374@ping.linuxembedded.co.uk>

Hi Kieran,

On Wed, Sep 23, 2026 at 07:58:21AM +0100, Kieran Bingham wrote:
> Quoting Sakari Ailus (2026-09-23 07:34:54)
> > Hi C�dric,
> > 
> > On Tue, Sep 22, 2026 at 09:39:12PM +0200, C�dric Bellegarde wrote:
> > > When a sensor's fwnode references an ancillary lens or flash device
> > > (e.g. via the "lens-focus" or "flash-leds" properties),
> > > v4l2_async_create_ancillary_links() already creates a media controller
> > > link between the two entities, but their runtime PM states remain
> > > independent.
> > > 
> > > This is a problem for devices such as VCM lens actuators, which are
> > > typically spring-loaded: holding a position away from the spring's
> > > rest point requires continuous power, and the position is not retained
> > > once power is cut. If such an actuator is allowed to runtime-suspend
> > > independently of the sensor, the lens can drift back to its rest
> > > position during an otherwise active capture session.
> > > 
> > > Add V4L2_SUBDEV_FL_PM_LINK to allow an ancillary subdevice to request
> > > that its runtime PM state be linked to the associated sensor.
> > 
> > Interesting idea.
> > 
> > The IPU bridge has created such a device link between the VCM and the
> > sensor as on some ACPI systems the VCM is in fact relying on the power
> > resources of the sensor. But to do this everywhere?
> 
> Same on any Raspberry Pi camera module. The VCM is powered by the same
> enable lines as the Sensor there I think which has made things
> interesting in handling VCMs for those devices.

Yes, this has been an issue in DT for a long time. :-( I'm not sure if this
approach could extend into a solution for that though.

> 
> 
> > VCMs traditionally have been powered through opening their sub-device node
> > and that hasn't been exactly neat API-wise. It has been practical still,
> > AFAIK, as in order to control the VCM, you have to have a sub-device node
> > open.
> 
> This is an issue though, as libcamera opens the device nodes and holds
> the file descriptor when it has a camera. This means that even if the
> camera isn't streaming, the VCM is powered on and causes power
> consumption on mobile devices which people then attribute to pipewire.

A practical fix for that could be to set the current to 0 when streaming is
off.

> 
>  
> > This change also does mean that if the sensor is powered, even for
> > always-on use cases that generally consume very little power, the VCM is
> > powered on as well. VCMs still typically consume very little power if the
> 
> Do you foresee use cases where a linked VCM shouldn't be  powered while
> a camera is streaming? That effectively means the lens position seen by
> the camera is 'arbitrary' / undefined ?

It's neither, in that case the lens will be just in the resting position
which is typically close to infinite.

> 
> > current is configured to zero. Maybe this won't be an issue? Backtracking
> > from such a change wouldn't be simple, and might not be possible at all.
> > 
> > There wouldn't be a need for a sub-device flag and this would be done for
> > all VCMs based on the ancillary link.
> > 
> > I wonder what others think.
> > 
> > Cc Laurent and Hans as well.
> 
> Cc Dave too as he's looked at similar things in the past.

-- 
Regards,

Sakari Ailus
