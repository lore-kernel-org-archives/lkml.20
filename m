Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5035F3955F0;
	Sun,  4 Oct 2026 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791115381; cv=none; b=t5toPQ5jUUR7PcR2yU84pW6/lmm3BSx3Sesnh6X3XYGMWetV3mbtPxScUnsX7+VIa+Q/xVJ8mbad3ik7ALUqQtqItVyzbgMp0HT/slITjKP+RqcYhjeJNyiJujn2ha9hj4G+EGlMiUhCetbgxzy5RGgSUVCD3yVGr+PtsafNTss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791115381; c=relaxed/simple;
	bh=M2PNrZAv5Hh7h3SGcB3Pw+HlvWLVJVPhm3PZ4ZB7DR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtxlLJ+9mKSgccoiHs5Xj7cBWreRacPEjupUQlNnnr/5rUu7m6eQmSa76gwXKF2nMJ2NSLHA6ptUpqNbwSr34ld0W4D+WaAda1gwwUfk6U+ss/xClid2KrAkg2fQXdML58y+nYlykNqk1hDq21vAX3lh/UcdYDqSaobLkak9eLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YgRpr6kH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YgRpr6kH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791115379; x=1822651379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M2PNrZAv5Hh7h3SGcB3Pw+HlvWLVJVPhm3PZ4ZB7DR8=;
  b=YgRpr6kH5JgD9DWkOcxcWUqppFRRU0e3vFRfNN3R7IFlnVrK+fk2Rx45
   yxPY7ERu69uNAvNJySgMznoiYR3ZvYvWb8Bdv0n6ckhEhJEmvn6w+dyW4
   +mPbtQtuAQEiMiPIyYb61a78vcjpJ8XZh7aITMHNIYUaOHZum1qhNipBC
   vYv4Lcg7Y2rwa6yOvsBH6gES0RgJ5iRIBM6ifv1FeC1xhAa+rWGdKxm1N
   oRWIbrm5aMuJ0R8psEeMigd6DoUs5bn6NclIzSqnr1faxIM1oGRwViFfT
   vlekUNSH4Wa4Yggf8pVF5+68IU7GDwso6Ua8HdXVvMWBYVb3/0jJ48NCk
   w==;
X-CSE-ConnectionGUID: A4QB57bRTT+xtJ5TroN8cw==
X-CSE-MsgGUID: CdMAebFVR4Cpmbm/+qfMLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90577554"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="90577554"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 05:02:59 -0700
X-CSE-ConnectionGUID: gsp/PxVMRSitNJaaMwt2mQ==
X-CSE-MsgGUID: SmQ7VjQHRUisVFzZDlpa9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="272995443"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 04 Oct 2026 05:02:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EBA9399; Sun, 04 Oct 2026 14:02:55 +0200 (CEST)
Date: Sun, 4 Oct 2026 14:02:55 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jonathan Gopel <jgopel@gmail.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Do not RPM complete unrelated subtrees on
 unplug
Message-ID: <20261004120255.GI176164@black.igk.intel.com>
References: <20261004022604.359663-1-jgopel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004022604.359663-1-jgopel@gmail.com>

Hi,

On Sat, Oct 03, 2026 at 08:26:04PM -0600, Jonathan Gopel wrote:
> When a Thunderbolt device is unplugged, that switch and every switch
> subsequent to it on the bus device list is `complete()`d, not just its
> child devices. In the case of multiple domains, it may cause, eg, an
> attempt to `complete()` the uninitialized domain 1 root switch RPM
> completion on unplug of a switch from domain 0 (though ordering is not
> guaranteed numerically sorted).

Good catch!

> I initially noticed this issue on a Dell XPS9720 when the system would
> seem to sporadically not wake after unplugging a Thunderbolt dock. I
> tried multiple kernel versions including v7.2.7 and v7.3-rc4 to see if
> that resolved the issue, but the issue persisted. Eventually I found
> that I could consistently generate a kernel Oops reporting a page fault
> at 0xffff_ffff_ffff_fff8 on unplug from one side of the laptop and went
> bug hunting. I became suspicious of the `bus_for_each_dev()` walk that I
> ultimately ended up changing. To confirm this issue, I did an eBPF trace
> of `bus_for_each_dev()`, `complete_rpm()`, and `complete()` while
> unplugging in a variety of situations and found that an unplug from
> domain 0 tries to `complete_rpm()` domain 1's switch, whose RPM
> completion is not initialized and thus is holding a null wait-list
> pointer, triggering the page fault.
> 
> Here are the key sections of that eBPF trace. Note that HEAD denotes the
> completion's own wait-list HEAD:
> 
> ```
> RESCAN_ENTER domain=0
> 
> COMPLETE rescan_domain=0 target=0-1 target_domain=0
>          route=0x1 parent=0-0 unplugged=1
> COMPLETION done=0 head=HEAD next=HEAD prev=HEAD
> 
> BUS_WALK domain=0 start=0-1 callback=complete_rpm
> CALLBACK_ENTER rescan_domain=0 dev=1-0 parent=domain1 is_switch=1
> 
> COMPLETE rescan_domain=0 target=1-0 target_domain=1
>          route=0x0 parent=domain1 unplugged=0
> COMPLETION done=0 head=HEAD next=0 prev=0
> 
>         complete+5
>         complete_rpm+43
>         bus_for_each_dev+133
>         icm_free_unplugged_children+250
>         icm_rescan_work+42
> ```
> 
> To fix this, I have reused some of the adjacent logic to recursively
> walk and `complete()` only the unplugged switch and its descendants.
> 
> I only have a single system with multiple Thunderbolt domains - the Dell
> XPS9720. I am consistently able to reproduce the Oops on that system.
> Since running with this patch, I have not seen the Oops reoccur. I have
> also tested it on a Thinkpad X1-Gen12, and that system boots and runs
> well with it, but it only has a single Thunderbolt domain, so it does
> not exercise the multi-domain failure case.

This looks like LLM was involved and if that's the case then please add
Assisted-by: LLM.

> 
> Signed-off-by: Jonathan Gopel <jgopel@gmail.com>
> ---
>  drivers/thunderbolt/icm.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
> index 669807f0eaf8..d6801d8b669b 100644
> --- a/drivers/thunderbolt/icm.c
> +++ b/drivers/thunderbolt/icm.c
> @@ -2068,13 +2068,16 @@ static void icm_unplug_children(struct tb_switch *sw)
>  	}
>  }
>  
> -static int complete_rpm(struct device *dev, void *data)
> +static void complete_rpm(struct tb_switch *sw)
>  {
> -	struct tb_switch *sw = tb_to_switch(dev);
> +	struct tb_port *port;

So instead of this, just check that sw->tb matches what you pass in..

>  
> -	if (sw)
> -		complete(&sw->rpm_complete);
> -	return 0;
> +	complete(&sw->rpm_complete);
> +
> +	tb_switch_for_each_port(sw, port) {
> +		if (tb_port_has_remote(port))
> +			complete_rpm(port->remote->sw);
> +	}
>  }
>  
>  static void remove_unplugged_switch(struct tb_switch *sw)
> @@ -2088,8 +2091,7 @@ static void remove_unplugged_switch(struct tb_switch *sw)
>  	 * tb_switch_remove() calls pm_runtime_get_sync() that then waits
>  	 * for it.
>  	 */
> -	complete_rpm(&sw->dev, NULL);
> -	bus_for_each_dev(&tb_bus_type, &sw->dev, NULL, complete_rpm);

.. here pass sw->tb 
