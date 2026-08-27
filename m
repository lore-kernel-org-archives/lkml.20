Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5879442FD4;
	Thu, 27 Aug 2026 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832883; cv=none; b=A2XG7IatqrRkVkoWkeo0pCeg5DHJf29szCSmCZPrVlb8/wfQXi8Unp7keseyeyx5CYwB0/oJ+cl9KBtj+qNCBvS6oLz50a54V1Z22s+pJeYRKYGbhDO+gB82WOHke6+z4e4cOFpRpuO8sG02HaTvqoogLpL1L+RQ2Yedq5LabtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832883; c=relaxed/simple;
	bh=YZHVCcoZ9q4zLcpJ0gWnJSIpwEaTpCb1S88dMHoACcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqDvSY+3vmO/XHmM6vpQ7agQ0NOu64Dho+YLR9Vm77asZTQmKl586PNCmGnX6YT8YqofGh7ZlReR3tFAYem6vYcGR7XY4ETJGQolR+vB5dKu5/yKfQvrZRopa7Qpjurcg8K1B3+1YH69w+QvwYYXKlORSdvu/sVfn58j5AWirUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z8tMHyv4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z8tMHyv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787832881; x=1819368881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YZHVCcoZ9q4zLcpJ0gWnJSIpwEaTpCb1S88dMHoACcY=;
  b=Z8tMHyv4u2k01U0UyFua2o07qpuzI2HPUYH0Wd/R23Mkamb/XGoVox2F
   yYsWS6lQafvwklU2sQbTFpGbDlDMltm4B2Fii8J/Ky7vXFP+rW4x+VX56
   KkjPUB4PcSAtHMZF6VXo72gg6eG9QWw1ox1Jytqjzw3rGomPLa1EOl55G
   2+HYdyiMH+HD1v4BzBn/zUz5mRPi2N8b4Q2y7cMsfTkSnRseYqNsctJ+T
   M3IAXlatYECfno6lpllRpnoXJ8OppR+jJy4HSPr3WFG4HklHzf993kqNy
   FpZjcIewk/v2J44yFd7KI9gAreiqcvEFALjguEaXX8CqDaws4wWGJZDOy
   w==;
X-CSE-ConnectionGUID: +vGUVd03TwmsqXQDm5z2ig==
X-CSE-MsgGUID: SB+vVlp3RXOJf9Rqrt9e1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="87465345"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="87465345"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:14:41 -0700
X-CSE-ConnectionGUID: t8Cf6dpjSDGPwoS6YEyz5Q==
X-CSE-MsgGUID: 7RijJa5iSvWhav/hJCGdVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="267279891"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.174])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:14:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 962CE120DF1;
	Thu, 27 Aug 2026 15:14:34 +0300 (EEST)
Date: Thu, 27 Aug 2026 15:14:34 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] media: i2c: Add Yoga Book camera ACPI IDs
Message-ID: <apAqKrNsZbd4JE-b@kekkonen.localdomain>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260826132256.3343451-3-mauriziocasciano7@gmail.com>
 <apAKR_wiAUhI0ZQn@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apAKR_wiAUhI0ZQn@ashevche-desk.local>

On Thu, Aug 27, 2026 at 12:58:31PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2026 at 03:22:50PM +0200, Maurizio Casciano wrote:
> > The Lenovo Yoga Book YB1-X91 firmware enumerates the front OV2740 as
> > OVTI2740 and the rear OV8858 as INT3477. Neither ID currently matches
> > its sensor driver, so both I2C devices remain unbound.
> > 
> > Add the IDs to the corresponding ACPI match tables. Sensor
> > configuration and CSI lane quirks are kept in later patches.
> 
> For the record can you provide an DSDT excerpt of this device object (no need
> to put into commit message, just reply here)?

Typically the information comes from BIOS (EFI variables?) so the DSDT
nor SSDTs have this information as such.

-- 
Sakari Ailus
