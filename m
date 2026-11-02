Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621313;
	b=riCSW9LTzawIKFMfpjZQG5bkbR193EXP89TnnVQDUWq+mm6HMljhWqvvB0dBcZpAXzvV
	 WeYWNHQ5Xhw59CAkQ1ME55d3dhB/kq4pLxzDEmF98KlI9sGA79CRdy7qWiJBY6CIZ03tX
	 sWkmJfQEb5bnmtMj4xq4J1VmQX2HpnJceC+m9YRoNcjwn0tY9xIg6R13rNvgPWUvUjIww
	 viSzZqAT8m1RrIDaBLfJpwNRJOToPqz54t5AyCAOMhlNPkyyIQzcd6XVvZfLHjnPYy67k
	 H+on+HwlR1cliJOwCL8V5wOoFgtJlaMGm7/GimhQouegrqEklATNpWuom6ADiqElKqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621313;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=By66bYTFhBThGs/zLzCMxno1bj2bflp/WhHlT6imhVg=;
	b=QFWKuewdA7/xS/y3KuzriZzgDuELeVKjZBHgHzIR1FgLQQKpCsykjv2YLJeVNNHVyAOs
	 Fo0Ekqv/4RGae9aOIyjXajfNqxVJf5gOv0z8G827eES6iMhGinJuf2OAfvZM49Bacc/av
	 Yl63srJHziAqn9GqelyQVJmbjKZoYqLc/I3cqnHIR1HRa8Rp0Bh2laLZ7kIBe2xsfGw3X
	 vmW4jHFOOXPKkvkjQ0fgWNYv5E2sfNBLDX1xhBdMZ5Zg2Oj5WpKn187O9kx0j6zDh+DF6
	 ds6Pso9w8KfxqHpAUOH/q/rPOVtTe2Dyj+uMc28V88lrAQa5AG0mC/fyr01YCnQDfZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qf18+BzM;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19287606A324;
	Mon,  2 Nov 2026 12:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19287606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qf18+BzM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793621314; x=1825157314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BAs5hO5y59m2LjTMW/RiLpKnfPIZEU4eU5HLaRKeFdQ=;
  b=Qf18+BzM+uC2dwm6mu6jrG3aY7lT7n8Pt1ZYhN0kq7FO1xEvLl1o0StI
   Qru4Sw8o2tJ8yfv+hKfXgDpUPyaY5PCdPSa0dsCtyOIoVVlQ9XjJFde8s
   f7m4BYCTEYTnGuA8hKQlsr2wBoBveyaaoIKa+rKQ9A5XRCxx9CLojG+OA
   g+sQlV4dFh0VBDSapqEc7xEyCaCtudfaTeJLpIkOFchW1nZ2CiQQ4ZiQa
   cgo4jMjknLDMwNgShRsQhspnxYJvJKHNH3yTNmhZNA2zf9A5kXI/+QwDB
   FH+MaLh245qgL2vSY13hdAqYwowzC6GbIwhExr6GyYZJBfDBe0MaAnIKM
   Q==;
X-CSE-ConnectionGUID: cLAZQVbgRyOi+aeurqyVNw==
X-CSE-MsgGUID: KOhnVy4kSXejMhHoHEDZ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2303783"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2303783"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 04:08:33 -0800
X-CSE-ConnectionGUID: XNAWffhlTJ2foie7jU52tw==
X-CSE-MsgGUID: 1rxzJJ17RPCYauAPqimt+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6233528"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.242])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 04:08:30 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5599B121B6E;
	Mon, 02 Nov 2026 14:08:40 +0200 (EET)
Date: Mon, 2 Nov 2026 14:08:40 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH v2 1/2] media: i2c: vd55g1: Mark the AE lock and bias
 controls inactive in manual mode
Message-ID: <auh9SHrLKHTjENwY@kekkonen.localdomain>
References: <20261101195006.220657-1-fernandorimoli11@gmail.com>
 <20261101195006.220657-2-fernandorimoli11@gmail.com>
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
In-Reply-To: <20261101195006.220657-2-fernandorimoli11@gmail.com>

Hi Fernando, Hans,

On Sun, Nov 01, 2026 at 07:50:04PM +0000, Fernando Rimoli wrote:
> In manual exposure mode the auto exposure lock and bias controls have
> no effect, and the driver marks them grabbed. The grabbed flag means a
> control is temporarily locked, for instance while streaming, so
> v4l2-compliance fails on it while the sensor is idle:
> 
>   fail: v4l2-test-controls.cpp(134): GRABBED flag set
>   test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
>   test VIDIOC_QUERYCTRL: FAIL

Hans: v4l-utils commit 0a4d4accea726 adds a check for this but the commit
message doesn't explain why. I don't think grabbing a control is a bug as
such; it's normal that if exposure is set to auto, you can't access the
manual exposure controls.

> 
> A control that does not apply to the current configuration is what the
> inactive flag is for. Use v4l2_ctrl_activate() instead.
> 
> Setting the controls in manual mode now stores the value rather than
> returning -EBUSY. That has no effect on the sensor:
> vd55g1_lock_exposure() writes only in auto mode, and the bias sets the
> auto exposure target, which the sensor uses only once auto exposure
> resumes.
> 
> Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
> ---
>  drivers/media/i2c/vd55g1.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
> index e3939bb..69ffb3a 100644
> --- a/drivers/media/i2c/vd55g1.c
> +++ b/drivers/media/i2c/vd55g1.c
> @@ -1503,8 +1503,8 @@ static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	case V4L2_CID_EXPOSURE_AUTO:
>  		is_auto = (ctrl->val == V4L2_EXPOSURE_AUTO);
> -		__v4l2_ctrl_grab(sensor->ae_lock_ctrl, !is_auto);
> -		__v4l2_ctrl_grab(sensor->ae_bias_ctrl, !is_auto);
> +		v4l2_ctrl_activate(sensor->ae_lock_ctrl, is_auto);
> +		v4l2_ctrl_activate(sensor->ae_bias_ctrl, is_auto);
>  		break;
>  	case V4L2_CID_HDR_SENSOR_MODE:
>  		/* Discriminate if the userspace changed the control value */

-- 
Regards,

Sakari Ailus
