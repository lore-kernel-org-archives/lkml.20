Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0024810785;
	Mon,  5 Oct 2026 04:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791174633; cv=none; b=RLCCmPxiWLyjGrZhMa94Shtn9DHKhnzmDDPBSIxThm69sexN8LXyLXfKiItHvANr9yfF71A1fDK6N+a0m6CGzHmAOVa16RDvud70cgjeVM2V8JPfV16ZlVA6RQ+X5K1nmWX2qg8+3bBXzuHZChhKQ1B4ia2sFX6VbOauM4SjXC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791174633; c=relaxed/simple;
	bh=OQYgSxltXIE+cGD9fGCFRizOTrDv3aePuKLtHe7KhpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSXk5A7A8MTpHb0ryoX5q6ib5lDvuFDRkvmHaIleNQyVu1wG2Pn0lcwp+NxXkF3yylpBo4sB3AY1szRM56I5Es6SnW+WXDSxyDxcU+rX/YswjPkEAMkhFBDZVv7MCVNdhxXBs/bcw+QiPRNubydvsDQSxU6LHOJqisXgfPOXdOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDTRXbVR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDTRXbVR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791174632; x=1822710632;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OQYgSxltXIE+cGD9fGCFRizOTrDv3aePuKLtHe7KhpA=;
  b=FDTRXbVR/MUnj/XmgH1TZrVjMsjF0Oj1F//nJRcTizSLkNYoqhO4QZEi
   5I1D4RJZ6vsTGSCw8x3aKqEHKxgYu+WSUC//WYyEy2VonhSa8HNTr2Bkr
   op8MBHXY2YR95mPkdANTyOI72rMZXKxuTu5qpcmGEBkomPhUwUBARw5cU
   IdWYrQajDVUz0eLIClfgZpkqQZwFaEC0DHa2JioJ5VEbqseOZVajW+JUZ
   nNp/wAKQsOmyouXSjtj+K/3KTQj5XymPYF0tLK3x4QYnUOym2OXibfy71
   UKTRvUss4Ajj0pFDwG8MHNhUZ+BgWlS5qeNo6o7dv+XK3W7NvHCB6B/bV
   A==;
X-CSE-ConnectionGUID: yuvkpfuVS/+AUdV5agt1uQ==
X-CSE-MsgGUID: ElEYcMuVSsyAifjsSmNiRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="91944261"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="91944261"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 21:30:32 -0700
X-CSE-ConnectionGUID: O5wjBgfUThW8fT3NOXLXDg==
X-CSE-MsgGUID: lJIf0CfdQ8qhx5XJFae5Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="304670761"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 04 Oct 2026 21:30:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EEBD399; Mon, 05 Oct 2026 06:30:28 +0200 (CEST)
Date: Mon, 5 Oct 2026 06:30:28 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jonathan Gopel <jgopel@gmail.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Do not RPM complete unrelated subtrees on
 unplug
Message-ID: <20261005043028.GK176164@black.igk.intel.com>
References: <20261004022604.359663-1-jgopel@gmail.com>
 <20261004120255.GI176164@black.igk.intel.com>
 <asJo_FxaGjk78GfS@XPS-17-9720-nixos>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <asJo_FxaGjk78GfS@XPS-17-9720-nixos>

Hi,

