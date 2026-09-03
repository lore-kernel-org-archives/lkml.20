Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC62455618
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788436647; cv=none; b=JcfQKe6qkC0N9Aw3JcMu6Eb+xAHyKUTqtMh/adiCie+x+VW/eJyo1Jn25FS8ulPcLf4QekUjY+hoQitUsbrFSMwr3nr9n5NDUCipDJjkvr47rFHJZAYpm7bow5DU5ktVXzs8gB+b4YKidd0OsJdHf3/tDoHUNQMbXMTWlSraXms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788436647; c=relaxed/simple;
	bh=0hA4nGdz9ozsITEfpn5E5cc7yB4ANSFzSicPsbfKMXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQEzrEOwpPr+ETxiLSugR+ePDWltusrXyntXRTT26T99k3ofh/uAQASBZCvfZ24KWwuPM/TkcuPYLw8pmwew3akIghAhgQ5cA9FPvQ/r4XSEPX0Ny8KnVhMRj6CkquWzDhpE5RjXxX/FB31HIX52+tWTK0zUHFNuh5KRwlBQViA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbyJ1BNI; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbyJ1BNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788436644; x=1819972644;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0hA4nGdz9ozsITEfpn5E5cc7yB4ANSFzSicPsbfKMXk=;
  b=EbyJ1BNIDsBf0zwlIwt5RQAeTdsf+SpXuuCS+6MmP1kZKn/MXfLbsB+s
   y7xSsI31+aVjOFXlxqzsByQlXAsBy5SpLQh7sXF/8nBamiZjGEwrmMUdh
   +qWOOtTUcZ1ZxxM8f0pGPx+BOlFUK6nwJpvMhcV/3ipFc414ZBNBOTrDT
   kXoPwdA01h26LW0N0BoC+T04/HDxdVM7EVJMA+T2FbLjaRiHemRsl0BY4
   l7sRoevX1A+/U7XbsS5jMla+b9RTp0EmcsqyOw+5apGHHRizesKAXc7FF
   6w0lWtdajVLg/fno9h7hFujryMxY7ROmuoZmdAnreO809663aH7m7Pbfr
   Q==;
X-CSE-ConnectionGUID: QYKe5Y6sT7SzHkaE9HvSZg==
X-CSE-MsgGUID: uMIeIbNIR1SwSc+OoXwI/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106436856"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="106436856"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:57:20 -0700
X-CSE-ConnectionGUID: oTlV7ctFSAm4FlZlW6gQeA==
X-CSE-MsgGUID: FZTKMkluTb2C4jX8xe3/3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="270239233"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:57:18 -0700
Date: Thu, 3 Sep 2026 14:57:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Li Jun <lijun01@kylinos.cn>
Cc: andy@kernel.org, geert@linux-m68k.org, fourier.thomas@gmail.com,
	bhelgaas@google.com, u.kleine-koenig@baylibre.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] auxdisplay: arm-charlcd: Use DEFINE_SIMPLE_DEV_PM_OPS
 for power management
Message-ID: <aplgmzSQnt2M2h7n@ashevche-desk.local>
References: <20260827002812.2457475-1-lijun01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827002812.2457475-1-lijun01@kylinos.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Aug 27, 2026 at 08:28:12AM +0800, Li Jun wrote:
> Replace the manually defined dev_pm_ops structure with the
> DEFINE_SIMPLE_DEV_PM_OPS macro to simplify the power management
> code, pm_sleep_ptr() to safely drop the references without
> triggering compiler warnings. This macro automatically handles
> CONFIG_PM_SLEEP configuration and generates freeze/thaw/poweroff/restore
> callbacks, reducing boilerplate code.

Pushed to my review and testing queue, thanks!

-- 
With Best Regards,
Andy Shevchenko


