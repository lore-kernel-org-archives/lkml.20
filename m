Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AC457D21D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790197179; cv=none; b=cZocss56AvLy7eDX0urxqE/d8AKQefBGxLnaz6kfmeWtGXN39pqG4XevPxYLgUgKcypUg0GFu3cl6XT5ZIZqQb4mVlf8Y2YvPHuUbhTnyd3tn/YiF0sJ+m7dOykqEt20lYN0pd2u35fPb81+c7kdgjMmxJ9m3NYTqiB5QXFv9D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790197179; c=relaxed/simple;
	bh=Vaf95jC8xWvp09f4oUdupmMNE65BFZ9EkwxhEWMfN8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UshanEr0LZpFmLZb6epkkrWnQMIxJy9FsWbSd9We1JrRkz2Pj0rYkZjE4MhVvoG08kkvR3ZgFcSCckW0i1kRBQ0ZytTI1RffK9pJVU5ZCPcisIeCDkZ4zzO2AIdNDI1EY6n18ZumX8GQvsRZ5hk5SFtjMu4CnlOKTvV3a663854=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGkmRku8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGkmRku8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790197177; x=1821733177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Vaf95jC8xWvp09f4oUdupmMNE65BFZ9EkwxhEWMfN8Q=;
  b=oGkmRku8unYgzHBOHF/HWIFuiehoFwCm0fWXIYVIz9D3cj+oh+ozO2rr
   RlYmRw+T0uFkT0i4w3sQ6bxhObj0hzakAPk2O1HpvmsYgn8I3iavfqEXE
   EAHOHwWgzs4ovBrK4mWsGs0pHc7ZcoHA7SnR3jvUe440gSyWs7K+COjei
   dlmqZeiqdnomNlhsKThF+5xNRgpENcDxrNz3V1wdmRoRh/HwWdzg5QG+U
   e9LAJvKsoozK9z0N6FwRa95fshRwYBymRWdP1iLC7R7k3tcFSRZlg468S
   wra68boHHAhnwZUZTVjgO2345Kvnn4PXCEMqOLbyAvYA/X2U2oBB2sA45
   A==;
X-CSE-ConnectionGUID: clxPsRfZTg27oDhdgufSSw==
X-CSE-MsgGUID: joOYlfPYR/e3RQ7CCoXzOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101517870"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="101517870"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 13:59:34 -0700
X-CSE-ConnectionGUID: /iR8RbswS6uJMxeD3LhHIg==
X-CSE-MsgGUID: I4h2gX63Rsap9UozagoS0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4867261"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 23 Sep 2026 13:59:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9U3t-00000000HjO-3Iyg;
	Wed, 23 Sep 2026 20:59:29 +0000
Date: Thu, 24 Sep 2026 04:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?5p6X5r+s5ZOy?= <m18667909625@163.com>,
	Petr Mladek <pmladek@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org, m18667909625@163.com
Subject: Re: [PATCH] printk: fold consecutive duplicate messages
Message-ID: <202609240431.W97eMUgr-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.3-rc4 next-20260922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/printk-fold-consecutive-duplicate-messages/20260921-130304
base:   linus/master
patch link:    https://lore.kernel.org/r/20260921050304.73440-1-m18667909625%40163.com
patch subject: [PATCH] printk: fold consecutive duplicate messages
config: arc-randconfig-1000-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240431.W97eMUgr-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240431.W97eMUgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240431.W97eMUgr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/printk.c:134:13: warning: 'outputs_dedupe' defined but not used [-Wunused-function]
     134 | static bool outputs_dedupe(int facility, int level, const char *fmt)
         |             ^~~~~~~~~~~~~~


vim +/outputs_dedupe +134 kernel/printk/printk.c

   124	
   125	/*
   126	 * Detect consecutive duplicate printk messages and fold them away.
   127	 * Returns true if this message should be dropped.
   128	 *
   129	 * The dedup key is built from facility, level and the format string.
   130	 * Format parameters are intentionally not part of the key: va_list
   131	 * can only be consumed once, and hashing rendered text would put
   132	 * string comparisons on the printk fast path.
   133	 */
 > 134	static bool outputs_dedupe(int facility, int level, const char *fmt)
   135	{
   136		unsigned long flags;
   137		bool drop;
   138		u64 now;
   139		u32 key;
   140		u32 n;
   141	
   142		/* error and above must never be folded */
   143		if (level <= LOGLEVEL_ERR || !printk_dedup)
   144			return false;
   145	
   146		key = hash_64((unsigned long)(fmt ? : ""), 32) ^
   147		      hash_32(facility ^ level, 32);
   148		now = ktime_get_ns();
   149	
   150		raw_spin_lock_irqsave(&dedup_lock, flags);
   151	
   152		if (dedup_active && key == dedup_last_key) {
   153			dedup_repeat++;
   154			/*
   155			 * Force a flush when 10 repeats have accumulated or
   156			 * the 1s window has elapsed, so the summary shows up.
   157			 */
   158			if (dedup_repeat >= 10 ||
   159			    now - dedup_window_start > PRINTK_DEDUP_WINDOW_NS) {
   160				n = dedup_repeat;
   161				dedup_repeat = 0;
   162				dedup_window_start = now;
   163				drop = false;
   164			} else {
   165				drop = true;
   166			}
   167		} else {
   168			if (dedup_active && dedup_repeat) {
   169				n = dedup_repeat;
   170				drop = false;
   171			} else {
   172				n = 0;
   173				drop = false;
   174			}
   175			dedup_last_key = key;
   176			dedup_repeat = 0;
   177			dedup_window_start = now;
   178			dedup_active = true;
   179		}
   180	
   181		raw_spin_unlock_irqrestore(&dedup_lock, flags);
   182	
   183		/*
   184		 * Print only after dropping the lock: pr_info() re-enters
   185		 * vprintk_emit() and would deadlock on dedup_lock otherwise.
   186		 */
   187		if (n)
   188			pr_info("last message repeated %u times\n", n);
   189	
   190		return drop;
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
