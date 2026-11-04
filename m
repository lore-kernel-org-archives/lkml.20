Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811368;
	b=O6uq+NV34MaS9ovVZ4d0wYbLwzH6yU1YtpbWsu+niq+7sdcvqmRliG++1364KSEXxHr5
	 lVuzbx1Ia2tspC/P6PhLnzw0o4ZQThxmUpKuS4/zfqw/3r6wsZy58zmMmasIer9ZlNVII
	 YVGmjBzyzt0K3z3a324RSnGn8tTIYhvQSjQQA3EtwKSTyACpUr34DQYY/1hE8x37tgsgM
	 f3PXDaqI+sPsRIdTCXSd53JBRuPqCqnkvAsKKyriVr4w9SzcnCo3rVIJrYasf/nwplpLa
	 OwDxu0ldIjUKqTuuVBh8zDL3AXM/PgCXbEacqqQMpnJ01DxqfMW52Ny7XWAdxTJrPfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811368;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QrSTBTKVvZvoBoFexX/f4J3BHiAFxWl31SsP22PpZo0=;
	b=0OZEtuKrNrtelz331F2uObKZnvN7Xr/4KaSZcOENbfOd8oDJVOuO2rTl0r4OMBY8aWnJ
	 ct7bcUH1Gqojhqq5pdZQYvfCD4Kf3Ny5HaaPBdJpb/Xhi5q5u29Oet4TCI12iUvC5Ljgf
	 CwIQV9aBFyF4946i8KWox/1yiYJvrBM5i5CvIYcBQtDhaS8imlO+moFEIXJYlAZ04p3oR
	 kO1mhtigHjXSNrrzFuQcKk2p6tlnZqqCRSO0FHp/fFFqSC8EJySltiV5o5tzCxnee3UZo
	 pifH2zVBm0NgNNjpwdhfuYbGGHm4VhYEBGRP1SaTtKjsQmBpoRLvuzcg+M5R2JXXTMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FeHvdPts;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20943606A329;
	Wed,  4 Nov 2026 16:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20943606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FeHvdPts
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793811367; x=1825347367;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GTK/899l7asGH7qQ7lG5p4rVflx34u2LUv1LGQrqB4c=;
  b=FeHvdPtsFUAN4gPRVyD8kRvRGJuFHnGQNZY1lXCgnwAAsH+eLmUtg9Oq
   ay7aBFBzZ9cyFM7q0e4XhtE++NNKsLIDe2gHJDVKqmw7Iljm3h9F46efo
   sU4sG+/BsqVsXbyuxoRHqatGm7zT43hfIqJWXb+Xt4qR9u5bs6tkX8BSD
   OhC2qbUqJowxAH0+3tDTYu40Fu3YVWMgk1pTzsGYJcWbdQQTDx3qcm1tq
   mF/QoiAHIFkgmT6hiR023Um8zrVyKa3Z5l6LmHcS2+v2bp52HNt0OFdt3
   YHp6AyEcV7L9PngbifCUnTAt68ursZzGaDCkr+kljbQ8pG7OSjPcvDqlL
   w==;
X-CSE-ConnectionGUID: sHfkaqmhRD6BXlLcytDmzQ==
X-CSE-MsgGUID: uAcGh5YuRRilyVlQMPtLJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2589127"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2589127"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 08:56:06 -0800
X-CSE-ConnectionGUID: qSb6qxkRR6WdnL/CDg7/yg==
X-CSE-MsgGUID: gM23zq3VT/Ght8Qz74jp1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6594868"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2026 08:56:04 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOeHJ-00000000kiP-2CDD;
	Wed, 04 Nov 2026 16:56:01 +0000
Date: Thu, 5 Nov 2026 00:55:36 +0800
From: kernel test robot <lkp@intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>,
	sakari.ailus@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, jai.luthra@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 14/15] media: i2c: os05b10: add 2-lane support
Message-ID: <202611050041.o415KE0z-lkp@intel.com>
References: <20261030104806.1223991-15-tarang.raval@siliconsignals.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030104806.1223991-15-tarang.raval@siliconsignals.io>

Hi Tarang,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tarang-Raval/media-i2c-os05b10-drop-unused-group-hold-programming/20261030-161750
base:   linus/master
patch link:    https://lore.kernel.org/r/20261030104806.1223991-15-tarang.raval%40siliconsignals.io
patch subject: [PATCH v5 14/15] media: i2c: os05b10: add 2-lane support
config: riscv-randconfig-1001-20261104 (https://download.01.org/0day-ci/archive/20261105/202611050041.o415KE0z-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050041.o415KE0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050041.o415KE0z-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/media/i2c/os05b10.o: in function `.L0 ':
>> os05b10.c:(.text+0x1784): undefined reference to `__divdi3'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
