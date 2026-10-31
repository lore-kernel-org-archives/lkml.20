Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793411656;
	b=JQUBHSadO2NN2e0Rz+aRzFntaKzp7OPQjNJ/ctbssmahJeJs7aWs2iqU0MA02s+WvXMR
	 megdAr8OWioueZ4Djb7tT1jQY91XMUUtNi2PByAgyAwyL4Eh8m3xvwJ4Fr4jRYP/4sRFf
	 y40Qh5U9gERHzl3UN/jpzr18AfRPWw0gO971NJdovh82XpurXYVqiQMvE0Xi2FIMe+7iy
	 IpVa6aF/AkHgntGLyZuUyHI7NFdnm9lQ+fyk6cIHNXsES3DeNLf8wtNHvKiAYyOesQBpx
	 viSrxx3aEulEr5pqnLl+x10ZvfRb3jGjE4ghKRhJ9LUF9/E/0y7seZkIf+9zSa0/9XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793411656;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=KmczHtFQ5eNC0VKMeLZI3CgTTru1oael/f4N4xiNguM=;
	b=bynjSVS7Do+HSwfaDIHbycy6h9kE2xLSXZpX4l9N0YvNXQS7t0yfQg9Cm8fFd0jhpRJF
	 CmXZTYHSeF8wnnK8cnoU4/j9l3YZ3nmmz2BSUYBniKuVaenyU7b7IAghEDKHROP7YdlA4
	 8ywIvHwngs/JRi1rRGf2GLG+Qr7WFL2QVdYzHevmdmnEl/gC4L1SyWPn5Vls8XxhlhnCM
	 38FDQsc9dg5N73uBx9tSzel6/wK5BiCdjrG68nOrSA5SyRK9TWey3kSfBbCkwMIcygcQf
	 pi0d/7hSyhiVKLnvTDq/NWCCNfU4GbUDvl7lBSlUDjAM0Axlt81RgEvCrSsB4zxjt8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gjpSDKJp;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2A0606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D2A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gjpSDKJp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793411655; x=1824947655;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BXWnVn+cRnGIcPln/CCZ9v574AOyyXQi2017M6apAN4=;
  b=gjpSDKJpDttlUUi9nPSLO1bZUPEUVWAtJEU4apo8/ZweEHFZXFzjOptO
   gS1v+4/IJ8cadLeyMTI7xoPOlbc1b5SYY5A/uj3VURcAiwjuOfLwr1gPp
   FlIV0uIY9BruGGngqpvzVx43UTpGMD68+7bG9A276wPgeVHjAqPwRGZen
   FKRPSwQiK7R+ftG/VClZjkbBBDnVcPWKRxq9/YA7xsFK88YjqvOEGz7oO
   lbKRxXDfsXxxEfCA33wvbtrwKJaGwHkRkiR1b/xcSd8iyzvWvNcjbcnuw
   JSMjC9ZadFJBeMkB58vLCIWrjilUUvCVEdnUOML7wuSV+vQlqP+SmLiwO
   w==;
X-CSE-ConnectionGUID: 2gvu2eHqRVCIzGeoZTDi1Q==
X-CSE-MsgGUID: 1nf9U70XRWCYFIe66kYlpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2212846"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2212846"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 18:54:12 -0700
X-CSE-ConnectionGUID: SJdlRg3VSaeXMuVKtYDpww==
X-CSE-MsgGUID: jMI6TXXwQYCcP2nxJNnpTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5921565"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Oct 2026 18:54:08 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMyIG-00000000cRM-0xgJ;
	Sat, 31 Oct 2026 01:54:04 +0000
Date: Sat, 31 Oct 2026 09:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Vladimir.Kondratiev@mobileye.com
Subject: Re: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
Message-ID: <202610310951.FopXBJty-lkp@intel.com>
References: <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>
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
In-Reply-To: <20261026-lrsc-only-v3-1-ec29c8190fb1@mobileye.com>

Hi Vladimir,

kernel test robot noticed the following build errors:

[auto build test ERROR on c03c1a14507dfaf8b856c2608f9ac216021fc222]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Kondratiev/riscv-build-kernel-atomics-from-LR-SC-when-Zaamo-is-disabled/20261026-112002
base:   c03c1a14507dfaf8b856c2608f9ac216021fc222
patch link:    https://lore.kernel.org/r/20261026-lrsc-only-v3-1-ec29c8190fb1%40mobileye.com
patch subject: [PATCH v3 1/2] riscv: build kernel atomics from LR/SC when Zaamo is disabled
config: riscv-randconfig-1001-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310951.FopXBJty-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310951.FopXBJty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310951.FopXBJty-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: -march=rv64im_zalrsc: unsupported ISA substring '_zalrsc'
   make[3]: *** [scripts/Makefile.build:290: scripts/mod/empty.o] Error 1 shuffle=1929180073
>> cc1: error: -march=rv64im_zalrsc: unsupported ISA substring '_zalrsc'
   make[3]: *** [scripts/Makefile.build:185: scripts/mod/devicetable-offsets.s] Error 1 shuffle=1929180073
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1424: prepare0] Error 2 shuffle=1929180073
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1929180073
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1929180073
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
