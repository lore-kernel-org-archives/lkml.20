Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B252B535FC0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077368; cv=none; b=O6YI9ADeukBzqDDvJGlh+THulugUY2G2jDmtpEDRLaIS4pMvRcb+jzT3Sl7zgjeJeK+FbxQTPRSkfy9i6aEse/Kh69zKKNq7ukFR1+jMe3Zr/bdhyvPeLIFmob+7BT8kYaomEr0eCNXOXqU77h71OhzC1fdcZTUx2Uxb5IhPQZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077368; c=relaxed/simple;
	bh=S0++69ePo7g/MmsErIJ/Rb3kuTNAbdMFQ4A4zEseqPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCPGWfiBON3M3/QTshs+lvw8MR1+PpUmtmQfczY+gN6fTSJOTVt6wu8cIus1ZY0cMU1u43wjhR6fItzZOpUk2PoUodOnqOX3DzTuM5LVfLz63IHvgQM3/kRH3eqok9gxNo/BBWzzS/9fbYO/594lLOJzlWT606rKKuY4NF7z5c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/c040ZC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/c040ZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790077366; x=1821613366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S0++69ePo7g/MmsErIJ/Rb3kuTNAbdMFQ4A4zEseqPY=;
  b=H/c040ZCEbTdlhERrFHsbXFxOSXUfeiCCbfMFMRqtRxmZkVulNoNwYZv
   54n7DesxC55LjIAi/Y+KvCINsu+aIiwI15T2oRQvklU8xC7HTosRktjQg
   2Rie9Dj3ACZbKJ8141LyHiAVGTWMDhCrrVRFox3g0YKLNTlfMYJJ0nE8m
   3b4ixfcT0Yh3DKsV2GddFimIBN0/xR5Utc9i0YBo+R4hdIYQIoi2Bk1my
   DM2mp5BrVbXvOmoLZ9hAWUPF9XxyWeFviRA/ZZ8vUibVx7szfITnQw4ej
   XFMNe//xDq7CAhamFPNdnG3JIwKXnEN10LrJxAvy30mTgAb2i5r2Fgr8I
   w==;
X-CSE-ConnectionGUID: GnGvJWV8QGKdlixONyeItQ==
X-CSE-MsgGUID: 1oLIp5rlQVuYouZHh4UXXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90693779"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="90693779"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:42:46 -0700
X-CSE-ConnectionGUID: HdBW68K3TISlc0uels9N3g==
X-CSE-MsgGUID: tkw5HldkRAuFuwD+hqUfxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="271655138"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Sep 2026 04:42:44 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8ytV-00000000FR4-3MmQ;
	Tue, 22 Sep 2026 11:42:41 +0000
Date: Tue, 22 Sep 2026 19:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dmitry Antipov <dmantipov@yandex.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kstrtox: delete saturation in case of overflow
Message-ID: <202609221929.OSikd7q0-lkp@intel.com>
References: <a396f2ea-8de8-4eca-a216-ff69bc40fe85@p183>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a396f2ea-8de8-4eca-a216-ff69bc40fe85@p183>

Hi Alexey,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on akpm-mm/mm-everything linus/master v7.3-rc4 next-20260921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Dobriyan/kstrtox-delete-saturation-in-case-of-overflow/20260917-191707
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/a396f2ea-8de8-4eca-a216-ff69bc40fe85%40p183
patch subject: [PATCH] kstrtox: delete saturation in case of overflow
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260922/202609221929.OSikd7q0-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5dc57157f12f0ff676e823d9b4d98b45c07e5df2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221929.OSikd7q0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221929.OSikd7q0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: _parse_integer_fixup_radix
   >>> referenced by cmdline.c
   >>>               arch/s390/boot/cmdline.o:(memparse)
--
>> ld.lld: error: undefined symbol: _parse_integer_limit
   >>> referenced by cmdline.c
   >>>               arch/s390/boot/cmdline.o:(memparse)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
