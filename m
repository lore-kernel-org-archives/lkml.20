Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16332471268;
	Mon, 28 Sep 2026 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583678; cv=none; b=Nig0q8INWvFel6ILQjPwGd3dhWh7BOxDvjty//w4aw63PKWu/qrmDwyDoShdkVBQdtUHOz1VK12CuB940PG2ExLucy8UEO1ptUAR6WFRxe/AARKFNe++6CiOASDFPfLxhCQV7vbUKnBYJ1zEPAfYb7rCJti+zfcBzd+7arkaqYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583678; c=relaxed/simple;
	bh=p1GMttPK9IkkRom+Vh1p8MWXXvVJPZFco+fOhe7maOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRRAEeGLSoToB9GOktZRwDxdPh8jqkQFUiI4nEoo+jG1IqiuBKPfFxzOFikd7S5fe3pdaQLAF4gSdjYTNZ8KwOX+mNiZl+paJdTFcfl0Tp83orCn7tqOakRd0TrOIMHz6SLRC0u5Ov2Q06W/zQY1wgi9f/wq593+A/dCNRlBk3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Acpn3Rlk; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Acpn3Rlk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790583677; x=1822119677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p1GMttPK9IkkRom+Vh1p8MWXXvVJPZFco+fOhe7maOs=;
  b=Acpn3RlkGAXPytqQXYyPe7vnjUMonyNggwcPkRGEl+HDyR4GWV/rYHIh
   VR8FQEUlrxN1MZ1KqixKhB/3n8jt/XeGEEMRjMPHfOiLKsj7U9b+doW5Z
   V6an0nqskfURe423Bz2hmjlAkEPanHvCLWM/pA9VQdreUqyxQJJNL7q+e
   MDxY68inis6UG2cR2cT4g23WOKNentdI5uQmNJZb3deWyBiYU0tjG6ixx
   L0SvebgkZgBdx/vEOLkBqXSCpyhmLZeMZ8Tayg1W5RnBwB1zhbU/IzTH3
   xOidpvw6Qu796p/+c0GwBy0yYyG76hoFfyxsvAw1bgKozXw5ulc9VNK3P
   A==;
X-CSE-ConnectionGUID: tdMafKF5R/mhUqrMoV/Dbg==
X-CSE-MsgGUID: S5nFHdogRAmk3wzbpFXjrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="100608394"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="100608394"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 01:21:16 -0700
X-CSE-ConnectionGUID: 90hIbrU7TyuX0UjrjjAm4g==
X-CSE-MsgGUID: I8VaB4VBRMWcAB5Yk7XyVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="274500544"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.65])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 01:21:12 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B7C7E121BA9;
	Mon, 28 Sep 2026 11:21:14 +0300 (EEST)
Date: Mon, 28 Sep 2026 11:21:14 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Leonardo Costa <leoreis.costa@gmail.com>,
	"G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
	"Robby Cai (OSS)" <robby.cai@oss.nxp.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	leonardo.costa@toradex.com
Subject: Re: [RFC] media: i2c: ov5640: Implement get_mbus_config
Message-ID: <arojemk96ALP_Nnr@kekkonen.localdomain>
References: <ho5e5huh2b5biibucht2bxyj2hzih2dkqpskrxtvsaf34niboc@s5e6pok36m5i>
 <arGNRTpmYwB2_gLk@kekkonen.localdomain>
 <hufoatx76dnto4w3f33lx3gr7efwgcmkj3x7nzofofpzm5f3hn@pvuswzm5ielf>
 <arKo_e-3vWC4aqKD@SMW015318>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arKo_e-3vWC4aqKD@SMW015318>

Hi Leonardo,

