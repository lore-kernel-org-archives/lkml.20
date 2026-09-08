Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73833A901C;
	Tue,  8 Sep 2026 08:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854946; cv=none; b=uNOfQT3l6rgahOxxziphWOEpDLlU9FkrJ7p49gxOb8Mr5sFfq8XJJLjrf1DBG11cy1vPFnm2S+l9viuNp1b6CC5pSl9vHGzJdcn3UOouOCfw3zG+x4TeLU2gQzjLdKNisYaBuAnshxe+j02VyKjwozGZkp2onbIxtvIas4xW4Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854946; c=relaxed/simple;
	bh=Pz4s/OkkJdrwX3L3b9G9j+92YEGxFvKWRVYgPeVfoIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXviJ3srY5LN2ie7YHEe7JEnYuzuIYXtIPx6169Zr10OhquAE23xd2MN546tHPo5i+ZRvdlqSm01wGJriXwN9EuxWBC6PvKvRr4DAp/P/9Ifrpj9halgaAWZknCuf0sAiwu97h7WQV+Yiy0dB1Dds+NwBKx9ck2w+cxzCLRa1Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cdrUxvfj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdrUxvfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788854945; x=1820390945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pz4s/OkkJdrwX3L3b9G9j+92YEGxFvKWRVYgPeVfoIk=;
  b=cdrUxvfj66YcQ5+IBDfWEY0cTX1m6yd4i1sMJlYzDpoxAbRz4Ae61Lpo
   TSTIb/uPHbIAG4Tm9uGMnh+2cw/Hfm2AFLLlFnb4zIIg1n4dRdZxmbUSA
   Oe1+3kgZelUkdPfrxx2kzO6AwbRu96gIMl2uYDSeWarUx0WIqBNfLU85w
   M31osRGfi8XZuCjF21H8+cztafoh3ALgV0XAZLJReK43Shzgcd4V/UOAf
   zmoISULNwn83Vqn+X3oVye6eKiMQRKE54m0Kd3hxDa0CAWe1LXGZoC2Eg
   fkeyx5sZpc0Qtmj6DhD6RgdiKbd0LG+hrZS4JgQX782l5UGqqOpnsJVv7
   Q==;
X-CSE-ConnectionGUID: g3AxdscvRzy+ceqAWVUlcA==
X-CSE-MsgGUID: PQe7+rx1SQK50/LmkxTbSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100771329"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="100771329"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:09:05 -0700
X-CSE-ConnectionGUID: kCeffEvVQ/KHlW6WfeAo5Q==
X-CSE-MsgGUID: 2dwkh/uRShOLteCW5P3xvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="266577821"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.120])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:09:02 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6A05511FA3A;
	Tue, 08 Sep 2026 11:09:04 +0300 (EEST)
Date: Tue, 8 Sep 2026 11:09:04 +0300
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
Message-ID: <ap_CoB5YL2rKAuCy@kekkonen.localdomain>
References: <20260904-mira016-v2-0-1dcf7b3a807e@ideasonboard.com>
 <20260904-mira016-v2-2-1dcf7b3a807e@ideasonboard.com>
 <ap3M0h2S6EFpuC2T@kekkonen.localdomain>
 <ap5n7OyZrI0KzzN-@zed>
 <ap561H8xYJvjZsRa@kekkonen.localdomain>
 <ap6ALNC8Q0M-Oo51@zed>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap6ALNC8Q0M-Oo51@zed>

Hi Jacopo,

On Mon, Sep 07, 2026 at 11:16:41AM +0200, Jacopo Mondi wrote:
> > > > > +static int mira016_set_ctrl(struct v4l2_ctrl *ctrl)
> > > > > +{
> > > > > +	struct mira016 *mira016 =
> > > > > +		container_of(ctrl->handler, struct mira016, ctrl_handler);
> > > > > +	struct i2c_client *client = v4l2_get_subdevdata(&mira016->sd);
> > > > > +	struct v4l2_subdev_state *state;
> > > > > +	struct v4l2_rect *crop;
> > > > > +	int ret = 0;
> > > > > +
> > > > > +	state = v4l2_subdev_get_locked_active_state(&mira016->sd);
> > > > > +	crop = v4l2_subdev_state_get_crop(state, 0);
> > > > > +
> > > > > +	if (ctrl->id == V4L2_CID_VBLANK) {
> > > > > +		s32 exposure_max = crop->height + ctrl->val
> > > > > +				 - MIRA016_FRAME_INTEGRATION_DIFF;
> > > > > +		s32 exposure_def = min(exposure_max,
> > > > > +				       mira016->exposure->val);
> > > > > +
> > > > > +		ret = __v4l2_ctrl_modify_range(mira016->exposure,
> > > > > +					       mira016->exposure->minimum,
> > > > > +					       exposure_max,
> > > > > +					       mira016->exposure->step,
> > > > > +					       exposure_def);
> > > > > +		if (ret)
> > > > > +			return ret;
> > > > > +	}
> > > > > +
> > > > > +	if (!pm_runtime_get_if_in_use(&client->dev))
> > > > > +		return 0;
> > > > > +
> > > > > +	switch (ctrl->id) {
> > > > > +	case V4L2_CID_EXPOSURE:
> > > > > +		ret = mira016_write_exposure_reg(mira016, ctrl->val);
> > > > > +		break;
> > > > > +	case V4L2_CID_VBLANK:
> > > > > +		ret = mira016_write_frame_duration_reg(mira016, state, ctrl->val);
> > > > > +		break;
> > > >
> > > > Is hblank part of the register lists?
> > > >
> > >
> > > These sensors (there will hopefully be more supported by this driver)
> > > do not have a real horizontal blanking.
> > >
> > > Their line length is expressed by a time base multipled by a line
> > > length which doesn't directly depend on the pixel width but rather on
> > > the ADC and PHY timings.
> > >
> > > You could expand the line duration by increasing the time base, but I
> > > wouldn't go there and use VBLANK only to control the frame duration.
> > >
> > > As you can see the HBLANK control is registered with  fixed value of
> > > 0.
> >
> > How does control frame rate then? If HBLANK is zero, the frame rate is
> > undefined, isn't it?
> >
> 
> Why do you think so ?
> 
> The row_timing is the product of the time base (in usec) multiplied by
> the row length expressed in time base cycles (see mira016_trow_psec()
> and how seq_time_base and row_length are calculated).
> 
> VBLANK is still controllable, and you can vary the frame rate by
> changing the vblank.
> 
> What have am I missing ?

Using only vertical blanking value to control the frame rate is fine, but
the correct HBLANK value is still needed by the user space to be able to
set the frame rate.

-- 
Regards,

Sakari Ailus
