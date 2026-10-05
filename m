Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4DB47A887;
	Mon,  5 Oct 2026 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791197438; cv=none; b=aEEf/84oEeZDNwj9MxQDfcsUYvKUL2UPKntvyU+0sA3pkyA82JB63S2DVScGYJC45X0iDQiiJtP3URkfP2jq0Ywa/1j/VaCLZLkgzZ0eSbOOrcrfqOGNMpRHdaS8mcqjIL24SCtiXYOI6td9wb/7b1PjjM3MOWlIuAzvMALODi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791197438; c=relaxed/simple;
	bh=ZSzHHrbXNPF8oF4l9pXFk/8HIQuqCE2kcP9X0fXR5Qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cH4nDOtjmiy82PQCw/iq/tOdgpnB+U38ugcfg5YdxQUpxiijWkbe7ZRstxIlR0hLdhAwDjG2IXLbR/N6YH6gzK5wuJHGqYPCPMSjhnJEr9lUdrwtfNl7LCuZXquqYKx7JLCiBVBXoTzae7sZoBvXyosIv0vd1odKhANywn+B+fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BL1DSSP6; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BL1DSSP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791197436; x=1822733436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZSzHHrbXNPF8oF4l9pXFk/8HIQuqCE2kcP9X0fXR5Qo=;
  b=BL1DSSP6A7leBNGmlvFXBa+fj1bcY5MSdv8U4cORSzNrGZKlyiOvOvO9
   yWjkcS3MgGhISlZY6sL/W7hTitfC6waGj+thjWktHwBSA/vjyIV+cBXYc
   9Flnnm3vqtuky0F3e8c1WCOSwTPOfpkZ1xuvJBBASZzUGfJceR4Px3RNK
   joEd8yedkh1arzjsTABrIz8yffmzjlyJNWvgklMJ0pFVQkP+UvOhZjrWV
   zu/eIu9G2aJsW0BSoNVd2x12PUSBs3nG4NE0yHfUwxU48xqLf87RWeRAh
   ZKt+iCbLH0/iUtRpyYTOiG7fxIJf8ZjjBuOI9CYCSP2W+XislIVlr2ZAx
   A==;
X-CSE-ConnectionGUID: FVaDOAAdRqyN8cE13VqNcQ==
X-CSE-MsgGUID: fpmNx97wSZ6DbwtwdJYezw==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94738509"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="94738509"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 03:50:36 -0700
X-CSE-ConnectionGUID: 3Lq6UyQBQAu4UMNdI9PuHQ==
X-CSE-MsgGUID: ZA4WTWF8TPW4aRr5fzLvnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="276347153"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.157])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 03:50:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2FA4D11F73F;
	Mon, 05 Oct 2026 13:50:34 +0300 (EEST)
Date: Mon, 5 Oct 2026 13:50:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Robert Bozik <robertbozik@gmail.com>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: ipu-bridge: Add OmniVision OV32C4
Message-ID: <asOA-hnrSKBjsnbF@kekkonen.localdomain>
References: <20260826072002.14357-1-robertbozik@gmail.com>
 <20260826072002.14357-4-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826072002.14357-4-robertbozik@gmail.com>

On Wed, Aug 26, 2026 at 09:20:02AM +0200, Robert Bozik wrote:
> Add the sensor configuration for the OV32C4, matching the _HID the
> sensor enumerates with. Without this entry the bridge does not build a
> software node graph for the sensor, so its driver defers probing on the
> missing fwnode endpoint forever and the camera never binds.
> 
> Signed-off-by: Robert Bozik <robertbozik@gmail.com>
> Assisted-by: Claude:claude-opus-5 sparse
> Assisted-by: Claude:claude-fable-5 sparse
> ---
>  drivers/media/pci/intel/ipu-bridge.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
> index 1bb3a3e98..7d3c7e09f 100644
> --- a/drivers/media/pci/intel/ipu-bridge.c
> +++ b/drivers/media/pci/intel/ipu-bridge.c
> @@ -93,6 +93,16 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
>  	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
>  	/* Omnivision OV2680 */
>  	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
> +	/*
> +	 * OmniVision OV32C4.
> +	 *
> +	 * 400 MHz link frequency, i.e. 800 Mbps per lane. There is no public
> +	 * datasheet; the value comes from the vendor Windows driver, which
> +	 * carries it as MipiBps, and it is confirmed on hardware: the IPU7
> +	 * D-PHY locks and the sensor streams 3264x1840 at a measured
> +	 * 30.00 fps, matching pixel_rate / (ppl * vts) exactly.
> +	 */

I don't think we need this comment here.

> +	IPU_SENSOR_CONFIG("OVTI32C4", 1, 400000000),
>  	/* Omnivision OV5675 */
>  	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
>  	/* Omnivision OV8856 */
> -- 
> 2.53.0
> 

-- 
Sakari Ailus
