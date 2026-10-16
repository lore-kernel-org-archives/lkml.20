Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA576369208
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792126492; cv=none; b=XCfT2E8pCQJHWYG8JcP8khuKNeoUZh4KXOGkKTPUTtv7/4J3Apr/RdTcHDPk+EFkiMWHKFqrqZzaVZMloLYOpxthSuI55rnvhDu8f4Ey/1PB0fiwpOJWDn3LlhhToF6iZsaV5MHxUM5Ux1REbbxsaTslfQEfGWPVkwotJ1qhh5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792126492; c=relaxed/simple;
	bh=vMokfa1+hvgywCpz3ofj3oYp/nbYqpRWvALkC8ki2hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/AkG0zfWqnmGjjwncxG0mp+1n/z/OIhcJTkU1UU9PO3pb7/+G5PSnIQrIMO+wshT4iHCxLDV5kMYT/pg0BcbU+557CuhkHt1mBd/I6eDgJQ9Jv1V0anglO8XDL9wFgLa0VBD4En1syfmjeSmV3GMJrcX0CsoIrVWVaD3ilwPOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVaaiXQ6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVaaiXQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792126491; x=1823662491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vMokfa1+hvgywCpz3ofj3oYp/nbYqpRWvALkC8ki2hY=;
  b=LVaaiXQ6Ok63teiWoK89dyz6Tl5OPgTmjRHI2+UMqAR48ZeYMfypeoZR
   A/EBtGNi1cgEwYf/FkN8aGlbl7JJyLO8MVav41RJf0H60TjhbKEdAhHvE
   URheyWQ6CLGT1LcqxOvExV6Mm+O3uGjM7bw0ipNsdL2AWI3pdfW8MkxRK
   stId/yioIXnbhv1aHwQyUhzlZ60gth0Z939Y1HdpeZk5I80LOAyidIh7N
   JKXiXzlSQNGt5QXe3O2D8AsVElmk9gQIQdpTAaeSG6U3lxCbAmZSyFHmF
   0pQ2uR5sjv0lkhOD0nKQ86dvo6bkAzRrNIP2wskYczSNOVEpvxNKFcNJt
   w==;
X-CSE-ConnectionGUID: TC8XFTGFT0Spv5Cpv6c8uA==
X-CSE-MsgGUID: SoVq2R6lQE2wkIVRowRn7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="918822"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="918822"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 21:54:50 -0700
X-CSE-ConnectionGUID: REJ6z22YRraItSUsrmmjZQ==
X-CSE-MsgGUID: F81ihg6QT2itneTire3loQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1843240"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2026 21:54:47 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHZxs-00000000Hcs-078R;
	Fri, 16 Oct 2026 04:54:44 +0000
Date: Fri, 16 Oct 2026 12:54:18 +0800
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
	Tycho Andersen <tycho@tycho.pizza>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v3 2/2] kallsyms: Don't leak pointers for unresolved
 symbols
Message-ID: <202610161209.43Dqkd4l-lkp@intel.com>
References: <20261015-vsprintf_kallsym-v3-2-c175c27f38b7@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-vsprintf_kallsym-v3-2-c175c27f38b7@linutronix.de>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ec8bf8280261294a9b9b4520414b42704c7f9f6b]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Andrzej-Siewior/vsprintf-Don-t-leak-pointers-for-ps-without-KALLSYMS-enabled/20261015-180648
base:   ec8bf8280261294a9b9b4520414b42704c7f9f6b
patch link:    https://lore.kernel.org/r/20261015-vsprintf_kallsym-v3-2-c175c27f38b7%40linutronix.de
patch subject: [PATCH v3 2/2] kallsyms: Don't leak pointers for unresolved symbols
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20261016/202610161209.43Dqkd4l-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161209.43Dqkd4l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161209.43Dqkd4l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/vsprintf.c:863 function parameter 'len' not described in 'snprintf_default_pointer'
>> Warning: lib/vsprintf.c:863 Excess function parameter 'size' description in 'snprintf_default_pointer'
>> Warning: lib/vsprintf.c:863 function parameter 'len' not described in 'snprintf_default_pointer'
>> Warning: lib/vsprintf.c:863 Excess function parameter 'size' description in 'snprintf_default_pointer'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
