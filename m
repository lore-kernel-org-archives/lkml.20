Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7CA470EA7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338984; cv=none; b=FvDLGLH7aF1P0A+Y92ogztWtfJE3rJlqmKvL6+thpVYrZs7Pg5eXYHpiKhwj7JfmNNstKI3A6VLSBQSsXGr2TwdJ2vk2+KsZx03WsyLj46t3nXGSpe33IjG4KE/qAKalTR/lVyVYRoQCDrq7iYugzderWGCmpI3XxaNl2kOL/4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338984; c=relaxed/simple;
	bh=coP9a8fQeisU6u7ynfg1ML4FLTJj9TRCUaOUZnaLK+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z9j2Izt4iB/0lU/7r7DH0gGF7ibeyhgCIeXgcHQnuwZcFzl6/X9ZJH9WGQaK65roze6WMk6hZRGSW960UECO5vjv+ey6RtTB2X8nmBYazqFueUCB+zdlmqIzKxASYWj88zxeCLaa+hnjyl0LP6ly70lujXNS8LYR7DplSRp/BNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CB+RRC09; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CB+RRC09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790338983; x=1821874983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=coP9a8fQeisU6u7ynfg1ML4FLTJj9TRCUaOUZnaLK+A=;
  b=CB+RRC09t3tghXOQt+w/L1DS5Q1/mjpeoMdLL5m5YoQA7pPsPZMpDBQW
   pBGr8He43ebCQZ5zVQUgPNyqB9s8+xZv3D3MmpeQjkYtFH0/hDbQhsKIp
   DUB+mD+h0v9w4kZx8VuYPmDShJze4UT3MtDlG0MbS7tNy4m8r31CW22n6
   UPbOyvOJF5auTPutM7HPP52MP81Wt0+uwWLFubkIj87skRlMHzBVh2MYY
   mS4kPplOx9+bPbJ63ukBjbSJzjE/ufE5dB54HXNarqx058RUj+6XwbFL2
   Rvsq5BlEevwcqT8GH180bSS5srwkbwSmqOFKkRIEhqj7eCgVry0NV8Amj
   w==;
X-CSE-ConnectionGUID: xz6XnLU+SfKqzZ8PZ80yfA==
X-CSE-MsgGUID: baRiy18eQMuqI0ky2ZfO5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90341953"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="90341953"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 05:23:03 -0700
X-CSE-ConnectionGUID: aoM9QgoQRfmn6A0SmRm5qA==
X-CSE-MsgGUID: atzN7wkESbGSF+Al7YGOlw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Sep 2026 05:23:00 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA4x7-00000000Kao-3MPG;
	Fri, 25 Sep 2026 12:22:57 +0000
Date: Fri, 25 Sep 2026 20:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?5p6X5r+s5ZOy?= <m18667909625@163.com>,
	Petr Mladek <pmladek@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, m18667909625@163.com
Subject: Re: [PATCH] printk: fold consecutive duplicate messages
Message-ID: <202609252036.olZsAkQ4-lkp@intel.com>
References: <20260921050304.73440-1-m18667909625@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260921050304.73440-1-m18667909625@163.com>

Hi 林濬哲,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.3-rc4 next-20260923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/printk-fold-consecutive-duplicate-messages/20260921-130304
base:   linus/master
patch link:    https://lore.kernel.org/r/20260921050304.73440-1-m18667909625%40163.com
patch subject: [PATCH] printk: fold consecutive duplicate messages
config: x86_64-randconfig-1011-20260925 (https://download.01.org/0day-ci/archive/20260925/202609252036.olZsAkQ4-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252036.olZsAkQ4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252036.olZsAkQ4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: vprintk_emit(): unexpected end of section .text.vprintk_emit

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
