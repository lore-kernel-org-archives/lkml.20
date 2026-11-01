Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793509563;
	b=OBIbDin0SNOeCd7crzgZrSoouW8YgJRQVUPpnezlIQDvgkkoJENsCbP017fkrcUZItiV
	 rpE8ShM28Opfx6Lfcnkbd4HPRhd7m8vRLteNgeHeeTF6Loo2yaw0WMTbhe00DoH3FaHPd
	 Fy349XjN3yL2ALGXpHPj0CcjvV1JhyRRVG3OTIsJaY0pkx19WfHyqbUg1ZId/GVlGNJcj
	 307zCntdAarpaic0LdaC7C6pwrONUrhUInzMrITEoo6VYBJvglz4UACqtvn92myL+2Nr8
	 H7WZXJHOT+/IugQGomASwNz4JCT+vVyfYTLVwVUTsD4O0GA7tlvrVZLohoX3d9XSpzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793509563;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=oKt03IBoj025m7//QTcbRHFKe7Z2qoFZaKWmpUpZm2s=;
	b=0FZkJQGcBuJu/SEG75QbNpo5jACM4qPbvyeYU9UZXDnXohvwhUSBuN7/z62Ox/SxOve3
	 ZV+IDrBpL7UfhlCc5szMnloOsmg603XRKPXPx/3waeHR6RR1la2bQ3z21MERMX//LDnBI
	 ZtaMi3ff0mqScWHnknP4/zRpLgeuIGATbjG02Q0DiVAuGBz6C/QrFjeY49num3Fx+MSXA
	 sycTpQAoTNmysxhlQrS9dH+ORQPaVC5xVC6S1WU4UIVxzGZKvk3qyufe/c3xBZOHkutjM
	 0/U64Hd2pnv3eiNHqCrszI6PHsatoDkTFypjxklddPzrxhoYUffYpYo1t3sKStD8Dww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Wi6VUG/e";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB45606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 05:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB45606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Wi6VUG/e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793509561; x=1825045561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6HCXN7YioSzOzhr/4EO5NIRQku4j7L9Jr8wKtgoLglA=;
  b=Wi6VUG/ermI4EqM+edbv1oTfrCn9Qn2SkxWbjPB9HVnAmJFVbAD9Pem+
   XIMEVPfdGjoimHIgS42rexw93kGdfg3r5CzfQY89tY2QYMZUb9Y0Mm/tz
   A6H60MorjQjen0s/ZLX+cYbXFg2Pzi4gbWEtixP4e3moNPqJbC/EnpdGf
   /Uydv8JI/jUWjAstMeAsQCKT2GVsniUd8SHmX8Uxuz5ZDV/rgkDi81WXq
   6rCme1vu45xE0gesUvm5EXLyTO2g0INsKVNHxgWNn2uZPDCwI5/BXUWB2
   bHdk5zcZqgPkkl3TbY7V5UPOq2ME844hcV72Y1dqAlpHY975IGTF1hF2D
   Q==;
X-CSE-ConnectionGUID: gooeEcBOTOOyfH5GC2eJ4g==
X-CSE-MsgGUID: auM09aFrReColUADeNAFHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2103800"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2103800"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 22:06:01 -0700
X-CSE-ConnectionGUID: dKH/iTkPRkKQyZlw/QZq3Q==
X-CSE-MsgGUID: w8aILaraR9iujBxEWgLFag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="6114101"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 Oct 2026 22:05:58 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNNlT-00000000dRc-3bGh;
	Sun, 01 Nov 2026 05:05:55 +0000
Date: Sun, 1 Nov 2026 13:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jenhao Chen <jenhaochen@google.com>, Nick Terrell <terrelln@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Minchan Kim <minchan@kernel.org>, Martin Liu <liumartin@google.com>,
	Ben Wei <benwei@google.com>, Jenhao Chen <jenhaochen@google.com>
Subject: Re: [PATCH] zstd: Build with -O3 and use shift mask on arm64
Message-ID: <202611011223.PoKyD37Y-lkp@intel.com>
References: <20261030121633.258612-1-jenhaochen@google.com>
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
In-Reply-To: <20261030121633.258612-1-jenhaochen@google.com>

Hi Jenhao,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jenhao-Chen/zstd-Build-with-O3-and-use-shift-mask-on-arm64/20261030-121633
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20261030121633.258612-1-jenhaochen%40google.com
patch subject: [PATCH] zstd: Build with -O3 and use shift mask on arm64
config: nios2-randconfig-1000-20261101 (https://download.01.org/0day-ci/archive/20261101/202611011223.PoKyD37Y-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611011223.PoKyD37Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611011223.PoKyD37Y-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/zstd/zstd_compress.ko: symbol '__divsi3_table' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
