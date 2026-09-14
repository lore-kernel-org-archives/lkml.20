Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1141B8DC;
	Mon, 14 Sep 2026 09:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376953; cv=none; b=BW8RbHXpK0eY5ZCh350xCF4NbJIacuZD1VKLl0RGkGPvW2em8X6VjRaZPZlpmVosHYHSJr5IGg7wUYjvMmbi+jsWDYFdfs1qCx7Aqtg0mxnWRPmOShQYMZorM0yXj8joP1LTv9GC8qXrJv2brcCgmn7o6vvwJRLwNwicPBrFzqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376953; c=relaxed/simple;
	bh=ajsEAEFVhYkei0ULQCPMvG1Rjbuwpj3uhTVR2PEtLjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uPYTcetZIAWqP76ySlS65VzabR4+Jq9XNQ1kzORRyx5zAevYI3SNOD6xGV9qsbrieNvUJHodmRo7lo10i+n0FBeJCRNNoBP4cYvsDJEvX4eF10NMi1+XBmoUdW9XEYoiMVaFQ3Wipxs7BnMcgmvILNoag4cGIN9MB6DHqYV234s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evpk+TvI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evpk+TvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789376950; x=1820912950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ajsEAEFVhYkei0ULQCPMvG1Rjbuwpj3uhTVR2PEtLjk=;
  b=evpk+TvIi+5wBXjrspa2+5JmCjhPYJXaxqXnJdFZXJtiENFyat4k7Z1k
   rGGCym1KsfRJuKHLUMmCwzT2y/s11YVtndY5CosT4eaJcMnkI7nb2wdZh
   Wd3Zy8Oih7a1sAPm8nrZ1kfMX3BlS34NaRH6Ya6wERpC5IyjcgAryHp3p
   vKeIDupvQsk8ISBVG6W8/aCYwoy1pq06WZ84H8nMdGPxGmZTUR39DNmtN
   UVMAfsb/r3B9UdxDJ5h42O2lH6pGsMr4vBPL0l0DyO4bkMmPx7xw7N991
   d3EXataz1AT5herxXIvwmvK7CkXcFI8Oep57qcIKnxb5ilyMn9PQYXBl+
   Q==;
X-CSE-ConnectionGUID: O0PMClS7QI+SjAZW0cn1Yw==
X-CSE-MsgGUID: hFnek7NrTnmhoFhUzJY9Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="88667310"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="88667310"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 02:09:08 -0700
X-CSE-ConnectionGUID: iB80/MQiQEOUXB5GAPl9LA==
X-CSE-MsgGUID: UYLwprqfQ02uvaG76GQ8xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="989778"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 14 Sep 2026 02:09:07 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5FBA799; Mon, 14 Sep 2026 11:09:06 +0200 (CEST)
Date: Mon, 14 Sep 2026 11:09:06 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: CJ <firefly0158@163.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] thunderbolt: page fault on ioread32 in nhi_probe
Message-ID: <20260914090906.GD106095@black.igk.intel.com>
References: <6947b53a.8863.1a09f2784a6.Coremail.firefly0158@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6947b53a.8863.1a09f2784a6.Coremail.firefly0158@163.com>

Hi,

On Mon, Sep 14, 2026 at 05:02:42PM +0800, CJ wrote:
> 
> Hi,
> 
> 
> I am reporting a page fault in the Thunderbolt NHI probe path, triggered by a
> syzkaller reproducer.  The issue is reproducible with HEAD commit
> cee9395acd8043be0644b25c34bfa86623f2b935 (v7.3-rc1, Linux 7.3.0-rc1).
> 
> 
> The reproducer mounts sysfs, unbinds PCI device 0000:00:03.0, writes
> "thunderbolt" to its driver_override attribute, and then writes the device name
> to the thunderbolt driver's bind attribute, forcing the driver onto a device
> that is not a Thunderbolt controller.
> 
> 
> The console shows "BUG: unable to handle page fault for address:
> 00000000000556c0" with a supervisor read access, RIP in ioread32 (readl
> inlined), reached from nhi_probe and nhi_pci_probe through local_pci_probe.  The
> faulting address is a low MMIO-style address, which indicates a register access
> at an offset from a base that was never mapped for this device.

Yes if you bind it to a random device you get what you asked for. Don't do
that. I think syzkaller recently got fixed not to do that.
