Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360923AA507;
	Mon, 12 Oct 2026 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840298; cv=none; b=LzU3OASDLbvtk6b315pVvlSqkIBDZ/jLiE/IQ1kHf2mG9MT8NrumE1Pzxc620qPjdUARwPzdO5Su792HxxnTufu4RlLnlv8IzCrPGK1iRgdbPxPoa3UMS2SduAt/OADnKhpU3EcG+rMXBvKrJEcnisYwRbDq2wlqcoTuGKWKBes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840298; c=relaxed/simple;
	bh=0cp5hZ2iucO8/tXQJoU8nvd6BpH3JUU+IYecuY2GfZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4Qqy3gsvNteM2V+gQEo8Wdt/Atc/du0jsWT6JDbDHpLwksPj7xkTmQNv0L7aRPD84OcGXBKECBoiP74EV/KI2oAAKLffGOFXjAskKYrd4OyqwIjzyZv+jLx4d9juy8Jd4G7YBmY8xPKFxK34UgjYmklfYOvKc0BINI3wrOhFfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jcvroff5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jcvroff5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791840298; x=1823376298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0cp5hZ2iucO8/tXQJoU8nvd6BpH3JUU+IYecuY2GfZ0=;
  b=Jcvroff5GIOWXL2sZ0OecbVoFdl81iGNNYPLQr1KK9nwVMvwcy51EdI/
   Vf6vhDVqOD6IPnuBJvuFstMYoPHdHDG3Gzb8B3VbASXZXAV9tMcV4L4Fs
   p6BTzFd0nhQFW1wHUPYzRNRPv2Wey5lDSq97/XEQtXRlvPcWM4LCaZNY+
   A3REYxlJuaRwdNfIliWWUL02Rrt2stkWeWwPlvaiw55BVgculMva1f/zw
   CK8/NmZ4W/FtsO6NWaqWAeZSAh0Jh2TUdI6Q9JhCd33r/fXtXSHWaXzIy
   RutM5UZO5ctpMet2gnr3FP4aMX9K2uA/Thsh0GIohlndhWAUk4EvHIils
   w==;
X-CSE-ConnectionGUID: mzPvIgI/S7CEmSxNWlvM7Q==
X-CSE-MsgGUID: /OJmCYf4R96gzWZoIAKdvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="447699"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="447699"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:24:57 -0700
X-CSE-ConnectionGUID: FdVplnmlSbaFwrkKv3CYGQ==
X-CSE-MsgGUID: 7wB45rYsTmatw69rC8gqew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1049946"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:24:55 -0700
Date: Tue, 13 Oct 2026 00:24:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4] usb: hub: Set proper message when
 usb_hub_create_port_device() fails
Message-ID: <as1QJfxzU_cSDH2R@ashevche-desk.local>
References: <20261012092725.575885-1-wenst@chromium.org>
 <as1IrOAaNLuSqtEU@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as1IrOAaNLuSqtEU@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 12, 2026 at 11:53:04PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 12, 2026 at 05:27:24PM +0800, Chen-Yu Tsai wrote:

...

> >  		if (ret < 0) {
> >  			dev_err(hub->intfdev,
> >  				"couldn't create port%d device.\n", i + 1);
> > +			message = "couldn't create port device";
> >  			break;
> 
> We can now even use
> 
> 			message = "couldn't create port device";
> 			dev_err(hub->intfdev, "%s %d.\n", message, + 1);

Of course this has to be

			dev_err(hub->intfdev, "%s %d.\n", message, i + 1);

but in any case it's up to you depending on the template used for the rest of
the messages in this function.

> >  		}

-- 
With Best Regards,
Andy Shevchenko


