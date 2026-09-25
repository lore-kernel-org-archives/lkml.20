Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A1547126F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327316; cv=none; b=aNpPwsIm1mCUu+JYI6WmzQtiyzJnj2kn113k8ITn69nFknUvvaT8aQ/2cE4cp9z6WXPJlr3lN0yYD/8pmxuM5t2+Upoe2H4nWM6u+Lj1nK3miZ+Qyo+nNUo1xCfIxFY4w6iTLLWN+bbSUkXWOudQbSAGHY7n649c4F01XtA5Dbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327316; c=relaxed/simple;
	bh=E2GYHV5uW7KkBzRH1jC7EgLpqnckGqKnKrr9dfnSgX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L97VjNRynC8cHuw2wCi8HvpF80JlNmCPdRSwlS4Qr8DScbAqFUpcEAwJMnfczsnterCS8vGtcXFGqUfrhaT9GLVd4DPzF6kAtvEPnQ8+FgbeJ63aYh2lFg2+97rQ/pjAcb8jP4pmVKJiu5PZWOrkH/be7GqyOWgttRuaHXTOFDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAFFSRSV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAFFSRSV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790327315; x=1821863315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E2GYHV5uW7KkBzRH1jC7EgLpqnckGqKnKrr9dfnSgX8=;
  b=gAFFSRSVPUZpXVnWntv3hu/hH6nMoxLro7TLyCasWm5tvNpABDmMRNqV
   gE0sjcc2Qmf5+DYXAuQO99BGtyXLpii7fLAeJRnY/UDynlSgoVvqfiz+L
   bqEDQGG+1+E03rEyvqRCU+aJICLKlnfHyTqwFpMMXc2940tGcVkcMgJEv
   KuBzAbeOBJJA0fM9XoWEFwYon0GbQQYykXSIPFtWwtGNoM4tKaosYkL9Y
   jMH3huOa5wg3R5B/yE9Fx8qV5fCghFMsTdJvUx1WbmJA6YhcpLgKcuSEi
   ZXhcd6p6qQ0OdGir2funA+4EMEy+e5D/G+AtGEMxdzMlAyxULeyjf2Py3
   w==;
X-CSE-ConnectionGUID: y0A8DFPtS9ujsuOZRnk9IQ==
X-CSE-MsgGUID: zRhpR64ERs6ePQuQiGGx5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90171828"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90171828"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:08:34 -0700
X-CSE-ConnectionGUID: YXeULacfSUG5J1ZxS1aA6Q==
X-CSE-MsgGUID: fy98SQ89ThmkYfHBNA1TVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="278989175"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 25 Sep 2026 02:08:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F1AFE99; Fri, 25 Sep 2026 11:08:29 +0200 (CEST)
Date: Fri, 25 Sep 2026 11:08:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Sam Agazaryan <samagazaryan@google.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Meagan Lloyd <meaganlloyd@linux.microsoft.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] i3c: add i3cdev module to expose i3c dev in /dev
Message-ID: <arY6DfVf_9tZ_TCu@black.igk.intel.com>
References: <20260921230603.2518652-1-samagazaryan@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921230603.2518652-1-samagazaryan@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Sep 21, 2026 at 11:05:58PM +0000, Sam Agazaryan wrote:
> This patch series introduces the i3cdev module, exposing unbound I3C
> target devices to userspace via character device nodes (/dev/bus/i3c/*),
> along with the i3ctransfer userspace utility in tools/i3c/.
> 
> Userspace access to I3C targets is needed for devices that do not have a
> kernel driver bound to them, such as targets in ROM/bootloader recovery
> mode (e.g., OCP Secure Firmware Recovery v1.1 and Caliptra Silicon Root of
> Trust recovery flows), as well as hardware bring-up and diagnostics.
> 
> When a kernel driver later binds to an I3C device (for example via
> dynamic module loading), i3cdev automatically detaches via the
> BUS_NOTIFY_BIND_DRIVER notifier so kernel drivers always take
> precedence.
> 
> Testing status:
> This v5 series has been compile-tested across all modified I3C controller
> drivers with W=1. Posting v5 now so collaborators and controller owners
> can test the unified UAPI and actual_len updates on their respective
> hardware and provide Tested-by tags while we complete final hardware
> verification of the v5 updates on our platform.

I do not know how we end up here. The not-settled yet discussion is in
thread with aqt_dCazxTDR4cpk@ashevche-desk.local.

But I have a big concern about exposing i3c to user space in the way we have it
in i2c. Taking into account that i2c is an odd bus and might lead even to HW
*physical* breakage, I would thing 100 times before making the same mistake
in i3c. If you ever want to do this, this must not be user visible feature
(hidden under expert and debug and maybe even more guards for the starter).

Personally from my perspective this is no go, but I'm not a maintainer here.

P.S.
And you need to gather the opinion of Wolfram as well.

-- 
With Best Regards,
Andy Shevchenko


