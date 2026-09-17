Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495704DAFAF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653805; cv=none; b=nO3AXmAyp9Q6K3yXakHEFvlUPNKNaHD/ampfwAHM3B9og2p5sbmKKVCFWyviU+VAx5zarcEJBxh3pKonrsMHwtoCRMA1UHum5V5F1nwGvuu2pKYSofZ0J+VI+2cgRjBmKn0e3FN2Njmlmqz2Oc6Fuxpgmxh+8FkzfMrdCP+72ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653805; c=relaxed/simple;
	bh=MNuCgPhjq7eFUXvOQpTue2nlfGjtL02CBVVF84zjcak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tflwhny1vuiX3wno2Q/EsvPLojME8fejiNrVN7YGvT95XSXd4qY8Jx4KO+i0+Lk4gHIblgPsJdBRyBVWDDfBcRrqSfGmlSc3TlhHMDOQXPs6Nv1VWs2qA9WgDpMiuHyrrGKJAt4X5rCPiQvgoUVd1OuQZPSzWFJxw53rhitgnRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FG0g+QLY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FG0g+QLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789653803; x=1821189803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MNuCgPhjq7eFUXvOQpTue2nlfGjtL02CBVVF84zjcak=;
  b=FG0g+QLYugOTTdnAurJUp6cpfOAj8wQwAojHtg+dAC/2Y0tKwR03ZnLM
   MWHipuioh9EptlaotIrQMfQ8+Y/ycl3vRQ1RlCK8PAq24NCJpVYy7/dTZ
   ITSfgtaQI5hUWp+RTqkgYwfelw/EIfFcuIyaNvbzc4kXv++m9pX5YZHod
   0qfRBntX/bQ0w7zvjqpPO6CztRTh/SQY8i1TPzToOzTNF80YU6npu94Ch
   SU8xVBFUb1Wb/RkXVHdVlgdjNDoZmk2AeJSaPQNJWg02KhJQyo3JSnwIq
   yzl/Mv2oZ7qt4i69bgJ4H7FTFQ000nnCS8oNnySucZ42OdWJ0EbWyqPps
   g==;
X-CSE-ConnectionGUID: FeZyCHiUTjGV3Veg6h7KrA==
X-CSE-MsgGUID: SnEA1o8SRDaYcphcYvnfDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89211507"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89211507"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:03:22 -0700
X-CSE-ConnectionGUID: 4Ii1IOdYRGCgpo8/bMaNEQ==
X-CSE-MsgGUID: ue3G1vgVTPiRhvVPC5r3JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="297303900"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.11])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:03:21 -0700
Date: Thu, 17 Sep 2026 17:03:19 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: akpm@linux-foundation.org, andy@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] resource: Replace open coded resource_overlaps()
Message-ID: <aqvzJ6N_BKiEcOFj@ashevche-desk.local>
References: <20260915085353.3518153-1-andriy.shevchenko@linux.intel.com>
 <0D81679D-B746-405C-8333-CF0FF69E094E@mainlining.org>
 <aqpA50d24xu8NyGS@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqpA50d24xu8NyGS@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 10:10:31AM +0300, Andy Shevchenko wrote:
> On Tue, Sep 15, 2026 at 07:25:33PM +0100, Bradley Morgan wrote:
> > On 15 September 2026 09:53:53 BST, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:

...

> > >+		pr_debug("resource sanity check: requesting %pR, which spans more than %s %pR\n",
> > >+			 &mem, p->name, p);
> > 
> > This swap is not mentioned in the changelog and it does change the
> > output a bit: %pa prints 0x1000, %pR pads the numbers to 10 hex digits,
> > so the debug line gains a bunch of zeros. Debug only, so I don't care
> > much, but a line in the changelog saying the print changed with it
> > would be good?
> 
> Sure, Will do in v2.

Andrew already applied that, but if you can suggest the text, he might amend it
there. In any case it's not a big deal, I think.

-- 
With Best Regards,
Andy Shevchenko


