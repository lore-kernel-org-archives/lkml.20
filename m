Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621046;
	b=V7wYRJNV9ZCxUhAPbw5IyOpKB/h3LZKZoh3/cV+IKvaJ/wBF46C1fb7vx9VKNMH8/hME
	 EDrCAEhZJbluF37hj05C1hx/PcFKMkOmqF/BwH778uxfn/S6Z2j1eLp6V8OCHE6FzcKwq
	 Wxs8bmi6PL5bGKvsaKv/zXZhcZftNOcI4UwutPwA+G5+ZU8AapM9tx8mtKmxi7KJx080n
	 jFEzy2Trx7O2f0qOyE87cpDj0IqkksoQsNPZPMGHrp2VEVvrawg+tNKuRqZ0daQ0v0qmK
	 ivrGM8GG9dg/HxhVlgarIIro6BOLgkRrV5p4BUJ+OeVpXDKiEMFU5lpQbwDDqVDhGew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621046;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=r6WCKjgENDmsX7NMfuWNUcFl89xZaOdmj1xyoTWoQFg=;
	b=DyIzKdTPXrOT3/y6WyX73GzBERuXdV1OvQr2ZX3BXB6quN4WtrGTDME4q148UpxSJ8ww
	 S2TLbEHyCbIPrOT4hOTTiogaXuTcosLBbcmtcgnACPShs4Vuec+u3f1q/UJbRj3nU7Ib8
	 n2/7kqxWdibfVGVb3KE+/nLTvr2qiLTmce7MQ//bzGn4iYIKEMxLE+QlLealZZvJr29nC
	 KXGc11MxrmwS8unO/aVydy5qjBPX8ks0ELDT3xu//snf5vUb9XVPvTzpa00JIyzk05PTj
	 y7RP45UCpEi+pQcedsMxDW4H9PhVegD6y0gfBB0YkMMTukE6Bdv3I53FUBdCR5Dz/TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yj13cYnh;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCBA606A32E;
	Mon,  2 Nov 2026 12:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CCBA606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yj13cYnh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793621045; x=1825157045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tw/V1iRgBXWjdDg8hK0zOA1OT98+M1pN5R7jpTdg3N4=;
  b=Yj13cYnh700CjwHdZ6JN0qHzM4fwJIFoK8T54SvdjTjZmvtMLgwy4MJJ
   LE6Q+Wz1xeT8tK7hxBxCkfI5skwH7HV4RxYJlbHW0+QGFiSTCnNKMrS9V
   W9Nqh8YFFGEIAHVX2ZOeJarn9o4K7QOAVsE5Y16jzyYhjRQBQPShcVpOO
   TR025aky56ohXuIIwO8XWErVA9M4Nn3FWetBLP0a6MbVuyCEi1VBFTaE1
   WaISZDZMINwCYx4wUPz95Yd0uc7goK2ojZFX5XNrxoifwxFbPow1SSKIQ
   l+jzO7PceoINPscYw2DC/JlH3UKOnL456TUF5OSB14Sj/gP5St4ZPTY5r
   A==;
X-CSE-ConnectionGUID: fnTYEHGjTaelW4OqwqLGDA==
X-CSE-MsgGUID: Ce8OPC3qSAG0l0T1aSzL8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2319836"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2319836"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 04:03:54 -0800
X-CSE-ConnectionGUID: hCc5MsS2S5K59yHItaDu5w==
X-CSE-MsgGUID: G7USQoHBR5a1XHyiBtvKuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="5957575"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 04:03:52 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3CBF9121B6E;
	Mon, 02 Nov 2026 14:04:01 +0200 (EET)
Date: Mon, 2 Nov 2026 14:04:01 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: vd55g1: Support control events
Message-ID: <auh8MfyAMgjRLj6C@kekkonen.localdomain>
References: <20261101195006.220657-1-fernandorimoli11@gmail.com>
 <20261101195006.220657-3-fernandorimoli11@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261101195006.220657-3-fernandorimoli11@gmail.com>

Hi Fernando,

Thanks for the set.

On Sun, Nov 01, 2026 at 07:50:05PM +0000, Fernando Rimoli wrote:
> The sensor subdev exposes controls but does not implement the control
> event operations, so VIDIOC_SUBSCRIBE_EVENT fails and v4l2-compliance
> reports:
> 
>   fail: v4l2-test-controls.cpp(1108): subscribe event for control 'User Controls' failed
>   test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> 
> Add the standard control event subdev operations and set
> V4L2_SUBDEV_FL_HAS_EVENTS.
> 
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> ---
>  drivers/media/i2c/vd55g1.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index 69ffb3a..162c2d5 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -1447,7 +1447,13 @@ static const struct v4l2_subdev_video_ops vd55g1_video_ops = {
>  	.s_stream = v4l2_subdev_s_stream_helper,
>  };
>  
> +static const struct v4l2_subdev_core_ops vd55g1_core_ops = {
> +	.subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};

Instead of doing this, can you make v4l2_subdev_init_finalize() the last
step of the sub-device initialisation? It enables events if the control
handler has been initialised for the sub-device.

-- 
Regards,

Sakari Ailus
