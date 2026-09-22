Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBBD535FAC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078901; cv=none; b=UH7lquDN+l4Q0ea3XZILdpKmMpb8hgDnUuRsDfnLjIH0xLoGlLtxLkv3CSTdvyQIm6A0NP2t0NiRfxZiOsBPcRCtsKguwBCE7cFEuA/Bxbdd6XxVTLso8tmEQioAhGqM/3zv9b3XVNNz0soTM4us3hh6rGb+J6X9fsV+AKX/X/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078901; c=relaxed/simple;
	bh=KVHj4KsmvWTwNkzbtpslTvUQiMxIdwrZ6AgLlyWw36g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rs8SFrM2UbK06VPU1USIS8BQTgOSKuw9t0HWPcuQBzw2W3GYAxzEhTBImeKNF1WYqIfvjvZc2q0XOGBneeP1MUNhtv0YQu5O5fQUP8eqV1pWklnf9fS/geTOuVcqUyoy5VrSbuKteSDVQtogHS8QBSeoSRC7ad14OufNb55jZL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N5NJSt9o; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N5NJSt9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790078901; x=1821614901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KVHj4KsmvWTwNkzbtpslTvUQiMxIdwrZ6AgLlyWw36g=;
  b=N5NJSt9oA77l6nE5Hyer+xNJS7pZta8Mgnb4/rLjCy1rs0QbQPnvU+CO
   Zp6F59tbtxHMUQAqgbY54aQ4FI/yQ+9IxXUKLOTiQD45hq+Vj+/t+3NBD
   2OfRP1W7qppH1AR2U+f8m+wnhI9/aFeQoZU22fVHHtWltbLbBtz9YgDXm
   w+GNNvFUgp4VyzHnx1T6OWQYs+KclEUSlVQlY8IYmgMF0ntGfcQDs2i26
   ugx/9dtQV4vIHMyotmtVVQvkPoWKjjnT2I3yuMDiabTwKJ9SfqSRaRlu7
   wO4u7kcl+8zEyledVsB9V8vOw/owfE+LAst2TbbC1r2izPgWii8Pid27m
   Q==;
X-CSE-ConnectionGUID: yfnAnet0QBy25+UC5dFM5g==
X-CSE-MsgGUID: bsu8WdxsRRmGVKOu0SRASA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1178376"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1178376"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 05:08:20 -0700
X-CSE-ConnectionGUID: +wQKYIt2T9iL1b3TxLkOAw==
X-CSE-MsgGUID: NaSedg89QyKLDyQmZaVpwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277893184"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2026 05:08:18 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8zIF-00000000FSU-2Les;
	Tue, 22 Sep 2026 12:08:15 +0000
Date: Tue, 22 Sep 2026 20:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>, akpm@linux-foundation.org
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Antipov <dmantipov@yandex.ru>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kstrtox: delete saturation in case of overflow
Message-ID: <202609221939.FSyfaCW4-lkp@intel.com>
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
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20260922/202609221939.FSyfaCW4-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221939.FSyfaCW4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221939.FSyfaCW4-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_memparse':
>> __efistub_cmdline.c:(.init.text+0x13a): undefined reference to `__efistub__parse_integer_fixup_radix'
>> riscv64-linux-ld: __efistub_cmdline.c:(.init.text+0x154): undefined reference to `__efistub__parse_integer_limit'
   riscv64-linux-ld: .tmp_vmlinux1: hidden symbol `__efistub__parse_integer_fixup_radix' isn't defined
   riscv64-linux-ld: final link failed: bad value

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
