Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F327386562;
	Tue, 22 Sep 2026 17:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099172; cv=none; b=AwRC8q7jOumQbq6eqKxsfe0V8HeRbuJxGj+iXicER6b8wmblh/38VVOOzETSTVtBgTGqvw52SZL/6pu+v+RazQRMv4U/AelChJn303pDNrB6OMJjm8WRKCoHqxdidmcq4cSdOkSU0xIP/0Rql6DWGOsjaCXArdbOAIVIiyBLBVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099172; c=relaxed/simple;
	bh=tqqKL3MiY3dTHB7Hnlj1GNEzosXblE2ZBz6uATwkqy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwmzC6LUf2QsVrBSnDkR+jevHch8KUz94h/JLAuZVtwIdheF/zfcgDER7w7WcP74a5Zki1n96OpchYt5AuwMxehCDdgRr7NE+IeZZbUEVCO1Cqpm5tHsFxOTdbcB8QPMED2oGXyPmMQ0Nn+7n+PRPro7MLY19ruaaAQvyV4E410=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tyLx5zTp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tyLx5zTp"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47B47C25;
	Tue, 22 Sep 2026 19:44:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790099059;
	bh=tqqKL3MiY3dTHB7Hnlj1GNEzosXblE2ZBz6uATwkqy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tyLx5zTpqLBskYOMUczqyVWwaPhwVs6Hwc6EyH44GXpkBfnUxtQnQj6LiUg185WlH
	 ui6OP/7+Asxh0hCbfGIWGGOPNIDAzEbTDryyt+X197o98Ka08Fw4ruIlF2iDpaZuoy
	 BVrkosYSnm7NpfW89mWlndKo/ZsCbe0FyYtMzy6c=
Date: Tue, 22 Sep 2026 20:46:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Leonardo Costa <leoreis.costa@gmail.com>,
	"G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>,
	"Robby Cai (OSS)" <robby.cai@oss.nxp.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	leonardo.costa@toradex.com
Subject: Re: [RFC] media: i2c: ov5640: Implement get_mbus_config
Message-ID: <20260922174603.GB2333087@killaraus.ideasonboard.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arKo_e-3vWC4aqKD@SMW015318>

On Tue, Sep 22, 2026 at 11:12:45AM -0500, Frank Li wrote:
> On Tue, Sep 22, 2026 at 09:32:41AM -0300, Leonardo Costa wrote:
> > On Mon, Sep 21, 2026 at 11:02:13PM +0300, Sakari Ailus wrote:
> > > On Mon, Sep 21, 2026 at 03:04:59PM -0300, Leonardo Costa wrote:
> > > > Hi all,
> 
> Add G.N zhou and Cai Robby.
> 
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

On a side node, the CSI-2 receiver driver should be decoupled from the
rest of the imx6-media-csi driver.

Replacing the two helpers it uses (imx_media_init_mbus_fmt() and
imx_media_init_state()) is the easy part.  The imx_media_init_mbus_fmt()
call should actually be dropped, as the csi2_dev.format_mbus field
should be dropped too and replaced by usage of the subdev active state
API.

The harder part is to drop usage of grp_id. It will require some
research and experimentation.

> > To test this, I hard-coded mbus_cfg->type = V4L2_MBUS_CSI2_DPHY inside
> > csi_get_upstream_mbus_config(), and the test above worked with that. So
> > as far as I understand it, imx-media-csi.c really only needs to know
> > what the type of the bus is.

There's also a test of mbus_cfg->bus.parallel.bus_width in
is_parallel_16bit_bus().

> > The csi_get_upstream_mbus_config function already identifies whether
> > it's connected directly to the receiver or the mux, see the switch
> > statement below. If I understand correctly, in the case where it's
> > connected to the receiver directly, this is already known to be CSI-2,
> > so (I think) we can set the type value directly in this case.
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

As I wrote above, we need to drop setting grp_id in the CSI-2 receiver
driver. Given that the mux inputs are well known, I would prefer
inferring the source type from the mux's routing configuration. The
upside is that it will remove two out of the three locations that test
for IMX_MEDIA_GRP_ID_CSI2, easing removal of IMX_MEDIA_GRP_ID_CSI2.

> >
> > [1] https://www.nxp.com/webapp/Download?colCode=IMX6DQRM
> >
> > What are your thoughts on this?

-- 
Regards,

Laurent Pinchart
