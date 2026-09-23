Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DA041836C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203731; cv=none; b=Iq72mxGvUoxyql7IbbdstLRSHtVZrTpiEU4LAIUtuEnowE3keDksWMpKvKrl16ALle1tWE7A9xPEXdx4JzRE/12mvgAF5+oSI2p0heFD9nqfGo//KUnMnZrVdrzaqlw7oQCX8hSXNJT7WyrIyAxciS2cT5OIqcrYN0fTJuID1nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203731; c=relaxed/simple;
	bh=NmEv/qxXrsEi6cbyCoQZggpw+8yoPFgh6OmcmV8YW/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdMXkEmZmahY4ON94Hyq++lMzwijqPDgm7MSD3nGlv6iO+8Jz0UT2MEu+a+Edyxcvpxy2YFqvGc02Ps1QamOdWmqwvLj/xOPwvxaMeeO3/fbHLPPC5iAq5cpJLNJ3CaUVDHGaVNDj4qHXINCAS7bpveDXT0XSRMpet4AVN+ymSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cdrgcv5a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cdrgcv5a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790203728; x=1821739728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NmEv/qxXrsEi6cbyCoQZggpw+8yoPFgh6OmcmV8YW/s=;
  b=Cdrgcv5aWYztW0Vt2y4BJU4X522A5QbKerj58Cr0U0hg0qcCyFvCgSKt
   hz+wOoDi/QfoOrGRDhDSDmjyX7/P/LT1hQC7nLNE+BjdJ9RF9PeyfxoL6
   nFzoDUR0ji1T1MQ6ikSCjXFU/DpZZazdn5Hn8OKbyBlf1h1tQ1RhaVf/u
   AJeHsHN7qBSJxV/3R+0lrDRVrbtoDCzQuRHUj3FEqAouegcVyTBoiicIV
   bGAHiSFJSicnwLcNZU5wLQINWdsX81higZtqTZ0HZiCmFyZLVQm6zh351
   plErj3YDsV5DdvBTQ7aA0VCNWIEbrubaQJuQvc8zPcQcWl6BV4T7xnAiI
   g==;
X-CSE-ConnectionGUID: dBJjomF2QRyQl6m50D78sw==
X-CSE-MsgGUID: uJV9VH7/SQa2lGGNJBnfeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="102311506"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="102311506"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 15:48:46 -0700
X-CSE-ConnectionGUID: Gkf+Cu2TRRW5r95GNuXO2w==
X-CSE-MsgGUID: tB01F8yuSC6NmYi8YE7VTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="272402617"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2026 15:48:44 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9VlZ-00000000HtK-0vuu;
	Wed, 23 Sep 2026 22:48:41 +0000
Date: Thu, 24 Sep 2026 06:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev,
	Samuel Thibault <samuel.thibault@ens-lyon.org>, w.d.hubbs@gmail.com,
	chris@the-brannons.com, kirk@reisers.ca, speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] speakup: Drop now-unused serialio operations
Message-ID: <202609240615.5JumpThZ-lkp@intel.com>
References: <20260922063047.1392828-1-samuel.thibault@ens-lyon.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922063047.1392828-1-samuel.thibault@ens-lyon.org>

Hi Samuel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus linus/master v7.3-rc4 next-20260922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Samuel-Thibault/speakup-Drop-now-unused-serialio-operations/20260922-083047
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260922063047.1392828-1-samuel.thibault%40ens-lyon.org
patch subject: [PATCH] speakup: Drop now-unused serialio operations
config: powerpc-randconfig-1000-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240615.5JumpThZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240615.5JumpThZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240615.5JumpThZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accessibility/speakup/serialio.c:24:38: warning: 'serstate' defined but not used [-Wunused-variable]
    static const struct old_serial_port *serstate;
                                         ^~~~~~~~
>> drivers/accessibility/speakup/serialio.c:20:37: warning: 'rs_table' defined but not used [-Wunused-const-variable=]
    static const struct old_serial_port rs_table[] = {
                                        ^~~~~~~~


vim +/serstate +24 drivers/accessibility/speakup/serialio.c

5e6dc548e453c6 drivers/staging/speakup/serialio.c Chen Gang      2013-10-31  19  
3ee0017e03cd79 drivers/staging/speakup/serialio.c Jiri Slaby     2012-03-05 @20  static const struct old_serial_port rs_table[] = {
c6e3fd22cd5383 drivers/staging/speakup/serialio.c William Hubbs  2010-10-07  21  	SERIAL_PORT_DFNS
c6e3fd22cd5383 drivers/staging/speakup/serialio.c William Hubbs  2010-10-07  22  };
defaa9ad58dfc5 drivers/staging/speakup/serialio.c Arushi Singhal 2017-03-14  23  
3ee0017e03cd79 drivers/staging/speakup/serialio.c Jiri Slaby     2012-03-05 @24  static const struct old_serial_port *serstate;
c6e3fd22cd5383 drivers/staging/speakup/serialio.c William Hubbs  2010-10-07  25  static int timeouts;
c6e3fd22cd5383 drivers/staging/speakup/serialio.c William Hubbs  2010-10-07  26  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