On Tue, Sep 22, 2026 at 11:12:45AM -0500, Frank Li wrote:
> On Tue, Sep 22, 2026 at 09:32:41AM -0300, Leonardo Costa wrote:
> > Hi Sakari,
> >
> > On Mon, Sep 21, 2026 at 11:02:13PM +0300, Sakari Ailus wrote:
> > > Hi Leonardo,
> > >
> > > On Mon, Sep 21, 2026 at 03:04:59PM -0300, Leonardo Costa wrote:
> > > > Hi all,
> 
> Add G.N zhou and Cai Robby.
> 
> Frank
> 
> > > >
> > > > Some time ago, we had sent a patch that implemented the .get_mbus_config
> > > > function for the OV5640 camera. This change was necessary for the camera to
> > > > work with the i.MX6 after the v5.18 release.
> > > >
> > > >     https://lore.kernel.org/all/20230306063649.7387-1-marcel@ziswiler.com/T/#u
> > > >
> > > > The patch stirred some discussion, since .get_mbus_config wasn't supposed to be
> > > > implemented on drivers that don't have dynamic lane configuration. There were
> > > > proposals of implementing it in other points of the camera pipeline, but no
> > > > conclusion was reached.
> > > >
> > > > We are planning to send the overlays for this camera for the Apalis iMX6, but
> > > > we verified that this patch is still needed for the camera to work on the
> > > > current mainline. Below are the commands to configure the pipeline, which
> > > > explicitly require a .get_mbus_config from the camera driver.
> > > >
> > > >     root@apalis-imx6-11367581:~# media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> > > >     root@apalis-imx6-11367581:~# media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> > > >     root@apalis-imx6-11367581:~# media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> > > >     root@apalis-imx6-11367581:~# media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > > >     root@apalis-imx6-11367581:~# media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > > >     [   47.438237] ipu1_csi1: entity ov5640 1-003c does not implement get_mbus_config()
> > > >     [   47.438265] ipu1_csi1: failed to get upstream media bus configuration
> > > >     root@apalis-imx6-11367581:~# media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> > > >     Unable to setup formats: Inappropriate ioctl for device (25)
> > > >     [   62.616177] ipu1_csi1: entity ov5640 1-003c does not implement get_mbus_config()
> > > >     [   62.616204] ipu1_csi1: failed to get upstream media bus configuration
> > > >
> > > > I am not very familiar with this subsystem, and it's been years since this
> > > > discussion took place, so I wanted to know what are your thoughts about this
> > > > patch and what the correct approach would be here. Was there any change that
> > > > would make this patch ok to be applied today? Do you think this still should
> > > > be included somewhere else on the pipeline?
> > >
> > > My objection to the approach was about adding code that does very little or
> > > nothing to potentially a rather large number of drivers.
> > >
> > > Since that we've gotten v4l2_get_active_data_lanes() that however seems to
> > > be used by the imx-mipi-csis driver only. Could using that solve the
> > > problem you have?
> >
> > Hmm, looking at the implementation of v4l2_get_active_data_lanes it
> > seems to actually still use .get_mbus_config, and falls back to a
> > maximum value passed as an argument.
> >
> > Furthermore, the error comes from imx-media-csi.c, and it doesn't seem
> > to be reading the number of lanes in the config, but rather the type of
> > the mbus (all the uses of the gotten mbus_cfg boil down to checking the
> > value of mbus_cfg.type). The receiver (imx6-mipi-csi2.c) actually seems
> > to get the number of lanes statically, and handle well the case where the
> > camera doesn't implement .get_mbus_config.
> >
> > To test this, I hard-coded mbus_cfg->type = V4L2_MBUS_CSI2_DPHY inside
> > csi_get_upstream_mbus_config(), and the test above worked with that. So
> > as far as I understand it, imx-media-csi.c really only needs to know
> > what the type of the bus is.
> >
> > The csi_get_upstream_mbus_config function already identifies whether
> > it's connected directly to the receiver or the mux, see the switch
> > statement below. If I understand correctly, in the case where it's
> > connected to the receiver directly, this is already known to be CSI-2,
> > so (I think) we can set the type value directly in this case.

Yes, that's what I presume as well -- the caller needs to know the type of
the interface, as you can't really have DVP and CSI-2 on the same interface
(and even if you share pins, these should still be logically separate).

> >
> > For the mux I am not entirely sure. From the "Figure 19-1. CSI2IPU
> > gasket connectivity" figure in the IMX6DQRM TRM [1] (the same one Jacopo
> > referenced on the other thread), the mux's possible inputs seem to be
> > well defined to be either the receiver itself or the parallel interface.
> > Given this, maybe we could similarly infer the bus type from the
> > sd->grp_id gotten from the mux.
> >
> > static int csi_get_upstream_mbus_config(struct csi_priv *priv,
> > 					struct v4l2_mbus_config *mbus_cfg)
> > {
> >     ...
> > 	switch (sd->grp_id) {
> > 	case IMX_MEDIA_GRP_ID_CSI_MUX: // <------ Mux
> > 		sd = imx_media_pipeline_subdev(&sd->entity,
> > 					       IMX_MEDIA_GRP_ID_CSI2,
> > 					       true);
> >         ...
> > 		break;
> > 	case IMX_MEDIA_GRP_ID_CSI2: // <------- Receiver
> > 		break;
> > 	default:
> > 		...
> > 		break;
> > 	}
> > ...
> > }
> >
> > [1] https://www.nxp.com/webapp/Download?colCode=IMX6DQRM
> >
> > What are your thoughts on this?
> >

-- 
Regards,

Sakari Ailus
