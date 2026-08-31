Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C1F466B02;
	Mon, 31 Aug 2026 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183968; cv=none; b=ZxKP2I8e8NjP9HNqcRd3xUke+WQMmgqPW/NL7ppbXGiXcr3HXawQkP+dAfYRk/vCSmIC+jwaXMN45iDm60H4WTf9oMXKqGi8e3Zc5dbDfCy82x+667Oe3d3vcSjO8utjHl2CrReSiF/tjYb2wxOyMWmPjIxDgPFs/rARDiN2VI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183968; c=relaxed/simple;
	bh=o3Z6Ydi/R4NsNt0MfLTQtlHUafXAZFwMGlEuN+SwNXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZezuJmIAy4cDon5NafEtRo2ZVTzIqVL/2DrKowN453EKMDglQPWnzvH5pjiwID/VfcOKHNgUJEZtKB2iRcWIURut86yCm2w+Abs6NvD4faYvsK8mvTBJrBaaP5axq1iVFUwV1oIVYm7gn9sBgIJjbheCMAuVYRUw2bz0aFJ3pm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7T/BQiW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7T/BQiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788183966; x=1819719966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o3Z6Ydi/R4NsNt0MfLTQtlHUafXAZFwMGlEuN+SwNXI=;
  b=i7T/BQiW2BBZ9GsmdATwQ7KB+0oxPqpTnHsjfR518tY05SB/BX0oEe+y
   jWZLFzX8u4z9vyguziIHcjdlnqDtwk35hDWV1HP+rleaBSt2T1Sa8HbC3
   mEDadReHoYIOm6qqFDnGg2Yx6mlngEQ+T+2saVEko7T3ISD+eWbUVpTBR
   Dt0Bg7d6uRtRlv1hCk0TReW/XzSwkVhmamTg1Xb/PCw8rNcYmqNyR/W2I
   LLJwR/pp+bxIaKE8dvjtS+vtKh4CwWAZHLMvcmKmEHrOuk/jTBSEClPT5
   s5IZkQ9AeKuKCGhb6sMVNXti2R1A998e8XSLRWpS3uhLy8Dq8wPxM6FdT
   w==;
X-CSE-ConnectionGUID: 817CZOG7TyKaEJnacmIiQg==
X-CSE-MsgGUID: C9B3mbRiQX+3MXW87N9shA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88797487"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="88797487"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:46:04 -0700
X-CSE-ConnectionGUID: 1I3SBZCfTSuGv2NRlSPCSQ==
X-CSE-MsgGUID: UK7T3o9eReqy1sd4ZQuNKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="267001596"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 31 Aug 2026 06:46:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CABE999; Mon, 31 Aug 2026 15:46:01 +0200 (CEST)
Date: Mon, 31 Aug 2026 15:46:01 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Amaan Lalani <zlzzm2014@outlook.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Reset downstream port after failed link
 restore
Message-ID: <20260831134601.GN124825@black.igk.intel.com>
References: <DM6PR02MB63772452BC9DE8C5C79BE421A0AB2@DM6PR02MB6377.namprd02.prod.outlook.com>
 <20260831134239.GM124825@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831134239.GM124825@black.igk.intel.com>

On Mon, Aug 31, 2026 at 03:42:39PM +0200, Mika Westerberg wrote:
> Hi,
> 
> On Sat, Aug 29, 2026 at 04:57:05PM -0700, Amaan Lalani wrote:
> > A directly connected Thunderbolt device may fail to restore
> > its link after a runtime suspend, therefore leaving the connection
> > unusable.
> 
> How does it show up? Can you share more details, like full dmesg with
> thunderbolt.dyndbg=+p in the command line?
> 
> > Reset the downstream port when the link restoration fails. This drives
> > SBTX low, causing the partner to observe a USB4 disconnect and allowing
> > the Type-C/PD firmware to renegotiate the connection. For dual-mode
> > devices, this may allow the connection to fall back to native USB3.x.
> > 
> > Tested on a Microsoft Surface Pro 11 with a UGreen Thunderbolt
> > 4 external NVMe enclosure, where the device successfully reconnects as a
> > USB3 device when the Thunderbolt 4 link fails to recover.
> > 
> > Signed-off-by: Amaan Lalani <zlzzm2014@outlook.com>
> > ---
> >  drivers/thunderbolt/switch.c | 22 +++++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> > index 404c0693df50..7b88aa75a07a 100644
> > --- a/drivers/thunderbolt/switch.c
> > +++ b/drivers/thunderbolt/switch.c
> > @@ -3600,7 +3600,27 @@ int tb_switch_resume(struct tb_switch *sw, bool runtime)
> >  
> >  		if (tb_wait_for_port(port, true) <= 0) {
> >  			tb_port_warn(port,
> > -				     "lost during suspend, disconnecting\n");
> > +				    "lost during suspend, disconnecting\n");
> > +			/*
> > +			 * If a directly connected USB4/thunderbolt device did not restore
> > +			 * its link after a runtime suspend, assert a downstream
> > +			 * port reset. This drives SBTX low and makes the partner
> > +			 * observe a real USB4 disconnect. A dual-mode device and
> > +			 * the Type-C/PD firmware will then try to renegotiate
> > +			 * the connection in a native USB 3.x mode.
> > +			 *
> > +			 * Restrict this to the host router's downstream port.
> > +			 * Resetting an intermediate router would not cause the Type-C
> > +			 * to be renegotiated.
> > +			 */
> > +			if (runtime && !tb_route(sw) &&
> > +			    tb_switch_is_usb4(sw) && port->cap_usb4) {
> 
> Yea I'm not entirely sure we want to add hacks like this to the driver to
> be honest.
> 
> The link should re-negotiate as USB4 so something is wrong there. Have you
> checked if you have the latest firmwares on both sides?

And if you want to do the DPR you can trigger this from userspace via udev
rule and run something like:

https://github.com/intel/tbtools/blob/main/scripts/reset-port.sh
