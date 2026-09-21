Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3F833BBCF;
	Mon, 21 Sep 2026 20:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020950; cv=none; b=qHZbldeDkGB9kU6bYRdCTK/aTCJvH//oBkoYgP/1pH/HRhc35Q1IsLLl7ClX4M1NyazNulLrtZVbzjlbmiyQhcIh26VuFHHAfHpbcgM6JYbL4oJN1ZM4j8KHqzKsiOoRFZ2VBWeSKjzWLxOBs4t+xAKlPm98kIB/ksQWFLz0sVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020950; c=relaxed/simple;
	bh=rI20NCbA4O7pDcBnsFVI6NmtS2uJtaAEiIfG4zmEu8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyZX/dv1yUeOSTPRxKaLgyQbh2WELL1eYSqudH/EfZiZT2RnXNWs9pj4PX0uf8AP8/Nk0wAoOqT2RFAYWdulqpDLKPvCtPZ8eCd+mYBiXEsZKkuXFRqGf3tBFCXF5z/DdE4ZaxI0d+bypVPCs+ZZ/uKb4h2cb8Rd8BN7zg1Sd4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zhog/YOa; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zhog/YOa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790020948; x=1821556948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rI20NCbA4O7pDcBnsFVI6NmtS2uJtaAEiIfG4zmEu8k=;
  b=Zhog/YOa/Ket0ooSo7N7DcIgVRJUZ8/PV7r6e15S/h9zbmHKBb7Q2f/I
   mvk3dl3pycvO9nMFpgvI+QmWo6I/Ovxb9CSGJ5IgwdlaXS5tXbxYsXTqD
   Rqs9isYOvRl6TnrvDFFbz0piwDv2LEPs+GoSRGVz7e9MmjsU9TfVlojeW
   pGhYqByqPoPeYAkq9Er+hDMsiJ7jvoVP0UXRicdnNf59yWKqdttYuS3+A
   pUrT2TgmZ2crIqI1YeBkAnWZI+pxhla+z2QRNC9esLhP0IBDhsuAlEORh
   8fBjQgLXLLSa3DQXQtWuMBBieQUIQAIujrbALjjvxobi4PkWt4Ywi+/6q
   A==;
X-CSE-ConnectionGUID: HGCEGqW8TO+oVgIyDY+Nlg==
X-CSE-MsgGUID: GoPcoQlQQLyUzGTYmhmZtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1072689"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="1072689"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 13:02:27 -0700
X-CSE-ConnectionGUID: qRJk0B1zRxix0Sp1iNJvSg==
X-CSE-MsgGUID: Di6u7y9xSym5EAwhGqR2uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="280881061"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.157])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 13:02:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D51251218BD;
	Mon, 21 Sep 2026 23:02:13 +0300 (EEST)
Date: Mon, 21 Sep 2026 23:02:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.li@oss.nxp.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, leonardo.costa@toradex.com
Subject: Re: [RFC] media: i2c: ov5640: Implement get_mbus_config
Message-ID: <arGNRTpmYwB2_gLk@kekkonen.localdomain>
References: <ho5e5huh2b5biibucht2bxyj2hzih2dkqpskrxtvsaf34niboc@s5e6pok36m5i>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ho5e5huh2b5biibucht2bxyj2hzih2dkqpskrxtvsaf34niboc@s5e6pok36m5i>

Hi Leonardo,

On Mon, Sep 21, 2026 at 03:04:59PM -0300, Leonardo Costa wrote:
> Hi all,
> 
> Some time ago, we had sent a patch that implemented the .get_mbus_config
> function for the OV5640 camera. This change was necessary for the camera to
> work with the i.MX6 after the v5.18 release.
> 
>     https://lore.kernel.org/all/20230306063649.7387-1-marcel@ziswiler.com/T/#u
> 
> The patch stirred some discussion, since .get_mbus_config wasn't supposed to be
> implemented on drivers that don't have dynamic lane configuration. There were
> proposals of implementing it in other points of the camera pipeline, but no
> conclusion was reached.
> 
> We are planning to send the overlays for this camera for the Apalis iMX6, but
> we verified that this patch is still needed for the camera to work on the
> current mainline. Below are the commands to configure the pipeline, which
> explicitly require a .get_mbus_config from the camera driver.
> 
>     root@apalis-imx6-11367581:~# media-ctl -l "'ov5640 1-003c':0 -> 'imx6-mipi-csi2':0[1]"
>     root@apalis-imx6-11367581:~# media-ctl -l "'imx6-mipi-csi2':2 -> 'ipu1_csi1':0[1]"
>     root@apalis-imx6-11367581:~# media-ctl -l "'ipu1_csi1':2 -> 'ipu1_csi1 capture':0[1]"
>     root@apalis-imx6-11367581:~# media-ctl -V "'ov5640 1-003c':0 [fmt:UYVY8_1X16/1920x1080 field:none]"
>     root@apalis-imx6-11367581:~# media-ctl -V "'imx6-mipi-csi2':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
>     [   47.438237] ipu1_csi1: entity ov5640 1-003c does not implement get_mbus_config()
>     [   47.438265] ipu1_csi1: failed to get upstream media bus configuration
>     root@apalis-imx6-11367581:~# media-ctl -V "'ipu1_csi1':2 [fmt:UYVY8_1X16/1920x1080 field:none]"
>     Unable to setup formats: Inappropriate ioctl for device (25)
>     [   62.616177] ipu1_csi1: entity ov5640 1-003c does not implement get_mbus_config()
>     [   62.616204] ipu1_csi1: failed to get upstream media bus configuration
> 
> I am not very familiar with this subsystem, and it's been years since this
> discussion took place, so I wanted to know what are your thoughts about this
> patch and what the correct approach would be here. Was there any change that
> would make this patch ok to be applied today? Do you think this still should
> be included somewhere else on the pipeline?

My objection to the approach was about adding code that does very little or
nothing to potentially a rather large number of drivers.

Since that we've gotten v4l2_get_active_data_lanes() that however seems to
be used by the imx-mipi-csis driver only. Could using that solve the
problem you have?

-- 
Regards,

Sakari Ailus
