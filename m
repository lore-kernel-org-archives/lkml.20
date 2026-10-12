Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BCC32572F;
	Mon, 12 Oct 2026 20:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791838386; cv=none; b=oO7jKc1z4okpxEo9C3wdpBFiaEE66RYoWOKRYfMSVR8FLp+c2uCEwScKjy2vT2TMQF5Qg/pHUriuX7D+4hiErL5JZmeapatipHLyY0LW9vok++s2smKjjJ3RoK6j+Foot+ygGGO67RvBfgLPkStjx3ghAa31Z0TPDN02iJccsNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791838386; c=relaxed/simple;
	bh=/Xk2xrzetp7/wYFtgK81r8fmfppJMzdQq6QF64CNJeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIqRQdNv9kQbdvVKB2gbC3xg09J+Lgi/0dFOieqsIOKpobXq9+zhLfmF+QttSaMcr/C+fwQ/s3Y7rlT5QerOCwIxsqt9+33o4RqwXuoUFRTkXXQ00z2x1/WBMwZsZyHGM3tJRPBkZWfWpW9PQAJ2vDIZyRzjdavci0VWopgkKBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUX2Y3Nb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUX2Y3Nb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791838385; x=1823374385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Xk2xrzetp7/wYFtgK81r8fmfppJMzdQq6QF64CNJeI=;
  b=UUX2Y3NbdIHf5Y0DD7QVnQiTSdoghQjPVKe0p1quk9Jk7R90ogamsKW2
   XkUQm6T9UpJ7qflYo2zaPaFvVSz4tjHpvzKMk/rsy9hJtSbDDU3uznEIs
   2ZF1spt3uriJDxLNHBkhJOVQb6FKl+OpWFyct5D4SJbzB3GHBZ3M7vTNe
   8iAzFy0XXD99dJQXuOL4cBmodEDOrxpqxX59v3PUFXQirXhdOv46e6Ge4
   UPAzZnTh+Io6dxC286YijtKq1NjeSFGg/BLzyZYI/dnC4QXAkBslsUPQM
   id6mxhYJsyINhuS+vc4QidVHvYZX2rTCht/sP1Kg4gdDDWDoNplVtBP+G
   A==;
X-CSE-ConnectionGUID: s6UQOOtxRY+kQd3VIP1+UA==
X-CSE-MsgGUID: jkjL/VhqQrKP5yaj/mlRjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="443381"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="443381"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 13:53:04 -0700
X-CSE-ConnectionGUID: 2lpeyVj8QbefWzd7vOWdHA==
X-CSE-MsgGUID: 27BU7fyCSjiqdBfIB896nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="962665"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.179])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 13:53:03 -0700
Date: Mon, 12 Oct 2026 23:53:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v4] usb: hub: Set proper message when
 usb_hub_create_port_device() fails
Message-ID: <as1IrOAaNLuSqtEU@ashevche-desk.local>
References: <20261012092725.575885-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012092725.575885-1-wenst@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 12, 2026 at 05:27:24PM +0800, Chen-Yu Tsai wrote:
> Right now when usb_hub_create_port_device() fails, it prints a separate
> error message to say which port failed, but otherwise leaves |message|
> set to the default "out of memory", which is somewhat misleading.
> 
> Set |message| to an error message that is more specific to this error
> path instead of using the default "out of memory" message.

...

>  		if (ret < 0) {
>  			dev_err(hub->intfdev,
>  				"couldn't create port%d device.\n", i + 1);
> +			message = "couldn't create port device";
>  			break;

We can now even use

			message = "couldn't create port device";
			dev_err(hub->intfdev, "%s %d.\n", message, + 1);

>  		}

-- 
With Best Regards,
Andy Shevchenko


