Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B0418353;
	Wed, 23 Sep 2026 06:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145305; cv=none; b=VlAsIecK+V+A7vUBGtrQkSe3cMnJeIuCQc9zMBAumvsaOd6aOg8hHgbdojVIMItq1S5lLoyYM5EoamEs0RKWQcvQIJuBJf3cb1WGn3xdHB0FdIKo+0QaxlySGmtc5HEn1SFzl1FIZ5Eo0Y++A8j8p1fboN7aj1BPGvnzOYte6Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145305; c=relaxed/simple;
	bh=GWYsgKK1XWP4mP4XbwohBZs+CPoI7Mu3Lzvr7Bc+R8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=baXzB/yv2XN8O7q0fiBqPU81jZZuEnbsQdbr0/AXTdOr488iOcZc1vSE+79GKGQAGRYqhDPIQC8r6ElfDgbA5uPbPjIpoZA+y9/HVQGFD7holnsIvmgB1WqOk6Zd4QKuXPPvXzeJpG2+vSCGj2WneU7kc34kKYvBF4DCYSTA6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBZo47nS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBZo47nS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790145302; x=1821681302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=GWYsgKK1XWP4mP4XbwohBZs+CPoI7Mu3Lzvr7Bc+R8M=;
  b=CBZo47nS67maDYbTxqy4dbU2InO8SRerp/y8revrnMfyQ4nh2wO5ZaXw
   pFCAMBfurXsLKnFAlnH8gOYnDsjihZ2O3P+Sn29hZtlTx/+CBUSvkZab4
   8Cp1DjCZWt63r81M5U+eBCz2JILSaZkVrVnZdOmWIG/Z5rOG6+2HmuxaX
   qOqll1FDAhxMC05biXwYtfd3U3AyghXen9i5SIeB9QA7dPKD8Kmkn9svw
   L1CuYNZDz9mp/ra/10tRUdHEYkMSwNE7ldxxR5XsFnViByFhuh7bi76zs
   yNEWuQMSmglptc5kIkH8M4thlCB72pNwIpRoKAYC5UhU7OgETz/pCufKW
   w==;
X-CSE-ConnectionGUID: A1LpSN3kQNy04vUnA8g6Hg==
X-CSE-MsgGUID: 2KlHMvENQdeZQ1GYFqHOQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="94629195"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="94629195"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 23:34:56 -0700
X-CSE-ConnectionGUID: n+bhhXS0RYid28BphX9BBw==
X-CSE-MsgGUID: 8ORw50uaTlyKY5/lJYxudg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4758762"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.208])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 23:34:54 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 1C34A120370;
	Wed, 23 Sep 2026 09:34:54 +0300 (EEST)
Date: Wed, 23 Sep 2026 09:34:54 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?C=E9dric?= Bellegarde <cedric.bellegarde@adishatz.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>
Subject: Re: [PATCH] media: v4l2-async: link ancillary device runtime PM to
 the sensor's
Message-ID: <arNzDkG8JmIWedwF@kekkonen.localdomain>
References: <20260922-sensors_pm-v1-1-05adf2098b5e@adishatz.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260922-sensors_pm-v1-1-05adf2098b5e@adishatz.org>

Hi Cédric,

On Tue, Sep 22, 2026 at 09:39:12PM +0200, Cédric Bellegarde wrote:
> When a sensor's fwnode references an ancillary lens or flash device
> (e.g. via the "lens-focus" or "flash-leds" properties),
> v4l2_async_create_ancillary_links() already creates a media controller
> link between the two entities, but their runtime PM states remain
> independent.
> 
> This is a problem for devices such as VCM lens actuators, which are
> typically spring-loaded: holding a position away from the spring's
> rest point requires continuous power, and the position is not retained
> once power is cut. If such an actuator is allowed to runtime-suspend
> independently of the sensor, the lens can drift back to its rest
> position during an otherwise active capture session.
> 
> Add V4L2_SUBDEV_FL_PM_LINK to allow an ancillary subdevice to request
> that its runtime PM state be linked to the associated sensor.

Interesting idea.

The IPU bridge has created such a device link between the VCM and the
sensor as on some ACPI systems the VCM is in fact relying on the power
resources of the sensor. But to do this everywhere?

VCMs traditionally have been powered through opening their sub-device node
and that hasn't been exactly neat API-wise. It has been practical still,
AFAIK, as in order to control the VCM, you have to have a sub-device node
open.

This change also does mean that if the sensor is powered, even for
always-on use cases that generally consume very little power, the VCM is
powered on as well. VCMs still typically consume very little power if the
current is configured to zero. Maybe this won't be an issue? Backtracking
from such a change wouldn't be simple, and might not be possible at all.

There wouldn't be a need for a sub-device flag and this would be done for
all VCMs based on the ancillary link.

I wonder what others think.

Cc Laurent and Hans as well.

-- 
Kind regards,

Sakari Ailus
