Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794261955;
	b=LqK3CUZnMmS5Z+KSohDmS7un+AbzWH53YBlIiEbF+V75+wY+MEsmDm4wJqLB5rH/VCQQ
	 TblQgwAqsL12lyuzjBE1YvAeOD4xG4tt97grOFjN6+SvggLTR/dEJVA68fit+ixgscAbK
	 JOoRVV+RvT7Xi6hqZ34kvEf5C0YIyh8Ep6XRScZqpKDpozZ9T/oBkS2EJndY3Jyw/2nnc
	 p+TU6Piz1WTb2dTMx/9DbefURCcaJhc1mNCJCpcbhK1y/CGdIzq6LwOloz0WAyTvFUlBW
	 mA/Sm6/kvO6B0bUhoyJB10IGWMFMjuN6GEa4AFNhw6VJfKlQXf+VYd4+gkW94zFucow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794261955;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=/t589UiWWwPBpeNap8eorpHvLnoEI38RS6Gj6TGU3T4=;
	b=v5HsU5McnVNJDRVoaYfIiEPrWLbTPxS1hTbRKVlu/OEbyIwvdVcEi9QQsMK4847QXctL
	 plY19JbEeShMKI3DnemU6E/PLWznV5BSRC2EyByDFXNHoNAOhhdS/9Hb+3jWIRzXLidK+
	 qb9ybhQFHc61CRdDcxrORLd9jldXhXqEwFFt2+toDa9Ydloa7QksBJQURcFgtchbBsWLT
	 mh4MoQNJtk31/xeSRlIZ2ZOoPgJL+X9l2iHN4+sbtYdqujgmJbo9/AcDfUMOjUzL7Jcom
	 TvR31bl2rrSHFlIMNBQvb9ASG0fcnZlRYng4QhpbDlI97e3R22Xx0mrtSrV6fvwkiYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbuU83HV;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4700606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4700606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbuU83HV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794261954; x=1825797954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ym0jDnCGALxDNMgm30e0xqM905yi4RDT1pkp7/cO618=;
  b=dbuU83HViS7y2oUzsqPk6e9rX60qxFWtPH7JLl5Y8aoS/5oPUrL+ZVAz
   UR3zFGKU4VLNd3nHkkx9ZUPxS2yLwDT0z2QJkxnIF56pJZEDfB/X7Ioaz
   xZDABmQH7IbGNKdpJt3tS0K2Y0UZ528gyjRjVAt0zqAWYnvUPDFluxIPM
   m5RKZgwX3R+F7Hb3ZUEE2SscRAe7OHszqf1UalcoKzkfcMRCd0fFVsNwd
   2Ux9aO4voN+zOD/y6EQdvlQnRaiue7bApzQM+6nKia2Yr/wnOGQulrq2e
   32Iw4KOzQ4xnOLMM2/J1tzRX4Jb74VN8mWxu688OBsknupP3kA8GhmZX4
   g==;
X-CSE-ConnectionGUID: fP1Q07MuTni7Yb9FXc+IhA==
X-CSE-MsgGUID: jO5A+jo9Rj6fxQ4NjD8fsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2913979"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2913979"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:05:53 -0800
X-CSE-ConnectionGUID: ZZ7Z3tNQTqyz7ThSlP12eQ==
X-CSE-MsgGUID: iQUJfHslQumdJ0aw017jZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8121387"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 14:05:51 -0800
Date: Tue, 10 Nov 2026 00:05:48 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk 2/6] console: Introduce unsafe flush policy flags
Message-ID: <avJDvDl0Hcx_CEGY@ashevche-desk.local>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-3-john.ogness@linutronix.de>
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
In-Reply-To: <20261109123127.489676-3-john.ogness@linutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 09, 2026 at 01:37:19PM +0106, John Ogness wrote:
> Prepare for per-console atomic flushing policies by introducing a
> new nbcon-specific console field @unsafe_flush_flags to store the
> unsafe flush policies for a console. The policies are represented
> by bits, specified by enum nbcon_unsafe_flush_flags.
> 
> Currently it is expected that any @unsafe_flush_flags bits are set
> prior to console registration and do not change while registered.
> 
> No functional change.

...

> +	int			unsafe_flush_flags;

Why are flags signed?

-- 
With Best Regards,
Andy Shevchenko