On Sun, Oct 04, 2026 at 11:11:07AM -0600, Jonathan Gopel wrote:
> Hi Mika,
> 
> Thank you for the prompt response, it's much appreciated. I've left a
> few questions inline.
> 
> On Sun, Oct 04, 2026 at 02:02:55PM +0200, Mika Westerberg wrote:
> > Hi,
> > 
> > On Sat, Oct 03, 2026 at 08:26:04PM -0600, Jonathan Gopel wrote:
> > > When a Thunderbolt device is unplugged, that switch and every switch
> > > subsequent to it on the bus device list is `complete()`d, not just its
> > > child devices. In the case of multiple domains, it may cause, eg, an
> > > attempt to `complete()` the uninitialized domain 1 root switch RPM
> > > completion on unplug of a switch from domain 0 (though ordering is not
> > > guaranteed numerically sorted).
> > 
> > Good catch!
> > 
> > > I initially noticed this issue on a Dell XPS9720 when the system would
> > > seem to sporadically not wake after unplugging a Thunderbolt dock. I
> > > tried multiple kernel versions including v7.2.7 and v7.3-rc4 to see if
> > > that resolved the issue, but the issue persisted. Eventually I found
> > > that I could consistently generate a kernel Oops reporting a page fault
> > > at 0xffff_ffff_ffff_fff8 on unplug from one side of the laptop and went
> > > bug hunting. I became suspicious of the `bus_for_each_dev()` walk that I
> > > ultimately ended up changing. To confirm this issue, I did an eBPF trace
> > > of `bus_for_each_dev()`, `complete_rpm()`, and `complete()` while
> > > unplugging in a variety of situations and found that an unplug from
> > > domain 0 tries to `complete_rpm()` domain 1's switch, whose RPM
> > > completion is not initialized and thus is holding a null wait-list
> > > pointer, triggering the page fault.
> > > 
> > > Here are the key sections of that eBPF trace. Note that HEAD denotes the
> > > completion's own wait-list HEAD:
> > > 
> > > ```
> > > RESCAN_ENTER domain=0
> > > 
> > > COMPLETE rescan_domain=0 target=0-1 target_domain=0
> > >          route=0x1 parent=0-0 unplugged=1
> > > COMPLETION done=0 head=HEAD next=HEAD prev=HEAD
> > > 
> > > BUS_WALK domain=0 start=0-1 callback=complete_rpm
> > > CALLBACK_ENTER rescan_domain=0 dev=1-0 parent=domain1 is_switch=1
> > > 
> > > COMPLETE rescan_domain=0 target=1-0 target_domain=1
> > >          route=0x0 parent=domain1 unplugged=0
> > > COMPLETION done=0 head=HEAD next=0 prev=0
> > > 
> > >         complete+5
> > >         complete_rpm+43
> > >         bus_for_each_dev+133
> > >         icm_free_unplugged_children+250
> > >         icm_rescan_work+42
> > > ```
> > > 
> > > To fix this, I have reused some of the adjacent logic to recursively
> > > walk and `complete()` only the unplugged switch and its descendants.
> > > 
> > > I only have a single system with multiple Thunderbolt domains - the Dell
> > > XPS9720. I am consistently able to reproduce the Oops on that system.
> > > Since running with this patch, I have not seen the Oops reoccur. I have
> > > also tested it on a Thinkpad X1-Gen12, and that system boots and runs
> > > well with it, but it only has a single Thunderbolt domain, so it does
> > > not exercise the multi-domain failure case.
> > 
> > This looks like LLM was involved and if that's the case then please add
> > Assisted-by: LLM.
> > 
> 
> I'm happy to add an annotation here, but I was unclear on what the
> policy was. I have a few other issues with this system since adding a
> TB5 dock to my setup that I may also pursue patching, so if it's ok with
> you I'd love to understand the expectation a bit better be expected.
> I've read the policy, but I didn't come away with a clear understanding
> of what exactly counts as assistance.
> 
> I had an LLM do the initial portion of the investigation here, basically
> going from symptoms to identifying the Oops, which pointed at the
> Thunderbolt unplug code. From there, I wanted to make sure I delivered a
> high quality fix, so I did the remainder by hand. Does this warrant the
> annotation?

If the LLM did not create the patch then I don't think you need to add the
tag. At least this is my interpretation of:

https://docs.kernel.org/process/coding-assistants.html

> > > 
> > > Signed-off-by: Jonathan Gopel <jgopel@gmail.com>
> > > ---
> > >  drivers/thunderbolt/icm.c | 16 +++++++++-------
> > >  1 file changed, 9 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
> > > index 669807f0eaf8..d6801d8b669b 100644
> > > --- a/drivers/thunderbolt/icm.c
> > > +++ b/drivers/thunderbolt/icm.c
> > > @@ -2068,13 +2068,16 @@ static void icm_unplug_children(struct tb_switch *sw)
> > >  	}
> > >  }
> > >  
> > > -static int complete_rpm(struct device *dev, void *data)
> > > +static void complete_rpm(struct tb_switch *sw)
> > >  {
> > > -	struct tb_switch *sw = tb_to_switch(dev);
> > > +	struct tb_port *port;}
> > 
> > So instead of this, just check that sw->tb matches what you pass in..
> > 
> > >  
> > > -	if (sw)
> > > -		complete(&sw->rpm_complete);
> > > -	return 0;
> > > +	complete(&sw->rpm_complete);
> > > +
> > > +	tb_switch_for_each_port(sw, port) {
> > > +		if (tb_port_has_remote(port))
> > > +			complete_rpm(port->remote->sw);
> > > +	}
> > >  }
> > >  
> > >  static void remove_unplugged_switch(struct tb_switch *sw)
> > > @@ -2088,8 +2091,7 @@ static void remove_unplugged_switch(struct tb_switch *sw)
> > >  	 * tb_switch_remove() calls pm_runtime_get_sync() that then waits
> > >  	 * for it.
> > >  	 */
> > > -	complete_rpm(&sw->dev, NULL);
> > > -	bus_for_each_dev(&tb_bus_type, &sw->dev, NULL, complete_rpm);
> > 
> > .. here pass sw->tb 
> 
> I'm submitting a v2 patch with this revision. If you have time, I would
> love to understand the reasoning for preferring one over the other - to
> my eye they look equivalent.

The latter (what I'm suggesting) should be slightly simpler since it just
adds a check that makes sure the domain is the same. I always prefer
simplicity :)
