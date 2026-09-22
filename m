Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A145372C9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790080380; cv=none; b=gmEvURKakf6tSKYRDlkZvhfcHeYt40npNwuDe8Va+8+RcAvdDD9hZd3I0+QWQnZS9e4AbKwxp7UF0ATN68nsIRPQ2DWEO6CjkOStLYKVoZnxVjx5n7av/OhRpNzFe9P1EVbX60yt3znRvrI3cdbZbq6t9HdbbmATNl3bHyqSiDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790080380; c=relaxed/simple;
	bh=PNPMF5HaBye8yE0aDiamjT570/SAuJ9juWmwx+bL9Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHLnCU8w/OElkjfxr0I9iyUxhiIzkUKSUTYa5rv7w575rudbmS+3EEs8LwYozEsnxP28rpdc/379K0Fmaa2rLvaZDQEnMRXxWD9LBvELxbVS5ZrTdRH1kOKOUeU7tjpeD2XtxthJNG8RGReTf5rqZSctO9w4cWr3U/aOqx3yR4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTduBuC8; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTduBuC8"
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-9850a82eda4so391075241.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790080367; x=1790685167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fEcTTkslC2Kv8w+0UHkjnSap9hMo5JHz0Hbe2wfuDcA=;
        b=LTduBuC8BgcKe1M5AlpUxNDKvPgnQS+LC/Y8yCsapX/pYxa9U7ZxNUDpbgmkPcYLw9
         1tAOy9uCrNmlwD6S1mJAg2bVkpsKnyk356p7zmmQRzTZ/Xl/ZmdkOaDDTJFSyJALbcr3
         yBGw3vg65Rr1fYhMUzSyE1DQ83+5ZTQty6g/R1jjvYu0w8lTNDTr3OGNYn2FUsf7tJAB
         rQW1ayAClHEt0z2Ry7+lbK2w+vhnqS/RzfL/Etrj0brVRqqztikK6cWiusTpn0o7d/yK
         SkTdINjMKFregAa2nIq+QNSazLWzSIpKm6C0C2RBcAXFM6PiW/8i2DOrmO7vioaJU7EI
         MNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790080367; x=1790685167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEcTTkslC2Kv8w+0UHkjnSap9hMo5JHz0Hbe2wfuDcA=;
        b=B/gnIX7/qj1p60DUteVy0PmcedEJolYseNG8Fri7HkmT0kxPEeyYjIntdTXOVilL/G
         jQUl+0iXG7ClvL70ShOu//HYMO1C/50IlN6WzW9oj/1nmvCSSc1YgbdZYdxStFXTl1w9
         i86QuNt1tbtarq4iBt3dG9300TRDKgdDNyLZ8TV7SAVxVFhE/L2l+teN4FgDo+d8LvLb
         YAnw19pWhERPFPc4GLJWAbEaXos8gD5UjRLMVd94X3VdUhpZc9EqH+MLJXQSuG4eyYFS
         w9jCHofVzPa8gssD9Ha6vXGJ58At/0jXzMnVaRWaRlAoowP3szvhC7Jmyf3eKmpP+Fog
         koOw==
X-Forwarded-Encrypted: i=1; AKwUvBw1G5P8C8WlyQmAkGIq+9nhQzPvC+N6gYEIDpTJKnfV1WCkMtxaR1oG+s6/Flvl78Rk8cCXWtF3jpFEiR8=@vger.kernel.org
X-Gm-Message-State: AFuF++mFDaOjgZwAlRT1CSHmNRUs9WuaxGrkN1QymyUqz6gVxfm+kpgX
	Mng5UaHn2hlmgTT5efkPYKUpiPxAjolpZB2Zu1DzZ++faVdZvBWQYSlp
X-Gm-Gg: AYBFou3mc8AUKneM3lMtz5kDlGb60k2FqSluuE5ZSzvHQupZdxiRQ91LUVnpKA8vZl5
	jFYT7FRORARF3kvcuSHVKuTvESKw2skhR53hhM8ZZTChR8lhvVGwrwuHLhkYXT9nm4ephM3cMU1
	YBZ5NDGpglyJEHbR9rUBdyhMRb3kJOxaNRT5BytblCGYLMGyKdcMfi4SPZ+3SY1gUVgFP4ffcaB
	wZJ0Pou04X+eLJq20uFFXKs55Sf/8wwpX/6M1qiNpu/9cFBRGWe/17wPNWBNt6leu6JYFvoAAPN
	d5vHw+FqkM3G8SKaGrOc+fKmcRPXQj/OXW9Qf/deYbgenRG+acg2MYdnrbt/r/599bDDaqL5zgc
	5xFd/5m2IucMiG+Wg55E/wWNTECUjiMYqexZxOdWJCZvvoP1otHL8xqSXOLEA6SmLhTmMESw3YA
	vK+FQ0yDvxFsCBWOKKzKbfHzdG8mgHcQV+fNeugCGELXCa7d2fzN8s9NLYc+9UxI9iAUWgYJLm4
	Ldg
X-Received: by 2002:a05:6102:e08:b0:7a7:19aa:8a82 with SMTP id ada2fe7eead31-7a719aa90d7mr5707248137.29.1790080367089;
        Tue, 22 Sep 2026 05:32:47 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ab18848f54sm1541461137.12.2026.09.22.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:32:46 -0700 (PDT)
