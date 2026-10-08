Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125314973BE;
	Thu,  8 Oct 2026 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456252; cv=none; b=cEMgDALw/aCZs81Ro9l+bNPkL/d7qhBq81FIFdP3wJxoZL+n4xMPeyEfMMm06uSNsEwtun9acMVH5vXHy46dJdv2uz61nD6J0dxDtACf5Pt0nseNXQ4nUHjXxaRy3yfjl5qnV7ZPqrnMLKGegSRypa6Pl4h8Zq6wtELF9RzfxXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456252; c=relaxed/simple;
	bh=YVGbu9yXtMkMZP+ycnx2uyUmtCMMWkscTD0bTsWZDsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqWFneRyfNPbEMK4hXjct8ugSMIMmtVCd3QAfI1nneXB9H5JdsQelMAVtsroizuXfTr57NElslAKU4UsTWz2nynxK9jyZz5GCltznEg7Jz0+Ma2OrGtOnVBKOu65PI0Njmsz1qawUk43EA4cQrxJsAAg2LDKchZxM6xdWHuIEGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEWP5UAu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEWP5UAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791456249; x=1822992249;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YVGbu9yXtMkMZP+ycnx2uyUmtCMMWkscTD0bTsWZDsg=;
  b=jEWP5UAuoXQBqy81VLpDtCKVJ1AnioLOAADi/maveYJVr4mh3Mh6IG/L
   FqittL+kYMiEfSoQzCTLZ42/V4JeJCPHFy3s1PtSiSRSwal6O/CkxeBJW
   xplc0L+77+S7GnnFQyM87CAtVL2Et21W4TOGDB/btK4kpvTjxITigSN0p
   Adl3gX1mPt/DPJ2HD2f81oZLR31Wm/hcXlUn4pZ85RSrioYtPJCXygwSG
   y5syZxJ9Ae3wOZrSTRCK+vrY/S+dcXpZx2hSkBlL1UM4mG1O4wsy/NEFd
   WXeuzoRo4J28ahFY+KnkCudND8008yZ++TFlahkMn3Pt+Y/sexbLhPif3
   A==;
X-CSE-ConnectionGUID: yov0PFynTzaaP7oPBC0kqA==
X-CSE-MsgGUID: JQwCRbdaR0iZAHh7SBo7NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="119248"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="119248"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 03:44:08 -0700
X-CSE-ConnectionGUID: BZVu6oN4Tdu5kdSVoq7I8A==
X-CSE-MsgGUID: 1LXRSXMYQly4ASgXGOmzxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="366564"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.95])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 03:44:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 322B4121BA6;
	Thu, 08 Oct 2026 13:44:07 +0300 (EEST)
Date: Thu, 8 Oct 2026 13:44:07 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nicola Fiorillo <nicfio@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: v4l2-subdev: Fix NULL pointer dereference
 in the EXT_CTRLS ioctls
Message-ID: <asdz93f28oRR-WPu@kekkonen.localdomain>
References: <20261008042600.275884-1-nicfio@gmail.com>
 <20261008042600.275884-3-nicfio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008042600.275884-3-nicfio@gmail.com>

Hi Nicola,

On Thu, Oct 08, 2026 at 06:26:00AM +0200, Nicola Fiorillo wrote:
> VIDIOC_G_EXT_CTRLS, VIDIOC_S_EXT_CTRLS and VIDIOC_TRY_EXT_CTRLS on a
> sub-device node pass sd->v4l2_dev->mdev to the control framework.
> v4l2_device_unregister_subdev() clears sd->v4l2_dev before it
> unregisters the device node, and nothing serialises the
> video_is_registered() checks in v4l2_ioctl() and subdev_do_ioctl_lock()
> against it: sub-device nodes have no vdev->lock, and unregistration
> would not take it anyway. An EXT_CTRLS ioctl on a file handle opened
> before a driver is unbound can therefore dereference NULL:

Unregistering a sub-device node isn't doable safely currently. Addressing
this properly requires much more than this patch does, and also I'm afraid
this patch isn't part of properly addressing this either.

-- 
Kind regards,

Sakari Ailus
