Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2F02F3622
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792121381; cv=none; b=RrjA1x/ZNPSShOn/TGdVBozGob5WP/sQtfSe2BHBGDk4iDeN5TvI2wyrSwbmfYBAL3ugJiRHyENEfMJVjuBH1rjI4j/SKzDbCjf59tfS7cwef8Nj6tSmb1Zsthdvq8z6zS7F+cZ9WUQ3DHeP7jMwhlOUDHbhdNhbfY4A2KcqwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792121381; c=relaxed/simple;
	bh=71GSIcxEMpRjtYoSi37Nnh4/rxvAHJsP/1K6nZ0XMcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usoCbSCTCOEpA7hRskVX8v0mAARAEm5BGD3Fvi4zfTyGveqBdgjMZlawZrapDEmNtn9RpzLbc6WSsqJXgXz99yt1PDRIobbZZATyvc/WpOHwC+VBD/HAyaUrzwin0atT8af7Ert14F9otSYj35Iz0cQ1hTPVyvmwvx9A3pphcG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H8SEks8+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H8SEks8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792121380; x=1823657380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=71GSIcxEMpRjtYoSi37Nnh4/rxvAHJsP/1K6nZ0XMcw=;
  b=H8SEks8+2are8H+MG4HdhU8NnJjZ1jg/TXC1dd60t9YK75ZNzjfX3o/W
   vaVWbRiVJgSZmtpbmc984V5siysZhE8wuMMxe5DrbEJ+WQa9rSUrEyehw
   kgJdeZH+g4/6Bx2NhROCvpfbvHtkz/ApFoGStf1J7a2MM0kaJqe9kLyc/
   g7RX0J52wGiTGgqBnJToSIlU2jw/Y394IAxyqqwLcaAE8ZEnzNCegUZki
   vRzBx5eq4E0I03FIVv/EVoXY78kEjxtBGu5btblEEVV0KKRA3kckePTZI
   5ngQ2QHonIPrcgj09fUIwHuUlTKY2ANh06XZwejZZnhxDl2rw4iAtx3R+
   Q==;
X-CSE-ConnectionGUID: 202rgx+oSNWY98yypJKolw==
X-CSE-MsgGUID: Wh49udBKQKiMOgXiJ+Beog==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="934438"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="934438"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 20:29:39 -0700
X-CSE-ConnectionGUID: aMKarZ25Qi2Ha5sEpfWFpw==
X-CSE-MsgGUID: MkCdbVcdQZ2S2gywbQkQuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1856314"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2026 20:29:36 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHYdQ-00000000HWE-2Psi;
	Fri, 16 Oct 2026 03:29:32 +0000
Date: Fri, 16 Oct 2026 11:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>
Subject: Re: [PATCH v3 1/2] vsprintf: Don't leak pointers for %ps without
 KALLSYMS enabled
Message-ID: <202610161107.ckH3ptvE-lkp@intel.com>
References: <20261015-vsprintf_kallsym-v3-1-c175c27f38b7@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-vsprintf_kallsym-v3-1-c175c27f38b7@linutronix.de>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ec8bf8280261294a9b9b4520414b42704c7f9f6b]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Andrzej-Siewior/vsprintf-Don-t-leak-pointers-for-ps-without-KALLSYMS-enabled/20261015-180648
base:   ec8bf8280261294a9b9b4520414b42704c7f9f6b
patch link:    https://lore.kernel.org/r/20261015-vsprintf_kallsym-v3-1-c175c27f38b7%40linutronix.de
patch subject: [PATCH v3 1/2] vsprintf: Don't leak pointers for %ps without KALLSYMS enabled
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20261016/202610161107.ckH3ptvE-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161107.ckH3ptvE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161107.ckH3ptvE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/vsprintf.c: In function 'symbol_string':
>> lib/vsprintf.c:988:23: warning: variable 'value' set but not used [-Wunused-but-set-variable=]
     988 |         unsigned long value;
         |                       ^~~~~


vim +/value +988 lib/vsprintf.c

1031bc589228ca3 Dmitry Monakhov 2015-04-13  983  
cf3b429b03e827c Joe Perches     2010-05-24  984  static noinline_for_stack
cf3b429b03e827c Joe Perches     2010-05-24  985  char *symbol_string(char *buf, char *end, void *ptr,
b0d33c2bd77bcf2 Joe Perches     2012-12-12  986  		    struct printf_spec spec, const char *fmt)
0fe1ef24f7bd002 Linus Torvalds  2008-07-06  987  {
b0d33c2bd77bcf2 Joe Perches     2012-12-12 @988  	unsigned long value;
0fe1ef24f7bd002 Linus Torvalds  2008-07-06  989  #ifdef CONFIG_KALLSYMS
0fe1ef24f7bd002 Linus Torvalds  2008-07-06  990  	char sym[KSYM_SYMBOL_LEN];
b0d33c2bd77bcf2 Joe Perches     2012-12-12  991  #endif
b0d33c2bd77bcf2 Joe Perches     2012-12-12  992  
b0d33c2bd77bcf2 Joe Perches     2012-12-12  993  	if (fmt[1] == 'R')
b0d33c2bd77bcf2 Joe Perches     2012-12-12  994  		ptr = __builtin_extract_return_addr(ptr);
b0d33c2bd77bcf2 Joe Perches     2012-12-12  995  	value = (unsigned long)ptr;
b0d33c2bd77bcf2 Joe Perches     2012-12-12  996  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
