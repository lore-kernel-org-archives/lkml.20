Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E4F306775;
	Fri, 28 Aug 2026 15:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930621; cv=none; b=O9m2OH+9iakg9Kg2VuZ1ibKMn+IpfdHvNnYLbqkmxr7wcAiMFWDyw5HLh/vLZQ2KUzBDuF2BWJjYm4COhvAsBMY1tgV2qHEJipCleb0jymL0B7MGfO4CZdq4QirZwEvTf6Cw5HgPDUk1inj+7PzLwBpRyYm0jLXM2RvJuj+kOD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930621; c=relaxed/simple;
	bh=RIpq0fcu4z18g2ZR2/RqViNKQGjMYREZSLaDEfhbKgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFslJRach0a2+4NKgWp97Z3PEpDGd5l9t23un3xHIdTf+PJoCPGP5yyK3y2/PhXIbT1wUH9kEWJbNjFra9HIVp/4gjSbOqlcXXrf4eSJKGIcgWoZVmLRE76CzNAkjd9MstQcV4DoOYQQrV3jQCyu1fjp9p7YkntGdLqMpfxTCM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfpcNHIb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfpcNHIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787930619; x=1819466619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RIpq0fcu4z18g2ZR2/RqViNKQGjMYREZSLaDEfhbKgU=;
  b=LfpcNHIbBrB+0uqxexost+40kZlfe5zOl4yasAufKSKN3lbuQunRext7
   4mT8fLd/bPXga4Ujv9fVKG9nLtLVN3f+IaWehpb1ASW1O8gaV8IbWhmlJ
   ZfpSA7gGTxojo0s4JK58uKaPkMSBQA2KXpUCG19q+ZdYHonZ/Ssgdelqt
   8nE6vFIEw6L6I6PcVai9mx8a1FE5cVLrDqVNXsbF3otoHDe6GVjwolMYr
   0P9x6kH/nEykT17x6Uwk6CJE1lcfiWs5APYQ3HgD8cCa3yrtO+KOsyMp4
   cbh4seRs13U1SjLI8G5bg02oNS43vS7aEVLlj4laOACHrjqc8xkPZ79So
   g==;
X-CSE-ConnectionGUID: FWWabpmRSoO2vvexnmNAzg==
X-CSE-MsgGUID: iUGawxtBRSKR9GYZGIKTuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99104061"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="99104061"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:23:38 -0700
X-CSE-ConnectionGUID: 0shzixaHQRq7PiUb7/XZcw==
X-CSE-MsgGUID: 3r5CrJlHQ5ey/4C+sAu7fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="291680592"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.176])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:23:36 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A5D0D121BDC;
	Fri, 28 Aug 2026 18:23:32 +0300 (EEST)
Date: Fri, 28 Aug 2026 18:23:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Robert Bozik <robertbozik@gmail.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] media: ipu-bridge: Add OmniVision OV32C4
Message-ID: <apGn9PvuUw_AODd-@kekkonen.localdomain>
References: <20260828132104.21473-1-robertbozik@gmail.com>
 <20260828132104.21473-4-robertbozik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828132104.21473-4-robertbozik@gmail.com>

Hi Robert,

Thanks for the update.

On Fri, Aug 28, 2026 at 03:21:04PM +0200, Robert Bozik wrote:
> Add the sensor configuration for the OV32C4, matching the _HID the
> sensor enumerates with. Without this entry the bridge does not build a
> software node graph for the sensor, so its driver defers probing on the
> missing fwnode endpoint forever and the camera never binds.
> 
> Assisted-by: Claude:claude-opus-5 sparse
> Assisted-by: Claude:claude-fable-5 sparse
> Signed-off-by: Robert Bozik <robertbozik@gmail.com>
> ---
> Changes in v2:
> - Signed-off-by placed last in the trailer block (Krzysztof Kozlowski).
> - No other changes.
> 
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

This bit could go to the driver but the IPU bridge isn't the right place to
document this.

> +	 */
> +	IPU_SENSOR_CONFIG("OVTI32C4", 1, 400000000),
>  	/* Omnivision OV5675 */
>  	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
>  	/* Omnivision OV8856 */

-- 
Regards,

Sakari Ailus
