Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3104CDDDC;
	Fri,  9 Oct 2026 11:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545543; cv=none; b=ltzVdhW8l6cZ0Qy4j5XnA8rizph+3O+5P62IFapDcCAgMZj4uG4fB5F1ZE+uRPN2APZBDC1gz1T5MVwarpYPLrYDzeS8smJDceI5+rH9PoKD98hHeVvEY+LOfgjCaiWqYOA4YDyvkdXKXplPOsx9dBMOMLLEVg/7RL9Yr3O1JHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545543; c=relaxed/simple;
	bh=3iUxqROvvrAYBSZrKR66YJiqPYTMgKTe+773lkAkpto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxEOVuA6m3Em3qtc0hnF5yxxOlLUMD93XkYVFPBoDYoDhP4VuO5VBWPZlNAlZ1fl8a+yM9gAQcvQCyF5auFR8rlPCppCh+3Ngp03NVgqtP3ecg2Ht+pFf3Q6q50WL1PldX/3k4lmvBEZZ/pUd502wRPJ/GHVehfaumqc2ElY2oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQR/bqHC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQR/bqHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791545534; x=1823081534;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3iUxqROvvrAYBSZrKR66YJiqPYTMgKTe+773lkAkpto=;
  b=WQR/bqHCO/4tQBmFnmsq/qETOgzgl42+QO2jY48uEFy4uDGIpXH6/NB9
   i3ubz+X6NebYh3Y3M0tHIiu+VD6P7jlHOLx33o2ePFsIp0T4cpQZtpL62
   Fosb+j7t+284/48NSULq8CwOONDCsjX0IMACVvSReRYcA57+Mb7+eMl4I
   K/A05d1gr1TErqwjIcdfyef28QfD/Xi4SZzx5fqRWTWxSDekshP9XXk5m
   f4pp9TQ+aHXmnL9PgvIfh2CBZzJlUW4UuxBw/iNvKa508odyPJABnuIBW
   pGDtHU9dqXWcPtjXnW2V2QFi9UBaiSW3tdkIqbj+lCTvaH+cor8b5770q
   w==;
X-CSE-ConnectionGUID: xkwXA1CZSRaPHw5hv0MraQ==
X-CSE-MsgGUID: knfsuO+kTUa08a9hyX5UoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="227425"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="227425"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:32:13 -0700
X-CSE-ConnectionGUID: 36M78ybDTFaiSz6shfZGZA==
X-CSE-MsgGUID: +yGigs/DSr+HZkTmr9kfaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="232194"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 09 Oct 2026 04:32:11 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id B748299; Fri, 09 Oct 2026 13:32:09 +0200 (CEST)
Date: Fri, 9 Oct 2026 13:32:09 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amitsd@google.com
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH 0/3] usb: typec: report a current limit for non-PD Rp-def
 sources
Message-ID: <asjQuXSVTZotr3YK@black.igk.intel.com>
References: <20261001-max77759-icl-typec-v1-0-99ada1f65ced@google.com>
 <asjN0HNpriZtFnrf@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asjN0HNpriZtFnrf@black.igk.intel.com>

On Fri, Oct 09, 2026 at 01:19:44PM +0200, Heikki Krogerus wrote:
> On Thu, Oct 01, 2026 at 10:51:12PM +0000, Amit Sunil Dhamne via B4 Relay wrote:
> > As per Sec. 4.6.2.1 of the Type-C cable & connector spec when the
> > source advertises Rp-default, the current limit is set as per the
> > USB 2.0/USB 3.2 specification, BC1.2 specification as applicable or the
> > PD negotiation.
> > 
> > Reset value for the Input Current Limit register for the MAX77759
> > charger is 500 mA. Prior to the max77759_charger driver, the battery
> > would always charge at that limit since it wasn't re-programmed. Since
> > the driver was introduced, for any non-PD source advertising Rp-default,
> > the charger turns off as tcpm reports the current limit to be 0. The
> > max77759_charger driver reads POWER_SUPPLY_PROP_CURRENT_MAX from the
> > "tcpm-source" power supply that tcpm_set_current_limit() updates, and
> > programs its input current limit from it. The limit is 0 because the
> > tcpm doesn't have visibility on the USB data speed or BC1.2 detection.
> > As a workaround for the Rp-default case, let the Type-C stack report a
> > USB 2.0 current limit of 500 mA so that the behavior is at parity with
> > what was before. This is until we implement a conduit for USB core to
> > communicate with the Type-C stack.
> > 
> > Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> > ---
> > Amit Sunil Dhamne (3):
> >       usb: typec: tcpm: only call get_current_limit() for cc=Rp-def
> >       usb: typec: tcpci: implement get_current_limit
> >       usb: typec: tcpci_maxim: implement get_current_limit
> > 
> >  drivers/usb/typec/tcpm/tcpci.c            | 14 ++++++++++++++
> >  drivers/usb/typec/tcpm/tcpci_maxim_core.c | 15 +++++++++++++++
> >  drivers/usb/typec/tcpm/tcpm.c             |  7 +++----
> >  include/linux/usb/tcpci.h                 |  6 ++++++
> >  4 files changed, 38 insertions(+), 4 deletions(-)
> > ---
> > base-commit: 551c722f40809618230001baccf219193e22fc5a
> > change-id: 20260918-max77759-icl-typec-8dfb9f83d712
> > 
> > Best regards,
> > -- 
> > Amit Sunil Dhamne <amitsd@google.com>
> 
> For the series:
> 
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Sorry, there's v2. Please ignore this ACK.

-- 
heikki
