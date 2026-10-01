Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8571B515896;
	Thu,  1 Oct 2026 13:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862352; cv=none; b=BaO6WY1ni+87fMo13oZP5sWd/eo5a+fYjvsA6+uX54av011j4GBeD3XCV2k+oJELVEE+S042zBjvH1lfpDfqF/gGPhLuW62vpGzYwVozZetbXgI4Y2MT/QOax03Sfhh3rBsh99OZuJorhkBYRqgSu+x/8hIdbaCz0wdTJNTRmcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862352; c=relaxed/simple;
	bh=NGSMm8PfNE9EuKGA03aikfRRcQ9RlsMinnp33+WTOQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jqCwETKBOM0FvdAV6s5jXZXT0MP18z9GAfauh5oFIB41hGddiNJdN8YcFnl/U5Usq+QD4jqAs/SANutFYnnsGWHUD9SSHuZsKp71cBWQkvkeZKl0wTujTa9GkgYA6tCHrkgQKwi6YukHBZr2KtD+aFlHPBOVAVbr9IZV4ap7paU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpBpGDoR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpBpGDoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790862350; x=1822398350;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NGSMm8PfNE9EuKGA03aikfRRcQ9RlsMinnp33+WTOQg=;
  b=dpBpGDoRcUaMJiJoq5b1lFuaDISwvr5vKAhs+nUzSPMV+m0NT8LCwcFp
   r+ZRrEBr3ULblxQDxakzQrHWnvh55DmRlwJBYnG3/PYz2Ozs80g5d90cA
   g0+cMXlBfEzYmscqVizsFsrVq/F1ymtvJfQObHjk2BjwwJlMUOqjo2AOC
   IW9xZClEhV+7t0tt502g0x0ob0uU5ck+pPhN01/WBbr0F+iBLD7cuP1Fa
   1K36xQUCmOWX7gFb9/TauPYxluKnOjao6YlUBubKmrvLuUSio+pfnKGdA
   UToXETY1pY3WQKZpvSt378AkAjwQwwAW0r3kzvr7eTVXRKPRu7wwpN7oJ
   g==;
X-CSE-ConnectionGUID: BIkAPYINQtG8gU7HNrksTQ==
X-CSE-MsgGUID: NIDHVCJAT76bF6HC3caUPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91638283"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="91638283"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 06:45:49 -0700
X-CSE-ConnectionGUID: UYseu5zYTCKu4Kh0A7r3rw==
X-CSE-MsgGUID: +S72MK2gTOKtxCwcX+WfkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279301760"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.7])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 06:45:47 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CDC3A11F84B;
	Thu, 01 Oct 2026 16:45:42 +0300 (EEST)
Date: Thu, 1 Oct 2026 16:45:42 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org,
	hverkuil+cisco@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kieran.bingham@ideasonboard.com,
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com,
	Kengo.Hayasaka@sony.com, Tim.Bird@sony.com, Kazumi.A.Sato@sony.com,
	Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: Add Sony IMX908 image sensor driver
Message-ID: <ar5kBpv8hdkpldp9@kekkonen.localdomain>
References: <20260828064843.65047-1-lachlan.michael@sony.com>
 <20260828064843.65047-3-lachlan.michael@sony.com>
 <ar5RFpomHbdAAMLx@kekkonen.localdomain>
 <20261001133138.GM944070@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001133138.GM944070@killaraus.ideasonboard.com>

Hi Laurent,

On Thu, Oct 01, 2026 at 04:31:38PM +0300, Laurent Pinchart wrote:
> On Thu, Oct 01, 2026 at 03:24:54PM +0300, Sakari Ailus wrote:
> > > +static int imx908_set_selection(struct v4l2_subdev *sd,
> > > +				struct v4l2_subdev_state *sd_state,
> > > +				struct v4l2_subdev_selection *sel)
> > 
> > We don't really have cropping behaviour documented before the common raw
> > sensor model. I'd just postpone this until we have the common raw sensor
> > model support
> > <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata> merged.
> 
> There's real progress on merging the raw camera sensor model, with Jai
> finalizing the implementation in libcamera. We could drop crop support
> for the initial version of the IMX908 driver or wait for the raw camera
> sensor model to be merged. The former is probably better to avoid
> delays.
> 
> Lachlan, sorry about this last-minute request. Hopefully it will be
> quite simple to drop the .set_selection() handler and hardcode full
> resolution. imx908_update_framing_limits() will then have no user and
> could be dropped too. We'll add it back one kernel version later by
> adding crop support based on the raw camera sensor model.

As an added bonus, it'll be more simple to support that in the driver, too.

> > > +static int imx908_disable_streams(struct v4l2_subdev *sd,
> > > +				  struct v4l2_subdev_state *sd_state,
> > > +				  u32 pad,
> > > +				  u64 streams_mask)
> > > +{
> > > +	struct imx908 *imx = to_imx908(sd);
> > > +	int ret;
> > > +
> > > +	ret = imx908_stop_streaming(imx);
> > 
> > imx908_stop_streaming() is used in a single location only. I think you
> > should move the code here. Same for imx908_enable_streams() and
> > imx906_start_streaming(), too.
> 
> For imx908_start_streaming() it could make error handling a tiny bit
> more complex. This is the kind of detail I'd leave to the appreciation
> of the driver author.

Works for me. In that case I'd move the other function just above the
caller.

...

> > > +	/* Device is powered; keep it resumed across registration, release at end */
> > > +	pm_runtime_set_active(imx->dev);
> > > +	pm_runtime_get_noresume(imx->dev);
> > > +	ret = devm_pm_runtime_enable(imx->dev);
> > 
> > What will happen on error here? PM runtime will be disabled after probe()
> > exits on error, but you'd need to set the state to suspended after that.
> > I'm not sure you can correctly use this as things stand currently. This
> > also conflicts currently with remove() below disabling Runtime PM
> > explicitly.
> 
> I'm not sure to understand what's requested here. Are you saying there's
> a potential issue that can't be fixed currently ? Or should this code be
> modified ? In the latter case, could you please tell what should be done
> ?

I'd just avoid using devm_pm_runtime_enable() here. The problem really is
that you'll need to set the device to suspended state (as well as power it
off) *after* devm does its teardown work. You can't do that, at least not
right now, without introducing devm variant of setting the state active.
There may be dependencies to some assumptions on how devices are unbound.

-- 
Regards,

Sakari Ailus
