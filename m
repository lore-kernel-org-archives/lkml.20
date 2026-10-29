Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282661;
	b=aoX8+g9GQwouujQC9Y6l0dmsv36slFDWRXrliHDrpj+khGo9R48gym7OFgPytpkswYap
	 Z31sZQMUXe/7MW+851FTTUcqDcmVi7x8E47g1OZ3V8zfvEM1RemUEb6kDIYW7MeQxwTMe
	 9rnDA7vGWTzw5yj9DGEK4QaId8wbM8qWlEiBHPIymSxNAzQuZ4pufxwntm1GFSraBR4Hv
	 YF7ygc/q9S+aNTCCfFmpI1Tukal/GlapW8UEzP3Y3P9lIMUqS3/xVsu1K2PRfwIIZjpn5
	 K6s8VBoBIAfmph2ubBOkAEmQPM3qmOygD4jNz5CG3SqVUSD0CcEfxKAlia1aTe3cl+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282661;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=GHUMGEdyC276HDhVeE4eFAKQ8gxK43dXDeTPJnFTDjE=;
	b=uNwVpbpBMWEkgCh6r6XdQezqPgt0KJWek3hz9yW6eBpqrOEfoa7uGI9sOFhDhfGK9A5Q
	 IsURXqD+0cDBF2DNR3LFez3U6f8vcA6KrNKPDO+EPbLXHENu74WyHGcfbFxjpJf+/Hzz3
	 AmT0mN0fZUBRazthpcThXUFoT5oZ69JNfMQJsVY3jrq5oo3fvsroxbL+7od2oEdJgpf6V
	 asc9dKXqV7Bv8zjmmfvb+V4tXB2+XqQoT23sLReQTRF0lKlo8qNd5Bcz6EQnqoOIcixXS
	 gbSEQZl68hxILbHUonoMBSFF6Q5UnlhXCbXJjX9MZQYT2vsOPOTCrE8Fd68OHRir+3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k8tyWfLK;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4666F606A31A;
	Thu, 29 Oct 2026 14:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4666F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k8tyWfLK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793282660; x=1824818660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bQ5OUJWFYkxc3nRdKrCXbaenz2Nh7NiAYBBqw1kij0c=;
  b=k8tyWfLK0LAmzzMo6EDLg9KI8T5icjKS8JCLmFxfuM3YiJ47LPeWWcmk
   9AfSDf/Tl5K+3bjU9L6rKAtbV3K5f8kCKF0jSHWGEbSip8Q6QmZ1SGXmQ
   fmpn3/dji6gh8HQ65JIhAcDyFal49haHfdHgM2vrem0YTlCPnZUnJMtF/
   NvEfx8eEAf9IjOkfqnCnB3Atwv5Lw9LZel9rSVgj/Td1HhUIQI3OGKq64
   ff2KQM25ewZ8mYVl3DXoRy/05bcqw1zo5DlrOZvMlltRxOHrp+fxYC2my
   BwqGR5t7laux5EgMV75RXbIeFhoEyk2gonMWA7pPHedW/ykGdUEHoTC8W
   g==;
X-CSE-ConnectionGUID: uxzzl/0ZQA63t290FVx9sQ==
X-CSE-MsgGUID: 77hTxJvNRKa36ONbXEmR2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1908366"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1908366"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:04:20 -0700
X-CSE-ConnectionGUID: ckuPjJMuSdy/tT5qWzBsWw==
X-CSE-MsgGUID: IBVZkT9pSqyMPjIJ9gTHCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5701409"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 07:04:17 -0700
Date: Thu, 29 Oct 2026 16:04:15 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Antoine Pichot <antoine.pichot@gmail.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	mchehab@kernel.org, hansg@kernel.org, dan.scally@ideasonboard.com,
	djrscally@gmail.com, dmanresa@gmail.com,
	dave.stevenson@raspberrypi.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 9/9] media: ipu-bridge: Add a rotation quirk for the
 Surface Book 2 and Pro 7+
Message-ID: <auNSXxxqA75T6Xwm@ashevche-desk.local>
References: <20261028112154.855185-1-antoine.pichot@gmail.com>
 <20261028112154.855185-10-antoine.pichot@gmail.com>
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
In-Reply-To: <20261028112154.855185-10-antoine.pichot@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Oct 28, 2026 at 08:21:54PM +0900, Antoine Pichot wrote:
> The infrared camera of the Microsoft Surface Book 2, an OmniVision
> OV7251 with ACPI ID INT347E, is mounted rotated by 90 degrees. An
> upright scene appears rotated 90 degrees clockwise in its frames, with
> the top of the scene at the right edge of the image, while a frame
> taken at the same moment by the colour camera next to it shows the
> scene upright. The degree field of the sensor's SSDB buffer in the ACPI
> tables is 0, and so is the rotation field of its _PLD, so
> ipu_bridge_parse_rotation() sets the rotation property to 0 and
> userspace has no way to know that the image needs correcting.
> 
> The firmware is wrong here, and ipu-bridge is where the firmware data
> is turned into the rotation property: it already carries DMI (Desktop
> Management Interface) quirks for sensors mounted upside down without
> the firmware saying so. Add a second table for sensors rotated by 90
> degrees, checked the same way, with entries for the Surface Book 2 and
> Surface Pro 7+ infrared sensors. Following
> V4L2_CID_CAMERA_SENSOR_ROTATION, 90 is the counter-clockwise rotation
> to apply to correct the image. The Book 2 entry matches on the SKU of
> the 13 inch model, the one checked; the 15 inch model has its own SKU
> and has not been checked. The colour sensors of this machine (INT33BE
> and INT347A) already report 180 degrees and are unchanged.
> 
> D. Manresa measured the same rotation on a Surface Pro 7+ (IPU6), whose
> infrared sensor is also an INT347E: an upright scene comes out rotated
> 90 degrees clockwise, with both flip controls at 0 and the firmware
> reporting a rotation of 0, so the Pro 7+ gets an entry too.
> 
> Tested on a 13 inch Surface Book 2 (SKU Surface_Book_1832) with a
> 7.2.12 kernel: V4L2_CID_CAMERA_SENSOR_ROTATION on the OV7251 reads 90
> instead of 0, the colour sensors still read 180 and the orientation
> controls are unchanged.
> 
> Link: https://lore.kernel.org/linux-media/6ae0f151.0f9a9df6.1cace3.5239@mx.google.com/

Add a reference here

Link: $URL [1]

and use [1] in the text above.

-- 
With Best Regards,
Andy Shevchenko