Date: Tue, 22 Sep 2026 09:32:41 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Frank Li <Frank.li@oss.nxp.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	leonardo.costa@toradex.com
Subject: Re: [RFC] media: i2c: ov5640: Implement get_mbus_config
Message-ID: <hufoatx76dnto4w3f33lx3gr7efwgcmkj3x7nzofofpzm5f3hn@pvuswzm5ielf>
References: <ho5e5huh2b5biibucht2bxyj2hzih2dkqpskrxtvsaf34niboc@s5e6pok36m5i>
 <arGNRTpmYwB2_gLk@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arGNRTpmYwB2_gLk@kekkonen.localdomain>

Hi Sakari,

On Mon, Sep 21, 2026 at 11:02:13PM +0300, Sakari Ailus wrote:
> Hi Leonardo,
> 
> On Mon, Sep 21, 2026 at 03:04:59PM -0300, Leonardo Costa wrote:
> > Hi all,
> > 
> > Some time ago, we had sent a patch that implemented the .get_mbus_config
> > function for the OV5640 camera. This change was necessary for the camera to
> > work with the i.MX6 after the v5.18 release.
> > 
> >     https://lore.kernel.org/all/20230306063649.7387-1-marcel@ziswiler.com/T/#u
> > 
> > The patch stirred some discussion, since .get_mbus_config wasn't supposed to be
> > implemented on drivers that don't have dynamic lane configuration. There were
> > proposals of implementing it in other points of the camera pipeline, but no
> > conclusion was reached.
> > 
> > We are planning to send the overlays for this camera for the Apalis iMX6, but
> > we verified that this patch is still needed for the camera to work on the
> > current mainline. Below are the commands to configure the pipeline, which
> > explicitly require a .get_mbus_config from the camera driver.
> > 
> >     root@apalis-imx6-11367581:~# media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
> >     root@apalis-imx6-11367581:~# media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
> >     root@apalis-imx6-11367581:~# media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
> >     root@apalis-imx6-11367581:~# media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
> >     root@apalis-imx6-11367581:~# media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> >     [   47.438237] ipu1_csi1: entity ov5640 1-003c does not implement get_mbus_config()
> >     [   47.438265] ipu1_csi1: failed to get upstream media bus configuration
> >     root@apalis-imx6-11367581:~# media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
> >     Unable to setup formats: Inappropriate ioctl for device (25)
> >     [   62.616177] ipu1_csi1: entity ov5640 1-003c does not implement get_mbus_config()
> >     [   62.616204] ipu1_csi1: failed to get upstream media bus configuration
> > 
> > I am not very familiar with this subsystem, and it's been years since this
> > discussion took place, so I wanted to know what are your thoughts about this
> > patch and what the correct approach would be here. Was there any change that
> > would make this patch ok to be applied today? Do you think this still should
> > be included somewhere else on the pipeline?
> 
> My objection to the approach was about adding code that does very little or
> nothing to potentially a rather large number of drivers.
> 
> Since that we've gotten v4l2_get_active_data_lanes() that however seems to
> be used by the imx-mipi-csis driver only. Could using that solve the
> problem you have?

Hmm, looking at the implementation of v4l2_get_active_data_lanes it
seems to actually still use .get_mbus_config, and falls back to a
maximum value passed as an argument.

Furthermore, the error comes from imx-media-csi.c, and it doesn't seem
to be reading the number of lanes in the config, but rather the type of
the mbus (all the uses of the gotten mbus_cfg boil down to checking the
value of mbus_cfg.type). The receiver (imx6-mipi-csi2.c) actually seems
to get the number of lanes statically, and handle well the case where the
camera doesn't implement .get_mbus_config.

To test this, I hard-coded mbus_cfg->type = V4L2_MBUS_CSI2_DPHY inside
csi_get_upstream_mbus_config(), and the test above worked with that. So
as far as I understand it, imx-media-csi.c really only needs to know
what the type of the bus is.

The csi_get_upstream_mbus_config function already identifies whether
it's connected directly to the receiver or the mux, see the switch
statement below. If I understand correctly, in the case where it's
connected to the receiver directly, this is already known to be CSI-2,
so (I think) we can set the type value directly in this case.

For the mux I am not entirely sure. From the "Figure 19-1. CSI2IPU
gasket connectivity" figure in the IMX6DQRM TRM [1] (the same one Jacopo
referenced on the other thread), the mux's possible inputs seem to be
well defined to be either the receiver itself or the parallel interface.
Given this, maybe we could similarly infer the bus type from the
sd->grp_id gotten from the mux.

static int csi_get_upstream_mbus_config(struct csi_priv *priv,
					struct v4l2_mbus_config *mbus_cfg)
{
    ...
	switch (sd->grp_id) {
	case IMX_MEDIA_GRP_ID_CSI_MUX: // <------ Mux
		sd = imx_media_pipeline_subdev(&sd->entity,
					       IMX_MEDIA_GRP_ID_CSI2,
					       true);
        ...
		break;
	case IMX_MEDIA_GRP_ID_CSI2: // <------- Receiver
		break;
	default:
		...
		break;
	}
...
}

[1] https://www.nxp.com/webapp/Download?colCode=IMX6DQRM

What are your thoughts on this?

Kind regards,
Leonardo
