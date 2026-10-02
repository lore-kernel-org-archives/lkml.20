Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055863BFE3F;
	Fri,  2 Oct 2026 07:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925672; cv=none; b=ssVvsGAAHJDBoHp4Sns9REDIXXHFswFG4JkItI+406sHR0I7InyqqOKNGIBjKKr0Dlz8INOdCb2xVq35NXgoQP+/5tIieSVYAw42s9dIlHlV1oJZ4FB7xB1Z4LhO2HoTJIxXKYR+gl1omNUBILnx89opeFY4lrAer0PdFNQj8Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925672; c=relaxed/simple;
	bh=3J+gWf/EvUIiwl4D1r1V0mUWXaQNQOB16CE77PPjS38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z10/Zcut8B/YEqqh2TvzK9NnHeBhbHlX3emY2Dv7UaaLu4jl/61sAxJaqSOv14HVoMOQm1X5RwU4lQbXeg19JpMcOEmhr8Ht3b9XmBlJv/4TxM74KPS8mAeM8PUA0l03IMfg9xV+RzFztq+okIcHYuHEwu5xeykx/6OJ7DvUzhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaOAFOd0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaOAFOd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790925670; x=1822461670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3J+gWf/EvUIiwl4D1r1V0mUWXaQNQOB16CE77PPjS38=;
  b=CaOAFOd04EKd+nNhJuUTDqkZmgrtnOGMZ/wClABnMm/mwQUvWLKafwbU
   Yyir4bRiMnRJYnMOgEX4p4Gkc81eRVxpNcpH6DmWwwwymuaBG1cZ0DVKU
   Gn48XXwSjA31Uta2XBsdazGLJhFFfGBjQzWyvS3BULZ6ApjalYtcoxFOO
   AQD/d3I2aC/dZXNhUFoV+x2f0ODeFd6pvzhZjiEPnXhXRS0gMFcJdN9HI
   XqTmamrgIH1JIlPzJrBKqV5hgmIG0aF1wWeViMetajzXXSNKPSUE4xsJK
   IPdrlFR2wIC2pHwQQOU+p/1egt0jOy5LwoCUCTQoyIdFoutV1weA+GF2m
   g==;
X-CSE-ConnectionGUID: 65DbhD0wQDCHDTmtkcEXfw==
X-CSE-MsgGUID: KoQubyiNQ6udGI4eky6kZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="117220933"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="117220933"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:21:08 -0700
X-CSE-ConnectionGUID: FWtsk2H+QCuR2qczpae6Bg==
X-CSE-MsgGUID: 6hGA015tRqOB5o6Fr8V08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="275317062"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.205])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:21:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0ACF311F817;
	Fri, 02 Oct 2026 10:21:04 +0300 (EEST)
Date: Fri, 2 Oct 2026 10:21:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 5/5] media: imx219: Add status polling using .detect()
Message-ID: <ar9bYNbuJHwpxlyk@kekkonen.localdomain>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <20261001-v4l2-sensor-detect-v1-5-a45993be17b8@kernel.org>
 <CAPY8ntCBcUXte5pAG+i0SRNC-z6GOjakfgGLjDm7D=z91A3uhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntCBcUXte5pAG+i0SRNC-z6GOjakfgGLjDm7D=z91A3uhg@mail.gmail.com>

Hi Dave, Mattij,

On Thu, Oct 01, 2026 at 04:58:57PM +0100, Dave Stevenson wrote:
> Hi Mattij
> 
> On Thu, 1 Oct 2026 at 13:55, Mattijs Korpershoek
> <mkorpershoek@kernel.org> wrote:
> >
> > Userspace needs to be notified when a sensor connection status
> > changes (e.g. disconnected at boot, then later reconnected) so it can
> > react accordingly.
> >
> > Add periodic polling using a delayed work that calls .detect() every
> > 2s and sends a KOBJ_CHANGE uevent with HOTPLUG=1 on status changes.
> > This mirrors the approach used by DRM connectors in output_poll_execute().
> 
> AIUI DRM polls from within the framework (drm_probe_helper.c), not by
> a workqueue in the individual drivers.
> 
> Admittedly V4L2 doesn't currently have a totally obvious place to
> setup this, but it would be far less effort to have the polling
> framework within the core code rather than driver.
> Possibly initialised in __v4l2_async_register_subdev_sensor() based on
> whether .detect is set, and cleaned up in
> v4l2_async_unregister_subdev, with the workqueue calling .detect and
> generating the udev event based on the return value? I think that's
> feasible.

Sounds good to me.

I'd also put this behind a Kconfig option, the use case is rather special.

Also there are different approaches to this: in some cases you may want to
know the values written to the device's registers get updated so you write
and read, then some devices might crash in a way they're not doing their
real job while still allowing reading registers as usual. These are rare
cases though.

Should the interval be at least configurable? That indeed further suggests
the use of controls for this.

-- 
Regards,

Sakari Ailus
