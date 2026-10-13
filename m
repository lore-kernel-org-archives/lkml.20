Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114FC3EDAA0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900916; cv=none; b=QZcJCpEKKC1w29LUk+VEeheB5N3gUBEPbDJ4zjJMxobQQE3rx1UN8kX3Q7jtvMi4pSkvFRcbMfOXOg4UadRLQYFa00e2Rxc/6845AvboIdKTj0mXSkvqyHcBWLrCQ+lF0RClE0LsSkWYumgNm5lJKbiQjg/bbLUOXOiXbZg31fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900916; c=relaxed/simple;
	bh=cgkk8QrlKLdZ7JSLU/PFwMs3Wl79B9R/+27rzDTNwdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEqpNXwKivVESfHzmuR5izE5+v3kOo7BLPPTYmp8mdAwnmlgJRPjtiY791prXGZ/JUHZkOV4pOdL4d0bKBHUrx8xDQf8ZTdHWuM27xjd5cQ93OwIyAB9vsBCcPk29N4vZpwzgZZaSomzJVf9M4s/L3jcGQ4h9w3ux+GG08CPlaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyWMITXy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyWMITXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791900915; x=1823436915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cgkk8QrlKLdZ7JSLU/PFwMs3Wl79B9R/+27rzDTNwdQ=;
  b=kyWMITXyxZ7bRsXyi/wiMxqsswymmSWSNTH+v/C51D1OykFEUIT9tPAp
   6pWTLZORXkeK/w6cKaNs7qLJN9W3xQMcoG+Z4GdoGoktqbQOrTPtAfCdG
   pvGbogvvLlJBhoIeoGZOTK+LvnIxb1PIHwncrNlN8vLnrBG4sMe32zIrm
   VqiWfcwj9kGkra8AXhXigAQVI7/DfnDI4aBqoMJfjcUtLm+YoJt/AksbU
   ZITgj3cRM7ag3iUAdAtxgpApLwqLOXuTwGq7yerlxX7TChW+Y7t8qMjKy
   bSQ+5RQehdYuOFI0O3d9tVHH0xjcdtaM5rQxK4Ja7drIJzjUCkwdkUXB5
   w==;
X-CSE-ConnectionGUID: uKYZvCFuRvyiGiirML8Mow==
X-CSE-MsgGUID: 3QZdlpIrSMug3nGDDMPJ9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="517789"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="517789"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 07:15:15 -0700
X-CSE-ConnectionGUID: 9ASn9lEORse25sGnFboHlg==
X-CSE-MsgGUID: TvitHJNwToe/Y6ui6NCAkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1115876"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 07:15:11 -0700
Date: Tue, 13 Oct 2026 17:15:08 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <as487H8-0Gc77mXI@ashevche-desk.local>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <arY6DfVf_9tZ_TCu@black.igk.intel.com>
 <arZTphXbVF5wagy2@shikoro>
 <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHreonFzhYk6fDswn7OVZfL3ybUHU15G3_q9+1sDhe8h670r3A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Oct 09, 2026 at 09:05:28PM -0700, Sam Agazaryan wrote:

> > I do not know how we end up here. The not-settled yet discussion is in
> > thread with aqt_dCazxTDR4cpk@ashevche-desk.local.
> 
> There has been some back and forth but I originally uploaded this
> patch set using
> notifiers for binding looking for comments on the revival of a
> potential upstream
> i3cdev driver - Meagan had been working on a similar effort with i3cdev
> using a different approach for binding and as of right now the bus notifier
> approach seems to be more favored, but not approved nor decided on yet.
> 
> > But I have a big concern about exposing i3c to user space in the way we have it
> > in i2c. Taking into account that i2c is an odd bus and might lead even to HW
> > *physical* breakage, I would thing 100 times before making the same mistake
> > in i3c. If you ever want to do this, this must not be user visible feature
> > (hidden under expert and debug and maybe even more guards for the starter).
> 
> Just to make sure we're on the same page here about this - is your concern that
> we can arbitrarily address any device on the i3c bus at-will as is the case
> with i2c-dev?

Yes and more as this bus (i3c) is still non-discoverable (am I mistaken?).

> FWIW, i3cdev as it exists in this patchset does not have as much free reign
> over the i3c bus as i2c-dev does over an i2c bus:
> 
> 1. i3cdev attaches to discrete target devices rather than exposing the
> bus as a whole.
> This means if I have 5 devices on my electrical bus that are up and operational
> and 4 of them have a proper i3c driver to bind to (E.G. mctp-i3c) then
> i3cdev will
> not touch those devices, only the 5th device without a bound driver and
> that would be via the i3cdev instance created specifically for that
> device. A matching
> kernel driver being found for a device later means i3cdev
> automatically detaches itself
> and makes way for a compatible client driver to bind.

This makes even less usefulness in my eyes. Immediate Q: if 4 already have the
proper driver in the kernel, what's wrong to make it for the fifth one?

What if the device needs more? Or if this is a multi-functional device that
may have driver for only one part?

What to do with the i2c devices connected to i3c bus in the compatible mode?

> 2. Master controllers are also not a binding option for the driver, so
> no free access to
> send out arbitrary CCCs, perform bus scans, do DAA work, etc.
> 
> CONFIG_I3CDEV defaults to n and only creates root-owned character
> devices for unbound targets, though if i3c maintainers prefer adding
> "depends on EXPERT" or expanding the Kconfig help text, I am happy to do
> that in v6.

I really want to announce that as debug feature. Maybe I missed some use cases
when it's the only way to handle the target devices, but for now I fail to see
that.

-- 
With Best Regards,
Andy Shevchenko


