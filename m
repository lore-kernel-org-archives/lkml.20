Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCB6524AE0;
	Wed, 16 Sep 2026 15:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572571; cv=none; b=YPtbRRhbcKJe7Cq05sP+8IkV6DtNi+Bh49hjiIrUWID/i8vaY4RjPVs31kq4aXED0PWpTaEJJGdP6W71F8UPbyL4HiTFePeJxVcbqYAC8MnP59/Skok96CAijjujzhJl/ZApI1JjBpFLvNWk/5RDGWiWKmjoBGx6pDcxfGrz9+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572571; c=relaxed/simple;
	bh=FZhuVYRUrIPMg/4pcJsz/MlmpVb5ALInA9iwPzaekcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZesTMDjbWDiZNF4lAC6NYo76AVfcTmeRaZD/Edi1kRgvZgn0Xf3f8N1/8gl/AbeZxRnCD/TxT4ZG+4kUJ3mLkqYVkGnFQAb9WAcNj+hW4fUprPHo+P4F/fAlzCoaORHwwk+Vxp84LWRj+Cg4j6jr3s+GINscHG7ggTMX6PSCfbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mR0gpZoU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mR0gpZoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789572568; x=1821108568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FZhuVYRUrIPMg/4pcJsz/MlmpVb5ALInA9iwPzaekcI=;
  b=mR0gpZoUEVSu9DlIJtbCaqeVuxcnoNFeB70g/t5pii2B78w+lePH6SDG
   5xc3rFmcdiHhEzwLMSjRtAMsKHNSqz9QAeKAEmbyxs1+QVEeRYu1OeWFW
   xvDS0GT+vaMfG51Tb86Z7jozvev/MrM66PJlDnNuh9LMPSqk2P9h8NviD
   n7DVxIs3qZyLwxbZe43lyXT4xxS+1W8rvTn2rVObnyN8Hr0tRePOikjoM
   rol5wTP0p44GwcM9/21qV5nMQE1KiInxw2VV2/2+0Vfij633XwY+5d73t
   1jwuPw2qpcuH/4iklaXfB6QyulhRNogNX9UTqLQm+BPK4CBkfbA6qlqEl
   Q==;
X-CSE-ConnectionGUID: YPFEfl1sS6SaLbD3AOCWAA==
X-CSE-MsgGUID: G2NwwAX9SmOHj4zEhBrC1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101296219"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101296219"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:29:24 -0700
X-CSE-ConnectionGUID: kZ4lK1pcTdap9WyxR5jDaw==
X-CSE-MsgGUID: RnaPJ5qkRI6pj1HaeSpBjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270739144"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:29:20 -0700
Date: Wed, 16 Sep 2026 18:29:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>, Arnd Bergmann <arnd@arndb.de>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Niranjan H Y <niranjan.hy@ti.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Julian Braha <julianbraha@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt766: fix HID dependency for SND_SOC_SDCA_HID
Message-ID: <aqq1zrURx4Y6_Nfo@ashevche-desk.local>
References: <20260915211658.1671821-1-arnd@kernel.org>
 <f9c9aef3-6e0b-4f7e-914e-35a82b5f962a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9c9aef3-6e0b-4f7e-914e-35a82b5f962a@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 04:10:08PM +0100, Mark Brown wrote:
> On Tue, Sep 15, 2026 at 11:16:34PM +0200, Arnd Bergmann wrote:

...

> > config SND_SOC_RT766_SDCA_SDW
> >  	tristate "Realtek RT766 SDCA Codec - SDW"
> >  	depends on SOUNDWIRE
> >  	depends on SND_SOC_SDCA
> > +	depends on HID
> >  	select SND_SOC_SDCA_HID
> >  	select SND_SOC_SDCA_IRQ
> >  	select REGMAP_SOUNDWIRE
> 
> Should that be HID=y || HID=SND_SOC_SDCA like for SND_SOC_SDCA_HID and
> SND_SOC_SDCA_CLASS?  The dependencies on _CLASS should stop the
> problematic cases from actually occurring but I'm not sure if it stops
> the warning.

(Based just on this comment without looking into details) there is also
'depends on FOO if BAR' syntax that might be useful.


-- 
With Best Regards,
Andy Shevchenko


