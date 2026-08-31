Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDB12DC32C;
	Mon, 31 Aug 2026 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181603; cv=none; b=nEBCUNsC0XxGpAruVNQ/TjoR1bCN6arsqjSU/ZcGjqGQKk9eUGihe0yJdAESt693wUYvrwdgNK65ywaM/50NkOUVYj2ol2t/y4HK/CJsN1daxkHIJ0PE4mHYm/MrJg53861JGhZHu5vub8qpCLWjEnazlfXrbYEbejDB+GncFJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181603; c=relaxed/simple;
	bh=JxdyES1kZcVSq31+NTUeSh7kp+R6vgdMHOYBsPcblWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHmGjJTWzuu11rL4sbdAvhkwbzkETeFkpjKRERBBIP5/2R5Z/+cBhk5jpT6dTnADw8XTn3Cxk0HFOBph1Id5wcrqtvB6dNeWSpPp2njm64aG9LL89SdVyQzHF6M4GRsYr2+02h2SHLriW0OkRFXfZBaJK4DJ8Y1HdRPjBgXFHPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxKWPtwV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxKWPtwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788181602; x=1819717602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JxdyES1kZcVSq31+NTUeSh7kp+R6vgdMHOYBsPcblWw=;
  b=CxKWPtwVvmOUgfaRaO0XWJh8fx3N7JbXmxm5AlYtsBVlNAgvHNW1atTb
   EkgkUEb2NJ/bIb8rGBc8i5dEbqunx+5XR8hf1Hpq2+XdlrZr3LlYpECJU
   Whk60KTIykZqs96vZCmxJFHJeRhSoztX8epQyy095MRhK6t0suj542BY8
   eWTfa0VTStABGOyTFgyy8FMcf14ddAq9GlXobJ+1t0faPUuHukiAES5DO
   FxKqqLcynjcwutyweRHFZPlsI3MrQ1In7679e0jKr/bblg5Hd5VCf3dPa
   59C41LP7UjqgfAqvePh0UYuYA8xm+2CAeXz5fISmAUi+DN6waLJf7MQgc
   Q==;
X-CSE-ConnectionGUID: 4Hoa8e8oQQeOhzdY4nwT7Q==
X-CSE-MsgGUID: GUlbJeMnTY2lBaRMTDCvqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92275932"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="92275932"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:06:42 -0700
X-CSE-ConnectionGUID: vZpySQ6HRZaf+QUX8FUHVQ==
X-CSE-MsgGUID: pGBZfENrTMKEMS5yTc+F2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="262660076"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 31 Aug 2026 06:06:39 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 651E999; Mon, 31 Aug 2026 15:06:38 +0200 (CEST)
Date: Mon, 31 Aug 2026 15:06:38 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Juan Martinez <juan.martinez@amd.com>, westeri@kernel.org,
	andreas.noever@gmail.com, YehezkelShB@gmail.com,
	Basavaraj.Natikar@amd.com, Sanath.S@amd.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] thunderbolt: Fix tb->lock deadlock during hot-unplug
 on AMD USB4 routers
Message-ID: <20260831130638.GK124825@black.igk.intel.com>
References: <20260827215740.415496-1-juan.martinez@amd.com>
 <20260828051903.485922-1-juan.martinez@amd.com>
 <20260831111128.GH124825@black.igk.intel.com>
 <8e20e208-05a2-4ddf-9ff6-081ce33b5a42@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8e20e208-05a2-4ddf-9ff6-081ce33b5a42@amd.com>

Hi,

On Mon, Aug 31, 2026 at 07:55:16AM -0500, Mario Limonciello wrote:
> > > +static void tb_domain_reset_interface(struct tb *tb)
> > > +{
> > > +	guard(mutex)(&tb->lock);
> > > +	__tb_domain_reset_interface_locked(tb);
> > > +}
> > > +
> > >   /**
> > >    * tb_domain_disconnect_xdomain_paths() - Disable DMA paths for XDomain
> > >    * @tb: Domain disabling the DMA paths
> > > @@ -835,7 +849,7 @@ int tb_domain_disconnect_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
> > >   	if (ret)
> > >   		return ret;
> > > -	if (tb->nhi->quirks & QUIRK_RESET_DMA_ON_TEARDOWN)
> > > +	if (!xd->is_unplugged)
> > 
> > If I read this right, if you unplug a tree (say a router and then after
> > that router there is inter-domain link) with this check the reset does not
> > happen and AMD system still hangs?
> > 
> 
> It should be a different problem.  The quirk fixed a problem in the USB4
> router (router wasn't functional when problem occurred).
> 
> This fixes a deadlock in the kernel that system gets stuck while shutting
> down.

Right, but now since this checks !xd->is_unplugged and only then does the
reset, if you unplug the whole chain including the XDomain connection (i.e.
the unplug happens say on host router downstream port) then we mark
everything below that with is_unplugged=1 so now this function will skip
the quirk and the DMA will get stuck, no?

Because..

> 
> > >   		tb_domain_reset_interface(tb);
> > >   	return 0;
> > > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > > index b7cc6894a598..89dfb3381345 100644
> > > --- a/drivers/thunderbolt/tb.c
> > > +++ b/drivers/thunderbolt/tb.c
> > > @@ -2489,6 +2489,7 @@ static void tb_handle_hotplug(struct work_struct *work)
> > >   			tb_xdomain_remove(xd);
> > >   			port->xdomain = NULL;
> > >   			__tb_disconnect_xdomain_paths(tb, xd, -1, -1, -1, -1);
> > > +			__tb_domain_reset_interface_locked(tb);

... this is not called when the unplug happens elsewhere (like before the
XDomain link).
