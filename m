Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6A81D9A5F;
	Thu,  3 Sep 2026 05:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788413835; cv=none; b=W7wQ3B/YMjkHmDG+a5zhyDLiX0Siwrj7AEDUiEmYfGo0vbgc0eUNMHpCwQqH7Yo5bNhpKDPWk7xArgdxdOafY5/0HKXc9HahUL1Vff0zzMF8+CfN6bbf6c95DQ/cAsSk4xdJogwsGWmjE7E6r9ssbozIfAp7EnWr8eV2o5CRy6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788413835; c=relaxed/simple;
	bh=Z8tTZlVgL94I8CKtvPZwYNu164VkXj+v272ZBtYpEVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcIxvXGm7P4ogUZgRJ9E3i0VhkZ9J7lVigbQKHLb62ZDvwsPsKJWEdiH3PXc28tCr8AG3AR8zvxgb2BO6Bsv9dEmxwrxAfrQIyaK2RO7wAV6KhkLRimMEUhFwn3R54AoUEQKkurfHWp/ynvkCCv4YiPoV4lzGSKGD7RBDXGBGnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9cPRXCR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9cPRXCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788413833; x=1819949833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z8tTZlVgL94I8CKtvPZwYNu164VkXj+v272ZBtYpEVI=;
  b=S9cPRXCRWdyDIFJWmuz8/S9D6dNNcvnja/ODkYZ1pWZx/47hVyz50q+y
   ULZ/7jxE21I1KleXiBYfV650S5ks3zFfameKiWMCmdn0n9qNhj24gF9/u
   mMkvM4dzjblw0qRPLe0D3aSeExa2mOIet6dNskzHzzbCGh5vphsmEEQ+l
   kv4t0MO7unqN9T3s+Q2fwKD+XByB76dy5S6wmSNzefNdc71jB4aDrplU6
   foCptiea3AgOcuJretWVZwvQ9wSf79bEcNYSVsBlSEzF/aWojhx0O0lUj
   dZkx0VHepR67YFsiCIP1DxB/dvdVIm4NiVQRm1ykydidO1CMj707uaeZb
   A==;
X-CSE-ConnectionGUID: Ivt/SXntSlaaKGKwlL8qAw==
X-CSE-MsgGUID: g5zx/hfWT5GyClE/2NiA+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="99481577"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="99481577"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 22:37:12 -0700
X-CSE-ConnectionGUID: oOHZDl1MSbyzQWqEsSxWtw==
X-CSE-MsgGUID: Zi7mP9elRdGdQNg5DAAXmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="266365243"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 22:37:10 -0700
Date: Thu, 3 Sep 2026 08:37:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/16] media: Add Yoga Book camera support
Message-ID: <apkHg_No1Dwtn6jB@ashevche-desk.local>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <apj7LiYzFEIByPvV@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apj7LiYzFEIByPvV@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 03, 2026 at 07:44:30AM +0300, Andy Shevchenko wrote:
> On Wed, Sep 02, 2026 at 04:53:29PM +0200, Maurizio Casciano wrote:
> > 
> > This series adds the sensor, bridge, AtomISP and lens-actuator support
> > needed by the front and rear cameras of the Lenovo Yoga Book YB1-X91.
> > 
> > It covers the OV8858 19.2 MHz clock and Cherry Trail gain programming,
> > OV2740 288 MHz link frequency and manual white balance, firmware IDs and
> > IPU bridge data, AtomISP raw capture and CSI-2 timing, and the WV517S lens
> > actuator.
> 
> > Changes in v7:
> > - In patch 2, keep digital gain independent of the external clock and
> >   expose the manual red and blue gains as separate controls, as requested
> >   by Sakari Ailus. Keep green at unity and accumulate register-write
> >   errors across the three manual white-balance channels.
> > - Move the 24 MHz PLL and global timing registers out of the common mode
> >   tables into revision- and lane-specific arrays. Select both 19.2 MHz and
> >   24 MHz clock programming explicitly when starting a stream.
> > - Clarify the patch 2 assistance disclosure as
> >   `Assisted-by: LLM [Codex] [Sparse]`.
> > - No changes to patches 1 and 3 through 16.
> 
> Wait at least a few days before sending a new version.
> 
> There will be a v8 as far as I can tell, but send it next week after all comments
> were addressed (or settled down).

To collect given tags use `b4` tool.

And general comment about AI, try to do some work yourself, AI does not
guarantee 100% correct results.

-- 
With Best Regards,
Andy Shevchenko


