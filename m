Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0068A37DAA9;
	Thu,  3 Sep 2026 03:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788407069; cv=none; b=jwXHxCoYoTOD7dWE27S4D6uNjtiRYOa0rTf8LdPzzzi6oGSJhv6jxWVoKtJgSdrS7qM7uI4+L8tNOu2r//3MDJ80bLpL12q1p4AoFCnHdPmTuWPOVeYoskoo9YdpvwcMGkWJLHslHsnoeXMLYh3rZOPXuS3Ykcdxjm8UbpReTSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788407069; c=relaxed/simple;
	bh=5EIK6qSSLdtKvlZ2lbV9oLBsMgYGTGzq4Tak0TSk2PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmB2r5l+3fUz29sY5dkj+u44Ei0iFVHXvzW97L0EFQ5eemebFoRan97bzdzp0IRpYvwCUkJ9UTPRiMUFAenEZKhjHv1w2WzOuJHxedaM+FNxcW/fpiyCdde97ewpfrsxoS2wKEV/12dca2nMnMtba1y2T7K9sXyfL6Zasvd0ajI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmIwNfOH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmIwNfOH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788407064; x=1819943064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5EIK6qSSLdtKvlZ2lbV9oLBsMgYGTGzq4Tak0TSk2PY=;
  b=UmIwNfOHU3cp87MlTM/0CIUAPxCz+219Smh6yQ4pXiPdwFe6bJMNjpFH
   SS8JupePtq8vdDJDRcAh7OCS9jSoZBU27lR9Pdv6Ce4SO0LKwCmoF/s3d
   1AhAOU7alACyeetjJ9V8AhIoipA3L6tKvLrPjGCC6HD2la1NRmPWhSfsX
   7nj99i7E/L7deqQ37pFgCBYDlCppo6rluHJ9pOzwbR674FTRVhFrMMUnw
   Grp4t6ywVQxaqZtsUUym+uIUz+wseNVocA7pJOba5OMc40fuP5kA8JZvo
   UA7JP0cSHoqz45c6wVnisbWEzA7Ok9UZ0McjpIfuvkQIy/VYg6zX4jbu7
   Q==;
X-CSE-ConnectionGUID: f7q93WPEQN+AnTioD9hm9w==
X-CSE-MsgGUID: RtVpF3C5QEuT+KdWA6OgYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88752436"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88752436"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 20:44:19 -0700
X-CSE-ConnectionGUID: QLeMXN7lRrW5PNjBnpljFA==
X-CSE-MsgGUID: +uOig/O1RUqw3E4EOEDALA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="269047809"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 02 Sep 2026 20:44:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A208A99; Thu, 03 Sep 2026 05:44:15 +0200 (CEST)
Date: Thu, 3 Sep 2026 05:44:15 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "S, Sanath" <sanath.s@amd.com>,
	"Natikar, Basavaraj" <basavaraj.natikar@amd.com>,
	linux-usb@vger.kernel.org, andreas.noever@gmail.com,
	westeri@kernel.org, YehezkelShB@gmail.com,
	linux-kernel@vger.kernel.org,
	Andrei Rusu de Castro <arc@empyreal.works>
Subject: Re: [PATCH 1/2] thunderbolt: Do not warn when a reset clears ring
 interrupts
Message-ID: <20260903034415.GL106095@black.igk.intel.com>
References: <20260902-thunderbolt-cover-2fdc1c1b@empyreal.works>
 <20260902-thunderbolt-1-c48cd6e7@empyreal.works>
 <20260902125010.GK106095@black.igk.intel.com>
 <318bc76c-2fc9-484f-b009-1f21fbdd4d49@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <318bc76c-2fc9-484f-b009-1f21fbdd4d49@amd.com>

Hi,

On Wed, Sep 02, 2026 at 03:53:42PM -0500, Mario Limonciello wrote:
> 
> 
> On 9/2/26 07:50, Mika Westerberg wrote:
> > +Mario
> > 
> > Hi,
> > 
> > On Wed, Sep 02, 2026 at 12:34:13PM +0000, Andrei Rusu de Castro wrote:
> > > The AMD DMA-teardown quirk resets the host interface before USB4NET
> > > stops its service rings. The reset clears ring interrupt bits while the
> > > rings remain logically running. When tb_ring_stop() later disables the
> > > interrupt, the register update is a no-op and emits a dev_WARN() splat.
> > 
> > Yes it should not do that. It's too "big hammer" and we should avoid that
> > if possible. There is also the deadlock that resulted this series:
> > 
> > https://lore.kernel.org/linux-usb/20260825214237.4179813-1-juan.martinez@amd.com/
> > 
> > But that still kills the whole host interface if there are other users,
> > like USB4STREAM using the rings at the same time. I suggested that we do
> > the reset when the rings are idle and while they are not and we have spare
> > rings we hand off those instead:
> > 
> > https://lore.kernel.org/linux-usb/20260902054800.GI106095@black.igk.intel.com/
> > 
> > We still need confirmation from AMD if this even solves the problem or is
> > it hanging the whole host interface and not just a single ring.
> 
> I'll let Sanath and Basavaraj double check this on the affected failure
> case.

Okay thanks.

> I believe think that the whole host interface hangs when this condition
> happens.  Another way to mitigate it can be to force a power state
> transition though.  If we can force the router into D3 and back out it
> should reset the condition that could lead to a host interface hang.

I don't think that's any better that the reset.

> > > The path teardown order is required. Stopping a ring first clears its
> > > descriptor base and unmaps its frame buffers, so pending path traffic
> > > can no longer drain and some host routers never clear their pending bit.
> > > 
> > > Keep the warning for genuine software-state drift. Increment a host
> > > interface generation after each eligible reset and sample it when an
> > > interrupt-backed ring starts. Excuse a redundant disable only when that
> > > ring crossed a reset. Duplicate enables, duplicate disables without a
> > > reset, rings started after a reset, ineligible resets, and double
> > > software stops retain their existing warnings.
> > > 
> > > The generation sample precedes interrupt enable while holding the NHI
> > > lock. A reset racing with ring start is therefore observed as newer than
> > > the sample and attributed to that ring.
> > > 
> > > Source and call-graph analysis identified the reset and
> > > ring-teardown ordering. The change was compile-tested; KUnit coverage is
> > > added separately. It has not run on affected peer-host XDomain hardware
> > > because the attached USB4 device is a hub and does not form that path.
> > 
> > This looks pretty much like LLM generated so if that's the case you should
> > add proper assisted-by.
> > 
> > Anyways I don't think we want to do this just yet if we can avoid resetting
> > the host interace behind everyones back.
> 
> The resetting host interface /should/ only really happen when unplugging the
> cable.  If it's happening in more cases, that's not intended at least.

The XDomain paths can be brought down also without unplug. Networking does
that when you "down" the interface and USB4STREAM does that when you close
the device node.
