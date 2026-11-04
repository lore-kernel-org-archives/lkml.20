Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788104;
	b=HMNthe8a9AT3j9DZiFGrxQq0aZm9M1EUjDsbD1ZHNJ18ixR8BV/Jn5rUq1a2UWTW5NHD
	 sKYf/Gingh+go0RjIfLGWSNZGSOO5qGInuwaLrYR5kgZniRGpaFT1hLXB3jWMGRb7Zr1B
	 Shx5/oARuQAhjygcw3rEneBWp1gdxIRHeqH8uUL23FsA1diPu9buTS9YKiY0v2ZuZa7Wn
	 hB6VTcokqLBhnbeIiKM2vj4BDhLD7O8cfY9y4oaY/wevCMZYZfZ/yq6KShbJsafANX4li
	 pEgd02NkHQFTlvTQT/NMt+wBHkUhTgr9ORJ+yvF5leexSq0RwAvd4XMqxeGMpixIF7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788104;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pcQ3OnjWG7K/UwpkDfZwADkosGIhYHAj6eIZYtsb6WA=;
	b=Gqii6fRIwZhcpoRCNDxZ2ew+N73nNG/IWeuujbiNvLkbQHhG3RMfP922snWIhY/qFYlO
	 i0oNkW/EkQaP1VW4GtzX5HQUidtUgCy+z9mQ0jNC0YFxJTBycNEqAPPg7gF7GiQ46Up7w
	 9+yEgVGCKcWmVdleLGJHtGsGtrZpBYV0voRSmj7q8RmjYWoxGkqKtfyLVcL+J4eBQr8kV
	 TdSZwQIcqnuRA48BVztnpsADs3ZyCXUaJUKOQomnn1U9lq9U6GCxMs9th97GbA6rLDm/J
	 YSFBkzT1s0yzULiGaYVEBWuiuMnnZJyUtGszSyZRZ/qaNF9FUiLwkvJVXAkAEdyfPCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PjskPPlm;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272F8606A31B;
	Wed,  4 Nov 2026 10:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 272F8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PjskPPlm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793788104; x=1825324104;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=atygvYU7Ba7IjPmn3BHtBQBTMxe64OKywtVCrd+OdL4=;
  b=PjskPPlmRJwwF4qmLT3Nv+m9xbwaItCH7mOfWsbQ950XdUZ0d/aBO6ni
   aw3I1IfOBvNT2cnSA9jDb3h4hSfmr6/fvR6q0/OChf57gxx9+uZEbKr+y
   7K5gI09bzKM2sNDSSVSuPzRx7pYD5xXdKBTg1cZ/I7fZ0QSfm3Id40oPd
   5LOTyYcjOiMsNELRiGgfuvhG7/BqRJvzzS2bDQb0HtpkaWmSW1y54cTSs
   Xsqeuai7aKKkLgVeykNoSDTqp0TYQt2zcXdFdjEAtG3gAsyykcX0DGSb5
   SLUAIi3XOzLFVHBr+09XRIq4fdXhhi5bk4r4nlo9nmD5JSu6ZEzmUmWUW
   g==;
X-CSE-ConnectionGUID: Dhoyzxz+TbOOQ4rY1qYNcA==
X-CSE-MsgGUID: dGpbnUSbTE2HImwPERW1GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2412401"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2412401"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 02:28:24 -0800
X-CSE-ConnectionGUID: myWvClVgSoWtTZjwJTGwVQ==
X-CSE-MsgGUID: lWpvO8HTSUa1qE1dHwM8Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6541555"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2026 02:28:22 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8522499; Wed, 04 Nov 2026 11:28:21 +0100 (CET)
Date: Wed, 4 Nov 2026 11:28:21 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Retry if notification enable timesout
Message-ID: <ausIxWEIZyuIa1vG@black.igk.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20260729182203.3667583-1-mpearson-lenovo@squebb.ca>
 <anMmhwSSLEAnAZZI@black.igk.intel.com>
 <b98ed1c6-37fb-4235-8ebd-df350728f797@app.fastmail.com>
 <ap6akwNAlqmJPMOz@black.igk.intel.com>
 <03186586-6a9c-4350-aa7b-a42de11ea420@app.fastmail.com>
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
In-Reply-To: <03186586-6a9c-4350-aa7b-a42de11ea420@app.fastmail.com>

Hi Mark,

On Tue, Oct 27, 2026 at 04:17:12PM -0400, Mark Pearson wrote:
> Hi Heikki & Greg
> 
> On Mon, Sep 7, 2026, at 7:05 AM, Heikki Krogerus wrote:
> > On Thu, Sep 03, 2026 at 02:18:08PM -0400, Mark Pearson wrote:
> >> On Wed, Aug 5, 2026, at 8:03 AM, Heikki Krogerus wrote:
> >> > On Wed, Jul 29, 2026 at 02:21:50PM -0400, Mark Pearson wrote:
> >> >> Found on Thinkpad E14 G8.
> >> >> When UCSI notifications are enabled the FW does not ack the enablement
> >> >> itself. Future commands will be acked correctly.
> >> >> 
> >> >> If this happens try enablement again and confirm acks are working
> >> >> correctly.
> >> >> 
> >> >> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> >> >
> >> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >> >
> >> 
> >> Thanks Heikki.
> >> 
> >> Just curious - what is the process/timelines for this subsystem for patch
> >> being accepted and making it into Linus's tree?
> >> We're tracking this for being able to get it into the distro's, but I want to
> >> make sure maintainers are happy with it first. I couldn't see it in usb-next
> >> etc, so wanted to make sure it hadn't fallen off the radar.
> >
> > I'm sure Greg pick soon.
> >
> > Thanks,
> >
> 
> Just checking on the status of this (I have users of this platform wanting the fix).
> 
> Let me know if anything is needed from me to get this fully accepted upstream. I can't get it pulled into the distro's until then :)

Sorry about the delay. Maybe it would be fastest to rebase and resend
the patch at this point.

Thanks,

-- 
heikki
