Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA9647668A;
	Mon,  5 Oct 2026 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791200307; cv=none; b=NsciWiswPv5hjzB7yGcnZCAIN8dCjR0ImB8vn7eEvGOOIvXOhUrGOU76kkKGyaxKA6Kxr6EfcY9ZhpnvcAolgpVGQoLU1Z/OFDxhGUmX4fVhnjOBki/Y8AmhA+X3BWnD8lFn3+7sGbH4+YCj2x6W32M1uaihj5yS041XXJRZUag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791200307; c=relaxed/simple;
	bh=VzQKIhGw7R7374ozH7SMF5LPqzzlzHosRUw2ajKeTso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuVZyDtwcp15/0rK77Cd+RPljyj0LDSGCO/ZJ3TdzL1OHgdpELewNtTf+7J/hBR18eb9c4hP/YvWSIdGTpj/pXsneiBPfcWVRQTtD90XoH5iVVqJVP3G7uq6UVkwFuun/NYfMhTQFQsp2MifWLapffkxK4Bd8nLESPDVKrhr2Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhYE//KJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhYE//KJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791200305; x=1822736305;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VzQKIhGw7R7374ozH7SMF5LPqzzlzHosRUw2ajKeTso=;
  b=hhYE//KJEPiAFos6nr0bK9OOa36XVs682bfUREqVLq51lE1XXigwGici
   FRJu3DDIvvaeLsz0+nUXVT+1+p77w+tnT+Eyp9WBvp3eQHmdjNxx12Qeq
   AdowEK991iHG3SSrMxua5EC6Egz+XNtPdeN61EIxFdYsqHLhVB4/4QvCw
   P6MVuQlHMSYgy+tq04MlC82xLLhen29JQjlZopgTt0aIiClxUSW36SJE9
   NKhGoOAoJB6RXvmHbfDamku8ctl3aNTbVYdaPyjIx1yOiODmXIfSOb+PU
   XZ/jPbfYwgrFl8zkS/iLVPEoUVy/bF9mL6zS5Q8ojJaiE8cXqfXVkD5EQ
   g==;
X-CSE-ConnectionGUID: WT5KD33wSPauUMJ4dhUj7Q==
X-CSE-MsgGUID: GkxbXQEyTOifPJbw+j3yrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="15196"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="15196"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 04:38:25 -0700
X-CSE-ConnectionGUID: m2t1VYghR26kX3fH5rzrjQ==
X-CSE-MsgGUID: Rq6+CWI+SeiyE0IgH+yQ4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="840356"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa012.fm.intel.com with ESMTP; 05 Oct 2026 04:38:24 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6478699; Mon, 05 Oct 2026 13:38:22 +0200 (CEST)
Date: Mon, 5 Oct 2026 13:38:22 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jonathan Gopel <jgopel@gmail.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Do not RPM complete unrelated subtrees
 on unplug
Message-ID: <20261005113822.GL176164@black.igk.intel.com>
References: <20261004120255.GI176164@black.igk.intel.com>
 <20261004171404.448474-1-jgopel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004171404.448474-1-jgopel@gmail.com>

Hi,

On Sun, Oct 04, 2026 at 11:13:50AM -0600, Jonathan Gopel wrote:
> When a Thunderbolt device is unplugged, that switch and every switch
> subsequent to it on the bus device list is `complete()`d, not just its
> child devices. In the case of multiple domains, it may cause, eg, an
> attempt to `complete()` the uninitialized domain 1 root switch RPM
> completion on unplug of a switch from domain 0 (though ordering is not
> guaranteed numerically sorted).
> 
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
> This patch gates the `complete()` on an additional condition - that the
> Thunderbolt domain matches the domain of the device that was unplugged.
> 
> I only have a single system with multiple Thunderbolt domains - the Dell
> XPS9720. I am consistently able to reproduce the Oops on that system.
> Since running with this patch, I have not seen the Oops reoccur. I have
> also tested it on a Thinkpad X1-Gen12, and that system boots and runs
> well with it, but it only has a single Thunderbolt domain, so it does
> not exercise the multi-domain failure case.
> 
> Assisted by: LLM
> Signed-off-by: Jonathan Gopel <jgopel@gmail.com>

I dropped the Assisted-by per your previous email, did a couple of small
cosmetic changes to the patch, added Fixes and stable tags and applied to
thunderbolt.git/fixes, thanks!
