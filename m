Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0920524E4C6;
	Thu, 17 Sep 2026 04:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789618437; cv=none; b=eUHd9kXmgzHVI32k0ZQ/xAhK6aLLRJF1a6z5S1qMD3TxdmvD+bWup74tkRiyJN5a1P/FCcHlDpin6wvrDfJKD+VXOlvBV4kdZ0NkkiYDFgkX8Aimf8xOm+MRrDHZcS/0cej5W0NgYt67jy4SfEH0kZJP0c7v1th3d4mHgqJR7Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789618437; c=relaxed/simple;
	bh=Bdl76ZWrWZL1veswYShU0im+JoWvvsZJt7p0osg10FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtClchuKgNO9Z5ql3jMZelKom8ZwZrDtLQT5Wxm3mf7tQI/GnxXkh0DTFahhhOM71sC3hMLZc3dem5Cj7zKz74wOyKNR/gPu8sqwpQymYKjzu2uilJBedjzWFTOeKeP/YyOyyzzTp4O2gQ3Glm+HO5uYYOSzL78CLX79hV1BssM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUfvjPp5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUfvjPp5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789618435; x=1821154435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bdl76ZWrWZL1veswYShU0im+JoWvvsZJt7p0osg10FE=;
  b=nUfvjPp5qFJeSsRsHIprJOeXeqyiuB3O8lxm15ff8yevhUDYps/uMTDF
   7uIXQi0llxstlp1dW4mtm5l+JRUdix9LVslOXkINk+FKC7f8ZUPqbftB5
   qfp1+Cw+Fm/3z+4Np6NqT4Dpoepzulo1J2DGrXbm2Zc7MyCS8IrhLXi5X
   i41Jf8Mi6avXPCrybigLFUn0hjdXo2+8kEBp7RjRV87JPyt1Wq/1Q4uCD
   54wxd8X9jBqCRm6C8MXv0V5u9/XQAnmlLlfrNupzO4Ivf4i6Z1ftAyes9
   48SfhjjsaEJ0TvRl1gai+P1NYSEETeo63ISxqXQrxLq5ZWW5f+YCcQdHI
   g==;
X-CSE-ConnectionGUID: YkojIHw1SnS1j3ijAla9Bw==
X-CSE-MsgGUID: 20cZYpFhRbi5PNJluo41OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77565444"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77565444"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 21:13:54 -0700
X-CSE-ConnectionGUID: moFQ/QlpTCKD0laV0CNgvw==
X-CSE-MsgGUID: BwKUgnpAQ4GvTcI123lUFg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 16 Sep 2026 21:13:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AABAF99; Thu, 17 Sep 2026 06:13:50 +0200 (CEST)
Date: Thu, 17 Sep 2026 06:13:50 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>
Subject: Re: [PATCH] thunderbolt: Make PCIe NHI support opt-in
Message-ID: <20260917041350.GT106095@black.igk.intel.com>
References: <20260915-topic-tbt_pcie_optional-v1-1-47c4a3d129bd@oss.qualcomm.com>
 <20260916075924.GO106095@black.igk.intel.com>
 <f0882d3b-fb75-4c57-b76c-10ac61a5780d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f0882d3b-fb75-4c57-b76c-10ac61a5780d@oss.qualcomm.com>

Hi,

On Wed, Sep 16, 2026 at 06:10:59PM +0200, Konrad Dybcio wrote:
> On 9/16/26 9:59 AM, Mika Westerberg wrote:
> > Hi,
> > 
> > On Tue, Sep 15, 2026 at 07:04:10PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> With more implementations coming in, one may desire not to enable
> >> support for the PCIe-attached NHIs. Allow it to be built as a module
> >> atop the framework.
> > 
> > Is it so that Qualcomm platform does not support PCIe tunneling at all
> > then?
> 
> 
> No, this is about letting one opt out of building in support for
> PCIe-attached NHIs - tunneling stays intact and our hw
> indeed supports it.
> 
> The PCI NHI driver (which this patch makes optional) binds host
> interfaces. TBT PCIe bridges (e.g. PCI 8086:15d3) on connected devices
> with PCIe ports are handled by the pcieport driver.

Yes okay "typically" they go hand-in-hand and that's why I wanted to check.
So you have a PCIe root complex that then exposes the tunneling root ports
as well, got it.

> [...]
> 
> >> +config USB4_PCIE
> >> +	depends on PCI
> >> +	tristate "Support for PCIe-attached USB4 and Thunderbolt controllers"
> > 
> > I think USB4_PCI and so on.
> > 
> >> +	help
> >> +	  Say Y here to add support for the USB4 and Thunderbolt host
> >> +	  routers attached over the PCIe bus, commonly found on x86 PCs.
> >> +
> >> +	  To compile this driver a module, choose M here. The module will be
> >> +	  called thunderbolt_pcie.
> > 
> > thunderbolt_pci
> 
> ack
> 
> [...]
> 
> >> --- a/drivers/thunderbolt/nhi.c
> >> +++ b/drivers/thunderbolt/nhi.c
> >> @@ -548,6 +548,7 @@ irqreturn_t ring_msix(int irq, void *data)
> >>  
> >>  	return IRQ_HANDLED;
> >>  }
> >> +EXPORT_SYMBOL_GPL(ring_msix);
> > 
> > We need to think what is going to be exported and how. For example here
> > ring_msix is pretty common name so if nothing else it needs to be properly
> > namespaced and that should be the first patch in the series.
> 
> Right, maybe EXPORT_SYMBOL_FOR_MODULES would be more fitting..

That or namespace like tb_ring_msix (this one requires probably rename
patch first but may end up looking more consistent wrt naming).

> > Secondly I think it would be good to have this whole thing as part of a
> > patch series that adds the Qualcomm controller support so we have an
> > explanation there why we are doing all this.
> 
> This change isn't really necessary and my reasoning here was to
> let the user decide if support for this specific kind of controllers
> should be built, just like CONFIG_I2C is separate from the dozens of
> implementations.

Yes but there is really no other option at the moment so it does not make
sense to provide yet another selection to the user IMHO. Once we have the
thunderbolt_platform (and thunderbolt_apple) then thunderbolt_pci makes
more sense.
